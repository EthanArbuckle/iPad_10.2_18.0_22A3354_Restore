@implementation HDCodableWorkout

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (void)setType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_type = a3;
}

- (void)setDuration:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setTotalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_totalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_totalBasalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setTotalDistanceInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_totalDistanceInCanonicalUnit = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_sample)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteInt64Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_events;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_14:
      if ((has & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_33;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 4) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 2) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt64Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_17:
    if ((has & 8) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_20:
    PBDataWriterWriteDoubleField();
LABEL_21:
  if (self->_primaryActivity)
    PBDataWriterWriteSubmessage();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_subActivities;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subActivities, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_primaryActivity, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
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
  void *v54;
  int64_t goalType;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[HDCodableWorkout sample](self, "sample"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "applyToObject:", v4),
        v5,
        v6)
    && _HKWorkoutActivityTypeIsValid())
  {
    objc_msgSend(v4, "_setWorkoutActivityType:", self->_type);
    objc_msgSend(v4, "_setDuration:", self->_duration);
    if (-[NSMutableArray count](self->_events, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v8 = self->_events;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v64 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(MEMORY[0x1E0CB6E50], "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v7, "addObject:", v13);

          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        }
        while (v10);
      }

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "_setWorkoutEvents:", v7);

    objc_msgSend(MEMORY[0x1E0CB6DD8], "createWithCodable:", self->_primaryActivity);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v4, "workoutActivityType");
      objc_msgSend(v4, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _HKWorkoutConfigurationWithActivityTypeAndMetadata();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_alloc(MEMORY[0x1E0CB6DD8]);
      objc_msgSend(v4, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "workoutEvents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "duration");
      v16 = (void *)objc_msgSend(v19, "_initWithUUID:workoutConfiguration:startDate:endDate:workoutEvents:startsPaused:duration:metadata:statisticsPerType:", v20, v18, v21, v22, v23, 0, 0, 0);

    }
    objc_msgSend(v4, "_setPrimaryActivity:", v16);
    if (-[NSMutableArray count](self->_subActivities, "count"))
    {
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v25 = self->_subActivities;
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v64 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(MEMORY[0x1E0CB6DD8], "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
              objc_msgSend(v24, "addObject:", v30);

          }
          v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        }
        while (v27);
      }

    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v4, "_setSubActivities:", v24);

    objc_msgSend(v4, "workoutEvents");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      objc_msgSend(v4, "_subActivities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v60;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v60 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
            objc_msgSend(v4, "workoutEvents");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "_filterAndSetWorkoutEvents:", v39);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v35);
      }

    }
    if (-[HDCodableWorkout hasTotalEnergyBurnedInCanonicalUnit](self, "hasTotalEnergyBurnedInCanonicalUnit"))
    {
      if ((*(_WORD *)&self->_has & 0x20) != 0)
      {
        v41 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalEnergyBurnedUnit();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "quantityWithUnit:doubleValue:", v42, self->_totalEnergyBurnedInCanonicalUnit);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v40 = 0;
      }
      objc_msgSend(v4, "_setTotalEnergyBurned:", v40);

    }
    if (-[HDCodableWorkout hasTotalBasalEnergyBurnedInCanonicalUnit](self, "hasTotalBasalEnergyBurnedInCanonicalUnit"))
    {
      if ((*(_WORD *)&self->_has & 8) != 0)
      {
        v44 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalEnergyBurnedUnit();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "quantityWithUnit:doubleValue:", v45, self->_totalBasalEnergyBurnedInCanonicalUnit);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v43 = 0;
      }
      objc_msgSend(v4, "_setTotalBasalEnergyBurned:", v43);

    }
    if (-[HDCodableWorkout hasTotalDistanceInCanonicalUnit](self, "hasTotalDistanceInCanonicalUnit"))
    {
      if ((*(_WORD *)&self->_has & 0x10) != 0)
      {
        v47 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalDistanceUnit();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "quantityWithUnit:doubleValue:", v48, self->_totalDistanceInCanonicalUnit);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v46 = 0;
      }
      objc_msgSend(v4, "_setTotalDistance:", v46);

    }
    if (-[HDCodableWorkout hasTotalSwimmingStrokeCountInCanonicalUnit](self, "hasTotalSwimmingStrokeCountInCanonicalUnit"))
    {
      if ((*(_WORD *)&self->_has & 0x80) != 0)
      {
        v50 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalSwimmingStrokeCountUnit();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "quantityWithUnit:doubleValue:", v51, self->_totalSwimmingStrokeCountInCanonicalUnit);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v49 = 0;
      }
      objc_msgSend(v4, "_setTotalSwimmingStrokeCount:", v49);

    }
    if (-[HDCodableWorkout hasTotalFlightsClimbedInCanonicalUnit](self, "hasTotalFlightsClimbedInCanonicalUnit"))
    {
      if ((*(_WORD *)&self->_has & 0x40) != 0)
      {
        v53 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalFlightsClimbedUnit();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "quantityWithUnit:doubleValue:", v54, self->_totalFlightsClimbedInCanonicalUnit);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v52 = 0;
      }
      objc_msgSend(v4, "_setTotalFlightsClimbed:", v52);

    }
    if (-[HDCodableWorkout hasGoalType](self, "hasGoalType"))
    {
      if ((*(_WORD *)&self->_has & 4) != 0)
        goalType = self->_goalType;
      else
        goalType = 0;
      objc_msgSend(v4, "_setGoalType:", goalType);
    }
    if (-[HDCodableWorkout hasGoal](self, "hasGoal"))
    {
      if ((~*(_WORD *)&self->_has & 6) != 0)
      {
        v58 = 0;
      }
      else
      {
        v56 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalUnitForGoalType();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "quantityWithUnit:doubleValue:", v57, self->_goal);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v4, "_setGoal:", v58);

    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearEvents
{
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)addEvents:(id)a3
{
  id v4;
  NSMutableArray *events;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  events = self->_events;
  v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_events;
    self->_events = v6;

    v4 = v8;
    events = self->_events;
  }
  -[NSMutableArray addObject:](events, "addObject:", v4);

}

