@implementation GEOLogMsgEventGridDurationEndStateErrorInfo

- (unsigned)count
{
  return self->_count;
}

- (void)setCount:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E1C22590[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_TYPE_NO_NETWORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_TYPE_TIMEOUT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ERROR_TYPE_LOST_CONNECTIVITY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)GEOLogMsgEventGridDurationEndStateErrorInfo;
  -[GEOLogMsgEventGridDurationEndStateErrorInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventGridDurationEndStateErrorInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  void *v4;
  unsigned int v5;
  __CFString *v6;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_BYTE *)(a1 + 16);
    if ((v3 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 8));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("count"));

      v3 = *(_BYTE *)(a1 + 16);
    }
    if ((v3 & 2) != 0)
    {
      v5 = *(_DWORD *)(a1 + 12) - 1;
      if (v5 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 12));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C22590[v5];
      }
      objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("type"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOLogMsgEventGridDurationEndStateErrorInfo)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventGridDurationEndStateErrorInfo *)-[GEOLogMsgEventGridDurationEndStateErrorInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCount:", objc_msgSend(v4, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ERROR_TYPE_UNKNOWN")) & 1) != 0)
        {
          v7 = 1;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ERROR_TYPE_NO_NETWORK")) & 1) != 0)
        {
          v7 = 2;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ERROR_TYPE_TIMEOUT")) & 1) != 0)
        {
          v7 = 3;
        }
        else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ERROR_TYPE_LOST_CONNECTIVITY")))
        {
          v7 = 4;
        }
        else
        {
          v7 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
        v7 = objc_msgSend(v5, "intValue");
      }
      objc_msgSend(a1, "setType:", v7);
      goto LABEL_19;
    }
  }
LABEL_20:

  return a1;
}

- (GEOLogMsgEventGridDurationEndStateErrorInfo)initWithJSON:(id)a3
{
  return (GEOLogMsgEventGridDurationEndStateErrorInfo *)-[GEOLogMsgEventGridDurationEndStateErrorInfo _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventGridDurationEndStateErrorInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventGridDurationEndStateErrorInfoReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteUint32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOLogMsgEventGridDurationEndStateErrorInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[2] = self->_count;
    *((_BYTE *)v5 + 16) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[3] = self->_type;
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
    *((_DWORD *)result + 2) = self->_count;
    *((_BYTE *)result + 16) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_type;
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
  -[GEOLogMsgEventGridDurationEndStateErrorInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_count != *((_DWORD *)v4 + 2))
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
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_type != *((_DWORD *)v4 + 3))
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

  -[GEOLogMsgEventGridDurationEndStateErrorInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_count;
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
  v4 = 2654435761 * self->_type;
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
    self->_count = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 16);
  }
  if ((v4 & 2) != 0)
  {
    self->_type = *((_DWORD *)v5 + 3);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

@end
