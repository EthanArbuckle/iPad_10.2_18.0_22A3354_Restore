@implementation HDCodableFitnessFriendActivitySnapshot

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (void)setSourceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUUID, a3);
}

- (void)setActiveHours:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_activeHours = a3;
}

- (void)setActiveHoursGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeHoursGoal = a3;
}

- (void)setBriskMinutes:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_briskMinutes = a3;
}

- (void)setBriskMinutesGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_briskMinutesGoal = a3;
}

- (void)setEnergyBurned:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_energyBurned = a3;
}

- (void)setEnergyBurnedGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_energyBurnedGoal = a3;
}

- (void)setWalkingAndRunningDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_walkingAndRunningDistance = a3;
}

- (void)setStepCount:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_stepCount = a3;
}

- (void)setSnapshotIndex:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_snapshotIndex = a3;
}

- (void)setUploadedDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_uploadedDate = a3;
}

- (void)setPushCount:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_pushCount = a3;
}

- (void)setWheelchairUse:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_wheelchairUse = a3;
}

- (void)setTimeZoneOffsetFromUTCForNoon:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timeZoneOffsetFromUTCForNoon = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  $081F708D30B0F12373AF125BF1BBEDA9 has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_friendUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_sourceUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_10;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_23;
LABEL_41:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_DWORD *)&self->_has & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_41;
LABEL_23:
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_25:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
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
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCodableFitnessFriendActivitySnapshot sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applyToObject:", v4);
    if (v6)
    {
      if (-[HDCodableFitnessFriendActivitySnapshot hasFriendUUID](self, "hasFriendUUID"))
      {
        v7 = (void *)MEMORY[0x1E0CB3A28];
        -[HDCodableFitnessFriendActivitySnapshot friendUUID](self, "friendUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hk_UUIDWithData:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setFriendUUID:", v9);
      }
      if (-[HDCodableFitnessFriendActivitySnapshot hasSourceUUID](self, "hasSourceUUID"))
      {
        v10 = (void *)MEMORY[0x1E0CB3A28];
        -[HDCodableFitnessFriendActivitySnapshot sourceUUID](self, "sourceUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hk_UUIDWithData:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setSourceUUID:", v12);
      }
      if (-[HDCodableFitnessFriendActivitySnapshot hasTimeZoneOffsetFromUTCForNoon](self, "hasTimeZoneOffsetFromUTCForNoon"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCodableFitnessFriendActivitySnapshot timeZoneOffsetFromUTCForNoon](self, "timeZoneOffsetFromUTCForNoon"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setTimeZoneOffsetFromUTCForNoon:", v13);

      }
      -[HDCodableFitnessFriendActivitySnapshot activeHours](self, "activeHours");
      objc_msgSend(v4, "setActiveHours:");
      -[HDCodableFitnessFriendActivitySnapshot activeHoursGoal](self, "activeHoursGoal");
      objc_msgSend(v4, "setActiveHoursGoal:");
      -[HDCodableFitnessFriendActivitySnapshot briskMinutes](self, "briskMinutes");
      objc_msgSend(v4, "setBriskMinutes:");
      -[HDCodableFitnessFriendActivitySnapshot briskMinutesGoal](self, "briskMinutesGoal");
      objc_msgSend(v4, "setBriskMinutesGoal:");
      -[HDCodableFitnessFriendActivitySnapshot energyBurned](self, "energyBurned");
      objc_msgSend(v4, "setEnergyBurned:");
      -[HDCodableFitnessFriendActivitySnapshot energyBurnedGoal](self, "energyBurnedGoal");
      objc_msgSend(v4, "setEnergyBurnedGoal:");
      -[HDCodableFitnessFriendActivitySnapshot mmv](self, "mmv");
      objc_msgSend(v4, "setMmv:");
      -[HDCodableFitnessFriendActivitySnapshot mmg](self, "mmg");
      objc_msgSend(v4, "setMmg:");
      objc_msgSend(v4, "setAmm:", -[HDCodableFitnessFriendActivitySnapshot amm](self, "amm"));
      -[HDCodableFitnessFriendActivitySnapshot walkingAndRunningDistance](self, "walkingAndRunningDistance");
      objc_msgSend(v4, "setWalkingAndRunningDistance:");
      -[HDCodableFitnessFriendActivitySnapshot stepCount](self, "stepCount");
      objc_msgSend(v4, "setStepCount:");
      objc_msgSend(v4, "setSnapshotIndex:", -[HDCodableFitnessFriendActivitySnapshot snapshotIndex](self, "snapshotIndex"));
      v14 = objc_alloc(MEMORY[0x1E0C99D68]);
      -[HDCodableFitnessFriendActivitySnapshot uploadedDate](self, "uploadedDate");
      v15 = (void *)objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:");
      objc_msgSend(v4, "setSnapshotUploadedDate:", v15);

      -[HDCodableFitnessFriendActivitySnapshot pushCount](self, "pushCount");
      objc_msgSend(v4, "setPushCount:");
      objc_msgSend(v4, "setWheelchairUse:", -[HDCodableFitnessFriendActivitySnapshot wheelchairUse](self, "wheelchairUse"));
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (BOOL)hasTimeZoneOffsetFromUTCForNoon
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int64_t)timeZoneOffsetFromUTCForNoon
{
  return self->_timeZoneOffsetFromUTCForNoon;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (double)activeHoursGoal
{
  return self->_activeHoursGoal;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (double)briskMinutesGoal
{
  return self->_briskMinutesGoal;
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

- (double)stepCount
{
  return self->_stepCount;
}

- (int64_t)snapshotIndex
{
  return self->_snapshotIndex;
}

- (double)uploadedDate
{
  return self->_uploadedDate;
}

- (double)pushCount
{
  return self->_pushCount;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasSnapshotIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSnapshotIndex
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasTimeZoneOffsetFromUTCForNoon:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)setHasEnergyBurned:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEnergyBurned
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasEnergyBurnedGoal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasEnergyBurnedGoal
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasBriskMinutes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBriskMinutes
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasBriskMinutesGoal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBriskMinutesGoal
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasActiveHours:(BOOL)a3
{
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasActiveHours
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasActiveHoursGoal:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveHoursGoal
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasWalkingAndRunningDistance:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasWalkingAndRunningDistance
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasStepCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasStepCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasPushCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPushCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasWheelchairUse:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasWheelchairUse
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasUploadedDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUploadedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMmv:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_mmv = a3;
}

- (void)setHasMmv:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMmv
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setMmg:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_mmg = a3;
}

- (void)setHasMmg:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMmg
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setAmm:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_amm = a3;
}

- (void)setHasAmm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAmm
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)HDCodableFitnessFriendActivitySnapshot;
  -[HDCodableFitnessFriendActivitySnapshot description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendActivitySnapshot dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *friendUUID;
  NSData *sourceUUID;
  $081F708D30B0F12373AF125BF1BBEDA9 has;
  void *v9;
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
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  friendUUID = self->_friendUUID;
  if (friendUUID)
    objc_msgSend(v3, "setObject:forKey:", friendUUID, CFSTR("friendUUID"));
  sourceUUID = self->_sourceUUID;
  if (sourceUUID)
    objc_msgSend(v3, "setObject:forKey:", sourceUUID, CFSTR("sourceUUID"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_snapshotIndex);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("snapshotIndex"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_10;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("date"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_timeZoneOffsetFromUTCForNoon);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("timeZoneOffsetFromUTCForNoon"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_energyBurned);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("energyBurned"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_energyBurnedGoal);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("energyBurnedGoal"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_briskMinutes);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("briskMinutes"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_briskMinutesGoal);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("briskMinutesGoal"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_activeHours);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("activeHours"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_activeHoursGoal);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("activeHoursGoal"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_walkingAndRunningDistance);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("walkingAndRunningDistance"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_stepCount);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("stepCount"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pushCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("pushCount"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_wheelchairUse);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("wheelchairUse"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_uploadedDate);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("uploadedDate"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_23;
LABEL_41:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mmg);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("mmg"));

    if ((*(_DWORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_24;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mmv);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("mmv"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_41;
LABEL_23:
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_amm);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("amm"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFitnessFriendActivitySnapshotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  $081F708D30B0F12373AF125BF1BBEDA9 has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v6;
  }
  if (self->_friendUUID)
  {
    objc_msgSend(v6, "setFriendUUID:");
    v4 = v6;
  }
  if (self->_sourceUUID)
  {
    objc_msgSend(v6, "setSourceUUID:");
    v4 = v6;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((_QWORD *)v4 + 12) = self->_snapshotIndex;
    *((_DWORD *)v4 + 42) |= 0x800u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_10;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_date;
  *((_DWORD *)v4 + 42) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *((_QWORD *)v4 + 14) = self->_timeZoneOffsetFromUTCForNoon;
  *((_DWORD *)v4 + 42) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_energyBurned;
  *((_DWORD *)v4 + 42) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_energyBurnedGoal;
  *((_DWORD *)v4 + 42) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_briskMinutes;
  *((_DWORD *)v4 + 42) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_briskMinutesGoal;
  *((_DWORD *)v4 + 42) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_activeHours;
  *((_DWORD *)v4 + 42) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_activeHoursGoal;
  *((_DWORD *)v4 + 42) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  *((_QWORD *)v4 + 16) = *(_QWORD *)&self->_walkingAndRunningDistance;
  *((_DWORD *)v4 + 42) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  *((_QWORD *)v4 + 13) = *(_QWORD *)&self->_stepCount;
  *((_DWORD *)v4 + 42) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_37:
  *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_pushCount;
  *((_DWORD *)v4 + 42) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_21;
    goto LABEL_39;
  }
LABEL_38:
  *((_QWORD *)v4 + 17) = self->_wheelchairUse;
  *((_DWORD *)v4 + 42) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_39:
  *((_QWORD *)v4 + 15) = *(_QWORD *)&self->_uploadedDate;
  *((_DWORD *)v4 + 42) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_23;
LABEL_41:
    *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_mmg;
    *((_DWORD *)v4 + 42) |= 0x100u;
    if ((*(_DWORD *)&self->_has & 4) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_40:
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_mmv;
  *((_DWORD *)v4 + 42) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_41;
LABEL_23:
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_24:
    *((_QWORD *)v4 + 3) = self->_amm;
    *((_DWORD *)v4 + 42) |= 4u;
  }
LABEL_25:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  $081F708D30B0F12373AF125BF1BBEDA9 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v6;

  v8 = -[NSData copyWithZone:](self->_friendUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v8;

  v10 = -[NSData copyWithZone:](self->_sourceUUID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v10;

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *(_QWORD *)(v5 + 96) = self->_snapshotIndex;
    *(_DWORD *)(v5 + 168) |= 0x800u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_date;
  *(_DWORD *)(v5 + 168) |= 0x20u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  *(_QWORD *)(v5 + 112) = self->_timeZoneOffsetFromUTCForNoon;
  *(_DWORD *)(v5 + 168) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v5 + 56) = self->_energyBurned;
  *(_DWORD *)(v5 + 168) |= 0x40u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_7;
    goto LABEL_25;
  }
LABEL_24:
  *(double *)(v5 + 64) = self->_energyBurnedGoal;
  *(_DWORD *)(v5 + 168) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_26;
  }
LABEL_25:
  *(double *)(v5 + 32) = self->_briskMinutes;
  *(_DWORD *)(v5 + 168) |= 8u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_9;
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 40) = self->_briskMinutesGoal;
  *(_DWORD *)(v5 + 168) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_10;
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 8) = self->_activeHours;
  *(_DWORD *)(v5 + 168) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 16) = self->_activeHoursGoal;
  *(_DWORD *)(v5 + 168) |= 2u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 128) = self->_walkingAndRunningDistance;
  *(_DWORD *)(v5 + 168) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v5 + 104) = self->_stepCount;
  *(_DWORD *)(v5 + 168) |= 0x1000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v5 + 88) = self->_pushCount;
  *(_DWORD *)(v5 + 168) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  *(_QWORD *)(v5 + 136) = self->_wheelchairUse;
  *(_DWORD *)(v5 + 168) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *(double *)(v5 + 120) = self->_uploadedDate;
  *(_DWORD *)(v5 + 168) |= 0x4000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_17;
