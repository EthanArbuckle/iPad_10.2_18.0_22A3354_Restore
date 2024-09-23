@implementation GEOPDAutocompleteParametersCollectionOnly

- (GEOPDAutocompleteParametersCollectionOnly)init
{
  GEOPDAutocompleteParametersCollectionOnly *v2;
  GEOPDAutocompleteParametersCollectionOnly *v3;
  GEOPDAutocompleteParametersCollectionOnly *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersCollectionOnly;
  v2 = -[GEOPDAutocompleteParametersCollectionOnly init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersCollectionOnly)initWithData:(id)a3
{
  GEOPDAutocompleteParametersCollectionOnly *v3;
  GEOPDAutocompleteParametersCollectionOnly *v4;
  GEOPDAutocompleteParametersCollectionOnly *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersCollectionOnly;
  v3 = -[GEOPDAutocompleteParametersCollectionOnly initWithData:](&v7, sel_initWithData_, a3);
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
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersCollectionOnlyReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_1079);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasQuery
{
  -[GEOPDAutocompleteParametersCollectionOnly _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDAutocompleteParametersCollectionOnly _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
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
        GEOPDAutocompleteParametersCollectionOnlyReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_1080);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasViewportInfo
{
  -[GEOPDAutocompleteParametersCollectionOnly _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEOPDAutocompleteParametersCollectionOnly _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (void)_readPublisherIds
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
        GEOPDAutocompleteParametersCollectionOnlyReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)publisherIds
{
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  return self->_publisherIds;
}

- (void)setPublisherIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *publisherIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  publisherIds = self->_publisherIds;
  self->_publisherIds = v4;

}

- (void)clearPublisherIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_publisherIds, "removeAllObjects");
}

- (void)addPublisherId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  -[GEOPDAutocompleteParametersCollectionOnly _addNoFlagsPublisherId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsPublisherId:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)publisherIdsCount
{
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  return -[NSMutableArray count](self->_publisherIds, "count");
}

- (id)publisherIdAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_publisherIds, "objectAtIndex:", a3);
}

+ (Class)publisherIdType
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
  v8.super_class = (Class)GEOPDAutocompleteParametersCollectionOnly;
  -[GEOPDAutocompleteParametersCollectionOnly description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteParametersCollectionOnly dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersCollectionOnly _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = *(id *)(a1 + 24);
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
      v18 = CFSTR("publisherId");
    else
      v18 = CFSTR("publisher_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v18);

  }
  v19 = *(void **)(a1 + 16);
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
      v26[2] = __71__GEOPDAutocompleteParametersCollectionOnly__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDAutocompleteParametersCollectionOnly _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __71__GEOPDAutocompleteParametersCollectionOnly__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteParametersCollectionOnly)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersCollectionOnly *)-[GEOPDAutocompleteParametersCollectionOnly _initWithDictionary:isJSON:](self, a3, 0);
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOPDMapsIdentifier *v21;
  uint64_t v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
        v13 = CFSTR("publisherId");
      else
        v13 = CFSTR("publisher_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = v5;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = [GEOPDMapsIdentifier alloc];
                if ((a3 & 1) != 0)
                  v22 = -[GEOPDMapsIdentifier initWithJSON:](v21, "initWithJSON:", v20);
                else
                  v22 = -[GEOPDMapsIdentifier initWithDictionary:](v21, "initWithDictionary:", v20);
                v23 = (void *)v22;
                objc_msgSend(a1, "addPublisherId:", v22);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v17);
        }

        v5 = v25;
      }

    }
  }

  return a1;
}

- (GEOPDAutocompleteParametersCollectionOnly)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersCollectionOnly *)-[GEOPDAutocompleteParametersCollectionOnly _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1085;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1086;
    GEOPDAutocompleteParametersCollectionOnlyReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDAutocompleteParametersCollectionOnlyCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersCollectionOnlyIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersCollectionOnlyReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
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
    -[GEOPDAutocompleteParametersCollectionOnly readAll:](self, "readAll:", 0);
    if (self->_query)
      PBDataWriterWriteStringField();
    if (self->_viewportInfo)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_publisherIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEOPDAutocompleteParametersCollectionOnly _readPublisherIds]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_publisherIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEOPDAutocompleteParametersCollectionOnly _readViewportInfo]((uint64_t)self);
  return -[GEOPDViewportInfo hasGreenTeaWithValue:](self->_viewportInfo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOPDAutocompleteParametersCollectionOnly readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query)
    objc_msgSend(v8, "setQuery:");
  if (self->_viewportInfo)
    objc_msgSend(v8, "setViewportInfo:");
  if (-[GEOPDAutocompleteParametersCollectionOnly publisherIdsCount](self, "publisherIdsCount"))
  {
    objc_msgSend(v8, "clearPublisherIds");
    v4 = -[GEOPDAutocompleteParametersCollectionOnly publisherIdsCount](self, "publisherIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDAutocompleteParametersCollectionOnly publisherIdAtIndex:](self, "publisherIdAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addPublisherId:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDAutocompleteParametersCollectionOnlyReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteParametersCollectionOnly readAll:](self, "readAll:", 0);
  v8 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_publisherIds;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addPublisherId:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *query;
  GEOPDViewportInfo *viewportInfo;
  NSMutableArray *publisherIds;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDAutocompleteParametersCollectionOnly readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         query = self->_query,
         !((unint64_t)query | v4[4]))
     || -[NSString isEqual:](query, "isEqual:"))
    && ((viewportInfo = self->_viewportInfo, !((unint64_t)viewportInfo | v4[5]))
     || -[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")))
  {
    publisherIds = self->_publisherIds;
    if ((unint64_t)publisherIds | v4[3])
      v8 = -[NSMutableArray isEqual:](publisherIds, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  -[GEOPDAutocompleteParametersCollectionOnly readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_query, "hash");
  v4 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_publisherIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOPDViewportInfo *viewportInfo;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (v4[4])
    -[GEOPDAutocompleteParametersCollectionOnly setQuery:](self, "setQuery:");
  viewportInfo = self->_viewportInfo;
  v6 = v4[5];
  if (viewportInfo)
  {
    if (v6)
      -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOPDAutocompleteParametersCollectionOnly setViewportInfo:](self, "setViewportInfo:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4[3];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[GEOPDAutocompleteParametersCollectionOnly addPublisherId:](self, "addPublisherId:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersCollectionOnlyReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1089);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteParametersCollectionOnly readAll:](self, "readAll:", 0);
    -[GEOPDViewportInfo clearUnknownFields:](self->_viewportInfo, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_publisherIds;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_publisherIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
