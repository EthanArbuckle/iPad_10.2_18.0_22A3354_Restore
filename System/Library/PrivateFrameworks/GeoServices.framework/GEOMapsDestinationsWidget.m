@implementation GEOMapsDestinationsWidget

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

- (BOOL)initiallyExpanded
{
  return self->_initiallyExpanded;
}

- (void)setInitiallyExpanded:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_initiallyExpanded = a3;
}

- (void)setHasInitiallyExpanded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasInitiallyExpanded
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)everExpanded
{
  return self->_everExpanded;
}

- (void)setEverExpanded:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_everExpanded = a3;
}

- (void)setHasEverExpanded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEverExpanded
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)tappedItemIndex
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_tappedItemIndex;
  else
    return -1;
}

- (void)setTappedItemIndex:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_tappedItemIndex = a3;
}

- (void)setHasTappedItemIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTappedItemIndex
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOMapsDestinationsWidget;
  -[GEOMapsDestinationsWidget description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapsDestinationsWidget dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsDestinationsWidget _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = *(id *)(a1 + 8);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v23 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if ((a2 & 1) != 0)
              objc_msgSend(v11, "jsonRepresentation");
            else
              objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v22);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12, (_QWORD)v22);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v8);
      }

      if (a2)
        v13 = CFSTR("proactiveItem");
      else
        v13 = CFSTR("proactive_item");
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (_QWORD)v22);

    }
    v14 = *(_BYTE *)(a1 + 24);
    if ((v14 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 21));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v16 = CFSTR("initiallyExpanded");
      else
        v16 = CFSTR("initially_expanded");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

      v14 = *(_BYTE *)(a1 + 24);
      if ((v14 & 2) == 0)
      {
LABEL_19:
        if ((v14 & 1) == 0)
          return v4;
LABEL_29:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (a2)
          v20 = CFSTR("tappedItemIndex");
        else
          v20 = CFSTR("tapped_item_index");
        objc_msgSend(v4, "setObject:forKey:", v19, v20);

        return v4;
      }
    }
    else if ((*(_BYTE *)(a1 + 24) & 2) == 0)
    {
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("everExpanded");
    else
      v18 = CFSTR("ever_expanded");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    if ((*(_BYTE *)(a1 + 24) & 1) == 0)
      return v4;
    goto LABEL_29;
  }
  return 0;
}

- (id)jsonRepresentation
{
  return -[GEOMapsDestinationsWidget _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsDestinationsWidget)initWithDictionary:(id)a3
{
  return (GEOMapsDestinationsWidget *)-[GEOMapsDestinationsWidget _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOProactiveWidgetItem *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("proactiveItem");
      else
        v6 = CFSTR("proactive_item");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v24 = v7;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v26 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOProactiveWidgetItem alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOProactiveWidgetItem initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOProactiveWidgetItem initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addProactiveItem:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v10);
        }

        v7 = v24;
      }

      if (a3)
        v17 = CFSTR("initiallyExpanded");
      else
        v17 = CFSTR("initially_expanded");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setInitiallyExpanded:", objc_msgSend(v18, "BOOLValue"));

      if (a3)
        v19 = CFSTR("everExpanded");
      else
        v19 = CFSTR("ever_expanded");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEverExpanded:", objc_msgSend(v20, "BOOLValue"));

      if (a3)
        v21 = CFSTR("tappedItemIndex");
      else
        v21 = CFSTR("tapped_item_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTappedItemIndex:", objc_msgSend(v22, "intValue"));

    }
  }

  return a1;
}

- (GEOMapsDestinationsWidget)initWithJSON:(id)a3
{
  return (GEOMapsDestinationsWidget *)-[GEOMapsDestinationsWidget _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsDestinationsWidgetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsDestinationsWidgetReadAllFrom((uint64_t)self, a3);
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
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
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_10;
LABEL_14:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((flags & 1) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id v9;

  v9 = a3;
  -[GEOMapsDestinationsWidget readAll:](self, "readAll:", 0);
  if (-[GEOMapsDestinationsWidget proactiveItemsCount](self, "proactiveItemsCount"))
  {
    objc_msgSend(v9, "clearProactiveItems");
    v4 = -[GEOMapsDestinationsWidget proactiveItemsCount](self, "proactiveItemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOMapsDestinationsWidget proactiveItemAtIndex:](self, "proactiveItemAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addProactiveItem:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_BYTE *)v9 + 20) = self->_everExpanded;
    *((_BYTE *)v9 + 24) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_BYTE *)v9 + 21) = self->_initiallyExpanded;
  *((_BYTE *)v9 + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v9 + 4) = self->_tappedItemIndex;
    *((_BYTE *)v9 + 24) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char flags;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_proactiveItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v5, "addProactiveItem:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_10;
LABEL_14:
    *(_BYTE *)(v5 + 20) = self->_everExpanded;
    *(_BYTE *)(v5 + 24) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v5;
    goto LABEL_11;
  }
  *(_BYTE *)(v5 + 21) = self->_initiallyExpanded;
  *(_BYTE *)(v5 + 24) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((flags & 1) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 16) = self->_tappedItemIndex;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *proactiveItems;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOMapsDestinationsWidget readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  proactiveItems = self->_proactiveItems;
  if ((unint64_t)proactiveItems | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](proactiveItems, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_24;
    if (self->_initiallyExpanded)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) != 0)
    {
      if (self->_everExpanded)
      {
        if (!*((_BYTE *)v4 + 20))
          goto LABEL_24;
        goto LABEL_20;
      }
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_20;
    }
LABEL_24:
    v6 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 24) & 2) != 0)
    goto LABEL_24;
LABEL_20:
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_tappedItemIndex != *((_DWORD *)v4 + 4))
      goto LABEL_24;
    v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOMapsDestinationsWidget readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_proactiveItems, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_initiallyExpanded;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_everExpanded;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_tappedItemIndex;
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
        -[GEOMapsDestinationsWidget addProactiveItem:](self, "addProactiveItem:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 24);
  if ((v10 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_10;
LABEL_14:
    self->_everExpanded = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v4 + 24) & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  self->_initiallyExpanded = *((_BYTE *)v4 + 21);
  *(_BYTE *)&self->_flags |= 4u;
  v10 = *((_BYTE *)v4 + 24);
  if ((v10 & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v10 & 1) != 0)
  {
LABEL_11:
    self->_tappedItemIndex = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveItems, 0);
}

@end
