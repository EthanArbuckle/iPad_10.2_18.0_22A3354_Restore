@implementation HKCodableMenstrualCyclesProjection

- (void)setStartMean:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_startMean = a3;
}

- (void)setHasStartMean:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStartMean
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setStartStandardDeviation:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_startStandardDeviation = a3;
}

- (void)setHasStartStandardDeviation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartStandardDeviation
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEndMean:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endMean = a3;
}

- (void)setHasEndMean:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndMean
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEndStandardDeviation:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endStandardDeviation = a3;
}

- (void)setHasEndStandardDeviation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndStandardDeviation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAllDays
{
  return self->_allDays != 0;
}

- (void)setIsPartiallyLogged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isPartiallyLogged = a3;
}

- (void)setHasIsPartiallyLogged:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsPartiallyLogged
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDaysOffsetFromCalendarMethod:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_daysOffsetFromCalendarMethod = a3;
}

- (void)setHasDaysOffsetFromCalendarMethod:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDaysOffsetFromCalendarMethod
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPredictionPrimarySource:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_predictionPrimarySource = a3;
}

- (void)setHasPredictionPrimarySource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPredictionPrimarySource
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)HKCodableMenstrualCyclesProjection;
  -[HKCodableMenstrualCyclesProjection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableMenstrualCyclesProjection dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HKCodableDayIndexRange *allDays;
  void *v7;
  char v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startMean);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("startMean"));

    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startStandardDeviation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("startStandardDeviation"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endMean);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("endMean"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endStandardDeviation);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("endStandardDeviation"));

  }
LABEL_6:
  allDays = self->_allDays;
  if (allDays)
  {
    -[HKCodableDayIndexRange dictionaryRepresentation](allDays, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("allDays"));

  }
  v8 = (char)self->_has;
  if ((v8 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_10;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_daysOffsetFromCalendarMethod);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("daysOffsetFromCalendarMethod"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPartiallyLogged);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("isPartiallyLogged"));

  v8 = (char)self->_has;
  if ((v8 & 1) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v8 & 8) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_predictionPrimarySource);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("predictionPrimarySource"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableMenstrualCyclesProjectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:
  if (self->_allDays)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_has;
  if ((v5 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_10;
LABEL_18:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v5 = (char)self->_has;
  if ((v5 & 1) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v5 & 8) != 0)
LABEL_11:
    PBDataWriterWriteInt64Field();
LABEL_12:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[5] = *(_QWORD *)&self->_startMean;
    *((_BYTE *)v4 + 68) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = *(_QWORD *)&self->_startStandardDeviation;
  *((_BYTE *)v4 + 68) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  v4[2] = *(_QWORD *)&self->_endMean;
  *((_BYTE *)v4 + 68) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v4[3] = *(_QWORD *)&self->_endStandardDeviation;
    *((_BYTE *)v4 + 68) |= 4u;
  }
LABEL_6:
  if (self->_allDays)
  {
    v7 = v4;
    objc_msgSend(v4, "setAllDays:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_10;
LABEL_18:
    v4[1] = self->_daysOffsetFromCalendarMethod;
    *((_BYTE *)v4 + 68) |= 1u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  *((_BYTE *)v4 + 64) = self->_isPartiallyLogged;
  *((_BYTE *)v4 + 68) |= 0x40u;
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_18;
LABEL_10:
  if ((v6 & 8) != 0)
  {
LABEL_11:
    v4[4] = self->_predictionPrimarySource;
    *((_BYTE *)v4 + 68) |= 8u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_startMean;
    *(_BYTE *)(v5 + 68) |= 0x10u;
    has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_startStandardDeviation;
  *(_BYTE *)(v5 + 68) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  *(double *)(v5 + 16) = self->_endMean;
  *(_BYTE *)(v5 + 68) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(double *)(v5 + 24) = self->_endStandardDeviation;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
LABEL_6:
  v8 = -[HKCodableDayIndexRange copyWithZone:](self->_allDays, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v8;

  v10 = (char)self->_has;
  if ((v10 & 0x40) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_8;
LABEL_16:
    *(_QWORD *)(v6 + 8) = self->_daysOffsetFromCalendarMethod;
    *(_BYTE *)(v6 + 68) |= 1u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return (id)v6;
    goto LABEL_9;
  }
  *(_BYTE *)(v6 + 64) = self->_isPartiallyLogged;
  *(_BYTE *)(v6 + 68) |= 0x40u;
  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
    goto LABEL_16;
LABEL_8:
  if ((v10 & 8) != 0)
  {
LABEL_9:
    *(_QWORD *)(v6 + 32) = self->_predictionPrimarySource;
    *(_BYTE *)(v6 + 68) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  HKCodableDayIndexRange *allDays;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_startMean != *((double *)v4 + 5))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x20) == 0 || self->_startStandardDeviation != *((double *)v4 + 6))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_endMean != *((double *)v4 + 2))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_endStandardDeviation != *((double *)v4 + 3))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_42;
  }
  allDays = self->_allDays;
  if ((unint64_t)allDays | *((_QWORD *)v4 + 7))
  {
    if (!-[HKCodableDayIndexRange isEqual:](allDays, "isEqual:"))
      goto LABEL_42;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x40) != 0)
    {
      if (self->_isPartiallyLogged)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_42;
        goto LABEL_33;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_33;
    }
