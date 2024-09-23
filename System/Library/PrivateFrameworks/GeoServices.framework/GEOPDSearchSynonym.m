@implementation GEOPDSearchSynonym

- (GEOPDSearchSynonym)init
{
  GEOPDSearchSynonym *v2;
  GEOPDSearchSynonym *v3;
  GEOPDSearchSynonym *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSynonym;
  v2 = -[GEOPDSearchSynonym init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSynonym)initWithData:(id)a3
{
  GEOPDSearchSynonym *v3;
  GEOPDSearchSynonym *v4;
  GEOPDSearchSynonym *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSynonym;
  v3 = -[GEOPDSearchSynonym initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addSynFeatureMap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchSynonymReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSynFeatureMaps_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchSynonym _addNoFlagsSynFeatureMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsSynFeatureMap:(uint64_t)a1
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

- (void)addTokenList:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchSynonymReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenLists_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchSynonym _addNoFlagsTokenList:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsTokenList:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchSynonym;
  -[GEOPDSearchSynonym description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchSynonym dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSynonym _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  id v28;
  const __CFString *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchSynonym readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 52);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("confidence"));

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = *(id *)(a1 + 16);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v9);
    }

    if (a2)
      v14 = CFSTR("synFeatureMap");
    else
      v14 = CFSTR("syn_feature_map");
    objc_msgSend(v4, "setObject:forKey:", v7, v14);

  }
  if ((*(_BYTE *)(a1 + 60) & 2) != 0)
  {
    v15 = *(int *)(a1 + 56);
    if (v15 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 56));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E1C0AAD8[v15];
    }
    if (a2)
      v17 = CFSTR("rewriteProvider");
    else
      v17 = CFSTR("rewrite_provider");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = *(id *)(a1 + 32);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("tokenList");
    else
      v25 = CFSTR("token_list");
    objc_msgSend(v4, "setObject:forKey:", v18, v25);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 60) & 8) == 0)
  {
    v26 = *(void **)(a1 + 8);
    if (v26)
    {
      v27 = v26;
      objc_sync_enter(v27);
      GEOPDSearchSynonymReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSynonymText_tags);
      objc_sync_exit(v27);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v28 = *(id *)(a1 + 24);
  if (v28)
  {
    if (a2)
      v29 = CFSTR("synonymText");
    else
      v29 = CFSTR("synonym_text");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSynonym _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_1775;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1776;
      GEOPDSearchSynonymReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchSynonymCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSynonymReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3C) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchSynonym readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteFloatField();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_synFeatureMaps;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_tokenLists;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_synonymText)
      PBDataWriterWriteStringField();
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
  uint64_t v19;
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
      GEOPDSearchSynonymReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchSynonym readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(float *)(v5 + 52) = self->_confidence;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_synFeatureMaps;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchSynonym addSynFeatureMap:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_rewriteProvider;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_tokenLists;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        -[GEOPDSearchSynonym addTokenList:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  v19 = -[NSString copyWithZone:](self->_synonymText, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v19;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSMutableArray *synFeatureMaps;
  NSMutableArray *tokenLists;
  NSString *synonymText;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDSearchSynonym readAll:]((uint64_t)self, 1);
  -[GEOPDSearchSynonym readAll:]((uint64_t)v4, 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 60);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_confidence != *((float *)v4 + 13))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_19;
  }
  synFeatureMaps = self->_synFeatureMaps;
  if ((unint64_t)synFeatureMaps | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](synFeatureMaps, "isEqual:"))
    {
LABEL_19:
      v10 = 0;
      goto LABEL_20;
    }
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_rewriteProvider != *((_DWORD *)v4 + 14))
      goto LABEL_19;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_19;
  }
  tokenLists = self->_tokenLists;
  if ((unint64_t)tokenLists | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](tokenLists, "isEqual:"))
  {
    goto LABEL_19;
  }
  synonymText = self->_synonymText;
  if ((unint64_t)synonymText | *((_QWORD *)v4 + 3))
    v10 = -[NSString isEqual:](synonymText, "isEqual:");
  else
    v10 = 1;
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  float confidence;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  -[GEOPDSearchSynonym readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    confidence = self->_confidence;
    v5 = confidence;
    if (confidence < 0.0)
      v5 = -confidence;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSMutableArray hash](self->_synFeatureMaps, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v9 = 2654435761 * self->_rewriteProvider;
  else
    v9 = 0;
  v10 = v8 ^ v3 ^ v9;
  v11 = -[NSMutableArray hash](self->_tokenLists, "hash");
  return v10 ^ v11 ^ -[NSString hash](self->_synonymText, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenLists, 0);
  objc_storeStrong((id *)&self->_synonymText, 0);
  objc_storeStrong((id *)&self->_synFeatureMaps, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
