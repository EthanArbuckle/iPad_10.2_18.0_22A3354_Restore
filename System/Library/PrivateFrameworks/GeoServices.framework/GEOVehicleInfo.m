@implementation GEOVehicleInfo

- (int)carPlayConnectionStatus
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_carPlayConnectionStatus;
  else
    return 0;
}

- (void)setCarPlayConnectionStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_carPlayConnectionStatus = a3;
}

- (void)setHasCarPlayConnectionStatus:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCarPlayConnectionStatus
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)carPlayConnectionStatusAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("INACTIVE");
  if (a3 == 1)
  {
    v3 = CFSTR("ACTIVE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsCarPlayConnectionStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INACTIVE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ACTIVE"));

  return v4;
}

- (int)intentsConnectionStatus
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_intentsConnectionStatus;
  else
    return 0;
}

- (void)setIntentsConnectionStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_intentsConnectionStatus = a3;
}

- (void)setHasIntentsConnectionStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIntentsConnectionStatus
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)intentsConnectionStatusAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("INACTIVE");
  if (a3 == 1)
  {
    v3 = CFSTR("ACTIVE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsIntentsConnectionStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INACTIVE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ACTIVE"));

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
  v8.super_class = (Class)GEOVehicleInfo;
  -[GEOVehicleInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVehicleInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVehicleInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  int v9;
  __CFString *v10;
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
  v5 = *(_BYTE *)(a1 + 24);
  if ((v5 & 1) != 0)
  {
    v6 = *(_DWORD *)(a1 + 16);
    if (v6)
    {
      if (v6 == 1)
      {
        v7 = CFSTR("ACTIVE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("INACTIVE");
    }
    if (a2)
      v8 = CFSTR("carPlayConnectionStatus");
    else
      v8 = CFSTR("car_play_connection_status");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 24);
  }
  if ((v5 & 2) != 0)
  {
    v9 = *(_DWORD *)(a1 + 20);
    if (v9)
    {
      if (v9 == 1)
      {
        v10 = CFSTR("ACTIVE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("INACTIVE");
    }
    if (a2)
      v11 = CFSTR("intentsConnectionStatus");
    else
      v11 = CFSTR("intents_connection_status");
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
      v19[2] = __44__GEOVehicleInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOVehicleInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOVehicleInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOVehicleInfo)initWithDictionary:(id)a3
{
  return (GEOVehicleInfo *)-[GEOVehicleInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("carPlayConnectionStatus");
      else
        v6 = CFSTR("car_play_connection_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INACTIVE")) & 1) != 0)
          v9 = 0;
        else
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ACTIVE"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_14;
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setCarPlayConnectionStatus:", v9);
LABEL_14:

      if (a3)
        v10 = CFSTR("intentsConnectionStatus");
      else
        v10 = CFSTR("intents_connection_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("INACTIVE")) & 1) != 0)
          v13 = 0;
        else
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ACTIVE"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        v13 = objc_msgSend(v11, "intValue");
      }
      objc_msgSend(a1, "setIntentsConnectionStatus:", v13);
      goto LABEL_25;
    }
  }
LABEL_26:

  return a1;
}

- (GEOVehicleInfo)initWithJSON:(id)a3
{
  return (GEOVehicleInfo *)-[GEOVehicleInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVehicleInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVehicleInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOVehicleInfo readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[4] = self->_carPlayConnectionStatus;
    *((_BYTE *)v5 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[5] = self->_intentsConnectionStatus;
    *((_BYTE *)v5 + 24) |= 2u;
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
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_carPlayConnectionStatus;
    *(_BYTE *)(v4 + 24) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_intentsConnectionStatus;
    *(_BYTE *)(v4 + 24) |= 2u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOVehicleInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_carPlayConnectionStatus != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_intentsConnectionStatus != *((_DWORD *)v4 + 5))
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

  -[GEOVehicleInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_carPlayConnectionStatus;
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
  v4 = 2654435761 * self->_intentsConnectionStatus;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 1) != 0)
  {
    self->_carPlayConnectionStatus = v5[4];
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_intentsConnectionStatus = v5[5];
    *(_BYTE *)&self->_flags |= 2u;
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
    -[GEOVehicleInfo readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