- (unint64_t)eventsCount
{
  return -[NSMutableArray count](self->_events, "count");
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", a3);
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (void)setHasDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTotalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTotalDistanceInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGoalType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_goalType = a3;
}

- (void)setHasGoalType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGoalType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setGoal:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_goal = a3;
}

- (void)setHasGoal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGoal
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTotalBasalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTotalSwimmingStrokeCountInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_totalSwimmingStrokeCountInCanonicalUnit = a3;
}

- (void)setHasTotalSwimmingStrokeCountInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTotalSwimmingStrokeCountInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTotalFlightsClimbedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_totalFlightsClimbedInCanonicalUnit = a3;
}

- (void)setHasTotalFlightsClimbedInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTotalFlightsClimbedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasPrimaryActivity
{
  return self->_primaryActivity != 0;
}

- (void)clearSubActivities
{
  -[NSMutableArray removeAllObjects](self->_subActivities, "removeAllObjects");
}

- (void)addSubActivities:(id)a3
{
  id v4;
  NSMutableArray *subActivities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subActivities = self->_subActivities;
  v8 = v4;
  if (!subActivities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_subActivities;
    self->_subActivities = v6;

    v4 = v8;
    subActivities = self->_subActivities;
  }
  -[NSMutableArray addObject:](subActivities, "addObject:", v4);

}

- (unint64_t)subActivitiesCount
{
  return -[NSMutableArray count](self->_subActivities, "count");
}

- (id)subActivitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subActivities, "objectAtIndex:", a3);
}

+ (Class)subActivitiesType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HDCodableWorkout;
  -[HDCodableWorkout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkout dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int16 has;
  void *v15;
  HDCodableWorkoutActivity *primaryActivity;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

  }
  if (-[NSMutableArray count](self->_events, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = self->_events;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("events"));
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("duration"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_16:
      if ((has & 0x10) == 0)
        goto LABEL_17;
      goto LABEL_37;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalEnergyBurnedInCanonicalUnit);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("totalEnergyBurnedInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_17:
    if ((has & 4) == 0)
      goto LABEL_18;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalDistanceInCanonicalUnit);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("totalDistanceInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 2) == 0)
      goto LABEL_19;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_goalType);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("goalType"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 8) == 0)
      goto LABEL_20;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_goal);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("goal"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalBasalEnergyBurnedInCanonicalUnit);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("totalBasalEnergyBurnedInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_21:
    if ((has & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalSwimmingStrokeCountInCanonicalUnit);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("totalSwimmingStrokeCountInCanonicalUnit"));

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalFlightsClimbedInCanonicalUnit);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("totalFlightsClimbedInCanonicalUnit"));

  }
