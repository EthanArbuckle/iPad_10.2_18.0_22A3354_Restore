@implementation GEOLPRLPRMapRule

- (GEOLPRLPRMapRule)init
{
  GEOLPRLPRMapRule *v2;
  GEOLPRLPRMapRule *v3;
  GEOLPRLPRMapRule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLPRMapRule;
  v2 = -[GEOLPRLPRMapRule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLPRMapRule)initWithData:(id)a3
{
  GEOLPRLPRMapRule *v3;
  GEOLPRLPRMapRule *v4;
  GEOLPRLPRMapRule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLPRMapRule;
  v3 = -[GEOLPRLPRMapRule initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOLPRLPRMapRule;
  -[GEOLPRLPRMapRule dealloc](&v3, sel_dealloc);
}

- (void)_readPlateTypeIndexes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRMapRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlateTypeIndexes_tags_283);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)plateTypeIndexesCount
{
  -[GEOLPRLPRMapRule _readPlateTypeIndexes]((uint64_t)self);
  return self->_plateTypeIndexes.count;
}

- (unsigned)plateTypeIndexes
{
  -[GEOLPRLPRMapRule _readPlateTypeIndexes]((uint64_t)self);
  return self->_plateTypeIndexes.list;
}

- (void)clearPlateTypeIndexes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Clear();
}

- (void)addPlateTypeIndexes:(unsigned int)a3
{
  -[GEOLPRLPRMapRule _readPlateTypeIndexes]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_plateTypeIndexes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOLPRLPRMapRule _readPlateTypeIndexes]((uint64_t)self);
  p_plateTypeIndexes = &self->_plateTypeIndexes;
  count = self->_plateTypeIndexes.count;
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
  return p_plateTypeIndexes->list[a3];
}

- (void)setPlateTypeIndexes:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedUInt32Set();
}

- (void)_readTargetChars
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRMapRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTargetChars_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)targetChars
{
  -[GEOLPRLPRMapRule _readTargetChars]((uint64_t)self);
  return self->_targetChars;
}

- (void)setTargetChars:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *targetChars;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  targetChars = self->_targetChars;
  self->_targetChars = v4;

}

- (void)clearTargetChars
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_targetChars, "removeAllObjects");
}

- (void)addTargetChar:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLPRMapRule _readTargetChars]((uint64_t)self);
  -[GEOLPRLPRMapRule _addNoFlagsTargetChar:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsTargetChar:(uint64_t)a1
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

- (unint64_t)targetCharsCount
{
  -[GEOLPRLPRMapRule _readTargetChars]((uint64_t)self);
  return -[NSMutableArray count](self->_targetChars, "count");
}

- (id)targetCharAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRMapRule _readTargetChars]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_targetChars, "objectAtIndex:", a3);
}

+ (Class)targetCharType
{
  return (Class)objc_opt_class();
}

- (void)_readValueMappings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRMapRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValueMappings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)valueMappings
{
  -[GEOLPRLPRMapRule _readValueMappings]((uint64_t)self);
  return self->_valueMappings;
}

- (void)setValueMappings:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *valueMappings;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  valueMappings = self->_valueMappings;
  self->_valueMappings = v4;

}

- (void)clearValueMappings
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_valueMappings, "removeAllObjects");
}

- (void)addValueMapping:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLPRLPRMapRule _readValueMappings]((uint64_t)self);
  -[GEOLPRLPRMapRule _addNoFlagsValueMapping:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsValueMapping:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)valueMappingsCount
{
  -[GEOLPRLPRMapRule _readValueMappings]((uint64_t)self);
  return -[NSMutableArray count](self->_valueMappings, "count");
}

- (id)valueMappingAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRMapRule _readValueMappings]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_valueMappings, "objectAtIndex:", a3);
}

