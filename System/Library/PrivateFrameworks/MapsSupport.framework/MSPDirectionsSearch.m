@implementation MSPDirectionsSearch

- (BOOL)hasRouteRequestStorage
{
  return self->_routeRequestStorage != 0;
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_navigationInterrupted = a3;
}

- (void)setHasNavigationInterrupted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNavigationInterrupted
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
  v8.super_class = (Class)MSPDirectionsSearch;
  -[MSPDirectionsSearch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPDirectionsSearch dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  PBUnknownFields *unknownFields;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  routeRequestStorage = self->_routeRequestStorage;
  if (routeRequestStorage)
  {
    -[GEOStorageRouteRequestStorage dictionaryRepresentation](routeRequestStorage, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("routeRequestStorage"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_navigationInterrupted);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("navigationInterrupted"));

  }
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
  return MSPDirectionsSearchReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if (self->_routeRequestStorage)
  {
    v5 = v4;
    objc_msgSend(v4, "setRouteRequestStorage:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_navigationInterrupted;
    v4[28] |= 1u;
  }

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

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_navigationInterrupted;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  routeRequestStorage = self->_routeRequestStorage;
  if ((unint64_t)routeRequestStorage | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOStorageRouteRequestStorage isEqual:](routeRequestStorage, "isEqual:"))
      goto LABEL_6;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
    if (self->_navigationInterrupted)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_6;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_6;
    }
    v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[GEOStorageRouteRequestStorage hash](self->_routeRequestStorage, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_navigationInterrupted;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOStorageRouteRequestStorage *routeRequestStorage;
  uint64_t v6;
  id v7;

  v4 = a3;
  routeRequestStorage = self->_routeRequestStorage;
  v6 = *((_QWORD *)v4 + 2);
  if (routeRequestStorage)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[GEOStorageRouteRequestStorage mergeFrom:](routeRequestStorage, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[MSPDirectionsSearch setRouteRequestStorage:](self, "setRouteRequestStorage:");
  }
  v4 = v7;
LABEL_7:
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_navigationInterrupted = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
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

- (BOOL)navigationInterrupted
{
  return self->_navigationInterrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRequestStorage, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
