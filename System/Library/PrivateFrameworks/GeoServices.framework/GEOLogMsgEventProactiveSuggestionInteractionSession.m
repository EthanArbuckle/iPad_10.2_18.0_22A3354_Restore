@implementation GEOLogMsgEventProactiveSuggestionInteractionSession

- (int)listType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_listType;
  else
    return 0;
}

- (void)setListType:(int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_listType = a3;
}

- (void)setHasListType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasListType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)listTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C031C0[a3];
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
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_MAPS_WIDGET")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_SEARCH_TRAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_CAR_PLAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_TYPE_WATCH")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)proactiveItems
{
  return self->_proactiveItems;
}

- (void)setProactiveItems:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveItems, a3);
}

- (void)clearProactiveItems
{
  -[NSMutableArray removeAllObjects](self->_proactiveItems, "removeAllObjects");
}

- (void)addProactiveItem:(id)a3
{
  id v4;
  NSMutableArray *proactiveItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  proactiveItems = self->_proactiveItems;
  v8 = v4;
  if (!proactiveItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_proactiveItems;
    self->_proactiveItems = v6;

    v4 = v8;
    proactiveItems = self->_proactiveItems;
  }
  -[NSMutableArray addObject:](proactiveItems, "addObject:", v4);

}

- (unint64_t)proactiveItemsCount
{
  return -[NSMutableArray count](self->_proactiveItems, "count");
}

- (id)proactiveItemAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_proactiveItems, "objectAtIndex:", a3);
}

+ (Class)proactiveItemType
{
  return (Class)objc_opt_class();
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)interactedItemIndex
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_interactedItemIndex;
  else
    return -1;
}

- (void)setInteractedItemIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_interactedItemIndex = a3;
}

- (void)setHasInteractedItemIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasInteractedItemIndex
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
  v8.super_class = (Class)GEOLogMsgEventProactiveSuggestionInteractionSession;
  -[GEOLogMsgEventProactiveSuggestionInteractionSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventProactiveSuggestionInteractionSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventProactiveSuggestionInteractionSession _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 4) != 0)
  {
    v5 = *(int *)(a1 + 24);
    if (v5 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C031C0[v5];
    }
    if (a2)
      v7 = CFSTR("listType");
    else
      v7 = CFSTR("list_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = *(id *)(a1 + 8);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("proactiveItem");
    else
      v16 = CFSTR("proactive_item");
    objc_msgSend(v4, "setObject:forKey:", v8, v16);

  }
  v17 = *(_BYTE *)(a1 + 28);
  if ((v17 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("duration"));

    v17 = *(_BYTE *)(a1 + 28);
  }
  if ((v17 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 20));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("interactedItemIndex");
    else
      v20 = CFSTR("interacted_item_index");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventProactiveSuggestionInteractionSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventProactiveSuggestionInteractionSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventProactiveSuggestionInteractionSession *)-[GEOLogMsgEventProactiveSuggestionInteractionSession _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOProactiveItem *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFString *v22;
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
    goto LABEL_47;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_47;
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
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_MAPS_WIDGET")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_SEARCH_TRAY")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_CAR_PLAY")) & 1) != 0)
    {
      v9 = 3;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("LIST_TYPE_WATCH")))
    {
      v9 = 4;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_21:
    objc_msgSend(a1, "setListType:", v9);
  }

  if (a3)
    v10 = CFSTR("proactiveItem");
  else
    v10 = CFSTR("proactive_item");
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
            v18 = [GEOProactiveItem alloc];
            if ((a3 & 1) != 0)
              v19 = -[GEOProactiveItem initWithJSON:](v18, "initWithJSON:", v17);
            else
              v19 = -[GEOProactiveItem initWithDictionary:](v18, "initWithDictionary:", v17);
            v20 = (void *)v19;
            objc_msgSend(a1, "addProactiveItem:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v14);
    }

    v5 = v25;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDuration:", objc_msgSend(v21, "intValue"));

  if (a3)
    v22 = CFSTR("interactedItemIndex");
  else
    v22 = CFSTR("interacted_item_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setInteractedItemIndex:", objc_msgSend(v23, "intValue"));

LABEL_47:
  return a1;
}

- (GEOLogMsgEventProactiveSuggestionInteractionSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventProactiveSuggestionInteractionSession *)-[GEOLogMsgEventProactiveSuggestionInteractionSession _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventProactiveSuggestionInteractionSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventProactiveSuggestionInteractionSessionReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_proactiveItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  _DWORD *v9;

  v9 = a3;
  -[GEOLogMsgEventProactiveSuggestionInteractionSession readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v9[6] = self->_listType;
    *((_BYTE *)v9 + 28) |= 4u;
  }
  if (-[GEOLogMsgEventProactiveSuggestionInteractionSession proactiveItemsCount](self, "proactiveItemsCount"))
  {
    objc_msgSend(v9, "clearProactiveItems");
    v4 = -[GEOLogMsgEventProactiveSuggestionInteractionSession proactiveItemsCount](self, "proactiveItemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEventProactiveSuggestionInteractionSession proactiveItemAtIndex:](self, "proactiveItemAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addProactiveItem:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v9[4] = self->_duration;
    *((_BYTE *)v9 + 28) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v9[5] = self->_interactedItemIndex;
    *((_BYTE *)v9 + 28) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char flags;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_listType;
    *(_BYTE *)(v5 + 28) |= 4u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_proactiveItems;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v6, "addProactiveItem:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_duration;
    *(_BYTE *)(v6 + 28) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_interactedItemIndex;
    *(_BYTE *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *proactiveItems;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOLogMsgEventProactiveSuggestionInteractionSession readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 28);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_listType != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  proactiveItems = self->_proactiveItems;
  if ((unint64_t)proactiveItems | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](proactiveItems, "isEqual:"))
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 28);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_duration != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_19;
  }
  v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_interactedItemIndex != *((_DWORD *)v4 + 5))
      goto LABEL_19;
    v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOLogMsgEventProactiveSuggestionInteractionSession readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v3 = 2654435761 * self->_listType;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_proactiveItems, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = 2654435761 * self->_duration;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_interactedItemIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    self->_listType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 4u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgEventProactiveSuggestionInteractionSession addProactiveItem:](self, "addProactiveItem:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 28);
  if ((v10 & 1) != 0)
  {
    self->_duration = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
    v10 = *((_BYTE *)v4 + 28);
  }
  if ((v10 & 2) != 0)
  {
    self->_interactedItemIndex = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveItems, 0);
}

@end