LABEL_23:
  primaryActivity = self->_primaryActivity;
  if (primaryActivity)
  {
    -[HDCodableWorkoutActivity dictionaryRepresentation](primaryActivity, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("primaryActivity"));

  }
  if (-[NSMutableArray count](self->_subActivities, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_subActivities, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = self->_subActivities;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v33);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("subActivities"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  __int16 has;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v14;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_QWORD *)v4 + 9) = self->_type;
    *((_WORD *)v4 + 56) |= 0x100u;
  }
  if (-[HDCodableWorkout eventsCount](self, "eventsCount"))
  {
    objc_msgSend(v14, "clearEvents");
    v5 = -[HDCodableWorkout eventsCount](self, "eventsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HDCodableWorkout eventsAtIndex:](self, "eventsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addEvents:", v8);

      }
    }
  }
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v14 + 1) = *(_QWORD *)&self->_duration;
    *((_WORD *)v14 + 56) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_27;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v14 + 6) = *(_QWORD *)&self->_totalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v14 + 56) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)v14 + 5) = *(_QWORD *)&self->_totalDistanceInCanonicalUnit;
  *((_WORD *)v14 + 56) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)v14 + 3) = self->_goalType;
  *((_WORD *)v14 + 56) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)v14 + 2) = *(_QWORD *)&self->_goal;
  *((_WORD *)v14 + 56) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v14 + 4) = *(_QWORD *)&self->_totalBasalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v14 + 56) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_31:
  *((_QWORD *)v14 + 8) = *(_QWORD *)&self->_totalSwimmingStrokeCountInCanonicalUnit;
  *((_WORD *)v14 + 56) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    *((_QWORD *)v14 + 7) = *(_QWORD *)&self->_totalFlightsClimbedInCanonicalUnit;
    *((_WORD *)v14 + 56) |= 0x40u;
  }
LABEL_18:
  if (self->_primaryActivity)
    objc_msgSend(v14, "setPrimaryActivity:");
  if (-[HDCodableWorkout subActivitiesCount](self, "subActivitiesCount"))
  {
    objc_msgSend(v14, "clearSubActivities");
    v10 = -[HDCodableWorkout subActivitiesCount](self, "subActivitiesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[HDCodableWorkout subActivitiesAtIndex:](self, "subActivitiesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubActivities:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int16 has;
  id v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v6;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_type;
    *(_WORD *)(v5 + 112) |= 0x100u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = self->_events;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEvents:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_duration;
    *(_WORD *)(v5 + 112) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_29;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_12;
  }
  *(double *)(v5 + 48) = self->_totalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 112) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 40) = self->_totalDistanceInCanonicalUnit;
  *(_WORD *)(v5 + 112) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 2) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  *(_QWORD *)(v5 + 24) = self->_goalType;
  *(_WORD *)(v5 + 112) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v5 + 16) = self->_goal;
  *(_WORD *)(v5 + 112) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_16:
    if ((has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  *(double *)(v5 + 32) = self->_totalBasalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 112) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_33:
  *(double *)(v5 + 64) = self->_totalSwimmingStrokeCountInCanonicalUnit;
  *(_WORD *)(v5 + 112) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    *(double *)(v5 + 56) = self->_totalFlightsClimbedInCanonicalUnit;
    *(_WORD *)(v5 + 112) |= 0x40u;
  }
