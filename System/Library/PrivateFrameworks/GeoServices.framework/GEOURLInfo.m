@implementation GEOURLInfo

- (NSURL)nsURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[GEOURLInfo url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSString)url
{
  return self->_url;
}

- (BOOL)supportsMultipathTCP
{
  return (*(_BYTE *)&self->_flags & 2) != 0 && self->_supportsMultipathTCP;
}

- (BOOL)hasAlternativeMultipathTCPPort
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)alternativeMultipathTCPPort
{
  return self->_alternativeMultipathTCPPort;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *url;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOURLInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  url = self->_url;
  if ((unint64_t)url | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_24;
    if (self->_useAuthProxy)
    {
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 29))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) != 0)
    {
      if (self->_supportsMultipathTCP)
      {
        if (!*((_BYTE *)v4 + 28))
          goto LABEL_24;
        goto LABEL_20;
      }
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_20;
    }
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 32) & 2) != 0)
    goto LABEL_24;
LABEL_20:
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_alternativeMultipathTCPPort != *((_DWORD *)v4 + 6))
      goto LABEL_24;
    v6 = 1;
  }
LABEL_25:

  return v6;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)useAuthProxy
{
  return (*(_BYTE *)&self->_flags & 4) != 0 && self->_useAuthProxy;
}

- (void)setUseAuthProxy:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_useAuthProxy = a3;
}

- (void)setHasUseAuthProxy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasUseAuthProxy
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)setSupportsMultipathTCP:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_supportsMultipathTCP = a3;
}

- (void)setHasSupportsMultipathTCP:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSupportsMultipathTCP
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setAlternativeMultipathTCPPort:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_alternativeMultipathTCPPort = a3;
}

- (void)setHasAlternativeMultipathTCPPort:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
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
  v8.super_class = (Class)GEOURLInfo;
  -[GEOURLInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("url"));

  v6 = *(_BYTE *)(a1 + 32);
  if ((v6 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 32) & 2) == 0)
      goto LABEL_6;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 28));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("supportsMultipathTCP"));

    if ((*(_BYTE *)(a1 + 32) & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 29));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("useAuthProxy"));

  v6 = *(_BYTE *)(a1 + 32);
  if ((v6 & 2) != 0)
    goto LABEL_15;
LABEL_6:
  if ((v6 & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("alternativeMultipathTCPPort"));

  }
LABEL_8:
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
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __40__GEOURLInfo__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E1C00600;
      v12 = v11;
      v18 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOURLInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOURLInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOURLInfo)initWithDictionary:(id)a3
{
  return (GEOURLInfo *)-[GEOURLInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setUrl:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("useAuthProxy"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setUseAuthProxy:", objc_msgSend(v6, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsMultipathTCP"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsMultipathTCP:", objc_msgSend(v7, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("alternativeMultipathTCPPort"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAlternativeMultipathTCPPort:", objc_msgSend(v8, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOURLInfo)initWithJSON:(id)a3
{
  return (GEOURLInfo *)-[GEOURLInfo _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOURLInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOURLInfo readAll:](self, "readAll:", 0);
  if (self->_url)
    objc_msgSend(v5, "setUrl:");
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *((_BYTE *)v5 + 28) = self->_supportsMultipathTCP;
    *((_BYTE *)v5 + 32) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_BYTE *)v5 + 29) = self->_useAuthProxy;
  *((_BYTE *)v5 + 32) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((flags & 1) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 6) = self->_alternativeMultipathTCPPort;
    *((_BYTE *)v5 + 32) |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_url, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 28) = self->_supportsMultipathTCP;
    *(_BYTE *)(v5 + 32) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_BYTE *)(v5 + 29) = self->_useAuthProxy;
  *(_BYTE *)(v5 + 32) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_alternativeMultipathTCPPort;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
LABEL_5:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOURLInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_url, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_useAuthProxy;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_supportsMultipathTCP;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_alternativeMultipathTCPPort;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  if (*((_QWORD *)v5 + 2))
    -[GEOURLInfo setUrl:](self, "setUrl:");
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 4) == 0)
  {
    if ((*((_BYTE *)v5 + 32) & 2) == 0)
      goto LABEL_5;
LABEL_9:
    self->_supportsMultipathTCP = *((_BYTE *)v5 + 28);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v5 + 32) & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  self->_useAuthProxy = *((_BYTE *)v5 + 29);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 32);
  if ((v4 & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((v4 & 1) != 0)
  {
LABEL_6:
    self->_alternativeMultipathTCPPort = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 1u;
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
    -[GEOURLInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
