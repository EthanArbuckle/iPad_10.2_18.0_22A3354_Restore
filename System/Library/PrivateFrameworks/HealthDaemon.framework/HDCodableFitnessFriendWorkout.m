@implementation HDCodableFitnessFriendWorkout

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
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCodableFitnessFriendWorkout sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "applyToObject:", v4);
    if (v6)
    {
      if (-[HDCodableFitnessFriendWorkout hasFriendUUID](self, "hasFriendUUID"))
      {
        v7 = (void *)MEMORY[0x1E0CB3A28];
        -[HDCodableFitnessFriendWorkout friendUUID](self, "friendUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hk_UUIDWithData:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setFriendUUID:", v9);
      }
      -[HDCodableFitnessFriendWorkout duration](self, "duration");
      objc_msgSend(v4, "setDuration:");
      if (-[HDCodableFitnessFriendWorkout hasTotalEnergyBurnedInCanonicalUnit](self, "hasTotalEnergyBurnedInCanonicalUnit"))
      {
        v10 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalEnergyBurnedUnit();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableFitnessFriendWorkout totalEnergyBurnedInCanonicalUnit](self, "totalEnergyBurnedInCanonicalUnit");
        objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setTotalEnergyBurned:", v12);
      }
      if (-[HDCodableFitnessFriendWorkout hasTotalBasalEnergyBurnedInCanonicalUnit](self, "hasTotalBasalEnergyBurnedInCanonicalUnit"))
      {
        v13 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalEnergyBurnedUnit();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableFitnessFriendWorkout totalBasalEnergyBurnedInCanonicalUnit](self, "totalBasalEnergyBurnedInCanonicalUnit");
        objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setTotalBasalEnergyBurned:", v15);
      }
      if (-[HDCodableFitnessFriendWorkout hasTotalDistanceInCanonicalUnit](self, "hasTotalDistanceInCanonicalUnit"))
      {
        v16 = (void *)MEMORY[0x1E0CB6A28];
        _HKWorkoutCanonicalDistanceUnit();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableFitnessFriendWorkout totalDistanceInCanonicalUnit](self, "totalDistanceInCanonicalUnit");
        objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "setTotalDistance:", v18);
      }
      objc_msgSend(v4, "setWorkoutActivityType:", -[HDCodableFitnessFriendWorkout type](self, "type"));
      objc_msgSend(v4, "setGoalType:", -[HDCodableFitnessFriendWorkout goalType](self, "goalType"));
      if (-[HDCodableFitnessFriendWorkout hasGoal](self, "hasGoal"))
      {
        objc_msgSend(v4, "goalType");
        if (_HKWorkoutGoalTypeIsValidForGoal())
        {
          v19 = (void *)MEMORY[0x1E0CB6A28];
          -[HDCodableFitnessFriendWorkout goalType](self, "goalType");
          _HKWorkoutCanonicalUnitForGoalType();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableFitnessFriendWorkout goal](self, "goal");
          objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "setGoal:", v21);
        }
      }
      -[HDCodableFitnessFriendWorkout bundleID](self, "bundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBundleID:", v22);

      objc_msgSend(v4, "setIsWatchWorkout:", -[HDCodableFitnessFriendWorkout isWatchWorkout](self, "isWatchWorkout") != 0);
      objc_msgSend(v4, "setIsIndoorWorkout:", -[HDCodableFitnessFriendWorkout isIndoorWorkout](self, "isIndoorWorkout") != 0);
      objc_msgSend(v4, "setAmm:", -[HDCodableFitnessFriendWorkout amm](self, "amm"));
      if (-[HDCodableFitnessFriendWorkout hasDeviceManufacturer](self, "hasDeviceManufacturer"))
      {
        -[HDCodableFitnessFriendWorkout deviceManufacturer](self, "deviceManufacturer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setDeviceManufacturer:", v23);

      }
      if (-[HDCodableFitnessFriendWorkout hasDeviceModel](self, "hasDeviceModel"))
      {
        -[HDCodableFitnessFriendWorkout deviceModel](self, "deviceModel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setDeviceModel:", v24);

      }
      -[HDCodableFitnessFriendWorkout seymourCatalogWorkoutIdentifier](self, "seymourCatalogWorkoutIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[HDCodableFitnessFriendWorkout seymourCatalogWorkoutIdentifier](self, "seymourCatalogWorkoutIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSeymourCatalogWorkoutIdentifier:", v26);

      }
      -[HDCodableFitnessFriendWorkout seymourMediaType](self, "seymourMediaType");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[HDCodableFitnessFriendWorkout seymourMediaType](self, "seymourMediaType");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSeymourMediaType:", v28);

      }
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (void)setType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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
  *(_WORD *)&self->_has |= 0x100u;
  self->_totalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTotalEnergyBurnedInCanonicalUnit
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_totalBasalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTotalBasalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTotalDistanceInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_totalDistanceInCanonicalUnit = a3;
}

- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTotalDistanceInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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

- (void)setGoal:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_goal = a3;
}

- (void)setHasGoal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGoal
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setIsWatchWorkout:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isWatchWorkout = a3;
}

- (void)setHasIsWatchWorkout:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsWatchWorkout
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsIndoorWorkout:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isIndoorWorkout = a3;
}

- (void)setHasIsIndoorWorkout:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsIndoorWorkout
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableFitnessFriendWorkout;
  -[HDCodableFitnessFriendWorkout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableFitnessFriendWorkout dictionaryRepresentation](self, "dictionaryRepresentation");
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
  __int16 has;
  void *v8;
  NSString *bundleID;
  __int16 v10;
  void *v11;
  void *v12;
  NSString *deviceManufacturer;
  NSString *deviceModel;
  void *v15;
  NSString *seymourCatalogWorkoutIdentifier;
  NSString *seymourMediaType;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

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
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("type"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("duration"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalEnergyBurnedInCanonicalUnit);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("totalEnergyBurnedInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalBasalEnergyBurnedInCanonicalUnit);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("totalBasalEnergyBurnedInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalDistanceInCanonicalUnit);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("totalDistanceInCanonicalUnit"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_goalType);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("goalType"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_goal);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("goal"));

  }
LABEL_13:
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v3, "setObject:forKey:", bundleID, CFSTR("bundleID"));
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_isWatchWorkout);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isWatchWorkout"));

    v10 = (__int16)self->_has;
  }
  if ((v10 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_isIndoorWorkout);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("isIndoorWorkout"));

  }
  deviceManufacturer = self->_deviceManufacturer;
  if (deviceManufacturer)
    objc_msgSend(v3, "setObject:forKey:", deviceManufacturer, CFSTR("deviceManufacturer"));
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("deviceModel"));
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_amm);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("amm"));

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
  return HDCodableFitnessFriendWorkoutReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_friendUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
LABEL_13:
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
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
  if (self->_friendUUID)
  {
    objc_msgSend(v7, "setFriendUUID:");
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_QWORD *)v4 + 10) = self->_type;
    *((_WORD *)v4 + 72) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_duration;
  *((_WORD *)v4 + 72) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_33;
  }
LABEL_32:
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_totalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v4 + 72) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_34;
  }
LABEL_33:
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_totalBasalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v4 + 72) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_totalDistanceInCanonicalUnit;
  *((_WORD *)v4 + 72) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_35:
  *((_QWORD *)v4 + 4) = self->_goalType;
  *((_WORD *)v4 + 72) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_goal;
    *((_WORD *)v4 + 72) |= 4u;
  }
