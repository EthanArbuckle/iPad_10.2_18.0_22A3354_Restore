@implementation MSPHistoryEntryStorage

- (int)searchType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_searchType;
  else
    return 1;
}

- (void)setSearchType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_searchType = a3;
}

- (void)setHasSearchType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSearchType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)searchTypeAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E6653A00[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUERY_SEARCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_SEARCH")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_DISPLAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_ITEM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARING_TRIP")))
  {
    v4 = 5;
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

- (BOOL)hasQuerySearch
{
  return self->_querySearch != 0;
}

- (BOOL)hasDirectionsSearch
{
  return self->_directionsSearch != 0;
}

- (BOOL)hasPlaceDisplay
{
  return self->_placeDisplay != 0;
}

- (BOOL)hasTransitLineItem
{
  return self->_transitLineItem != 0;
}

- (BOOL)hasRidesharingTrip
{
  return self->_ridesharingTrip != 0;
}

- (void)setTracksRAPRecordingOnly:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tracksRAPRecordingOnly = a3;
}

- (void)setHasTracksRAPRecordingOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTracksRAPRecordingOnly
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)MSPHistoryEntryStorage;
  -[MSPHistoryEntryStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPHistoryEntryStorage dictionaryRepresentation](self, "dictionaryRepresentation");
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
  MSPQuerySearch *querySearch;
  void *v11;
  MSPDirectionsSearch *directionsSearch;
  void *v13;
  MSPPlaceDisplay *placeDisplay;
  void *v15;
  MSPTransitStorageLineItem *transitLineItem;
  void *v17;
  MSPRidesharingTrip *ridesharingTrip;
  void *v19;
  void *v20;
  PBUnknownFields *unknownFields;
  void *v22;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = self->_searchType - 1;
    if (v4 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_searchType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E6653A00[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("searchType"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_position);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("position"));

  }
  querySearch = self->_querySearch;
  if (querySearch)
  {
    -[MSPQuerySearch dictionaryRepresentation](querySearch, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("querySearch"));

  }
  directionsSearch = self->_directionsSearch;
  if (directionsSearch)
  {
    -[MSPDirectionsSearch dictionaryRepresentation](directionsSearch, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("directionsSearch"));

  }
  placeDisplay = self->_placeDisplay;
  if (placeDisplay)
  {
    -[MSPPlaceDisplay dictionaryRepresentation](placeDisplay, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("placeDisplay"));

  }
  transitLineItem = self->_transitLineItem;
  if (transitLineItem)
  {
    -[MSPTransitStorageLineItem dictionaryRepresentation](transitLineItem, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("transitLineItem"));

  }
  ridesharingTrip = self->_ridesharingTrip;
  if (ridesharingTrip)
  {
    -[MSPRidesharingTrip dictionaryRepresentation](ridesharingTrip, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("ridesharingTrip"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_tracksRAPRecordingOnly);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("tracksRAPRecordingOnly"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPHistoryEntryStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_querySearch)
    PBDataWriterWriteSubmessage();
  if (self->_directionsSearch)
    PBDataWriterWriteSubmessage();
  if (self->_placeDisplay)
    PBDataWriterWriteSubmessage();
  if (self->_transitLineItem)
    PBDataWriterWriteSubmessage();
  if (self->_ridesharingTrip)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[18] = self->_searchType;
    *((_BYTE *)v4 + 92) |= 4u;
  }
  v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 92) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_position;
    *((_BYTE *)v4 + 92) |= 1u;
  }
  if (self->_querySearch)
  {
    objc_msgSend(v6, "setQuerySearch:");
    v4 = v6;
  }
  if (self->_directionsSearch)
  {
    objc_msgSend(v6, "setDirectionsSearch:");
    v4 = v6;
  }
  if (self->_placeDisplay)
  {
    objc_msgSend(v6, "setPlaceDisplay:");
    v4 = v6;
  }
  if (self->_transitLineItem)
  {
    objc_msgSend(v6, "setTransitLineItem:");
    v4 = v6;
  }
  if (self->_ridesharingTrip)
  {
    objc_msgSend(v6, "setRidesharingTrip:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v4 + 88) = self->_tracksRAPRecordingOnly;
    *((_BYTE *)v4 + 92) |= 8u;
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
  id v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_searchType;
    *(_BYTE *)(v5 + 92) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v6 + 24) = self->_timestamp;
    *(_BYTE *)(v6 + 92) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v6 + 16) = self->_position;
    *(_BYTE *)(v6 + 92) |= 1u;
  }
  v10 = -[MSPQuerySearch copyWithZone:](self->_querySearch, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  v12 = -[MSPDirectionsSearch copyWithZone:](self->_directionsSearch, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v12;

  v14 = -[MSPPlaceDisplay copyWithZone:](self->_placeDisplay, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v14;

  v16 = -[MSPTransitStorageLineItem copyWithZone:](self->_transitLineItem, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v16;

  v18 = -[MSPRidesharingTrip copyWithZone:](self->_ridesharingTrip, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v18;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v6 + 88) = self->_tracksRAPRecordingOnly;
    *(_BYTE *)(v6 + 92) |= 8u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *identifier;
  MSPQuerySearch *querySearch;
  MSPDirectionsSearch *directionsSearch;
  MSPPlaceDisplay *placeDisplay;
  MSPTransitStorageLineItem *transitLineItem;
  MSPRidesharingTrip *ridesharingTrip;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 92);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0 || self->_searchType != *((_DWORD *)v4 + 18))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_32;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_32;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 92);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestamp != *((double *)v4 + 3))
      goto LABEL_32;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_position != *((double *)v4 + 2))
      goto LABEL_32;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_32;
  }
  querySearch = self->_querySearch;
  if ((unint64_t)querySearch | *((_QWORD *)v4 + 7) && !-[MSPQuerySearch isEqual:](querySearch, "isEqual:"))
    goto LABEL_32;
  directionsSearch = self->_directionsSearch;
  if ((unint64_t)directionsSearch | *((_QWORD *)v4 + 4))
  {
    if (!-[MSPDirectionsSearch isEqual:](directionsSearch, "isEqual:"))
      goto LABEL_32;
  }
  placeDisplay = self->_placeDisplay;
  if ((unint64_t)placeDisplay | *((_QWORD *)v4 + 6))
  {
    if (!-[MSPPlaceDisplay isEqual:](placeDisplay, "isEqual:"))
      goto LABEL_32;
  }
  transitLineItem = self->_transitLineItem;
  if ((unint64_t)transitLineItem | *((_QWORD *)v4 + 10))
  {
    if (!-[MSPTransitStorageLineItem isEqual:](transitLineItem, "isEqual:"))
      goto LABEL_32;
  }
  ridesharingTrip = self->_ridesharingTrip;
  if ((unint64_t)ridesharingTrip | *((_QWORD *)v4 + 8))
  {
    if (!-[MSPRidesharingTrip isEqual:](ridesharingTrip, "isEqual:"))
      goto LABEL_32;
  }
  v13 = (*((_BYTE *)v4 + 92) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) != 0)
    {
      if (self->_tracksRAPRecordingOnly)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 88))
      {
        goto LABEL_32;
      }
      v13 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v13 = 0;
  }
