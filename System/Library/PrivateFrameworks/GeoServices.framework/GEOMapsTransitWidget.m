@implementation GEOMapsTransitWidget

- (int)transitMessageType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_transitMessageType;
  else
    return 0;
}

- (void)setTransitMessageType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_transitMessageType = a3;
}

- (void)setHasTransitMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransitMessageType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)transitMessageTypeAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E1C032F8 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransitMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_NO_FAVORITE_LINE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_NO_ADVISORY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_SINGLE_ADVISORY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_MULTIPLE_ADVISORIES")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)transitIncidentItems
{
  return self->_transitIncidentItems;
}

- (void)setTransitIncidentItems:(id)a3
{
  objc_storeStrong((id *)&self->_transitIncidentItems, a3);
}

- (void)clearTransitIncidentItems
{
  -[NSMutableArray removeAllObjects](self->_transitIncidentItems, "removeAllObjects");
}

- (void)addTransitIncidentItem:(id)a3
{
  id v4;
  NSMutableArray *transitIncidentItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transitIncidentItems = self->_transitIncidentItems;
  v8 = v4;
  if (!transitIncidentItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_transitIncidentItems;
    self->_transitIncidentItems = v6;

    v4 = v8;
    transitIncidentItems = self->_transitIncidentItems;
  }
  -[NSMutableArray addObject:](transitIncidentItems, "addObject:", v4);

}

- (unint64_t)transitIncidentItemsCount
{
  return -[NSMutableArray count](self->_transitIncidentItems, "count");
}

- (id)transitIncidentItemAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transitIncidentItems, "objectAtIndex:", a3);
}

+ (Class)transitIncidentItemType
{
  return (Class)objc_opt_class();
}

- (BOOL)initiallyExpanded
{
  return self->_initiallyExpanded;
}

- (void)setInitiallyExpanded:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_initiallyExpanded = a3;
}

- (void)setHasInitiallyExpanded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasInitiallyExpanded
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)everExpanded
{
  return self->_everExpanded;
}

- (void)setEverExpanded:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_everExpanded = a3;
}

- (void)setHasEverExpanded:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEverExpanded
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOMapsTransitWidget;
  -[GEOMapsTransitWidget description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapsTransitWidget dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsTransitWidget _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
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
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 28) & 2) != 0)
    {
      v5 = *(int *)(a1 + 20);
      if (v5 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = *(&off_1E1C032F8 + v5);
      }
      if (a2)
        v7 = CFSTR("transitMessageType");
      else
        v7 = CFSTR("transit_message_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v9 = *(id *)(a1 + 8);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if ((a2 & 1) != 0)
              objc_msgSend(v14, "jsonRepresentation");
            else
              objc_msgSend(v14, "dictionaryRepresentation");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v11);
      }

      if (a2)
        v16 = CFSTR("transitIncidentItem");
      else
        v16 = CFSTR("transit_incident_item");
      objc_msgSend(v4, "setObject:forKey:", v8, v16);

    }
    v17 = *(_BYTE *)(a1 + 28);
    if ((v17 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v19 = CFSTR("initiallyExpanded");
      else
        v19 = CFSTR("initially_expanded");
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

      v17 = *(_BYTE *)(a1 + 28);
      if ((v17 & 4) == 0)
      {
LABEL_27:
        if ((v17 & 1) == 0)
          return v4;
LABEL_37:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (a2)
          v23 = CFSTR("tappedItemIndex");
        else
          v23 = CFSTR("tapped_item_index");
        objc_msgSend(v4, "setObject:forKey:", v22, v23);

        return v4;
      }
    }
    else if ((*(_BYTE *)(a1 + 28) & 4) == 0)
    {
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("everExpanded");
    else
      v21 = CFSTR("ever_expanded");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

    if ((*(_BYTE *)(a1 + 28) & 1) == 0)
      return v4;
    goto LABEL_37;
  }
  return 0;
}

