@implementation MSPDroppedPin

- (BOOL)hasLatLng
{
  return self->_latLng != 0;
}

- (BOOL)hasMapRegion
{
  return self->_mapRegion != 0;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFloorOrdinal:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_floorOrdinal = a3;
}

- (void)setHasFloorOrdinal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFloorOrdinal
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
  v8.super_class = (Class)MSPDroppedPin;
  -[MSPDroppedPin description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPDroppedPin dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOLatLng *latLng;
  void *v5;
  GEOMapRegion *mapRegion;
  void *v7;
  char has;
  void *v9;
  void *v10;
  PBUnknownFields *unknownFields;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  latLng = self->_latLng;
  if (latLng)
  {
    -[GEOLatLng dictionaryRepresentation](latLng, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("latLng"));

  }
  mapRegion = self->_mapRegion;
  if (mapRegion)
  {
    -[GEOMapRegion dictionaryRepresentation](mapRegion, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("mapRegion"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_floorOrdinal);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("floorOrdinal"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPDroppedPinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_latLng)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_mapRegion)
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_latLng)
  {
    objc_msgSend(v4, "setLatLng:");
    v4 = v6;
  }
  if (self->_mapRegion)
  {
    objc_msgSend(v6, "setMapRegion:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_floorOrdinal;
    *((_BYTE *)v4 + 48) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOLatLng copyWithZone:](self->_latLng, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_floorOrdinal;
    *(_BYTE *)(v5 + 48) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLng *latLng;
  GEOMapRegion *mapRegion;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  latLng = self->_latLng;
  if ((unint64_t)latLng | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](latLng, "isEqual:"))
      goto LABEL_15;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((double *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 48) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_floorOrdinal != *((_DWORD *)v4 + 6))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  char has;
  unint64_t v6;
  double timestamp;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;

  v3 = -[GEOLatLng hash](self->_latLng, "hash");
  v4 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v8 = -timestamp;
    if (timestamp >= 0.0)
      v8 = self->_timestamp;
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
  if ((has & 2) != 0)
    v11 = 2654435761 * self->_floorOrdinal;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOLatLng *latLng;
  uint64_t v6;
  GEOMapRegion *mapRegion;
  uint64_t v8;
  char v9;
  id v10;

  v4 = a3;
  latLng = self->_latLng;
  v6 = *((_QWORD *)v4 + 4);
  v10 = v4;
  if (latLng)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLatLng mergeFrom:](latLng, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MSPDroppedPin setLatLng:](self, "setLatLng:");
  }
  v4 = v10;
LABEL_7:
  mapRegion = self->_mapRegion;
  v8 = *((_QWORD *)v4 + 5);
  if (mapRegion)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[MSPDroppedPin setMapRegion:](self, "setMapRegion:");
  }
  v4 = v10;
LABEL_13:
  v9 = *((_BYTE *)v4 + 48);
  if ((v9 & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v9 = *((_BYTE *)v4 + 48);
  }
  if ((v9 & 2) != 0)
  {
    self->_floorOrdinal = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (void)setLatLng:(id)a3
{
  objc_storeStrong((id *)&self->_latLng, a3);
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)floorOrdinal
{
  return self->_floorOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
