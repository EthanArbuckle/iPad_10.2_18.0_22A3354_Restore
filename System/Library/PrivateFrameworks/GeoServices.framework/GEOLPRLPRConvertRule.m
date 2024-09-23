@implementation GEOLPRLPRConvertRule

- (GEOLPRLPRConvertRule)init
{
  GEOLPRLPRConvertRule *v2;
  GEOLPRLPRConvertRule *v3;
  GEOLPRLPRConvertRule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLPRConvertRule;
  v2 = -[GEOLPRLPRConvertRule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLPRConvertRule)initWithData:(id)a3
{
  GEOLPRLPRConvertRule *v3;
  GEOLPRLPRConvertRule *v4;
  GEOLPRLPRConvertRule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLPRConvertRule;
  v3 = -[GEOLPRLPRConvertRule initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPickupRules
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRConvertRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPickupRules_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)pickupRules
{
  -[GEOLPRLPRConvertRule _readPickupRules]((uint64_t)self);
  return self->_pickupRules;
}

- (void)setPickupRules:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *pickupRules;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  pickupRules = self->_pickupRules;
  self->_pickupRules = v4;

}

- (void)clearPickupRules
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_pickupRules, "removeAllObjects");
}

- (void)addPickupRule:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLPRConvertRule _readPickupRules]((uint64_t)self);
  -[GEOLPRLPRConvertRule _addNoFlagsPickupRule:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsPickupRule:(uint64_t)a1
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

- (unint64_t)pickupRulesCount
{
  -[GEOLPRLPRConvertRule _readPickupRules]((uint64_t)self);
  return -[NSMutableArray count](self->_pickupRules, "count");
}

- (id)pickupRuleAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRConvertRule _readPickupRules]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_pickupRules, "objectAtIndex:", a3);
}

+ (Class)pickupRuleType
{
  return (Class)objc_opt_class();
}

- (void)_readMapRules
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRConvertRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRules_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)mapRules
{
  -[GEOLPRLPRConvertRule _readMapRules]((uint64_t)self);
  return self->_mapRules;
}

- (void)setMapRules:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *mapRules;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  mapRules = self->_mapRules;
  self->_mapRules = v4;

}

- (void)clearMapRules
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_mapRules, "removeAllObjects");
}

- (void)addMapRule:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLPRConvertRule _readMapRules]((uint64_t)self);
  -[GEOLPRLPRConvertRule _addNoFlagsMapRule:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsMapRule:(uint64_t)a1
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

- (unint64_t)mapRulesCount
{
  -[GEOLPRLPRConvertRule _readMapRules]((uint64_t)self);
  return -[NSMutableArray count](self->_mapRules, "count");
}

- (id)mapRuleAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRConvertRule _readMapRules]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_mapRules, "objectAtIndex:", a3);
}

+ (Class)mapRuleType
{
  return (Class)objc_opt_class();
}

- (void)_readFillRules
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRConvertRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFillRules_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)fillRules
{
  -[GEOLPRLPRConvertRule _readFillRules]((uint64_t)self);
  return self->_fillRules;
}

- (void)setFillRules:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *fillRules;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  fillRules = self->_fillRules;
  self->_fillRules = v4;

}

- (void)clearFillRules
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_fillRules, "removeAllObjects");
}

- (void)addFillRule:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLPRConvertRule _readFillRules]((uint64_t)self);
  -[GEOLPRLPRConvertRule _addNoFlagsFillRule:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsFillRule:(uint64_t)a1
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

- (unint64_t)fillRulesCount
{
  -[GEOLPRLPRConvertRule _readFillRules]((uint64_t)self);
  return -[NSMutableArray count](self->_fillRules, "count");
}

- (id)fillRuleAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRConvertRule _readFillRules]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_fillRules, "objectAtIndex:", a3);
}

+ (Class)fillRuleType
{
  return (Class)objc_opt_class();
}

