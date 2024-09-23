@implementation GEOPDSearchSearchChainInfo

- (GEOPDSearchSearchChainInfo)init
{
  GEOPDSearchSearchChainInfo *v2;
  GEOPDSearchSearchChainInfo *v3;
  GEOPDSearchSearchChainInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSearchChainInfo;
  v2 = -[GEOPDSearchSearchChainInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSearchChainInfo)initWithData:(id)a3
{
  GEOPDSearchSearchChainInfo *v3;
  GEOPDSearchSearchChainInfo *v4;
  GEOPDSearchSearchChainInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSearchChainInfo;
  v3 = -[GEOPDSearchSearchChainInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTriggers
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchSearchChainInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTriggers_tags_122);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)_addNoFlagsTrigger:(uint64_t)a1
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

- (void)_addNoFlagsCountryOccurrence:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchSearchChainInfo;
  -[GEOPDSearchSearchChainInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchSearchChainInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSearchChainInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  const __CFString *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchSearchChainInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 8) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchSearchChainInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchChainKey_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v7 = *(id *)(a1 + 32);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("searchChainKey");
    else
      v8 = CFSTR("search_chain_key");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    -[GEOPDSearchSearchChainInfo _readTriggers](a1);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("trigger"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = *(id *)(a1 + 24);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation", (_QWORD)v24);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16, (_QWORD)v24);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("countryOccurrence");
    else
      v17 = CFSTR("country_occurrence");
    objc_msgSend(v4, "setObject:forKey:", v10, v17, (_QWORD)v24);

  }
  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("total"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 2) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = v19;
      objc_sync_enter(v20);
      GEOPDSearchSearchChainInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandKey_tags_124);
      objc_sync_exit(v20);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v21 = *(id *)(a1 + 16);
  if (v21)
  {
    if (a2)
      v22 = CFSTR("brandKey");
    else
      v22 = CFSTR("brand_key");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSearchChainInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;
  id v7;
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_129_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_130_0;
      GEOPDSearchSearchChainInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = *(id *)(a1 + 24);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v11;
        while (1)
        {
          if (*(_QWORD *)v11 != v9)
            objc_enumerationMutation(v7);
          if (!--v8)
          {
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
            if (!v8)
              break;
          }
        }
      }

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSearchChainInfoReadAllFrom((uint64_t)self, a3);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3E) == 0))
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
    -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)self, 0);
    if (self->_searchChainKey)
      PBDataWriterWriteStringField();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_triggers;
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
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_countryOccurrences;
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

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_brandKey)
      PBDataWriterWriteStringField();
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  os_unfair_lock_s *v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  GEOPDSearchSearchChainInfo *v27;
  NSMutableArray *obj;
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
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
      GEOPDSearchSearchChainInfoReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_27;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_searchChainKey, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v27 = self;
  v11 = self->_triggers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v11);
        v15 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchSearchChainInfo _readTriggers](v5);
        -[GEOPDSearchSearchChainInfo _addNoFlagsTrigger:](v5, v15);

        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v5 + 68) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
        *(_BYTE *)(v5 + 68) |= 0x20u;

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_countryOccurrences;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v30;
    v18 = (os_unfair_lock_s *)(v5 + 64);
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(obj);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3);
        v21 = v20;
        if (v5)
        {
          v22 = v20;
          os_unfair_lock_lock(v18);
          if ((*(_BYTE *)(v5 + 68) & 4) == 0)
          {
            v23 = *(void **)(v5 + 8);
            if (v23)
            {
              v24 = v23;
              objc_sync_enter(v24);
              GEOPDSearchSearchChainInfoReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readCountryOccurrences_tags_123);
              objc_sync_exit(v24);

            }
          }
          os_unfair_lock_unlock(v18);
          -[GEOPDSearchSearchChainInfo _addNoFlagsCountryOccurrence:](v5, v22);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 68) |= 4u;
          os_unfair_lock_unlock(v18);
          *(_BYTE *)(v5 + 68) |= 0x20u;
        }

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v16);
  }

  if ((*(_BYTE *)&v27->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = v27->_total;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v25 = -[NSString copyWithZone:](v27->_brandKey, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;
LABEL_27:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *searchChainKey;
  NSMutableArray *triggers;
  NSMutableArray *countryOccurrences;
  NSString *brandKey;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)v4, 1);
  searchChainKey = self->_searchChainKey;
  if ((unint64_t)searchChainKey | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](searchChainKey, "isEqual:"))
      goto LABEL_15;
  }
  triggers = self->_triggers;
  if ((unint64_t)triggers | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](triggers, "isEqual:"))
      goto LABEL_15;
  }
  countryOccurrences = self->_countryOccurrences;
  if ((unint64_t)countryOccurrences | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](countryOccurrences, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_total != *((_QWORD *)v4 + 5))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  brandKey = self->_brandKey;
  if ((unint64_t)brandKey | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](brandKey, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[GEOPDSearchSearchChainInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_searchChainKey, "hash");
  v4 = -[NSMutableArray hash](self->_triggers, "hash");
  v5 = -[NSMutableArray hash](self->_countryOccurrences, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761u * self->_total;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_brandKey, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_searchChainKey, 0);
  objc_storeStrong((id *)&self->_countryOccurrences, 0);
  objc_storeStrong((id *)&self->_brandKey, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
