@implementation GEOVisualLaneGuidance

- (GEOVisualLaneGuidance)init
{
  GEOVisualLaneGuidance *v2;
  GEOVisualLaneGuidance *v3;
  GEOVisualLaneGuidance *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVisualLaneGuidance;
  v2 = -[GEOVisualLaneGuidance init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVisualLaneGuidance)initWithData:(id)a3
{
  GEOVisualLaneGuidance *v3;
  GEOVisualLaneGuidance *v4;
  GEOVisualLaneGuidance *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVisualLaneGuidance;
  v3 = -[GEOVisualLaneGuidance initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLaneInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVisualLaneGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLaneInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)laneInfos
{
  -[GEOVisualLaneGuidance _readLaneInfos]((uint64_t)self);
  return self->_laneInfos;
}

- (void)setLaneInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *laneInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  laneInfos = self->_laneInfos;
  self->_laneInfos = v4;

}

- (void)clearLaneInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_laneInfos, "removeAllObjects");
}

- (void)addLaneInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVisualLaneGuidance _readLaneInfos]((uint64_t)self);
  -[GEOVisualLaneGuidance _addNoFlagsLaneInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLaneInfo:(uint64_t)a1
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

- (unint64_t)laneInfosCount
{
  -[GEOVisualLaneGuidance _readLaneInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_laneInfos, "count");
}

- (id)laneInfoAtIndex:(unint64_t)a3
{
  -[GEOVisualLaneGuidance _readLaneInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_laneInfos, "objectAtIndex:", a3);
}

+ (Class)laneInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readInstructions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVisualLaneGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstructions_tags_7345);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)instructions
{
  -[GEOVisualLaneGuidance _readInstructions]((uint64_t)self);
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *instructions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  instructions = self->_instructions;
  self->_instructions = v4;

}

- (void)clearInstructions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_instructions, "removeAllObjects");
}

- (void)addInstruction:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVisualLaneGuidance _readInstructions]((uint64_t)self);
  -[GEOVisualLaneGuidance _addNoFlagsInstruction:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsInstruction:(uint64_t)a1
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

- (unint64_t)instructionsCount
{
  -[GEOVisualLaneGuidance _readInstructions]((uint64_t)self);
  return -[NSMutableArray count](self->_instructions, "count");
}

- (id)instructionAtIndex:(unint64_t)a3
{
  -[GEOVisualLaneGuidance _readInstructions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_instructions, "objectAtIndex:", a3);
}

+ (Class)instructionType
{
  return (Class)objc_opt_class();
}

- (void)_readTitles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVisualLaneGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)titles
{
  -[GEOVisualLaneGuidance _readTitles]((uint64_t)self);
  return self->_titles;
}

- (void)setTitles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *titles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  titles = self->_titles;
  self->_titles = v4;

}

- (void)clearTitles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_titles, "removeAllObjects");
}

- (void)addTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVisualLaneGuidance _readTitles]((uint64_t)self);
  -[GEOVisualLaneGuidance _addNoFlagsTitle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsTitle:(uint64_t)a1
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

- (unint64_t)titlesCount
{
  -[GEOVisualLaneGuidance _readTitles]((uint64_t)self);
  return -[NSMutableArray count](self->_titles, "count");
}

- (id)titleAtIndex:(unint64_t)a3
{
  -[GEOVisualLaneGuidance _readTitles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_titles, "objectAtIndex:", a3);
}

+ (Class)titleType
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
  v8.super_class = (Class)GEOVisualLaneGuidance;
  -[GEOVisualLaneGuidance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVisualLaneGuidance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVisualLaneGuidance _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v37[4];
  id v38;
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
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v48 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("laneInfo");
    else
      v13 = CFSTR("lane_info");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v15 = *(id *)(a1 + 24);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("instruction"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v23 = *(id *)(a1 + 40);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v25);
    }

    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("title"));
  }
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
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __51__GEOVisualLaneGuidance__dictionaryRepresentation___block_invoke;
      v37[3] = &unk_1E1C00600;
      v34 = v33;
      v38 = v34;
      objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v37);
      v35 = v34;

      v32 = v35;
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVisualLaneGuidance _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOVisualLaneGuidance__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOVisualLaneGuidance)initWithDictionary:(id)a3
{
  return (GEOVisualLaneGuidance *)-[GEOVisualLaneGuidance _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOLaneInfo *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  GEOFormattedString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  GEOFormattedString *v34;
  uint64_t v35;
  void *v36;
  id v38;
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
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("laneInfo");
      else
        v6 = CFSTR("lane_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v38 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v48 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOLaneInfo alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOLaneInfo initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOLaneInfo initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addLaneInfo:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
          }
          while (v10);
        }

        v5 = v38;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("instruction"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v44 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v25 = -[GEOFormattedString initWithJSON:](v24, "initWithJSON:", v23);
                else
                  v25 = -[GEOFormattedString initWithDictionary:](v24, "initWithDictionary:", v23);
                v26 = (void *)v25;
                objc_msgSend(a1, "addInstruction:", v25);

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v20);
        }

        v5 = v38;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v28 = v27;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v40;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v40 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v34 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v35 = -[GEOFormattedString initWithJSON:](v34, "initWithJSON:", v33);
                else
                  v35 = -[GEOFormattedString initWithDictionary:](v34, "initWithDictionary:", v33);
                v36 = (void *)v35;
                objc_msgSend(a1, "addTitle:", v35);

              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          }
          while (v30);
        }

        v5 = v38;
      }

    }
  }

  return a1;
}

