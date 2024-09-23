@implementation HDCodableLocationDatum

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTimestamp
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLatitude:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLatitude
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAltitude:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAltitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSpeed:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSpeed
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCourse:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_course = a3;
}

- (void)setHasCourse:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCourse
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setVerticalAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSpeedAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_speedAccuracy = a3;
}

- (void)setHasSpeedAccuracy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSpeedAccuracy
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCourseAccuracy:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_courseAccuracy = a3;
}

- (void)setHasCourseAccuracy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCourseAccuracy
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSignalEnvironmentType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_signalEnvironmentType = a3;
}

- (void)setHasSignalEnvironmentType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSignalEnvironmentType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
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
  v8.super_class = (Class)HDCodableLocationDatum;
  -[HDCodableLocationDatum description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableLocationDatum dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("latitude"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("longitude"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_altitude);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("altitude"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_speed);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("speed"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_course);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("course"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_horizontalAccuracy);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("horizontalAccuracy"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_verticalAccuracy);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("verticalAccuracy"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_courseAccuracy);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("courseAccuracy"));

    if ((*(_WORD *)&self->_has & 0x400) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_speedAccuracy);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("speedAccuracy"));

  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x400) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_signalEnvironmentType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("signalEnvironmentType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableLocationDatumReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
LABEL_23:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x400) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[9] = *(_QWORD *)&self->_timestamp;
    *((_WORD *)v4 + 46) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(_QWORD *)&self->_latitude;
  *((_WORD *)v4 + 46) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v4[6] = *(_QWORD *)&self->_longitude;
  *((_WORD *)v4 + 46) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v4[1] = *(_QWORD *)&self->_altitude;
  *((_WORD *)v4 + 46) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v4[7] = *(_QWORD *)&self->_speed;
  *((_WORD *)v4 + 46) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v4[2] = *(_QWORD *)&self->_course;
  *((_WORD *)v4 + 46) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v4[4] = *(_QWORD *)&self->_horizontalAccuracy;
  *((_WORD *)v4 + 46) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v4[10] = *(_QWORD *)&self->_verticalAccuracy;
  *((_WORD *)v4 + 46) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
LABEL_23:
    v4[3] = *(_QWORD *)&self->_courseAccuracy;
    *((_WORD *)v4 + 46) |= 4u;
    if ((*(_WORD *)&self->_has & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  v4[8] = *(_QWORD *)&self->_speedAccuracy;
  *((_WORD *)v4 + 46) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 0x400) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 22) = self->_signalEnvironmentType;
    *((_WORD *)v4 + 46) |= 0x400u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_QWORD *)result + 9) = *(_QWORD *)&self->_timestamp;
    *((_WORD *)result + 46) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_latitude;
  *((_WORD *)result + 46) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_longitude;
  *((_WORD *)result + 46) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_altitude;
  *((_WORD *)result + 46) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_speed;
  *((_WORD *)result + 46) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_course;
  *((_WORD *)result + 46) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_horizontalAccuracy;
  *((_WORD *)result + 46) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_verticalAccuracy;
  *((_WORD *)result + 46) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_speedAccuracy;
  *((_WORD *)result + 46) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_courseAccuracy;
  *((_WORD *)result + 46) |= 4u;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    return result;
LABEL_12:
  *((_DWORD *)result + 22) = self->_signalEnvironmentType;
  *((_WORD *)result + 46) |= 0x400u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 46);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x100) == 0 || self->_timestamp != *((double *)v4 + 9))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 46) & 0x100) != 0)
  {
LABEL_57:
    v7 = 0;
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_latitude != *((double *)v4 + 5))
      goto LABEL_57;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_longitude != *((double *)v4 + 6))
      goto LABEL_57;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_altitude != *((double *)v4 + 1))
      goto LABEL_57;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_speed != *((double *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_course != *((double *)v4 + 2))
      goto LABEL_57;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_horizontalAccuracy != *((double *)v4 + 4))
      goto LABEL_57;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x200) == 0 || self->_verticalAccuracy != *((double *)v4 + 10))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 46) & 0x200) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_speedAccuracy != *((double *)v4 + 8))
      goto LABEL_57;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_courseAccuracy != *((double *)v4 + 3))
      goto LABEL_57;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 46) & 0x400) == 0 || self->_signalEnvironmentType != *((_DWORD *)v4 + 22))
      goto LABEL_57;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x400) == 0;
  }
