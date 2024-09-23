@implementation GEOPDTransitNearbySchedule

+ (id)transitNearbyScheduleForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__GEOPDTransitNearbySchedule_PlaceDataExtras__transitNearbyScheduleForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 79, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __81__GEOPDTransitNearbySchedule_PlaceDataExtras__transitNearbyScheduleForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitNearbySchedule](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDTransitNearbySchedule)init
{
  GEOPDTransitNearbySchedule *v2;
  GEOPDTransitNearbySchedule *v3;
  GEOPDTransitNearbySchedule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitNearbySchedule;
  v2 = -[GEOPDTransitNearbySchedule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitNearbySchedule)initWithData:(id)a3
{
  GEOPDTransitNearbySchedule *v3;
  GEOPDTransitNearbySchedule *v4;
  GEOPDTransitNearbySchedule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitNearbySchedule;
  v3 = -[GEOPDTransitNearbySchedule initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCategorys
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
        GEOPDTransitNearbyScheduleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorys_tags_7039);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)categorys
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitNearbySchedule _readCategorys]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addCategory:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitNearbySchedule _readCategorys](a1);
    -[GEOPDTransitNearbySchedule _addNoFlagsCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 52) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsCategory:(uint64_t)a1
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

- (void)_readGroups
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
        GEOPDTransitNearbyScheduleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGroups_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)groups
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitNearbySchedule _readGroups]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addGroup:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitNearbySchedule _readGroups](a1);
    -[GEOPDTransitNearbySchedule _addNoFlagsGroup:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsGroup:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitNearbySchedule;
  -[GEOPDTransitNearbySchedule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitNearbySchedule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitNearbySchedule _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v28[4];
  id v29;
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
  -[GEOPDTransitNearbySchedule readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = *(id *)(a1 + 24);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("category"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v14 = *(id *)(a1 + 32);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("group"));
  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    objc_msgSend(v21, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __56__GEOPDTransitNearbySchedule__dictionaryRepresentation___block_invoke;
      v28[3] = &unk_1E1C00600;
      v25 = v24;
      v29 = v25;
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v28);
      v26 = v25;

      v23 = v26;
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitNearbySchedule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_7044;
      else
        v6 = (int *)&readAll__nonRecursiveTag_7045;
      GEOPDTransitNearbyScheduleReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTransitNearbyScheduleCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __56__GEOPDTransitNearbySchedule__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitNearbyScheduleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t k;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  os_unfair_lock_s *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  void *v23;
  NSMutableArray *obj;
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
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  v6 = 8;
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = self->_groups;
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v34 != v16)
              objc_enumerationMutation(obj);
            v18 = p_readerLock;
            v19 = v6;
            v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            if (v20)
            {
              os_unfair_lock_lock_with_options();
              os_unfair_lock_assert_owner((const os_unfair_lock *)(v20 + 120));
              v21 = *(_WORD *)(v20 + 144) & 0xFC0;
              os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 120));
              if (v21)
              {

                p_readerLock = v18;
                goto LABEL_3;
              }
            }
            v6 = v19;
            p_readerLock = v18;
          }
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          if (v15)
            continue;
          break;
        }
      }

    }
    v22 = *(id *)((char *)&self->super.super.isa + v6);
    objc_sync_enter(v22);
    *(_QWORD *)(*(char **)((char *)&self->super.super.isa + v6) + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "seekToOffset:", self->_readerMarkPos);
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v6), "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v23);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(p_readerLock);
    -[GEOPDTransitNearbySchedule readAll:]((uint64_t)self, 0);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = self->_categorys;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v8; ++j)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v8);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_groups;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      do
      {
        for (k = 0; k != v12; ++k)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
      }
      while (v12);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
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
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDTransitNearbyScheduleReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitNearbySchedule readAll:]((uint64_t)self, 0);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_categorys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "copyWithZone:", a3);
        -[GEOPDTransitNearbySchedule addCategory:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_groups;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        -[GEOPDTransitNearbySchedule addGroup:]((uint64_t)v5, v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *categorys;
  NSMutableArray *groups;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDTransitNearbySchedule readAll:]((uint64_t)self, 1),
         -[GEOPDTransitNearbySchedule readAll:]((uint64_t)v4, 1),
         categorys = self->_categorys,
         !((unint64_t)categorys | v4[3]))
     || -[NSMutableArray isEqual:](categorys, "isEqual:")))
  {
    groups = self->_groups;
    if ((unint64_t)groups | v4[4])
      v7 = -[NSMutableArray isEqual:](groups, "isEqual:");
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

  -[GEOPDTransitNearbySchedule readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_categorys, "hash");
  return -[NSMutableArray hash](self->_groups, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_categorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