LABEL_35:
    *(double *)(v5 + 72) = self->_mmg;
    *(_DWORD *)(v5 + 168) |= 0x100u;
    if ((*(_DWORD *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_18;
  }
LABEL_34:
  *(double *)(v5 + 80) = self->_mmv;
  *(_DWORD *)(v5 + 168) |= 0x200u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
    goto LABEL_35;
LABEL_17:
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_18:
    *(_QWORD *)(v5 + 24) = self->_amm;
    *(_DWORD *)(v5 + 168) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  NSData *friendUUID;
  NSData *sourceUUID;
  $081F708D30B0F12373AF125BF1BBEDA9 has;
  int v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_93;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 19))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_93;
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((_QWORD *)v4 + 18))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:"))
      goto LABEL_93;
  }
  sourceUUID = self->_sourceUUID;
  if ((unint64_t)sourceUUID | *((_QWORD *)v4 + 20))
  {
    if (!-[NSData isEqual:](sourceUUID, "isEqual:"))
      goto LABEL_93;
  }
  has = self->_has;
  v9 = *((_DWORD *)v4 + 42);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_snapshotIndex != *((_QWORD *)v4 + 12))
      goto LABEL_93;
  }
  else if ((v9 & 0x800) != 0)
  {
LABEL_93:
    v10 = 0;
    goto LABEL_94;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_date != *((double *)v4 + 6))
      goto LABEL_93;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_timeZoneOffsetFromUTCForNoon != *((_QWORD *)v4 + 14))
      goto LABEL_93;
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_energyBurned != *((double *)v4 + 7))
      goto LABEL_93;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_energyBurnedGoal != *((double *)v4 + 8))
      goto LABEL_93;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_briskMinutes != *((double *)v4 + 4))
      goto LABEL_93;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_briskMinutesGoal != *((double *)v4 + 5))
      goto LABEL_93;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_activeHours != *((double *)v4 + 1))
      goto LABEL_93;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_activeHoursGoal != *((double *)v4 + 2))
      goto LABEL_93;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_walkingAndRunningDistance != *((double *)v4 + 16))
      goto LABEL_93;
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_stepCount != *((double *)v4 + 13))
      goto LABEL_93;
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_pushCount != *((double *)v4 + 11))
      goto LABEL_93;
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_wheelchairUse != *((_QWORD *)v4 + 17))
      goto LABEL_93;
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_uploadedDate != *((double *)v4 + 15))
      goto LABEL_93;
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_mmv != *((double *)v4 + 10))
      goto LABEL_93;
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_mmg != *((double *)v4 + 9))
      goto LABEL_93;
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_amm != *((_QWORD *)v4 + 3))
      goto LABEL_93;
    v10 = 1;
  }
  else
  {
    v10 = (*((_DWORD *)v4 + 42) & 4) == 0;
  }
