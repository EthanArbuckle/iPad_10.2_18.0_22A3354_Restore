@implementation GEOCacheHit

- (int)requestorType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_requestorType;
  else
    return 0;
}

- (void)setRequestorType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_requestorType = a3;
}

- (void)setHasRequestorType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRequestorType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)requestorTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C22188[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestorType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REGION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REFRESH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REGION_AND_REFRESH")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)tileSourceType
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_tileSourceType;
  else
    return 0;
}

- (void)setTileSourceType:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_tileSourceType = a3;
}

- (void)setHasTileSourceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasTileSourceType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)tileSourceTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C22188[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTileSourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REGION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REFRESH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROACTIVE_REGION_AND_REFRESH")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)bytes
{
  return self->_bytes;
}

- (void)setBytes:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_bytes = a3;
}

- (void)setHasBytes:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasBytes
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOCacheHit;
  -[GEOCacheHit description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCacheHit dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCacheHit _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 4) != 0)
    {
      v6 = *(int *)(a1 + 16);
      if (v6 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C22188[v6];
      }
      if (a2)
        v8 = CFSTR("requestorType");
      else
        v8 = CFSTR("requestor_type");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 8) != 0)
    {
      v9 = *(int *)(a1 + 20);
      if (v9 >= 7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E1C22188[v9];
      }
      if (a2)
        v11 = CFSTR("tileSourceType");
      else
        v11 = CFSTR("tile_source_type");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 12));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("count"));

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 8));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("bytes"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCacheHit _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCacheHit)initWithDictionary:(id)a3
{
  return (GEOCacheHit *)-[GEOCacheHit _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v5 = a2;
  if (!a1)
    goto LABEL_54;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_54;
  if (a3)
    v6 = CFSTR("requestorType");
  else
    v6 = CFSTR("requestor_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NAV")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_REGION")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_REFRESH")) & 1) != 0)
    {
      v9 = 5;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PROACTIVE_REGION_AND_REFRESH")))
    {
      v9 = 6;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_26;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setRequestorType:", v9);
LABEL_26:

  if (a3)
    v10 = CFSTR("tileSourceType");
  else
    v10 = CFSTR("tile_source_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("INTERACTIVE")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NAV")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PROACTIVE")) & 1) != 0)
    {
      v13 = 3;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PROACTIVE_REGION")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PROACTIVE_REFRESH")) & 1) != 0)
    {
      v13 = 5;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("PROACTIVE_REGION_AND_REFRESH")))
    {
      v13 = 6;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v11, "intValue");
LABEL_48:
    objc_msgSend(a1, "setTileSourceType:", v13);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCount:", objc_msgSend(v14, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBytes:", objc_msgSend(v15, "unsignedIntValue"));

LABEL_54:
  return a1;
}

- (GEOCacheHit)initWithJSON:(id)a3
{
  return (GEOCacheHit *)-[GEOCacheHit _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCacheHitIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCacheHitReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOCacheHit readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = self->_requestorType;
    *((_BYTE *)v5 + 24) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      v5[3] = self->_count;
      *((_BYTE *)v5 + 24) |= 2u;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[5] = self->_tileSourceType;
  *((_BYTE *)v5 + 24) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 1) != 0)
  {
LABEL_5:
    v5[2] = self->_bytes;
    *((_BYTE *)v5 + 24) |= 1u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_requestorType;
    *((_BYTE *)result + 24) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_tileSourceType;
  *((_BYTE *)result + 24) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_count;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 2) = self->_bytes;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOCacheHit readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_requestorType != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0 || self->_tileSourceType != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_count != *((_DWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_bytes != *((_DWORD *)v4 + 2))
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

  -[GEOCacheHit readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_requestorType;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_tileSourceType;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
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
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_count;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_bytes;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_requestorType = *((_DWORD *)v5 + 4);
    *(_BYTE *)&self->_flags |= 4u;
    v4 = *((_BYTE *)v5 + 24);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_count = *((_DWORD *)v5 + 3);
      *(_BYTE *)&self->_flags |= 2u;
      if ((*((_BYTE *)v5 + 24) & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_tileSourceType = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 1) != 0)
  {
LABEL_5:
    self->_bytes = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_6:

}

@end
