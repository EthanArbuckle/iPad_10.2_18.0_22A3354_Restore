@implementation GEORPAccessPointCorrections

- (GEORPAccessPointCorrections)init
{
  GEORPAccessPointCorrections *v2;
  GEORPAccessPointCorrections *v3;
  GEORPAccessPointCorrections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPAccessPointCorrections;
  v2 = -[GEORPAccessPointCorrections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAccessPointCorrections)initWithData:(id)a3
{
  GEORPAccessPointCorrections *v3;
  GEORPAccessPointCorrections *v4;
  GEORPAccessPointCorrections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPAccessPointCorrections;
  v3 = -[GEORPAccessPointCorrections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddeds
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
        GEORPAccessPointCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)addeds
{
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  return self->_addeds;
}

- (void)setAddeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *addeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  addeds = self->_addeds;
  self->_addeds = v4;

}

- (void)clearAddeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_addeds, "removeAllObjects");
}

- (void)addAdded:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  -[GEORPAccessPointCorrections _addNoFlagsAdded:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsAdded:(uint64_t)a1
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

- (unint64_t)addedsCount
{
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  return -[NSMutableArray count](self->_addeds, "count");
}

- (id)addedAtIndex:(unint64_t)a3
{
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_addeds, "objectAtIndex:", a3);
}

+ (Class)addedType
{
  return (Class)objc_opt_class();
}

- (void)_readRemoveds
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
        GEORPAccessPointCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRemoveds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)removeds
{
  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  return self->_removeds;
}

- (void)setRemoveds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *removeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  removeds = self->_removeds;
  self->_removeds = v4;

}

- (void)clearRemoveds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_removeds, "removeAllObjects");
}

- (void)addRemoved:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  -[GEORPAccessPointCorrections _addNoFlagsRemoved:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsRemoved:(uint64_t)a1
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

- (unint64_t)removedsCount
{
  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  return -[NSMutableArray count](self->_removeds, "count");
}

- (id)removedAtIndex:(unint64_t)a3
{
  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_removeds, "objectAtIndex:", a3);
}

+ (Class)removedType
{
  return (Class)objc_opt_class();
}

- (void)_readEditeds
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
        GEORPAccessPointCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEditeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)editeds
{
  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  return self->_editeds;
}

- (void)setEditeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *editeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  editeds = self->_editeds;
  self->_editeds = v4;

}

- (void)clearEditeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_editeds, "removeAllObjects");
}

- (void)addEdited:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  -[GEORPAccessPointCorrections _addNoFlagsEdited:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsEdited:(uint64_t)a1
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

- (unint64_t)editedsCount
{
  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  return -[NSMutableArray count](self->_editeds, "count");
}

- (id)editedAtIndex:(unint64_t)a3
{
  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_editeds, "objectAtIndex:", a3);
}

+ (Class)editedType
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
  v8.super_class = (Class)GEORPAccessPointCorrections;
  -[GEORPAccessPointCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPAccessPointCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAccessPointCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
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
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v6 = *(id *)(a1 + 24);
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

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("added"));
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v14 = *(id *)(a1 + 40);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v43 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("removed"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v22 = *(id *)(a1 + 32);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v24);
    }

    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("edited"));
  }
  v29 = *(void **)(a1 + 16);
  if (v29)
  {
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __57__GEORPAccessPointCorrections__dictionaryRepresentation___block_invoke;
      v36[3] = &unk_1E1C00600;
      v33 = v32;
      v37 = v33;
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v36);
      v34 = v33;

      v31 = v34;
    }
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPAccessPointCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEORPAccessPointCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPAccessPointCorrections)initWithDictionary:(id)a3
{
  return (GEORPAccessPointCorrections *)-[GEORPAccessPointCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEORoadAccessPoint *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  GEORoadAccessPoint *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  GEORPEditedAccessPoint *v33;
  uint64_t v34;
  void *v35;
  id v37;
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
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("added"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v37 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v47 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = [GEORoadAccessPoint alloc];
                if ((a3 & 1) != 0)
                  v14 = -[GEORoadAccessPoint initWithJSON:](v13, "initWithJSON:", v12);
                else
                  v14 = -[GEORoadAccessPoint initWithDictionary:](v13, "initWithDictionary:", v12);
                v15 = (void *)v14;
                objc_msgSend(a1, "addAdded:", v14);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          }
          while (v9);
        }

        v5 = v37;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("removed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v43 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = [GEORoadAccessPoint alloc];
                if ((a3 & 1) != 0)
                  v24 = -[GEORoadAccessPoint initWithJSON:](v23, "initWithJSON:", v22);
                else
                  v24 = -[GEORoadAccessPoint initWithDictionary:](v23, "initWithDictionary:", v22);
                v25 = (void *)v24;
                objc_msgSend(a1, "addRemoved:", v24);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          }
          while (v19);
        }

        v5 = v37;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("edited"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v39;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v39 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = [GEORPEditedAccessPoint alloc];
                if ((a3 & 1) != 0)
                  v34 = -[GEORPEditedAccessPoint initWithJSON:](v33, "initWithJSON:", v32);
                else
                  v34 = -[GEORPEditedAccessPoint initWithDictionary:](v33, "initWithDictionary:", v32);
                v35 = (void *)v34;
                objc_msgSend(a1, "addEdited:", v34);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
          }
          while (v29);
        }

        v5 = v37;
      }

    }
  }

  return a1;
}

