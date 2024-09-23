@implementation HDCodableMedicationScheduleIntervalData

- (BOOL)hasStartTimeComponents
{
  return self->_startTimeComponents != 0;
}

- (void)setDayOfWeek:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDayOfWeek
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCycleIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cycleIndex = a3;
}

- (void)setHasCycleIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCycleIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCycleIntervalDays:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cycleIntervalDays = a3;
}

- (void)setHasCycleIntervalDays:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCycleIntervalDays
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDose:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_dose = a3;
}

- (void)setHasDose:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDose
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
  v8.super_class = (Class)HDCodableMedicationScheduleIntervalData;
  -[HDCodableMedicationScheduleIntervalData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationScheduleIntervalData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableDateComponents *startTimeComponents;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  startTimeComponents = self->_startTimeComponents;
  if (startTimeComponents)
  {
    -[HDCodableDateComponents dictionaryRepresentation](startTimeComponents, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startTimeComponents"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dayOfWeek);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dayOfWeek"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_cycleIntervalDays);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cycleIntervalDays"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_cycleIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("cycleIndex"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dose);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dose"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationScheduleIntervalDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_startTimeComponents)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteInt64Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_startTimeComponents)
  {
    v6 = v4;
    objc_msgSend(v4, "setStartTimeComponents:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_dayOfWeek;
    *((_BYTE *)v4 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      *((_QWORD *)v4 + 2) = self->_cycleIntervalDays;
      *((_BYTE *)v4 + 48) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 1) = self->_cycleIndex;
  *((_BYTE *)v4 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_dose;
    *((_BYTE *)v4 + 48) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableDateComponents copyWithZone:](self->_startTimeComponents, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_dayOfWeek;
    *(_BYTE *)(v5 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 16) = self->_cycleIntervalDays;
      *(_BYTE *)(v5 + 48) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_cycleIndex;
  *(_BYTE *)(v5 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(double *)(v5 + 32) = self->_dose;
    *(_BYTE *)(v5 + 48) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableDateComponents *startTimeComponents;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  startTimeComponents = self->_startTimeComponents;
  if ((unint64_t)startTimeComponents | *((_QWORD *)v4 + 5))
  {
    if (!-[HDCodableDateComponents isEqual:](startTimeComponents, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_dayOfWeek != *((_QWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_cycleIndex != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_cycleIntervalDays != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 48) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_dose != *((double *)v4 + 4))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double dose;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  v3 = -[HDCodableDateComponents hash](self->_startTimeComponents, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = 2654435761 * self->_dayOfWeek;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_cycleIndex;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v11;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_cycleIntervalDays;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_5:
  dose = self->_dose;
  v8 = -dose;
  if (dose >= 0.0)
    v8 = self->_dose;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableDateComponents *startTimeComponents;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  startTimeComponents = self->_startTimeComponents;
  v6 = *((_QWORD *)v4 + 5);
  if (startTimeComponents)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodableDateComponents mergeFrom:](startTimeComponents, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodableMedicationScheduleIntervalData setStartTimeComponents:](self, "setStartTimeComponents:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 4) != 0)
  {
    self->_dayOfWeek = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v4 + 48);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 2) == 0)
        goto LABEL_10;
LABEL_15:
      self->_cycleIntervalDays = *((_QWORD *)v4 + 2);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 48) & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_cycleIndex = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 2) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v7 & 8) != 0)
  {
LABEL_11:
    self->_dose = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:

}

- (HDCodableDateComponents)startTimeComponents
{
  return self->_startTimeComponents;
}

- (void)setStartTimeComponents:(id)a3
{
  objc_storeStrong((id *)&self->_startTimeComponents, a3);
}

- (int64_t)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int64_t)cycleIndex
{
  return self->_cycleIndex;
}

- (int64_t)cycleIntervalDays
{
  return self->_cycleIntervalDays;
}

- (double)dose
{
  return self->_dose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTimeComponents, 0);
}

@end
