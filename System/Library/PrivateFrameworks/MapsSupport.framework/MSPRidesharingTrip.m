@implementation MSPRidesharingTrip

- (BOOL)hasStartWaypoint
{
  return self->_startWaypoint != 0;
}

- (BOOL)hasEndWaypoint
{
  return self->_endWaypoint != 0;
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
  v8.super_class = (Class)MSPRidesharingTrip;
  -[MSPRidesharingTrip description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPRidesharingTrip dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  GEOComposedWaypoint *startWaypoint;
  void *v5;
  GEOComposedWaypoint *endWaypoint;
  void *v7;
  PBUnknownFields *unknownFields;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  startWaypoint = self->_startWaypoint;
  if (startWaypoint)
  {
    -[GEOComposedWaypoint dictionaryRepresentation](startWaypoint, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("startWaypoint"));

  }
  endWaypoint = self->_endWaypoint;
  if (endWaypoint)
  {
    -[GEOComposedWaypoint dictionaryRepresentation](endWaypoint, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("endWaypoint"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPRidesharingTripReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_startWaypoint)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_endWaypoint)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_startWaypoint)
  {
    objc_msgSend(v4, "setStartWaypoint:");
    v4 = v5;
  }
  if (self->_endWaypoint)
  {
    objc_msgSend(v5, "setEndWaypoint:");
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
  v6 = -[GEOComposedWaypoint copyWithZone:](self->_startWaypoint, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[GEOComposedWaypoint copyWithZone:](self->_endWaypoint, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOComposedWaypoint *startWaypoint;
  GEOComposedWaypoint *endWaypoint;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((startWaypoint = self->_startWaypoint, !((unint64_t)startWaypoint | v4[3]))
     || -[GEOComposedWaypoint isEqual:](startWaypoint, "isEqual:")))
  {
    endWaypoint = self->_endWaypoint;
    if ((unint64_t)endWaypoint | v4[2])
      v7 = -[GEOComposedWaypoint isEqual:](endWaypoint, "isEqual:");
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

  v3 = -[GEOComposedWaypoint hash](self->_startWaypoint, "hash");
  return -[GEOComposedWaypoint hash](self->_endWaypoint, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOComposedWaypoint *startWaypoint;
  uint64_t v6;
  GEOComposedWaypoint *endWaypoint;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  startWaypoint = self->_startWaypoint;
  v6 = v4[3];
  v9 = v4;
  if (startWaypoint)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOComposedWaypoint mergeFrom:](startWaypoint, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[MSPRidesharingTrip setStartWaypoint:](self, "setStartWaypoint:");
  }
  v4 = v9;
LABEL_7:
  endWaypoint = self->_endWaypoint;
  v8 = v4[2];
  if (endWaypoint)
  {
    if (v8)
    {
      -[GEOComposedWaypoint mergeFrom:](endWaypoint, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[MSPRidesharingTrip setEndWaypoint:](self, "setEndWaypoint:");
    goto LABEL_12;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (GEOComposedWaypoint)startWaypoint
{
  return self->_startWaypoint;
}

- (void)setStartWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_startWaypoint, a3);
}

- (GEOComposedWaypoint)endWaypoint
{
  return self->_endWaypoint;
}

- (void)setEndWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_endWaypoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startWaypoint, 0);
  objc_storeStrong((id *)&self->_endWaypoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
