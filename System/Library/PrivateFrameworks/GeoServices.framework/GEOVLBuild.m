@implementation GEOVLBuild

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIdentifier
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)dataOutputVersion
{
  return self->_dataOutputVersion;
}

- (void)setDataOutputVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_dataOutputVersion = a3;
}

- (void)setHasDataOutputVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDataOutputVersion
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)dataFormatVersion
{
  return self->_dataFormatVersion;
}

- (void)setDataFormatVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_dataFormatVersion = a3;
}

- (void)setHasDataFormatVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDataFormatVersion
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_routingKey = a3;
}

- (void)setHasRoutingKey:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasRoutingKey
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOVLBuild;
  -[GEOVLBuild description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLBuild dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLBuild _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("id"));

    v5 = *(_BYTE *)(a1 + 28);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("dataOutputVersion");
    else
      v8 = CFSTR("data_output_version");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_6:
      if ((v5 & 8) == 0)
        return v4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v10 = CFSTR("dataFormatVersion");
  else
    v10 = CFSTR("data_format_version");
  objc_msgSend(v4, "setObject:forKey:", v9, v10);

  if ((*(_BYTE *)(a1 + 28) & 8) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("routingKey");
    else
      v12 = CFSTR("routing_key");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLBuild _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLBuild)initWithDictionary:(id)a3
{
  return (GEOVLBuild *)-[GEOVLBuild _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedLongLongValue"));

      if (a3)
        v7 = CFSTR("dataOutputVersion");
      else
        v7 = CFSTR("data_output_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDataOutputVersion:", objc_msgSend(v8, "unsignedIntValue"));

      if (a3)
        v9 = CFSTR("dataFormatVersion");
      else
        v9 = CFSTR("data_format_version");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDataFormatVersion:", objc_msgSend(v10, "unsignedIntValue"));

      if (a3)
        v11 = CFSTR("routingKey");
      else
        v11 = CFSTR("routing_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRoutingKey:", objc_msgSend(v12, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOVLBuild)initWithJSON:(id)a3
{
  return (GEOVLBuild *)-[GEOVLBuild _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLBuildIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLBuildReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint32Field();
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOVLBuild readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[1] = self->_identifier;
    *((_BYTE *)v5 + 28) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *((_DWORD *)v5 + 4) = self->_dataFormatVersion;
      *((_BYTE *)v5 + 28) |= 2u;
      if ((*(_BYTE *)&self->_flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 5) = self->_dataOutputVersion;
  *((_BYTE *)v5 + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 6) = self->_routingKey;
    *((_BYTE *)v5 + 28) |= 8u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_identifier;
    *((_BYTE *)result + 28) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_dataOutputVersion;
  *((_BYTE *)result + 28) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_dataFormatVersion;
  *((_BYTE *)result + 28) |= 2u;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 6) = self->_routingKey;
  *((_BYTE *)result + 28) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOVLBuild readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_identifier != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_dataOutputVersion != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_dataFormatVersion != *((_DWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 28) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0 || self->_routingKey != *((_DWORD *)v4 + 6))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOVLBuild readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761u * self->_identifier;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_dataOutputVersion;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_dataFormatVersion;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v6 = 2654435761 * self->_routingKey;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 1) != 0)
  {
    self->_identifier = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 28);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_dataFormatVersion = *((_DWORD *)v5 + 4);
      *(_BYTE *)&self->_flags |= 2u;
      if ((*((_BYTE *)v5 + 28) & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v5 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_dataOutputVersion = *((_DWORD *)v5 + 5);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v4 & 8) != 0)
  {
LABEL_5:
    self->_routingKey = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_6:

}

@end
