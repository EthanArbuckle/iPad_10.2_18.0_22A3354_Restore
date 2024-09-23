@implementation GEOPDShardedId

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_muid;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v7 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_resultProviderId;
    *(_BYTE *)(v6 + 56) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 16) = self->_basemapId;
  *(_BYTE *)(v6 + 56) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_7;
LABEL_13:
    *(_DWORD *)(v6 + 40) = self->_mapsResultType;
    *(_BYTE *)(v6 + 56) |= 4u;
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 48) = self->_sourceId;
  *(_BYTE *)(v6 + 56) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_13;
LABEL_7:
  if ((flags & 0x20) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 52) = self->_isExternalVisibleId;
    *(_BYTE *)(v6 + 56) |= 0x20u;
  }
LABEL_9:
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDShardedId _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  _QWORD v28[4];
  id v29;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 56) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muid"));

  }
  objc_msgSend((id)a1, "center");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("center"));

  }
  v9 = *(_BYTE *)(a1 + 56);
  if ((v9 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 44));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("resultProviderId");
    else
      v20 = CFSTR("result_provider_id");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    v9 = *(_BYTE *)(a1 + 56);
    if ((v9 & 1) == 0)
    {
LABEL_11:
      if ((v9 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)(a1 + 56) & 1) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("basemapId");
  else
    v22 = CFSTR("basemap_id");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v9 = *(_BYTE *)(a1 + 56);
  if ((v9 & 0x10) == 0)
  {
LABEL_12:
    if ((v9 & 4) == 0)
      goto LABEL_13;
LABEL_35:
    v25 = *(int *)(a1 + 40);
    if (v25 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E1C0E9B0[v25];
    }
    if (a2)
      v27 = CFSTR("mapsResultType");
    else
      v27 = CFSTR("maps_result_type");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    if ((*(_BYTE *)(a1 + 56) & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_14;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("sourceId");
  else
    v24 = CFSTR("source_id");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v9 = *(_BYTE *)(a1 + 56);
  if ((v9 & 4) != 0)
    goto LABEL_35;
LABEL_13:
  if ((v9 & 0x20) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isExternalVisibleId");
    else
      v11 = CFSTR("is_external_visible_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
LABEL_18:
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
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __44__GEOPDShardedId__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v16 = v15;
      v29 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v28);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (GEOLatLng)center
{
  return self->_center;
}

- (BOOL)hasCenter
{
  return self->_center != 0;
}

- (BOOL)hasMuid
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (BOOL)hasResultProviderId
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (int)resultProviderId
{
  return self->_resultProviderId;
}

- (void)setResultProviderId:(int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_resultProviderId = a3;
}

- (void)setCenter:(id)a3
{
  objc_storeStrong((id *)&self->_center, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_center)
    PBDataWriterWriteSubmessage();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0)
      goto LABEL_9;
LABEL_15:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_15;
LABEL_9:
  if ((flags & 0x20) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (BOOL)hasBasemapId
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (void)setHasResultProviderId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (unint64_t)basemapId
{
  return self->_basemapId;
}

- (void)setBasemapId:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_basemapId = a3;
}

- (void)setHasBasemapId:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (unsigned)sourceId
{
  return self->_sourceId;
}

- (void)setSourceId:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_sourceId = a3;
}

- (void)setHasSourceId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasSourceId
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (int)mapsResultType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_mapsResultType;
  else
    return 1;
}

- (void)setMapsResultType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_mapsResultType = a3;
}

- (void)setHasMapsResultType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasMapsResultType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)mapsResultTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0E9B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapsResultType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_COLLECTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PUBLISHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isExternalVisibleId
{
  return self->_isExternalVisibleId;
}

- (void)setIsExternalVisibleId:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_isExternalVisibleId = a3;
}

