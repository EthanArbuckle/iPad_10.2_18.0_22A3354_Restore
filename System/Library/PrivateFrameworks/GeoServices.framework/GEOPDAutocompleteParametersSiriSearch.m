@implementation GEOPDAutocompleteParametersSiriSearch

- (GEOPDAutocompleteParametersSiriSearch)init
{
  GEOPDAutocompleteParametersSiriSearch *v2;
  GEOPDAutocompleteParametersSiriSearch *v3;
  GEOPDAutocompleteParametersSiriSearch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersSiriSearch;
  v2 = -[GEOPDAutocompleteParametersSiriSearch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersSiriSearch)initWithData:(id)a3
{
  GEOPDAutocompleteParametersSiriSearch *v3;
  GEOPDAutocompleteParametersSiriSearch *v4;
  GEOPDAutocompleteParametersSiriSearch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersSiriSearch;
  v3 = -[GEOPDAutocompleteParametersSiriSearch initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersSiriSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_1146);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasQuery
{
  -[GEOPDAutocompleteParametersSiriSearch _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDAutocompleteParametersSiriSearch _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersSiriSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_1147);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasViewportInfo
{
  -[GEOPDAutocompleteParametersSiriSearch _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEOPDAutocompleteParametersSiriSearch _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (int)maxResults
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_maxResults;
  else
    return 15;
}

- (void)setMaxResults:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasMaxResults
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)highlightDiff
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 4) != 0 && self->_highlightDiff;
}

- (void)setHighlightDiff:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_highlightDiff = a3;
}

- (void)setHasHighlightDiff:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHighlightDiff
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readPrefix
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersSiriSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrefix_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPrefix
{
  -[GEOPDAutocompleteParametersSiriSearch _readPrefix]((uint64_t)self);
  return self->_prefix != 0;
}

- (NSString)prefix
{
  -[GEOPDAutocompleteParametersSiriSearch _readPrefix]((uint64_t)self);
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_completed = a3;
}

