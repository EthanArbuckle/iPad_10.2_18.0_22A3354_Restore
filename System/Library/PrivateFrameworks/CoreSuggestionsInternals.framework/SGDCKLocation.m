@implementation SGDCKLocation

- (void)setLocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)StringAsLocationType:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[SGDCKLocation StringAsLocationType:]", "SGDCKLocation.m", 36, "0");
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasAddress
{
  return self->_address != 0;
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

- (void)setAccuracy:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_accuracy = a3;
}

- (void)setHasAccuracy:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccuracy
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setQuality:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_quality = a3;
}

- (void)setHasQuality:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasQuality
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasAirportCode
{
  return self->_airportCode != 0;
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
  v8.super_class = (Class)SGDCKLocation;
  -[SGDCKLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCKLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSString *label;
  NSString *address;
  char has;
  void *v9;
  NSData *handle;
  NSString *airportCode;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_locationType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("locationType"));

  }
  label = self->_label;
  if (label)
    objc_msgSend(v3, "setObject:forKey:", label, CFSTR("label"));
  address = self->_address;
  if (address)
    objc_msgSend(v3, "setObject:forKey:", address, CFSTR("address"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("latitude"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("longitude"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_accuracy);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("accuracy"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_quality);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("quality"));

  }
LABEL_12:
  handle = self->_handle;
  if (handle)
    objc_msgSend(v3, "setObject:forKey:", handle, CFSTR("handle"));
  airportCode = self->_airportCode;
  if (airportCode)
    objc_msgSend(v3, "setObject:forKey:", airportCode, CFSTR("airportCode"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGDCKLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_address)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_12:
  if (self->_handle)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_airportCode)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[18] = self->_locationType;
    *((_BYTE *)v4 + 76) |= 0x10u;
  }
  v6 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    v4 = v6;
  }
  if (self->_address)
  {
    objc_msgSend(v6, "setAddress:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_latitude;
    *((_BYTE *)v4 + 76) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_longitude;
  *((_BYTE *)v4 + 76) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_accuracy;
  *((_BYTE *)v4 + 76) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_quality;
    *((_BYTE *)v4 + 76) |= 8u;
  }
LABEL_12:
  if (self->_handle)
  {
    objc_msgSend(v6, "setHandle:");
    v4 = v6;
  }
  if (self->_airportCode)
  {
    objc_msgSend(v6, "setAirportCode:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_locationType;
    *(_BYTE *)(v5 + 76) |= 0x10u;
  }
  v7 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v7;

  v9 = -[NSString copyWithZone:](self->_address, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_latitude;
    *(_BYTE *)(v6 + 76) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *(double *)(v6 + 8) = self->_accuracy;
      *(_BYTE *)(v6 + 76) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v6 + 24) = self->_longitude;
  *(_BYTE *)(v6 + 76) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(double *)(v6 + 32) = self->_quality;
    *(_BYTE *)(v6 + 76) |= 8u;
  }
LABEL_8:
  v12 = -[NSData copyWithZone:](self->_handle, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_airportCode, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v14;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *label;
  NSString *address;
  NSData *handle;
  NSString *airportCode;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) == 0 || self->_locationType != *((_DWORD *)v4 + 18))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
LABEL_35:
    v9 = 0;
    goto LABEL_36;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](label, "isEqual:"))
    goto LABEL_35;
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](address, "isEqual:"))
      goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_latitude != *((double *)v4 + 2))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_longitude != *((double *)v4 + 3))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_accuracy != *((double *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0 || self->_quality != *((double *)v4 + 4))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_35;
  }
  handle = self->_handle;
  if ((unint64_t)handle | *((_QWORD *)v4 + 7) && !-[NSData isEqual:](handle, "isEqual:"))
    goto LABEL_35;
  airportCode = self->_airportCode;
  if ((unint64_t)airportCode | *((_QWORD *)v4 + 6))
    v9 = -[NSString isEqual:](airportCode, "isEqual:");
  else
    v9 = 1;
LABEL_36:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  char has;
  unint64_t v7;
  double latitude;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double longitude;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  double accuracy;
  double v19;
  long double v20;
  double v21;
  unint64_t v22;
  double quality;
  double v24;
  long double v25;
  double v26;
  NSUInteger v27;
  uint64_t v28;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v3 = 2654435761 * self->_locationType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_label, "hash");
  v5 = -[NSString hash](self->_address, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    latitude = self->_latitude;
    v9 = -latitude;
    if (latitude >= 0.0)
      v9 = self->_latitude;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 4) != 0)
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
  if ((has & 1) != 0)
  {
    accuracy = self->_accuracy;
    v19 = -accuracy;
    if (accuracy >= 0.0)
      v19 = self->_accuracy;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((has & 8) != 0)
  {
    quality = self->_quality;
    v24 = -quality;
    if (quality >= 0.0)
      v24 = self->_quality;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  v27 = v4 ^ v3 ^ v5 ^ v7;
  v28 = v12 ^ v17 ^ v22 ^ -[NSData hash](self->_handle, "hash");
  return v27 ^ v28 ^ -[NSString hash](self->_airportCode, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    self->_locationType = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[SGDCKLocation setLabel:](self, "setLabel:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[SGDCKLocation setAddress:](self, "setAddress:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_latitude = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 76);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_longitude = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_19:
  self->_accuracy = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
LABEL_11:
    self->_quality = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 7))
  {
    -[SGDCKLocation setHandle:](self, "setHandle:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[SGDCKLocation setAirportCode:](self, "setAirportCode:");
    v4 = v6;
  }

}

- (int)locationType
{
  return self->_locationType;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (double)quality
{
  return self->_quality;
}

- (NSData)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)airportCode
{
  return self->_airportCode;
}

- (void)setAirportCode:(id)a3
{
  objc_storeStrong((id *)&self->_airportCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_airportCode, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