+ (Class)valueMappingType
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
  v8.super_class = (Class)GEOLPRLPRMapRule;
  -[GEOLPRLPRMapRule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRLPRMapRule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLPRMapRule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
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
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt32NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("plateTypeIndexes");
    else
      v6 = CFSTR("plate_type_indexes");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v8 = *(id *)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("targetChar");
    else
      v15 = CFSTR("target_char");
    objc_msgSend(v4, "setObject:forKey:", v7, v15);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v17 = *(id *)(a1 + 56);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation", (_QWORD)v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23, (_QWORD)v30);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v19);
    }

    if (a2)
      v24 = CFSTR("valueMapping");
    else
      v24 = CFSTR("value_mapping");
    objc_msgSend(v4, "setObject:forKey:", v16, v24, (_QWORD)v30);

  }
  objc_msgSend((id)a1, "mrLicensePlateStructure");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("mrLicensePlateStructure");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("mr_license_plate_structure");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRLPRMapRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLPRMapRule)initWithDictionary:(id)a3
{
  return (GEOLPRLPRMapRule *)-[GEOLPRLPRMapRule _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  GEOLPRTargetChar *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  GEOLPRValueMapping *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEOLPRLicensePlateStructure *v38;
  uint64_t v39;
  void *v40;
  id v42;
  __int128 v43;
  __int128 v44;
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
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("plateTypeIndexes");
      else
        v6 = CFSTR("plate_type_indexes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v52 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addPlateTypeIndexes:", objc_msgSend(v13, "unsignedIntValue"));
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("targetChar");
      else
        v14 = CFSTR("target_char");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v42 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v48 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = [GEOLPRTargetChar alloc];
                if ((a3 & 1) != 0)
                  v23 = -[GEOLPRTargetChar initWithJSON:](v22, "initWithJSON:", v21);
                else
                  v23 = -[GEOLPRTargetChar initWithDictionary:](v22, "initWithDictionary:", v21);
                v24 = (void *)v23;
                objc_msgSend(a1, "addTargetChar:", v23);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v18);
        }

        v5 = v42;
      }

      if (a3)
        v25 = CFSTR("valueMapping");
      else
        v25 = CFSTR("value_mapping");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v44;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v44 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = [GEOLPRValueMapping alloc];
                if ((a3 & 1) != 0)
                  v34 = -[GEOLPRValueMapping initWithJSON:](v33, "initWithJSON:", v32);
                else
                  v34 = -[GEOLPRValueMapping initWithDictionary:](v33, "initWithDictionary:", v32);
                v35 = (void *)v34;
                objc_msgSend(a1, "addValueMapping:", v34);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          }
          while (v29);
        }

        v5 = v42;
      }

      if (a3)
        v36 = CFSTR("mrLicensePlateStructure");
      else
        v36 = CFSTR("mr_license_plate_structure");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = [GEOLPRLicensePlateStructure alloc];
        if ((a3 & 1) != 0)
          v39 = -[GEOLPRLicensePlateStructure initWithJSON:](v38, "initWithJSON:", v37);
        else
          v39 = -[GEOLPRLicensePlateStructure initWithDictionary:](v38, "initWithDictionary:", v37);
        v40 = (void *)v39;
        objc_msgSend(a1, "setMrLicensePlateStructure:", v39);

      }
    }
  }

  return a1;
}

