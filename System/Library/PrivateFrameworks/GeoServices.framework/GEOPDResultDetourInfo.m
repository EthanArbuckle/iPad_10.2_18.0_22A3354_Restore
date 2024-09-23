@implementation GEOPDResultDetourInfo

- (int)detourTime
{
  return self->_detourTime;
}

- (void)setDetourTime:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_detourTime = a3;
}

- (void)setHasDetourTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDetourTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)timeToPlace
{
  return self->_timeToPlace;
}

- (void)setTimeToPlace:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_timeToPlace = a3;
}

- (void)setHasTimeToPlace:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTimeToPlace
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)detourDistance
{
  return self->_detourDistance;
}

- (void)setDetourDistance:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_detourDistance = a3;
}

- (void)setHasDetourDistance:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDetourDistance
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)distanceToPlace
{
  return self->_distanceToPlace;
}

- (void)setDistanceToPlace:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_distanceToPlace = a3;
}

- (void)setHasDistanceToPlace:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDistanceToPlace
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOPDResultDetourInfo;
  -[GEOPDResultDetourInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultDetourInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultDetourInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v12;
  id v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 20));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("detourTime");
    else
      v16 = CFSTR("detour_time");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        goto LABEL_5;
LABEL_24:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v20 = CFSTR("detourDistance");
      else
        v20 = CFSTR("detour_distance");
      objc_msgSend(v4, "setObject:forKey:", v19, v20);

      if ((*(_BYTE *)(a1 + 32) & 4) == 0)
        goto LABEL_10;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(a1 + 32) & 8) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("timeToPlace");
  else
    v18 = CFSTR("time_to_place");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 1) != 0)
    goto LABEL_24;
LABEL_5:
  if ((v5 & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("distanceToPlace");
    else
      v7 = CFSTR("distance_to_place");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_10:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __51__GEOPDResultDetourInfo__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v12 = v11;
      v22 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v21);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultDetourInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDResultDetourInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDResultDetourInfo)initWithDictionary:(id)a3
{
  return (GEOPDResultDetourInfo *)-[GEOPDResultDetourInfo _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("detourTime");
      else
        v6 = CFSTR("detour_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDetourTime:", objc_msgSend(v7, "intValue"));

      if (a3)
        v8 = CFSTR("timeToPlace");
      else
        v8 = CFSTR("time_to_place");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTimeToPlace:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("detourDistance");
      else
        v10 = CFSTR("detour_distance");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDetourDistance:", objc_msgSend(v11, "intValue"));

      if (a3)
        v12 = CFSTR("distanceToPlace");
      else
        v12 = CFSTR("distance_to_place");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDistanceToPlace:", objc_msgSend(v13, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOPDResultDetourInfo)initWithJSON:(id)a3
{
  return (GEOPDResultDetourInfo *)-[GEOPDResultDetourInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDResultDetourInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultDetourInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOPDResultDetourInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[5] = self->_detourTime;
    *((_BYTE *)v5 + 32) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v5[4] = self->_detourDistance;
      *((_BYTE *)v5 + 32) |= 1u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[7] = self->_timeToPlace;
  *((_BYTE *)v5 + 32) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    v5[6] = self->_distanceToPlace;
    *((_BYTE *)v5 + 32) |= 4u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_detourTime;
    *(_BYTE *)(v4 + 32) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v4 + 16) = self->_detourDistance;
      *(_BYTE *)(v4 + 32) |= 1u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 28) = self->_timeToPlace;
  *(_BYTE *)(v4 + 32) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v4 + 24) = self->_distanceToPlace;
    *(_BYTE *)(v4 + 32) |= 4u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOPDResultDetourInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_detourTime != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_timeToPlace != *((_DWORD *)v4 + 7))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_detourDistance != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_distanceToPlace != *((_DWORD *)v4 + 6))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDResultDetourInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_detourTime;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_timeToPlace;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_detourDistance;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_distanceToPlace;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 2) != 0)
  {
    self->_detourTime = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 32);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      self->_detourDistance = *((_DWORD *)v5 + 4);
      *(_BYTE *)&self->_flags |= 1u;
      if ((*((_BYTE *)v5 + 32) & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_timeToPlace = *((_DWORD *)v5 + 7);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 4) != 0)
  {
LABEL_5:
    self->_distanceToPlace = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_6:

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
    -[GEOPDResultDetourInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
