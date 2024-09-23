@implementation HKCodableActivitySummaryEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianDateComponents, 0);
  objc_storeStrong((id *)&self->_appleStandHoursGoal, 0);
  objc_storeStrong((id *)&self->_appleStandHours, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeGoal, 0);
  objc_storeStrong((id *)&self->_appleMoveTime, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeGoal, 0);
  objc_storeStrong((id *)&self->_appleExerciseTime, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurnedGoal, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurned, 0);
}

- (void)setGregorianDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianDateComponents, a3);
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

- (void)setActivityMoveMode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activityMoveMode = a3;
}

- (void)setActiveEnergyBurnedGoal:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnergyBurnedGoal, a3);
}

- (void)setActiveEnergyBurned:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnergyBurned, a3);
}

- (void)setAppleStandHoursGoal:(id)a3
{
  objc_storeStrong((id *)&self->_appleStandHoursGoal, a3);
}

- (void)setAppleExerciseTimeGoal:(id)a3
{
  objc_storeStrong((id *)&self->_appleExerciseTimeGoal, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_gregorianDateComponents)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_activeEnergyBurned)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appleMoveTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appleExerciseTime)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appleStandHours)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_activeEnergyBurnedGoal)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appleMoveTimeGoal)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appleExerciseTimeGoal)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_appleStandHoursGoal)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (BOOL)hasGregorianDateComponents
{
  return self->_gregorianDateComponents != 0;
}

- (void)setHasActivityMoveMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivityMoveMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasActiveEnergyBurned
{
  return self->_activeEnergyBurned != 0;
}

- (BOOL)hasAppleMoveTime
{
  return self->_appleMoveTime != 0;
}

- (BOOL)hasAppleExerciseTime
{
  return self->_appleExerciseTime != 0;
}

- (BOOL)hasAppleStandHours
{
  return self->_appleStandHours != 0;
}

- (BOOL)hasActiveEnergyBurnedGoal
{
  return self->_activeEnergyBurnedGoal != 0;
}

- (BOOL)hasAppleMoveTimeGoal
{
  return self->_appleMoveTimeGoal != 0;
}

- (BOOL)hasAppleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal != 0;
}

- (BOOL)hasAppleStandHoursGoal
{
  return self->_appleStandHoursGoal != 0;
}

- (void)setPaused:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_paused = a3;
}