LABEL_19:
  v15 = -[HDCodableWorkoutActivity copyWithZone:](self->_primaryActivity, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v15;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_subActivities;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addSubActivities:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  __int16 has;
  __int16 v7;
  NSMutableArray *events;
  HDCodableWorkoutActivity *primaryActivity;
  NSMutableArray *subActivities;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_56;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 12))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_56;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 56);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0 || self->_type != *((_QWORD *)v4 + 9))
      goto LABEL_56;
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_56;
  }
  events = self->_events;
  if ((unint64_t)events | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](events, "isEqual:"))
    {
LABEL_56:
      v11 = 0;
      goto LABEL_57;
    }
    has = (__int16)self->_has;
    v7 = *((_WORD *)v4 + 56);
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_duration != *((double *)v4 + 1))
      goto LABEL_56;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_totalEnergyBurnedInCanonicalUnit != *((double *)v4 + 6))
      goto LABEL_56;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_totalDistanceInCanonicalUnit != *((double *)v4 + 5))
      goto LABEL_56;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_goalType != *((_QWORD *)v4 + 3))
      goto LABEL_56;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_goal != *((double *)v4 + 2))
      goto LABEL_56;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_totalBasalEnergyBurnedInCanonicalUnit != *((double *)v4 + 4))
      goto LABEL_56;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_totalSwimmingStrokeCountInCanonicalUnit != *((double *)v4 + 8))
      goto LABEL_56;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_56;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_totalFlightsClimbedInCanonicalUnit != *((double *)v4 + 7))
      goto LABEL_56;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_56;
  }
  primaryActivity = self->_primaryActivity;
  if ((unint64_t)primaryActivity | *((_QWORD *)v4 + 11)
    && !-[HDCodableWorkoutActivity isEqual:](primaryActivity, "isEqual:"))
  {
    goto LABEL_56;
  }
  subActivities = self->_subActivities;
  if ((unint64_t)subActivities | *((_QWORD *)v4 + 13))
    v11 = -[NSMutableArray isEqual:](subActivities, "isEqual:");
  else
    v11 = 1;
