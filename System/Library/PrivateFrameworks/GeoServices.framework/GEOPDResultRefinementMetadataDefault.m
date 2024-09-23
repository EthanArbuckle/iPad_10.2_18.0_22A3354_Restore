@implementation GEOPDResultRefinementMetadataDefault

- (GEOPDResultRefinementMetadataDefault)init
{
  GEOPDResultRefinementMetadataDefault *v2;
  GEOPDResultRefinementMetadataDefault *v3;
  GEOPDResultRefinementMetadataDefault *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementMetadataDefault;
  v2 = -[GEOPDResultRefinementMetadataDefault init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementMetadataDefault)initWithData:(id)a3
{
  GEOPDResultRefinementMetadataDefault *v3;
  GEOPDResultRefinementMetadataDefault *v4;
  GEOPDResultRefinementMetadataDefault *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementMetadataDefault;
  v3 = -[GEOPDResultRefinementMetadataDefault initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRefinementKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMetadataDefaultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefinementKey_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRefinementKey
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementKey]((uint64_t)self);
  return self->_refinementKey != 0;
}

- (NSString)refinementKey
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementKey]((uint64_t)self);
  return self->_refinementKey;
}

- (void)setRefinementKey:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_refinementKey, a3);
}

- (int)refinementMetadataDefaultType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_refinementMetadataDefaultType;
  else
    return 0;
}

- (void)setRefinementMetadataDefaultType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_refinementMetadataDefaultType = a3;
}

- (void)setHasRefinementMetadataDefaultType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasRefinementMetadataDefaultType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)refinementMetadataDefaultTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0DD88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRefinementMetadataDefaultType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_STRING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_BYTES")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readRefinementValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMetadataDefaultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefinementValue_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRefinementValue
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementValue]((uint64_t)self);
  return self->_refinementValue != 0;
}

- (NSString)refinementValue
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementValue]((uint64_t)self);
  return self->_refinementValue;
}

- (void)setRefinementValue:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_refinementValue, a3);
}

- (void)_readRefinementValueMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementMetadataDefaultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefinementValueMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRefinementValueMetadata
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementValueMetadata]((uint64_t)self);
  return self->_refinementValueMetadata != 0;
}

- (NSData)refinementValueMetadata
{
  -[GEOPDResultRefinementMetadataDefault _readRefinementValueMetadata]((uint64_t)self);
  return self->_refinementValueMetadata;
}

- (void)setRefinementValueMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_refinementValueMetadata, a3);
}

- (unsigned)selectionFromQuerySequenceNumber
{
  return self->_selectionFromQuerySequenceNumber;
}

- (void)setSelectionFromQuerySequenceNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_selectionFromQuerySequenceNumber = a3;
}

- (void)setHasSelectionFromQuerySequenceNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSelectionFromQuerySequenceNumber
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)selectionFromQuery
{
  return self->_selectionFromQuery;
}

- (void)setSelectionFromQuery:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_selectionFromQuery = a3;
}

- (void)setHasSelectionFromQuery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSelectionFromQuery
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOPDResultRefinementMetadataDefault;
  -[GEOPDResultRefinementMetadataDefault description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementMetadataDefault dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementMetadataDefault _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "refinementKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("refinementKey");
    else
      v6 = CFSTR("refinement_key");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    v7 = *(int *)(a1 + 60);
    if (v7 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C0DD88[v7];
    }
    if (a2)
      v9 = CFSTR("refinementMetadataDefaultType");
    else
      v9 = CFSTR("refinement_metadata_default_type");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "refinementValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("refinementValue");
    else
      v11 = CFSTR("refinement_value");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend((id)a1, "refinementValueMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("refinementValueMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("refinement_value_metadata"));
    }
  }

  v15 = *(_BYTE *)(a1 + 72);
  if ((v15 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("selectionFromQuerySequenceNumber");
    else
      v17 = CFSTR("selection_from_query_sequence_number");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v15 = *(_BYTE *)(a1 + 72);
  }
  if ((v15 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("selectionFromQuery");
    else
      v19 = CFSTR("selection_from_query");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __66__GEOPDResultRefinementMetadataDefault__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementMetadataDefault _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __66__GEOPDResultRefinementMetadataDefault__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDResultRefinementMetadataDefault)initWithDictionary:(id)a3
{
  return (GEOPDResultRefinementMetadataDefault *)-[GEOPDResultRefinementMetadataDefault _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;

  v5 = a2;
  if (!a1)
    goto LABEL_44;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_44;
  if (a3)
    v6 = CFSTR("refinementKey");
  else
    v6 = CFSTR("refinement_key");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setRefinementKey:", v8);

  }
  if (a3)
    v9 = CFSTR("refinementMetadataDefaultType");
  else
    v9 = CFSTR("refinement_metadata_default_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_STRING")) & 1) != 0)
    {
      v12 = 1;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RESULT_REFINEMENT_METADATA_DEFAULT_TYPE_BYTES")))
    {
      v12 = 2;
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "intValue");
LABEL_22:
    objc_msgSend(a1, "setRefinementMetadataDefaultType:", v12);
  }

  if (a3)
    v13 = CFSTR("refinementValue");
  else
    v13 = CFSTR("refinement_value");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setRefinementValue:", v15);

  }
  if (a3)
    v16 = CFSTR("refinementValueMetadata");
  else
    v16 = CFSTR("refinement_value_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v17, 0);
    objc_msgSend(a1, "setRefinementValueMetadata:", v18);

  }
  if (a3)
    v19 = CFSTR("selectionFromQuerySequenceNumber");
  else
    v19 = CFSTR("selection_from_query_sequence_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSelectionFromQuerySequenceNumber:", objc_msgSend(v20, "unsignedIntValue"));

  if (a3)
    v21 = CFSTR("selectionFromQuery");
  else
    v21 = CFSTR("selection_from_query");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSelectionFromQuery:", objc_msgSend(v22, "BOOLValue"));

