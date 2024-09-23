@implementation GEOPDAutocompleteEntryQuery

- (GEOPDAutocompleteEntryQuery)init
{
  GEOPDAutocompleteEntryQuery *v2;
  GEOPDAutocompleteEntryQuery *v3;
  GEOPDAutocompleteEntryQuery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteEntryQuery;
  v2 = -[GEOPDAutocompleteEntryQuery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteEntryQuery)initWithData:(id)a3
{
  GEOPDAutocompleteEntryQuery *v3;
  GEOPDAutocompleteEntryQuery *v4;
  GEOPDAutocompleteEntryQuery *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteEntryQuery;
  v3 = -[GEOPDAutocompleteEntryQuery initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCompletion
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
        GEOPDAutocompleteEntryQueryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCompletion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCompletion
{
  -[GEOPDAutocompleteEntryQuery _readCompletion]((uint64_t)self);
  return self->_completion != 0;
}

- (NSString)completion
{
  -[GEOPDAutocompleteEntryQuery _readCompletion]((uint64_t)self);
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_completion, a3);
}

- (int)tapBehavior
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_tapBehavior;
  else
    return 0;
}

- (void)setTapBehavior:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_tapBehavior = a3;
}

- (void)setHasTapBehavior:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasTapBehavior
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)tapBehaviorAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SHOW_RESULTS_ON_MAP");
  if (a3 == 1)
  {
    v3 = CFSTR("SHOW_RESULTS_IN_LIST_VIEW");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsTapBehavior:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_RESULTS_ON_MAP")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SHOW_RESULTS_IN_LIST_VIEW"));

  return v4;
}

- (BOOL)showIntermediateStateTapBehaviorListView
{
  return self->_showIntermediateStateTapBehaviorListView;
}

- (void)setShowIntermediateStateTapBehaviorListView:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_showIntermediateStateTapBehaviorListView = a3;
}

- (void)setHasShowIntermediateStateTapBehaviorListView:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasShowIntermediateStateTapBehaviorListView
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readResultRefinements
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
        GEOPDAutocompleteEntryQueryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultRefinements_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)resultRefinements
{
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  return self->_resultRefinements;
}

- (void)setResultRefinements:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *resultRefinements;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  resultRefinements = self->_resultRefinements;
  self->_resultRefinements = v4;

}

- (void)clearResultRefinements
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_resultRefinements, "removeAllObjects");
}

- (void)addResultRefinement:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  -[GEOPDAutocompleteEntryQuery _addNoFlagsResultRefinement:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsResultRefinement:(uint64_t)a1
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

- (unint64_t)resultRefinementsCount
{
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  return -[NSMutableArray count](self->_resultRefinements, "count");
}

- (id)resultRefinementAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_resultRefinements, "objectAtIndex:", a3);
}

+ (Class)resultRefinementType
{
  return (Class)objc_opt_class();
}

