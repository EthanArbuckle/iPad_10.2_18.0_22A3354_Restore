@implementation GEOLogMsgStateTapEvent

- (NSMutableArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (void)clearSearchResults
{
  -[NSMutableArray removeAllObjects](self->_searchResults, "removeAllObjects");
}

- (void)addSearchResults:(id)a3
{
  id v4;
  NSMutableArray *searchResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  searchResults = self->_searchResults;
  v8 = v4;
  if (!searchResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_searchResults;
    self->_searchResults = v6;

    v4 = v8;
    searchResults = self->_searchResults;
  }
  -[NSMutableArray addObject:](searchResults, "addObject:", v4);

}

- (unint64_t)searchResultsCount
{
  return -[NSMutableArray count](self->_searchResults, "count");
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_searchResults, "objectAtIndex:", a3);
}

+ (Class)searchResultsType
{
  return (Class)objc_opt_class();
}

- (int)pinType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_pinType;
  else
    return 0;
}

- (void)setPinType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_pinType = a3;
}

- (void)setHasPinType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPinType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)pinTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23090[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPinType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STANDARD_POI")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLUSTERED_POI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENRICHED_POI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLUSTERED_ENRICHED_POI")))
  {
    v4 = 3;
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
  v8.super_class = (Class)GEOLogMsgStateTapEvent;
  -[GEOLogMsgStateTapEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateTapEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateTapEvent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = *(id *)(a1 + 8);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("searchResults");
    else
      v13 = CFSTR("search_results");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
  {
    v14 = *(int *)(a1 + 16);
    if (v14 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C23090[v14];
    }
    if (a2)
      v16 = CFSTR("pinType");
    else
      v16 = CFSTR("pin_type");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateTapEvent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateTapEvent)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateTapEvent *)-[GEOLogMsgStateTapEvent _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOSearchResult *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v22;
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
        v6 = CFSTR("searchResults");
      else
        v6 = CFSTR("search_results");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v5;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v24 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOSearchResult alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOSearchResult initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOSearchResult initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addSearchResults:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          }
          while (v10);
        }

        v5 = v22;
      }

      if (a3)
        v17 = CFSTR("pinType");
      else
        v17 = CFSTR("pin_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("STANDARD_POI")) & 1) != 0)
        {
          v20 = 0;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("CLUSTERED_POI")) & 1) != 0)
        {
          v20 = 1;
        }
        else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("ENRICHED_POI")) & 1) != 0)
        {
          v20 = 2;
        }
        else if (objc_msgSend(v19, "isEqualToString:", CFSTR("CLUSTERED_ENRICHED_POI")))
        {
          v20 = 3;
        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_37:

          goto LABEL_38;
        }
        v20 = objc_msgSend(v18, "intValue");
      }
      objc_msgSend(a1, "setPinType:", v20);
      goto LABEL_37;
    }
  }
LABEL_38:

  return a1;
}

- (GEOLogMsgStateTapEvent)initWithJSON:(id)a3
{
  return (GEOLogMsgStateTapEvent *)-[GEOLogMsgStateTapEvent _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateTapEventIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateTapEventReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_searchResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  -[GEOLogMsgStateTapEvent readAll:](self, "readAll:", 0);
  if (-[GEOLogMsgStateTapEvent searchResultsCount](self, "searchResultsCount"))
  {
    objc_msgSend(v8, "clearSearchResults");
    v4 = -[GEOLogMsgStateTapEvent searchResultsCount](self, "searchResultsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgStateTapEvent searchResultsAtIndex:](self, "searchResultsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addSearchResults:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v8 + 4) = self->_pinType;
    *((_BYTE *)v8 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_searchResults;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend((id)v5, "addSearchResults:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_pinType;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *searchResults;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOLogMsgStateTapEvent readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  searchResults = self->_searchResults;
  if ((unint64_t)searchResults | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](searchResults, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_pinType == *((_DWORD *)v4 + 4))
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
  uint64_t v3;
  uint64_t v4;

  -[GEOLogMsgStateTapEvent readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_searchResults, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_pinType;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgStateTapEvent addSearchResults:](self, "addSearchResults:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_pinType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end