LABEL_94:

  return v10;
}

- (unint64_t)hash
{
  $081F708D30B0F12373AF125BF1BBEDA9 has;
  double date;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  double energyBurned;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  double energyBurnedGoal;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double briskMinutes;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double briskMinutesGoal;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double activeHours;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double activeHoursGoal;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double walkingAndRunningDistance;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  double stepCount;
  double v46;
  long double v47;
  double v48;
  double v49;
  unint64_t v50;
  double pushCount;
  double v52;
  long double v53;
  double v54;
  double uploadedDate;
  double v56;
  long double v57;
  double v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  double mmv;
  double v64;
  long double v65;
  double v66;
  unint64_t v67;
  double mmg;
  double v69;
  long double v70;
  double v71;
  uint64_t v72;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;

  v82 = -[HDCodableSample hash](self->_sample, "hash");
  v81 = -[NSData hash](self->_friendUUID, "hash");
  v80 = -[NSData hash](self->_sourceUUID, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v79 = 2654435761 * self->_snapshotIndex;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v79 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_8;
LABEL_3:
  date = self->_date;
  v5 = -date;
  if (date >= 0.0)
    v5 = self->_date;
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
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    v78 = 2654435761 * self->_timeZoneOffsetFromUTCForNoon;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_13;
LABEL_18:
    v13 = 0;
    goto LABEL_21;
  }
  v78 = 0;
  if ((*(_BYTE *)&has & 0x40) == 0)
    goto LABEL_18;
LABEL_13:
  energyBurned = self->_energyBurned;
  v10 = -energyBurned;
  if (energyBurned >= 0.0)
    v10 = self->_energyBurned;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_21:
  v75 = v13;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    energyBurnedGoal = self->_energyBurnedGoal;
    v16 = -energyBurnedGoal;
    if (energyBurnedGoal >= 0.0)
      v16 = self->_energyBurnedGoal;
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
  if ((*(_BYTE *)&has & 8) != 0)
  {
    briskMinutes = self->_briskMinutes;
    v21 = -briskMinutes;
    if (briskMinutes >= 0.0)
      v21 = self->_briskMinutes;
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
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    briskMinutesGoal = self->_briskMinutesGoal;
    v26 = -briskMinutesGoal;
    if (briskMinutesGoal >= 0.0)
      v26 = self->_briskMinutesGoal;
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
  if ((*(_BYTE *)&has & 1) != 0)
  {
    activeHours = self->_activeHours;
    v31 = -activeHours;
    if (activeHours >= 0.0)
      v31 = self->_activeHours;
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
  if ((*(_BYTE *)&has & 2) != 0)
  {
    activeHoursGoal = self->_activeHoursGoal;
    v36 = -activeHoursGoal;
    if (activeHoursGoal >= 0.0)
      v36 = self->_activeHoursGoal;
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
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    walkingAndRunningDistance = self->_walkingAndRunningDistance;
    v41 = -walkingAndRunningDistance;
    if (walkingAndRunningDistance >= 0.0)
      v41 = self->_walkingAndRunningDistance;
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
  v44 = v39;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    stepCount = self->_stepCount;
    v46 = -stepCount;
    if (stepCount >= 0.0)
      v46 = self->_stepCount;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v49 = fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      v83 = 2654435761u * (unint64_t)v49;
      v39 = v44;
      if (v48 > 0.0)
        v83 += (unint64_t)v48;
    }
    else
    {
      v83 = 2654435761u * (unint64_t)v49 - (unint64_t)fabs(v48);
      v39 = v44;
    }
  }
  else
  {
    v83 = 0;
  }
  v77 = v8;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    pushCount = self->_pushCount;
    v52 = -pushCount;
    if (pushCount >= 0.0)
      v52 = self->_pushCount;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      v39 = v44;
      if (v54 > 0.0)
        v50 += (unint64_t)v54;
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
      v39 = v44;
    }
  }
  else
  {
    v50 = 0;
  }
  v76 = v14;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    v74 = 2654435761 * self->_wheelchairUse;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_87;