- (void)setHasCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasCompleted
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
  v8.super_class = (Class)GEOPDAutocompleteParametersSiriSearch;
  -[GEOPDAutocompleteParametersSiriSearch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteParametersSiriSearch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersSiriSearch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  char v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("query"));

  objc_msgSend((id)a1, "viewportInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "jsonRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  v10 = *(_BYTE *)(a1 + 68);
  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 60));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("maxResults");
    else
      v12 = CFSTR("max_results");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    v10 = *(_BYTE *)(a1 + 68);
  }
  if ((v10 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("highlightDiff");
    else
      v14 = CFSTR("highlight_diff");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "prefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("prefix"));

  if ((*(_BYTE *)(a1 + 68) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("completed"));

  }
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __67__GEOPDAutocompleteParametersSiriSearch__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteParametersSiriSearch _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __67__GEOPDAutocompleteParametersSiriSearch__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteParametersSiriSearch)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersSiriSearch *)-[GEOPDAutocompleteParametersSiriSearch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOPDViewportInfo *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("query"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setQuery:", v7);

      }
      if (a3)
        v8 = CFSTR("viewportInfo");
      else
        v8 = CFSTR("viewport_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOPDViewportInfo alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOPDViewportInfo initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOPDViewportInfo initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setViewportInfo:", v11);

      }
      if (a3)
        v13 = CFSTR("maxResults");
      else
        v13 = CFSTR("max_results");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxResults:", objc_msgSend(v14, "intValue"));

      if (a3)
        v15 = CFSTR("highlightDiff");
      else
        v15 = CFSTR("highlight_diff");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHighlightDiff:", objc_msgSend(v16, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prefix"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setPrefix:", v18);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completed"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCompleted:", objc_msgSend(v19, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOPDAutocompleteParametersSiriSearch)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersSiriSearch *)-[GEOPDAutocompleteParametersSiriSearch _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1152;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1153;
    GEOPDAutocompleteParametersSiriSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOPDViewportInfo readAll:](self->_viewportInfo, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersSiriSearchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersSiriSearchReadAllFrom((uint64_t)self, a3, 0);
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
    -[GEOPDAutocompleteParametersSiriSearch readAll:](self, "readAll:", 0);
    if (self->_query)
      PBDataWriterWriteStringField();
    v5 = v9;
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    if (self->_prefix)
    {
      PBDataWriterWriteStringField();
      v5 = v9;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDAutocompleteParametersSiriSearch _readViewportInfo]((uint64_t)self);
  return -[GEOPDViewportInfo hasGreenTeaWithValue:](self->_viewportInfo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOPDAutocompleteParametersSiriSearch readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query)
    objc_msgSend(v6, "setQuery:");
  if (self->_viewportInfo)
    objc_msgSend(v6, "setViewportInfo:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v6 + 15) = self->_maxResults;
    *((_BYTE *)v6 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v6 + 65) = self->_highlightDiff;
    *((_BYTE *)v6 + 68) |= 4u;
  }
  if (self->_prefix)
  {
    objc_msgSend(v6, "setPrefix:");
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v5 + 64) = self->_completed;
    *((_BYTE *)v5 + 68) |= 2u;
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
  id v11;
  void *v12;
  char flags;
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
      GEOPDAutocompleteParametersSiriSearchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteParametersSiriSearch readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_maxResults;
    *(_BYTE *)(v5 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 65) = self->_highlightDiff;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v14 = -[NSString copyWithZone:](self->_prefix, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_completed;
    *(_BYTE *)(v5 + 68) |= 2u;
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
  NSString *query;
  GEOPDViewportInfo *viewportInfo;
  char flags;
  char v8;
  NSString *prefix;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOPDAutocompleteParametersSiriSearch readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](query, "isEqual:"))
      goto LABEL_24;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_24;
  }
  flags = (char)self->_flags;
  v8 = *((_BYTE *)v4 + 68);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 15))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0)
      goto LABEL_24;
    if (self->_highlightDiff)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_24;
  }
  prefix = self->_prefix;
  if ((unint64_t)prefix | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](prefix, "isEqual:"))
      goto LABEL_24;
    flags = (char)self->_flags;
    v8 = *((_BYTE *)v4 + 68);
  }
  v10 = (v8 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) != 0)
    {
      if (self->_completed)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_24;
      }
      else if (*((_BYTE *)v4 + 64))
      {
        goto LABEL_24;
      }
      v10 = 1;
      goto LABEL_25;
    }
LABEL_24:
    v10 = 0;
  }
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  -[GEOPDAutocompleteParametersSiriSearch readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_query, "hash");
  v4 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_maxResults;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_highlightDiff;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = -[NSString hash](self->_prefix, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_completed;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOPDViewportInfo *viewportInfo;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if (v8[4])
  {
    -[GEOPDAutocompleteParametersSiriSearch setQuery:](self, "setQuery:");
    v4 = v8;
  }
  viewportInfo = self->_viewportInfo;
  v6 = v4[5];
  if (viewportInfo)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDAutocompleteParametersSiriSearch setViewportInfo:](self, "setViewportInfo:");
  }
  v4 = v8;
LABEL_9:
  v7 = *((_BYTE *)v4 + 68);
  if ((v7 & 1) != 0)
  {
    self->_maxResults = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
    v7 = *((_BYTE *)v4 + 68);
  }
  if ((v7 & 4) != 0)
  {
    self->_highlightDiff = *((_BYTE *)v4 + 65);
    *(_BYTE *)&self->_flags |= 4u;
  }
  if (v4[3])
  {
    -[GEOPDAutocompleteParametersSiriSearch setPrefix:](self, "setPrefix:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_completed = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_flags |= 2u;
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
      GEOPDAutocompleteParametersSiriSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1156);
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
  {
    -[GEOPDAutocompleteParametersSiriSearch readAll:](self, "readAll:", 0);
    -[GEOPDViewportInfo clearUnknownFields:](self->_viewportInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