- (GEOLPRLPRMapRule)initWithJSON:(id)a3
{
  return (GEOLPRLPRMapRule *)-[GEOLPRLPRMapRule _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_297;
    else
      v8 = (int *)&readAll__nonRecursiveTag_298;
    GEOLPRLPRMapRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLPRLPRMapRuleCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLPRMapRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLPRMapRuleReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOLPRLPRMapRuleIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOLPRLPRMapRule readAll:](self, "readAll:", 0);
    if (self->_plateTypeIndexes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_plateTypeIndexes.count);
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_targetChars;
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
    v11 = self->_valueMappings;
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

    if (self->_mrLicensePlateStructure)
      PBDataWriterWriteSubmessage();
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
  -[GEOLPRLPRMapRule readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v15 + 1, self->_reader);
  *((_DWORD *)v15 + 16) = self->_readerMarkPos;
  *((_DWORD *)v15 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLPRLPRMapRule plateTypeIndexesCount](self, "plateTypeIndexesCount"))
  {
    objc_msgSend(v15, "clearPlateTypeIndexes");
    v4 = -[GEOLPRLPRMapRule plateTypeIndexesCount](self, "plateTypeIndexesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v15, "addPlateTypeIndexes:", -[GEOLPRLPRMapRule plateTypeIndexesAtIndex:](self, "plateTypeIndexesAtIndex:", i));
    }
  }
  if (-[GEOLPRLPRMapRule targetCharsCount](self, "targetCharsCount"))
  {
    objc_msgSend(v15, "clearTargetChars");
    v7 = -[GEOLPRLPRMapRule targetCharsCount](self, "targetCharsCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOLPRLPRMapRule targetCharAtIndex:](self, "targetCharAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTargetChar:", v10);

      }
    }
  }
  if (-[GEOLPRLPRMapRule valueMappingsCount](self, "valueMappingsCount"))
  {
    objc_msgSend(v15, "clearValueMappings");
    v11 = -[GEOLPRLPRMapRule valueMappingsCount](self, "valueMappingsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEOLPRLPRMapRule valueMappingAtIndex:](self, "valueMappingAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addValueMapping:", v14);

      }
    }
  }
  if (self->_mrLicensePlateStructure)
    objc_msgSend(v15, "setMrLicensePlateStructure:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOLPRLPRMapRuleReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLPRLPRMapRule readAll:](self, "readAll:", 0);
  PBRepeatedUInt32Copy();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_targetChars;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addTargetChar:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = self->_valueMappings;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v5, "addValueMapping:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  v18 = -[GEOLPRLicensePlateStructure copyWithZone:](self->_mrLicensePlateStructure, "copyWithZone:", a3);
  v19 = (void *)v5[5];
  v5[5] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *targetChars;
  NSMutableArray *valueMappings;
  GEOLPRLicensePlateStructure *mrLicensePlateStructure;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOLPRLPRMapRule readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedUInt32IsEqual())
    && ((targetChars = self->_targetChars, !((unint64_t)targetChars | v4[6]))
     || -[NSMutableArray isEqual:](targetChars, "isEqual:"))
    && ((valueMappings = self->_valueMappings, !((unint64_t)valueMappings | v4[7]))
     || -[NSMutableArray isEqual:](valueMappings, "isEqual:")))
  {
    mrLicensePlateStructure = self->_mrLicensePlateStructure;
    if ((unint64_t)mrLicensePlateStructure | v4[5])
      v8 = -[GEOLPRLicensePlateStructure isEqual:](mrLicensePlateStructure, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOLPRLPRMapRule readAll:](self, "readAll:", 1);
  v3 = PBRepeatedUInt32Hash();
  v4 = -[NSMutableArray hash](self->_targetChars, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_valueMappings, "hash");
  return v4 ^ v5 ^ -[GEOLPRLicensePlateStructure hash](self->_mrLicensePlateStructure, "hash");
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
  uint64_t j;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  GEOLPRLicensePlateStructure *mrLicensePlateStructure;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = objc_msgSend(v4, "plateTypeIndexesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOLPRLPRMapRule addPlateTypeIndexes:](self, "addPlateTypeIndexes:", objc_msgSend(v4, "plateTypeIndexesAtIndex:", i));
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v4[6];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        -[GEOLPRLPRMapRule addTargetChar:](self, "addTargetChar:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v4[7];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v15; ++k)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        -[GEOLPRLPRMapRule addValueMapping:](self, "addValueMapping:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  mrLicensePlateStructure = self->_mrLicensePlateStructure;
  v19 = v4[5];
  if (mrLicensePlateStructure)
  {
    if (v19)
      -[GEOLPRLicensePlateStructure mergeFrom:](mrLicensePlateStructure, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOLPRLPRMapRule setMrLicensePlateStructure:](self, "setMrLicensePlateStructure:");
  }

}

- (void)_readMrLicensePlateStructure
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRMapRuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMrLicensePlateStructure_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasMrLicensePlateStructure
{
  -[GEOLPRLPRMapRule _readMrLicensePlateStructure]((uint64_t)self);
  return self->_mrLicensePlateStructure != 0;
}

- (GEOLPRLicensePlateStructure)mrLicensePlateStructure
{
  -[GEOLPRLPRMapRule _readMrLicensePlateStructure]((uint64_t)self);
  return self->_mrLicensePlateStructure;
}

- (void)setMrLicensePlateStructure:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_mrLicensePlateStructure, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMappings, 0);
  objc_storeStrong((id *)&self->_targetChars, 0);
  objc_storeStrong((id *)&self->_mrLicensePlateStructure, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
