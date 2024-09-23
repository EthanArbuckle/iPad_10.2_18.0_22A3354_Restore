@implementation ASCodableCloudKitActivitySnapshot

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (void)setSnapshotIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_snapshotIndex = a3;
}

- (void)setHasSnapshotIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSnapshotIndex
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTimeZoneOffsetFromUTCForNoon:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_timeZoneOffsetFromUTCForNoon = a3;
}

- (void)setHasTimeZoneOffsetFromUTCForNoon:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTimeZoneOffsetFromUTCForNoon
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setEnergyBurned:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_energyBurned = a3;
}

- (void)setHasEnergyBurned:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEnergyBurned
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setEnergyBurnedGoal:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_energyBurnedGoal = a3;
}

- (void)setHasEnergyBurnedGoal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEnergyBurnedGoal
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setBriskMinutes:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_briskMinutes = a3;
}

- (void)setHasBriskMinutes:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBriskMinutes
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBriskMinutesGoal:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_briskMinutesGoal = a3;
}

- (void)setHasBriskMinutesGoal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasBriskMinutesGoal
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setActiveHours:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_activeHours = a3;
}

- (void)setHasActiveHours:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasActiveHours
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setActiveHoursGoal:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_activeHoursGoal = a3;
}

- (void)setHasActiveHoursGoal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasActiveHoursGoal
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setWalkingAndRunningDistance:(double)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_walkingAndRunningDistance = a3;
}

- (void)setHasWalkingAndRunningDistance:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasWalkingAndRunningDistance
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setStepCount:(double)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_stepCount = a3;
}

- (void)setHasStepCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasStepCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setPushCount:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_pushCount = a3;
}

- (void)setHasPushCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPushCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setWheelchairUse:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_wheelchairUse = a3;
}

- (void)setHasWheelchairUse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasWheelchairUse
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setMmv:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mmv = a3;
}

- (void)setHasMmv:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMmv
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMmg:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mmg = a3;
}

- (void)setHasMmg:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMmg
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAmm:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_amm = a3;
}

- (void)setHasAmm:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAmm
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ASCodableCloudKitActivitySnapshot;
  -[ASCodableCloudKitActivitySnapshot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitActivitySnapshot dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ASCodableCloudKitSample *sample;
  void *v5;
  NSData *sourceUUID;
  __int16 has;
  void *v8;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[ASCodableCloudKitSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  sourceUUID = self->_sourceUUID;
  if (sourceUUID)
    objc_msgSend(v3, "setObject:forKey:", sourceUUID, CFSTR("sourceUUID"));
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_snapshotIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("snapshotIndex"));

    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timeZoneOffsetFromUTCForNoon);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timeZoneOffsetFromUTCForNoon"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_energyBurned);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("energyBurned"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_energyBurnedGoal);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("energyBurnedGoal"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_briskMinutes);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("briskMinutes"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_briskMinutesGoal);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("briskMinutesGoal"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_activeHours);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("activeHours"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_activeHoursGoal);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("activeHoursGoal"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_walkingAndRunningDistance);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("walkingAndRunningDistance"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_stepCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("stepCount"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_pushCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("pushCount"));

  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_wheelchairUse);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("wheelchairUse"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0)
      goto LABEL_19;
LABEL_35:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_mmg);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("mmg"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_20;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_mmv);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("mmv"));

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_35;
LABEL_19:
  if ((has & 4) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_amm);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("amm"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitActivitySnapshotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sourceUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0)
      goto LABEL_19;
