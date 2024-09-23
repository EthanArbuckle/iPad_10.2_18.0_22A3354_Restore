@implementation GEOEVChargingPreference

- (BOOL)hasPreferenceEntity
{
  return self->_preferenceEntity != 0;
}

- (GEOPreferenceEntity)preferenceEntity
{
  return self->_preferenceEntity;
}

- (void)setPreferenceEntity:(id)a3
{
  objc_storeStrong((id *)&self->_preferenceEntity, a3);
}

- (int)preferenceType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_preferenceType;
  else
    return 0;
}

- (void)setPreferenceType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_preferenceType = a3;
}

- (void)setHasPreferenceType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPreferenceType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)preferenceTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C080C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreferenceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AVOID")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
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
  v8.super_class = (Class)GEOEVChargingPreference;
  -[GEOEVChargingPreference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOEVChargingPreference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEVChargingPreference _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
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
  objc_msgSend((id)a1, "preferenceEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("preferenceEntity");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("preference_entity");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v9 = *(int *)(a1 + 24);
    if (v9 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C080C8[v9];
    }
    if (a2)
      v11 = CFSTR("preferenceType");
    else
      v11 = CFSTR("preference_type");
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
      v19[2] = __53__GEOEVChargingPreference__dictionaryRepresentation___block_invoke;
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
  return -[GEOEVChargingPreference _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOEVChargingPreference__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOEVChargingPreference)initWithDictionary:(id)a3
{
  return (GEOEVChargingPreference *)-[GEOEVChargingPreference _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPreferenceEntity *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("preferenceEntity");
      else
        v6 = CFSTR("preference_entity");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPreferenceEntity alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPreferenceEntity initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPreferenceEntity initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPreferenceEntity:", v9);

      }
      if (a3)
        v11 = CFSTR("preferenceType");
      else
        v11 = CFSTR("preference_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
        {
          v14 = 0;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PREFER")) & 1) != 0)
        {
          v14 = 1;
        }
        else if (objc_msgSend(v13, "isEqualToString:", CFSTR("AVOID")))
        {
          v14 = 2;
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_26:

          goto LABEL_27;
        }
        v14 = objc_msgSend(v12, "intValue");
      }
      objc_msgSend(a1, "setPreferenceType:", v14);
      goto LABEL_26;
    }
  }
LABEL_27:

  return a1;
}

- (GEOEVChargingPreference)initWithJSON:(id)a3
{
  return (GEOEVChargingPreference *)-[GEOEVChargingPreference _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEVChargingPreferenceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEVChargingPreferenceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_preferenceEntity)
  {
    PBDataWriterWriteSubmessage();
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
  -[GEOEVChargingPreference readAll:](self, "readAll:", 0);
  if (self->_preferenceEntity)
    objc_msgSend(v4, "setPreferenceEntity:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_preferenceType;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOPreferenceEntity copyWithZone:](self->_preferenceEntity, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_preferenceType;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPreferenceEntity *preferenceEntity;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOEVChargingPreference readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  preferenceEntity = self->_preferenceEntity;
  if ((unint64_t)preferenceEntity | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPreferenceEntity isEqual:](preferenceEntity, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_preferenceType == *((_DWORD *)v4 + 6))
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
  unint64_t v3;
  uint64_t v4;

  -[GEOEVChargingPreference readAll:](self, "readAll:", 1);
  v3 = -[GEOPreferenceEntity hash](self->_preferenceEntity, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_preferenceType;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEOPreferenceEntity *preferenceEntity;
  uint64_t v5;
  int *v6;

  v6 = (int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  preferenceEntity = self->_preferenceEntity;
  v5 = *((_QWORD *)v6 + 2);
  if (preferenceEntity)
  {
    if (v5)
      -[GEOPreferenceEntity mergeFrom:](preferenceEntity, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOEVChargingPreference setPreferenceEntity:](self, "setPreferenceEntity:");
  }
  if ((v6[7] & 1) != 0)
  {
    self->_preferenceType = v6[6];
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
  {
    -[GEOEVChargingPreference readAll:](self, "readAll:", 0);
    -[GEOPreferenceEntity clearUnknownFields:](self->_preferenceEntity, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceEntity, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
