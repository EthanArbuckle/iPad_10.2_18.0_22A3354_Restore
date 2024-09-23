@implementation MSPPlaceDisplay

- (BOOL)hasPlaceMapItemStorage
{
  return self->_placeMapItemStorage != 0;
}

- (BOOL)hasSupersededSearchIdentifier
{
  return self->_supersededSearchIdentifier != 0;
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
  v8.super_class = (Class)MSPPlaceDisplay;
  -[MSPPlaceDisplay description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPPlaceDisplay dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOMapItemStorage *placeMapItemStorage;
  void *v5;
  NSString *supersededSearchIdentifier;
  PBUnknownFields *unknownFields;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  placeMapItemStorage = self->_placeMapItemStorage;
  if (placeMapItemStorage)
  {
    -[GEOMapItemStorage dictionaryRepresentation](placeMapItemStorage, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("placeMapItemStorage"));

  }
  supersededSearchIdentifier = self->_supersededSearchIdentifier;
  if (supersededSearchIdentifier)
    objc_msgSend(v3, "setObject:forKey:", supersededSearchIdentifier, CFSTR("supersededSearchIdentifier"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPlaceDisplayReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_placeMapItemStorage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_supersededSearchIdentifier)
  {
    PBDataWriterWriteStringField();
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
  if (self->_placeMapItemStorage)
  {
    objc_msgSend(v4, "setPlaceMapItemStorage:");
    v4 = v5;
  }
  if (self->_supersededSearchIdentifier)
  {
    objc_msgSend(v5, "setSupersededSearchIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOMapItemStorage copyWithZone:](self->_placeMapItemStorage, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_supersededSearchIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOMapItemStorage *placeMapItemStorage;
  NSString *supersededSearchIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((placeMapItemStorage = self->_placeMapItemStorage, !((unint64_t)placeMapItemStorage | v4[2]))
     || -[GEOMapItemStorage isEqual:](placeMapItemStorage, "isEqual:")))
  {
    supersededSearchIdentifier = self->_supersededSearchIdentifier;
    if ((unint64_t)supersededSearchIdentifier | v4[3])
      v7 = -[NSString isEqual:](supersededSearchIdentifier, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[GEOMapItemStorage hash](self->_placeMapItemStorage, "hash");
  return -[NSString hash](self->_supersededSearchIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOMapItemStorage *placeMapItemStorage;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  placeMapItemStorage = self->_placeMapItemStorage;
  v6 = v4[2];
  v7 = v4;
  if (placeMapItemStorage)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOMapItemStorage mergeFrom:](placeMapItemStorage, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MSPPlaceDisplay setPlaceMapItemStorage:](self, "setPlaceMapItemStorage:");
  }
  v4 = v7;
LABEL_7:
  if (v4[3])
  {
    -[MSPPlaceDisplay setSupersededSearchIdentifier:](self, "setSupersededSearchIdentifier:");
    v4 = v7;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOMapItemStorage)placeMapItemStorage
{
  return self->_placeMapItemStorage;
}

- (void)setPlaceMapItemStorage:(id)a3
{
  objc_storeStrong((id *)&self->_placeMapItemStorage, a3);
}

- (NSString)supersededSearchIdentifier
{
  return self->_supersededSearchIdentifier;
}

- (void)setSupersededSearchIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_supersededSearchIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supersededSearchIdentifier, 0);
  objc_storeStrong((id *)&self->_placeMapItemStorage, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