LABEL_35:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_35;
LABEL_19:
  if ((has & 4) != 0)
  {
LABEL_20:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_21:

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v6;
  }
  if (self->_sourceUUID)
  {
    objc_msgSend(v6, "setSourceUUID:");
    v4 = v6;
  }
  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_QWORD *)v4 + 11) = self->_snapshotIndex;
    *((_WORD *)v4 + 72) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 13) = self->_timeZoneOffsetFromUTCForNoon;
  *((_WORD *)v4 + 72) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_energyBurned;
  *((_WORD *)v4 + 72) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_energyBurnedGoal;
  *((_WORD *)v4 + 72) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_briskMinutes;
  *((_WORD *)v4 + 72) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_briskMinutesGoal;
  *((_WORD *)v4 + 72) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_activeHours;
  *((_WORD *)v4 + 72) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_activeHoursGoal;
  *((_WORD *)v4 + 72) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_walkingAndRunningDistance;
  *((_WORD *)v4 + 72) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)v4 + 12) = *(_QWORD *)&self->_stepCount;
  *((_WORD *)v4 + 72) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_pushCount;
  *((_WORD *)v4 + 72) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)v4 + 15) = self->_wheelchairUse;
  *((_WORD *)v4 + 72) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0)
      goto LABEL_19;
LABEL_35:
    *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_mmg;
    *((_WORD *)v4 + 72) |= 0x80u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_34:
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_mmv;
  *((_WORD *)v4 + 72) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_35;
LABEL_19:
  if ((has & 4) != 0)
  {
LABEL_20:
    *((_QWORD *)v4 + 3) = self->_amm;
    *((_WORD *)v4 + 72) |= 4u;
  }
LABEL_21:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ASCodableCloudKitSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v6;

  v8 = -[NSData copyWithZone:](self->_sourceUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v8;

  has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(_QWORD *)(v5 + 88) = self->_snapshotIndex;
    *(_WORD *)(v5 + 144) |= 0x400u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 104) = self->_timeZoneOffsetFromUTCForNoon;
  *(_WORD *)(v5 + 144) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 48) = self->_energyBurned;
  *(_WORD *)(v5 + 144) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  *(double *)(v5 + 56) = self->_energyBurnedGoal;
  *(_WORD *)(v5 + 144) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  *(double *)(v5 + 32) = self->_briskMinutes;
  *(_WORD *)(v5 + 144) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v5 + 40) = self->_briskMinutesGoal;
  *(_WORD *)(v5 + 144) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  *(double *)(v5 + 8) = self->_activeHours;
  *(_WORD *)(v5 + 144) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  *(double *)(v5 + 16) = self->_activeHoursGoal;
  *(_WORD *)(v5 + 144) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 112) = self->_walkingAndRunningDistance;
  *(_WORD *)(v5 + 144) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 96) = self->_stepCount;
  *(_WORD *)(v5 + 144) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 80) = self->_pushCount;
  *(_WORD *)(v5 + 144) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  *(_QWORD *)(v5 + 120) = self->_wheelchairUse;
  *(_WORD *)(v5 + 144) |= 0x4000u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      goto LABEL_15;
LABEL_31:
    *(double *)(v5 + 64) = self->_mmg;
    *(_WORD *)(v5 + 144) |= 0x80u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_16;
  }
LABEL_30:
  *(double *)(v5 + 72) = self->_mmv;
  *(_WORD *)(v5 + 144) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
    goto LABEL_31;
LABEL_15:
  if ((has & 4) != 0)
  {
LABEL_16:
    *(_QWORD *)(v5 + 24) = self->_amm;
    *(_WORD *)(v5 + 144) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ASCodableCloudKitSample *sample;
  NSData *sourceUUID;
  __int16 has;
  __int16 v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 16))
  {
    if (!-[ASCodableCloudKitSample isEqual:](sample, "isEqual:"))
      goto LABEL_81;
  }
  sourceUUID = self->_sourceUUID;
  if ((unint64_t)sourceUUID | *((_QWORD *)v4 + 17))
  {
    if (!-[NSData isEqual:](sourceUUID, "isEqual:"))
      goto LABEL_81;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 72);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x400) == 0 || self->_snapshotIndex != *((_QWORD *)v4 + 11))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 72) & 0x400) != 0)
  {
LABEL_81:
    v9 = 0;
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x1000) == 0 || self->_timeZoneOffsetFromUTCForNoon != *((_QWORD *)v4 + 13))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 72) & 0x1000) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_energyBurned != *((double *)v4 + 6))
      goto LABEL_81;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_energyBurnedGoal != *((double *)v4 + 7))
      goto LABEL_81;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_briskMinutes != *((double *)v4 + 4))
      goto LABEL_81;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_briskMinutesGoal != *((double *)v4 + 5))
      goto LABEL_81;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_activeHours != *((double *)v4 + 1))
      goto LABEL_81;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_activeHoursGoal != *((double *)v4 + 2))
      goto LABEL_81;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x2000) == 0 || self->_walkingAndRunningDistance != *((double *)v4 + 14))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 72) & 0x2000) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x800) == 0 || self->_stepCount != *((double *)v4 + 12))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 72) & 0x800) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x200) == 0 || self->_pushCount != *((double *)v4 + 10))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 72) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x4000) == 0 || self->_wheelchairUse != *((_QWORD *)v4 + 15))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 72) & 0x4000) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x100) == 0 || self->_mmv != *((double *)v4 + 9))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 72) & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_mmg != *((double *)v4 + 8))
      goto LABEL_81;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_amm != *((_QWORD *)v4 + 3))
      goto LABEL_81;
    v9 = 1;
  }
  else
  {
    v9 = (v8 & 4) == 0;
  }
