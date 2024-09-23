@implementation CKDPLocationCoordinate

- (void)setLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLatitude
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHorizontalAccuracy:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHorizontalAccuracy
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

- (void)setVerticalAccuracy:(double)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCourse:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_course = a3;
}

- (void)setHasCourse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCourse
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSpeed:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_speed = a3;
}

- (void)setHasSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSpeed
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasTimestamp
{
  return self->_timestamp != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)CKDPLocationCoordinate;
  -[CKDPLocationCoordinate description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  void *v10;
  const char *v11;
  CKDPDate *timestamp;
  void *v13;
  const char *v14;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, self->_latitude);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, (uint64_t)CFSTR("latitude"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, self->_longitude);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v19, (uint64_t)v18, (uint64_t)CFSTR("longitude"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, self->_horizontalAccuracy);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v21, (uint64_t)v20, (uint64_t)CFSTR("horizontalAccuracy"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, self->_altitude);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v23, (uint64_t)v22, (uint64_t)CFSTR("altitude"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, self->_verticalAccuracy);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v25, (uint64_t)v24, (uint64_t)CFSTR("verticalAccuracy"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, self->_course);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v27, (uint64_t)v26, (uint64_t)CFSTR("course"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, self->_speed);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, (uint64_t)CFSTR("speed"));

  }
LABEL_9:
  timestamp = self->_timestamp;
  if (timestamp)
  {
    objc_msgSend_dictionaryRepresentation(timestamp, v5, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, (uint64_t)CFSTR("timestamp"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPLocationCoordinateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_9:
  if (self->_timestamp)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  char has;
  CKDPDate *timestamp;
  _QWORD *v9;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(_QWORD *)&self->_latitude;
    *((_BYTE *)v4 + 72) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(_QWORD *)&self->_longitude;
  *((_BYTE *)v4 + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v4[3] = *(_QWORD *)&self->_horizontalAccuracy;
  *((_BYTE *)v4 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4[1] = *(_QWORD *)&self->_altitude;
  *((_BYTE *)v4 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v4[7] = *(_QWORD *)&self->_verticalAccuracy;
  *((_BYTE *)v4 + 72) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  v4[2] = *(_QWORD *)&self->_course;
  *((_BYTE *)v4 + 72) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v4[6] = *(_QWORD *)&self->_speed;
    *((_BYTE *)v4 + 72) |= 0x20u;
  }
LABEL_9:
  timestamp = self->_timestamp;
  if (timestamp)
  {
    v9 = v4;
    objc_msgSend_setTimestamp_(v4, v5, (uint64_t)timestamp, v6);
    v4 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  char has;
  uint64_t v17;
  void *v18;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (_QWORD *)v12;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v12 + 32) = self->_latitude;
    *(_BYTE *)(v12 + 72) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v12 + 40) = self->_longitude;
  *(_BYTE *)(v12 + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(double *)(v12 + 24) = self->_horizontalAccuracy;
  *(_BYTE *)(v12 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(double *)(v12 + 8) = self->_altitude;
  *(_BYTE *)(v12 + 72) |= 1u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_15:
    *(double *)(v12 + 16) = self->_course;
    *(_BYTE *)(v12 + 72) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *(double *)(v12 + 56) = self->_verticalAccuracy;
  *(_BYTE *)(v12 + 72) |= 0x40u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(double *)(v12 + 48) = self->_speed;
    *(_BYTE *)(v12 + 72) |= 0x20u;
  }
LABEL_9:
  v17 = objc_msgSend_copyWithZone_(self->_timestamp, v13, (uint64_t)a3, v14);
  v18 = (void *)v15[8];
  v15[8] = v17;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKDPDate *timestamp;
  uint64_t v11;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_39;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[9] & 8) == 0 || self->_latitude != *((double *)v4 + 4))
      goto LABEL_39;
  }
  else if ((v4[9] & 8) != 0)
  {
LABEL_39:
    isEqual = 0;
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[9] & 0x10) == 0 || self->_longitude != *((double *)v4 + 5))
      goto LABEL_39;
  }
  else if ((v4[9] & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[9] & 4) == 0 || self->_horizontalAccuracy != *((double *)v4 + 3))
      goto LABEL_39;
  }
  else if ((v4[9] & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[9] & 1) == 0 || self->_altitude != *((double *)v4 + 1))
      goto LABEL_39;
  }
  else if ((v4[9] & 1) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[9] & 0x40) == 0 || self->_verticalAccuracy != *((double *)v4 + 7))
      goto LABEL_39;
  }
  else if ((v4[9] & 0x40) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[9] & 2) == 0 || self->_course != *((double *)v4 + 2))
      goto LABEL_39;
  }
  else if ((v4[9] & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[9] & 0x20) == 0 || self->_speed != *((double *)v4 + 6))
      goto LABEL_39;
  }
  else if ((v4[9] & 0x20) != 0)
  {
    goto LABEL_39;
  }
  timestamp = self->_timestamp;
  v11 = v4[8];
  if ((unint64_t)timestamp | v11)
    isEqual = objc_msgSend_isEqual_(timestamp, v8, v11, v9);
  else
    isEqual = 1;