LABEL_13:
  if (self->_bundleID)
  {
    objc_msgSend(v7, "setBundleID:");
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_QWORD *)v4 + 6) = self->_isWatchWorkout;
    *((_WORD *)v4 + 72) |= 0x20u;
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = self->_isIndoorWorkout;
    *((_WORD *)v4 + 72) |= 0x10u;
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
    *((_WORD *)v4 + 72) |= 1u;
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
  uint64_t v8;
  void *v9;
  __int16 has;
  uint64_t v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v6;

  v8 = -[NSData copyWithZone:](self->_friendUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v8;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_type;
    *(_WORD *)(v5 + 144) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_duration;
  *(_WORD *)(v5 + 144) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 72) = self->_totalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 144) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 56) = self->_totalBasalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 144) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 64) = self->_totalDistanceInCanonicalUnit;
  *(_WORD *)(v5 + 144) |= 0x80u;
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
  *(_WORD *)(v5 + 144) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_8:
    *(double *)(v5 + 24) = self->_goal;
    *(_WORD *)(v5 + 144) |= 4u;
  }
LABEL_9:
  v11 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v11;

  v13 = (__int16)self->_has;
  if ((v13 & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_isWatchWorkout;
    *(_WORD *)(v5 + 144) |= 0x20u;
    v13 = (__int16)self->_has;
  }
  if ((v13 & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_isIndoorWorkout;
    *(_WORD *)(v5 + 144) |= 0x10u;
  }
  v14 = -[NSString copyWithZone:](self->_deviceManufacturer, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v14;

  v16 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v16;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_amm;
    *(_WORD *)(v5 + 144) |= 1u;
  }
  v18 = -[NSString copyWithZone:](self->_seymourCatalogWorkoutIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v18;

  v20 = -[NSString copyWithZone:](self->_seymourMediaType, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  NSData *friendUUID;
  __int16 has;
  __int16 v8;
  NSString *bundleID;
  NSString *deviceManufacturer;
  NSString *deviceModel;
  __int16 v12;
  NSString *seymourCatalogWorkoutIdentifier;
  NSString *seymourMediaType;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 15))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_67;
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:"))
      goto LABEL_67;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 72);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x200) == 0 || self->_type != *((_QWORD *)v4 + 10))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 72) & 0x200) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_duration != *((double *)v4 + 2))
      goto LABEL_67;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x100) == 0 || self->_totalEnergyBurnedInCanonicalUnit != *((double *)v4 + 9))
      goto LABEL_67;
  }
  else if ((*((_WORD *)v4 + 72) & 0x100) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_totalBasalEnergyBurnedInCanonicalUnit != *((double *)v4 + 7))
      goto LABEL_67;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_totalDistanceInCanonicalUnit != *((double *)v4 + 8))
      goto LABEL_67;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_goalType != *((_QWORD *)v4 + 4))
      goto LABEL_67;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_goal != *((double *)v4 + 3))
      goto LABEL_67;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_67;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
    {
LABEL_67:
      v15 = 0;
      goto LABEL_68;
    }
    has = (__int16)self->_has;
    v8 = *((_WORD *)v4 + 72);
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_isWatchWorkout != *((_QWORD *)v4 + 6))
      goto LABEL_67;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_isIndoorWorkout != *((_QWORD *)v4 + 5))
      goto LABEL_67;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  deviceManufacturer = self->_deviceManufacturer;
  if ((unint64_t)deviceManufacturer | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](deviceManufacturer, "isEqual:"))
  {
    goto LABEL_67;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_67;
  }
  v12 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_amm != *((_QWORD *)v4 + 1))
      goto LABEL_67;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_67;
  }
  seymourCatalogWorkoutIdentifier = self->_seymourCatalogWorkoutIdentifier;
  if ((unint64_t)seymourCatalogWorkoutIdentifier | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](seymourCatalogWorkoutIdentifier, "isEqual:"))
  {
    goto LABEL_67;
  }
  seymourMediaType = self->_seymourMediaType;
  if ((unint64_t)seymourMediaType | *((_QWORD *)v4 + 17))
    v15 = -[NSString isEqual:](seymourMediaType, "isEqual:");
  else
    v15 = 1;
