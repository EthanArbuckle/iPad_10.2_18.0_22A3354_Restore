@implementation HDCodableRoutineLocation

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

- (void)setUncertainty:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_uncertainty = a3;
}

- (void)setHasUncertainty:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUncertainty
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (int)locationOfInterestType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_locationOfInterestType;
  else
    return -1;
}

- (void)setLocationOfInterestType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_locationOfInterestType = a3;
}

- (void)setHasLocationOfInterestType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocationOfInterestType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)locationOfInterestTypeAsString:(int)a3
{
  if ((a3 + 1) < 5)
    return off_1E6CE9438[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocationOfInterestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownLocation")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Work")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("School")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Gym")))
  {
    v4 = 3;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)hasGeoData
{
  return self->_geoData != 0;
}

- (void)clearVisits
{
  -[NSMutableArray removeAllObjects](self->_visits, "removeAllObjects");
}

- (void)addVisits:(id)a3
{
  id v4;
  NSMutableArray *visits;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  visits = self->_visits;
  v8 = v4;
  if (!visits)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_visits;
    self->_visits = v6;

    v4 = v8;
    visits = self->_visits;
  }
  -[NSMutableArray addObject:](visits, "addObject:", v4);

}

- (unint64_t)visitsCount
{
  return -[NSMutableArray count](self->_visits, "count");
}

- (id)visitsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_visits, "objectAtIndex:", a3);
}

+ (Class)visitsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HDCodableRoutineLocation;
  -[HDCodableRoutineLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRoutineLocation dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *uuid;
  unsigned int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSData *geoData;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_latitude);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("latitude"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_longitude);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("longitude"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_uncertainty);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("uncertainty"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("confidence"));

  }
LABEL_6:
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v7 = self->_locationOfInterestType + 1;
    if (v7 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_locationOfInterestType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E6CE9438[v7];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("locationOfInterestType"));

  }
  geoData = self->_geoData;
  if (geoData)
    objc_msgSend(v3, "setObject:forKey:", geoData, CFSTR("geoData"));
  if (-[NSMutableArray count](self->_visits, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_visits, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_visits;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("visits"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineLocationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:
  if (self->_uuid)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_geoData)
    PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_visits;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_latitude;
    *((_BYTE *)v4 + 72) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = *(_QWORD *)&self->_longitude;
  *((_BYTE *)v4 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_19:
  v4[4] = *(_QWORD *)&self->_uncertainty;
  *((_BYTE *)v4 + 72) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    v4[1] = *(_QWORD *)&self->_confidence;
    *((_BYTE *)v4 + 72) |= 1u;
  }
LABEL_6:
  v10 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_locationOfInterestType;
    *((_BYTE *)v4 + 72) |= 0x10u;
  }
  if (self->_geoData)
    objc_msgSend(v10, "setGeoData:");
  if (-[HDCodableRoutineLocation visitsCount](self, "visitsCount"))
  {
    objc_msgSend(v10, "clearVisits");
    v6 = -[HDCodableRoutineLocation visitsCount](self, "visitsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableRoutineLocation visitsAtIndex:](self, "visitsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addVisits:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_latitude;
    *(_BYTE *)(v5 + 72) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_longitude;
  *(_BYTE *)(v5 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  *(double *)(v5 + 32) = self->_uncertainty;
  *(_BYTE *)(v5 + 72) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    *(double *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_locationOfInterestType;
    *(_BYTE *)(v6 + 72) |= 0x10u;
  }
  v10 = -[NSData copyWithZone:](self->_geoData, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_visits;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v6, "addVisits:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *uuid;
  NSData *geoData;
  NSMutableArray *visits;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 72);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_latitude != *((double *)v4 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_longitude != *((double *)v4 + 3))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_uncertainty != *((double *)v4 + 4))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_confidence != *((double *)v4 + 1))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_34;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
    {
LABEL_34:
      v10 = 0;
      goto LABEL_35;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 72);
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_locationOfInterestType != *((_DWORD *)v4 + 12))
      goto LABEL_34;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_34;
  }
  geoData = self->_geoData;
  if ((unint64_t)geoData | *((_QWORD *)v4 + 5) && !-[NSData isEqual:](geoData, "isEqual:"))
    goto LABEL_34;
  visits = self->_visits;
  if ((unint64_t)visits | *((_QWORD *)v4 + 8))
    v10 = -[NSMutableArray isEqual:](visits, "isEqual:");
  else
    v10 = 1;
LABEL_35:

  return v10;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double latitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double longitude;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double uncertainty;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double confidence;
  double v21;
  long double v22;
  double v23;
  NSUInteger v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    latitude = self->_latitude;
    v6 = -latitude;
    if (latitude >= 0.0)
      v6 = self->_latitude;
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
  if ((has & 4) != 0)
  {
    longitude = self->_longitude;
    v11 = -longitude;
    if (longitude >= 0.0)
      v11 = self->_longitude;
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
  if ((has & 8) != 0)
  {
    uncertainty = self->_uncertainty;
    v16 = -uncertainty;
    if (uncertainty >= 0.0)
      v16 = self->_uncertainty;
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
    confidence = self->_confidence;
    v21 = -confidence;
    if (confidence >= 0.0)
      v21 = self->_confidence;
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
  v24 = -[NSString hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v25 = 2654435761 * self->_locationOfInterestType;
  else
    v25 = 0;
  v26 = v9 ^ v4 ^ v14 ^ v19 ^ v25 ^ v24;
  v27 = -[NSData hash](self->_geoData, "hash");
  return v26 ^ v27 ^ -[NSMutableArray hash](self->_visits, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 2) != 0)
  {
    self->_latitude = v4[2];
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 72);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if (((_BYTE)v4[9] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_longitude = v4[3];
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_22:
  self->_uncertainty = v4[4];
  *(_BYTE *)&self->_has |= 8u;
  if (((_BYTE)v4[9] & 1) != 0)
  {
LABEL_5:
    self->_confidence = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:
  if (*((_QWORD *)v4 + 7))
    -[HDCodableRoutineLocation setUuid:](self, "setUuid:");
  if (((_BYTE)v5[9] & 0x10) != 0)
  {
    self->_locationOfInterestType = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v5 + 5))
    -[HDCodableRoutineLocation setGeoData:](self, "setGeoData:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v5 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[HDCodableRoutineLocation addVisits:](self, "addVisits:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
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

- (double)uncertainty
{
  return self->_uncertainty;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSData)geoData
{
  return self->_geoData;
}

- (void)setGeoData:(id)a3
{
  objc_storeStrong((id *)&self->_geoData, a3);
}

- (NSMutableArray)visits
{
  return self->_visits;
}

- (void)setVisits:(id)a3
{
  objc_storeStrong((id *)&self->_visits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_geoData, 0);
}

@end
