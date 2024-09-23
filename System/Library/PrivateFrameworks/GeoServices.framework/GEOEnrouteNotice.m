@implementation GEOEnrouteNotice

- (GEOEnrouteNotice)init
{
  GEOEnrouteNotice *v2;
  GEOEnrouteNotice *v3;
  GEOEnrouteNotice *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOEnrouteNotice;
  v2 = -[GEOEnrouteNotice init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOEnrouteNotice)initWithData:(id)a3
{
  GEOEnrouteNotice *v3;
  GEOEnrouteNotice *v4;
  GEOEnrouteNotice *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOEnrouteNotice;
  v3 = -[GEOEnrouteNotice initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2080;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C080E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAMERA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIGNAL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOTATION")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readObjectIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOEnrouteNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readObjectIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasObjectIdentifier
{
  -[GEOEnrouteNotice _readObjectIdentifier]((uint64_t)self);
  return self->_objectIdentifier != 0;
}

- (NSString)objectIdentifier
{
  -[GEOEnrouteNotice _readObjectIdentifier]((uint64_t)self);
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_objectIdentifier, a3);
}

- (void)_readGuidances
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOEnrouteNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidances_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)guidances
{
  -[GEOEnrouteNotice _readGuidances]((uint64_t)self);
  return self->_guidances;
}

- (void)setGuidances:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *guidances;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  guidances = self->_guidances;
  self->_guidances = v4;

}

- (void)clearGuidances
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_guidances, "removeAllObjects");
}

- (void)addGuidance:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOEnrouteNotice _readGuidances]((uint64_t)self);
  -[GEOEnrouteNotice _addNoFlagsGuidance:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsGuidance:(uint64_t)a1
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

- (unint64_t)guidancesCount
{
  -[GEOEnrouteNotice _readGuidances]((uint64_t)self);
  return -[NSMutableArray count](self->_guidances, "count");
}

- (id)guidanceAtIndex:(unint64_t)a3
{
  -[GEOEnrouteNotice _readGuidances]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_guidances, "objectAtIndex:", a3);
}

+ (Class)guidanceType
{
  return (Class)objc_opt_class();
}

- (unsigned)highlightDistance
{
  return self->_highlightDistance;
}

- (void)setHighlightDistance:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_highlightDistance = a3;
}

- (void)setHasHighlightDistance:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasHighlightDistance
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)objectGroupId
{
  return self->_objectGroupId;
}

- (void)setObjectGroupId:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_objectGroupId = a3;
}

- (void)setHasObjectGroupId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasObjectGroupId
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2064;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readRouteAnnotation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOEnrouteNoticeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteAnnotation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRouteAnnotation
{
  -[GEOEnrouteNotice _readRouteAnnotation]((uint64_t)self);
  return self->_routeAnnotation != 0;
}

- (GEORouteAnnotation)routeAnnotation
{
  -[GEOEnrouteNotice _readRouteAnnotation]((uint64_t)self);
  return self->_routeAnnotation;
}

- (void)setRouteAnnotation:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_routeAnnotation, a3);
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2112;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasZilchPathIndex
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (unsigned)groupItemHorizontalDisplayOrder
{
  return self->_groupItemHorizontalDisplayOrder;
}

- (void)setGroupItemHorizontalDisplayOrder:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_groupItemHorizontalDisplayOrder = a3;
}

- (void)setHasGroupItemHorizontalDisplayOrder:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasGroupItemHorizontalDisplayOrder
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)groupItemVerticalDisplayOrder
{
  return self->_groupItemVerticalDisplayOrder;
}

- (void)setGroupItemVerticalDisplayOrder:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_groupItemVerticalDisplayOrder = a3;
}

