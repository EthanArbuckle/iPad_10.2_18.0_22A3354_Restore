@implementation CLPWorkoutUpdateMotionActivity

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStartTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setActivityType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_activityType = a3;
}

- (void)setHasActivityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActivityType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)CLPWorkoutUpdateMotionActivity;
  -[CLPWorkoutUpdateMotionActivity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPWorkoutUpdateMotionActivity dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("startTime"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_activityType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("activityType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPWorkoutUpdateMotionActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v4[1] = *(_QWORD *)&self->_startTime;
    *((_BYTE *)v4 + 28) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[2] = *(_QWORD *)&self->_timestamp;
  *((_BYTE *)v4 + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 6) = self->_activityType;
    *((_BYTE *)v4 + 28) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 28) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_startTime;
  *((_BYTE *)result + 28) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 6) = self->_activityType;
  *((_BYTE *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_startTime != *((double *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 28) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_activityType != *((_DWORD *)v4 + 6))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double startTime;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    timestamp = self->_timestamp;
    v6 = -timestamp;
    if (timestamp >= 0.0)
      v6 = self->_timestamp;
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
  {
    startTime = self->_startTime;
    v11 = -startTime;
    if (startTime >= 0.0)
      v11 = self->_startTime;
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
  if ((has & 4) != 0)
    v14 = 2654435761 * self->_activityType;
  else
    v14 = 0;
  return v9 ^ v4 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_startTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_timestamp = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_activityType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)startTime
{
  return self->_startTime;
}

- (int)activityType
{
  return self->_activityType;
}

@end