LABEL_82:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  double energyBurned;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double energyBurnedGoal;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double briskMinutes;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double briskMinutesGoal;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double activeHours;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double activeHoursGoal;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double walkingAndRunningDistance;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double stepCount;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  double pushCount;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  double mmv;
  double v54;
  long double v55;
  double v56;
  unint64_t v57;
  double mmg;
  double v59;
  long double v60;
  double v61;
  uint64_t v62;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;

  v70 = -[ASCodableCloudKitSample hash](self->_sample, "hash");
  v69 = -[NSData hash](self->_sourceUUID, "hash");
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
    v68 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_3;
LABEL_9:
    v67 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    goto LABEL_13;
  }
  v68 = 2654435761 * self->_snapshotIndex;
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
    goto LABEL_9;
LABEL_3:
  v67 = 2654435761 * self->_timeZoneOffsetFromUTCForNoon;
  if ((has & 0x20) == 0)
    goto LABEL_10;
LABEL_4:
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
LABEL_13:
  if ((has & 0x40) != 0)
  {
    energyBurnedGoal = self->_energyBurnedGoal;
    v11 = -energyBurnedGoal;
    if (energyBurnedGoal >= 0.0)
      v11 = self->_energyBurnedGoal;
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
  if ((has & 8) != 0)
  {
    briskMinutes = self->_briskMinutes;
    v16 = -briskMinutes;
    if (briskMinutes >= 0.0)
      v16 = self->_briskMinutes;
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
  if ((has & 0x10) != 0)
  {
    briskMinutesGoal = self->_briskMinutesGoal;
    v21 = -briskMinutesGoal;
    if (briskMinutesGoal >= 0.0)
      v21 = self->_briskMinutesGoal;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 1) != 0)
  {
    activeHours = self->_activeHours;
    v26 = -activeHours;
    if (activeHours >= 0.0)
      v26 = self->_activeHours;
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
  if ((has & 2) != 0)
  {
    activeHoursGoal = self->_activeHoursGoal;
    v31 = -activeHoursGoal;
    if (activeHoursGoal >= 0.0)
      v31 = self->_activeHoursGoal;
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
  if ((has & 0x2000) != 0)
  {
    walkingAndRunningDistance = self->_walkingAndRunningDistance;
    v36 = -walkingAndRunningDistance;
    if (walkingAndRunningDistance >= 0.0)
      v36 = self->_walkingAndRunningDistance;
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
  v65 = v24;
  if ((has & 0x800) != 0)
  {
    stepCount = self->_stepCount;
    v41 = -stepCount;
    if (stepCount >= 0.0)
      v41 = self->_stepCount;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v64 = v29;
  v66 = v19;
  if ((has & 0x200) != 0)
  {
    pushCount = self->_pushCount;
    v46 = -pushCount;
    if (pushCount >= 0.0)
      v46 = self->_pushCount;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v49 = v34;
  if ((has & 0x4000) != 0)
    v50 = 2654435761 * self->_wheelchairUse;
  else
    v50 = 0;
  v51 = v8;
  if ((has & 0x100) != 0)
  {
    mmv = self->_mmv;
    v54 = -mmv;
    if (mmv >= 0.0)
      v54 = self->_mmv;
    v55 = floor(v54 + 0.5);
    v56 = (v54 - v55) * 1.84467441e19;
    v52 = 2654435761u * (unint64_t)fmod(v55, 1.84467441e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0)
        v52 += (unint64_t)v56;
    }
    else
    {
      v52 -= (unint64_t)fabs(v56);
    }
  }
  else
  {
    v52 = 0;
  }
  if ((has & 0x80) != 0)
  {
    mmg = self->_mmg;
    v59 = -mmg;
    if (mmg >= 0.0)
      v59 = self->_mmg;
    v60 = floor(v59 + 0.5);
    v61 = (v59 - v60) * 1.84467441e19;
    v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0)
        v57 += (unint64_t)v61;
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    v57 = 0;
  }
  if ((has & 4) != 0)
    v62 = 2654435761 * self->_amm;
  else
    v62 = 0;
  return v69 ^ v70 ^ v68 ^ v67 ^ v51 ^ v9 ^ v14 ^ v66 ^ v65 ^ v64 ^ v49 ^ v39 ^ v44 ^ v50 ^ v52 ^ v57 ^ v62;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ASCodableCloudKitSample *sample;
  uint64_t v6;
  __int16 v7;
  id v8;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 16);
  v8 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[ASCodableCloudKitSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ASCodableCloudKitActivitySnapshot setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  if (*((_QWORD *)v4 + 17))
  {
    -[ASCodableCloudKitActivitySnapshot setSourceUUID:](self, "setSourceUUID:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x400) != 0)
  {
    self->_snapshotIndex = *((_QWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x400u;
    v7 = *((_WORD *)v4 + 72);
    if ((v7 & 0x1000) == 0)
    {
LABEL_11:
      if ((v7 & 0x20) == 0)
        goto LABEL_12;
      goto LABEL_28;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  self->_timeZoneOffsetFromUTCForNoon = *((_QWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x20) == 0)
  {
LABEL_12:
    if ((v7 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_29;
  }
LABEL_28:
  self->_energyBurned = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x40) == 0)
  {
LABEL_13:
    if ((v7 & 8) == 0)
      goto LABEL_14;
    goto LABEL_30;
  }
LABEL_29:
  self->_energyBurnedGoal = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 8) == 0)
  {
LABEL_14:
    if ((v7 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  self->_briskMinutes = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x10) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  self->_briskMinutesGoal = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 1) == 0)
  {
LABEL_16:
    if ((v7 & 2) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  self->_activeHours = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 2) == 0)
  {
LABEL_17:
    if ((v7 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_34;
  }
LABEL_33:
  self->_activeHoursGoal = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x2000) == 0)
  {
LABEL_18:
    if ((v7 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_34:
  self->_walkingAndRunningDistance = *((double *)v4 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x800) == 0)
  {
LABEL_19:
    if ((v7 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_36;
  }
LABEL_35:
  self->_stepCount = *((double *)v4 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x200) == 0)
  {
LABEL_20:
    if ((v7 & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_37;
  }
LABEL_36:
  self->_pushCount = *((double *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x4000) == 0)
  {
LABEL_21:
    if ((v7 & 0x100) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  self->_wheelchairUse = *((_QWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x4000u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x100) == 0)
  {
LABEL_22:
    if ((v7 & 0x80) == 0)
      goto LABEL_23;
LABEL_39:
    self->_mmg = *((double *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    if ((*((_WORD *)v4 + 72) & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_38:
  self->_mmv = *((double *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x80) != 0)
    goto LABEL_39;
LABEL_23:
  if ((v7 & 4) != 0)
  {
LABEL_24:
    self->_amm = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_25:

}

- (ASCodableCloudKitSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (void)setSourceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUUID, a3);
}

- (int64_t)snapshotIndex
{
  return self->_snapshotIndex;
}

- (int64_t)timeZoneOffsetFromUTCForNoon
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

- (double)mmv
{
  return self->_mmv;
}

- (double)mmg
{
  return self->_mmg;
}

- (int64_t)amm
{
  return self->_amm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
