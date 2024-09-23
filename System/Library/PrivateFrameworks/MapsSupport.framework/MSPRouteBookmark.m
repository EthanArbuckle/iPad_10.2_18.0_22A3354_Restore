@implementation MSPRouteBookmark

- (BOOL)hasRouteRequestStorage
{
  return self->_routeRequestStorage != 0;
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
  v8.super_class = (Class)MSPRouteBookmark;
  -[MSPRouteBookmark description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPRouteBookmark dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  void *v5;
  PBUnknownFields *unknownFields;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  routeRequestStorage = self->_routeRequestStorage;
  if (routeRequestStorage)
  {
    -[GEOStorageRouteRequestStorage dictionaryRepresentation](routeRequestStorage, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("routeRequestStorage"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPRouteBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_routeRequestStorage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  GEOStorageRouteRequestStorage *routeRequestStorage;

  routeRequestStorage = self->_routeRequestStorage;
  if (routeRequestStorage)
    objc_msgSend(a3, "setRouteRequestStorage:", routeRequestStorage);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOStorageRouteRequestStorage copyWithZone:](self->_routeRequestStorage, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    routeRequestStorage = self->_routeRequestStorage;
    if ((unint64_t)routeRequestStorage | v4[2])
      v6 = -[GEOStorageRouteRequestStorage isEqual:](routeRequestStorage, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[GEOStorageRouteRequestStorage hash](self->_routeRequestStorage, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  routeRequestStorage = self->_routeRequestStorage;
  v6 = v4[2];
  if (routeRequestStorage)
  {
    if (v6)
    {
      v7 = v4;
      -[GEOStorageRouteRequestStorage mergeFrom:](routeRequestStorage, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[MSPRouteBookmark setRouteRequestStorage:](self, "setRouteRequestStorage:");
    goto LABEL_6;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  return self->_routeRequestStorage;
}

- (void)setRouteRequestStorage:(id)a3
{
  objc_storeStrong((id *)&self->_routeRequestStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRequestStorage, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
