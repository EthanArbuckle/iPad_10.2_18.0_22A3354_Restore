@implementation HKCodableHandwashingEvent

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAverageDuration
{
  return self->_averageDuration != 0;
}

- (void)setCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAverageDailyCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_averageDailyCount = a3;
}

- (void)setHasAverageDailyCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverageDailyCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMeetsGoal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_meetsGoal = a3;
}

- (void)setHasMeetsGoal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMeetsGoal
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)HKCodableHandwashingEvent;
  -[HKCodableHandwashingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableHandwashingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HKCodableQuantity *averageDuration;
  void *v8;
  char v9;
  void *v10;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startDate"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("endDate"));

  }
  averageDuration = self->_averageDuration;
  if (averageDuration)
  {
    -[HKCodableQuantity dictionaryRepresentation](averageDuration, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("averageDuration"));

  }
  v9 = (char)self->_has;
  if ((v9 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_averageDailyCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("averageDailyCount"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_count);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("count"));

  v9 = (char)self->_has;
  if ((v9 & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v9 & 0x10) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_meetsGoal);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("meetsGoal"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHandwashingEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 4) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_averageDuration)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_has;
  if ((v5 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_13:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field();
  v5 = (char)self->_has;
  if ((v5 & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v5 & 0x10) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:

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
    v4[4] = *(_QWORD *)&self->_startDate;
    *((_BYTE *)v4 + 52) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 52) |= 4u;
  }
  if (self->_averageDuration)
  {
    v7 = v4;
    objc_msgSend(v4, "setAverageDuration:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_13:
    v4[1] = self->_averageDailyCount;
    *((_BYTE *)v4 + 52) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v4[2] = self->_count;
  *((_BYTE *)v4 + 52) |= 2u;
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v6 & 0x10) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 48) = self->_meetsGoal;
    *((_BYTE *)v4 + 52) |= 0x10u;
  }
LABEL_11:

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
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_startDate;
    *(_BYTE *)(v5 + 52) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_endDate;
    *(_BYTE *)(v5 + 52) |= 4u;
  }
  v8 = -[HKCodableQuantity copyWithZone:](self->_averageDuration, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = (char)self->_has;
  if ((v10 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
LABEL_11:
    *(_QWORD *)(v6 + 8) = self->_averageDailyCount;
    *(_BYTE *)(v6 + 52) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v6;
    goto LABEL_8;
  }
  *(_QWORD *)(v6 + 16) = self->_count;
  *(_BYTE *)(v6 + 52) |= 2u;
  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((v10 & 0x10) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 48) = self->_meetsGoal;
    *(_BYTE *)(v6 + 52) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  HKCodableQuantity *averageDuration;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_startDate != *((double *)v4 + 4))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_endDate != *((double *)v4 + 3))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_27;
  }
  averageDuration = self->_averageDuration;
  if ((unint64_t)averageDuration | *((_QWORD *)v4 + 5))
  {
    if (!-[HKCodableQuantity isEqual:](averageDuration, "isEqual:"))
      goto LABEL_27;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_count != *((_QWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_averageDailyCount != *((_QWORD *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_27;
  }
  v7 = (*((_BYTE *)v4 + 52) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
    {
      if (self->_meetsGoal)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_27;
      }
      else if (*((_BYTE *)v4 + 48))
      {
        goto LABEL_27;
      }
      v7 = 1;
      goto LABEL_28;
    }
LABEL_27:
    v7 = 0;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double startDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double endDate;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    startDate = self->_startDate;
    v6 = -startDate;
    if (startDate >= 0.0)
      v6 = self->_startDate;
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
  if ((has & 4) != 0)
  {
    endDate = self->_endDate;
    v11 = -endDate;
    if (endDate >= 0.0)
      v11 = self->_endDate;
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
  v14 = -[HKCodableQuantity hash](self->_averageDuration, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_19;
LABEL_22:
    v16 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_20;
LABEL_23:
    v17 = 0;
    return v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v14;
  }
  v15 = 2654435761 * self->_count;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_22;
LABEL_19:
  v16 = 2654435761 * self->_averageDailyCount;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_23;
LABEL_20:
  v17 = 2654435761 * self->_meetsGoal;
  return v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  HKCodableQuantity *averageDuration;
  uint64_t v8;
  char v9;
  double *v10;

  v4 = (double *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 52);
  if ((v6 & 8) != 0)
  {
    self->_startDate = v4[4];
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 52);
  }
  if ((v6 & 4) != 0)
  {
    self->_endDate = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
  averageDuration = self->_averageDuration;
  v8 = *((_QWORD *)v5 + 5);
  if (averageDuration)
  {
    if (!v8)
      goto LABEL_11;
    v10 = v5;
    -[HKCodableQuantity mergeFrom:](averageDuration, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v10 = v5;
    -[HKCodableHandwashingEvent setAverageDuration:](self, "setAverageDuration:");
  }
  v5 = v10;
LABEL_11:
  v9 = *((_BYTE *)v5 + 52);
  if ((v9 & 2) == 0)
  {
    if ((*((_BYTE *)v5 + 52) & 1) == 0)
      goto LABEL_13;
LABEL_17:
    self->_averageDailyCount = (int64_t)v5[1];
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v5 + 52) & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  self->_count = (int64_t)v5[2];
  *(_BYTE *)&self->_has |= 2u;
  v9 = *((_BYTE *)v5 + 52);
  if ((v9 & 1) != 0)
    goto LABEL_17;
LABEL_13:
  if ((v9 & 0x10) != 0)
  {
LABEL_14:
    self->_meetsGoal = *((_BYTE *)v5 + 48);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_15:

}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableQuantity)averageDuration
{
  return self->_averageDuration;
}

- (void)setAverageDuration:(id)a3
{
  objc_storeStrong((id *)&self->_averageDuration, a3);
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)averageDailyCount
{
  return self->_averageDailyCount;
}

- (BOOL)meetsGoal
{
  return self->_meetsGoal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageDuration, 0);
}

@end
