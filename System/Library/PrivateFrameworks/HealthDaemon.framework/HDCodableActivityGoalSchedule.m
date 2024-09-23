@implementation HDCodableActivityGoalSchedule

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setGoalType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_goalType = a3;
}

- (void)setHasGoalType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGoalType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUnitString
{
  return self->_unitString != 0;
}

- (void)setMondayGoal:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mondayGoal = a3;
}

- (void)setHasMondayGoal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMondayGoal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTuesdayGoal:(double)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_tuesdayGoal = a3;
}

- (void)setHasTuesdayGoal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTuesdayGoal
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setWednesdayGoal:(double)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_wednesdayGoal = a3;
}

- (void)setHasWednesdayGoal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasWednesdayGoal
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setThursdayGoal:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_thursdayGoal = a3;
}

- (void)setHasThursdayGoal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasThursdayGoal
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setFridayGoal:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fridayGoal = a3;
}

- (void)setHasFridayGoal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFridayGoal
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSaturdayGoal:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_saturdayGoal = a3;
}

- (void)setHasSaturdayGoal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSaturdayGoal
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSundayGoal:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sundayGoal = a3;
}

- (void)setHasSundayGoal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSundayGoal
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)HDCodableActivityGoalSchedule;
  -[HDCodableActivityGoalSchedule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableActivityGoalSchedule dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *unitString;
  char has;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_goalType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("goalType"));

  }
  unitString = self->_unitString;
  if (unitString)
    objc_msgSend(v3, "setObject:forKey:", unitString, CFSTR("unitString"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mondayGoal);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mondayGoal"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_tuesdayGoal);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("tuesdayGoal"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_wednesdayGoal);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("wednesdayGoal"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thursdayGoal);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("thursdayGoal"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_saturdayGoal);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("saturdayGoal"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_14;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_fridayGoal);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("fridayGoal"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_13:
  if ((has & 0x10) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sundayGoal);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sundayGoal"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableActivityGoalScheduleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_unitString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
LABEL_21:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_13:
  if ((has & 0x10) != 0)
  {
LABEL_14:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_15:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_goalType;
    *((_BYTE *)v4 + 88) |= 2u;
  }
  if (self->_unitString)
  {
    objc_msgSend(v6, "setUnitString:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_mondayGoal;
    *((_BYTE *)v4 + 88) |= 4u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_tuesdayGoal;
  *((_BYTE *)v4 + 88) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_wednesdayGoal;
  *((_BYTE *)v4 + 88) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 1) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_thursdayGoal;
  *((_BYTE *)v4 + 88) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
LABEL_21:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_saturdayGoal;
    *((_BYTE *)v4 + 88) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_fridayGoal;
  *((_BYTE *)v4 + 88) |= 1u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_13:
  if ((has & 0x10) != 0)
  {
LABEL_14:
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_sundayGoal;
    *((_BYTE *)v4 + 88) |= 0x10u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_goalType;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_unitString, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_mondayGoal;
    *(_BYTE *)(v5 + 88) |= 4u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 56) = self->_tuesdayGoal;
  *(_BYTE *)(v5 + 88) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *(double *)(v5 + 64) = self->_wednesdayGoal;
  *(_BYTE *)(v5 + 88) |= 0x80u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *(double *)(v5 + 48) = self->_thursdayGoal;
  *(_BYTE *)(v5 + 88) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_17:
    *(double *)(v5 + 32) = self->_saturdayGoal;
    *(_BYTE *)(v5 + 88) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v5;
    goto LABEL_10;
  }
LABEL_16:
  *(double *)(v5 + 8) = self->_fridayGoal;
  *(_BYTE *)(v5 + 88) |= 1u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_17;
LABEL_9:
  if ((has & 0x10) != 0)
  {
LABEL_10:
    *(double *)(v5 + 40) = self->_sundayGoal;
    *(_BYTE *)(v5 + 88) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  char has;
  char v7;
  NSString *unitString;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 9))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_46;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 88);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_goalType != *((_QWORD *)v4 + 2))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_46;
  }
  unitString = self->_unitString;
  if ((unint64_t)unitString | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](unitString, "isEqual:"))
      goto LABEL_46;
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 88);
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_mondayGoal != *((double *)v4 + 3))
      goto LABEL_46;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_tuesdayGoal != *((double *)v4 + 7))
      goto LABEL_46;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x80) == 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_24;
