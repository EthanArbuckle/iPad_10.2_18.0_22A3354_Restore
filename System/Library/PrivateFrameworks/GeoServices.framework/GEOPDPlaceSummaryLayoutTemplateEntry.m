@implementation GEOPDPlaceSummaryLayoutTemplateEntry

- (GEOPDPlaceSummaryLayoutTemplateEntry)init
{
  GEOPDPlaceSummaryLayoutTemplateEntry *v2;
  GEOPDPlaceSummaryLayoutTemplateEntry *v3;
  GEOPDPlaceSummaryLayoutTemplateEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutTemplateEntry;
  v2 = -[GEOPDPlaceSummaryLayoutTemplateEntry init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithData:(id)a3
{
  GEOPDPlaceSummaryLayoutTemplateEntry *v3;
  GEOPDPlaceSummaryLayoutTemplateEntry *v4;
  GEOPDPlaceSummaryLayoutTemplateEntry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutTemplateEntry;
  v3 = -[GEOPDPlaceSummaryLayoutTemplateEntry initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPlaceSummaryLayoutTemplateEntry;
  -[GEOPDPlaceSummaryLayoutTemplateEntry dealloc](&v3, sel_dealloc);
}

- (int)platformType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_platformType;
  else
    return 0;
}

- (void)setPlatformType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_platformType = a3;
}

- (void)setHasPlatformType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasPlatformType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)platformTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0E320[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlatformType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLATFORM_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLATFORM_TYPE_IOS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLATFORM_TYPE_MACOS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLATFORM_TYPE_ANY")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLines
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutTemplateEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLines_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)lines
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  return self->_lines;
}

- (void)setLines:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *lines;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  lines = self->_lines;
  self->_lines = v4;

}

- (void)clearLines
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_lines, "removeAllObjects");
}

- (void)addLine:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutTemplateEntry _addNoFlagsLine:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLine:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)linesCount
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  return -[NSMutableArray count](self->_lines, "count");
}

- (id)lineAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_lines, "objectAtIndex:", a3);
}

+ (Class)lineType
{
  return (Class)objc_opt_class();
}

- (int)trailingEntityType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_trailingEntityType;
  else
    return 0;
}

- (void)setTrailingEntityType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_trailingEntityType = a3;
}

- (void)setHasTrailingEntityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTrailingEntityType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)trailingEntityTypeAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E1C0E340[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrailingEntityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readTrailingEntityTypeOrders
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutTemplateEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrailingEntityTypeOrders_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (unint64_t)trailingEntityTypeOrdersCount
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readTrailingEntityTypeOrders]((uint64_t)self);
  return self->_trailingEntityTypeOrders.count;
}

- (int)trailingEntityTypeOrders
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readTrailingEntityTypeOrders]((uint64_t)self);
  return self->_trailingEntityTypeOrders.list;
}

- (void)clearTrailingEntityTypeOrders
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Clear();
}

- (void)addTrailingEntityTypeOrder:(int)a3
{
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readTrailingEntityTypeOrders]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (int)trailingEntityTypeOrderAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_trailingEntityTypeOrders;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDPlaceSummaryLayoutTemplateEntry _readTrailingEntityTypeOrders]((uint64_t)self);
  p_trailingEntityTypeOrders = &self->_trailingEntityTypeOrders;
  count = self->_trailingEntityTypeOrders.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_trailingEntityTypeOrders->list[a3];
}

- (void)setTrailingEntityTypeOrders:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Set();
}

