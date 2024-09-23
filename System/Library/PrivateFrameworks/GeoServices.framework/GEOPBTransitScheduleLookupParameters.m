@implementation GEOPBTransitScheduleLookupParameters

- (unint64_t)lineId
{
  return self->_lineId;
}

- (void)setLineId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_lineId = a3;
}

- (void)setHasLineId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLineId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unint64_t)transitId
{
  return self->_transitId;
}

- (void)setTransitId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_transitId = a3;
}

- (void)setHasTransitId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransitId
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unint64_t)referenceTripId
{
  return self->_referenceTripId;
}

- (void)setReferenceTripId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_referenceTripId = a3;
}

- (void)setHasReferenceTripId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasReferenceTripId
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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

- (BOOL)includeAllDirectionNames
{
  return self->_includeAllDirectionNames;
}

- (void)setIncludeAllDirectionNames:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_includeAllDirectionNames = a3;
}

- (void)setHasIncludeAllDirectionNames:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIncludeAllDirectionNames
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)includeAllHeadsigns
{
  return self->_includeAllHeadsigns;
}

- (void)setIncludeAllHeadsigns:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_includeAllHeadsigns = a3;
}

- (void)setHasIncludeAllHeadsigns:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIncludeAllHeadsigns
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEOPBTransitScheduleLookupParameters;
  -[GEOPBTransitScheduleLookupParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBTransitScheduleLookupParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBTransitScheduleLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 52);
  if ((v5 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
      goto LABEL_4;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("transitId");
    else
      v14 = CFSTR("transit_id");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
      goto LABEL_9;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v12 = CFSTR("lineId");
  else
    v12 = CFSTR("line_id");
  objc_msgSend(v4, "setObject:forKey:", v11, v12);

  v5 = *(_BYTE *)(a1 + 52);
  if ((v5 & 4) != 0)
    goto LABEL_16;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("referenceTripId");
    else
      v7 = CFSTR("reference_trip_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
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

  v15 = *(_BYTE *)(a1 + 52);
  if ((v15 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("includeAllDirectionNames");
    else
      v17 = CFSTR("include_all_direction_names");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v15 = *(_BYTE *)(a1 + 52);
  }
  if ((v15 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("includeAllHeadsigns");
    else
      v19 = CFSTR("include_all_headsigns");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(void **)(a1 + 8);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __66__GEOPBTransitScheduleLookupParameters__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBTransitScheduleLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPBTransitScheduleLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPBTransitScheduleLookupParameters)initWithDictionary:(id)a3
{
  return (GEOPBTransitScheduleLookupParameters *)-[GEOPBTransitScheduleLookupParameters _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("lineId");
      else
        v6 = CFSTR("line_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLineId:", objc_msgSend(v7, "unsignedLongLongValue"));

      if (a3)
        v8 = CFSTR("transitId");
      else
        v8 = CFSTR("transit_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransitId:", objc_msgSend(v9, "unsignedLongLongValue"));

      if (a3)
        v10 = CFSTR("referenceTripId");
      else
        v10 = CFSTR("reference_trip_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setReferenceTripId:", objc_msgSend(v11, "unsignedLongLongValue"));

      if (a3)
        v12 = CFSTR("routingParameters");
      else
        v12 = CFSTR("routing_parameters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v13, 0);
        objc_msgSend(a1, "setRoutingParameters:", v14);

      }
      if (a3)
        v15 = CFSTR("includeAllDirectionNames");
      else
        v15 = CFSTR("include_all_direction_names");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeAllDirectionNames:", objc_msgSend(v16, "BOOLValue"));

      if (a3)
        v17 = CFSTR("includeAllHeadsigns");
      else
        v17 = CFSTR("include_all_headsigns");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIncludeAllHeadsigns:", objc_msgSend(v18, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOPBTransitScheduleLookupParameters)initWithJSON:(id)a3
{
  return (GEOPBTransitScheduleLookupParameters *)-[GEOPBTransitScheduleLookupParameters _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPBTransitScheduleLookupParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPBTransitScheduleLookupParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  char v5;
  id v6;

  v6 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_flags & 2) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_routingParameters)
    PBDataWriterWriteDataField();
  v5 = (char)self->_flags;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_flags;
  }
  if ((v5 & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char flags;
  char v6;
  _BYTE *v7;

  v7 = a3;
  -[GEOPBTransitScheduleLookupParameters readAll:](self, "readAll:", 0);
  v4 = v7;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v7 + 2) = self->_lineId;
    v7[52] |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v7 + 5) = self->_transitId;
  v7[52] |= 4u;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *((_QWORD *)v7 + 3) = self->_referenceTripId;
    v7[52] |= 2u;
  }
LABEL_5:
  if (self->_routingParameters)
  {
    objc_msgSend(v7, "setRoutingParameters:");
    v4 = v7;
  }
  v6 = (char)self->_flags;
  if ((v6 & 8) != 0)
  {
    v4[48] = self->_includeAllDirectionNames;
    v4[52] |= 8u;
    v6 = (char)self->_flags;
  }
  if ((v6 & 0x10) != 0)
  {
    v4[49] = self->_includeAllHeadsigns;
    v4[52] |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  uint64_t v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_lineId;
    *(_BYTE *)(v5 + 52) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 40) = self->_transitId;
  *(_BYTE *)(v5 + 52) |= 4u;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_referenceTripId;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_routingParameters, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = (char)self->_flags;
  if ((v10 & 8) != 0)
  {
    *(_BYTE *)(v6 + 48) = self->_includeAllDirectionNames;
    *(_BYTE *)(v6 + 52) |= 8u;
    v10 = (char)self->_flags;
  }
  if ((v10 & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 49) = self->_includeAllHeadsigns;
    *(_BYTE *)(v6 + 52) |= 0x10u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSData *routingParameters;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOPBTransitScheduleLookupParameters readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 52);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_lineId != *((_QWORD *)v4 + 2))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_transitId != *((_QWORD *)v4 + 5))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_referenceTripId != *((_QWORD *)v4 + 3))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_30;
  }
  routingParameters = self->_routingParameters;
  if ((unint64_t)routingParameters | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](routingParameters, "isEqual:"))
      goto LABEL_30;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 52);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_30;
    if (self->_includeAllDirectionNames)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_30;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_30;
  }
  v8 = (v6 & 0x10) == 0;
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_includeAllHeadsigns)
      {
        if (!*((_BYTE *)v4 + 49))
          goto LABEL_30;
      }
      else if (*((_BYTE *)v4 + 49))
      {
        goto LABEL_30;
      }
      v8 = 1;
      goto LABEL_31;
    }
