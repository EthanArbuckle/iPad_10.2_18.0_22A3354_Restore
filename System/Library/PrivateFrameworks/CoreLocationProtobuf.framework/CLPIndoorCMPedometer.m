@implementation CLPIndoorCMPedometer

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

- (void)setDistance:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDistance
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumberOfSteps:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_numberOfSteps = a3;
}

- (void)setHasNumberOfSteps:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNumberOfSteps
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setFloorsAscended:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_floorsAscended = a3;
}

- (void)setHasFloorsAscended:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFloorsAscended
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setFloorsDescended:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_floorsDescended = a3;
}

- (void)setHasFloorsDescended:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFloorsDescended
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setFirstStepTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_firstStepTime = a3;
}

- (void)setHasFirstStepTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFirstStepTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setActiveTime:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_activeTime = a3;
}

- (void)setHasActiveTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActiveTime
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
  v8.super_class = (Class)CLPIndoorCMPedometer;
  -[CLPIndoorCMPedometer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPIndoorCMPedometer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_distance;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("distance"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfSteps);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numberOfSteps"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_floorsAscended);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("floorsAscended"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstStepTime);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("firstStepTime"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_floorsDescended);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("floorsDescended"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *(float *)&v4 = self->_activeTime;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("activeTime"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorCMPedometerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 4) != 0)
LABEL_8:
    PBDataWriterWriteFloatField();
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = LODWORD(self->_distance);
  *((_BYTE *)v4 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v4 + 10) = self->_numberOfSteps;
  *((_BYTE *)v4 + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v4 + 8) = self->_floorsAscended;
  *((_BYTE *)v4 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_15:
    v4[1] = *(_QWORD *)&self->_firstStepTime;
    *((_BYTE *)v4 + 44) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *((_DWORD *)v4 + 9) = self->_floorsDescended;
  *((_BYTE *)v4 + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 6) = LODWORD(self->_activeTime);
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_9:

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
    *((_BYTE *)result + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = LODWORD(self->_distance);
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 10) = self->_numberOfSteps;
  *((_BYTE *)result + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 8) = self->_floorsAscended;
  *((_BYTE *)result + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 9) = self->_floorsDescended;
  *((_BYTE *)result + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_firstStepTime;
  *((_BYTE *)result + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_8:
  *((_DWORD *)result + 6) = LODWORD(self->_activeTime);
  *((_BYTE *)result + 44) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
LABEL_36:
    v5 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_distance != *((float *)v4 + 7))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x40) == 0 || self->_numberOfSteps != *((_DWORD *)v4 + 10))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0 || self->_floorsAscended != *((_DWORD *)v4 + 8))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0 || self->_floorsDescended != *((_DWORD *)v4 + 9))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_firstStepTime != *((double *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_36;
  }
  v5 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_activeTime != *((float *)v4 + 6))
      goto LABEL_36;
    v5 = 1;
  }
LABEL_37:

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
  float distance;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double firstStepTime;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  float activeTime;
  float v24;
  float v25;
  float v26;

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
  if ((has & 8) != 0)
  {
    distance = self->_distance;
    v11 = -distance;
    if (distance >= 0.0)
      v11 = self->_distance;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x40) != 0)
  {
    v14 = 2654435761 * self->_numberOfSteps;
    if ((has & 0x10) != 0)
    {
LABEL_19:
      v15 = 2654435761 * self->_floorsAscended;
      if ((has & 0x20) != 0)
        goto LABEL_20;
LABEL_27:
      v16 = 0;
      if ((has & 1) != 0)
        goto LABEL_21;
LABEL_28:
      v21 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v14 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_19;
  }
  v15 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_27;
LABEL_20:
  v16 = 2654435761 * self->_floorsDescended;
  if ((has & 1) == 0)
    goto LABEL_28;
LABEL_21:
  firstStepTime = self->_firstStepTime;
  v18 = -firstStepTime;
  if (firstStepTime >= 0.0)
    v18 = self->_firstStepTime;
  v19 = floor(v18 + 0.5);
  v20 = (v18 - v19) * 1.84467441e19;
  v21 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
  if (v20 >= 0.0)
  {
    if (v20 > 0.0)
      v21 += (unint64_t)v20;
  }
  else
  {
    v21 -= (unint64_t)fabs(v20);
  }
LABEL_31:
  if ((has & 4) != 0)
  {
    activeTime = self->_activeTime;
    v24 = -activeTime;
    if (activeTime >= 0.0)
      v24 = self->_activeTime;
    v25 = floorf(v24 + 0.5);
    v26 = (float)(v24 - v25) * 1.8447e19;
    v22 = 2654435761u * (unint64_t)fmodf(v25, 1.8447e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabsf(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_distance = *((float *)v4 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_numberOfSteps = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_floorsAscended = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
LABEL_15:
    self->_firstStepTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_floorsDescended = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 4) != 0)
  {
LABEL_8:
    self->_activeTime = *((float *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_9:

}

- (double)timestamp
{
  return self->_timestamp;
}

- (float)distance
{
  return self->_distance;
}

- (int)numberOfSteps
{
  return self->_numberOfSteps;
}

- (int)floorsAscended
{
  return self->_floorsAscended;
}

- (int)floorsDescended
{
  return self->_floorsDescended;
}

- (double)firstStepTime
{
  return self->_firstStepTime;
}

- (float)activeTime
{
  return self->_activeTime;
}

@end