- (GEORPAccessPointCorrections)initWithJSON:(id)a3
{
  return (GEORPAccessPointCorrections *)-[GEORPAccessPointCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_10;
    else
      v8 = (int *)&readAll__nonRecursiveTag_10;
    GEORPAccessPointCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPAccessPointCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAccessPointCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAccessPointCorrectionsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPAccessPointCorrectionsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPAccessPointCorrections readAll:](self, "readAll:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_addeds;
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
    v10 = self->_removeds;
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
    v14 = self->_editeds;
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

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
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

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  -[GEORPAccessPointCorrections _readAddeds]((uint64_t)self);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_addeds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_26;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEORPAccessPointCorrections _readEditeds]((uint64_t)self);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_editeds;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_26;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v11)
          goto LABEL_11;
        break;
      }
    }
  }

  -[GEORPAccessPointCorrections _readRemoveds]((uint64_t)self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_removeds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
LABEL_19:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v16)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3, (_QWORD)v20) & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        if (v15)
          goto LABEL_19;
        goto LABEL_25;
      }
    }
LABEL_26:
    v18 = 1;
    goto LABEL_27;
  }
LABEL_25:
  v18 = 0;
LABEL_27:

  return v18;
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
  -[GEORPAccessPointCorrections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 12) = self->_readerMarkPos;
  *((_DWORD *)v16 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPAccessPointCorrections addedsCount](self, "addedsCount"))
  {
    objc_msgSend(v16, "clearAddeds");
    v4 = -[GEORPAccessPointCorrections addedsCount](self, "addedsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPAccessPointCorrections addedAtIndex:](self, "addedAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAdded:", v7);

      }
    }
  }
  if (-[GEORPAccessPointCorrections removedsCount](self, "removedsCount"))
  {
    objc_msgSend(v16, "clearRemoveds");
    v8 = -[GEORPAccessPointCorrections removedsCount](self, "removedsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPAccessPointCorrections removedAtIndex:](self, "removedAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addRemoved:", v11);

      }
    }
  }
  if (-[GEORPAccessPointCorrections editedsCount](self, "editedsCount"))
  {
    objc_msgSend(v16, "clearEditeds");
    v12 = -[GEORPAccessPointCorrections editedsCount](self, "editedsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEORPAccessPointCorrections editedAtIndex:](self, "editedAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addEdited:", v15);

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
      GEORPAccessPointCorrectionsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPAccessPointCorrections readAll:](self, "readAll:", 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_addeds;
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
        objc_msgSend(v5, "addAdded:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v9);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = self->_removeds;
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
        objc_msgSend(v5, "addRemoved:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v14);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self->_editeds;
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
        objc_msgSend(v5, "addEdited:", v22);

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
  NSMutableArray *addeds;
  NSMutableArray *removeds;
  NSMutableArray *editeds;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPAccessPointCorrections readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         addeds = self->_addeds,
         !((unint64_t)addeds | v4[3]))
     || -[NSMutableArray isEqual:](addeds, "isEqual:"))
    && ((removeds = self->_removeds, !((unint64_t)removeds | v4[5]))
     || -[NSMutableArray isEqual:](removeds, "isEqual:")))
  {
    editeds = self->_editeds;
    if ((unint64_t)editeds | v4[4])
      v8 = -[NSMutableArray isEqual:](editeds, "isEqual:");
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

  -[GEORPAccessPointCorrections readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_addeds, "hash");
  v4 = -[NSMutableArray hash](self->_removeds, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_editeds, "hash");
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
  v5 = v4[3];
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
        -[GEORPAccessPointCorrections addAdded:](self, "addAdded:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++));
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
  v10 = v4[5];
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
        -[GEORPAccessPointCorrections addRemoved:](self, "addRemoved:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
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
  v15 = v4[4];
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
        -[GEORPAccessPointCorrections addEdited:](self, "addEdited:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
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
      GEORPAccessPointCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1);
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
    -[GEORPAccessPointCorrections readAll:](self, "readAll:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_addeds;
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
    v12 = self->_removeds;
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
    v17 = self->_editeds;
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
  objc_storeStrong((id *)&self->_removeds, 0);
  objc_storeStrong((id *)&self->_editeds, 0);
  objc_storeStrong((id *)&self->_addeds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
