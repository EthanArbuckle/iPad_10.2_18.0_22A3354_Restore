@implementation GEOUserPreferences

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (void)setAvoidTolls:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_avoidTolls = a3;
}

- (void)setHasAvoidTolls:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvoidTolls
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (void)setAvoidHighways:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_avoidHighways = a3;
}

- (void)setHasAvoidHighways:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAvoidHighways
{
  return *(_BYTE *)&self->_flags & 1;
}

- (NSMutableArray)evChargingPreferences
{
  return self->_evChargingPreferences;
}

- (void)setEvChargingPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_evChargingPreferences, a3);
}

- (void)clearEvChargingPreferences
{
  -[NSMutableArray removeAllObjects](self->_evChargingPreferences, "removeAllObjects");
}

- (void)addEvChargingPreferences:(id)a3
{
  id v4;
  NSMutableArray *evChargingPreferences;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  evChargingPreferences = self->_evChargingPreferences;
  v8 = v4;
  if (!evChargingPreferences)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_evChargingPreferences;
    self->_evChargingPreferences = v6;

    v4 = v8;
    evChargingPreferences = self->_evChargingPreferences;
  }
  -[NSMutableArray addObject:](evChargingPreferences, "addObject:", v4);

}

- (unint64_t)evChargingPreferencesCount
{
  return -[NSMutableArray count](self->_evChargingPreferences, "count");
}

- (id)evChargingPreferencesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_evChargingPreferences, "objectAtIndex:", a3);
}

+ (Class)evChargingPreferencesType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOUserPreferences;
  -[GEOUserPreferences description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOUserPreferences dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOUserPreferences _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("avoidTolls");
    else
      v7 = CFSTR("avoid_tolls");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 28);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("avoidHighways");
    else
      v9 = CFSTR("avoid_highways");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = *(id *)(a1 + 16);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    if (a2)
      v18 = CFSTR("evChargingPreferences");
    else
      v18 = CFSTR("ev_charging_preferences");
    objc_msgSend(v4, "setObject:forKey:", v10, v18);

  }
  v19 = *(void **)(a1 + 8);
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __48__GEOUserPreferences__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOUserPreferences _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOUserPreferences__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOUserPreferences)initWithDictionary:(id)a3
{
  return (GEOUserPreferences *)-[GEOUserPreferences _initWithDictionary:isJSON:](self, a3, 0);
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOEVChargingPreference *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("avoidTolls");
      else
        v6 = CFSTR("avoid_tolls");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAvoidTolls:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("avoidHighways");
      else
        v8 = CFSTR("avoid_highways");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAvoidHighways:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("evChargingPreferences");
      else
        v10 = CFSTR("ev_charging_preferences");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v22 = v11;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v24 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = [GEOEVChargingPreference alloc];
                if ((a3 & 1) != 0)
                  v19 = -[GEOEVChargingPreference initWithJSON:](v18, "initWithJSON:", v17);
                else
                  v19 = -[GEOEVChargingPreference initWithDictionary:](v18, "initWithDictionary:", v17);
                v20 = (void *)v19;
                objc_msgSend(a1, "addEvChargingPreferences:", v19);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v14);
        }

        v11 = v22;
      }

    }
  }

  return a1;
}

- (GEOUserPreferences)initWithJSON:(id)a3
{
  return (GEOUserPreferences *)-[GEOUserPreferences _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOUserPreferencesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOUserPreferencesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_evChargingPreferences;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v9 = a3;
  -[GEOUserPreferences readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v9[25] = self->_avoidTolls;
    v9[28] |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v9[24] = self->_avoidHighways;
    v9[28] |= 1u;
  }
  if (-[GEOUserPreferences evChargingPreferencesCount](self, "evChargingPreferencesCount"))
  {
    objc_msgSend(v9, "clearEvChargingPreferences");
    v5 = -[GEOUserPreferences evChargingPreferencesCount](self, "evChargingPreferencesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOUserPreferences evChargingPreferencesAtIndex:](self, "evChargingPreferencesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addEvChargingPreferences:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id *v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_BYTE *)v5 + 25) = self->_avoidTolls;
    *((_BYTE *)v5 + 28) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_BYTE *)v5 + 24) = self->_avoidHighways;
    *((_BYTE *)v5 + 28) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_evChargingPreferences;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addEvChargingPreferences:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSMutableArray *evChargingPreferences;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOUserPreferences readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_14;
    if (self->_avoidTolls)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_20;
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 28) & 1) == 0)
    goto LABEL_14;
  if (!self->_avoidHighways)
  {
    if (!*((_BYTE *)v4 + 24))
      goto LABEL_20;
    goto LABEL_14;
  }
  if (!*((_BYTE *)v4 + 24))
    goto LABEL_14;
LABEL_20:
  evChargingPreferences = self->_evChargingPreferences;
  if ((unint64_t)evChargingPreferences | *((_QWORD *)v4 + 2))
    v5 = -[NSMutableArray isEqual:](evChargingPreferences, "isEqual:");
  else
    v5 = 1;
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOUserPreferences readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_avoidTolls;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3 ^ -[NSMutableArray hash](self->_evChargingPreferences, "hash");
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_avoidHighways;
  return v4 ^ v3 ^ -[NSMutableArray hash](self->_evChargingPreferences, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_avoidTolls = *((_BYTE *)v4 + 25);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 28);
  }
  if ((v5 & 1) != 0)
  {
    self->_avoidHighways = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[GEOUserPreferences addEvChargingPreferences:](self, "addEvChargingPreferences:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
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
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOUserPreferences readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_evChargingPreferences;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingPreferences, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