- (GEOVisualLaneGuidance)initWithJSON:(id)a3
{
  return (GEOVisualLaneGuidance *)-[GEOVisualLaneGuidance _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7350;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7351;
    GEOVisualLaneGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOVisualLaneGuidanceCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVisualLaneGuidanceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVisualLaneGuidanceReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v18;
  void *v19;
  __int128 v20;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOVisualLaneGuidanceIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVisualLaneGuidance readAll:](self, "readAll:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_laneInfos;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_instructions;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_titles;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
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
  id *v16;

  v16 = (id *)a3;
  -[GEOVisualLaneGuidance readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 12) = self->_readerMarkPos;
  *((_DWORD *)v16 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOVisualLaneGuidance laneInfosCount](self, "laneInfosCount"))
  {
    objc_msgSend(v16, "clearLaneInfos");
    v4 = -[GEOVisualLaneGuidance laneInfosCount](self, "laneInfosCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOVisualLaneGuidance laneInfoAtIndex:](self, "laneInfoAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addLaneInfo:", v7);

      }
    }
  }
  if (-[GEOVisualLaneGuidance instructionsCount](self, "instructionsCount"))
  {
    objc_msgSend(v16, "clearInstructions");
    v8 = -[GEOVisualLaneGuidance instructionsCount](self, "instructionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOVisualLaneGuidance instructionAtIndex:](self, "instructionAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addInstruction:", v11);

      }
    }
  }
  if (-[GEOVisualLaneGuidance titlesCount](self, "titlesCount"))
  {
    objc_msgSend(v16, "clearTitles");
    v12 = -[GEOVisualLaneGuidance titlesCount](self, "titlesCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOVisualLaneGuidance titleAtIndex:](self, "titleAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addTitle:", v15);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
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
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  __int128 v24;
  __int128 v25;
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
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOVisualLaneGuidanceReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVisualLaneGuidance readAll:](self, "readAll:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_laneInfos;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addLaneInfo:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = self->_instructions;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addInstruction:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v14);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self->_titles;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v5, "addTitle:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v19);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *laneInfos;
  NSMutableArray *instructions;
  NSMutableArray *titles;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOVisualLaneGuidance readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         laneInfos = self->_laneInfos,
         !((unint64_t)laneInfos | v4[4]))
     || -[NSMutableArray isEqual:](laneInfos, "isEqual:"))
    && ((instructions = self->_instructions, !((unint64_t)instructions | v4[3]))
     || -[NSMutableArray isEqual:](instructions, "isEqual:")))
  {
    titles = self->_titles;
    if ((unint64_t)titles | v4[5])
      v8 = -[NSMutableArray isEqual:](titles, "isEqual:");
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

  -[GEOVisualLaneGuidance readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_laneInfos, "hash");
  v4 = -[NSMutableArray hash](self->_instructions, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_titles, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        -[GEOVisualLaneGuidance addLaneInfo:](self, "addLaneInfo:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v4[3];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[GEOVisualLaneGuidance addInstruction:](self, "addInstruction:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v4[5];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[GEOVisualLaneGuidance addTitle:](self, "addTitle:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOVisualLaneGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7354);
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
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOVisualLaneGuidance readAll:](self, "readAll:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_laneInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = self->_instructions;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v14);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = self->_titles;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (_QWORD)v22);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_laneInfos, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
