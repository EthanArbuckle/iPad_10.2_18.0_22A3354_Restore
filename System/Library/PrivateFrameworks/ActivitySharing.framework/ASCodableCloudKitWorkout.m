@implementation ASCodableCloudKitWorkout

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDuration:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTotalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_totalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTotalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_totalBasalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTotalBasalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTotalDistanceInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_totalDistanceInCanonicalUnit = a3;
}

- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTotalDistanceInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setGoalType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_goalType = a3;
}

- (void)setHasGoalType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGoalType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setGoalInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_goalInCanonicalUnit = a3;
}

- (void)setHasGoalInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGoalInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setIsWatchWorkout:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isWatchWorkout = a3;
}

- (void)setHasIsWatchWorkout:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsWatchWorkout
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsIndoorWorkout:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isIndoorWorkout = a3;
}

- (void)setHasIsIndoorWorkout:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsIndoorWorkout
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasDeviceManufacturer
{
  return self->_deviceManufacturer != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)setAmm:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_amm = a3;
}

- (void)setHasAmm:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAmm
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasSeymourCatalogWorkoutIdentifier
{
  return self->_seymourCatalogWorkoutIdentifier != 0;
}

- (BOOL)hasSeymourMediaType
{
  return self->_seymourMediaType != 0;
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
  v8.super_class = (Class)ASCodableCloudKitWorkout;
  -[ASCodableCloudKitWorkout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitWorkout dictionaryRepresentation](self, "dictionaryRepresentation");
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
  __int16 has;
  void *v7;
  NSString *bundleID;
  __int16 v9;
  void *v10;
  void *v11;
  NSString *deviceManufacturer;
  NSString *deviceModel;
  void *v14;
  NSString *seymourCatalogWorkoutIdentifier;
  NSString *seymourMediaType;
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
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_type);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("type"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("duration"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalEnergyBurnedInCanonicalUnit);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("totalEnergyBurnedInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalBasalEnergyBurnedInCanonicalUnit);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("totalBasalEnergyBurnedInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalDistanceInCanonicalUnit);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("totalDistanceInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_goalType);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("goalType"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_goalInCanonicalUnit);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("goalInCanonicalUnit"));

  }
LABEL_11:
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  v9 = (__int16)self->_has;
  if ((v9 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isWatchWorkout);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isWatchWorkout"));

    v9 = (__int16)self->_has;
  }
  if ((v9 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isIndoorWorkout);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isIndoorWorkout"));

  }
  deviceManufacturer = self->_deviceManufacturer;
  if (deviceManufacturer)
    objc_msgSend(v3, "setObject:forKey:", deviceManufacturer, CFSTR("deviceManufacturer"));
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("deviceModel"));
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_amm);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("amm"));

  }
  seymourCatalogWorkoutIdentifier = self->_seymourCatalogWorkoutIdentifier;
  if (seymourCatalogWorkoutIdentifier)
    objc_msgSend(v3, "setObject:forKey:", seymourCatalogWorkoutIdentifier, CFSTR("seymourCatalogWorkoutIdentifier"));
  seymourMediaType = self->_seymourMediaType;
  if (seymourMediaType)
    objc_msgSend(v3, "setObject:forKey:", seymourMediaType, CFSTR("seymourMediaType"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitWorkoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
LABEL_11:
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_deviceManufacturer)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
  if (self->_seymourCatalogWorkoutIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_seymourMediaType)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((_QWORD *)v4 + 8) = self->_type;
    *((_WORD *)v4 + 62) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_30;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_duration;
  *((_WORD *)v4 + 62) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_totalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v4 + 62) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_32;
  }
LABEL_31:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_totalBasalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v4 + 62) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_totalDistanceInCanonicalUnit;
  *((_WORD *)v4 + 62) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_33:
  *((_QWORD *)v4 + 4) = self->_goalType;
  *((_WORD *)v4 + 62) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_goalInCanonicalUnit;
    *((_WORD *)v4 + 62) |= 4u;
  }
LABEL_11:
  if (self->_bundleID)
  {
    objc_msgSend(v7, "setBundleID:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 121) = self->_isWatchWorkout;
    *((_WORD *)v4 + 62) |= 0x200u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    *((_BYTE *)v4 + 120) = self->_isIndoorWorkout;
    *((_WORD *)v4 + 62) |= 0x100u;
  }
  if (self->_deviceManufacturer)
  {
    objc_msgSend(v7, "setDeviceManufacturer:");
    v4 = v7;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v7, "setDeviceModel:");
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_amm;
    *((_WORD *)v4 + 62) |= 1u;
  }
  if (self->_seymourCatalogWorkoutIdentifier)
  {
    objc_msgSend(v7, "setSeymourCatalogWorkoutIdentifier:");
    v4 = v7;
  }
  if (self->_seymourMediaType)
  {
    objc_msgSend(v7, "setSeymourMediaType:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ASCodableCloudKitSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v6;

  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_type;
    *(_WORD *)(v5 + 124) |= 0x80u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_duration;
  *(_WORD *)(v5 + 124) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 56) = self->_totalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 124) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 40) = self->_totalBasalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 124) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 48) = self->_totalDistanceInCanonicalUnit;
  *(_WORD *)(v5 + 124) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  *(_QWORD *)(v5 + 32) = self->_goalType;
  *(_WORD *)(v5 + 124) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_8:
    *(double *)(v5 + 24) = self->_goalInCanonicalUnit;
    *(_WORD *)(v5 + 124) |= 4u;
  }