- (id)jsonRepresentation
{
  return -[GEOMapsTransitWidget _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsTransitWidget)initWithDictionary:(id)a3
{
  return (GEOMapsTransitWidget *)-[GEOMapsTransitWidget _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOTransitIncidentItem *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_55;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_55;
  if (a3)
    v6 = CFSTR("transitMessageType");
  else
    v6 = CFSTR("transit_message_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_NO_FAVORITE_LINE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_NO_ADVISORY")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_SINGLE_ADVISORY")) & 1) != 0)
    {
      v9 = 3;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_MESSAGE_TYPE_MULTIPLE_ADVISORIES")))
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
    objc_msgSend(a1, "setTransitMessageType:", v9);
  }

  if (a3)
    v10 = CFSTR("transitIncidentItem");
  else
    v10 = CFSTR("transit_incident_item");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v5;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = [GEOTransitIncidentItem alloc];
            if ((a3 & 1) != 0)
              v19 = -[GEOTransitIncidentItem initWithJSON:](v18, "initWithJSON:", v17);
            else
              v19 = -[GEOTransitIncidentItem initWithDictionary:](v18, "initWithDictionary:", v17);
            v20 = (void *)v19;
            objc_msgSend(a1, "addTransitIncidentItem:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }

    v5 = v28;
  }

  if (a3)
    v21 = CFSTR("initiallyExpanded");
  else
    v21 = CFSTR("initially_expanded");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setInitiallyExpanded:", objc_msgSend(v22, "BOOLValue"));

  if (a3)
    v23 = CFSTR("everExpanded");
  else
    v23 = CFSTR("ever_expanded");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEverExpanded:", objc_msgSend(v24, "BOOLValue"));

  if (a3)
    v25 = CFSTR("tappedItemIndex");
  else
    v25 = CFSTR("tapped_item_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTappedItemIndex:", objc_msgSend(v26, "intValue"));

LABEL_55:
  return a1;
}

- (GEOMapsTransitWidget)initWithJSON:(id)a3
{
  return (GEOMapsTransitWidget *)-[GEOMapsTransitWidget _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsTransitWidgetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsTransitWidgetReadAllFrom(self, a3, 0);
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
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_transitIncidentItems;
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
  if ((flags & 8) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_12;
LABEL_16:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_16;
LABEL_12:
  if ((flags & 1) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field();
LABEL_14:

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
  -[GEOMapsTransitWidget readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v9[5] = self->_transitMessageType;
    *((_BYTE *)v9 + 28) |= 2u;
  }
  if (-[GEOMapsTransitWidget transitIncidentItemsCount](self, "transitIncidentItemsCount"))
  {
    objc_msgSend(v9, "clearTransitIncidentItems");
    v4 = -[GEOMapsTransitWidget transitIncidentItemsCount](self, "transitIncidentItemsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOMapsTransitWidget transitIncidentItemAtIndex:](self, "transitIncidentItemAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addTransitIncidentItem:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
LABEL_13:
    *((_BYTE *)v9 + 24) = self->_everExpanded;
    *((_BYTE *)v9 + 28) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_BYTE *)v9 + 25) = self->_initiallyExpanded;
  *((_BYTE *)v9 + 28) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((flags & 1) != 0)
  {
LABEL_10:
    v9[4] = self->_tappedItemIndex;
    *((_BYTE *)v9 + 28) |= 1u;
  }
LABEL_11:

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
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_transitMessageType;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_transitIncidentItems;
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
        objc_msgSend((id)v6, "addTransitIncidentItem:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_12;
LABEL_16:
    *(_BYTE *)(v6 + 24) = self->_everExpanded;
    *(_BYTE *)(v6 + 28) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      return (id)v6;
    goto LABEL_13;
  }
  *(_BYTE *)(v6 + 25) = self->_initiallyExpanded;
  *(_BYTE *)(v6 + 28) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_16;
LABEL_12:
  if ((flags & 1) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 16) = self->_tappedItemIndex;
    *(_BYTE *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *transitIncidentItems;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[GEOMapsTransitWidget readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 28);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_transitMessageType != *((_DWORD *)v4 + 5))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_30;
  }
  transitIncidentItems = self->_transitIncidentItems;
  if ((unint64_t)transitIncidentItems | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](transitIncidentItems, "isEqual:"))
      goto LABEL_30;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 28);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0)
      goto LABEL_30;
    if (self->_initiallyExpanded)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_30;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_everExpanded)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_30;
        goto LABEL_26;
      }
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_26;
    }
LABEL_30:
    v8 = 0;
    goto LABEL_31;
  }
  if ((v6 & 4) != 0)
    goto LABEL_30;
LABEL_26:
  v8 = (v6 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_tappedItemIndex != *((_DWORD *)v4 + 4))
      goto LABEL_30;
    v8 = 1;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOMapsTransitWidget readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_transitMessageType;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_transitIncidentItems, "hash");
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_7;
LABEL_10:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_initiallyExpanded;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_everExpanded;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v7 = 2654435761 * self->_tappedItemIndex;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    self->_transitMessageType = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
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
        -[GEOMapsTransitWidget addTransitIncidentItem:](self, "addTransitIncidentItem:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 28);
  if ((v10 & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_12;
LABEL_16:
    self->_everExpanded = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_flags |= 4u;
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  self->_initiallyExpanded = *((_BYTE *)v4 + 25);
  *(_BYTE *)&self->_flags |= 8u;
  v10 = *((_BYTE *)v4 + 28);
  if ((v10 & 4) != 0)
    goto LABEL_16;
LABEL_12:
  if ((v10 & 1) != 0)
  {
LABEL_13:
    self->_tappedItemIndex = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_14:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidentItems, 0);
}

@end
