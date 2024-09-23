@implementation GEOVLFInitializationFailureDetails

- (int)arkitErrorCode
{
  return self->_arkitErrorCode;
}

- (void)setArkitErrorCode:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_arkitErrorCode = a3;
}

- (void)setHasArkitErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArkitErrorCode
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)arkitUnderlyingErrorCode
{
  return self->_arkitUnderlyingErrorCode;
}

- (void)setArkitUnderlyingErrorCode:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_arkitUnderlyingErrorCode = a3;
}

- (void)setHasArkitUnderlyingErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasArkitUnderlyingErrorCode
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hasArkitUnderlyingErrorDomain
{
  return self->_arkitUnderlyingErrorDomain != 0;
}

- (NSString)arkitUnderlyingErrorDomain
{
  return self->_arkitUnderlyingErrorDomain;
}

- (void)setArkitUnderlyingErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_arkitUnderlyingErrorDomain, a3);
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
  v8.super_class = (Class)GEOVLFInitializationFailureDetails;
  -[GEOVLFInitializationFailureDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFInitializationFailureDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFInitializationFailureDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v7 = CFSTR("arkitErrorCode");
      else
        v7 = CFSTR("arkit_error_code");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 20));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("arkitUnderlyingErrorCode");
      else
        v9 = CFSTR("arkit_underlying_error_code");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

    }
    objc_msgSend((id)a1, "arkitUnderlyingErrorDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a2)
        v11 = CFSTR("arkitUnderlyingErrorDomain");
      else
        v11 = CFSTR("arkit_underlying_error_domain");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);
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
  return -[GEOVLFInitializationFailureDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFInitializationFailureDetails)initWithDictionary:(id)a3
{
  return (GEOVLFInitializationFailureDetails *)-[GEOVLFInitializationFailureDetails _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("arkitErrorCode");
      else
        v6 = CFSTR("arkit_error_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setArkitErrorCode:", objc_msgSend(v7, "intValue"));

      if (a3)
        v8 = CFSTR("arkitUnderlyingErrorCode");
      else
        v8 = CFSTR("arkit_underlying_error_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setArkitUnderlyingErrorCode:", objc_msgSend(v9, "intValue"));

      if (a3)
        v10 = CFSTR("arkitUnderlyingErrorDomain");
      else
        v10 = CFSTR("arkit_underlying_error_domain");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setArkitUnderlyingErrorDomain:", v12);

      }
    }
  }

  return a1;
}

- (GEOVLFInitializationFailureDetails)initWithJSON:(id)a3
{
  return (GEOVLFInitializationFailureDetails *)-[GEOVLFInitializationFailureDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFInitializationFailureDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFInitializationFailureDetailsReadAllFrom((uint64_t)self, a3);
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
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_arkitUnderlyingErrorDomain)
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
  -[GEOVLFInitializationFailureDetails readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 4) = self->_arkitErrorCode;
    *((_BYTE *)v6 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_arkitUnderlyingErrorCode;
    *((_BYTE *)v6 + 24) |= 2u;
  }
  if (self->_arkitUnderlyingErrorDomain)
  {
    objc_msgSend(v6, "setArkitUnderlyingErrorDomain:");
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
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_arkitErrorCode;
    *(_BYTE *)(v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_arkitUnderlyingErrorCode;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_arkitUnderlyingErrorDomain, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *arkitUnderlyingErrorDomain;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOVLFInitializationFailureDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_arkitErrorCode != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_arkitUnderlyingErrorCode != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  arkitUnderlyingErrorDomain = self->_arkitUnderlyingErrorDomain;
  if ((unint64_t)arkitUnderlyingErrorDomain | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](arkitUnderlyingErrorDomain, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOVLFInitializationFailureDetails readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_arkitErrorCode;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[NSString hash](self->_arkitUnderlyingErrorDomain, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_arkitUnderlyingErrorCode;
  return v4 ^ v3 ^ -[NSString hash](self->_arkitUnderlyingErrorDomain, "hash");
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
  if ((v5 & 1) != 0)
  {
    self->_arkitErrorCode = v6[4];
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v6 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_arkitUnderlyingErrorCode = v6[5];
    *(_BYTE *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v6 + 1))
  {
    -[GEOVLFInitializationFailureDetails setArkitUnderlyingErrorDomain:](self, "setArkitUnderlyingErrorDomain:");
    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arkitUnderlyingErrorDomain, 0);
}

@end
