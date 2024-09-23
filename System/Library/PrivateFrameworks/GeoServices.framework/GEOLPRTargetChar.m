@implementation GEOLPRTargetChar

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
  if ((a3 - 1) < 3)
    return off_1E1C05AF0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALPHABET")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NUMERIC")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)charIndex
{
  return self->_charIndex;
}

- (void)setCharIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_charIndex = a3;
}

- (void)setHasCharIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCharIndex
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
  v8.super_class = (Class)GEOLPRTargetChar;
  -[GEOLPRTargetChar description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRTargetChar dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRTargetChar _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  unsigned int v6;
  __CFString *v7;
  void *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 16);
    if ((v5 & 2) != 0)
    {
      v6 = *(_DWORD *)(a1 + 12) - 1;
      if (v6 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 12));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C05AF0[v6];
      }
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

      v5 = *(_BYTE *)(a1 + 16);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("charIndex");
      else
        v9 = CFSTR("char_index");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

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
  return -[GEOLPRTargetChar _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRTargetChar)initWithDictionary:(id)a3
{
  return (GEOLPRTargetChar *)-[GEOLPRTargetChar _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;

  v5 = a2;
  if (!a1)
    goto LABEL_21;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_21;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ANY")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ALPHABET")) & 1) != 0)
    {
      v8 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("NUMERIC")))
    {
      v8 = 3;
    }
    else
    {
      v8 = 1;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_14:
    objc_msgSend(a1, "setType:", v8);
  }

  if (a3)
    v9 = CFSTR("charIndex");
  else
    v9 = CFSTR("char_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCharIndex:", objc_msgSend(v10, "intValue"));

LABEL_21:
  return a1;
}

- (GEOLPRTargetChar)initWithJSON:(id)a3
{
  return (GEOLPRTargetChar *)-[GEOLPRTargetChar _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRTargetCharIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRTargetCharReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteSint32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOLPRTargetChar readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_type;
    *((_BYTE *)v5 + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v5[2] = self->_charIndex;
    *((_BYTE *)v5 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_type;
    *((_BYTE *)result + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_charIndex;
    *((_BYTE *)result + 16) |= 1u;
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
  -[GEOLPRTargetChar readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_type != *((_DWORD *)v4 + 3))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_charIndex != *((_DWORD *)v4 + 2))
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

  -[GEOLPRTargetChar readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_charIndex;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_type = v5[3];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 16);
  }
  if ((v4 & 1) != 0)
  {
    self->_charIndex = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