- (void)setHasPaused:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaused
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
  v8.super_class = (Class)HKCodableActivitySummaryEntry;
  -[HKCodableActivitySummaryEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableActivitySummaryEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableDateComponents *gregorianDateComponents;
  void *v5;
  void *v6;
  HKCodableQuantity *activeEnergyBurned;
  void *v8;
  HKCodableQuantity *appleMoveTime;
  void *v10;
  HKCodableQuantity *appleExerciseTime;
  void *v12;
  HKCodableQuantity *appleStandHours;
  void *v14;
  HKCodableQuantity *activeEnergyBurnedGoal;
  void *v16;
  HKCodableQuantity *appleMoveTimeGoal;
  void *v18;
  HKCodableQuantity *appleExerciseTimeGoal;
  void *v20;
  HKCodableQuantity *appleStandHoursGoal;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  gregorianDateComponents = self->_gregorianDateComponents;
  if (gregorianDateComponents)
  {
    -[HKCodableDateComponents dictionaryRepresentation](gregorianDateComponents, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("gregorianDateComponents"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
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
  appleMoveTime = self->_appleMoveTime;
  if (appleMoveTime)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleMoveTime, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("appleMoveTime"));

  }
  appleExerciseTime = self->_appleExerciseTime;
  if (appleExerciseTime)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleExerciseTime, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("appleExerciseTime"));

  }
  appleStandHours = self->_appleStandHours;
  if (appleStandHours)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleStandHours, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("appleStandHours"));

  }
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if (activeEnergyBurnedGoal)
  {
    -[HKCodableQuantity dictionaryRepresentation](activeEnergyBurnedGoal, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("activeEnergyBurnedGoal"));

  }
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if (appleMoveTimeGoal)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleMoveTimeGoal, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("appleMoveTimeGoal"));

  }
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if (appleExerciseTimeGoal)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleExerciseTimeGoal, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("appleExerciseTimeGoal"));

  }
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if (appleStandHoursGoal)
  {
    -[HKCodableQuantity dictionaryRepresentation](appleStandHoursGoal, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("appleStandHoursGoal"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_paused);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("paused"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableActivitySummaryEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_gregorianDateComponents)
  {
    objc_msgSend(v4, "setGregorianDateComponents:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_activityMoveMode;
    *((_BYTE *)v4 + 92) |= 1u;
  }
  if (self->_activeEnergyBurned)
  {
    objc_msgSend(v5, "setActiveEnergyBurned:");
    v4 = v5;
  }
  if (self->_appleMoveTime)
  {
    objc_msgSend(v5, "setAppleMoveTime:");
    v4 = v5;
  }
  if (self->_appleExerciseTime)
  {
    objc_msgSend(v5, "setAppleExerciseTime:");
    v4 = v5;
  }
  if (self->_appleStandHours)
  {
    objc_msgSend(v5, "setAppleStandHours:");
    v4 = v5;
  }
  if (self->_activeEnergyBurnedGoal)
  {
    objc_msgSend(v5, "setActiveEnergyBurnedGoal:");
    v4 = v5;
  }
  if (self->_appleMoveTimeGoal)
  {
    objc_msgSend(v5, "setAppleMoveTimeGoal:");
    v4 = v5;
  }
  if (self->_appleExerciseTimeGoal)
  {
    objc_msgSend(v5, "setAppleExerciseTimeGoal:");
    v4 = v5;
  }
  if (self->_appleStandHoursGoal)
  {
    objc_msgSend(v5, "setAppleStandHoursGoal:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 88) = self->_paused;
    *((_BYTE *)v4 + 92) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableDateComponents copyWithZone:](self->_gregorianDateComponents, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_activityMoveMode;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v8 = -[HKCodableQuantity copyWithZone:](self->_activeEnergyBurned, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_appleMoveTime, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[HKCodableQuantity copyWithZone:](self->_appleExerciseTime, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[HKCodableQuantity copyWithZone:](self->_appleStandHours, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[HKCodableQuantity copyWithZone:](self->_activeEnergyBurnedGoal, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[HKCodableQuantity copyWithZone:](self->_appleMoveTimeGoal, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v20 = -[HKCodableQuantity copyWithZone:](self->_appleExerciseTimeGoal, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = -[HKCodableQuantity copyWithZone:](self->_appleStandHoursGoal, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v22;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_paused;
    *(_BYTE *)(v5 + 92) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableDateComponents *gregorianDateComponents;
  HKCodableQuantity *activeEnergyBurned;
  HKCodableQuantity *appleMoveTime;
  HKCodableQuantity *appleExerciseTime;
  HKCodableQuantity *appleStandHours;
  HKCodableQuantity *activeEnergyBurnedGoal;
  HKCodableQuantity *appleMoveTimeGoal;
  HKCodableQuantity *appleExerciseTimeGoal;
  HKCodableQuantity *appleStandHoursGoal;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  gregorianDateComponents = self->_gregorianDateComponents;
  if ((unint64_t)gregorianDateComponents | *((_QWORD *)v4 + 10))
  {
    if (!-[HKCodableDateComponents isEqual:](gregorianDateComponents, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_activityMoveMode != *((_QWORD *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_27;
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  if ((unint64_t)activeEnergyBurned | *((_QWORD *)v4 + 2)
    && !-[HKCodableQuantity isEqual:](activeEnergyBurned, "isEqual:"))
  {
    goto LABEL_27;
  }
  appleMoveTime = self->_appleMoveTime;
  if ((unint64_t)appleMoveTime | *((_QWORD *)v4 + 6))
  {
    if (!-[HKCodableQuantity isEqual:](appleMoveTime, "isEqual:"))
      goto LABEL_27;
  }
  appleExerciseTime = self->_appleExerciseTime;
  if ((unint64_t)appleExerciseTime | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](appleExerciseTime, "isEqual:"))
      goto LABEL_27;
  }
  appleStandHours = self->_appleStandHours;
  if ((unint64_t)appleStandHours | *((_QWORD *)v4 + 8))
  {
    if (!-[HKCodableQuantity isEqual:](appleStandHours, "isEqual:"))
      goto LABEL_27;
  }
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if ((unint64_t)activeEnergyBurnedGoal | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](activeEnergyBurnedGoal, "isEqual:"))
      goto LABEL_27;
  }
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if ((unint64_t)appleMoveTimeGoal | *((_QWORD *)v4 + 7))
  {
    if (!-[HKCodableQuantity isEqual:](appleMoveTimeGoal, "isEqual:"))
      goto LABEL_27;
  }
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if ((unint64_t)appleExerciseTimeGoal | *((_QWORD *)v4 + 5))
  {
    if (!-[HKCodableQuantity isEqual:](appleExerciseTimeGoal, "isEqual:"))
      goto LABEL_27;
  }
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if ((unint64_t)appleStandHoursGoal | *((_QWORD *)v4 + 9))
  {
    if (!-[HKCodableQuantity isEqual:](appleStandHoursGoal, "isEqual:"))
      goto LABEL_27;
  }
  v14 = (*((_BYTE *)v4 + 92) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0)
    {
LABEL_27:
      v14 = 0;
      goto LABEL_28;
    }
    if (self->_paused)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_27;
    }
    v14 = 1;
  }
LABEL_28:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v14 = -[HKCodableDateComponents hash](self->_gregorianDateComponents, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_activityMoveMode;
  else
    v3 = 0;
  v4 = -[HKCodableQuantity hash](self->_activeEnergyBurned, "hash");
  v5 = -[HKCodableQuantity hash](self->_appleMoveTime, "hash");
  v6 = -[HKCodableQuantity hash](self->_appleExerciseTime, "hash");
  v7 = -[HKCodableQuantity hash](self->_appleStandHours, "hash");
  v8 = -[HKCodableQuantity hash](self->_activeEnergyBurnedGoal, "hash");
  v9 = -[HKCodableQuantity hash](self->_appleMoveTimeGoal, "hash");
  v10 = -[HKCodableQuantity hash](self->_appleExerciseTimeGoal, "hash");
  v11 = -[HKCodableQuantity hash](self->_appleStandHoursGoal, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_paused;
  else
    v12 = 0;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableDateComponents *gregorianDateComponents;
  uint64_t v6;
  HKCodableQuantity *activeEnergyBurned;
  uint64_t v8;
  HKCodableQuantity *appleMoveTime;
  uint64_t v10;
  HKCodableQuantity *appleExerciseTime;
  uint64_t v12;
  HKCodableQuantity *appleStandHours;
  uint64_t v14;
  HKCodableQuantity *activeEnergyBurnedGoal;
  uint64_t v16;
  HKCodableQuantity *appleMoveTimeGoal;
  uint64_t v18;
  HKCodableQuantity *appleExerciseTimeGoal;
  uint64_t v20;
  HKCodableQuantity *appleStandHoursGoal;
  uint64_t v22;
  id v23;

  v4 = a3;
  gregorianDateComponents = self->_gregorianDateComponents;
  v6 = *((_QWORD *)v4 + 10);
  v23 = v4;
  if (gregorianDateComponents)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableDateComponents mergeFrom:](gregorianDateComponents, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableActivitySummaryEntry setGregorianDateComponents:](self, "setGregorianDateComponents:");
  }
  v4 = v23;
LABEL_7:
  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_activityMoveMode = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  v8 = *((_QWORD *)v4 + 2);
  if (activeEnergyBurned)
  {
    if (!v8)
      goto LABEL_15;
    -[HKCodableQuantity mergeFrom:](activeEnergyBurned, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[HKCodableActivitySummaryEntry setActiveEnergyBurned:](self, "setActiveEnergyBurned:");
  }
  v4 = v23;
LABEL_15:
  appleMoveTime = self->_appleMoveTime;
  v10 = *((_QWORD *)v4 + 6);
  if (appleMoveTime)
  {
    if (!v10)
      goto LABEL_21;
    -[HKCodableQuantity mergeFrom:](appleMoveTime, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[HKCodableActivitySummaryEntry setAppleMoveTime:](self, "setAppleMoveTime:");
  }
  v4 = v23;
LABEL_21:
  appleExerciseTime = self->_appleExerciseTime;
  v12 = *((_QWORD *)v4 + 4);
  if (appleExerciseTime)
  {
    if (!v12)
      goto LABEL_27;
    -[HKCodableQuantity mergeFrom:](appleExerciseTime, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[HKCodableActivitySummaryEntry setAppleExerciseTime:](self, "setAppleExerciseTime:");
  }
  v4 = v23;
LABEL_27:
  appleStandHours = self->_appleStandHours;
  v14 = *((_QWORD *)v4 + 8);
  if (appleStandHours)
  {
    if (!v14)
      goto LABEL_33;
    -[HKCodableQuantity mergeFrom:](appleStandHours, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[HKCodableActivitySummaryEntry setAppleStandHours:](self, "setAppleStandHours:");
  }
  v4 = v23;
LABEL_33:
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  v16 = *((_QWORD *)v4 + 3);
  if (activeEnergyBurnedGoal)
  {
    if (!v16)
      goto LABEL_39;
    -[HKCodableQuantity mergeFrom:](activeEnergyBurnedGoal, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_39;
    -[HKCodableActivitySummaryEntry setActiveEnergyBurnedGoal:](self, "setActiveEnergyBurnedGoal:");
  }
  v4 = v23;
LABEL_39:
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  v18 = *((_QWORD *)v4 + 7);
  if (appleMoveTimeGoal)
  {
    if (!v18)
      goto LABEL_45;
    -[HKCodableQuantity mergeFrom:](appleMoveTimeGoal, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_45;
    -[HKCodableActivitySummaryEntry setAppleMoveTimeGoal:](self, "setAppleMoveTimeGoal:");
  }
  v4 = v23;
LABEL_45:
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  v20 = *((_QWORD *)v4 + 5);
  if (appleExerciseTimeGoal)
  {
    if (!v20)
      goto LABEL_51;
    -[HKCodableQuantity mergeFrom:](appleExerciseTimeGoal, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_51;
    -[HKCodableActivitySummaryEntry setAppleExerciseTimeGoal:](self, "setAppleExerciseTimeGoal:");
  }
  v4 = v23;
LABEL_51:
  appleStandHoursGoal = self->_appleStandHoursGoal;
  v22 = *((_QWORD *)v4 + 9);
  if (appleStandHoursGoal)
  {
    if (!v22)
      goto LABEL_57;
    -[HKCodableQuantity mergeFrom:](appleStandHoursGoal, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_57;
    -[HKCodableActivitySummaryEntry setAppleStandHoursGoal:](self, "setAppleStandHoursGoal:");
  }
  v4 = v23;
LABEL_57:
  if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    self->_paused = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (HKCodableDateComponents)gregorianDateComponents
{
  return self->_gregorianDateComponents;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (HKCodableQuantity)activeEnergyBurned
{
  return self->_activeEnergyBurned;
}

- (HKCodableQuantity)appleMoveTime
{
  return self->_appleMoveTime;
}

- (HKCodableQuantity)appleExerciseTime
{
  return self->_appleExerciseTime;
}

- (HKCodableQuantity)appleStandHours
{
  return self->_appleStandHours;
}

- (HKCodableQuantity)activeEnergyBurnedGoal
{
  return self->_activeEnergyBurnedGoal;
}

- (HKCodableQuantity)appleMoveTimeGoal
{
  return self->_appleMoveTimeGoal;
}

- (HKCodableQuantity)appleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal;
}

- (HKCodableQuantity)appleStandHoursGoal
{
  return self->_appleStandHoursGoal;
}

- (BOOL)paused
{
  return self->_paused;
}

@end