LABEL_9:
  v9 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v11 = (__int16)self->_has;
  if ((v11 & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 121) = self->_isWatchWorkout;
    *(_WORD *)(v5 + 124) |= 0x200u;
    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 120) = self->_isIndoorWorkout;
    *(_WORD *)(v5 + 124) |= 0x100u;
  }
  v12 = -[NSString copyWithZone:](self->_deviceManufacturer, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v12;

  v14 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v14;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_amm;
    *(_WORD *)(v5 + 124) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_seymourCatalogWorkoutIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  v18 = -[NSString copyWithZone:](self->_seymourMediaType, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ASCodableCloudKitSample *sample;
  __int16 has;
  __int16 v7;
  NSString *bundleID;
  NSString *deviceManufacturer;
  NSString *deviceModel;
  __int16 v11;
  NSString *seymourCatalogWorkoutIdentifier;
  NSString *seymourMediaType;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_71;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 12))
  {
    if (!-[ASCodableCloudKitSample isEqual:](sample, "isEqual:"))
      goto LABEL_71;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 62);
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_type != *((_QWORD *)v4 + 8))
      goto LABEL_71;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_duration != *((double *)v4 + 2))
      goto LABEL_71;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_totalEnergyBurnedInCanonicalUnit != *((double *)v4 + 7))
      goto LABEL_71;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_totalBasalEnergyBurnedInCanonicalUnit != *((double *)v4 + 5))
      goto LABEL_71;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_totalDistanceInCanonicalUnit != *((double *)v4 + 6))
      goto LABEL_71;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_goalType != *((_QWORD *)v4 + 4))
      goto LABEL_71;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_goalInCanonicalUnit != *((double *)v4 + 3))
      goto LABEL_71;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
      goto LABEL_71;
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) == 0)
      goto LABEL_71;
    if (self->_isWatchWorkout)
    {
      if (!*((_BYTE *)v4 + 121))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x200) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) != 0)
    {
      if (self->_isIndoorWorkout)
      {
        if (!*((_BYTE *)v4 + 120))
          goto LABEL_71;
        goto LABEL_58;
      }
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_58;
    }
LABEL_71:
    v14 = 0;
    goto LABEL_72;
  }
  if ((*((_WORD *)v4 + 62) & 0x100) != 0)
    goto LABEL_71;
LABEL_58:
  deviceManufacturer = self->_deviceManufacturer;
  if ((unint64_t)deviceManufacturer | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](deviceManufacturer, "isEqual:"))
  {
    goto LABEL_71;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_71;
  }
  v11 = *((_WORD *)v4 + 62);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_amm != *((_QWORD *)v4 + 1))
      goto LABEL_71;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_71;
  }
  seymourCatalogWorkoutIdentifier = self->_seymourCatalogWorkoutIdentifier;
  if ((unint64_t)seymourCatalogWorkoutIdentifier | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](seymourCatalogWorkoutIdentifier, "isEqual:"))
  {
    goto LABEL_71;
  }
  seymourMediaType = self->_seymourMediaType;
  if ((unint64_t)seymourMediaType | *((_QWORD *)v4 + 14))
    v14 = -[NSString isEqual:](seymourMediaType, "isEqual:");
  else
    v14 = 1;
LABEL_72:

  return v14;
}