- (void)_readStyleAttributes
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
        GEOPDAutocompleteEntryQueryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStyleAttributes_tags_660);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasStyleAttributes
{
  -[GEOPDAutocompleteEntryQuery _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes != 0;
}

- (GEOStyleAttributes)styleAttributes
{
  -[GEOPDAutocompleteEntryQuery _readStyleAttributes]((uint64_t)self);
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (BOOL)queryHasAttributeIntentsInRefinements
{
  return self->_queryHasAttributeIntentsInRefinements;
}

- (void)setQueryHasAttributeIntentsInRefinements:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_queryHasAttributeIntentsInRefinements = a3;
}

- (void)setHasQueryHasAttributeIntentsInRefinements:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasQueryHasAttributeIntentsInRefinements
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
  v8.super_class = (Class)GEOPDAutocompleteEntryQuery;
  -[GEOPDAutocompleteEntryQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteEntryQuery dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteEntryQuery _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("completion"));

  v6 = *(_BYTE *)(a1 + 68);
  if ((v6 & 1) != 0)
  {
    v7 = *(_DWORD *)(a1 + 60);
    if (v7)
    {
      if (v7 == 1)
      {
        v8 = CFSTR("SHOW_RESULTS_IN_LIST_VIEW");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("SHOW_RESULTS_ON_MAP");
    }
    if (a2)
      v9 = CFSTR("tapBehavior");
    else
      v9 = CFSTR("tap_behavior");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v6 = *(_BYTE *)(a1 + 68);
  }
  if ((v6 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("showIntermediateStateTapBehaviorListView");
    else
      v11 = CFSTR("show_intermediate_state_tap_behavior_list_view");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v13 = *(id *)(a1 + 32);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("resultRefinement");
    else
      v20 = CFSTR("result_refinement");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  objc_msgSend((id)a1, "styleAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("styleAttributes");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("style_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  if ((*(_BYTE *)(a1 + 68) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("queryHasAttributeIntentsInRefinements");
    else
      v26 = CFSTR("query_has_attribute_intents_in_refinements");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __57__GEOPDAutocompleteEntryQuery__dictionaryRepresentation___block_invoke;
      v34[3] = &unk_1E1C00600;
      v31 = v30;
      v35 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteEntryQuery _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOPDAutocompleteEntryQuery__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteEntryQuery)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteEntryQuery *)-[GEOPDAutocompleteEntryQuery _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  GEOPDResultRefinement *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  GEOStyleAttributes *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_53;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_53;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("completion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(a1, "setCompletion:", v7);

  }
  if (a3)
    v8 = CFSTR("tapBehavior");
  else
    v8 = CFSTR("tap_behavior");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SHOW_RESULTS_ON_MAP")) & 1) != 0)
      v11 = 0;
    else
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("SHOW_RESULTS_IN_LIST_VIEW"));

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v9, "intValue");
LABEL_15:
    objc_msgSend(a1, "setTapBehavior:", v11);
  }

  if (a3)
    v12 = CFSTR("showIntermediateStateTapBehaviorListView");
  else
    v12 = CFSTR("show_intermediate_state_tap_behavior_list_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShowIntermediateStateTapBehaviorListView:", objc_msgSend(v13, "BOOLValue"));

  if (a3)
    v14 = CFSTR("resultRefinement");
  else
    v14 = CFSTR("result_refinement");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v5;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = [GEOPDResultRefinement alloc];
            if (v22)
              v23 = (void *)-[GEOPDResultRefinement _initWithDictionary:isJSON:](v22, v21, a3);
            else
              v23 = 0;
            objc_msgSend(a1, "addResultRefinement:", v23);

          }
          ++v20;
        }
        while (v18 != v20);
        v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v18 = v24;
      }
      while (v24);
    }

    v5 = v33;
  }

  if (a3)
    v25 = CFSTR("styleAttributes");
  else
    v25 = CFSTR("style_attributes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEOStyleAttributes alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEOStyleAttributes initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEOStyleAttributes initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setStyleAttributes:", v28);

  }
  if (a3)
    v30 = CFSTR("queryHasAttributeIntentsInRefinements");
  else
    v30 = CFSTR("query_has_attribute_intents_in_refinements");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setQueryHasAttributeIntentsInRefinements:", objc_msgSend(v31, "BOOLValue"));

LABEL_53:
  return a1;
}

