@implementation GEOAbAssignInfo

- (BOOL)hasAbAssignId
{
  return self->_abAssignId != 0;
}

- (NSString)abAssignId
{
  return self->_abAssignId;
}

- (void)setAbAssignId:(id)a3
{
  objc_storeStrong((id *)&self->_abAssignId, a3);
}

- (unint64_t)relativeTimestamp
{
  return self->_relativeTimestamp;
}

- (void)setRelativeTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_relativeTimestamp = a3;
}

- (void)setHasRelativeTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRelativeTimestamp
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
  v8.super_class = (Class)GEOAbAssignInfo;
  -[GEOAbAssignInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAbAssignInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAbAssignInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "abAssignId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("abAssignId");
    else
      v6 = CFSTR("ab_assign_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  v7 = *(_BYTE *)(a1 + 40);
  if ((v7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("relativeTimestamp");
    else
      v9 = CFSTR("relative_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 40);
  }
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("createdAtTimestamp");
    else
      v11 = CFSTR("createdAt_Timestamp");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(void **)(a1 + 8);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __45__GEOAbAssignInfo__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAbAssignInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOAbAssignInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAbAssignInfo)initWithDictionary:(id)a3
{
  return (GEOAbAssignInfo *)-[GEOAbAssignInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
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
      if (a3)
        v6 = CFSTR("abAssignId");
      else
        v6 = CFSTR("ab_assign_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setAbAssignId:", v8);

      }
      if (a3)
        v9 = CFSTR("relativeTimestamp");
      else
        v9 = CFSTR("relative_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRelativeTimestamp:", objc_msgSend(v10, "unsignedLongLongValue"));

      if (a3)
        v11 = CFSTR("createdAtTimestamp");
      else
        v11 = CFSTR("createdAt_Timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCreatedAtTimestamp:", objc_msgSend(v12, "unsignedLongLongValue"));

    }
  }

  return a1;
}

- (GEOAbAssignInfo)initWithJSON:(id)a3
{
  return (GEOAbAssignInfo *)-[GEOAbAssignInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAbAssignInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAbAssignInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_abAssignId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  -[GEOAbAssignInfo readAll:](self, "readAll:", 0);
  if (self->_abAssignId)
    objc_msgSend(v5, "setAbAssignId:");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_QWORD *)v5 + 4) = self->_relativeTimestamp;
    *((_BYTE *)v5 + 40) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v5 + 3) = self->_createdAtTimestamp;
    *((_BYTE *)v5 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_abAssignId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_relativeTimestamp;
    *(_BYTE *)(v5 + 40) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_createdAtTimestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *abAssignId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOAbAssignInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  abAssignId = self->_abAssignId;
  if ((unint64_t)abAssignId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](abAssignId, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_relativeTimestamp != *((_QWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_createdAtTimestamp != *((_QWORD *)v4 + 3))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;

  -[GEOAbAssignInfo readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_abAssignId, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761u * self->_relativeTimestamp;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761u * self->_createdAtTimestamp;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  unint64_t *v5;

  v5 = (unint64_t *)a3;
  objc_msgSend(v5, "readAll:", 0);
  if (v5[2])
    -[GEOAbAssignInfo setAbAssignId:](self, "setAbAssignId:");
  v4 = *((_BYTE *)v5 + 40);
  if ((v4 & 2) != 0)
  {
    self->_relativeTimestamp = v5[4];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 40);
  }
  if ((v4 & 1) != 0)
  {
    self->_createdAtTimestamp = v5[3];
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
    -[GEOAbAssignInfo readAll:](self, "readAll:", 0);
}

- (unint64_t)createdAtTimestamp
{
  return self->_createdAtTimestamp;
}

- (void)setCreatedAtTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_createdAtTimestamp = a3;
}

- (void)setHasCreatedAtTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCreatedAtTimestamp
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abAssignId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
