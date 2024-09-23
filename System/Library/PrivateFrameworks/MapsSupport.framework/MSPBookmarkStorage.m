@implementation MSPBookmarkStorage

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 1;
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
  if ((a3 - 1) < 4)
    return off_1E66545A8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setPosition:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPosition
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasPlaceBookmark
{
  return self->_placeBookmark != 0;
}

- (BOOL)hasRouteBookmark
{
  return self->_routeBookmark != 0;
}

- (BOOL)hasRegionBookmark
{
  return self->_regionBookmark != 0;
}

- (BOOL)hasTransitLineBookmark
{
  return self->_transitLineBookmark != 0;
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
  v8.super_class = (Class)MSPBookmarkStorage;
  -[MSPBookmarkStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPBookmarkStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *identifier;
  char has;
  void *v8;
  void *v9;
  MSPPlaceBookmark *placeBookmark;
  void *v11;
  MSPRouteBookmark *routeBookmark;
  void *v13;
  MSPRegionBookmark *regionBookmark;
  void *v15;
  MSPTransitLineBookmark *transitLineBookmark;
  void *v17;
  PBUnknownFields *unknownFields;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = self->_type - 1;
    if (v4 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E66545A8[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_position);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("position"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

  }
  placeBookmark = self->_placeBookmark;
  if (placeBookmark)
  {
    -[MSPPlaceBookmark dictionaryRepresentation](placeBookmark, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("placeBookmark"));

  }
  routeBookmark = self->_routeBookmark;
  if (routeBookmark)
  {
    -[MSPRouteBookmark dictionaryRepresentation](routeBookmark, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("routeBookmark"));

  }
  regionBookmark = self->_regionBookmark;
  if (regionBookmark)
  {
    -[MSPRegionBookmark dictionaryRepresentation](regionBookmark, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("regionBookmark"));

  }
  transitLineBookmark = self->_transitLineBookmark;
  if (transitLineBookmark)
  {
    -[MSPTransitLineBookmark dictionaryRepresentation](transitLineBookmark, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("transitLineBookmark"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPBookmarkStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
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
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_placeBookmark)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_routeBookmark)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_regionBookmark)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_transitLineBookmark)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[18] = self->_type;
    *((_BYTE *)v4 + 76) |= 4u;
  }
  v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_position;
    *((_BYTE *)v4 + 76) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 76) |= 2u;
  }
  if (self->_placeBookmark)
  {
    objc_msgSend(v6, "setPlaceBookmark:");
    v4 = v6;
  }
  if (self->_routeBookmark)
  {
    objc_msgSend(v6, "setRouteBookmark:");
    v4 = v6;
  }
  if (self->_regionBookmark)
  {
    objc_msgSend(v6, "setRegionBookmark:");
    v4 = v6;
  }
  if (self->_transitLineBookmark)
  {
    objc_msgSend(v6, "setTransitLineBookmark:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_type;
    *(_BYTE *)(v5 + 76) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v6 + 16) = self->_position;
    *(_BYTE *)(v6 + 76) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 24) = self->_timestamp;
    *(_BYTE *)(v6 + 76) |= 2u;
  }
  v10 = -[MSPPlaceBookmark copyWithZone:](self->_placeBookmark, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v10;

  v12 = -[MSPRouteBookmark copyWithZone:](self->_routeBookmark, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v12;

  v14 = -[MSPRegionBookmark copyWithZone:](self->_regionBookmark, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v14;

  v16 = -[MSPTransitLineBookmark copyWithZone:](self->_transitLineBookmark, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v16;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *identifier;
  MSPPlaceBookmark *placeBookmark;
  MSPRouteBookmark *routeBookmark;
  MSPRegionBookmark *regionBookmark;
  MSPTransitLineBookmark *transitLineBookmark;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 76);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_type != *((_DWORD *)v4 + 18))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_28;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
    {
LABEL_28:
      v12 = 0;
      goto LABEL_29;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 76);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_position != *((double *)v4 + 2))
      goto LABEL_28;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestamp != *((double *)v4 + 3))
      goto LABEL_28;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_28;
  }
  placeBookmark = self->_placeBookmark;
  if ((unint64_t)placeBookmark | *((_QWORD *)v4 + 5) && !-[MSPPlaceBookmark isEqual:](placeBookmark, "isEqual:"))
    goto LABEL_28;
  routeBookmark = self->_routeBookmark;
  if ((unint64_t)routeBookmark | *((_QWORD *)v4 + 7))
  {
    if (!-[MSPRouteBookmark isEqual:](routeBookmark, "isEqual:"))
      goto LABEL_28;
  }
  regionBookmark = self->_regionBookmark;
  if ((unint64_t)regionBookmark | *((_QWORD *)v4 + 6))
  {
    if (!-[MSPRegionBookmark isEqual:](regionBookmark, "isEqual:"))
      goto LABEL_28;
  }
  transitLineBookmark = self->_transitLineBookmark;
  if ((unint64_t)transitLineBookmark | *((_QWORD *)v4 + 8))
    v12 = -[MSPTransitLineBookmark isEqual:](transitLineBookmark, "isEqual:");
  else
    v12 = 1;
