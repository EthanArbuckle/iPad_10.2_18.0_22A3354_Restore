@implementation GEOURLPresent

- (GEOURLPresent)init
{
  GEOURLPresent *v2;
  GEOURLPresent *v3;
  GEOURLPresent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOURLPresent;
  v2 = -[GEOURLPresent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLPresent)initWithData:(id)a3
{
  GEOURLPresent *v3;
  GEOURLPresent *v4;
  GEOURLPresent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOURLPresent;
  v3 = -[GEOURLPresent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readItems
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLPresentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readItems_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (id)items
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOURLPresent _readItems]((uint64_t)a1);
    a1 = (id *)v1[2];
  }
  return a1;
}

- (void)addItem:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOURLPresent _readItems](a1);
    -[GEOURLPresent _addNoFlagsItem:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 44) |= 1u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(_BYTE *)(a1 + 44) |= 4u;
  }
}

- (void)_addNoFlagsItem:(uint64_t)a1
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

- (void)_readOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOURLPresentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (id)options
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOURLPresent _readOptions]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setOptions:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 44) |= 2u;
    *(_BYTE *)(a1 + 44) |= 4u;
    objc_storeStrong((id *)(a1 + 24), a2);
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
  v8.super_class = (Class)GEOURLPresent;
  -[GEOURLPresent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOURLPresent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLPresent _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
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
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOURLPresent readAll:]((uint64_t)a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[2], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = a1[2];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v17);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("item"));
  }
  -[GEOURLPresent options](a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("options"), (_QWORD)v17);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOURLPresent _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_278;
      else
        v6 = (int *)&readAll__nonRecursiveTag_279;
      GEOURLPresentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = *(id *)(a1 + 16);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v7);
            -[GEOURLItem readAll:](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), 1);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1, (_QWORD)v11);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLPresentReadAllFrom((uint64_t)self, a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  os_unfair_lock_s *v15;
  char IsDirty;
  PBDataReader *v17;
  void *v18;
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
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_3;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 5) != 0)
    goto LABEL_3;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((GEOURLOptionsIsDirty((os_unfair_lock_s *)self->_options) & 1) != 0)
    {
LABEL_3:
      os_unfair_lock_unlock(&self->_readerLock);
      -[GEOURLPresent readAll:]((uint64_t)self, 0);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = self->_items;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v7);
            PBDataWriterWriteSubmessage();
          }
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v8);
      }

      if (self->_options)
        PBDataWriterWriteSubmessage();
      goto LABEL_12;
    }
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = self->_items;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v11);
          v15 = *(os_unfair_lock_s **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if (v15)
          {
            os_unfair_lock_lock_with_options();
            IsDirty = _GEOURLItemIsDirty((uint64_t)v15);
            os_unfair_lock_unlock(v15 + 10);
            if ((IsDirty & 1) != 0)
            {

              goto LABEL_3;
            }
          }
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v12)
          continue;
        break;
      }
    }

  }
  v17 = self->_reader;
  objc_sync_enter(v17);
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeData:", v18);
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v17);
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOURLPresentReadAllFrom((uint64_t)v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOURLPresent readAll:]((uint64_t)self, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_items;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v16);
        -[GEOURLPresent addItem:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[GEOURLOptions copyWithZone:](self->_options, "copyWithZone:", a3);
  v14 = (void *)v5[3];
  v5[3] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *items;
  GEOURLOptions *options;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOURLPresent readAll:]((uint64_t)self, 1),
         -[GEOURLPresent readAll:]((uint64_t)v4, 1),
         items = self->_items,
         !((unint64_t)items | v4[2]))
     || -[NSMutableArray isEqual:](items, "isEqual:")))
  {
    options = self->_options;
    if ((unint64_t)options | v4[3])
      v7 = -[GEOURLOptions isEqual:](options, "isEqual:");
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

  -[GEOURLPresent readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_items, "hash");
  return -[GEOURLOptions hash](self->_options, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOURLPresent)initWithOptions:(id)a3
{
  GEOURLOptions *v4;
  GEOURLPresent *v5;
  GEOURLOptions *v6;
  void *v7;
  void *v8;
  GEOURLPresent *v9;
  objc_super v11;

  v4 = (GEOURLOptions *)a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOURLPresent;
  v5 = -[GEOURLPresent init](&v11, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v8)
    {
      v4 = v6;
      if (!v6)
        v4 = objc_alloc_init(GEOURLOptions);
      if (!-[GEOURLOptions hasReferralIdentifier](v4, "hasReferralIdentifier"))
        -[GEOURLOptions setReferralIdentifier:](v4, "setReferralIdentifier:", v8);
    }

    if (-[GEOURLOptions hasCamera](v4, "hasCamera") && -[GEOURLOptions hasCenterSpan](v4, "hasCenterSpan"))
      -[GEOURLOptions setCenterSpan:](v4, "setCenterSpan:", 0);
    -[GEOURLPresent setOptions:]((uint64_t)v5, v4);
    v9 = v5;
  }

  return v5;
}

- (GEOURLPresent)initWithDirectionsOptions:(id)a3
{
  id v4;
  void *v5;
  GEOURLPresent *v6;
  GEOURLOptions *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (!objc_msgSend(v4, "hasTransportType") || objc_msgSend(v5, "transportType") == 4)
      objc_msgSend(v5, "setTransportType:", 0);
    v6 = -[GEOURLPresent initWithOptions:](self, "initWithOptions:", v5);
  }
  else
  {
    v7 = objc_alloc_init(GEOURLOptions);
    -[GEOURLOptions setTransportType:](v7, "setTransportType:", 0);
    v6 = -[GEOURLPresent initWithOptions:](self, "initWithOptions:", v7);

  }
  return v6;
}

@end
