@implementation BMPBFindMyLocationChangeEvent

- (BOOL)hasIdsHandle
{
  return self->_idsHandle != 0;
}

- (int)locationChangeType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_locationChangeType;
  else
    return 0;
}

- (void)setLocationChangeType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_locationChangeType = a3;
}

- (void)setHasLocationChangeType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocationChangeType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)locationChangeTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E26496B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocationChangeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Update")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("StartedSharing")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("StoppedSharing")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)activityState
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_activityState;
  else
    return 0;
}

- (void)setActivityState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_activityState = a3;
}

- (void)setHasActivityState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActivityState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)activityStateAsString:(int)a3
{
  if (a3 < 6)
    return off_1E26496D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActivityState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stationary")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Walking")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Running")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cycling")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Automotive")))
  {
    v4 = 5;
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

- (BOOL)hasName
{
  return self->_name != 0;
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
  v8.super_class = (Class)BMPBFindMyLocationChangeEvent;
  -[BMPBFindMyLocationChangeEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBFindMyLocationChangeEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *idsHandle;
  char has;
  uint64_t locationChangeType;
  __CFString *v8;
  uint64_t activityState;
  __CFString *v10;
  void *v11;
  void *v12;
  NSString *name;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  idsHandle = self->_idsHandle;
  if (idsHandle)
    objc_msgSend(v3, "setObject:forKey:", idsHandle, CFSTR("idsHandle"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    locationChangeType = self->_locationChangeType;
    if (locationChangeType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_locationChangeType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E26496B8[locationChangeType];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("locationChangeType"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    activityState = self->_activityState;
    if (activityState >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activityState);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E26496D0[activityState];
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("activityState"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("latitude"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("longitude"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBFindMyLocationChangeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_idsHandle)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_8:
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_idsHandle)
  {
    objc_msgSend(v4, "setIdsHandle:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_locationChangeType;
    *((_BYTE *)v4 + 56) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = self->_activityState;
  *((_BYTE *)v4 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_latitude;
  *((_BYTE *)v4 + 56) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_longitude;
    *((_BYTE *)v4 + 56) |= 2u;
  }
LABEL_8:
  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_idsHandle, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_locationChangeType;
    *(_BYTE *)(v5 + 56) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(double *)(v5 + 8) = self->_latitude;
      *(_BYTE *)(v5 + 56) |= 1u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_activityState;
  *(_BYTE *)(v5 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(double *)(v5 + 16) = self->_longitude;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
LABEL_6:
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *idsHandle;
  NSString *name;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  idsHandle = self->_idsHandle;
  if ((unint64_t)idsHandle | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](idsHandle, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_locationChangeType != *((_DWORD *)v4 + 10))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
LABEL_26:
    v7 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_activityState != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_latitude != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_longitude != *((double *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_26;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 6))
    v7 = -[NSString isEqual:](name, "isEqual:");
  else
    v7 = 1;
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  uint64_t v6;
  double latitude;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  double longitude;
  double v14;
  long double v15;
  double v16;

  v3 = -[NSString hash](self->_idsHandle, "hash");
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v11 = 0;
    goto LABEL_13;
  }
  v5 = 2654435761 * self->_locationChangeType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v6 = 2654435761 * self->_activityState;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  latitude = self->_latitude;
  v8 = -latitude;
  if (latitude >= 0.0)
    v8 = self->_latitude;
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
LABEL_13:
  if ((has & 2) != 0)
  {
    longitude = self->_longitude;
    v14 = -longitude;
    if (longitude >= 0.0)
      v14 = self->_longitude;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ -[NSString hash](self->_name, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBFindMyLocationChangeEvent setIdsHandle:](self, "setIdsHandle:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 8) != 0)
  {
    self->_locationChangeType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 56);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_activityState = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  self->_latitude = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_7:
    self->_longitude = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBFindMyLocationChangeEvent setName:](self, "setName:");
    v4 = v6;
  }

}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
  objc_storeStrong((id *)&self->_idsHandle, a3);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_idsHandle, 0);
}

@end