LABEL_46:
    v9 = 0;
    goto LABEL_47;
  }
  if ((v7 & 0x80) == 0 || self->_wednesdayGoal != *((double *)v4 + 8))
    goto LABEL_46;
LABEL_24:
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_thursdayGoal != *((double *)v4 + 6))
      goto LABEL_46;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_fridayGoal != *((double *)v4 + 1))
      goto LABEL_46;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_saturdayGoal != *((double *)v4 + 4))
      goto LABEL_46;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_46;
  }
  v9 = (v7 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_sundayGoal != *((double *)v4 + 5))
      goto LABEL_46;
    v9 = 1;
  }
LABEL_47:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double mondayGoal;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double tuesdayGoal;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double wednesdayGoal;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  double thursdayGoal;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  double fridayGoal;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  double saturdayGoal;
  double v33;
  long double v34;
  double v35;
  unint64_t v36;
  double sundayGoal;
  double v38;
  long double v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v44;
  unint64_t v45;

  v45 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = -[NSString hash](self->_unitString, "hash", 2654435761 * self->_goalType);
  else
    v3 = -[NSString hash](self->_unitString, "hash", 0);
  v4 = v3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    mondayGoal = self->_mondayGoal;
    v8 = -mondayGoal;
    if (mondayGoal >= 0.0)
      v8 = self->_mondayGoal;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 0x40) != 0)
  {
    tuesdayGoal = self->_tuesdayGoal;
    v13 = -tuesdayGoal;
    if (tuesdayGoal >= 0.0)
      v13 = self->_tuesdayGoal;
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
  if (has < 0)
  {
    wednesdayGoal = self->_wednesdayGoal;
    v18 = -wednesdayGoal;
    if (wednesdayGoal >= 0.0)
      v18 = self->_wednesdayGoal;
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
  if ((has & 0x20) != 0)
  {
    thursdayGoal = self->_thursdayGoal;
    v23 = -thursdayGoal;
    if (thursdayGoal >= 0.0)
      v23 = self->_thursdayGoal;
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
  if ((has & 1) != 0)
  {
    fridayGoal = self->_fridayGoal;
    v28 = -fridayGoal;
    if (fridayGoal >= 0.0)
      v28 = self->_fridayGoal;
    v29 = floor(v28 + 0.5);
    v30 = (v28 - v29) * 1.84467441e19;
    v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0)
        v26 += (unint64_t)v30;
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    v26 = 0;
  }
  if ((has & 8) != 0)
  {
    saturdayGoal = self->_saturdayGoal;
    v33 = -saturdayGoal;
    if (saturdayGoal >= 0.0)
      v33 = self->_saturdayGoal;
    v34 = floor(v33 + 0.5);
    v35 = (v33 - v34) * 1.84467441e19;
    v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0)
        v31 += (unint64_t)v35;
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    v31 = 0;
  }
  if ((has & 0x10) == 0)
  {
    v36 = 0;
LABEL_58:
    v42 = v44;
    v41 = v45;
    return v42 ^ v41 ^ v4 ^ v6 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v36;
  }
  sundayGoal = self->_sundayGoal;
  v38 = -sundayGoal;
  if (sundayGoal >= 0.0)
    v38 = self->_sundayGoal;
  v39 = floor(v38 + 0.5);
  v40 = (v38 - v39) * 1.84467441e19;
  v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
  if (v40 < 0.0)
  {
    v36 -= (unint64_t)fabs(v40);
    goto LABEL_58;
  }
  v42 = v44;
  v41 = v45;
  if (v40 > 0.0)
    v36 += (unint64_t)v40;
  return v42 ^ v41 ^ v4 ^ v6 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v36;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 9);
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
    -[HDCodableActivityGoalSchedule setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    self->_goalType = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[HDCodableActivityGoalSchedule setUnitString:](self, "setUnitString:");
    v4 = v8;
  }
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 4) != 0)
  {
    self->_mondayGoal = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v4 + 88);
    if ((v7 & 0x40) == 0)
    {
LABEL_13:
      if ((v7 & 0x80) == 0)
        goto LABEL_14;
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x40) == 0)
  {
    goto LABEL_13;
  }
  self->_tuesdayGoal = *((double *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x40u;
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 0x80) == 0)
  {
LABEL_14:
    if ((v7 & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  self->_wednesdayGoal = *((double *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x80u;
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 0x20) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  self->_thursdayGoal = *((double *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 1) == 0)
  {
LABEL_16:
    if ((v7 & 8) == 0)
      goto LABEL_17;
LABEL_25:
    self->_saturdayGoal = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 88) & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_24:
  self->_fridayGoal = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v7 = *((_BYTE *)v4 + 88);
  if ((v7 & 8) != 0)
    goto LABEL_25;
LABEL_17:
  if ((v7 & 0x10) != 0)
  {
LABEL_18:
    self->_sundayGoal = *((double *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_19:

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_unitString, a3);
}

- (double)mondayGoal
{
  return self->_mondayGoal;
}

- (double)tuesdayGoal
{
  return self->_tuesdayGoal;
}

- (double)wednesdayGoal
{
  return self->_wednesdayGoal;
}

- (double)thursdayGoal
{
  return self->_thursdayGoal;
}

- (double)fridayGoal
{
  return self->_fridayGoal;
}

- (double)saturdayGoal
{
  return self->_saturdayGoal;
}

- (double)sundayGoal
{
  return self->_sundayGoal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  char v6;
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
  id v23;
  BOOL v24;
  void *v25;
  objc_class *v26;
  void *v27;
  NSObject *v28;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v4 = a3;
  if (self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HDCodableActivityGoalSchedule sample](self, "sample");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "applyToObject:", v4);

      if ((v6 & 1) != 0)
      {
        objc_msgSend(v4, "setGoalType:", -[HDCodableActivityGoalSchedule goalType](self, "goalType"));
        -[HDCodableActivityGoalSchedule unitString](self, "unitString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0CB6A28];
        -[HDCodableActivityGoalSchedule mondayGoal](self, "mondayGoal");
        objc_msgSend(v9, "quantityWithUnit:doubleValue:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setMondayGoal:", v10);

        v11 = (void *)MEMORY[0x1E0CB6A28];
        -[HDCodableActivityGoalSchedule tuesdayGoal](self, "tuesdayGoal");
        objc_msgSend(v11, "quantityWithUnit:doubleValue:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setTuesdayGoal:", v12);

        v13 = (void *)MEMORY[0x1E0CB6A28];
        -[HDCodableActivityGoalSchedule wednesdayGoal](self, "wednesdayGoal");
        objc_msgSend(v13, "quantityWithUnit:doubleValue:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setWednesdayGoal:", v14);

        v15 = (void *)MEMORY[0x1E0CB6A28];
        -[HDCodableActivityGoalSchedule thursdayGoal](self, "thursdayGoal");
        objc_msgSend(v15, "quantityWithUnit:doubleValue:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setThursdayGoal:", v16);

        v17 = (void *)MEMORY[0x1E0CB6A28];
        -[HDCodableActivityGoalSchedule fridayGoal](self, "fridayGoal");
        objc_msgSend(v17, "quantityWithUnit:doubleValue:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setFridayGoal:", v18);

        v19 = (void *)MEMORY[0x1E0CB6A28];
        -[HDCodableActivityGoalSchedule saturdayGoal](self, "saturdayGoal");
        objc_msgSend(v19, "quantityWithUnit:doubleValue:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSaturdayGoal:", v20);

        v21 = (void *)MEMORY[0x1E0CB6A28];
        -[HDCodableActivityGoalSchedule sundayGoal](self, "sundayGoal");
        objc_msgSend(v21, "quantityWithUnit:doubleValue:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setSundayGoal:", v22);

        v23 = 0;
        v24 = 1;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v30, 3, CFSTR("Failed to decode superclass message"));
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hk_assignError:code:format:", &v30, 3, CFSTR("Unexpected class %@"), v27);

    }
  }

  v23 = v30;
  _HKInitializeLogging();
  v28 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v23;
    _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "Failed to decode object of type HKActivityGoalSchedule with error %@", buf, 0xCu);
  }
  v24 = 0;
LABEL_10:

  return v24;
}

@end
