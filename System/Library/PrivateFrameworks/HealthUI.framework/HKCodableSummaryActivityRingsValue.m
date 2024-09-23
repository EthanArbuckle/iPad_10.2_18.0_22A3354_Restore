@implementation HKCodableSummaryActivityRingsValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleStandHoursGoal, 0);
  objc_storeStrong((id *)&self->_appleStandHours, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeGoal, 0);
  objc_storeStrong((id *)&self->_appleMoveTime, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeGoal, 0);
  objc_storeStrong((id *)&self->_appleExerciseTime, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurnedGoal, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurned, 0);
}

- (BOOL)hasAppleStandHoursGoal
{
  return self->_appleStandHoursGoal != 0;
}

- (void)setAppleStandHours:(id)a3
{
  objc_storeStrong((id *)&self->_appleStandHours, a3);
}

- (void)setAppleMoveTimeGoal:(id)a3
{
  objc_storeStrong((id *)&self->_appleMoveTimeGoal, a3);
}

- (void)setAppleMoveTime:(id)a3
{
  objc_storeStrong((id *)&self->_appleMoveTime, a3);
}

- (void)setAppleExerciseTime:(id)a3
{
  objc_storeStrong((id *)&self->_appleExerciseTime, a3);
}

- (void)setActiveEnergyBurnedGoal:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnergyBurnedGoal, a3);
}

- (void)setActiveEnergyBurned:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnergyBurned, a3);
}

- (double)dateData
{
  return self->_dateData;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_startDate = a3;
}

- (void)setHasEverHadAWatch:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_hasEverHadAWatch = a3;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_endDate = a3;
}

- (void)setDateData:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_dateData = a3;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_creationDate = a3;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activityMoveMode = a3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryActivityRingsValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (HKCodableQuantity)appleStandHours
{
  return self->_appleStandHours;
}

- (HKCodableQuantity)appleMoveTime
{
  return self->_appleMoveTime;
}

- (HKCodableQuantity)appleMoveTimeGoal
{
  return self->_appleMoveTimeGoal;
}

