@implementation GEOFormatStyle

- (NSString)token
{
  return self->_token;
}

- (id)dictionaryRepresentation
{
  return -[GEOFormatStyle _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("token"));

  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v6 = *(int *)(a1 + 24);
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C08298[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

  }
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
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__GEOFormatStyle__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

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
    return off_1E1C08298[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL_TIME_ON_TIME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL_TIME_DELAYS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLICKABLE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOFormatStyle;
  -[GEOFormatStyle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOFormatStyle dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)jsonRepresentation
{
  return -[GEOFormatStyle _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOFormatStyle__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOFormatStyle)initWithDictionary:(id)a3
{
  return (GEOFormatStyle *)-[GEOFormatStyle _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("token"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setToken:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
        {
          v8 = 0;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("REAL_TIME_ON_TIME")) & 1) != 0)
        {
          v8 = 1;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("REAL_TIME_DELAYS")) & 1) != 0)
        {
          v8 = 2;
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("CLICKABLE")))
        {
          v8 = 3;
        }
        else
        {
          v8 = 0;
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
        v8 = objc_msgSend(v6, "intValue");
      }
      objc_msgSend(a1, "setType:", v8);
      goto LABEL_19;
    }
  }
LABEL_20:

  return a1;
}

- (GEOFormatStyle)initWithJSON:(id)a3
{
  return (GEOFormatStyle *)-[GEOFormatStyle _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFormatStyleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFormatStyleReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_token)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOFormatStyle readAll:](self, "readAll:", 0);
  if (self->_token)
    objc_msgSend(v4, "setToken:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *token;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOFormatStyle readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  token = self->_token;
  if ((unint64_t)token | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](token, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_type == *((_DWORD *)v4 + 6))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  -[GEOFormatStyle readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_token, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;

  v4 = (int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 2))
    -[GEOFormatStyle setToken:](self, "setToken:");
  if ((v4[7] & 1) != 0)
  {
    self->_type = v4[6];
    *(_BYTE *)&self->_flags |= 1u;
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
    -[GEOFormatStyle readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (int64_t)styleType
{
  uint64_t v2;

  v2 = -[GEOFormatStyle type](self, "type") - 1;
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

@end
