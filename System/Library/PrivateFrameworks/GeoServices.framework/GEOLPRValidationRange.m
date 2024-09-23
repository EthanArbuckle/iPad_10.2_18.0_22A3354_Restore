@implementation GEOLPRValidationRange

- (int)start
{
  return self->_start;
}

- (void)setStart:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_start = a3;
}

- (void)setHasStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStart
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)end
{
  return self->_end;
}

- (void)setEnd:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_end = a3;
}

- (void)setHasEnd:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEnd
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasValidCharacters
{
  return self->_validCharacters != 0;
}

- (NSString)validCharacters
{
  return self->_validCharacters;
}

- (void)setValidCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_validCharacters, a3);
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
  v8.super_class = (Class)GEOLPRValidationRange;
  -[GEOLPRValidationRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRValidationRange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRValidationRange _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 20));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("start"));

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("end"));

    }
    objc_msgSend((id)a1, "validCharacters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2)
        v9 = CFSTR("validCharacters");
      else
        v9 = CFSTR("valid_characters");
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
  return -[GEOLPRValidationRange _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRValidationRange)initWithDictionary:(id)a3
{
  return (GEOLPRValidationRange *)-[GEOLPRValidationRange _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("start"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStart:", objc_msgSend(v6, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("end"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEnd:", objc_msgSend(v7, "intValue"));

      if (a3)
        v8 = CFSTR("validCharacters");
      else
        v8 = CFSTR("valid_characters");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "setValidCharacters:", v10);

      }
    }
  }

  return a1;
}

- (GEOLPRValidationRange)initWithJSON:(id)a3
{
  return (GEOLPRValidationRange *)-[GEOLPRValidationRange _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRValidationRangeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRValidationRangeReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteSint32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteSint32Field();
    v4 = v6;
  }
  if (self->_validCharacters)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char flags;
  id v6;

  v6 = a3;
  -[GEOLPRValidationRange readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_start;
    *((_BYTE *)v6 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_end;
    *((_BYTE *)v6 + 24) |= 1u;
  }
  if (self->_validCharacters)
  {
    objc_msgSend(v6, "setValidCharacters:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char flags;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_start;
    *(_BYTE *)(v5 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_end;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_validCharacters, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *validCharacters;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOLPRValidationRange readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_start != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_end != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  validCharacters = self->_validCharacters;
  if ((unint64_t)validCharacters | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](validCharacters, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLPRValidationRange readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_start;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[NSString hash](self->_validCharacters, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_end;
  return v4 ^ v3 ^ -[NSString hash](self->_validCharacters, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  int *v6;

  v6 = (int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  v5 = *((_BYTE *)v6 + 24);
  if ((v5 & 2) != 0)
  {
    self->_start = v6[5];
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v6 + 24);
  }
  if ((v5 & 1) != 0)
  {
    self->_end = v6[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v6 + 1))
  {
    -[GEOLPRValidationRange setValidCharacters:](self, "setValidCharacters:");
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validCharacters, 0);
}

@end
