@implementation CLPInertialOdometry

- (double)timestamp
{
  return self->_timestamp;
}

- (double)deltaPositionY
{
  return self->_deltaPositionY;
}

- (double)deltaPositionX
{
  return self->_deltaPositionX;
}

- (BOOL)hasDeltaPositionY
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasDeltaPositionX
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_timestamp = a3;
}

- (void)setDeltaVelocityZ:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_deltaVelocityZ = a3;
}

- (void)setDeltaVelocityY:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_deltaVelocityY = a3;
}

- (void)setDeltaVelocityX:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_deltaVelocityX = a3;
}

- (void)setDeltaPositionZ:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deltaPositionZ = a3;
}

- (void)setDeltaPositionY:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deltaPositionY = a3;
}

- (void)setDeltaPositionX:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deltaPositionX = a3;
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x20) != 0)
LABEL_8:
    PBDataWriterWriteDoubleField();
LABEL_9:

}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasDeltaPositionX:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setHasDeltaPositionY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setHasDeltaPositionZ:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeltaPositionZ
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasDeltaVelocityX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeltaVelocityX
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasDeltaVelocityY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDeltaVelocityY
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasDeltaVelocityZ:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDeltaVelocityZ
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)CLPInertialOdometry;
  -[CLPInertialOdometry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPInertialOdometry dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deltaPositionX);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("deltaPositionX"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deltaPositionY);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("deltaPositionY"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deltaPositionZ);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("deltaPositionZ"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deltaVelocityY);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("deltaVelocityY"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deltaVelocityX);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("deltaVelocityX"));

  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_deltaVelocityZ);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("deltaVelocityZ"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPInertialOdometryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[7] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 64) |= 0x40u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(_QWORD *)&self->_deltaPositionX;
  *((_BYTE *)v4 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4[2] = *(_QWORD *)&self->_deltaPositionY;
  *((_BYTE *)v4 + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[3] = *(_QWORD *)&self->_deltaPositionZ;
  *((_BYTE *)v4 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    v4[5] = *(_QWORD *)&self->_deltaVelocityY;
    *((_BYTE *)v4 + 64) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v4[4] = *(_QWORD *)&self->_deltaVelocityX;
  *((_BYTE *)v4 + 64) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v4[6] = *(_QWORD *)&self->_deltaVelocityZ;
    *((_BYTE *)v4 + 64) |= 0x20u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_QWORD *)result + 7) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 64) |= 0x40u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_deltaPositionX;
  *((_BYTE *)result + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_deltaPositionY;
  *((_BYTE *)result + 64) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_deltaPositionZ;
  *((_BYTE *)result + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_deltaVelocityX;
  *((_BYTE *)result + 64) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_deltaVelocityY;
  *((_BYTE *)result + 64) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_8:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_deltaVelocityZ;
  *((_BYTE *)result + 64) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x40) == 0 || self->_timestamp != *((double *)v4 + 7))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x40) != 0)
  {
LABEL_36:
    v5 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_deltaPositionX != *((double *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_deltaPositionY != *((double *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_deltaPositionZ != *((double *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_deltaVelocityX != *((double *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_deltaVelocityY != *((double *)v4 + 5))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  v5 = (*((_BYTE *)v4 + 64) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x20) == 0 || self->_deltaVelocityZ != *((double *)v4 + 6))
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
  double deltaPositionX;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double deltaPositionY;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double deltaPositionZ;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double deltaVelocityX;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double deltaVelocityY;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double deltaVelocityZ;
  double v36;
  long double v37;
  double v38;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
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
    deltaPositionX = self->_deltaPositionX;
    v11 = -deltaPositionX;
    if (deltaPositionX >= 0.0)
      v11 = self->_deltaPositionX;
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
    deltaPositionY = self->_deltaPositionY;
    v16 = -deltaPositionY;
    if (deltaPositionY >= 0.0)
      v16 = self->_deltaPositionY;
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
    deltaPositionZ = self->_deltaPositionZ;
    v21 = -deltaPositionZ;
    if (deltaPositionZ >= 0.0)
      v21 = self->_deltaPositionZ;
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
  {
    deltaVelocityX = self->_deltaVelocityX;
    v26 = -deltaVelocityX;
    if (deltaVelocityX >= 0.0)
      v26 = self->_deltaVelocityX;
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
  if ((has & 0x10) != 0)
  {
    deltaVelocityY = self->_deltaVelocityY;
    v31 = -deltaVelocityY;
    if (deltaVelocityY >= 0.0)
      v31 = self->_deltaVelocityY;
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
  if ((has & 0x20) != 0)
  {
    deltaVelocityZ = self->_deltaVelocityZ;
    v36 = -deltaVelocityZ;
    if (deltaVelocityZ >= 0.0)
      v36 = self->_deltaVelocityZ;
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
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 0x40) != 0)
  {
    self->_timestamp = *((double *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
    v5 = *((_BYTE *)v4 + 64);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_deltaPositionX = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_deltaPositionY = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_deltaPositionZ = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
LABEL_15:
    self->_deltaVelocityY = *((double *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
    if ((*((_BYTE *)v4 + 64) & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_deltaVelocityX = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 0x10) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 0x20) != 0)
  {
LABEL_8:
    self->_deltaVelocityZ = *((double *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_9:

}

- (double)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (double)deltaVelocityX
{
  return self->_deltaVelocityX;
}

- (double)deltaVelocityY
{
  return self->_deltaVelocityY;
}

- (double)deltaVelocityZ
{
  return self->_deltaVelocityZ;
}

@end
