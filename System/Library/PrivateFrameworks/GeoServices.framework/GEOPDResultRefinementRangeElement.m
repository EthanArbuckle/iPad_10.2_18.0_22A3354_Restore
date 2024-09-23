@implementation GEOPDResultRefinementRangeElement

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 76) |= 8u;
    *(_BYTE *)(a1 + 76) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
      -[GEOPDResultRefinementRangeElement readAll:](a1, 0);
  }
}

- (GEOPDResultRefinementRangeElement)init
{
  GEOPDResultRefinementRangeElement *v2;
  GEOPDResultRefinementRangeElement *v3;
  GEOPDResultRefinementRangeElement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementRangeElement;
  v2 = -[GEOPDResultRefinementRangeElement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementRangeElement)initWithData:(id)a3
{
  GEOPDResultRefinementRangeElement *v3;
  GEOPDResultRefinementRangeElement *v4;
  GEOPDResultRefinementRangeElement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementRangeElement;
  v3 = -[GEOPDResultRefinementRangeElement initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
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
  v8.super_class = (Class)GEOPDResultRefinementRangeElement;
  -[GEOPDResultRefinementRangeElement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementRangeElement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementRangeElement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  char v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  const __CFString *v20;
  int v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;

  if (!a1)
    return 0;
  -[GEOPDResultRefinementRangeElement readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDResultRefinementRangeElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_850);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v7 = *(id *)(a1 + 24);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("displayName");
    else
      v8 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  v9 = *(_BYTE *)(a1 + 76);
  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("value"));

    v9 = *(_BYTE *)(a1 + 76);
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("isEnabled");
    else
      v12 = CFSTR("is_enabled");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
  {
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = v13;
      objc_sync_enter(v14);
      GEOPDResultRefinementRangeElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRefinementKey_tags_851);
      objc_sync_exit(v14);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v15 = *(id *)(a1 + 32);
  if (v15)
  {
    if (a2)
      v16 = CFSTR("refinementKey");
    else
      v16 = CFSTR("refinement_key");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDResultRefinementRangeElementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStringValue_tags);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v19 = *(id *)(a1 + 40);
  if (v19)
  {
    if (a2)
      v20 = CFSTR("stringValue");
    else
      v20 = CFSTR("string_value");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);
  }

  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    v21 = *(_DWORD *)(a1 + 68);
    if (v21)
    {
      if (v21 == 1)
      {
        v22 = CFSTR("RESULT_REFINEMENT_RANGE_VALUE_TYPE_NUMERIC");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v22 = CFSTR("RESULT_REFINEMENT_RANGE_VALUE_TYPE_STRING");
    }
    if (a2)
      v23 = CFSTR("valueType");
    else
      v23 = CFSTR("value_type");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  v24 = *(void **)(a1 + 16);
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __63__GEOPDResultRefinementRangeElement__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementRangeElement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_866;
      else
        v6 = (int *)&readAll__nonRecursiveTag_867;
      GEOPDResultRefinementRangeElementReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __63__GEOPDResultRefinementRangeElement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  char v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  void *v25;
  id v26;
  int v27;

  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("displayName");
    else
      v7 = CFSTR("display_name");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      v10 = v9;
      *(_BYTE *)(v6 + 76) |= 0x10u;
      *(_BYTE *)(v6 + 76) |= 0x80u;
      objc_storeStrong((id *)(v6 + 24), v9);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "doubleValue");
      *(_BYTE *)(v6 + 76) |= 0x80u;
      *(_BYTE *)(v6 + 76) |= 1u;
      *(_QWORD *)(v6 + 48) = v12;
    }

    if (a3)
      v13 = CFSTR("isEnabled");
    else
      v13 = CFSTR("is_enabled");
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "BOOLValue");
      *(_BYTE *)(v6 + 76) |= 0x80u;
      *(_BYTE *)(v6 + 76) |= 4u;
      *(_BYTE *)(v6 + 72) = v15;
    }

    if (a3)
      v16 = CFSTR("refinementKey");
    else
      v16 = CFSTR("refinement_key");
    objc_msgSend(v5, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      v19 = v18;
      *(_BYTE *)(v6 + 76) |= 0x20u;
      *(_BYTE *)(v6 + 76) |= 0x80u;
      objc_storeStrong((id *)(v6 + 32), v18);

    }
    if (a3)
      v20 = CFSTR("stringValue");
    else
      v20 = CFSTR("string_value");
    objc_msgSend(v5, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      v23 = v22;
      *(_BYTE *)(v6 + 76) |= 0x40u;
      *(_BYTE *)(v6 + 76) |= 0x80u;
      objc_storeStrong((id *)(v6 + 40), v22);

    }
    if (a3)
      v24 = CFSTR("valueType");
    else
      v24 = CFSTR("value_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v25;
      if ((objc_msgSend(v26, "isEqualToString:", CFSTR("RESULT_REFINEMENT_RANGE_VALUE_TYPE_STRING")) & 1) != 0)
        v27 = 0;
      else
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("RESULT_REFINEMENT_RANGE_VALUE_TYPE_NUMERIC"));

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_35:

        goto LABEL_36;
      }
      v27 = objc_msgSend(v25, "intValue");
    }
    *(_BYTE *)(v6 + 76) |= 0x80u;
    *(_BYTE *)(v6 + 76) |= 2u;
    *(_DWORD *)(v6 + 68) = v27;
    goto LABEL_35;
  }
LABEL_36:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementRangeElementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  id v6;
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
    -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)self, 0);
    if (self->_displayName)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    v6 = v9;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      v6 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v6 = v9;
    }
    if (self->_refinementKey)
    {
      PBDataWriterWriteStringField();
      v6 = v9;
    }
    if (self->_stringValue)
    {
      PBDataWriterWriteStringField();
      v6 = v9;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
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
  char flags;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
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
      GEOPDResultRefinementRangeElementReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 48) = self->_value;
    *(_BYTE *)(v5 + 76) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_isEnabled;
    *(_BYTE *)(v5 + 76) |= 4u;
  }
  v12 = -[NSString copyWithZone:](self->_refinementKey, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_valueType;
    *(_BYTE *)(v5 + 76) |= 2u;
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
  NSString *displayName;
  NSString *refinementKey;
  NSString *stringValue;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_value != *((double *)v4 + 6))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) != 0)
    {
      if (self->_isEnabled)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_25;
        goto LABEL_17;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_17;
    }
LABEL_25:
    v8 = 0;
    goto LABEL_26;
  }
  if ((*((_BYTE *)v4 + 76) & 4) != 0)
    goto LABEL_25;
LABEL_17:
  refinementKey = self->_refinementKey;
  if ((unint64_t)refinementKey | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](refinementKey, "isEqual:"))
  {
    goto LABEL_25;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_25;
  }
  v8 = (*((_BYTE *)v4 + 76) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_valueType != *((_DWORD *)v4 + 17))
      goto LABEL_25;
    v8 = 1;
  }
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char flags;
  unint64_t v5;
  double value;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;

  -[GEOPDResultRefinementRangeElement readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_displayName, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    value = self->_value;
    v7 = -value;
    if (value >= 0.0)
      v7 = self->_value;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 4) != 0)
    v10 = 2654435761 * self->_isEnabled;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_refinementKey, "hash");
  v12 = -[NSString hash](self->_stringValue, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v13 = 2654435761 * self->_valueType;
  else
    v13 = 0;
  return v5 ^ v3 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_refinementKey, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