- (unint64_t)hash
{
  __int16 has;
  double duration;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double totalEnergyBurnedInCanonicalUnit;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double totalBasalEnergyBurnedInCanonicalUnit;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double totalDistanceInCanonicalUnit;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  double goalInCanonicalUnit;
  double v27;
  long double v28;
  double v29;
  NSUInteger v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  uint64_t v35;
  unint64_t v36;
  NSUInteger v37;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;

  v43 = -[ASCodableCloudKitSample hash](self->_sample, "hash");
  has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v42 = 2654435761 * self->_type;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v42 = 0;
  if ((has & 2) == 0)
    goto LABEL_8;
LABEL_3:
  duration = self->_duration;
  v5 = -duration;
  if (duration >= 0.0)
    v5 = self->_duration;
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
  if ((has & 0x40) != 0)
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
    totalBasalEnergyBurnedInCanonicalUnit = self->_totalBasalEnergyBurnedInCanonicalUnit;
    v16 = -totalBasalEnergyBurnedInCanonicalUnit;
    if (totalBasalEnergyBurnedInCanonicalUnit >= 0.0)
      v16 = self->_totalBasalEnergyBurnedInCanonicalUnit;
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
  v41 = v8;
  if ((has & 0x20) != 0)
  {
    totalDistanceInCanonicalUnit = self->_totalDistanceInCanonicalUnit;
    v21 = -totalDistanceInCanonicalUnit;
    if (totalDistanceInCanonicalUnit >= 0.0)
      v21 = self->_totalDistanceInCanonicalUnit;
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
  v40 = v14;
  if ((has & 8) != 0)
    v39 = 2654435761 * self->_goalType;
  else
    v39 = 0;
  v24 = v9;
  if ((has & 4) != 0)
  {
    goalInCanonicalUnit = self->_goalInCanonicalUnit;
    v27 = -goalInCanonicalUnit;
    if (goalInCanonicalUnit >= 0.0)
      v27 = self->_goalInCanonicalUnit;
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
  v30 = -[NSString hash](self->_bundleID, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v31 = 2654435761 * self->_isWatchWorkout;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_48;
  }
  else
  {
    v31 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_48:
      v32 = 2654435761 * self->_isIndoorWorkout;
      goto LABEL_51;
    }
  }
  v32 = 0;
LABEL_51:
  v33 = -[NSString hash](self->_deviceManufacturer, "hash");
  v34 = -[NSString hash](self->_deviceModel, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
    v35 = 2654435761 * self->_amm;
  else
    v35 = 0;
  v36 = v42 ^ v43 ^ v41 ^ v24 ^ v40 ^ v19 ^ v39 ^ v25 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
  v37 = v35 ^ -[NSString hash](self->_seymourCatalogWorkoutIdentifier, "hash");
  return v36 ^ v37 ^ -[NSString hash](self->_seymourMediaType, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ASCodableCloudKitSample *sample;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  id v9;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 12);
  v9 = v4;
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
    -[ASCodableCloudKitWorkout setSample:](self, "setSample:");
  }
  v4 = v9;
LABEL_7:
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x80) != 0)
  {
    self->_type = *((_QWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    v7 = *((_WORD *)v4 + 62);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_34;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_duration = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x40) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  self->_totalEnergyBurnedInCanonicalUnit = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x10) == 0)
  {
LABEL_11:
    if ((v7 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  self->_totalBasalEnergyBurnedInCanonicalUnit = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x20) == 0)
  {
LABEL_12:
    if ((v7 & 8) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  self->_totalDistanceInCanonicalUnit = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 8) == 0)
  {
LABEL_13:
    if ((v7 & 4) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_37:
  self->_goalType = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 62) & 4) != 0)
  {
LABEL_14:
    self->_goalInCanonicalUnit = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 9))
  {
    -[ASCodableCloudKitWorkout setBundleID:](self, "setBundleID:");
    v4 = v9;
  }
  v8 = *((_WORD *)v4 + 62);
  if ((v8 & 0x200) != 0)
  {
    self->_isWatchWorkout = *((_BYTE *)v4 + 121);
    *(_WORD *)&self->_has |= 0x200u;
    v8 = *((_WORD *)v4 + 62);
  }
  if ((v8 & 0x100) != 0)
  {
    self->_isIndoorWorkout = *((_BYTE *)v4 + 120);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[ASCodableCloudKitWorkout setDeviceManufacturer:](self, "setDeviceManufacturer:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[ASCodableCloudKitWorkout setDeviceModel:](self, "setDeviceModel:");
    v4 = v9;
  }
  if ((*((_WORD *)v4 + 62) & 1) != 0)
  {
    self->_amm = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[ASCodableCloudKitWorkout setSeymourCatalogWorkoutIdentifier:](self, "setSeymourCatalogWorkoutIdentifier:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[ASCodableCloudKitWorkout setSeymourMediaType:](self, "setSeymourMediaType:");
    v4 = v9;
  }

}

- (ASCodableCloudKitSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (double)totalEnergyBurnedInCanonicalUnit
{
  return self->_totalEnergyBurnedInCanonicalUnit;
}

- (double)totalBasalEnergyBurnedInCanonicalUnit
{
  return self->_totalBasalEnergyBurnedInCanonicalUnit;
}

- (double)totalDistanceInCanonicalUnit
{
  return self->_totalDistanceInCanonicalUnit;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (double)goalInCanonicalUnit
{
  return self->_goalInCanonicalUnit;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (BOOL)isWatchWorkout
{
  return self->_isWatchWorkout;
}

- (BOOL)isIndoorWorkout
{
  return self->_isIndoorWorkout;
}

- (NSString)deviceManufacturer
{
  return self->_deviceManufacturer;
}

- (void)setDeviceManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManufacturer, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (int64_t)amm
{
  return self->_amm;
}

- (NSString)seymourCatalogWorkoutIdentifier
{
  return self->_seymourCatalogWorkoutIdentifier;
}

- (void)setSeymourCatalogWorkoutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_seymourCatalogWorkoutIdentifier, a3);
}

- (NSString)seymourMediaType
{
  return self->_seymourMediaType;
}

- (void)setSeymourMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_seymourMediaType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seymourMediaType, 0);
  objc_storeStrong((id *)&self->_seymourCatalogWorkoutIdentifier, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceManufacturer, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (BOOL)isAmm
{
  return -[ASCodableCloudKitWorkout amm](self, "amm") == 2;
}

@end
