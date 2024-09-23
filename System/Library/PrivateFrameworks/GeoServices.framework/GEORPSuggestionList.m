@implementation GEORPSuggestionList

- (GEORPSuggestionList)init
{
  GEORPSuggestionList *v2;
  GEORPSuggestionList *v3;
  GEORPSuggestionList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPSuggestionList;
  v2 = -[GEORPSuggestionList init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPSuggestionList)initWithData:(id)a3
{
  GEORPSuggestionList *v3;
  GEORPSuggestionList *v4;
  GEORPSuggestionList *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPSuggestionList;
  v3 = -[GEORPSuggestionList initWithData:](&v7, sel_initWithData_, a3);
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
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPSuggestionListReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasQuery
{
  -[GEORPSuggestionList _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (NSString)query
{
  -[GEORPSuggestionList _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readEntrys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPSuggestionListReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntrys_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)entrys
{
  -[GEORPSuggestionList _readEntrys]((uint64_t)self);
  return self->_entrys;
}

- (void)setEntrys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *entrys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  entrys = self->_entrys;
  self->_entrys = v4;

}

- (void)clearEntrys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_entrys, "removeAllObjects");
}

- (void)addEntry:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPSuggestionList _readEntrys]((uint64_t)self);
  -[GEORPSuggestionList _addNoFlagsEntry:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsEntry:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)entrysCount
{
  -[GEORPSuggestionList _readEntrys]((uint64_t)self);
  return -[NSMutableArray count](self->_entrys, "count");
}

- (id)entryAtIndex:(unint64_t)a3
{
  -[GEORPSuggestionList _readEntrys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_entrys, "objectAtIndex:", a3);
}

+ (Class)entryType
{
  return (Class)objc_opt_class();
}

- (void)_readAutocompleteRequest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPSuggestionListReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteRequest_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAutocompleteRequest
{
  -[GEORPSuggestionList _readAutocompleteRequest]((uint64_t)self);
  return self->_autocompleteRequest != 0;
}

- (GEOPDPlaceRequest)autocompleteRequest
{
  -[GEORPSuggestionList _readAutocompleteRequest]((uint64_t)self);
  return self->_autocompleteRequest;
}

- (void)setAutocompleteRequest:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_autocompleteRequest, a3);
}

- (void)_readAutocompleteResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPSuggestionListReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAutocompleteResponse
{
  -[GEORPSuggestionList _readAutocompleteResponse]((uint64_t)self);
  return self->_autocompleteResponse != 0;
}

- (GEOPDPlaceResponse)autocompleteResponse
{
  -[GEORPSuggestionList _readAutocompleteResponse]((uint64_t)self);
  return self->_autocompleteResponse;
}

- (void)setAutocompleteResponse:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_autocompleteResponse, a3);
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
  v8.super_class = (Class)GEORPSuggestionList;
  -[GEORPSuggestionList description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPSuggestionList dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSuggestionList _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("query"));

  if (objc_msgSend(a1[4], "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = a1[4];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation", (_QWORD)v23);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13, (_QWORD)v23);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("entry"));
  }
  objc_msgSend(a1, "autocompleteRequest", (_QWORD)v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("autocompleteRequest");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("autocomplete_request");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend(a1, "autocompleteResponse");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("autocompleteResponse");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("autocomplete_response");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPSuggestionList _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPSuggestionList)initWithDictionary:(id)a3
{
  return (GEORPSuggestionList *)-[GEORPSuggestionList _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  GEORPSuggestionEntry *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOPDPlaceRequest *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEOPDPlaceResponse *v25;
  uint64_t v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("entry"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v5;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = [GEORPSuggestionEntry alloc];
                if ((a3 & 1) != 0)
                  v16 = -[GEORPSuggestionEntry initWithJSON:](v15, "initWithJSON:", v14);
                else
                  v16 = -[GEORPSuggestionEntry initWithDictionary:](v15, "initWithDictionary:", v14);
                v17 = (void *)v16;
                objc_msgSend(a1, "addEntry:", v16);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v11);
        }

        v5 = v29;
      }

      if (a3)
        v18 = CFSTR("autocompleteRequest");
      else
        v18 = CFSTR("autocomplete_request");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOPDPlaceRequest alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOPDPlaceRequest initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOPDPlaceRequest initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setAutocompleteRequest:", v21);

      }
      if (a3)
        v23 = CFSTR("autocompleteResponse");
      else
        v23 = CFSTR("autocomplete_response");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEOPDPlaceResponse alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEOPDPlaceResponse initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEOPDPlaceResponse initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setAutocompleteResponse:", v26);

      }
    }
  }

  return a1;
}

