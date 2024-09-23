@implementation GEONavigabilityInfo

- (BOOL)isEvFeasible
{
  return self->_isEvFeasible;
}

- (void)setIsEvFeasible:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_isEvFeasible = a3;
}

- (void)setHasIsEvFeasible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsEvFeasible
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_isBlocked = a3;
}

- (void)setHasIsBlocked:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsBlocked
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
  v8.super_class = (Class)GEONavigabilityInfo;
  -[GEONavigabilityInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigabilityInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigabilityInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 17));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("isEvFeasible");
    else
      v7 = CFSTR("is_ev_feasible");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 20);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("isBlocked");
    else
      v9 = CFSTR("is_blocked");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  v10 = *(void **)(a1 + 8);
  if (v10)
  {
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __49__GEONavigabilityInfo__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E1C00600;
      v14 = v13;
      v18 = v14;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
      v15 = v14;

      v12 = v15;
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavigabilityInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEONavigabilityInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEONavigabilityInfo)initWithDictionary:(id)a3
{
  return (GEONavigabilityInfo *)-[GEONavigabilityInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("isEvFeasible");
      else
        v6 = CFSTR("is_ev_feasible");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsEvFeasible:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("isBlocked");
      else
        v8 = CFSTR("is_blocked");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsBlocked:", objc_msgSend(v9, "BOOLValue"));

    }
  }

  return a1;
}

- (GEONavigabilityInfo)initWithJSON:(id)a3
{
  return (GEONavigabilityInfo *)-[GEONavigabilityInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigabilityInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigabilityInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _BYTE *v5;

  v5 = a3;
  -[GEONavigabilityInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[17] = self->_isEvFeasible;
    v5[20] |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v5[16] = self->_isBlocked;
    v5[20] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v4 + 17) = self->_isEvFeasible;
    *(_BYTE *)(v4 + 20) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_BYTE *)(v4 + 16) = self->_isBlocked;
    *(_BYTE *)(v4 + 20) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEONavigabilityInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0)
      goto LABEL_12;
    if (self->_isEvFeasible)
    {
      if (!v4[17])
        goto LABEL_12;
    }
    else if (v4[17])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[20] & 2) != 0)
  {
    goto LABEL_12;
  }
  v5 = (v4[20] & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[20] & 1) != 0)
    {
      if (self->_isBlocked)
      {
        if (!v4[16])
          goto LABEL_12;
      }
      else if (v4[16])
      {
        goto LABEL_12;
      }
      v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEONavigabilityInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_isEvFeasible;
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
  v4 = 2654435761 * self->_isBlocked;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4;
  BOOL *v5;

  v5 = (BOOL *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5[20];
  if ((v4 & 2) != 0)
  {
    self->_isEvFeasible = v5[17];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = v5[20];
  }
  if (v4)
  {
    self->_isBlocked = v5[16];
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
    -[GEONavigabilityInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