LABEL_68:

  return v15;
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
  double goal;
  double v26;
  long double v27;
  double v28;
  NSUInteger v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  uint64_t v35;
  unint64_t v36;
  NSUInteger v37;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;

  v45 = -[HDCodableSample hash](self->_sample, "hash");
  v44 = -[NSData hash](self->_friendUUID, "hash");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v43 = 2654435761 * self->_type;
    if ((has & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v43 = 0;
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
  if ((has & 0x100) != 0)
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
  if ((has & 0x40) != 0)
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
  v42 = v9;
  if ((has & 0x80) != 0)
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
  if ((has & 8) != 0)
    v39 = 2654435761 * self->_goalType;
  else
    v39 = 0;
  v41 = v14;
  if ((has & 4) != 0)
  {
    goal = self->_goal;
    v26 = -goal;
    if (goal >= 0.0)
      v26 = self->_goal;
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
  v29 = -[NSString hash](self->_bundleID, "hash", v39);
  v30 = (__int16)self->_has;
  if ((v30 & 0x20) != 0)
  {
    v31 = 2654435761 * self->_isWatchWorkout;
    if ((v30 & 0x10) != 0)
      goto LABEL_48;
  }
  else
  {
    v31 = 0;
    if ((v30 & 0x10) != 0)
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
  v36 = v44 ^ v45 ^ v43 ^ v8 ^ v42 ^ v41 ^ v19 ^ v40 ^ v24 ^ v29 ^ v31 ^ v32 ^ v33 ^ v34;
  v37 = v35 ^ -[NSString hash](self->_seymourCatalogWorkoutIdentifier, "hash");
  return v36 ^ v37 ^ -[NSString hash](self->_seymourMediaType, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  id v9;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 15);
  v9 = v4;
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
    -[HDCodableFitnessFriendWorkout setSample:](self, "setSample:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 14))
  {
    -[HDCodableFitnessFriendWorkout setFriendUUID:](self, "setFriendUUID:");
    v4 = v9;
  }
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x200) != 0)
  {
    self->_type = *((_QWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x200u;
    v7 = *((_WORD *)v4 + 72);
    if ((v7 & 2) == 0)
    {
LABEL_11:
      if ((v7 & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_36;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_duration = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  self->_totalEnergyBurnedInCanonicalUnit = *((double *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x40) == 0)
  {
LABEL_13:
    if ((v7 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_38;
  }
LABEL_37:
  self->_totalBasalEnergyBurnedInCanonicalUnit = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x80) == 0)
  {
LABEL_14:
    if ((v7 & 8) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_38:
  self->_totalDistanceInCanonicalUnit = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v7 = *((_WORD *)v4 + 72);
  if ((v7 & 8) == 0)
  {
LABEL_15:
    if ((v7 & 4) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_39:
  self->_goalType = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 72) & 4) != 0)
  {
LABEL_16:
    self->_goal = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_17:
  if (*((_QWORD *)v4 + 11))
  {
    -[HDCodableFitnessFriendWorkout setBundleID:](self, "setBundleID:");
    v4 = v9;
  }
  v8 = *((_WORD *)v4 + 72);
  if ((v8 & 0x20) != 0)
  {
    self->_isWatchWorkout = *((_QWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    v8 = *((_WORD *)v4 + 72);
  }
  if ((v8 & 0x10) != 0)
  {
    self->_isIndoorWorkout = *((_QWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[HDCodableFitnessFriendWorkout setDeviceManufacturer:](self, "setDeviceManufacturer:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[HDCodableFitnessFriendWorkout setDeviceModel:](self, "setDeviceModel:");
    v4 = v9;
  }
  if ((*((_WORD *)v4 + 72) & 1) != 0)
  {
    self->_amm = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[HDCodableFitnessFriendWorkout setSeymourCatalogWorkoutIdentifier:](self, "setSeymourCatalogWorkoutIdentifier:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[HDCodableFitnessFriendWorkout setSeymourMediaType:](self, "setSeymourMediaType:");
    v4 = v9;
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
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

- (double)goal
{
  return self->_goal;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (int64_t)isWatchWorkout
{
  return self->_isWatchWorkout;
}

- (int64_t)isIndoorWorkout
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
  objc_storeStrong((id *)&self->_friendUUID, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceManufacturer, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