LABEL_40:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  char has;
  unint64_t v6;
  double latitude;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double longitude;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double horizontalAccuracy;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  double altitude;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  double verticalAccuracy;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  double course;
  double v33;
  long double v34;
  double v35;
  unint64_t v36;
  double speed;
  double v38;
  long double v39;
  double v40;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    latitude = self->_latitude;
    v8 = -latitude;
    if (latitude >= 0.0)
      v8 = self->_latitude;
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
  if ((has & 0x10) != 0)
  {
    longitude = self->_longitude;
    v13 = -longitude;
    if (longitude >= 0.0)
      v13 = self->_longitude;
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
  if ((has & 4) != 0)
  {
    horizontalAccuracy = self->_horizontalAccuracy;
    v18 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0)
      v18 = self->_horizontalAccuracy;
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
  if ((has & 1) != 0)
  {
    altitude = self->_altitude;
    v23 = -altitude;
    if (altitude >= 0.0)
      v23 = self->_altitude;
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
  if ((has & 0x40) != 0)
  {
    verticalAccuracy = self->_verticalAccuracy;
    v28 = -verticalAccuracy;
    if (verticalAccuracy >= 0.0)
      v28 = self->_verticalAccuracy;
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
  if ((has & 2) != 0)
  {
    course = self->_course;
    v33 = -course;
    if (course >= 0.0)
      v33 = self->_course;
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
  if ((has & 0x20) != 0)
  {
    speed = self->_speed;
    v38 = -speed;
    if (speed >= 0.0)
      v38 = self->_speed;
    v39 = floor(v38 + 0.5);
    v40 = (v38 - v39) * 1.84467441e19;
    v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    if (v40 >= 0.0)
    {
      if (v40 > 0.0)
        v36 += (unint64_t)v40;
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    v36 = 0;
  }
  return v11 ^ v6 ^ v16 ^ v21 ^ v26 ^ v31 ^ v36 ^ objc_msgSend_hash(self->_timestamp, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  uint64_t v5;
  double *v6;
  char v7;
  CKDPDate *timestamp;
  uint64_t v9;
  double *v10;

  v4 = (double *)a3;
  v6 = v4;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 8) != 0)
  {
    self->_latitude = v4[4];
    *(_BYTE *)&self->_has |= 8u;
    v7 = *((_BYTE *)v4 + 72);
    if ((v7 & 0x10) == 0)
    {
LABEL_3:
      if ((v7 & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if (((_BYTE)v4[9] & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_longitude = v4[5];
  *(_BYTE *)&self->_has |= 0x10u;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 4) == 0)
  {
LABEL_4:
    if ((v7 & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_horizontalAccuracy = v4[3];
  *(_BYTE *)&self->_has |= 4u;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 1) == 0)
  {
LABEL_5:
    if ((v7 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_altitude = v4[1];
  *(_BYTE *)&self->_has |= 1u;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 0x40) == 0)
  {
LABEL_6:
    if ((v7 & 2) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_verticalAccuracy = v4[7];
  *(_BYTE *)&self->_has |= 0x40u;
  v7 = *((_BYTE *)v4 + 72);
  if ((v7 & 2) == 0)
  {
LABEL_7:
    if ((v7 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_17:
  self->_course = v4[2];
  *(_BYTE *)&self->_has |= 2u;
  if (((_BYTE)v4[9] & 0x20) != 0)
  {
LABEL_8:
    self->_speed = v4[6];
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_9:
  timestamp = self->_timestamp;
  v9 = *((_QWORD *)v6 + 8);
  if (timestamp)
  {
    if (v9)
    {
      v10 = v6;
      objc_msgSend_mergeFrom_(timestamp, (const char *)v6, v9, v5);
LABEL_21:
      v6 = v10;
    }
  }
  else if (v9)
  {
    v10 = v6;
    objc_msgSend_setTimestamp_(self, (const char *)v6, v9, v5);
    goto LABEL_21;
  }

}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)course
{
  return self->_course;
}

- (double)speed
{
  return self->_speed;
}

- (CKDPDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