- (unsigned)validStartTime
{
  return self->_validStartTime;
}

- (void)setValidStartTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_validStartTime = a3;
}

- (void)setHasValidStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasValidStartTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)validEndTime
{
  return self->_validEndTime;
}

- (void)setValidEndTime:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_validEndTime = a3;
}

- (void)setHasValidEndTime:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasValidEndTime
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
  v8.super_class = (Class)GEOLPRLPRConvertRule;
  -[GEOLPRLPRConvertRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLPRConvertRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLPRConvertRule _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  const __CFString *v31;
  char v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
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
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v47 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("pickupRule");
    else
      v13 = CFSTR("pickup_rule");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = *(id *)(a1 + 24);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("mapRule");
    else
      v22 = CFSTR("map_rule");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v24 = *(id *)(a1 + 16);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v39 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v29, "jsonRepresentation");
          else
            objc_msgSend(v29, "dictionaryRepresentation", (_QWORD)v38);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v30, (_QWORD)v38);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v26);
    }

    if (a2)
      v31 = CFSTR("fillRule");
    else
      v31 = CFSTR("fill_rule");
    objc_msgSend(v4, "setObject:forKey:", v23, v31, (_QWORD)v38);

  }
  v32 = *(_BYTE *)(a1 + 60);
  if ((v32 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v34 = CFSTR("validStartTime");
    else
      v34 = CFSTR("valid_start_time");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

    v32 = *(_BYTE *)(a1 + 60);
  }
  if ((v32 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v36 = CFSTR("validEndTime");
    else
      v36 = CFSTR("valid_end_time");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRLPRConvertRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLPRConvertRule)initWithDictionary:(id)a3
{
  return (GEOLPRLPRConvertRule *)-[GEOLPRLPRConvertRule _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOLPRLPRPickupRule *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEOLPRLPRMapRule *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  GEOLPRLPRFillRule *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("pickupRule");
      else
        v6 = CFSTR("pickup_rule");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v44 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v54 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOLPRLPRPickupRule alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOLPRLPRPickupRule initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOLPRLPRPickupRule initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addPickupRule:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
          }
          while (v10);
        }

        v5 = v44;
      }

      if (a3)
        v17 = CFSTR("mapRule");
      else
        v17 = CFSTR("map_rule");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v50 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEOLPRLPRMapRule alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEOLPRLPRMapRule initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEOLPRLPRMapRule initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addMapRule:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          }
          while (v21);
        }

        v5 = v44;
      }

      if (a3)
        v28 = CFSTR("fillRule");
      else
        v28 = CFSTR("fill_rule");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v46;
          do
          {
            for (k = 0; k != v32; ++k)
            {
              if (*(_QWORD *)v46 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v36 = [GEOLPRLPRFillRule alloc];
                if ((a3 & 1) != 0)
                  v37 = -[GEOLPRLPRFillRule initWithJSON:](v36, "initWithJSON:", v35);
                else
                  v37 = -[GEOLPRLPRFillRule initWithDictionary:](v36, "initWithDictionary:", v35);
                v38 = (void *)v37;
                objc_msgSend(a1, "addFillRule:", v37);

              }
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          }
          while (v32);
        }

        v5 = v44;
      }

      if (a3)
        v39 = CFSTR("validStartTime");
      else
        v39 = CFSTR("valid_start_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setValidStartTime:", objc_msgSend(v40, "unsignedIntValue"));

      if (a3)
        v41 = CFSTR("validEndTime");
      else
        v41 = CFSTR("valid_end_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setValidEndTime:", objc_msgSend(v42, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOLPRLPRConvertRule)initWithJSON:(id)a3
{
  return (GEOLPRLPRConvertRule *)-[GEOLPRLPRConvertRule _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_144_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_145_0;
    GEOLPRLPRConvertRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRLPRConvertRuleCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLPRConvertRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLPRConvertRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  char flags;
  PBDataReader *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
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
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLPRLPRConvertRuleIsDirty((uint64_t)self) & 1) == 0)
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLPRLPRConvertRule readAll:](self, "readAll:", 0);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = self->_pickupRules;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v7);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_mapRules;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v11);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = self->_fillRules;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v15);
    }

    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint32Field();
  }

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
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  char flags;
  id *v17;

  v17 = (id *)a3;
  -[GEOLPRLPRConvertRule readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 10) = self->_readerMarkPos;
  *((_DWORD *)v17 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRLPRConvertRule pickupRulesCount](self, "pickupRulesCount"))
  {
    objc_msgSend(v17, "clearPickupRules");
    v4 = -[GEOLPRLPRConvertRule pickupRulesCount](self, "pickupRulesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRLPRConvertRule pickupRuleAtIndex:](self, "pickupRuleAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addPickupRule:", v7);

      }
    }
  }
  if (-[GEOLPRLPRConvertRule mapRulesCount](self, "mapRulesCount"))
  {
    objc_msgSend(v17, "clearMapRules");
    v8 = -[GEOLPRLPRConvertRule mapRulesCount](self, "mapRulesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOLPRLPRConvertRule mapRuleAtIndex:](self, "mapRuleAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addMapRule:", v11);

      }
    }
  }
  if (-[GEOLPRLPRConvertRule fillRulesCount](self, "fillRulesCount"))
  {
    objc_msgSend(v17, "clearFillRules");
    v12 = -[GEOLPRLPRConvertRule fillRulesCount](self, "fillRulesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOLPRLPRConvertRule fillRuleAtIndex:](self, "fillRuleAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addFillRule:", v15);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v17 + 14) = self->_validStartTime;
    *((_BYTE *)v17 + 60) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v17 + 13) = self->_validEndTime;
    *((_BYTE *)v17 + 60) |= 1u;
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  char flags;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLPRLPRConvertRuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLPRConvertRule readAll:](self, "readAll:", 0);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = self->_pickupRules;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPickupRule:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v10);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = self->_mapRules;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMapRule:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v15);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_fillRules;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend((id)v5, "addFillRule:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v20);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_validStartTime;
    *(_BYTE *)(v5 + 60) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_validEndTime;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *pickupRules;
  NSMutableArray *mapRules;
  NSMutableArray *fillRules;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOLPRLPRConvertRule readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  pickupRules = self->_pickupRules;
  if ((unint64_t)pickupRules | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](pickupRules, "isEqual:"))
      goto LABEL_17;
  }
  mapRules = self->_mapRules;
  if ((unint64_t)mapRules | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](mapRules, "isEqual:"))
      goto LABEL_17;
  }
  fillRules = self->_fillRules;
  if ((unint64_t)fillRules | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](fillRules, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_validStartTime != *((_DWORD *)v4 + 14))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v8 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_validEndTime != *((_DWORD *)v4 + 13))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOLPRLPRConvertRule readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_pickupRules, "hash");
  v4 = -[NSMutableArray hash](self->_mapRules, "hash");
  v5 = -[NSMutableArray hash](self->_fillRules, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v6 = 2654435761 * self->_validStartTime;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_validEndTime;
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
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
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
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        -[GEOLPRLPRConvertRule addPickupRule:](self, "addPickupRule:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        -[GEOLPRLPRConvertRule addMapRule:](self, "addMapRule:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = *((id *)v4 + 2);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[GEOLPRLPRConvertRule addFillRule:](self, "addFillRule:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v17);
  }

  v20 = *((_BYTE *)v4 + 60);
  if ((v20 & 2) != 0)
  {
    self->_validStartTime = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_flags |= 2u;
    v20 = *((_BYTE *)v4 + 60);
  }
  if ((v20 & 1) != 0)
  {
    self->_validEndTime = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickupRules, 0);
  objc_storeStrong((id *)&self->_mapRules, 0);
  objc_storeStrong((id *)&self->_fillRules, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
