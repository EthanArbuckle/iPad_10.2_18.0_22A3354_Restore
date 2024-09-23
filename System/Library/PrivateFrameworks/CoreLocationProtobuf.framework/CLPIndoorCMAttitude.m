@implementation CLPIndoorCMAttitude

- (CLPQuaternion)quaternion
{
  return self->_quaternion;
}

- (void)setQuaternion:(id)a3
{
  objc_storeStrong((id *)&self->_quaternion, a3);
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setMagneticCalibration:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_magneticCalibration = a3;
}

- (void)setMagneticAccuracy:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_magneticAccuracy = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasQuaternion
{
  return self->_quaternion != 0;
}

- (void)setHasMagneticAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMagneticAccuracy
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)magneticCalibration
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_magneticCalibration;
  else
    return -1;
}

- (void)setHasMagneticCalibration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMagneticCalibration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)magneticCalibrationAsString:(int)a3
{
  if ((a3 + 1) < 8)
    return *(&off_1E9595A20 + a3 + 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMagneticCalibration:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unreliable")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_2DWeak")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_2DStrong")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_3DWeak")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_3D")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_3DStrong")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Max")))
  {
    v4 = 6;
  }
  else
  {
    v4 = -1;
  }

  return v4;
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
  v8.super_class = (Class)CLPIndoorCMAttitude;
  -[CLPIndoorCMAttitude description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPIndoorCMAttitude dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  CLPQuaternion *quaternion;
  void *v7;
  char has;
  void *v9;
  int v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

  }
  quaternion = self->_quaternion;
  if (quaternion)
  {
    -[CLPQuaternion dictionaryRepresentation](quaternion, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("quaternion"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_magneticAccuracy;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("magneticAccuracy"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v10 = self->_magneticCalibration + 1;
    if (v10 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_magneticCalibration);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = *(&off_1E9595A20 + v10);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("magneticCalibration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorCMAttitudeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_quaternion)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_quaternion)
  {
    v6 = v4;
    objc_msgSend(v4, "setQuaternion:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_magneticAccuracy);
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_magneticCalibration;
    *((_BYTE *)v4 + 32) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[CLPQuaternion copyWithZone:](self->_quaternion, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v6 + 16) = self->_magneticAccuracy;
    *(_BYTE *)(v6 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_magneticCalibration;
    *(_BYTE *)(v6 + 32) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  CLPQuaternion *quaternion;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_19;
  }
  quaternion = self->_quaternion;
  if ((unint64_t)quaternion | *((_QWORD *)v4 + 3))
  {
    if (!-[CLPQuaternion isEqual:](quaternion, "isEqual:"))
    {
LABEL_19:
      v7 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_magneticAccuracy != *((float *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  v7 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_magneticCalibration != *((_DWORD *)v4 + 5))
      goto LABEL_19;
    v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  double timestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  char has;
  unint64_t v10;
  float magneticAccuracy;
  float v12;
  float v13;
  float v14;
  uint64_t v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v5 = -timestamp;
    if (timestamp >= 0.0)
      v5 = self->_timestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[CLPQuaternion hash](self->_quaternion, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    magneticAccuracy = self->_magneticAccuracy;
    v12 = -magneticAccuracy;
    if (magneticAccuracy >= 0.0)
      v12 = self->_magneticAccuracy;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 4) != 0)
    v15 = 2654435761 * self->_magneticCalibration;
  else
    v15 = 0;
  return v8 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  CLPQuaternion *quaternion;
  uint64_t v7;
  char v8;
  double *v9;

  v4 = (double *)a3;
  v5 = v4;
  if (((_BYTE)v4[4] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  quaternion = self->_quaternion;
  v7 = *((_QWORD *)v5 + 3);
  if (quaternion)
  {
    if (!v7)
      goto LABEL_9;
    v9 = v5;
    -[CLPQuaternion mergeFrom:](quaternion, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v9 = v5;
    -[CLPIndoorCMAttitude setQuaternion:](self, "setQuaternion:");
  }
  v5 = v9;
LABEL_9:
  v8 = *((_BYTE *)v5 + 32);
  if ((v8 & 2) != 0)
  {
    self->_magneticAccuracy = *((float *)v5 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v5 + 32);
  }
  if ((v8 & 4) != 0)
  {
    self->_magneticCalibration = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (double)timestamp
{
  return self->_timestamp;
}

- (float)magneticAccuracy
{
  return self->_magneticAccuracy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quaternion, 0);
}

@end