- (id)trailingEntityTypeOrdersAsString:(int)a3
{
  if (a3 < 0xC)
    return off_1E1C0E340[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrailingEntityTypeOrders:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT")))
  {
    v4 = 11;
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutTemplateEntry;
  -[GEOPDPlaceSummaryLayoutTemplateEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryLayoutTemplateEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutTemplateEntry _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  __CFString *v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    v5 = *(int *)(a1 + 60);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0E320[v5];
    }
    if (a2)
      v7 = CFSTR("platformType");
    else
      v7 = CFSTR("platform_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("line"));
  }
  if ((*(_BYTE *)(a1 + 68) & 2) != 0)
  {
    v16 = *(int *)(a1 + 64);
    if (v16 >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E1C0E340[v16];
    }
    if (a2)
      v18 = CFSTR("trailingEntityType");
    else
      v18 = CFSTR("trailing_entity_type");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v21 = 0;
      do
      {
        v22 = *(int *)(*v20 + 4 * v21);
        if (v22 >= 0xC)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = off_1E1C0E340[v22];
        }
        objc_msgSend(v19, "addObject:", v23);

        ++v21;
        v20 = (_QWORD *)(a1 + 16);
      }
      while (v21 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v24 = CFSTR("trailingEntityTypeOrder");
    else
      v24 = CFSTR("trailing_entity_type_order");
    objc_msgSend(v4, "setObject:forKey:", v19, v24);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryLayoutTemplateEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutTemplateEntry *)-[GEOPDPlaceSummaryLayoutTemplateEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOPDPlaceSummaryLayoutLine *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  uint64_t v34;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_110;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("platformType");
    else
      v7 = CFSTR("platform_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PLATFORM_TYPE_UNKNOWN")) & 1) != 0)
      {
        v10 = 0;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PLATFORM_TYPE_IOS")) & 1) != 0)
      {
        v10 = 1;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PLATFORM_TYPE_MACOS")) & 1) != 0)
      {
        v10 = 2;
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("PLATFORM_TYPE_ANY")))
      {
        v10 = 3;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_20;
      v10 = objc_msgSend(v8, "intValue");
    }
    objc_msgSend(v6, "setPlatformType:", v10);
LABEL_20:

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("line"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v36 = v11;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v44 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = [GEOPDPlaceSummaryLayoutLine alloc];
              if ((a3 & 1) != 0)
                v19 = -[GEOPDPlaceSummaryLayoutLine initWithJSON:](v18, "initWithJSON:", v17);
              else
                v19 = -[GEOPDPlaceSummaryLayoutLine initWithDictionary:](v18, "initWithDictionary:", v17);
              v20 = (void *)v19;
              objc_msgSend(v6, "addLine:", v19, v36);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        }
        while (v14);
      }

      v11 = v36;
      v5 = v38;
    }

    if (a3)
      v21 = CFSTR("trailingEntityType");
    else
      v21 = CFSTR("trailing_entity_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v21, v36);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
      if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN")) & 1) != 0)
      {
        v24 = 0;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL")) & 1) != 0)
      {
        v24 = 1;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS")) & 1) != 0)
      {
        v24 = 2;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER")) & 1) != 0)
      {
        v24 = 3;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND")) & 1) != 0)
      {
        v24 = 4;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL")) & 1) != 0)
      {
        v24 = 5;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE")) & 1) != 0)
      {
        v24 = 6;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP")) & 1) != 0)
      {
        v24 = 7;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR")) & 1) != 0)
      {
        v24 = 8;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA")) & 1) != 0)
      {
        v24 = 9;
      }
      else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP")) & 1) != 0)
      {
        v24 = 10;
      }
      else if (objc_msgSend(v23, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT")))
      {
        v24 = 11;
      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_67:

        if (a3)
          v25 = CFSTR("trailingEntityTypeOrder");
        else
          v25 = CFSTR("trailing_entity_type_order");
        objc_msgSend(v5, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = v26;
          v27 = v26;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (!v28)
            goto LABEL_108;
          v29 = v28;
          v30 = *(_QWORD *)v40;
          while (1)
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v40 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = v32;
                if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v34 = 0;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_THUMBNAIL")) & 1) != 0)
                {
                  v34 = 1;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS")) & 1) != 0)
                {
                  v34 = 2;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_FLYOVER")) & 1) != 0)
                {
                  v34 = 3;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_LOOK_AROUND")) & 1) != 0)
                {
                  v34 = 4;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_CALL")) & 1) != 0)
                {
                  v34 = 5;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_WEBSITE")) & 1) != 0)
                {
                  v34 = 6;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_APP_CLIP")) & 1) != 0)
                {
                  v34 = 7;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_QUERY_ACCELERATOR")) & 1) != 0)
                {
                  v34 = 8;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_DIRECTIONS_NO_ETA")) & 1) != 0)
                {
                  v34 = 9;
                }
                else if ((objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_ADD_STOP")) & 1) != 0)
                {
                  v34 = 10;
                }
                else if (objc_msgSend(v33, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT_TRAILING_ENTITY_TYPE_HIKE_ROUTE_SNAPSHOT")))
                {
                  v34 = 11;
                }
                else
                {
                  v34 = 0;
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                v34 = objc_msgSend(v32, "intValue");
              }
              objc_msgSend(v6, "addTrailingEntityTypeOrder:", v34, v37);
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            if (!v29)
            {
LABEL_108:

              v26 = v37;
              v5 = v38;
              break;
            }
          }
        }

        goto LABEL_110;
      }
      v24 = objc_msgSend(v22, "intValue");
    }
    objc_msgSend(v6, "setTrailingEntityType:", v24);
    goto LABEL_67;
  }
LABEL_110:

  return v6;
}

- (GEOPDPlaceSummaryLayoutTemplateEntry)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutTemplateEntry *)-[GEOPDPlaceSummaryLayoutTemplateEntry _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_283;
    else
      v8 = (int *)&readAll__nonRecursiveTag_284;
    GEOPDPlaceSummaryLayoutTemplateEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPlaceSummaryLayoutTemplateEntryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutTemplateEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutTemplateEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_trailingEntityTypeOrders;
  unint64_t v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceSummaryLayoutTemplateEntry readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_lines;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    p_trailingEntityTypeOrders = &self->_trailingEntityTypeOrders;
    if (p_trailingEntityTypeOrders->count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < p_trailingEntityTypeOrders->count);
    }
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOPDPlaceSummaryLayoutTemplateEntry _readLines]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_lines;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  id *v11;

  v11 = (id *)a3;
  -[GEOPDPlaceSummaryLayoutTemplateEntry readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 12) = self->_readerMarkPos;
  *((_DWORD *)v11 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v11 + 15) = self->_platformType;
    *((_BYTE *)v11 + 68) |= 1u;
  }
  if (-[GEOPDPlaceSummaryLayoutTemplateEntry linesCount](self, "linesCount"))
  {
    objc_msgSend(v11, "clearLines");
    v4 = -[GEOPDPlaceSummaryLayoutTemplateEntry linesCount](self, "linesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPDPlaceSummaryLayoutTemplateEntry lineAtIndex:](self, "lineAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addLine:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v11 + 16) = self->_trailingEntityType;
    *((_BYTE *)v11 + 68) |= 2u;
  }
  if (-[GEOPDPlaceSummaryLayoutTemplateEntry trailingEntityTypeOrdersCount](self, "trailingEntityTypeOrdersCount"))
  {
    objc_msgSend(v11, "clearTrailingEntityTypeOrders");
    v8 = -[GEOPDPlaceSummaryLayoutTemplateEntry trailingEntityTypeOrdersCount](self, "trailingEntityTypeOrdersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v11, "addTrailingEntityTypeOrder:", -[GEOPDPlaceSummaryLayoutTemplateEntry trailingEntityTypeOrderAtIndex:](self, "trailingEntityTypeOrderAtIndex:", j));
    }
  }

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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
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
      GEOPDPlaceSummaryLayoutTemplateEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceSummaryLayoutTemplateEntry readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_platformType;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_lines;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addLine:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_trailingEntityType;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *lines;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDPlaceSummaryLayoutTemplateEntry readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 68);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_platformType != *((_DWORD *)v4 + 15))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_16;
  }
  lines = self->_lines;
  if ((unint64_t)lines | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](lines, "isEqual:"))
    {
LABEL_16:
      IsEqual = 0;
      goto LABEL_17;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_trailingEntityType != *((_DWORD *)v4 + 16))
      goto LABEL_16;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_16;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_17:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOPDPlaceSummaryLayoutTemplateEntry readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_platformType;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_lines, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_trailingEntityType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_platformType = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDPlaceSummaryLayoutTemplateEntry addLine:](self, "addLine:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_trailingEntityType = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v10 = objc_msgSend(v4, "trailingEntityTypeOrdersCount", (_QWORD)v13);
  if (v10)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
      -[GEOPDPlaceSummaryLayoutTemplateEntry addTrailingEntityTypeOrder:](self, "addTrailingEntityTypeOrder:", objc_msgSend(v4, "trailingEntityTypeOrderAtIndex:", j));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
