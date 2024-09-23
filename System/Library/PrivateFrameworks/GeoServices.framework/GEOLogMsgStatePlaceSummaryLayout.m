@implementation GEOLogMsgStatePlaceSummaryLayout

- (GEOLogMsgStatePlaceSummaryLayout)init
{
  GEOLogMsgStatePlaceSummaryLayout *v2;
  GEOLogMsgStatePlaceSummaryLayout *v3;
  GEOLogMsgStatePlaceSummaryLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStatePlaceSummaryLayout;
  v2 = -[GEOLogMsgStatePlaceSummaryLayout init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStatePlaceSummaryLayout)initWithData:(id)a3
{
  GEOLogMsgStatePlaceSummaryLayout *v3;
  GEOLogMsgStatePlaceSummaryLayout *v4;
  GEOLogMsgStatePlaceSummaryLayout *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStatePlaceSummaryLayout;
  v3 = -[GEOLogMsgStatePlaceSummaryLayout initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLogMsgStatePlaceSummaryLayout;
  -[GEOLogMsgStatePlaceSummaryLayout dealloc](&v3, sel_dealloc);
}

- (void)_readMuids
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceSummaryLayoutReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMuids_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)muidsCount
{
  -[GEOLogMsgStatePlaceSummaryLayout _readMuids]((uint64_t)self);
  return self->_muids.count;
}

- (unint64_t)muids
{
  -[GEOLogMsgStatePlaceSummaryLayout _readMuids]((uint64_t)self);
  return self->_muids.list;
}

- (void)clearMuids
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt64Clear();
}

- (void)addMuids:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceSummaryLayout _readMuids]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (unint64_t)muidsAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_muids;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOLogMsgStatePlaceSummaryLayout _readMuids]((uint64_t)self);
  p_muids = &self->_muids;
  count = self->_muids.count;
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
  return p_muids->list[a3];
}

- (void)setMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedUInt64Set();
}

- (void)_readTrailingEntityActionDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceSummaryLayoutReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrailingEntityActionDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)trailingEntityActionDetails
{
  -[GEOLogMsgStatePlaceSummaryLayout _readTrailingEntityActionDetails]((uint64_t)self);
  return self->_trailingEntityActionDetails;
}

- (void)setTrailingEntityActionDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trailingEntityActionDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  trailingEntityActionDetails = self->_trailingEntityActionDetails;
  self->_trailingEntityActionDetails = v4;

}

- (void)clearTrailingEntityActionDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_trailingEntityActionDetails, "removeAllObjects");
}

- (void)addTrailingEntityActionDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStatePlaceSummaryLayout _readTrailingEntityActionDetails]((uint64_t)self);
  -[GEOLogMsgStatePlaceSummaryLayout _addNoFlagsTrailingEntityActionDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsTrailingEntityActionDetails:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trailingEntityActionDetailsCount
{
  -[GEOLogMsgStatePlaceSummaryLayout _readTrailingEntityActionDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_trailingEntityActionDetails, "count");
}

- (id)trailingEntityActionDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceSummaryLayout _readTrailingEntityActionDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trailingEntityActionDetails, "objectAtIndex:", a3);
}

+ (Class)trailingEntityActionDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readDynamicContextHyperlinkDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStatePlaceSummaryLayoutReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDynamicContextHyperlinkDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)dynamicContextHyperlinkDetails
{
  -[GEOLogMsgStatePlaceSummaryLayout _readDynamicContextHyperlinkDetails]((uint64_t)self);
  return self->_dynamicContextHyperlinkDetails;
}

- (void)setDynamicContextHyperlinkDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *dynamicContextHyperlinkDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  dynamicContextHyperlinkDetails = self->_dynamicContextHyperlinkDetails;
  self->_dynamicContextHyperlinkDetails = v4;

}

- (void)clearDynamicContextHyperlinkDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_dynamicContextHyperlinkDetails, "removeAllObjects");
}

- (void)addDynamicContextHyperlinkDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStatePlaceSummaryLayout _readDynamicContextHyperlinkDetails]((uint64_t)self);
  -[GEOLogMsgStatePlaceSummaryLayout _addNoFlagsDynamicContextHyperlinkDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsDynamicContextHyperlinkDetails:(uint64_t)a1
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

- (unint64_t)dynamicContextHyperlinkDetailsCount
{
  -[GEOLogMsgStatePlaceSummaryLayout _readDynamicContextHyperlinkDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_dynamicContextHyperlinkDetails, "count");
}

- (id)dynamicContextHyperlinkDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgStatePlaceSummaryLayout _readDynamicContextHyperlinkDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_dynamicContextHyperlinkDetails, "objectAtIndex:", a3);
}

+ (Class)dynamicContextHyperlinkDetailsType
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
  v8.super_class = (Class)GEOLogMsgStatePlaceSummaryLayout;
  -[GEOLogMsgStatePlaceSummaryLayout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStatePlaceSummaryLayout dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStatePlaceSummaryLayout _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
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
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  const __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt64NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("muids"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v9);
    }

    if (a2)
      v14 = CFSTR("trailingEntityActionDetails");
    else
      v14 = CFSTR("trailing_entity_action_details");
    objc_msgSend(v4, "setObject:forKey:", v6, v14);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = *(id *)(a1 + 40);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation", (_QWORD)v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22, (_QWORD)v25);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
    }

    if (a2)
      v23 = CFSTR("dynamicContextHyperlinkDetails");
    else
      v23 = CFSTR("dynamic_context_hyperlink_details");
    objc_msgSend(v4, "setObject:forKey:", v15, v23, (_QWORD)v25);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStatePlaceSummaryLayout _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStatePlaceSummaryLayout)initWithDictionary:(id)a3
{
  return (GEOLogMsgStatePlaceSummaryLayout *)-[GEOLogMsgStatePlaceSummaryLayout _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  GEOTrailingEntityActionDetails *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  GEODynamicContextHyperlinkDetails *v32;
  uint64_t v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muids"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v45 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addMuids:", objc_msgSend(v12, "unsignedLongLongValue"));
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
          }
          while (v9);
        }

      }
      if (a3)
        v13 = CFSTR("trailingEntityActionDetails");
      else
        v13 = CFSTR("trailing_entity_action_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v41 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = [GEOTrailingEntityActionDetails alloc];
                if ((a3 & 1) != 0)
                  v22 = -[GEOTrailingEntityActionDetails initWithJSON:](v21, "initWithJSON:", v20);
                else
                  v22 = -[GEOTrailingEntityActionDetails initWithDictionary:](v21, "initWithDictionary:", v20);
                v23 = (void *)v22;
                objc_msgSend(a1, "addTrailingEntityActionDetails:", v22);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v17);
        }

      }
      if (a3)
        v24 = CFSTR("dynamicContextHyperlinkDetails");
      else
        v24 = CFSTR("dynamic_context_hyperlink_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v37 != v29)
                objc_enumerationMutation(v26);
              v31 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = [GEODynamicContextHyperlinkDetails alloc];
                if ((a3 & 1) != 0)
                  v33 = -[GEODynamicContextHyperlinkDetails initWithJSON:](v32, "initWithJSON:", v31);
                else
                  v33 = -[GEODynamicContextHyperlinkDetails initWithDictionary:](v32, "initWithDictionary:", v31);
                v34 = (void *)v33;
                objc_msgSend(a1, "addDynamicContextHyperlinkDetails:", v33);

              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          }
          while (v28);
        }

      }
    }
  }

  return a1;
}