LABEL_29:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double position;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  double timestamp;
  double v13;
  long double v14;
  double v15;
  NSUInteger v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    position = self->_position;
    v8 = -position;
    if (position >= 0.0)
      v8 = self->_position;
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
  {
    timestamp = self->_timestamp;
    v13 = -timestamp;
    if (timestamp >= 0.0)
      v13 = self->_timestamp;
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
  v16 = v4 ^ v3 ^ v6 ^ v11;
  v17 = -[MSPPlaceBookmark hash](self->_placeBookmark, "hash");
  v18 = v16 ^ v17 ^ -[MSPRouteBookmark hash](self->_routeBookmark, "hash");
  v19 = -[MSPRegionBookmark hash](self->_regionBookmark, "hash");
  return v18 ^ v19 ^ -[MSPTransitLineBookmark hash](self->_transitLineBookmark, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  MSPPlaceBookmark *placeBookmark;
  uint64_t v8;
  MSPRouteBookmark *routeBookmark;
  uint64_t v10;
  MSPRegionBookmark *regionBookmark;
  uint64_t v12;
  MSPTransitLineBookmark *transitLineBookmark;
  uint64_t v14;
  _DWORD *v15;

  v4 = a3;
  v5 = v4;
  if ((v4[19] & 4) != 0)
  {
    self->_type = v4[18];
    *(_BYTE *)&self->_has |= 4u;
  }
  v15 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[MSPBookmarkStorage setIdentifier:](self, "setIdentifier:");
    v5 = v15;
  }
  v6 = *((_BYTE *)v5 + 76);
  if ((v6 & 1) != 0)
  {
    self->_position = *((double *)v5 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v5 + 76);
  }
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((double *)v5 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
  placeBookmark = self->_placeBookmark;
  v8 = *((_QWORD *)v5 + 5);
  if (placeBookmark)
  {
    if (!v8)
      goto LABEL_15;
    -[MSPPlaceBookmark mergeFrom:](placeBookmark, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[MSPBookmarkStorage setPlaceBookmark:](self, "setPlaceBookmark:");
  }
  v5 = v15;
LABEL_15:
  routeBookmark = self->_routeBookmark;
  v10 = *((_QWORD *)v5 + 7);
  if (routeBookmark)
  {
    if (!v10)
      goto LABEL_21;
    -[MSPRouteBookmark mergeFrom:](routeBookmark, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[MSPBookmarkStorage setRouteBookmark:](self, "setRouteBookmark:");
  }
  v5 = v15;
LABEL_21:
  regionBookmark = self->_regionBookmark;
  v12 = *((_QWORD *)v5 + 6);
  if (regionBookmark)
  {
    if (!v12)
      goto LABEL_27;
    -[MSPRegionBookmark mergeFrom:](regionBookmark, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[MSPBookmarkStorage setRegionBookmark:](self, "setRegionBookmark:");
  }
  v5 = v15;
LABEL_27:
  transitLineBookmark = self->_transitLineBookmark;
  v14 = *((_QWORD *)v5 + 8);
  if (transitLineBookmark)
  {
    if (v14)
    {
      -[MSPTransitLineBookmark mergeFrom:](transitLineBookmark, "mergeFrom:");
LABEL_32:
      v5 = v15;
    }
  }
  else if (v14)
  {
    -[MSPBookmarkStorage setTransitLineBookmark:](self, "setTransitLineBookmark:");
    goto LABEL_32;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)position
{
  return self->_position;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (MSPPlaceBookmark)placeBookmark
{
  return self->_placeBookmark;
}

- (void)setPlaceBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_placeBookmark, a3);
}

- (MSPRouteBookmark)routeBookmark
{
  return self->_routeBookmark;
}

- (void)setRouteBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_routeBookmark, a3);
}

- (MSPRegionBookmark)regionBookmark
{
  return self->_regionBookmark;
}

- (void)setRegionBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_regionBookmark, a3);
}

- (MSPTransitLineBookmark)transitLineBookmark
{
  return self->_transitLineBookmark;
}

- (void)setTransitLineBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_transitLineBookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLineBookmark, 0);
  objc_storeStrong((id *)&self->_routeBookmark, 0);
  objc_storeStrong((id *)&self->_regionBookmark, 0);
  objc_storeStrong((id *)&self->_placeBookmark, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