- (void)setHasGroupItemVerticalDisplayOrder:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasGroupItemVerticalDisplayOrder
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOEnrouteNotice;
  -[GEOEnrouteNotice description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOEnrouteNotice dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEnrouteNotice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 0x20) != 0)
  {
    v5 = *(int *)(a1 + 80);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 80));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C080E0[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  }
  objc_msgSend((id)a1, "objectIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("objectIdentifier");
    else
      v8 = CFSTR("object_identifier");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v10 = *(id *)(a1 + 24);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("guidance"));
  }
  v17 = *(_WORD *)(a1 + 88);
  if ((v17 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("highlightDistance");
    else
      v24 = CFSTR("highlight_distance");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v17 = *(_WORD *)(a1 + 88);
    if ((v17 & 8) == 0)
    {
LABEL_26:
      if ((v17 & 0x10) == 0)
        goto LABEL_28;
      goto LABEL_27;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("objectGroupId");
  else
    v26 = CFSTR("object_group_id");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  if ((*(_WORD *)(a1 + 88) & 0x10) != 0)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("priority"));

  }
LABEL_28:
  objc_msgSend((id)a1, "routeAnnotation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("routeAnnotation");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("route_annotation");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v27 = *(_WORD *)(a1 + 88);
  if ((v27 & 0x40) == 0)
  {
    if ((v27 & 1) == 0)
      goto LABEL_44;
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("groupItemHorizontalDisplayOrder");
    else
      v40 = CFSTR("group_item_horizontal_display_order");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

    if ((*(_WORD *)(a1 + 88) & 2) == 0)
      goto LABEL_49;
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v38 = CFSTR("zilchPathIndex");
  else
    v38 = CFSTR("zilch_path_index");
  objc_msgSend(v4, "setObject:forKey:", v37, v38);

  v27 = *(_WORD *)(a1 + 88);
  if ((v27 & 1) != 0)
    goto LABEL_58;
LABEL_44:
  if ((v27 & 2) != 0)
  {
LABEL_45:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("groupItemVerticalDisplayOrder");
    else
      v29 = CFSTR("group_item_vertical_display_order");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
LABEL_49:
  v30 = *(void **)(a1 + 16);
  if (v30)
  {
    objc_msgSend(v30, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __46__GEOEnrouteNotice__dictionaryRepresentation___block_invoke;
      v41[3] = &unk_1E1C00600;
      v34 = v33;
      v42 = v34;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v41);
      v35 = v34;

      v32 = v35;
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOEnrouteNotice _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOEnrouteNotice__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOEnrouteNotice)initWithDictionary:(id)a3
{
  return (GEOEnrouteNotice *)-[GEOEnrouteNotice _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  GEOGuidanceEvent *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEORouteAnnotation *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_72;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_72;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CAMERA")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SIGNAL")) & 1) != 0)
    {
      v8 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ANNOTATION")))
    {
      v8 = 3;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_16:
    objc_msgSend(a1, "setType:", v8);
  }

  if (a3)
    v9 = CFSTR("objectIdentifier");
  else
    v9 = CFSTR("object_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setObjectIdentifier:", v11);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("guidance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = v5;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = [GEOGuidanceEvent alloc];
            if ((a3 & 1) != 0)
              v20 = -[GEOGuidanceEvent initWithJSON:](v19, "initWithJSON:", v18);
            else
              v20 = -[GEOGuidanceEvent initWithDictionary:](v19, "initWithDictionary:", v18);
            v21 = (void *)v20;
            objc_msgSend(a1, "addGuidance:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v15);
    }

    v5 = v39;
  }

  if (a3)
    v22 = CFSTR("highlightDistance");
  else
    v22 = CFSTR("highlight_distance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHighlightDistance:", objc_msgSend(v23, "unsignedIntValue"));

  if (a3)
    v24 = CFSTR("objectGroupId");
  else
    v24 = CFSTR("object_group_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setObjectGroupId:", objc_msgSend(v25, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priority"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPriority:", objc_msgSend(v26, "unsignedIntValue"));

  if (a3)
    v27 = CFSTR("routeAnnotation");
  else
    v27 = CFSTR("route_annotation");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEORouteAnnotation alloc];
    if ((a3 & 1) != 0)
      v30 = -[GEORouteAnnotation initWithJSON:](v29, "initWithJSON:", v28);
    else
      v30 = -[GEORouteAnnotation initWithDictionary:](v29, "initWithDictionary:", v28);
    v31 = (void *)v30;
    objc_msgSend(a1, "setRouteAnnotation:", v30);

  }
  if (a3)
    v32 = CFSTR("zilchPathIndex");
  else
    v32 = CFSTR("zilch_path_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v33, "unsignedIntValue"));

  if (a3)
    v34 = CFSTR("groupItemHorizontalDisplayOrder");
  else
    v34 = CFSTR("group_item_horizontal_display_order");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setGroupItemHorizontalDisplayOrder:", objc_msgSend(v35, "unsignedIntValue"));

  if (a3)
    v36 = CFSTR("groupItemVerticalDisplayOrder");
  else
    v36 = CFSTR("group_item_vertical_display_order");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setGroupItemVerticalDisplayOrder:", objc_msgSend(v37, "unsignedIntValue"));

LABEL_72:
  return a1;
}

- (GEOEnrouteNotice)initWithJSON:(id)a3
{
  return (GEOEnrouteNotice *)-[GEOEnrouteNotice _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1808;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1809;
    GEOEnrouteNoticeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOEnrouteNoticeCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEnrouteNoticeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEnrouteNoticeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 flags;
  __int16 v11;
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
  if (self->_reader && (_GEOEnrouteNoticeIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOEnrouteNotice readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_objectIdentifier)
      PBDataWriterWriteStringField();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_guidances;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_routeAnnotation)
      PBDataWriterWriteSubmessage();
    v11 = (__int16)self->_flags;
    if ((v11 & 0x40) != 0)
    {
      PBDataWriterWriteUint32Field();
      v11 = (__int16)self->_flags;
    }
    if ((v11 & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v11 = (__int16)self->_flags;
    }
    if ((v11 & 2) != 0)
      PBDataWriterWriteUint32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 flags;
  id *v9;
  __int16 v10;
  id *v11;

  v11 = (id *)a3;
  -[GEOEnrouteNotice readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 12) = self->_readerMarkPos;
  *((_DWORD *)v11 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v11 + 20) = self->_type;
    *((_WORD *)v11 + 44) |= 0x20u;
  }
  if (self->_objectIdentifier)
    objc_msgSend(v11, "setObjectIdentifier:");
  if (-[GEOEnrouteNotice guidancesCount](self, "guidancesCount"))
  {
    objc_msgSend(v11, "clearGuidances");
    v4 = -[GEOEnrouteNotice guidancesCount](self, "guidancesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOEnrouteNotice guidanceAtIndex:](self, "guidanceAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addGuidance:", v7);

      }
    }
  }
  flags = (__int16)self->_flags;
  v9 = v11;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v11 + 17) = self->_highlightDistance;
    *((_WORD *)v11 + 44) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_11:
      if ((flags & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v11 + 18) = self->_objectGroupId;
  *((_WORD *)v11 + 44) |= 8u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v11 + 19) = self->_priority;
    *((_WORD *)v11 + 44) |= 0x10u;
  }
LABEL_13:
  if (self->_routeAnnotation)
  {
    objc_msgSend(v11, "setRouteAnnotation:");
    v9 = v11;
  }
  v10 = (__int16)self->_flags;
  if ((v10 & 0x40) == 0)
  {
    if ((v10 & 1) == 0)
      goto LABEL_17;
LABEL_24:
    *((_DWORD *)v9 + 15) = self->_groupItemHorizontalDisplayOrder;
    *((_WORD *)v9 + 44) |= 1u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  *((_DWORD *)v9 + 21) = self->_zilchPathIndex;
  *((_WORD *)v9 + 44) |= 0x40u;
  v10 = (__int16)self->_flags;
  if ((v10 & 1) != 0)
    goto LABEL_24;
LABEL_17:
  if ((v10 & 2) != 0)
  {
LABEL_18:
    *((_DWORD *)v9 + 16) = self->_groupItemVerticalDisplayOrder;
    *((_WORD *)v9 + 44) |= 2u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int16 flags;
  id v17;
  void *v18;
  __int16 v19;
  PBUnknownFields *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOEnrouteNotice readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 0x20) != 0)
    {
      *(_DWORD *)(v5 + 80) = self->_type;
      *(_WORD *)(v5 + 88) |= 0x20u;
    }
    v9 = -[NSString copyWithZone:](self->_objectIdentifier, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v9;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = self->_guidances;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
          objc_msgSend((id)v5, "addGuidance:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_highlightDistance;
      *(_WORD *)(v5 + 88) |= 4u;
      flags = (__int16)self->_flags;
      if ((flags & 8) == 0)
      {
LABEL_16:
        if ((flags & 0x10) == 0)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    else if ((flags & 8) == 0)
    {
      goto LABEL_16;
    }
    *(_DWORD *)(v5 + 72) = self->_objectGroupId;
    *(_WORD *)(v5 + 88) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
    {
LABEL_18:
      v17 = -[GEORouteAnnotation copyWithZone:](self->_routeAnnotation, "copyWithZone:", a3, (_QWORD)v22);
      v18 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v17;

      v19 = (__int16)self->_flags;
      if ((v19 & 0x40) != 0)
      {
        *(_DWORD *)(v5 + 84) = self->_zilchPathIndex;
        *(_WORD *)(v5 + 88) |= 0x40u;
        v19 = (__int16)self->_flags;
        if ((v19 & 1) == 0)
        {
LABEL_20:
          if ((v19 & 2) == 0)
          {
LABEL_22:
            v20 = self->_unknownFields;
            v8 = *(id *)(v5 + 16);
            *(_QWORD *)(v5 + 16) = v20;
            goto LABEL_23;
          }
LABEL_21:
          *(_DWORD *)(v5 + 64) = self->_groupItemVerticalDisplayOrder;
          *(_WORD *)(v5 + 88) |= 2u;
          goto LABEL_22;
        }
      }
      else if ((v19 & 1) == 0)
      {
        goto LABEL_20;
      }
      *(_DWORD *)(v5 + 60) = self->_groupItemHorizontalDisplayOrder;
      *(_WORD *)(v5 + 88) |= 1u;
      if ((*(_WORD *)&self->_flags & 2) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
LABEL_17:
    *(_DWORD *)(v5 + 76) = self->_priority;
    *(_WORD *)(v5 + 88) |= 0x10u;
    goto LABEL_18;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOEnrouteNoticeReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_23:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *objectIdentifier;
  NSMutableArray *guidances;
  __int16 flags;
  __int16 v9;
  GEORouteAnnotation *routeAnnotation;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  -[GEOEnrouteNotice readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
    if ((v5 & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 20))
      goto LABEL_43;
  }
  else if ((v5 & 0x20) != 0)
  {
    goto LABEL_43;
  }
  objectIdentifier = self->_objectIdentifier;
  if ((unint64_t)objectIdentifier | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](objectIdentifier, "isEqual:"))
  {
    goto LABEL_43;
  }
  guidances = self->_guidances;
  if ((unint64_t)guidances | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](guidances, "isEqual:"))
      goto LABEL_43;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 44);
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_highlightDistance != *((_DWORD *)v4 + 17))
      goto LABEL_43;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_objectGroupId != *((_DWORD *)v4 + 18))
      goto LABEL_43;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_43;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_priority != *((_DWORD *)v4 + 19))
      goto LABEL_43;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_43;
  }
  routeAnnotation = self->_routeAnnotation;
  if ((unint64_t)routeAnnotation | *((_QWORD *)v4 + 5))
  {
    if (!-[GEORouteAnnotation isEqual:](routeAnnotation, "isEqual:"))
    {
LABEL_43:
      v11 = 0;
      goto LABEL_44;
    }
    flags = (__int16)self->_flags;
    v9 = *((_WORD *)v4 + 44);
  }
  if ((flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 21))
      goto LABEL_43;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_43;
  }
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_groupItemHorizontalDisplayOrder != *((_DWORD *)v4 + 15))
      goto LABEL_43;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_43;
  }
  v11 = (v9 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_groupItemVerticalDisplayOrder != *((_DWORD *)v4 + 16))
      goto LABEL_43;
    v11 = 1;
  }