LABEL_58:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double latitude;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double longitude;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double altitude;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double speed;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double course;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double horizontalAccuracy;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  double verticalAccuracy;
  double v43;
  long double v44;
  double v45;
  unint64_t v46;
  double speedAccuracy;
  double v48;
  long double v49;
  double v50;
  unint64_t v51;
  double courseAccuracy;
  double v53;
  long double v54;
  double v55;
  uint64_t v56;
  unint64_t v58;
  unint64_t v59;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
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
  if ((has & 0x10) != 0)
  {
    latitude = self->_latitude;
    v11 = -latitude;
    if (latitude >= 0.0)
      v11 = self->_latitude;
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
  if ((has & 0x20) != 0)
  {
    longitude = self->_longitude;
    v16 = -longitude;
    if (longitude >= 0.0)
      v16 = self->_longitude;
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
  if ((has & 1) != 0)
  {
    altitude = self->_altitude;
    v21 = -altitude;
    if (altitude >= 0.0)
      v21 = self->_altitude;
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
  if ((has & 0x40) != 0)
  {
    speed = self->_speed;
    v26 = -speed;
    if (speed >= 0.0)
      v26 = self->_speed;
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
  if ((has & 2) != 0)
  {
    course = self->_course;
    v31 = -course;
    if (course >= 0.0)
      v31 = self->_course;
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
  v58 = v9;
  v59 = v19;
  if ((has & 8) != 0)
  {
    horizontalAccuracy = self->_horizontalAccuracy;
    v36 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0)
      v36 = self->_horizontalAccuracy;
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
  v39 = v4;
  if ((has & 0x200) != 0)
  {
    verticalAccuracy = self->_verticalAccuracy;
    v43 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0)
      v43 = self->_verticalAccuracy;
    v44 = floor(v43 + 0.5);
    v45 = (v43 - v44) * 1.84467441e19;
    v41 = 2654435761u * (unint64_t)fmod(v44, 1.84467441e19);
    v40 = v24;
    if (v45 >= 0.0)
    {
      if (v45 > 0.0)
        v41 += (unint64_t)v45;
    }
    else
    {
      v41 -= (unint64_t)fabs(v45);
    }
  }
  else
  {
    v40 = v24;
    v41 = 0;
  }
  if ((has & 0x80) != 0)
  {
    speedAccuracy = self->_speedAccuracy;
    v48 = -speedAccuracy;
    if (speedAccuracy >= 0.0)
      v48 = self->_speedAccuracy;
    v49 = floor(v48 + 0.5);
    v50 = (v48 - v49) * 1.84467441e19;
    v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0)
        v46 += (unint64_t)v50;
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    v46 = 0;
  }
  if ((has & 4) != 0)
  {
    courseAccuracy = self->_courseAccuracy;
    v53 = -courseAccuracy;
    if (courseAccuracy >= 0.0)
      v53 = self->_courseAccuracy;
    v54 = floor(v53 + 0.5);
    v55 = (v53 - v54) * 1.84467441e19;
    v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0)
        v51 += (unint64_t)v55;
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    v51 = 0;
  }
  if ((has & 0x400) != 0)
    v56 = 2654435761 * self->_signalEnvironmentType;
  else
    v56 = 0;
  return v58 ^ v39 ^ v14 ^ v59 ^ v40 ^ v29 ^ v34 ^ v41 ^ v46 ^ v51 ^ v56;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x100) != 0)
  {
    self->_timestamp = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)v4 + 46);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_latitude = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_longitude = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_altitude = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_speed = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_course = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_horizontalAccuracy = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_verticalAccuracy = *((double *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
LABEL_23:
    self->_courseAccuracy = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
    if ((*((_WORD *)v4 + 46) & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  self->_speedAccuracy = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 4) != 0)
    goto LABEL_23;
LABEL_11:
  if ((v5 & 0x400) != 0)
  {
LABEL_12:
    self->_signalEnvironmentType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_13:

}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)speed
{
  return self->_speed;
}

- (double)course
{
  return self->_course;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (int)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

@end