- (GEORPSuggestionList)initWithJSON:(id)a3
{
  return (GEORPSuggestionList *)-[GEORPSuggestionList _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2740;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2741;
    GEORPSuggestionListReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPSuggestionListCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSuggestionListIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSuggestionListReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPSuggestionListIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPSuggestionList readAll:](self, "readAll:", 0);
    if (self->_query)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_entrys;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_autocompleteRequest)
      PBDataWriterWriteSubmessage();
    if (self->_autocompleteResponse)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPSuggestionListClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPSuggestionList _readAutocompleteRequest]((uint64_t)self);
  if (-[GEOPDPlaceRequest hasGreenTeaWithValue:](self->_autocompleteRequest, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPSuggestionList _readAutocompleteResponse]((uint64_t)self);
  return -[GEOPDPlaceResponse hasGreenTeaWithValue:](self->_autocompleteResponse, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEORPSuggestionList readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query)
    objc_msgSend(v9, "setQuery:");
  if (-[GEORPSuggestionList entrysCount](self, "entrysCount"))
  {
    objc_msgSend(v9, "clearEntrys");
    v4 = -[GEORPSuggestionList entrysCount](self, "entrysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPSuggestionList entryAtIndex:](self, "entryAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addEntry:", v7);

      }
    }
  }
  if (self->_autocompleteRequest)
    objc_msgSend(v9, "setAutocompleteRequest:");
  v8 = v9;
  if (self->_autocompleteResponse)
  {
    objc_msgSend(v9, "setAutocompleteResponse:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPSuggestionListReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPSuggestionList readAll:](self, "readAll:", 0);
  v8 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = self->_entrys;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v5, "addEntry:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v15 = -[GEOPDPlaceRequest copyWithZone:](self->_autocompleteRequest, "copyWithZone:", a3);
  v16 = (void *)v5[2];
  v5[2] = v15;

  v17 = -[GEOPDPlaceResponse copyWithZone:](self->_autocompleteResponse, "copyWithZone:", a3);
  v18 = (void *)v5[3];
  v5[3] = v17;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *query;
  NSMutableArray *entrys;
  GEOPDPlaceRequest *autocompleteRequest;
  GEOPDPlaceResponse *autocompleteResponse;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPSuggestionList readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         query = self->_query,
         !((unint64_t)query | v4[5]))
     || -[NSString isEqual:](query, "isEqual:"))
    && ((entrys = self->_entrys, !((unint64_t)entrys | v4[4]))
     || -[NSMutableArray isEqual:](entrys, "isEqual:"))
    && ((autocompleteRequest = self->_autocompleteRequest, !((unint64_t)autocompleteRequest | v4[2]))
     || -[GEOPDPlaceRequest isEqual:](autocompleteRequest, "isEqual:")))
  {
    autocompleteResponse = self->_autocompleteResponse;
    if ((unint64_t)autocompleteResponse | v4[3])
      v9 = -[GEOPDPlaceResponse isEqual:](autocompleteResponse, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;

  -[GEORPSuggestionList readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_query, "hash");
  v4 = -[NSMutableArray hash](self->_entrys, "hash") ^ v3;
  v5 = -[GEOPDPlaceRequest hash](self->_autocompleteRequest, "hash");
  return v4 ^ v5 ^ -[GEOPDPlaceResponse hash](self->_autocompleteResponse, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOPDPlaceRequest *autocompleteRequest;
  id v11;
  GEOPDPlaceResponse *autocompleteResponse;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[5])
    -[GEORPSuggestionList setQuery:](self, "setQuery:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[GEORPSuggestionList addEntry:](self, "addEntry:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  autocompleteRequest = self->_autocompleteRequest;
  v11 = v4[2];
  if (autocompleteRequest)
  {
    if (v11)
      -[GEOPDPlaceRequest mergeFrom:](autocompleteRequest, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPSuggestionList setAutocompleteRequest:](self, "setAutocompleteRequest:");
  }
  autocompleteResponse = self->_autocompleteResponse;
  v13 = v4[3];
  if (autocompleteResponse)
  {
    if (v13)
      -[GEOPDPlaceResponse mergeFrom:](autocompleteResponse, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPSuggestionList setAutocompleteResponse:](self, "setAutocompleteResponse:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_entrys, 0);
  objc_storeStrong((id *)&self->_autocompleteResponse, 0);
  objc_storeStrong((id *)&self->_autocompleteRequest, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