LABEL_42:
    v7 = 0;
    goto LABEL_43;
  }
  if ((*((_BYTE *)v4 + 68) & 0x40) != 0)
    goto LABEL_42;
LABEL_33:
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_daysOffsetFromCalendarMethod != *((_QWORD *)v4 + 1))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_42;
  }
  v7 = (*((_BYTE *)v4 + 68) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_predictionPrimarySource != *((_QWORD *)v4 + 4))
      goto LABEL_42;
    v7 = 1;
  }
LABEL_43:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startMean;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double startStandardDeviation;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double endMean;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double endStandardDeviation;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    startMean = self->_startMean;
    v6 = -startMean;
    if (startMean >= 0.0)
      v6 = self->_startMean;
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
    startStandardDeviation = self->_startStandardDeviation;
    v11 = -startStandardDeviation;
    if (startStandardDeviation >= 0.0)
      v11 = self->_startStandardDeviation;
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
  if ((has & 2) != 0)
  {
    endMean = self->_endMean;
    v16 = -endMean;
    if (endMean >= 0.0)
      v16 = self->_endMean;
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
    endStandardDeviation = self->_endStandardDeviation;
    v21 = -endStandardDeviation;
    if (endStandardDeviation >= 0.0)
      v21 = self->_endStandardDeviation;
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
  v24 = -[HKCodableDayIndexRange hash](self->_allDays, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    v25 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_35;
LABEL_38:
    v26 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_36;
LABEL_39:
    v27 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v25 ^ v26 ^ v27 ^ v24;
  }
  v25 = 2654435761 * self->_isPartiallyLogged;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_38;
LABEL_35:
  v26 = 2654435761 * self->_daysOffsetFromCalendarMethod;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_39;
LABEL_36:
  v27 = 2654435761 * self->_predictionPrimarySource;
  return v9 ^ v4 ^ v14 ^ v19 ^ v25 ^ v26 ^ v27 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  HKCodableDayIndexRange *allDays;
  uint64_t v8;
  char v9;
  double *v10;

  v4 = (double *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 68);
  if ((v6 & 0x10) != 0)
  {
    self->_startMean = v4[5];
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 68);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_startStandardDeviation = v4[6];
  *(_BYTE *)&self->_has |= 0x20u;
  v6 = *((_BYTE *)v4 + 68);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_endMean = v4[2];
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
LABEL_5:
    self->_endStandardDeviation = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:
  allDays = self->_allDays;
  v8 = *((_QWORD *)v5 + 7);
  if (allDays)
  {
    if (!v8)
      goto LABEL_16;
    v10 = v5;
    -[HKCodableDayIndexRange mergeFrom:](allDays, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_16;
    v10 = v5;
    -[HKCodableMenstrualCyclesProjection setAllDays:](self, "setAllDays:");
  }
  v5 = v10;
LABEL_16:
  v9 = *((_BYTE *)v5 + 68);
  if ((v9 & 0x40) == 0)
  {
    if ((*((_BYTE *)v5 + 68) & 1) == 0)
      goto LABEL_18;
LABEL_22:
    self->_daysOffsetFromCalendarMethod = (int64_t)v5[1];
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v5 + 68) & 8) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  self->_isPartiallyLogged = *((_BYTE *)v5 + 64);
  *(_BYTE *)&self->_has |= 0x40u;
  v9 = *((_BYTE *)v5 + 68);
  if ((v9 & 1) != 0)
    goto LABEL_22;
LABEL_18:
  if ((v9 & 8) != 0)
  {
LABEL_19:
    self->_predictionPrimarySource = (int64_t)v5[4];
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_20:

}

- (double)startMean
{
  return self->_startMean;
}

- (double)startStandardDeviation
{
  return self->_startStandardDeviation;
}

- (double)endMean
{
  return self->_endMean;
}

- (double)endStandardDeviation
{
  return self->_endStandardDeviation;
}

- (HKCodableDayIndexRange)allDays
{
  return self->_allDays;
}

- (void)setAllDays:(id)a3
{
  objc_storeStrong((id *)&self->_allDays, a3);
}

- (BOOL)isPartiallyLogged
{
  return self->_isPartiallyLogged;
}

- (int64_t)daysOffsetFromCalendarMethod
{
  return self->_daysOffsetFromCalendarMethod;
}

- (int64_t)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allDays, 0);
}

@end