LABEL_92:
    v60 = v34;
    v59 = 0;
    goto LABEL_95;
  }
  v74 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0)
    goto LABEL_92;
LABEL_87:
  uploadedDate = self->_uploadedDate;
  v56 = -uploadedDate;
  if (uploadedDate >= 0.0)
    v56 = self->_uploadedDate;
  v57 = floor(v56 + 0.5);
  v58 = (v56 - v57) * 1.84467441e19;
  v59 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
  v60 = v34;
  if (v58 >= 0.0)
  {
    v39 = v44;
    if (v58 > 0.0)
      v59 += (unint64_t)v58;
  }
  else
  {
    v59 -= (unint64_t)fabs(v58);
    v39 = v44;
  }
LABEL_95:
  v61 = v19;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    mmv = self->_mmv;
    v64 = -mmv;
    if (mmv >= 0.0)
      v64 = self->_mmv;
    v65 = floor(v64 + 0.5);
    v66 = (v64 - v65) * 1.84467441e19;
    v62 = 2654435761u * (unint64_t)fmod(v65, 1.84467441e19);
    if (v66 >= 0.0)
    {
      v39 = v44;
      if (v66 > 0.0)
        v62 += (unint64_t)v66;
    }
    else
    {
      v62 -= (unint64_t)fabs(v66);
      v39 = v44;
    }
  }
  else
  {
    v62 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    mmg = self->_mmg;
    v69 = -mmg;
    if (mmg >= 0.0)
      v69 = self->_mmg;
    v70 = floor(v69 + 0.5);
    v71 = (v69 - v70) * 1.84467441e19;
    v67 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
    if (v71 >= 0.0)
    {
      v39 = v44;
      if (v71 > 0.0)
        v67 += (unint64_t)v71;
    }
    else
    {
      v67 -= (unint64_t)fabs(v71);
      v39 = v44;
    }
  }
  else
  {
    v67 = 0;
  }
  if ((*(_BYTE *)&has & 4) != 0)
    v72 = 2654435761 * self->_amm;
  else
    v72 = 0;
  return v81 ^ v82 ^ v80 ^ v79 ^ v77 ^ v78 ^ v75 ^ v76 ^ v61 ^ v24 ^ v29 ^ v60 ^ v39 ^ v83 ^ v50 ^ v74 ^ v59 ^ v62 ^ v67 ^ v72;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  int v7;
  id v8;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 19);
  v8 = v4;
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableFitnessFriendActivitySnapshot setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  if (*((_QWORD *)v4 + 18))
  {
    -[HDCodableFitnessFriendActivitySnapshot setFriendUUID:](self, "setFriendUUID:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 20))
  {
    -[HDCodableFitnessFriendActivitySnapshot setSourceUUID:](self, "setSourceUUID:");
    v4 = v8;
  }
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x800) != 0)
  {
    self->_snapshotIndex = *((_QWORD *)v4 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
    v7 = *((_DWORD *)v4 + 42);
    if ((v7 & 0x20) == 0)
    {
LABEL_13:
      if ((v7 & 0x2000) == 0)
        goto LABEL_14;
      goto LABEL_32;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  self->_date = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x2000) == 0)
  {
LABEL_14:
    if ((v7 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_33;
  }
LABEL_32:
  self->_timeZoneOffsetFromUTCForNoon = *((_QWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x40) == 0)
  {
LABEL_15:
    if ((v7 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  self->_energyBurned = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x80) == 0)
  {
LABEL_16:
    if ((v7 & 8) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  self->_energyBurnedGoal = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 8) == 0)
  {
LABEL_17:
    if ((v7 & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_36;
  }
LABEL_35:
  self->_briskMinutes = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x10) == 0)
  {
LABEL_18:
    if ((v7 & 1) == 0)
      goto LABEL_19;
    goto LABEL_37;
  }
LABEL_36:
  self->_briskMinutesGoal = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 1) == 0)
  {
LABEL_19:
    if ((v7 & 2) == 0)
      goto LABEL_20;
    goto LABEL_38;
  }
LABEL_37:
  self->_activeHours = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 2) == 0)
  {
LABEL_20:
    if ((v7 & 0x8000) == 0)
      goto LABEL_21;
    goto LABEL_39;
  }