LABEL_44:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[GEOEnrouteNotice readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_objectIdentifier, "hash");
  v5 = -[NSMutableArray hash](self->_guidances, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
    v7 = 0;
    if ((flags & 8) != 0)
      goto LABEL_6;
LABEL_9:
    v8 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v7 = 2654435761 * self->_highlightDistance;
  if ((flags & 8) == 0)
    goto LABEL_9;
LABEL_6:
  v8 = 2654435761 * self->_objectGroupId;
  if ((flags & 0x10) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_priority;
    goto LABEL_11;
  }
LABEL_10:
  v9 = 0;
LABEL_11:
  v10 = -[GEORouteAnnotation hash](self->_routeAnnotation, "hash");
  v11 = (__int16)self->_flags;
  if ((v11 & 0x40) == 0)
  {
    v12 = 0;
    if ((v11 & 1) != 0)
      goto LABEL_13;
LABEL_16:
    v13 = 0;
    if ((v11 & 2) != 0)
      goto LABEL_14;
LABEL_17:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
  }
  v12 = 2654435761 * self->_zilchPathIndex;
  if ((v11 & 1) == 0)
    goto LABEL_16;
LABEL_13:
  v13 = 2654435761 * self->_groupItemHorizontalDisplayOrder;
  if ((v11 & 2) == 0)
    goto LABEL_17;
LABEL_14:
  v14 = 2654435761 * self->_groupItemVerticalDisplayOrder;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  GEORouteAnnotation *routeAnnotation;
  uint64_t v12;
  __int16 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 44) & 0x20) != 0)
  {
    self->_type = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 0x20u;
  }
  if (*((_QWORD *)v4 + 4))
    -[GEOEnrouteNotice setObjectIdentifier:](self, "setObjectIdentifier:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *((id *)v4 + 3);
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
        -[GEOEnrouteNotice addGuidance:](self, "addGuidance:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 44);
  if ((v10 & 4) != 0)
  {
    self->_highlightDistance = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_flags |= 4u;
    v10 = *((_WORD *)v4 + 44);
    if ((v10 & 8) == 0)
    {
LABEL_14:
      if ((v10 & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_objectGroupId = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_flags |= 8u;
  if ((*((_WORD *)v4 + 44) & 0x10) != 0)
  {
LABEL_15:
    self->_priority = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_16:
  routeAnnotation = self->_routeAnnotation;
  v12 = *((_QWORD *)v4 + 5);
  if (routeAnnotation)
  {
    if (v12)
      -[GEORouteAnnotation mergeFrom:](routeAnnotation, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOEnrouteNotice setRouteAnnotation:](self, "setRouteAnnotation:");
  }
  v13 = *((_WORD *)v4 + 44);
  if ((v13 & 0x40) == 0)
  {
    if ((v13 & 1) == 0)
      goto LABEL_26;
LABEL_30:
    self->_groupItemHorizontalDisplayOrder = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 1u;
    if ((*((_WORD *)v4 + 44) & 2) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
  self->_zilchPathIndex = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_flags |= 0x40u;
  v13 = *((_WORD *)v4 + 44);
  if ((v13 & 1) != 0)
    goto LABEL_30;
LABEL_26:
  if ((v13 & 2) != 0)
  {
LABEL_27:
    self->_groupItemVerticalDisplayOrder = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_28:

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOEnrouteNoticeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1812);
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
  *(_WORD *)&self->_flags |= 0x880u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOEnrouteNotice readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_guidances;
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

    -[GEORouteAnnotation clearUnknownFields:](self->_routeAnnotation, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeAnnotation, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_guidances, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