- (GEOPDAutocompleteEntryQuery)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteEntryQuery *)-[GEOPDAutocompleteEntryQuery _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_679;
    else
      v8 = (int *)&readAll__nonRecursiveTag_680;
    GEOPDAutocompleteEntryQueryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDAutocompleteEntryQueryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteEntryQueryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteEntryQueryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 0xFu))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteEntryQuery readAll:](self, "readAll:", 0);
    if (self->_completion)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_resultRefinements;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if (self->_styleAttributes)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
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
  -[GEOPDAutocompleteEntryQuery _readResultRefinements]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_resultRefinements;
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
        if ((-[GEOPDResultRefinement hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), v3) & 1) != 0)
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
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOPDAutocompleteEntryQuery readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_completion)
    objc_msgSend(v9, "setCompletion:");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v9 + 15) = self->_tapBehavior;
    *((_BYTE *)v9 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v9 + 65) = self->_showIntermediateStateTapBehaviorListView;
    *((_BYTE *)v9 + 68) |= 4u;
  }
  if (-[GEOPDAutocompleteEntryQuery resultRefinementsCount](self, "resultRefinementsCount"))
  {
    objc_msgSend(v9, "clearResultRefinements");
    v5 = -[GEOPDAutocompleteEntryQuery resultRefinementsCount](self, "resultRefinementsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOPDAutocompleteEntryQuery resultRefinementAtIndex:](self, "resultRefinementAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addResultRefinement:", v8);

      }
    }
  }
  if (self->_styleAttributes)
    objc_msgSend(v9, "setStyleAttributes:");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v9 + 64) = self->_queryHasAttributeIntentsInRefinements;
    *((_BYTE *)v9 + 68) |= 2u;
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
  char flags;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  PBUnknownFields *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      GEOPDAutocompleteEntryQueryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteEntryQuery readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_completion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_tapBehavior;
    *(_BYTE *)(v5 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 65) = self->_showIntermediateStateTapBehaviorListView;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = self->_resultRefinements;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addResultRefinement:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  v17 = -[GEOStyleAttributes copyWithZone:](self->_styleAttributes, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_queryHasAttributeIntentsInRefinements;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *completion;
  NSMutableArray *resultRefinements;
  GEOStyleAttributes *styleAttributes;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEOPDAutocompleteEntryQuery readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  completion = self->_completion;
  if ((unint64_t)completion | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](completion, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_tapBehavior != *((_DWORD *)v4 + 15))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0)
      goto LABEL_23;
    if (self->_showIntermediateStateTapBehaviorListView)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_23;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_23;
  }
  resultRefinements = self->_resultRefinements;
  if ((unint64_t)resultRefinements | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](resultRefinements, "isEqual:"))
  {
    goto LABEL_23;
  }
  styleAttributes = self->_styleAttributes;
  if ((unint64_t)styleAttributes | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:"))
      goto LABEL_23;
  }
  v8 = (*((_BYTE *)v4 + 68) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) != 0)
    {
      if (self->_queryHasAttributeIntentsInRefinements)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_23;
      }
      else if (*((_BYTE *)v4 + 64))
      {
        goto LABEL_23;
      }
      v8 = 1;
      goto LABEL_24;
    }
LABEL_23:
    v8 = 0;
  }
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEOPDAutocompleteEntryQuery readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_completion, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_tapBehavior;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_showIntermediateStateTapBehaviorListView;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSMutableArray hash](self->_resultRefinements, "hash");
  v7 = -[GEOStyleAttributes hash](self->_styleAttributes, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v8 = 2654435761 * self->_queryHasAttributeIntentsInRefinements;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  GEOStyleAttributes *styleAttributes;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEOPDAutocompleteEntryQuery setCompletion:](self, "setCompletion:");
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 1) != 0)
  {
    self->_tapBehavior = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 68);
  }
  if ((v5 & 4) != 0)
  {
    self->_showIntermediateStateTapBehaviorListView = *((_BYTE *)v4 + 65);
    *(_BYTE *)&self->_flags |= 4u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *((id *)v4 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[GEOPDAutocompleteEntryQuery addResultRefinement:](self, "addResultRefinement:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  styleAttributes = self->_styleAttributes;
  v12 = *((_QWORD *)v4 + 5);
  if (styleAttributes)
  {
    if (v12)
      -[GEOStyleAttributes mergeFrom:](styleAttributes, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOPDAutocompleteEntryQuery setStyleAttributes:](self, "setStyleAttributes:");
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_queryHasAttributeIntentsInRefinements = *((_BYTE *)v4 + 64);
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
      GEOPDAutocompleteEntryQueryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_683);
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
  *(_BYTE *)&self->_flags |= 0x88u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteEntryQuery readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_resultRefinements;
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
          -[GEOPDResultRefinement clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[GEOStyleAttributes clearUnknownFields:](self->_styleAttributes, "clearUnknownFields:", 1, (_QWORD)v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_resultRefinements, 0);
  objc_storeStrong((id *)&self->_completion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