LABEL_57:

  return v11;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double duration;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double totalEnergyBurnedInCanonicalUnit;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double totalDistanceInCanonicalUnit;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  double goal;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  double totalBasalEnergyBurnedInCanonicalUnit;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  double totalSwimmingStrokeCountInCanonicalUnit;
  double v32;
  long double v33;
  double v34;
  unint64_t v35;
  double totalFlightsClimbedInCanonicalUnit;
  double v37;
  long double v38;
  double v39;
  unint64_t v40;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  v44 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v43 = 2654435761 * self->_type;
  else
    v43 = 0;
  v42 = -[NSMutableArray hash](self->_events, "hash");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    duration = self->_duration;
    v6 = -duration;
    if (duration >= 0.0)
      v6 = self->_duration;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 0x20) != 0)
  {
    totalEnergyBurnedInCanonicalUnit = self->_totalEnergyBurnedInCanonicalUnit;
    v11 = -totalEnergyBurnedInCanonicalUnit;
    if (totalEnergyBurnedInCanonicalUnit >= 0.0)
      v11 = self->_totalEnergyBurnedInCanonicalUnit;
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
  if ((has & 0x10) != 0)
  {
    totalDistanceInCanonicalUnit = self->_totalDistanceInCanonicalUnit;
    v16 = -totalDistanceInCanonicalUnit;
    if (totalDistanceInCanonicalUnit >= 0.0)
      v16 = self->_totalDistanceInCanonicalUnit;
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
  if ((has & 4) != 0)
  {
    v19 = 2654435761 * self->_goalType;
    if ((has & 2) != 0)
      goto LABEL_30;
LABEL_35:
    v24 = 0;
    goto LABEL_38;
  }
  v19 = 0;
  if ((has & 2) == 0)
    goto LABEL_35;
LABEL_30:
  goal = self->_goal;
  v21 = -goal;
  if (goal >= 0.0)
    v21 = self->_goal;
  v22 = floor(v21 + 0.5);
  v23 = (v21 - v22) * 1.84467441e19;
  v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0)
      v24 += (unint64_t)v23;
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_38:
  if ((has & 8) != 0)
  {
    totalBasalEnergyBurnedInCanonicalUnit = self->_totalBasalEnergyBurnedInCanonicalUnit;
    v27 = -totalBasalEnergyBurnedInCanonicalUnit;
    if (totalBasalEnergyBurnedInCanonicalUnit >= 0.0)
      v27 = self->_totalBasalEnergyBurnedInCanonicalUnit;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  if ((has & 0x80) != 0)
  {
    totalSwimmingStrokeCountInCanonicalUnit = self->_totalSwimmingStrokeCountInCanonicalUnit;
    v32 = -totalSwimmingStrokeCountInCanonicalUnit;
    if (totalSwimmingStrokeCountInCanonicalUnit >= 0.0)
      v32 = self->_totalSwimmingStrokeCountInCanonicalUnit;
    v33 = floor(v32 + 0.5);
    v34 = (v32 - v33) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0)
        v30 += (unint64_t)v34;
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    v30 = 0;
  }
  if ((has & 0x40) != 0)
  {
    totalFlightsClimbedInCanonicalUnit = self->_totalFlightsClimbedInCanonicalUnit;
    v37 = -totalFlightsClimbedInCanonicalUnit;
    if (totalFlightsClimbedInCanonicalUnit >= 0.0)
      v37 = self->_totalFlightsClimbedInCanonicalUnit;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  v40 = v9 ^ v14 ^ v19 ^ v24 ^ v25 ^ v30 ^ v35 ^ -[HDCodableWorkoutActivity hash](self->_primaryActivity, "hash");
  return v43 ^ v44 ^ v42 ^ v4 ^ v40 ^ -[NSMutableArray hash](self->_subActivities, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int16 v12;
  HDCodableWorkoutActivity *primaryActivity;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 12);
  if (sample)
  {
    if (v6)
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableWorkout setSample:](self, "setSample:");
  }
  if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    self->_type = *((_QWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = *((id *)v4 + 10);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        -[HDCodableWorkout addEvents:](self, "addEvents:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v12 = *((_WORD *)v4 + 56);
  if ((v12 & 1) != 0)
  {
    self->_duration = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v12 = *((_WORD *)v4 + 56);
    if ((v12 & 0x20) == 0)
    {
LABEL_17:
      if ((v12 & 0x10) == 0)
        goto LABEL_18;
      goto LABEL_29;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  self->_totalEnergyBurnedInCanonicalUnit = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v12 = *((_WORD *)v4 + 56);
  if ((v12 & 0x10) == 0)
  {
LABEL_18:
    if ((v12 & 4) == 0)
      goto LABEL_19;
    goto LABEL_30;
  }
LABEL_29:
  self->_totalDistanceInCanonicalUnit = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v12 = *((_WORD *)v4 + 56);
  if ((v12 & 4) == 0)
  {
LABEL_19:
    if ((v12 & 2) == 0)
      goto LABEL_20;
    goto LABEL_31;
  }
LABEL_30:
  self->_goalType = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v12 = *((_WORD *)v4 + 56);
  if ((v12 & 2) == 0)
  {
LABEL_20:
    if ((v12 & 8) == 0)
      goto LABEL_21;
    goto LABEL_32;
  }
LABEL_31:
  self->_goal = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v12 = *((_WORD *)v4 + 56);
  if ((v12 & 8) == 0)
  {
LABEL_21:
    if ((v12 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_33;
  }
LABEL_32:
  self->_totalBasalEnergyBurnedInCanonicalUnit = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v12 = *((_WORD *)v4 + 56);
  if ((v12 & 0x80) == 0)
  {
LABEL_22:
    if ((v12 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_33:
  self->_totalSwimmingStrokeCountInCanonicalUnit = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 56) & 0x40) != 0)
  {
LABEL_23:
    self->_totalFlightsClimbedInCanonicalUnit = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_24:
  primaryActivity = self->_primaryActivity;
  v14 = *((_QWORD *)v4 + 11);
  if (primaryActivity)
  {
    if (v14)
      -[HDCodableWorkoutActivity mergeFrom:](primaryActivity, "mergeFrom:");
  }
  else if (v14)
  {
    -[HDCodableWorkout setPrimaryActivity:](self, "setPrimaryActivity:");
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v4 + 13);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[HDCodableWorkout addSubActivities:](self, "addSubActivities:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (int64_t)type
{
  return self->_type;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (double)duration
{
  return self->_duration;
}

- (double)totalEnergyBurnedInCanonicalUnit
{
  return self->_totalEnergyBurnedInCanonicalUnit;
}

- (double)totalDistanceInCanonicalUnit
{
  return self->_totalDistanceInCanonicalUnit;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (double)goal
{
  return self->_goal;
}

- (double)totalBasalEnergyBurnedInCanonicalUnit
{
  return self->_totalBasalEnergyBurnedInCanonicalUnit;
}

- (double)totalSwimmingStrokeCountInCanonicalUnit
{
  return self->_totalSwimmingStrokeCountInCanonicalUnit;
}

- (double)totalFlightsClimbedInCanonicalUnit
{
  return self->_totalFlightsClimbedInCanonicalUnit;
}

- (HDCodableWorkoutActivity)primaryActivity
{
  return self->_primaryActivity;
}

- (void)setPrimaryActivity:(id)a3
{
  objc_storeStrong((id *)&self->_primaryActivity, a3);
}

- (NSMutableArray)subActivities
{
  return self->_subActivities;
}

- (void)setSubActivities:(id)a3
{
  objc_storeStrong((id *)&self->_subActivities, a3);
}

@end
