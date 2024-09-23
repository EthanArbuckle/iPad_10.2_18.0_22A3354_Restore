@implementation HDCodableWorkoutConfiguration

- (void)setActivityType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activityType = a3;
}

- (void)setHasActivityType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivityType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLocationType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setWLocationType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_wLocationType = a3;
}

- (void)setHasWLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWLocationType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setWLengthValue:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_wLengthValue = a3;
}

- (void)setHasWLengthValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWLengthValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasWLengthUnitString
{
  return self->_wLengthUnitString != 0;
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
  v8.super_class = (Class)HDCodableWorkoutConfiguration;
  -[HDCodableWorkoutConfiguration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutConfiguration dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *wLengthUnitString;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_activityType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("activityType"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_locationType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("locationType"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_wLocationType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("wLocationType"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_wLengthValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("wLengthValue"));

  }
LABEL_6:
  wLengthUnitString = self->_wLengthUnitString;
  if (wLengthUnitString)
    objc_msgSend(v3, "setObject:forKey:", wLengthUnitString, CFSTR("wLengthUnitString"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_6:
  if (self->_wLengthUnitString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_activityType;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_locationType;
  *((_BYTE *)v4 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  v4[4] = self->_wLocationType;
  *((_BYTE *)v4 + 48) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v4[3] = *(_QWORD *)&self->_wLengthValue;
    *((_BYTE *)v4 + 48) |= 4u;
  }
LABEL_6:
  if (self->_wLengthUnitString)
  {
    v6 = v4;
    objc_msgSend(v4, "setWLengthUnitString:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_activityType;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 32) = self->_wLocationType;
      *(_BYTE *)(v5 + 48) |= 8u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_locationType;
  *(_BYTE *)(v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(double *)(v5 + 24) = self->_wLengthValue;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_wLengthUnitString, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *wLengthUnitString;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_activityType != *((_QWORD *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_locationType != *((_QWORD *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_wLocationType != *((_QWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_wLengthValue != *((double *)v4 + 3))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  wLengthUnitString = self->_wLengthUnitString;
  if ((unint64_t)wLengthUnitString | *((_QWORD *)v4 + 5))
    v6 = -[NSString isEqual:](wLengthUnitString, "isEqual:");
  else
    v6 = 1;
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double wLengthValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_activityType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_locationType;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_11:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_12:
      v10 = 0;
      return v4 ^ v3 ^ v5 ^ v10 ^ -[NSString hash](self->_wLengthUnitString, "hash");
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_4:
  v5 = 2654435761 * self->_wLocationType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_5:
  wLengthValue = self->_wLengthValue;
  v7 = -wLengthValue;
  if (wLengthValue >= 0.0)
    v7 = self->_wLengthValue;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ -[NSString hash](self->_wLengthUnitString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 1) != 0)
  {
    self->_activityType = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_locationType = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_wLocationType = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_5:
    self->_wLengthValue = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:
  if (*((_QWORD *)v4 + 5))
  {
    v6 = v4;
    -[HDCodableWorkoutConfiguration setWLengthUnitString:](self, "setWLengthUnitString:");
    v4 = v6;
  }

}

- (int64_t)activityType
{
  return self->_activityType;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (int64_t)wLocationType
{
  return self->_wLocationType;
}

- (double)wLengthValue
{
  return self->_wLengthValue;
}

- (NSString)wLengthUnitString
{
  return self->_wLengthUnitString;
}

- (void)setWLengthUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_wLengthUnitString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wLengthUnitString, 0);
}

@end
