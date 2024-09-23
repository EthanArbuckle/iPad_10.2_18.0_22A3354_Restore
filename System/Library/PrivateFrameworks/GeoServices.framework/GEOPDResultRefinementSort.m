@implementation GEOPDResultRefinementSort

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 4u;
    *(_BYTE *)(a1 + 60) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementSort readAll:](a1, 0);
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 32);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            -[GEOPDResultRefinementSortElement clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (GEOPDResultRefinementSort)init
{
  GEOPDResultRefinementSort *v2;
  GEOPDResultRefinementSort *v3;
  GEOPDResultRefinementSort *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementSort;
  v2 = -[GEOPDResultRefinementSort init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementSort)initWithData:(id)a3
{
  GEOPDResultRefinementSort *v3;
  GEOPDResultRefinementSort *v4;
  GEOPDResultRefinementSort *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementSort;
  v3 = -[GEOPDResultRefinementSort initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
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
        GEOPDResultRefinementSortReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_898);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)displayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementSort _readDisplayName]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 60) |= 8u;
    *(_BYTE *)(a1 + 60) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)_readSorts
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
        GEOPDResultRefinementSortReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSorts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)sorts
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinementSort _readSorts]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addSort:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDResultRefinementSort _readSorts](a1);
    -[GEOPDResultRefinementSort _addNoFlagsSort:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsSort:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDResultRefinementSort;
  -[GEOPDResultRefinementSort description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSort dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementSort _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDResultRefinementSort readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementSort displayName]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("displayName");
    else
      v6 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("sort"));
  }
  v15 = *(_BYTE *)(a1 + 60);
  if ((v15 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("selectedElementIndex");
    else
      v17 = CFSTR("selected_element_index");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v15 = *(_BYTE *)(a1 + 60);
  }
  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("defaultSelectedElementIndex");
    else
      v19 = CFSTR("default_selected_element_index");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(void **)(a1 + 16);
  if (v20)
  {
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __55__GEOPDResultRefinementSort__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v24 = v23;
      v28 = v24;
      objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
      v25 = v24;

      v22 = v25;
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinementSort _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_908;
      else
        v6 = (int *)&readAll__nonRecursiveTag_909;
      GEOPDResultRefinementSortReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDResultRefinementSortCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __55__GEOPDResultRefinementSort__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDResultRefinementSortReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
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
  if (self->_reader && (_GEOPDResultRefinementSortIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDResultRefinementSort readAll:]((uint64_t)self, 0);
    if (self->_displayName)
      PBDataWriterWriteStringField();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_sorts;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char flags;
  PBUnknownFields *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
      GEOPDResultRefinementSortReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementSort readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_sorts;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        -[GEOPDResultRefinementSort addSort:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_selectedElementIndex;
    *(_BYTE *)(v5 + 60) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_defaultSelectedElementIndex;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_17:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *displayName;
  NSMutableArray *sorts;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDResultRefinementSort readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementSort readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_15;
  }
  sorts = self->_sorts;
  if ((unint64_t)sorts | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](sorts, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_selectedElementIndex != *((_DWORD *)v4 + 14))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_defaultSelectedElementIndex != *((_DWORD *)v4 + 13))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDResultRefinementSort readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_displayName, "hash");
  v4 = -[NSMutableArray hash](self->_sorts, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761 * self->_selectedElementIndex;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_defaultSelectedElementIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sorts, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