- (void)setHasIsExternalVisibleId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsExternalVisibleId
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
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
  v8.super_class = (Class)GEOPDShardedId;
  -[GEOPDShardedId description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDShardedId dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDShardedId _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDShardedId__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDShardedId)initWithDictionary:(id)a3
{
  return (GEOPDShardedId *)-[GEOPDShardedId _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOLatLng *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;

  v5 = a2;
  if (!a1)
    goto LABEL_52;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_52;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMuid:", objc_msgSend(v6, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("center"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOLatLng initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOLatLng initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setCenter:", v9);

  }
  if (a3)
    v11 = CFSTR("resultProviderId");
  else
    v11 = CFSTR("result_provider_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setResultProviderId:", objc_msgSend(v12, "intValue"));

  if (a3)
    v13 = CFSTR("basemapId");
  else
    v13 = CFSTR("basemap_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBasemapId:", objc_msgSend(v14, "unsignedLongLongValue"));

  if (a3)
    v15 = CFSTR("sourceId");
  else
    v15 = CFSTR("source_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSourceId:", objc_msgSend(v16, "unsignedIntValue"));

  if (a3)
    v17 = CFSTR("mapsResultType");
  else
    v17 = CFSTR("maps_result_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v18;
    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v20 = 0;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE")) & 1) != 0)
    {
      v20 = 1;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_COLLECTION")) & 1) != 0)
    {
      v20 = 2;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PUBLISHER")) & 1) != 0)
    {
      v20 = 3;
    }
    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
    {
      v20 = 4;
    }
    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE")))
    {
      v20 = 5;
    }
    else
    {
      v20 = 0;
    }

    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = objc_msgSend(v18, "intValue");
LABEL_45:
    objc_msgSend(a1, "setMapsResultType:", v20);
  }

  if (a3)
    v21 = CFSTR("isExternalVisibleId");
  else
    v21 = CFSTR("is_external_visible_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsExternalVisibleId:", objc_msgSend(v22, "BOOLValue"));

LABEL_52:
  return a1;
}

- (GEOPDShardedId)initWithJSON:(id)a3
{
  return (GEOPDShardedId *)-[GEOPDShardedId _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDShardedIdIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDShardedIdReadAllFrom((uint64_t)self, a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOLatLng hasGreenTeaWithValue:](self->_center, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char flags;
  _QWORD *v6;

  v6 = a3;
  -[GEOPDShardedId readAll:](self, "readAll:", 0);
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v6[4] = self->_muid;
    *((_BYTE *)v6 + 56) |= 2u;
  }
  if (self->_center)
  {
    objc_msgSend(v6, "setCenter:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v4[11] = self->_resultProviderId;
    *((_BYTE *)v4 + 56) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_7:
      if ((flags & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 2) = self->_basemapId;
  *((_BYTE *)v4 + 56) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0)
      goto LABEL_9;
LABEL_15:
    v4[10] = self->_mapsResultType;
    *((_BYTE *)v4 + 56) |= 4u;
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  v4[12] = self->_sourceId;
  *((_BYTE *)v4 + 56) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_15;
LABEL_9:
  if ((flags & 0x20) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 52) = self->_isExternalVisibleId;
    *((_BYTE *)v4 + 56) |= 0x20u;
  }
LABEL_11:

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOLatLng *center;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[GEOPDShardedId readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 56);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_muid != *((_QWORD *)v4 + 4))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_32;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_32;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 56);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 11))
      goto LABEL_32;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_basemapId != *((_QWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_sourceId != *((_DWORD *)v4 + 12))
      goto LABEL_32;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_mapsResultType != *((_DWORD *)v4 + 10))
      goto LABEL_32;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  v8 = (v6 & 0x20) == 0;
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) != 0)
    {
      if (self->_isExternalVisibleId)
      {
        if (!*((_BYTE *)v4 + 52))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 52))
      {
        goto LABEL_32;
      }
      v8 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v8 = 0;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[GEOPDShardedId readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[GEOLatLng hash](self->_center, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v5 = 2654435761 * self->_resultProviderId;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_6:
      v6 = 2654435761u * self->_basemapId;
      if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_sourceId;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_8;
LABEL_13:
    v8 = 0;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_13;
LABEL_8:
  v8 = 2654435761 * self->_mapsResultType;
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v9 = 2654435761 * self->_isExternalVisibleId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  GEOLatLng *center;
  unint64_t v6;
  char v7;
  unint64_t *v8;

  v8 = (unint64_t *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if ((v8[7] & 2) != 0)
  {
    self->_muid = v8[4];
    *(_BYTE *)&self->_flags |= 2u;
  }
  center = self->_center;
  v6 = v8[3];
  if (center)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLatLng mergeFrom:](center, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDShardedId setCenter:](self, "setCenter:");
  }
  v4 = v8;
LABEL_9:
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 8) != 0)
  {
    self->_resultProviderId = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_flags |= 8u;
    v7 = *((_BYTE *)v4 + 56);
    if ((v7 & 1) == 0)
    {
LABEL_11:
      if ((v7 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_18;
    }
  }
  else if ((v4[7] & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_basemapId = v4[2];
  *(_BYTE *)&self->_flags |= 1u;
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 0x10) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0)
      goto LABEL_13;
LABEL_19:
    self->_mapsResultType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_flags |= 4u;
    if ((v4[7] & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_18:
  self->_sourceId = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_flags |= 0x10u;
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 4) != 0)
    goto LABEL_19;
LABEL_13:
  if ((v7 & 0x20) != 0)
  {
LABEL_14:
    self->_isExternalVisibleId = *((_BYTE *)v4 + 52);
    *(_BYTE *)&self->_flags |= 0x20u;
  }
LABEL_15:

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
    -[GEOPDShardedId readAll:](self, "readAll:", 0);
    -[GEOLatLng clearUnknownFields:](self->_center, "clearUnknownFields:", 1);
  }
}

@end