- (HKCodableQuantity)appleExerciseTime
{
  return self->_appleExerciseTime;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (HKCodableQuantity)activeEnergyBurned
{
  return self->_activeEnergyBurned;
}

- (HKCodableQuantity)activeEnergyBurnedGoal
{
  return self->_activeEnergyBurnedGoal;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasCreationDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasActivityMoveMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAppleStandHours
{
  return self->_appleStandHours != 0;
}

- (BOOL)hasAppleMoveTime
{
  return self->_appleMoveTime != 0;
}

- (BOOL)hasAppleMoveTimeGoal
{
  return self->_appleMoveTimeGoal != 0;
}

- (BOOL)hasAppleExerciseTime
{
  return self->_appleExerciseTime != 0;
}

- (BOOL)hasAppleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal != 0;
}

- (BOOL)hasActiveEnergyBurned
{
  return self->_activeEnergyBurned != 0;
}

- (BOOL)hasActiveEnergyBurnedGoal
{
  return self->_activeEnergyBurnedGoal != 0;
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_activeEnergyBurned)
    PBDataWriterWriteSubmessage();
  if (self->_activeEnergyBurnedGoal)
    PBDataWriterWriteSubmessage();
  if (self->_appleMoveTime)
    PBDataWriterWriteSubmessage();
  if (self->_appleMoveTimeGoal)
    PBDataWriterWriteSubmessage();
  if (self->_appleExerciseTime)
    PBDataWriterWriteSubmessage();
  if (self->_appleExerciseTimeGoal)
    PBDataWriterWriteSubmessage();
  if (self->_appleStandHours)
    PBDataWriterWriteSubmessage();
  if (self->_appleStandHoursGoal)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    v5 = (char)self->_has;
    if ((v5 & 0x10) == 0)
    {
LABEL_23:
      if ((v5 & 4) == 0)
        goto LABEL_24;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteDoubleField();
  v5 = (char)self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_24:
    if ((v5 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v5 = (char)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_25:
    if ((v5 & 0x80) == 0)
      goto LABEL_26;
LABEL_33:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  v5 = (char)self->_has;
  if (v5 < 0)
    goto LABEL_33;
LABEL_26:
  if ((v5 & 2) != 0)
LABEL_27:
    PBDataWriterWriteDoubleField();
LABEL_28:

}

- (void)setHasDateData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDateData
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasActivityMoveMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setHasHasEverHadAWatch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasHasEverHadAWatch
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPaused:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_paused = a3;
}

- (void)setHasPaused:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasPaused
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setActivityResumeDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_activityResumeDate = a3;
}

- (void)setHasActivityResumeDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActivityResumeDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryActivityRingsValue;
  -[HKCodableSummaryActivityRingsValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryActivityRingsValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  HKCodableQuantity *activeEnergyBurned;
  void *v8;
  HKCodableQuantity *activeEnergyBurnedGoal;
  void *v10;
  HKCodableQuantity *appleMoveTime;
  void *v12;
  HKCodableQuantity *appleMoveTimeGoal;
  void *v14;
  HKCodableQuantity *appleExerciseTime;
  void *v16;
  HKCodableQuantity *appleExerciseTimeGoal;
  void *v18;
  HKCodableQuantity *appleStandHours;
  void *v20;
  HKCodableQuantity *appleStandHoursGoal;
  void *v22;
  char v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateData);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("dateData"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_activityMoveMode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("activityMoveMode"));

  }
  activeEnergyBurned = self->_activeEnergyBurned;
  if (activeEnergyBurned)
  {
    -[HKCodableQuantity dictionaryRepresentation](activeEnergyBurned, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("activeEnergyBurned"));

  }
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if (activeEnergyBurnedGoal)
  {
    -[HKCodableQuantity dictionaryRepresentation](activeEnergyBurnedGoal, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("activeEnergyBurnedGoal"));

  }
  appleMoveTime = self->_appleMoveTime;
  if (appleMoveTime)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleMoveTime, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("appleMoveTime"));

  }
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if (appleMoveTimeGoal)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleMoveTimeGoal, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("appleMoveTimeGoal"));

  }
  appleExerciseTime = self->_appleExerciseTime;
  if (appleExerciseTime)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleExerciseTime, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("appleExerciseTime"));

  }
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if (appleExerciseTimeGoal)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleExerciseTimeGoal, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("appleExerciseTimeGoal"));

  }
  appleStandHours = self->_appleStandHours;
  if (appleStandHours)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleStandHours, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("appleStandHours"));

  }
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if (appleStandHoursGoal)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleStandHoursGoal, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("appleStandHoursGoal"));

  }
  v23 = (char)self->_has;
  if ((v23 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("startDate"));

    v23 = (char)self->_has;
    if ((v23 & 0x10) == 0)
    {
LABEL_23:
      if ((v23 & 4) == 0)
        goto LABEL_24;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("endDate"));

  v23 = (char)self->_has;
  if ((v23 & 4) == 0)
  {
LABEL_24:
    if ((v23 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("creationDate"));

  v23 = (char)self->_has;
  if ((v23 & 0x40) == 0)
  {
LABEL_25:
    if ((v23 & 0x80) == 0)
      goto LABEL_26;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_paused);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("paused"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_27;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasEverHadAWatch);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("hasEverHadAWatch"));

  v23 = (char)self->_has;
  if (v23 < 0)
    goto LABEL_33;
LABEL_26:
  if ((v23 & 2) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_activityResumeDate);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("activityResumeDate"));

  }
  return v3;
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(_QWORD *)&self->_dateData;
    *((_BYTE *)v4 + 124) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[1] = self->_activityMoveMode;
    *((_BYTE *)v4 + 124) |= 1u;
  }
  v7 = v4;
  if (self->_activeEnergyBurned)
  {
    objc_msgSend(v4, "setActiveEnergyBurned:");
    v4 = v7;
  }
  if (self->_activeEnergyBurnedGoal)
  {
    objc_msgSend(v7, "setActiveEnergyBurnedGoal:");
    v4 = v7;
  }
  if (self->_appleMoveTime)
  {
    objc_msgSend(v7, "setAppleMoveTime:");
    v4 = v7;
  }
  if (self->_appleMoveTimeGoal)
  {
    objc_msgSend(v7, "setAppleMoveTimeGoal:");
    v4 = v7;
  }
  if (self->_appleExerciseTime)
  {
    objc_msgSend(v7, "setAppleExerciseTime:");
    v4 = v7;
  }
  if (self->_appleExerciseTimeGoal)
  {
    objc_msgSend(v7, "setAppleExerciseTimeGoal:");
    v4 = v7;
  }
  if (self->_appleStandHours)
  {
    objc_msgSend(v7, "setAppleStandHours:");
    v4 = v7;
  }
  if (self->_appleStandHoursGoal)
  {
    objc_msgSend(v7, "setAppleStandHoursGoal:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    v4[6] = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 124) |= 0x20u;
    v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_23:
      if ((v6 & 4) == 0)
        goto LABEL_24;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  v4[5] = *(_QWORD *)&self->_endDate;
  *((_BYTE *)v4 + 124) |= 0x10u;
  v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_24:
    if ((v6 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_32;
  }
LABEL_31:
  v4[3] = *(_QWORD *)&self->_creationDate;
  *((_BYTE *)v4 + 124) |= 4u;
  v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_25:
    if ((v6 & 0x80) == 0)
      goto LABEL_26;
LABEL_33:
    *((_BYTE *)v4 + 121) = self->_paused;
    *((_BYTE *)v4 + 124) |= 0x80u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_32:
  *((_BYTE *)v4 + 120) = self->_hasEverHadAWatch;
  *((_BYTE *)v4 + 124) |= 0x40u;
  v6 = (char)self->_has;
  if (v6 < 0)
    goto LABEL_33;
LABEL_26:
  if ((v6 & 2) != 0)
  {
LABEL_27:
    v4[2] = *(_QWORD *)&self->_activityResumeDate;
    *((_BYTE *)v4 + 124) |= 2u;
  }
LABEL_28:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  char v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_dateData;
    *(_BYTE *)(v5 + 124) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_activityMoveMode;
    *(_BYTE *)(v5 + 124) |= 1u;
  }
  v8 = -[HKCodableQuantity copyWithZone:](self->_activeEnergyBurned, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_activeEnergyBurnedGoal, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v10;

  v12 = -[HKCodableQuantity copyWithZone:](self->_appleMoveTime, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v12;

  v14 = -[HKCodableQuantity copyWithZone:](self->_appleMoveTimeGoal, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v14;

  v16 = -[HKCodableQuantity copyWithZone:](self->_appleExerciseTime, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v16;

  v18 = -[HKCodableQuantity copyWithZone:](self->_appleExerciseTimeGoal, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v18;

  v20 = -[HKCodableQuantity copyWithZone:](self->_appleStandHours, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v20;

  v22 = -[HKCodableQuantity copyWithZone:](self->_appleStandHoursGoal, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v22;

  v24 = (char)self->_has;
  if ((v24 & 0x20) != 0)
  {
    *(double *)(v6 + 48) = self->_startDate;
    *(_BYTE *)(v6 + 124) |= 0x20u;
    v24 = (char)self->_has;
    if ((v24 & 0x10) == 0)
    {
LABEL_7:
      if ((v24 & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v6 + 40) = self->_endDate;
  *(_BYTE *)(v6 + 124) |= 0x10u;
  v24 = (char)self->_has;
  if ((v24 & 4) == 0)
  {
LABEL_8:
    if ((v24 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  *(double *)(v6 + 24) = self->_creationDate;
  *(_BYTE *)(v6 + 124) |= 4u;
  v24 = (char)self->_has;
  if ((v24 & 0x40) == 0)
  {
LABEL_9:
    if ((v24 & 0x80) == 0)
      goto LABEL_10;
LABEL_17:
    *(_BYTE *)(v6 + 121) = self->_paused;
    *(_BYTE *)(v6 + 124) |= 0x80u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_11;
  }
LABEL_16:
  *(_BYTE *)(v6 + 120) = self->_hasEverHadAWatch;
  *(_BYTE *)(v6 + 124) |= 0x40u;
  v24 = (char)self->_has;
  if (v24 < 0)
    goto LABEL_17;
LABEL_10:
  if ((v24 & 2) != 0)
  {
LABEL_11:
    *(double *)(v6 + 16) = self->_activityResumeDate;
    *(_BYTE *)(v6 + 124) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *activeEnergyBurned;
  HKCodableQuantity *activeEnergyBurnedGoal;
  HKCodableQuantity *appleMoveTime;
  HKCodableQuantity *appleMoveTimeGoal;
  HKCodableQuantity *appleExerciseTime;
  HKCodableQuantity *appleExerciseTimeGoal;
  HKCodableQuantity *appleStandHours;
  HKCodableQuantity *appleStandHoursGoal;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_63;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 8) == 0 || self->_dateData != *((double *)v4 + 4))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 124) & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 1) == 0 || self->_activityMoveMode != *((_QWORD *)v4 + 1))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 124) & 1) != 0)
  {
    goto LABEL_63;
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  if ((unint64_t)activeEnergyBurned | *((_QWORD *)v4 + 7)
    && !-[HKCodableQuantity isEqual:](activeEnergyBurned, "isEqual:"))
  {
    goto LABEL_63;
  }
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if ((unint64_t)activeEnergyBurnedGoal | *((_QWORD *)v4 + 8))
  {
    if (!-[HKCodableQuantity isEqual:](activeEnergyBurnedGoal, "isEqual:"))
      goto LABEL_63;
  }
  appleMoveTime = self->_appleMoveTime;
  if ((unint64_t)appleMoveTime | *((_QWORD *)v4 + 11))
  {
    if (!-[HKCodableQuantity isEqual:](appleMoveTime, "isEqual:"))
      goto LABEL_63;
  }
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if ((unint64_t)appleMoveTimeGoal | *((_QWORD *)v4 + 12))
  {
    if (!-[HKCodableQuantity isEqual:](appleMoveTimeGoal, "isEqual:"))
      goto LABEL_63;
  }
  appleExerciseTime = self->_appleExerciseTime;
  if ((unint64_t)appleExerciseTime | *((_QWORD *)v4 + 9))
  {
    if (!-[HKCodableQuantity isEqual:](appleExerciseTime, "isEqual:"))
      goto LABEL_63;
  }
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if ((unint64_t)appleExerciseTimeGoal | *((_QWORD *)v4 + 10))
  {
    if (!-[HKCodableQuantity isEqual:](appleExerciseTimeGoal, "isEqual:"))
      goto LABEL_63;
  }
  appleStandHours = self->_appleStandHours;
  if ((unint64_t)appleStandHours | *((_QWORD *)v4 + 13))
  {
    if (!-[HKCodableQuantity isEqual:](appleStandHours, "isEqual:"))
      goto LABEL_63;
  }
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if ((unint64_t)appleStandHoursGoal | *((_QWORD *)v4 + 14))
  {
    if (!-[HKCodableQuantity isEqual:](appleStandHoursGoal, "isEqual:"))
      goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x20) == 0 || self->_startDate != *((double *)v4 + 6))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 124) & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x10) == 0 || self->_endDate != *((double *)v4 + 5))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 124) & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 4) == 0 || self->_creationDate != *((double *)v4 + 3))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 124) & 4) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x40) == 0)
      goto LABEL_63;
    if (self->_hasEverHadAWatch)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_63;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_63;
    }
  }
  else if ((*((_BYTE *)v4 + 124) & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 124) & 0x80) == 0)
      goto LABEL_53;
