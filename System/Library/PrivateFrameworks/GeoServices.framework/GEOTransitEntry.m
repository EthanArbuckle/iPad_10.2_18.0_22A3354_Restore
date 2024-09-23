@implementation GEOTransitEntry

- (unint64_t)tripMuid
{
  return self->_tripMuid;
}

- (void)setTripMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_tripMuid = a3;
}

- (void)setHasTripMuid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTripMuid
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unint64_t)lineMuid
{
  return self->_lineMuid;
}

- (void)setLineMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_lineMuid = a3;
}

- (void)setHasLineMuid:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLineMuid
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)tripStaticDepartureTime
{
  return self->_tripStaticDepartureTime;
}

- (void)setTripStaticDepartureTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_tripStaticDepartureTime = a3;
}

- (void)setHasTripStaticDepartureTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTripStaticDepartureTime
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)windowStartTime
{
  return self->_windowStartTime;
}

- (void)setWindowStartTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_windowStartTime = a3;
}

- (void)setHasWindowStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasWindowStartTime
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)hasRoutingParameters
{
  return self->_routingParameters != 0;
}

- (NSData)routingParameters
{
  return self->_routingParameters;
}

- (void)setRoutingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_routingParameters, a3);
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
  v8.super_class = (Class)GEOTransitEntry;
  -[GEOTransitEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("tripMuid");
    else
      v12 = CFSTR("trip_muid");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    v5 = *(_BYTE *)(a1 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0)
        goto LABEL_5;
LABEL_21:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v16 = CFSTR("tripStaticDepartureTime");
      else
        v16 = CFSTR("trip_static_departure_time");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

      if ((*(_BYTE *)(a1 + 48) & 8) == 0)
        goto LABEL_10;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(a1 + 48) & 1) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v14 = CFSTR("lineMuid");
  else
    v14 = CFSTR("line_muid");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  v5 = *(_BYTE *)(a1 + 48);
  if ((v5 & 4) != 0)
    goto LABEL_21;
LABEL_5:
  if ((v5 & 8) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("windowStartTime");
    else
      v7 = CFSTR("window_start_time");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_10:
  objc_msgSend((id)a1, "routingParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("routingParameters"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("routing_parameters"));
    }
  }

  v17 = *(void **)(a1 + 8);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __45__GEOTransitEntry__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOTransitEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOTransitEntry)initWithDictionary:(id)a3
{
  return (GEOTransitEntry *)-[GEOTransitEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("tripMuid");
      else
        v6 = CFSTR("trip_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTripMuid:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("lineMuid");
      else
        v8 = CFSTR("line_muid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLineMuid:", objc_msgSend(v9, "unsignedLongLongValue"));

      if (a3)
        v10 = CFSTR("tripStaticDepartureTime");
      else
        v10 = CFSTR("trip_static_departure_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTripStaticDepartureTime:", objc_msgSend(v11, "unsignedIntValue"));

      if (a3)
        v12 = CFSTR("windowStartTime");
      else
        v12 = CFSTR("window_start_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setWindowStartTime:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("routingParameters");
      else
        v14 = CFSTR("routing_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v15, 0);
        objc_msgSend(a1, "setRoutingParameters:", v16);

      }
    }
  }

  return a1;
}

- (GEOTransitEntry)initWithJSON:(id)a3
{
  return (GEOTransitEntry *)-[GEOTransitEntry _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitEntryReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_6:
  if (self->_routingParameters)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOTransitEntry readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_QWORD *)v6 + 4) = self->_tripMuid;
    *((_BYTE *)v6 + 48) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v6 + 2) = self->_lineMuid;
  *((_BYTE *)v6 + 48) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v6 + 10) = self->_tripStaticDepartureTime;
  *((_BYTE *)v6 + 48) |= 4u;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v6 + 11) = self->_windowStartTime;
    *((_BYTE *)v6 + 48) |= 8u;
  }
LABEL_6:
  if (self->_routingParameters)
  {
    objc_msgSend(v6, "setRoutingParameters:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_tripMuid;
    *(_BYTE *)(v5 + 48) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 40) = self->_tripStaticDepartureTime;
      *(_BYTE *)(v5 + 48) |= 4u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_lineMuid;
  *(_BYTE *)(v5 + 48) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 44) = self->_windowStartTime;
    *(_BYTE *)(v5 + 48) |= 8u;
  }
LABEL_6:
  v8 = -[NSData copyWithZone:](self->_routingParameters, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *routingParameters;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOTransitEntry readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_tripMuid != *((_QWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_lineMuid != *((_QWORD *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_tripStaticDepartureTime != *((_DWORD *)v4 + 10))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_windowStartTime != *((_DWORD *)v4 + 11))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  routingParameters = self->_routingParameters;
  if ((unint64_t)routingParameters | *((_QWORD *)v4 + 3))
    v6 = -[NSData isEqual:](routingParameters, "isEqual:");
  else
    v6 = 1;
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOTransitEntry readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761u * self->_tripMuid;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_lineMuid;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ -[NSData hash](self->_routingParameters, "hash");
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_tripStaticDepartureTime;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_windowStartTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSData hash](self->_routingParameters, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 48);
  if ((v5 & 2) != 0)
  {
    self->_tripMuid = *((_QWORD *)v6 + 4);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v6 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v6 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_lineMuid = *((_QWORD *)v6 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v5 = *((_BYTE *)v6 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_tripStaticDepartureTime = *((_DWORD *)v6 + 10);
  *(_BYTE *)&self->_flags |= 4u;
  if ((*((_BYTE *)v6 + 48) & 8) != 0)
  {
LABEL_5:
    self->_windowStartTime = *((_DWORD *)v6 + 11);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_6:
  if (*((_QWORD *)v6 + 3))
  {
    -[GEOTransitEntry setRoutingParameters:](self, "setRoutingParameters:");
    v4 = v6;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOTransitEntry readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