LABEL_44:
  return a1;
}

- (GEOPDResultRefinementMetadataDefault)initWithJSON:(id)a3
{
  return (GEOPDResultRefinementMetadataDefault *)-[GEOPDResultRefinementMetadataDefault _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_520;
    else
      v8 = (int *)&readAll__nonRecursiveTag_521;
    GEOPDResultRefinementMetadataDefaultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDResultRefinementMetadataDefaultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementMetadataDefaultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  char flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 0xFu))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementMetadataDefault readAll:](self, "readAll:", 0);
    if (self->_refinementKey)
      PBDataWriterWriteStringField();
    v5 = v9;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
    }
    if (self->_refinementValue)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if (self->_refinementValueMetadata)
    {
      PBDataWriterWriteDataField();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOPDResultRefinementMetadataDefault readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_refinementKey)
    objc_msgSend(v6, "setRefinementKey:");
  v4 = v6;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_refinementMetadataDefaultType;
    *((_BYTE *)v6 + 72) |= 1u;
  }
  if (self->_refinementValue)
  {
    objc_msgSend(v6, "setRefinementValue:");
    v4 = v6;
  }
  if (self->_refinementValueMetadata)
  {
    objc_msgSend(v6, "setRefinementValueMetadata:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_selectionFromQuerySequenceNumber;
    *((_BYTE *)v4 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v4 + 68) = self->_selectionFromQuery;
    *((_BYTE *)v4 + 72) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char flags;
  PBUnknownFields *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDResultRefinementMetadataDefaultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementMetadataDefault readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_refinementKey, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_refinementMetadataDefaultType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_refinementValue, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[NSData copyWithZone:](self->_refinementValueMetadata, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_selectionFromQuerySequenceNumber;
    *(_BYTE *)(v5 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 68) = self->_selectionFromQuery;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *refinementKey;
  NSString *refinementValue;
  NSData *refinementValueMetadata;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOPDResultRefinementMetadataDefault readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  refinementKey = self->_refinementKey;
  if ((unint64_t)refinementKey | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](refinementKey, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_refinementMetadataDefaultType != *((_DWORD *)v4 + 15))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_20;
  }
  refinementValue = self->_refinementValue;
  if ((unint64_t)refinementValue | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](refinementValue, "isEqual:"))
  {
    goto LABEL_20;
  }
  refinementValueMetadata = self->_refinementValueMetadata;
  if ((unint64_t)refinementValueMetadata | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](refinementValueMetadata, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_selectionFromQuerySequenceNumber != *((_DWORD *)v4 + 16))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_20;
  }
  v8 = (*((_BYTE *)v4 + 72) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0)
    {
LABEL_20:
      v8 = 0;
      goto LABEL_21;
    }
    if (self->_selectionFromQuery)
    {
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_20;
    }
    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_20;
    }
    v8 = 1;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPDResultRefinementMetadataDefault readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_refinementKey, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_refinementMetadataDefaultType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_refinementValue, "hash");
  v6 = -[NSData hash](self->_refinementValueMetadata, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v7 = 2654435761 * self->_selectionFromQuerySequenceNumber;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761 * self->_selectionFromQuery;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if (v6[3])
  {
    -[GEOPDResultRefinementMetadataDefault setRefinementKey:](self, "setRefinementKey:");
    v4 = v6;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_refinementMetadataDefaultType = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (v4[5])
  {
    -[GEOPDResultRefinementMetadataDefault setRefinementValue:](self, "setRefinementValue:");
    v4 = v6;
  }
  if (v4[4])
  {
    -[GEOPDResultRefinementMetadataDefault setRefinementValueMetadata:](self, "setRefinementValueMetadata:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_selectionFromQuerySequenceNumber = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 4) != 0)
  {
    self->_selectionFromQuery = *((_BYTE *)v4 + 68);
    *(_BYTE *)&self->_flags |= 4u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDResultRefinementMetadataDefaultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_524);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x88u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOPDResultRefinementMetadataDefault readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementValue, 0);
  objc_storeStrong((id *)&self->_refinementValueMetadata, 0);
  objc_storeStrong((id *)&self->_refinementKey, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
