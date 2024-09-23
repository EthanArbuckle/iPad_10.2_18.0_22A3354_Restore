@implementation HDCodableRoutinePredictedLocation

- (BOOL)hasLocationOfInterest
{
  return self->_locationOfInterest != 0;
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

- (void)setNextEntryTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nextEntryTime = a3;
}

- (void)setHasNextEntryTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNextEntryTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)modeOfTransportation
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_modeOfTransportation;
  else
    return -1;
}

- (void)setModeOfTransportation:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_modeOfTransportation = a3;
}

- (void)setHasModeOfTransportation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModeOfTransportation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)modeOfTransportationAsString:(int)a3
{
  if ((a3 + 1) < 3)
    return off_1E6CEA070[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeOfTransportation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownMode")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Walking")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Driving")))
  {
    v4 = 1;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (int)sourceType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_sourceType;
  else
    return 0;
}

- (void)setSourceType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sourceType = a3;
}

- (void)setHasSourceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSourceType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)sourceTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E6CEA088[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownSource")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Bluetooth")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CoreRoutine")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EventKit")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LocationVisit")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasGeoData
{
  return self->_geoData != 0;
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
  v8.super_class = (Class)HDCodableRoutinePredictedLocation;
  -[HDCodableRoutinePredictedLocation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableRoutinePredictedLocation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableRoutineLocation *locationOfInterest;
  void *v5;
  char has;
  void *v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  uint64_t sourceType;
  __CFString *v12;
  NSData *geoData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest)
  {
    -[HDCodableRoutineLocation dictionaryRepresentation](locationOfInterest, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("locationOfInterest"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("confidence"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_10:
      v9 = self->_modeOfTransportation + 1;
      if (v9 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeOfTransportation);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E6CEA070[v9];
      }
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("modeOfTransportation"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_18;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_nextEntryTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("nextEntryTime"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_10;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_14:
    sourceType = self->_sourceType;
    if (sourceType >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sourceType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E6CEA088[sourceType];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sourceType"));

  }
LABEL_18:
  geoData = self->_geoData;
  if (geoData)
    objc_msgSend(v3, "setObject:forKey:", geoData, CFSTR("geoData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutinePredictedLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_locationOfInterest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_8:
  if (self->_geoData)
  {
    PBDataWriterWriteDataField();
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
  if (self->_locationOfInterest)
  {
    objc_msgSend(v4, "setLocationOfInterest:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_confidence;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_nextEntryTime;
  *((_BYTE *)v4 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v4 + 10) = self->_modeOfTransportation;
  *((_BYTE *)v4 + 48) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 11) = self->_sourceType;
    *((_BYTE *)v4 + 48) |= 8u;
  }
LABEL_8:
  if (self->_geoData)
  {
    objc_msgSend(v6, "setGeoData:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableRoutineLocation copyWithZone:](self->_locationOfInterest, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 40) = self->_modeOfTransportation;
      *(_BYTE *)(v5 + 48) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_nextEntryTime;
  *(_BYTE *)(v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 44) = self->_sourceType;
    *(_BYTE *)(v5 + 48) |= 8u;
  }
LABEL_6:
  v9 = -[NSData copyWithZone:](self->_geoData, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableRoutineLocation *locationOfInterest;
  NSData *geoData;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  locationOfInterest = self->_locationOfInterest;
  if ((unint64_t)locationOfInterest | *((_QWORD *)v4 + 4))
  {
    if (!-[HDCodableRoutineLocation isEqual:](locationOfInterest, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_confidence != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_26:
    v7 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_nextEntryTime != *((double *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_modeOfTransportation != *((_DWORD *)v4 + 10))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_sourceType != *((_DWORD *)v4 + 11))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  geoData = self->_geoData;
  if ((unint64_t)geoData | *((_QWORD *)v4 + 3))
    v7 = -[NSData isEqual:](geoData, "isEqual:");
  else
    v7 = 1;
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  double confidence;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double nextEntryTime;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;

  v3 = -[HDCodableRoutineLocation hash](self->_locationOfInterest, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    confidence = self->_confidence;
    v7 = -confidence;
    if (confidence >= 0.0)
      v7 = self->_confidence;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 2) != 0)
  {
    nextEntryTime = self->_nextEntryTime;
    v12 = -nextEntryTime;
    if (nextEntryTime >= 0.0)
      v12 = self->_nextEntryTime;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 4) != 0)
  {
    v15 = 2654435761 * self->_modeOfTransportation;
    if ((has & 8) != 0)
      goto LABEL_19;
LABEL_21:
    v16 = 0;
    return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ -[NSData hash](self->_geoData, "hash");
  }
  v15 = 0;
  if ((has & 8) == 0)
    goto LABEL_21;
LABEL_19:
  v16 = 2654435761 * self->_sourceType;
  return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ -[NSData hash](self->_geoData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableRoutineLocation *locationOfInterest;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  locationOfInterest = self->_locationOfInterest;
  v6 = *((_QWORD *)v4 + 4);
  v8 = v4;
  if (locationOfInterest)
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableRoutineLocation mergeFrom:](locationOfInterest, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HDCodableRoutinePredictedLocation setLocationOfInterest:](self, "setLocationOfInterest:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 1) != 0)
  {
    self->_confidence = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 48);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_nextEntryTime = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  self->_modeOfTransportation = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
LABEL_11:
    self->_sourceType = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCodableRoutinePredictedLocation setGeoData:](self, "setGeoData:");
    v4 = v8;
  }

}

- (HDCodableRoutineLocation)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterest, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (double)nextEntryTime
{
  return self->_nextEntryTime;
}

- (NSData)geoData
{
  return self->_geoData;
}

- (void)setGeoData:(id)a3
{
  objc_storeStrong((id *)&self->_geoData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_geoData, 0);
}

@end
