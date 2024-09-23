@implementation GEOTransitEnterExitInfo

- (unsigned)accessPointIndex
{
  return self->_accessPointIndex;
}

- (void)setAccessPointIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_accessPointIndex = a3;
}

- (void)setHasAccessPointIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAccessPointIndex
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)stopIndex
{
  return self->_stopIndex;
}

- (void)setStopIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_stopIndex = a3;
}

- (void)setHasStopIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStopIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)displayStop
{
  return self->_displayStop;
}

- (void)setDisplayStop:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_displayStop = a3;
}

- (void)setHasDisplayStop:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasDisplayStop
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)transferTime
{
  return self->_transferTime;
}

- (void)setTransferTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_transferTime = a3;
}

- (void)setHasTransferTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasTransferTime
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)uncertainArrival
{
  return self->_uncertainArrival;
}

- (void)setUncertainArrival:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_uncertainArrival = a3;
}

- (void)setHasUncertainArrival:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasUncertainArrival
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
  v8.super_class = (Class)GEOTransitEnterExitInfo;
  -[GEOTransitEnterExitInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitEnterExitInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitEnterExitInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v21;
  const __CFString *v22;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("accessPointIndex");
    else
      v16 = CFSTR("access_point_index");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0)
        goto LABEL_5;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)(a1 + 32) & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("stopIndex");
  else
    v18 = CFSTR("stop_index");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("transferTime");
    else
      v22 = CFSTR("transfer_time");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    if ((*(_BYTE *)(a1 + 32) & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("displayStop");
  else
    v20 = CFSTR("display_stop");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 4) != 0)
    goto LABEL_29;
LABEL_6:
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 29));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("uncertainArrival");
    else
      v7 = CFSTR("uncertain_arrival");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_11:
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
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __53__GEOTransitEnterExitInfo__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v12 = v11;
      v24 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v23);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitEnterExitInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOTransitEnterExitInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitEnterExitInfo)initWithDictionary:(id)a3
{
  return (GEOTransitEnterExitInfo *)-[GEOTransitEnterExitInfo _initWithDictionary:isJSON:](self, a3, 0);
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

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("accessPointIndex");
      else
        v6 = CFSTR("access_point_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAccessPointIndex:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("stopIndex");
      else
        v8 = CFSTR("stop_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStopIndex:", objc_msgSend(v9, "unsignedIntValue"));

      if (a3)
        v10 = CFSTR("displayStop");
      else
        v10 = CFSTR("display_stop");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDisplayStop:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("transferTime");
      else
        v12 = CFSTR("transfer_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTransferTime:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("uncertainArrival");
      else
        v14 = CFSTR("uncertain_arrival");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setUncertainArrival:", objc_msgSend(v15, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOTransitEnterExitInfo)initWithJSON:(id)a3
{
  return (GEOTransitEnterExitInfo *)-[GEOTransitEnterExitInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitEnterExitInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitEnterExitInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOTransitEnterExitInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[4] = self->_accessPointIndex;
    *((_BYTE *)v5 + 32) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_stopIndex;
  *((_BYTE *)v5 + 32) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_11:
    v5[6] = self->_transferTime;
    *((_BYTE *)v5 + 32) |= 4u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_BYTE *)v5 + 28) = self->_displayStop;
  *((_BYTE *)v5 + 32) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    *((_BYTE *)v5 + 29) = self->_uncertainArrival;
    *((_BYTE *)v5 + 32) |= 0x10u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_accessPointIndex;
    *(_BYTE *)(v4 + 32) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 20) = self->_stopIndex;
  *(_BYTE *)(v4 + 32) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_11:
    *(_DWORD *)(v4 + 24) = self->_transferTime;
    *(_BYTE *)(v4 + 32) |= 4u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_BYTE *)(v4 + 28) = self->_displayStop;
  *(_BYTE *)(v4 + 32) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    *(_BYTE *)(v4 + 29) = self->_uncertainArrival;
    *(_BYTE *)(v4 + 32) |= 0x10u;
  }
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOTransitEnterExitInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_accessPointIndex != *((_DWORD *)v4 + 4))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_stopIndex != *((_DWORD *)v4 + 5))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0)
      goto LABEL_27;
    if (self->_displayStop)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_transferTime != *((_DWORD *)v4 + 6))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_27;
  }
  v5 = (*((_BYTE *)v4 + 32) & 0x10) == 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
    {
      if (self->_uncertainArrival)
      {
        if (!*((_BYTE *)v4 + 29))
          goto LABEL_27;
      }
      else if (*((_BYTE *)v4 + 29))
      {
        goto LABEL_27;
      }
      v5 = 1;
      goto LABEL_28;
    }
LABEL_27:
    v5 = 0;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOTransitEnterExitInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_accessPointIndex;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_stopIndex;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_displayStop;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_transferTime;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_uncertainArrival;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 1) != 0)
  {
    self->_accessPointIndex = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 32);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v5 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_stopIndex = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    self->_transferTime = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 4u;
    if ((*((_BYTE *)v5 + 32) & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_displayStop = *((_BYTE *)v5 + 28);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 0x10) != 0)
  {
LABEL_6:
    self->_uncertainArrival = *((_BYTE *)v5 + 29);
    *(_BYTE *)&self->_flags |= 0x10u;
  }
LABEL_7:

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
    -[GEOTransitEnterExitInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