LABEL_33:

  return v13;
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
  double position;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v23 = 2654435761 * self->_searchType;
  else
    v23 = 0;
  v21 = -[NSString hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
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
  if ((has & 1) != 0)
  {
    position = self->_position;
    v11 = -position;
    if (position >= 0.0)
      v11 = self->_position;
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
  v14 = -[MSPQuerySearch hash](self->_querySearch, "hash", v21);
  v15 = -[MSPDirectionsSearch hash](self->_directionsSearch, "hash");
  v16 = -[MSPPlaceDisplay hash](self->_placeDisplay, "hash");
  v17 = -[MSPTransitStorageLineItem hash](self->_transitLineItem, "hash");
  v18 = -[MSPRidesharingTrip hash](self->_ridesharingTrip, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v19 = 2654435761 * self->_tracksRAPRecordingOnly;
  else
    v19 = 0;
  return v22 ^ v23 ^ v4 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  MSPQuerySearch *querySearch;
  uint64_t v8;
  MSPDirectionsSearch *directionsSearch;
  uint64_t v10;
  MSPPlaceDisplay *placeDisplay;
  uint64_t v12;
  MSPTransitStorageLineItem *transitLineItem;
  uint64_t v14;
  MSPRidesharingTrip *ridesharingTrip;
  uint64_t v16;
  _DWORD *v17;

  v4 = a3;
  v5 = v4;
  if ((v4[23] & 4) != 0)
  {
    self->_searchType = v4[18];
    *(_BYTE *)&self->_has |= 4u;
  }
  v17 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[MSPHistoryEntryStorage setIdentifier:](self, "setIdentifier:");
    v5 = v17;
  }
  v6 = *((_BYTE *)v5 + 92);
  if ((v6 & 2) != 0)
  {
    self->_timestamp = *((double *)v5 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v5 + 92);
  }
  if ((v6 & 1) != 0)
  {
    self->_position = *((double *)v5 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  querySearch = self->_querySearch;
  v8 = *((_QWORD *)v5 + 7);
  if (querySearch)
  {
    if (!v8)
      goto LABEL_15;
    -[MSPQuerySearch mergeFrom:](querySearch, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[MSPHistoryEntryStorage setQuerySearch:](self, "setQuerySearch:");
  }
  v5 = v17;
LABEL_15:
  directionsSearch = self->_directionsSearch;
  v10 = *((_QWORD *)v5 + 4);
  if (directionsSearch)
  {
    if (!v10)
      goto LABEL_21;
    -[MSPDirectionsSearch mergeFrom:](directionsSearch, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[MSPHistoryEntryStorage setDirectionsSearch:](self, "setDirectionsSearch:");
  }
  v5 = v17;
LABEL_21:
  placeDisplay = self->_placeDisplay;
  v12 = *((_QWORD *)v5 + 6);
  if (placeDisplay)
  {
    if (!v12)
      goto LABEL_27;
    -[MSPPlaceDisplay mergeFrom:](placeDisplay, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[MSPHistoryEntryStorage setPlaceDisplay:](self, "setPlaceDisplay:");
  }
  v5 = v17;
LABEL_27:
  transitLineItem = self->_transitLineItem;
  v14 = *((_QWORD *)v5 + 10);
  if (transitLineItem)
  {
    if (!v14)
      goto LABEL_33;
    -[MSPTransitStorageLineItem mergeFrom:](transitLineItem, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[MSPHistoryEntryStorage setTransitLineItem:](self, "setTransitLineItem:");
  }
  v5 = v17;
LABEL_33:
  ridesharingTrip = self->_ridesharingTrip;
  v16 = *((_QWORD *)v5 + 8);
  if (ridesharingTrip)
  {
    if (!v16)
      goto LABEL_39;
    -[MSPRidesharingTrip mergeFrom:](ridesharingTrip, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_39;
    -[MSPHistoryEntryStorage setRidesharingTrip:](self, "setRidesharingTrip:");
  }
  v5 = v17;
LABEL_39:
  if ((*((_BYTE *)v5 + 92) & 8) != 0)
  {
    self->_tracksRAPRecordingOnly = *((_BYTE *)v5 + 88);
    *(_BYTE *)&self->_has |= 8u;
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

- (double)timestamp
{
  return self->_timestamp;
}

- (double)position
{
  return self->_position;
}

- (MSPQuerySearch)querySearch
{
  return self->_querySearch;
}

- (void)setQuerySearch:(id)a3
{
  objc_storeStrong((id *)&self->_querySearch, a3);
}

- (MSPDirectionsSearch)directionsSearch
{
  return self->_directionsSearch;
}

- (void)setDirectionsSearch:(id)a3
{
  objc_storeStrong((id *)&self->_directionsSearch, a3);
}

- (MSPPlaceDisplay)placeDisplay
{
  return self->_placeDisplay;
}

- (void)setPlaceDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_placeDisplay, a3);
}

- (MSPTransitStorageLineItem)transitLineItem
{
  return self->_transitLineItem;
}

- (void)setTransitLineItem:(id)a3
{
  objc_storeStrong((id *)&self->_transitLineItem, a3);
}

- (MSPRidesharingTrip)ridesharingTrip
{
  return self->_ridesharingTrip;
}

- (void)setRidesharingTrip:(id)a3
{
  objc_storeStrong((id *)&self->_ridesharingTrip, a3);
}

- (BOOL)tracksRAPRecordingOnly
{
  return self->_tracksRAPRecordingOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLineItem, 0);
  objc_storeStrong((id *)&self->_ridesharingTrip, 0);
  objc_storeStrong((id *)&self->_querySearch, 0);
  objc_storeStrong((id *)&self->_placeDisplay, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_directionsSearch, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
