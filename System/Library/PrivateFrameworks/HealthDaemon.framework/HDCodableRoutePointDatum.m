@implementation HDCodableRoutePointDatum

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLatitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setAltitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setOdometer:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_odometer = a3;
}

- (void)setHasOdometer:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOdometer
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSignalEnvironmentType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_signalEnvironmentType = a3;
}

- (void)setHasSignalEnvironmentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSignalEnvironmentType
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
  v8.super_class = (Class)HDCodableRoutePointDatum;
  -[HDCodableRoutePointDatum description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRoutePointDatum dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("latitude"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("longitude"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_odometer);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("odometer"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_altitude);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("altitude"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_signalEnvironmentType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("signalEnvironmentType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutePointDatumReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
LABEL_7:
    PBDataWriterWriteInt32Field();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[5] = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 52) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = *(_QWORD *)&self->_latitude;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4[3] = *(_QWORD *)&self->_longitude;
  *((_BYTE *)v4 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
LABEL_13:
    v4[4] = *(_QWORD *)&self->_odometer;
    *((_BYTE *)v4 + 52) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  v4[1] = *(_QWORD *)&self->_altitude;
  *((_BYTE *)v4 + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 12) = self->_signalEnvironmentType;
    *((_BYTE *)v4 + 52) |= 0x20u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)result + 52) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_latitude;
  *((_BYTE *)result + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_longitude;
  *((_BYTE *)result + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_altitude;
  *((_BYTE *)result + 52) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_odometer;
  *((_BYTE *)result + 52) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 12) = self->_signalEnvironmentType;
  *((_BYTE *)result + 52) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0 || self->_timestamp != *((double *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_latitude != *((double *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_longitude != *((double *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_altitude != *((double *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_odometer != *((double *)v4 + 4))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 52) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x20) == 0 || self->_signalEnvironmentType != *((_DWORD *)v4 + 12))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

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
  double odometer;
  double v26;
  long double v27;
  double v28;
  uint64_t v29;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
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
  if ((has & 2) != 0)
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
  if ((has & 4) != 0)
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
  if ((has & 8) != 0)
  {
    odometer = self->_odometer;
    v26 = -odometer;
    if (odometer >= 0.0)
      v26 = self->_odometer;
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
  if ((has & 0x20) != 0)
    v29 = 2654435761 * self->_signalEnvironmentType;
  else
    v29 = 0;
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((double *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_latitude = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_longitude = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
LABEL_13:
    self->_odometer = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 52) & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_altitude = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 0x20) != 0)
  {
LABEL_7:
    self->_signalEnvironmentType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_8:

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

- (double)odometer
{
  return self->_odometer;
}

- (int)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

@end
