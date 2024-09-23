@implementation GEOWiFiQualityIndex

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C09FD0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POPULARITY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUALITY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONFIDENCE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)value
{
  return self->_value;
}

- (void)setValue:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOWiFiQualityIndex;
  -[GEOWiFiQualityIndex description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiQualityIndex dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_BYTE *)(a1 + 16);
    if ((v3 & 1) != 0)
    {
      v4 = *(int *)(a1 + 8);
      if (v4 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = off_1E1C09FD0[v4];
      }
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("type"));

      v3 = *(_BYTE *)(a1 + 16);
    }
    if ((v3 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 12));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("value"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOWiFiQualityIndex)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityIndex *)-[GEOWiFiQualityIndex _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if (!a1)
    goto LABEL_20;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_20;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("POPULARITY")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("QUALITY")) & 1) != 0)
    {
      v6 = 2;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("CONFIDENCE")))
    {
      v6 = 3;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "intValue");
LABEL_16:
    objc_msgSend(a1, "setType:", v6);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setValue:", objc_msgSend(v7, "unsignedIntValue"));

LABEL_20:
  return a1;
}

- (GEOWiFiQualityIndex)initWithJSON:(id)a3
{
  return (GEOWiFiQualityIndex *)-[GEOWiFiQualityIndex _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityIndexIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityIndexReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOWiFiQualityIndex readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[2] = self->_type;
    *((_BYTE *)v5 + 16) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[3] = self->_value;
    *((_BYTE *)v5 + 16) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_type;
    *((_BYTE *)result + 16) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_value;
    *((_BYTE *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOWiFiQualityIndex readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_type != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_value != *((_DWORD *)v4 + 3))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOWiFiQualityIndex readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_value;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 1) != 0)
  {
    self->_type = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_value = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

@end