LABEL_63:
    v13 = 0;
    goto LABEL_64;
  }
  if ((*((_BYTE *)v4 + 124) & 0x80) == 0)
    goto LABEL_63;
  if (self->_paused)
  {
    if (!*((_BYTE *)v4 + 121))
      goto LABEL_63;
  }
  else if (*((_BYTE *)v4 + 121))
  {
    goto LABEL_63;
  }
LABEL_53:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 124) & 2) == 0 || self->_activityResumeDate != *((double *)v4 + 2))
      goto LABEL_63;
    v13 = 1;
  }
  else
  {
    v13 = (*((_BYTE *)v4 + 124) & 2) == 0;
  }
LABEL_64:

  return v13;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double dateData;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  double startDate;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double endDate;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  double creationDate;
  double v23;
  long double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double activityResumeDate;
  double v29;
  long double v30;
  double v31;
  unint64_t v32;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    dateData = self->_dateData;
    v6 = -dateData;
    if (dateData >= 0.0)
      v6 = self->_dateData;
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
  if ((has & 1) != 0)
    v41 = 2654435761 * self->_activityMoveMode;
  else
    v41 = 0;
  v40 = -[HKCodableQuantity hash](self->_activeEnergyBurned, "hash");
  v39 = -[HKCodableQuantity hash](self->_activeEnergyBurnedGoal, "hash");
  v38 = -[HKCodableQuantity hash](self->_appleMoveTime, "hash");
  v37 = -[HKCodableQuantity hash](self->_appleMoveTimeGoal, "hash");
  v36 = -[HKCodableQuantity hash](self->_appleExerciseTime, "hash");
  v35 = -[HKCodableQuantity hash](self->_appleExerciseTimeGoal, "hash");
  v34 = -[HKCodableQuantity hash](self->_appleStandHours, "hash");
  v9 = -[HKCodableQuantity hash](self->_appleStandHoursGoal, "hash");
  v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    startDate = self->_startDate;
    v13 = -startDate;
    if (startDate >= 0.0)
      v13 = self->_startDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((v10 & 0x10) != 0)
  {
    endDate = self->_endDate;
    v18 = -endDate;
    if (endDate >= 0.0)
      v18 = self->_endDate;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  if ((v10 & 4) != 0)
  {
    creationDate = self->_creationDate;
    v23 = -creationDate;
    if (creationDate >= 0.0)
      v23 = self->_creationDate;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  if ((v10 & 0x40) == 0)
  {
    v26 = 0;
    if (v10 < 0)
      goto LABEL_38;
LABEL_44:
    v27 = 0;
    if ((v10 & 2) != 0)
      goto LABEL_39;
LABEL_45:
    v32 = 0;
    return v41 ^ v4 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v9 ^ v11 ^ v16 ^ v21 ^ v26 ^ v27 ^ v32;
  }
  v26 = 2654435761 * self->_hasEverHadAWatch;
  if ((v10 & 0x80) == 0)
    goto LABEL_44;
LABEL_38:
  v27 = 2654435761 * self->_paused;
  if ((v10 & 2) == 0)
    goto LABEL_45;
LABEL_39:
  activityResumeDate = self->_activityResumeDate;
  v29 = -activityResumeDate;
  if (activityResumeDate >= 0.0)
    v29 = self->_activityResumeDate;
  v30 = floor(v29 + 0.5);
  v31 = (v29 - v30) * 1.84467441e19;
  v32 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
  if (v31 >= 0.0)
  {
    if (v31 > 0.0)
      v32 += (unint64_t)v31;
  }
  else
  {
    v32 -= (unint64_t)fabs(v31);
  }
  return v41 ^ v4 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v9 ^ v11 ^ v16 ^ v21 ^ v26 ^ v27 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  HKCodableQuantity *activeEnergyBurned;
  uint64_t v8;
  HKCodableQuantity *activeEnergyBurnedGoal;
  uint64_t v10;
  HKCodableQuantity *appleMoveTime;
  uint64_t v12;
  HKCodableQuantity *appleMoveTimeGoal;
  uint64_t v14;
  HKCodableQuantity *appleExerciseTime;
  uint64_t v16;
  HKCodableQuantity *appleExerciseTimeGoal;
  uint64_t v18;
  HKCodableQuantity *appleStandHours;
  uint64_t v20;
  HKCodableQuantity *appleStandHoursGoal;
  uint64_t v22;
  char v23;
  id v24;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 124);
  if ((v6 & 8) != 0)
  {
    self->_dateData = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 124);
  }
  if ((v6 & 1) != 0)
  {
    self->_activityMoveMode = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  v8 = *((_QWORD *)v5 + 7);
  v24 = v5;
  if (activeEnergyBurned)
  {
    if (!v8)
      goto LABEL_11;
    -[HKCodableQuantity mergeFrom:](activeEnergyBurned, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    -[HKCodableSummaryActivityRingsValue setActiveEnergyBurned:](self, "setActiveEnergyBurned:");
  }
  v5 = v24;
LABEL_11:
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  v10 = *((_QWORD *)v5 + 8);
  if (activeEnergyBurnedGoal)
  {
    if (!v10)
      goto LABEL_17;
    -[HKCodableQuantity mergeFrom:](activeEnergyBurnedGoal, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_17;
    -[HKCodableSummaryActivityRingsValue setActiveEnergyBurnedGoal:](self, "setActiveEnergyBurnedGoal:");
  }
  v5 = v24;
LABEL_17:
  appleMoveTime = self->_appleMoveTime;
  v12 = *((_QWORD *)v5 + 11);
  if (appleMoveTime)
  {
    if (!v12)
      goto LABEL_23;
    -[HKCodableQuantity mergeFrom:](appleMoveTime, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_23;
    -[HKCodableSummaryActivityRingsValue setAppleMoveTime:](self, "setAppleMoveTime:");
  }
  v5 = v24;
LABEL_23:
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  v14 = *((_QWORD *)v5 + 12);
  if (appleMoveTimeGoal)
  {
    if (!v14)
      goto LABEL_29;
    -[HKCodableQuantity mergeFrom:](appleMoveTimeGoal, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_29;
    -[HKCodableSummaryActivityRingsValue setAppleMoveTimeGoal:](self, "setAppleMoveTimeGoal:");
  }
  v5 = v24;
LABEL_29:
  appleExerciseTime = self->_appleExerciseTime;
  v16 = *((_QWORD *)v5 + 9);
  if (appleExerciseTime)
  {
    if (!v16)
      goto LABEL_35;
    -[HKCodableQuantity mergeFrom:](appleExerciseTime, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_35;
    -[HKCodableSummaryActivityRingsValue setAppleExerciseTime:](self, "setAppleExerciseTime:");
  }
  v5 = v24;
LABEL_35:
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  v18 = *((_QWORD *)v5 + 10);
  if (appleExerciseTimeGoal)
  {
    if (!v18)
      goto LABEL_41;
    -[HKCodableQuantity mergeFrom:](appleExerciseTimeGoal, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_41;
    -[HKCodableSummaryActivityRingsValue setAppleExerciseTimeGoal:](self, "setAppleExerciseTimeGoal:");
  }
  v5 = v24;
LABEL_41:
  appleStandHours = self->_appleStandHours;
  v20 = *((_QWORD *)v5 + 13);
  if (appleStandHours)
  {
    if (!v20)
      goto LABEL_47;
    -[HKCodableQuantity mergeFrom:](appleStandHours, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_47;
    -[HKCodableSummaryActivityRingsValue setAppleStandHours:](self, "setAppleStandHours:");
  }
  v5 = v24;
LABEL_47:
  appleStandHoursGoal = self->_appleStandHoursGoal;
  v22 = *((_QWORD *)v5 + 14);
  if (appleStandHoursGoal)
  {
    if (!v22)
      goto LABEL_53;
    -[HKCodableQuantity mergeFrom:](appleStandHoursGoal, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_53;
    -[HKCodableSummaryActivityRingsValue setAppleStandHoursGoal:](self, "setAppleStandHoursGoal:");
  }
  v5 = v24;
LABEL_53:
  v23 = *((_BYTE *)v5 + 124);
  if ((v23 & 0x20) != 0)
  {
    self->_startDate = *((double *)v5 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
    v23 = *((_BYTE *)v5 + 124);
    if ((v23 & 0x10) == 0)
    {
LABEL_55:
      if ((v23 & 4) == 0)
        goto LABEL_56;
      goto LABEL_63;
    }
  }
  else if ((*((_BYTE *)v5 + 124) & 0x10) == 0)
  {
    goto LABEL_55;
  }
  self->_endDate = *((double *)v5 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v23 = *((_BYTE *)v5 + 124);
  if ((v23 & 4) == 0)
  {
LABEL_56:
    if ((v23 & 0x40) == 0)
      goto LABEL_57;
    goto LABEL_64;
  }
LABEL_63:
  self->_creationDate = *((double *)v5 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v23 = *((_BYTE *)v5 + 124);
  if ((v23 & 0x40) == 0)
  {
LABEL_57:
    if ((v23 & 0x80) == 0)
      goto LABEL_58;
LABEL_65:
    self->_paused = *((_BYTE *)v5 + 121);
    *(_BYTE *)&self->_has |= 0x80u;
    if ((*((_BYTE *)v5 + 124) & 2) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_64:
  self->_hasEverHadAWatch = *((_BYTE *)v5 + 120);
  *(_BYTE *)&self->_has |= 0x40u;
  v23 = *((_BYTE *)v5 + 124);
  if (v23 < 0)
    goto LABEL_65;
LABEL_58:
  if ((v23 & 2) != 0)
  {
LABEL_59:
    self->_activityResumeDate = *((double *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_60:

}

- (HKCodableQuantity)appleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal;
}

- (void)setAppleExerciseTimeGoal:(id)a3
{
  objc_storeStrong((id *)&self->_appleExerciseTimeGoal, a3);
}

- (HKCodableQuantity)appleStandHoursGoal
{
  return self->_appleStandHoursGoal;
}

- (void)setAppleStandHoursGoal:(id)a3
{
  objc_storeStrong((id *)&self->_appleStandHoursGoal, a3);
}

- (BOOL)hasEverHadAWatch
{
  return self->_hasEverHadAWatch;
}

- (BOOL)paused
{
  return self->_paused;
}

- (double)activityResumeDate
{
  return self->_activityResumeDate;
}

@end
