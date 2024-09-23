@implementation GEOLogMsgEventListInteractionSession

- (GEOLogMsgEventListInteractionSession)init
{
  GEOLogMsgEventListInteractionSession *v2;
  GEOLogMsgEventListInteractionSession *v3;
  GEOLogMsgEventListInteractionSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventListInteractionSession;
  v2 = -[GEOLogMsgEventListInteractionSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventListInteractionSession)initWithData:(id)a3
{
  GEOLogMsgEventListInteractionSession *v3;
  GEOLogMsgEventListInteractionSession *v4;
  GEOLogMsgEventListInteractionSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventListInteractionSession;
  v3 = -[GEOLogMsgEventListInteractionSession initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)listType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_listType;
  else
    return 0;
}

- (void)setListType:(int)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_listType = a3;
}

- (void)setHasListType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasListType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)listTypeAsString:(int)a3
{
  if (a3 < 0xD)
    return off_1E1C14098[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsListType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_NO_TYPING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_POPULAR_NEARBY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_BROWSE_CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_AC")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_NORMAL_SEARCH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_FAVORITES")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_SIRI_SEARCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_SIRI_DISAMBIGUATION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_DIRECTIONS_NO_TYPING")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_DIRECTIONS_NAV_FROM")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_DIRECTIONS_NAV_TO")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readListResultItems
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventListInteractionSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readListResultItems_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)listResultItems
{
  -[GEOLogMsgEventListInteractionSession _readListResultItems]((uint64_t)self);
  return self->_listResultItems;
}

- (void)setListResultItems:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *listResultItems;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  listResultItems = self->_listResultItems;
  self->_listResultItems = v4;

}

- (void)clearListResultItems
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_listResultItems, "removeAllObjects");
}

- (void)addListResultItem:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventListInteractionSession _readListResultItems]((uint64_t)self);
  -[GEOLogMsgEventListInteractionSession _addNoFlagsListResultItem:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsListResultItem:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)listResultItemsCount
{
  -[GEOLogMsgEventListInteractionSession _readListResultItems]((uint64_t)self);
  return -[NSMutableArray count](self->_listResultItems, "count");
}

- (id)listResultItemAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventListInteractionSession _readListResultItems]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_listResultItems, "objectAtIndex:", a3);
}

+ (Class)listResultItemType
{
  return (Class)objc_opt_class();
}

- (void)_readSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventListInteractionSessionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchString_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSearchString
{
  -[GEOLogMsgEventListInteractionSession _readSearchString]((uint64_t)self);
  return self->_searchString != 0;
}

- (NSString)searchString
{
  -[GEOLogMsgEventListInteractionSession _readSearchString]((uint64_t)self);
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_searchString, a3);
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
  v8.super_class = (Class)GEOLogMsgEventListInteractionSession;
  -[GEOLogMsgEventListInteractionSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventListInteractionSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventListInteractionSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v5 = *(int *)(a1 + 44);
    if (v5 >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C14098[v5];
    }
    if (a2)
      v7 = CFSTR("listType");
    else
      v7 = CFSTR("list_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = *(id *)(a1 + 16);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("listResultItem");
    else
      v16 = CFSTR("list_result_item");
    objc_msgSend(v4, "setObject:forKey:", v8, v16);

  }
  objc_msgSend((id)a1, "searchString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("searchString");
    else
      v18 = CFSTR("search_string");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventListInteractionSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventListInteractionSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventListInteractionSession *)-[GEOLogMsgEventListInteractionSession _initWithDictionary:isJSON:](self, a3, 0);
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
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOListResultItem *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
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
  if (!a1)
    goto LABEL_61;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_61;
  if (a3)
    v6 = CFSTR("listType");
  else
    v6 = CFSTR("list_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_NO_TYPING")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_POPULAR_NEARBY")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_BROWSE_CATEGORY_SEARCH")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_AC")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_NORMAL_SEARCH")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_SEARCH_ALONG_ROUTE")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_FAVORITES")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_SIRI_SEARCH")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_SIRI_DISAMBIGUATION")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_DIRECTIONS_NO_TYPING")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_DIRECTIONS_NAV_FROM")) & 1) != 0)
    {
      v9 = 11;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_DIRECTIONS_NAV_TO")))
    {
      v9 = 12;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_37:
    objc_msgSend(a1, "setListType:", v9);
  }

  if (a3)
    v10 = CFSTR("listResultItem");
  else
    v10 = CFSTR("list_result_item");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v5;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = [GEOListResultItem alloc];
            if ((a3 & 1) != 0)
              v19 = -[GEOListResultItem initWithJSON:](v18, "initWithJSON:", v17);
            else
              v19 = -[GEOListResultItem initWithDictionary:](v18, "initWithDictionary:", v17);
            v20 = (void *)v19;
            objc_msgSend(a1, "addListResultItem:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    v5 = v25;
  }

  if (a3)
    v21 = CFSTR("searchString");
  else
    v21 = CFSTR("search_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(a1, "setSearchString:", v23);

  }
LABEL_61:

  return a1;
}

- (GEOLogMsgEventListInteractionSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventListInteractionSession *)-[GEOLogMsgEventListInteractionSession _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_72;
    else
      v8 = (int *)&readAll__nonRecursiveTag_72;
    GEOLogMsgEventListInteractionSessionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventListInteractionSessionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventListInteractionSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventListInteractionSessionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
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
    -[GEOLogMsgEventListInteractionSession readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_listResultItems;
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

    if (self->_searchString)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOLogMsgEventListInteractionSession readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v8 + 11) = self->_listType;
    *((_BYTE *)v8 + 48) |= 1u;
  }
  if (-[GEOLogMsgEventListInteractionSession listResultItemsCount](self, "listResultItemsCount"))
  {
    objc_msgSend(v8, "clearListResultItems");
    v4 = -[GEOLogMsgEventListInteractionSession listResultItemsCount](self, "listResultItemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEventListInteractionSession listResultItemAtIndex:](self, "listResultItemAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addListResultItem:", v7);

      }
    }
  }
  if (self->_searchString)
    objc_msgSend(v8, "setSearchString:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgEventListInteractionSessionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventListInteractionSession readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_listType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_listResultItems;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v5, "addListResultItem:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *listResultItems;
  NSString *searchString;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEOLogMsgEventListInteractionSession readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_listType != *((_DWORD *)v4 + 11))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  listResultItems = self->_listResultItems;
  if ((unint64_t)listResultItems | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](listResultItems, "isEqual:"))
  {
    goto LABEL_11;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 3))
    v7 = -[NSString isEqual:](searchString, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLogMsgEventListInteractionSession readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_listType;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_listResultItems, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_searchString, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_listType = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgEventListInteractionSession addListResultItem:](self, "addListResultItem:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 3))
    -[GEOLogMsgEventListInteractionSession setSearchString:](self, "setSearchString:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_listResultItems, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
