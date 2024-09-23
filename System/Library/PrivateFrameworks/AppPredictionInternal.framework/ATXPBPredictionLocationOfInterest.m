@implementation ATXPBPredictionLocationOfInterest

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E82DD6A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Work")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("School")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Gym")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)ATXPBPredictionLocationOfInterest;
  -[ATXPBPredictionLocationOfInterest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBPredictionLocationOfInterest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uuid;
  char has;
  uint64_t type;
  __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E82DD6A8[type];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("latitude"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("longitude"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionLocationOfInterestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_uuid)
  {
    v6 = v4;
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_latitude;
    *((_BYTE *)v4 + 40) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_DWORD *)v4 + 6) = self->_type;
  *((_BYTE *)v4 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_longitude;
    *((_BYTE *)v4 + 40) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(double *)(v5 + 8) = self->_latitude;
    *(_BYTE *)(v5 + 40) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_type;
  *(_BYTE *)(v5 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_longitude;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uuid;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_type != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_latitude != *((double *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_longitude != *((double *)v4 + 2))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  double latitude;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double longitude;
  double v13;
  long double v14;
  double v15;

  v3 = -[NSString hash](self->_uuid, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  latitude = self->_latitude;
  v7 = -latitude;
  if (latitude >= 0.0)
    v7 = self->_latitude;
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
LABEL_11:
  if ((has & 2) != 0)
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
  return v5 ^ v3 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[ATXPBPredictionLocationOfInterest setUuid:](self, "setUuid:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0)
      goto LABEL_5;
LABEL_9:
    self->_latitude = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 40) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_type = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_longitude = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