LABEL_38:
  self->_activeHoursGoal = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x8000) == 0)
  {
LABEL_21:
    if ((v7 & 0x1000) == 0)
      goto LABEL_22;
    goto LABEL_40;
  }
LABEL_39:
  self->_walkingAndRunningDistance = *((double *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x1000) == 0)
  {
LABEL_22:
    if ((v7 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_41;
  }
LABEL_40:
  self->_stepCount = *((double *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x400) == 0)
  {
LABEL_23:
    if ((v7 & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_42;
  }
LABEL_41:
  self->_pushCount = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x10000) == 0)
  {
LABEL_24:
    if ((v7 & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_43;
  }
LABEL_42:
  self->_wheelchairUse = *((_QWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x4000) == 0)
  {
LABEL_25:
    if ((v7 & 0x200) == 0)
      goto LABEL_26;
    goto LABEL_44;
  }
LABEL_43:
  self->_uploadedDate = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x200) == 0)
  {
LABEL_26:
    if ((v7 & 0x100) == 0)
      goto LABEL_27;
LABEL_45:
    self->_mmg = *((double *)v4 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
    if ((*((_DWORD *)v4 + 42) & 4) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_44:
  self->_mmv = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x100) != 0)
    goto LABEL_45;
LABEL_27:
  if ((v7 & 4) != 0)
  {
LABEL_28:
    self->_amm = *((_QWORD *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_29:

}

- (double)date
{
  return self->_date;
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

@end
