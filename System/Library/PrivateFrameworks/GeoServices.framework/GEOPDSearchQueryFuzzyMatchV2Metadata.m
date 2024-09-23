@implementation GEOPDSearchQueryFuzzyMatchV2Metadata

- (GEOPDSearchQueryFuzzyMatchV2Metadata)init
{
  GEOPDSearchQueryFuzzyMatchV2Metadata *v2;
  GEOPDSearchQueryFuzzyMatchV2Metadata *v3;
  GEOPDSearchQueryFuzzyMatchV2Metadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryFuzzyMatchV2Metadata;
  v2 = -[GEOPDSearchQueryFuzzyMatchV2Metadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryFuzzyMatchV2Metadata)initWithData:(id)a3
{
  GEOPDSearchQueryFuzzyMatchV2Metadata *v3;
  GEOPDSearchQueryFuzzyMatchV2Metadata *v4;
  GEOPDSearchQueryFuzzyMatchV2Metadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryFuzzyMatchV2Metadata;
  v3 = -[GEOPDSearchQueryFuzzyMatchV2Metadata initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedDoubleClear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryFuzzyMatchV2Metadata;
  -[GEOPDSearchQueryFuzzyMatchV2Metadata dealloc](&v3, sel_dealloc);
}

- (void)_readRewrittenQueries
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_BYTE *)(a1 + 96) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRewrittenQueries_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
}

- (void)addRewrittenQueries:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchQueryFuzzyMatchV2Metadata _readRewrittenQueries](a1);
    -[GEOPDSearchQueryFuzzyMatchV2Metadata _addNoFlagsRewrittenQueries:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 96) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_BYTE *)(a1 + 96) |= 0x40u;
  }
}

- (void)_addNoFlagsRewrittenQueries:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addRewrittenQueryTokens:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRewrittenQueryTokens_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDSearchQueryFuzzyMatchV2Metadata _addNoFlagsRewrittenQueryTokens:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 96) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_BYTE *)(a1 + 96) |= 0x40u;
  }
}

- (void)_addNoFlagsRewrittenQueryTokens:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v5;

      v4 = *(void **)(a1 + 72);
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
  v8.super_class = (Class)GEOPDSearchQueryFuzzyMatchV2Metadata;
  -[GEOPDSearchQueryFuzzyMatchV2Metadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryFuzzyMatchV2Metadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryFuzzyMatchV2Metadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 64))
  {
    -[GEOPDSearchQueryFuzzyMatchV2Metadata _readRewrittenQueries](a1);
    v5 = *(id *)(a1 + 64);
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("rewrittenQueries"));

  }
  v6 = *(_BYTE *)(a1 + 96);
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 93));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("useFuzzyV1"));

    v6 = *(_BYTE *)(a1 + 96);
  }
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("pruneFuzzyV2Results"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedDoubleNSArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("fuzzyV2Scores"));

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 48))
    {
      v12 = 0;
      do
      {
        v13 = *(int *)(*v11 + 4 * v12);
        if (v13 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = off_1E1C0A738[v13];
        }
        objc_msgSend(v10, "addObject:", v14);

        ++v12;
        v11 = (_QWORD *)(a1 + 40);
      }
      while (v12 < *(_QWORD *)(a1 + 48));
    }
    if (a2)
      v15 = CFSTR("rewriteTypes");
    else
      v15 = CFSTR("rewrite_types");
    objc_msgSend(v4, "setObject:forKey:", v10, v15);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = *(id *)(a1 + 72);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("rewrittenQueryTokens"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryFuzzyMatchV2Metadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1005;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1006;
      GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchQueryFuzzyMatchV2MetadataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryFuzzyMatchV2MetadataReadAllFrom((uint64_t)self, a3, 0);
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
  unint64_t v11;
  unint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
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
  if (self->_reader && (_GEOPDSearchQueryFuzzyMatchV2MetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v18);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)self, 0);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = self->_rewrittenQueries;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_fuzzyV2Scores.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v11;
      }
      while (v11 < self->_fuzzyV2Scores.count);
    }
    if (self->_rewriteTypes.count)
    {
      v12 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v12;
      }
      while (v12 < self->_rewriteTypes.count);
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = self->_rewrittenQueryTokens;
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
          PBDataWriterWriteSubmessage();
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char flags;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
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
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchQueryFuzzyMatchV2MetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)self, 0);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = self->_rewrittenQueries;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchQueryFuzzyMatchV2Metadata addRewrittenQueries:]((uint64_t)v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[93] = self->_useFuzzyV1;
    v5[96] |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v5[92] = self->_pruneFuzzyV2Results;
    v5[96] |= 1u;
  }
  PBRepeatedDoubleCopy();
  PBRepeatedInt32Copy();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_rewrittenQueryTokens;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v8);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v20);
        -[GEOPDSearchQueryFuzzyMatchV2Metadata addRewrittenQueryTokens:]((uint64_t)v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }
LABEL_23:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *rewrittenQueries;
  NSMutableArray *rewrittenQueryTokens;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)v4, 1);
  rewrittenQueries = self->_rewrittenQueries;
  if ((unint64_t)rewrittenQueries | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](rewrittenQueries, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0)
      goto LABEL_24;
    if (self->_useFuzzyV1)
    {
      if (!*((_BYTE *)v4 + 93))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 93))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) != 0)
    {
      if (self->_pruneFuzzyV2Results)
      {
        if (!*((_BYTE *)v4 + 92))
          goto LABEL_24;
        goto LABEL_20;
      }
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_20;
    }
LABEL_24:
    v7 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 96) & 1) != 0)
    goto LABEL_24;
LABEL_20:
  if (!PBRepeatedDoubleIsEqual() || !PBRepeatedInt32IsEqual())
    goto LABEL_24;
  rewrittenQueryTokens = self->_rewrittenQueryTokens;
  if ((unint64_t)rewrittenQueryTokens | *((_QWORD *)v4 + 9))
    v7 = -[NSMutableArray isEqual:](rewrittenQueryTokens, "isEqual:");
  else
    v7 = 1;
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPDSearchQueryFuzzyMatchV2Metadata readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_rewrittenQueries, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_useFuzzyV1;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_pruneFuzzyV2Results;
LABEL_6:
  v6 = v4 ^ v3;
  v7 = v5 ^ PBRepeatedDoubleHash();
  v8 = v7 ^ PBRepeatedInt32Hash();
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_rewrittenQueryTokens, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenQueryTokens, 0);
  objc_storeStrong((id *)&self->_rewrittenQueries, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