- (GEOLogMsgStatePlaceSummaryLayout)initWithJSON:(id)a3
{
  return (GEOLogMsgStatePlaceSummaryLayout *)-[GEOLogMsgStatePlaceSummaryLayout _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7576;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7577;
    GEOLogMsgStatePlaceSummaryLayoutReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgStatePlaceSummaryLayoutCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStatePlaceSummaryLayoutIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStatePlaceSummaryLayoutReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xF) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStatePlaceSummaryLayout readAll:](self, "readAll:", 0);
    if (self->_muids.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_muids.count);
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_trailingEntityActionDetails;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_dynamicContextHyperlinkDetails;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  void *v14;
  id *v15;

  v15 = (id *)a3;
  -[GEOLogMsgStatePlaceSummaryLayout readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 14) = self->_readerMarkPos;
  *((_DWORD *)v15 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLogMsgStatePlaceSummaryLayout muidsCount](self, "muidsCount"))
  {
    objc_msgSend(v15, "clearMuids");
    v4 = -[GEOLogMsgStatePlaceSummaryLayout muidsCount](self, "muidsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v15, "addMuids:", -[GEOLogMsgStatePlaceSummaryLayout muidsAtIndex:](self, "muidsAtIndex:", i));
    }
  }
  if (-[GEOLogMsgStatePlaceSummaryLayout trailingEntityActionDetailsCount](self, "trailingEntityActionDetailsCount"))
  {
    objc_msgSend(v15, "clearTrailingEntityActionDetails");
    v7 = -[GEOLogMsgStatePlaceSummaryLayout trailingEntityActionDetailsCount](self, "trailingEntityActionDetailsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOLogMsgStatePlaceSummaryLayout trailingEntityActionDetailsAtIndex:](self, "trailingEntityActionDetailsAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTrailingEntityActionDetails:", v10);

      }
    }
  }
  if (-[GEOLogMsgStatePlaceSummaryLayout dynamicContextHyperlinkDetailsCount](self, "dynamicContextHyperlinkDetailsCount"))
  {
    objc_msgSend(v15, "clearDynamicContextHyperlinkDetails");
    v11 = -[GEOLogMsgStatePlaceSummaryLayout dynamicContextHyperlinkDetailsCount](self, "dynamicContextHyperlinkDetailsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEOLogMsgStatePlaceSummaryLayout dynamicContextHyperlinkDetailsAtIndex:](self, "dynamicContextHyperlinkDetailsAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addDynamicContextHyperlinkDetails:", v14);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLogMsgStatePlaceSummaryLayoutReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStatePlaceSummaryLayout readAll:](self, "readAll:", 0);
  PBRepeatedUInt64Copy();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_trailingEntityActionDetails;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addTrailingEntityActionDetails:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_dynamicContextHyperlinkDetails;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addDynamicContextHyperlinkDetails:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *trailingEntityActionDetails;
  NSMutableArray *dynamicContextHyperlinkDetails;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOLogMsgStatePlaceSummaryLayout readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedUInt64IsEqual())
    && ((trailingEntityActionDetails = self->_trailingEntityActionDetails,
         !((unint64_t)trailingEntityActionDetails | v4[6]))
     || -[NSMutableArray isEqual:](trailingEntityActionDetails, "isEqual:")))
  {
    dynamicContextHyperlinkDetails = self->_dynamicContextHyperlinkDetails;
    if ((unint64_t)dynamicContextHyperlinkDetails | v4[5])
      v7 = -[NSMutableArray isEqual:](dynamicContextHyperlinkDetails, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOLogMsgStatePlaceSummaryLayout readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt64Hash();
  v4 = -[NSMutableArray hash](self->_trailingEntityActionDetails, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_dynamicContextHyperlinkDetails, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "muidsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOLogMsgStatePlaceSummaryLayout addMuids:](self, "addMuids:", objc_msgSend(v4, "muidsAtIndex:", i));
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v4[6];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        -[GEOLogMsgStatePlaceSummaryLayout addTrailingEntityActionDetails:](self, "addTrailingEntityActionDetails:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v4[5];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[GEOLogMsgStatePlaceSummaryLayout addDynamicContextHyperlinkDetails:](self, "addDynamicContextHyperlinkDetails:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingEntityActionDetails, 0);
  objc_storeStrong((id *)&self->_dynamicContextHyperlinkDetails, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
