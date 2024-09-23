@implementation GEORPFeedbackTextListField

- (GEORPFeedbackTextListField)init
{
  GEORPFeedbackTextListField *v2;
  GEORPFeedbackTextListField *v3;
  GEORPFeedbackTextListField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTextListField;
  v2 = -[GEORPFeedbackTextListField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTextListField)initWithData:(id)a3
{
  GEORPFeedbackTextListField *v3;
  GEORPFeedbackTextListField *v4;
  GEORPFeedbackTextListField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTextListField;
  v3 = -[GEORPFeedbackTextListField initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackTextListFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddeds_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)addeds
{
  -[GEORPFeedbackTextListField _readAddeds]((uint64_t)self);
  return self->_addeds;
}

- (void)setAddeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *addeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  addeds = self->_addeds;
  self->_addeds = v4;

}

- (void)clearAddeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_addeds, "removeAllObjects");
}

- (void)addAdded:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackTextListField _readAddeds]((uint64_t)self);
  -[GEORPFeedbackTextListField _addNoFlagsAdded:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
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

- (unint64_t)addedsCount
{
  -[GEORPFeedbackTextListField _readAddeds]((uint64_t)self);
  return -[NSMutableArray count](self->_addeds, "count");
}

- (id)addedAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackTextListField _readAddeds]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackTextListFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRemoveds_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)removeds
{
  -[GEORPFeedbackTextListField _readRemoveds]((uint64_t)self);
  return self->_removeds;
}

- (void)setRemoveds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *removeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  removeds = self->_removeds;
  self->_removeds = v4;

}

- (void)clearRemoveds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_removeds, "removeAllObjects");
}

- (void)addRemoved:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackTextListField _readRemoveds]((uint64_t)self);
  -[GEORPFeedbackTextListField _addNoFlagsRemoved:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
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

- (unint64_t)removedsCount
{
  -[GEORPFeedbackTextListField _readRemoveds]((uint64_t)self);
  return -[NSMutableArray count](self->_removeds, "count");
}

- (id)removedAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackTextListField _readRemoveds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_removeds, "objectAtIndex:", a3);
}

+ (Class)removedType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginals
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackTextListFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginals_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)originals
{
  -[GEORPFeedbackTextListField _readOriginals]((uint64_t)self);
  return self->_originals;
}

- (void)setOriginals:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *originals;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  originals = self->_originals;
  self->_originals = v4;

}

- (void)clearOriginals
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  -[NSMutableArray removeAllObjects](self->_originals, "removeAllObjects");
}

- (void)addOriginal:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackTextListField _readOriginals]((uint64_t)self);
  -[GEORPFeedbackTextListField _addNoFlagsOriginal:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (void)_addNoFlagsOriginal:(uint64_t)a1
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

- (unint64_t)originalsCount
{
  -[GEORPFeedbackTextListField _readOriginals]((uint64_t)self);
  return -[NSMutableArray count](self->_originals, "count");
}

- (id)originalAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackTextListField _readOriginals]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_originals, "objectAtIndex:", a3);
}

+ (Class)originalType
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
  v8.super_class = (Class)GEORPFeedbackTextListField;
  -[GEORPFeedbackTextListField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackTextListField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[2])
    {
      objc_msgSend(a1, "addeds");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("added"));

    }
    if (a1[4])
    {
      objc_msgSend(a1, "removeds");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("removed"));

    }
    if (a1[3])
    {
      objc_msgSend(a1, "originals");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("original"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEORPFeedbackTextListField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTextListField *)-[GEORPFeedbackTextListField _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("added"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v38;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v38 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v11 = (void *)objc_msgSend(v10, "copy");
                objc_msgSend(a1, "addAdded:", v11);

              }
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
          }
          while (v7);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("removed"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v34;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v34 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = (void *)objc_msgSend(v18, "copy");
                objc_msgSend(a1, "addRemoved:", v19);

              }
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v15);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("original"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v30;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v30 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v25);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = (void *)objc_msgSend(v26, "copy", (_QWORD)v29);
                objc_msgSend(a1, "addOriginal:", v27);

              }
              ++v25;
            }
            while (v23 != v25);
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          }
          while (v23);
        }

      }
    }
  }

  return a1;
}

- (GEORPFeedbackTextListField)initWithJSON:(id)a3
{
  return (GEORPFeedbackTextListField *)-[GEORPFeedbackTextListField _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_797;
    else
      v8 = (int *)&readAll__nonRecursiveTag_798;
    GEORPFeedbackTextListFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTextListFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTextListFieldReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xF) == 0))
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
    -[GEORPFeedbackTextListField readAll:](self, "readAll:", 0);
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
          PBDataWriterWriteStringField();
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
          PBDataWriterWriteStringField();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_originals;
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
          PBDataWriterWriteStringField();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

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
  -[GEORPFeedbackTextListField readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 10) = self->_readerMarkPos;
  *((_DWORD *)v16 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPFeedbackTextListField addedsCount](self, "addedsCount"))
  {
    objc_msgSend(v16, "clearAddeds");
    v4 = -[GEORPFeedbackTextListField addedsCount](self, "addedsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackTextListField addedAtIndex:](self, "addedAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addAdded:", v7);

      }
    }
  }
  if (-[GEORPFeedbackTextListField removedsCount](self, "removedsCount"))
  {
    objc_msgSend(v16, "clearRemoveds");
    v8 = -[GEORPFeedbackTextListField removedsCount](self, "removedsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPFeedbackTextListField removedAtIndex:](self, "removedAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addRemoved:", v11);

      }
    }
  }
  if (-[GEORPFeedbackTextListField originalsCount](self, "originalsCount"))
  {
    objc_msgSend(v16, "clearOriginals");
    v12 = -[GEORPFeedbackTextListField originalsCount](self, "originalsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEORPFeedbackTextListField originalAtIndex:](self, "originalAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addOriginal:", v15);

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
      GEORPFeedbackTextListFieldReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackTextListField readAll:](self, "readAll:", 0);
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
  v18 = self->_originals;
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
        objc_msgSend(v5, "addOriginal:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v19);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *addeds;
  NSMutableArray *removeds;
  NSMutableArray *originals;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEORPFeedbackTextListField readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         addeds = self->_addeds,
         !((unint64_t)addeds | v4[2]))
     || -[NSMutableArray isEqual:](addeds, "isEqual:"))
    && ((removeds = self->_removeds, !((unint64_t)removeds | v4[4]))
     || -[NSMutableArray isEqual:](removeds, "isEqual:")))
  {
    originals = self->_originals;
    if ((unint64_t)originals | v4[3])
      v8 = -[NSMutableArray isEqual:](originals, "isEqual:");
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

  -[GEORPFeedbackTextListField readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_addeds, "hash");
  v4 = -[NSMutableArray hash](self->_removeds, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_originals, "hash");
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
  v5 = v4[2];
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
        -[GEORPFeedbackTextListField addAdded:](self, "addAdded:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9++));
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
  v10 = v4[4];
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
        -[GEORPFeedbackTextListField addRemoved:](self, "addRemoved:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
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
  v15 = v4[3];
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
        -[GEORPFeedbackTextListField addOriginal:](self, "addOriginal:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++), (_QWORD)v20);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeds, 0);
  objc_storeStrong((id *)&self->_originals, 0);
  objc_storeStrong((id *)&self->_addeds, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