LABEL_30:
    v8 = 0;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPBTransitScheduleLookupParameters readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761u * self->_lineId;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_transitId;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5 = 2654435761u * self->_referenceTripId;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSData hash](self->_routingParameters, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v7 = 2654435761 * self->_includeAllDirectionNames;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_10;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    goto LABEL_12;
LABEL_10:
  v8 = 2654435761 * self->_includeAllHeadsigns;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  char v5;
  BOOL v6;
  unint64_t *v7;

  v7 = (unint64_t *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = (BOOL *)v7;
  v5 = *((_BYTE *)v7 + 52);
  if ((v5 & 1) != 0)
  {
    self->_lineId = v7[2];
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v7 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v7 + 52) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_transitId = v7[5];
  *(_BYTE *)&self->_flags |= 4u;
  if ((*((_BYTE *)v7 + 52) & 2) != 0)
  {
LABEL_4:
    self->_referenceTripId = v7[3];
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_5:
  if (v7[4])
  {
    -[GEOPBTransitScheduleLookupParameters setRoutingParameters:](self, "setRoutingParameters:");
    v4 = (BOOL *)v7;
  }
  v6 = v4[52];
  if ((v6 & 8) != 0)
  {
    self->_includeAllDirectionNames = v4[48];
    *(_BYTE *)&self->_flags |= 8u;
    v6 = v4[52];
  }
  if ((v6 & 0x10) != 0)
  {
    self->_includeAllHeadsigns = v4[49];
    *(_BYTE *)&self->_flags |= 0x10u;
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
    -[GEOPBTransitScheduleLookupParameters readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
