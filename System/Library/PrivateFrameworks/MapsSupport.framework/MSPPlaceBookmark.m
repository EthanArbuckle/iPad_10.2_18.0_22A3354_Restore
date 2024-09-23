@implementation MSPPlaceBookmark

- (BOOL)hasMapItemStorage
{
  return self->_mapItemStorage != 0;
}

- (int)origin
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_origin;
  else
    return 0;
}

- (void)setOrigin:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOrigin
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)originAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("OTHER");
  if (a3 == 1)
  {
    v3 = CFSTR("DROPPED_PIN");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DROPPED_PIN"));

  return v4;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasDroppedPinCoordinate
{
  return self->_droppedPinCoordinate != 0;
}

- (void)setDroppedPinFloorOrdinal:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_droppedPinFloorOrdinal = a3;
}

- (void)setHasDroppedPinFloorOrdinal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDroppedPinFloorOrdinal
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)MSPPlaceBookmark;
  -[MSPPlaceBookmark description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPPlaceBookmark dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOMapItemStorage *mapItemStorage;
  void *v5;
  int origin;
  __CFString *v7;
  NSString *title;
  GEOLatLng *droppedPinCoordinate;
  void *v10;
  void *v11;
  PBUnknownFields *unknownFields;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  mapItemStorage = self->_mapItemStorage;
  if (mapItemStorage)
  {
    -[GEOMapItemStorage dictionaryRepresentation](mapItemStorage, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mapItemStorage"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    origin = self->_origin;
    if (origin)
    {
      if (origin == 1)
      {
        v7 = CFSTR("DROPPED_PIN");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_origin);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("OTHER");
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("origin"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  droppedPinCoordinate = self->_droppedPinCoordinate;
  if (droppedPinCoordinate)
  {
    -[GEOLatLng dictionaryRepresentation](droppedPinCoordinate, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("droppedPinCoordinate"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_droppedPinFloorOrdinal);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("droppedPinFloorOrdinal"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPlaceBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_mapItemStorage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_droppedPinCoordinate)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_mapItemStorage)
  {
    objc_msgSend(v4, "setMapItemStorage:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_origin;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_droppedPinCoordinate)
  {
    objc_msgSend(v5, "setDroppedPinCoordinate:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_droppedPinFloorOrdinal;
    *((_BYTE *)v4 + 56) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOMapItemStorage copyWithZone:](self->_mapItemStorage, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_origin;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[GEOLatLng copyWithZone:](self->_droppedPinCoordinate, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_droppedPinFloorOrdinal;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapItemStorage *mapItemStorage;
  NSString *title;
  GEOLatLng *droppedPinCoordinate;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  mapItemStorage = self->_mapItemStorage;
  if ((unint64_t)mapItemStorage | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOMapItemStorage isEqual:](mapItemStorage, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_origin != *((_DWORD *)v4 + 10))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_17;
  droppedPinCoordinate = self->_droppedPinCoordinate;
  if ((unint64_t)droppedPinCoordinate | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](droppedPinCoordinate, "isEqual:"))
      goto LABEL_17;
  }
  v8 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_droppedPinFloorOrdinal != *((_DWORD *)v4 + 6))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[GEOMapItemStorage hash](self->_mapItemStorage, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_origin;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_title, "hash");
  v6 = -[GEOLatLng hash](self->_droppedPinCoordinate, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_droppedPinFloorOrdinal;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOMapItemStorage *mapItemStorage;
  uint64_t v6;
  GEOLatLng *droppedPinCoordinate;
  uint64_t v8;
  id v9;

  v4 = a3;
  mapItemStorage = self->_mapItemStorage;
  v6 = *((_QWORD *)v4 + 4);
  v9 = v4;
  if (mapItemStorage)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOMapItemStorage mergeFrom:](mapItemStorage, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MSPPlaceBookmark setMapItemStorage:](self, "setMapItemStorage:");
  }
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    self->_origin = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[MSPPlaceBookmark setTitle:](self, "setTitle:");
    v4 = v9;
  }
  droppedPinCoordinate = self->_droppedPinCoordinate;
  v8 = *((_QWORD *)v4 + 2);
  if (droppedPinCoordinate)
  {
    if (!v8)
      goto LABEL_17;
    -[GEOLatLng mergeFrom:](droppedPinCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    -[MSPPlaceBookmark setDroppedPinCoordinate:](self, "setDroppedPinCoordinate:");
  }
  v4 = v9;
LABEL_17:
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_droppedPinFloorOrdinal = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOMapItemStorage)mapItemStorage
{
  return self->_mapItemStorage;
}

- (void)setMapItemStorage:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemStorage, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (GEOLatLng)droppedPinCoordinate
{
  return self->_droppedPinCoordinate;
}

- (void)setDroppedPinCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_droppedPinCoordinate, a3);
}

- (int)droppedPinFloorOrdinal
{
  return self->_droppedPinFloorOrdinal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mapItemStorage, 0);
  objc_storeStrong((id *)&self->_droppedPinCoordinate, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
