@implementation GEOPDSearchBrandCountInfo

- (GEOPDSearchBrandCountInfo)init
{
  GEOPDSearchBrandCountInfo *v2;
  GEOPDSearchBrandCountInfo *v3;
  GEOPDSearchBrandCountInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchBrandCountInfo;
  v2 = -[GEOPDSearchBrandCountInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchBrandCountInfo)initWithData:(id)a3
{
  GEOPDSearchBrandCountInfo *v3;
  GEOPDSearchBrandCountInfo *v4;
  GEOPDSearchBrandCountInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchBrandCountInfo;
  v3 = -[GEOPDSearchBrandCountInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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

- (void)_addNoFlagsBrandRelationship:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchBrandCountInfo;
  -[GEOPDSearchBrandCountInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchBrandCountInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBrandCountInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const __CFString *v21;
  char v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  const __CFString *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchBrandCountInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_BYTE *)(a1 + 84) & 8) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchBrandCountInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBrandKey_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v7 = *(id *)(a1 + 16);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("brandKey");
    else
      v8 = CFSTR("brand_key");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
  {
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = v9;
      objc_sync_enter(v10);
      GEOPDSearchBrandCountInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLegacyBrandName_tags);
      objc_sync_exit(v10);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v11 = *(id *)(a1 + 40);
  if (v11)
  {
    if (a2)
      v12 = CFSTR("legacyBrandName");
    else
      v12 = CFSTR("legacy_brand_name");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  if ((*(_BYTE *)(a1 + 84) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("total"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v40 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v16);
    }

    if (a2)
      v21 = CFSTR("countryOccurrence");
    else
      v21 = CFSTR("country_occurrence");
    objc_msgSend(v4, "setObject:forKey:", v14, v21);

  }
  v22 = *(_BYTE *)(a1 + 84);
  if ((v22 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("muid"));

    v22 = *(_BYTE *)(a1 + 84);
  }
  if ((v22 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("parentMuid");
    else
      v25 = CFSTR("parent_muid");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = *(id *)(a1 + 24);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v31, "jsonRepresentation");
          else
            objc_msgSend(v31, "dictionaryRepresentation", (_QWORD)v35);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v32, (_QWORD)v35);

        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v28);
    }

    if (a2)
      v33 = CFSTR("brandRelationship");
    else
      v33 = CFSTR("brand_relationship");
    objc_msgSend(v4, "setObject:forKey:", v26, v33, (_QWORD)v35);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchBrandCountInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_76;
      else
        v6 = (int *)&readAll__nonRecursiveTag_76;
      GEOPDSearchBrandCountInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = *(id *)(a1 + 32);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v18;
        while (1)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          if (!--v8)
          {
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
            if (!v8)
              break;
          }
        }
      }

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v10 = *(id *)(a1 + 24);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v14;
        while (1)
        {
          if (*(_QWORD *)v14 != v12)
            objc_enumerationMutation(v10);
          if (!--v11)
          {
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
            if (!v11)
              break;
          }
        }
      }

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBrandCountInfoReadAllFrom((uint64_t)self, a3);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
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
    -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)self, 0);
    if (self->_brandKey)
      PBDataWriterWriteStringField();
    if (self->_legacyBrandName)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint64Field();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_countryOccurrences;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_brandRelationships;
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

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  GEOPDSearchBrandCountInfo *v8;
  PBDataReader *v9;
  NSMutableArray *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  uint64_t i;
  id v19;
  void *v20;
  id v21;
  char flags;
  uint64_t v23;
  os_unfair_lock_s *v24;
  void *j;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  GEOPDSearchBrandCountInfo *v32;
  NSMutableArray *obj;
  id obja;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v8 = self;
    v9 = reader;
    objc_sync_enter(v9);
    if ((*(_BYTE *)&v8->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)v8->_reader + (int)*MEMORY[0x1E0D82BD8]) = v8->_readerMarkLength;
      -[PBDataReader seekToOffset:](v8->_reader, "seekToOffset:", v8->_readerMarkPos);
      GEOPDSearchBrandCountInfoReadAllFrom(v5, v8->_reader);
      os_unfair_lock_unlock(p_readerLock);
      v10 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v9);

      goto LABEL_33;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)self, 0);
  v11 = -[NSString copyWithZone:](self->_brandKey, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  v13 = -[NSString copyWithZone:](self->_legacyBrandName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_QWORD *)(v5 + 64) = self->_total;
    *(_BYTE *)(v5 + 84) |= 4u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v32 = self;
  obj = self->_countryOccurrences;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v40;
    v17 = (os_unfair_lock_s *)(v5 + 80);
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(obj);
        v19 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "copyWithZone:", a3, v32);
        os_unfair_lock_lock(v17);
        if ((*(_BYTE *)(v5 + 84) & 0x20) == 0)
        {
          v20 = *(void **)(v5 + 8);
          if (v20)
          {
            v21 = v20;
            objc_sync_enter(v21);
            GEOPDSearchBrandCountInfoReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readCountryOccurrences_tags);
            objc_sync_exit(v21);

          }
        }
        os_unfair_lock_unlock(v17);
        -[GEOPDSearchBrandCountInfo _addNoFlagsCountryOccurrence:](v5, v19);

        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v5 + 84) |= 0x20u;
        os_unfair_lock_unlock(v17);
        *(_BYTE *)(v5 + 84) |= 0x80u;

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v15);
  }

  flags = (char)v32->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 48) = v32->_muid;
    *(_BYTE *)(v5 + 84) |= 1u;
    flags = (char)v32->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 56) = v32->_parentMuid;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v32->_brandRelationships;
  obja = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (obja)
  {
    v23 = *(_QWORD *)v36;
    v24 = (os_unfair_lock_s *)(v5 + 80);
    do
    {
      for (j = 0; j != obja; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v10);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        v27 = v26;
        if (v5)
        {
          v28 = v26;
          os_unfair_lock_lock(v24);
          if ((*(_BYTE *)(v5 + 84) & 0x10) == 0)
          {
            v29 = *(void **)(v5 + 8);
            if (v29)
            {
              v30 = v29;
              objc_sync_enter(v30);
              GEOPDSearchBrandCountInfoReadSpecified(v5, *(_QWORD *)(v5 + 8), (int *)&_readBrandRelationships_tags);
              objc_sync_exit(v30);

            }
          }
          os_unfair_lock_unlock(v24);
          -[GEOPDSearchBrandCountInfo _addNoFlagsBrandRelationship:](v5, v28);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 84) |= 0x10u;
          os_unfair_lock_unlock(v24);
          *(_BYTE *)(v5 + 84) |= 0x80u;
        }

      }
      obja = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (obja);
  }
LABEL_33:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *brandKey;
  NSString *legacyBrandName;
  char flags;
  char v8;
  NSMutableArray *countryOccurrences;
  NSMutableArray *brandRelationships;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)self, 1);
  -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)v4, 1);
  brandKey = self->_brandKey;
  if ((unint64_t)brandKey | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](brandKey, "isEqual:"))
      goto LABEL_26;
  }
  legacyBrandName = self->_legacyBrandName;
  if ((unint64_t)legacyBrandName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](legacyBrandName, "isEqual:"))
      goto LABEL_26;
  }
  flags = (char)self->_flags;
  v8 = *((_BYTE *)v4 + 84);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0 || self->_total != *((_QWORD *)v4 + 8))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_26;
  }
  countryOccurrences = self->_countryOccurrences;
  if ((unint64_t)countryOccurrences | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](countryOccurrences, "isEqual:"))
    {
LABEL_26:
      v11 = 0;
      goto LABEL_27;
    }
    flags = (char)self->_flags;
    v8 = *((_BYTE *)v4 + 84);
  }
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_muid != *((_QWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_parentMuid != *((_QWORD *)v4 + 7))
      goto LABEL_26;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_26;
  }
  brandRelationships = self->_brandRelationships;
  if ((unint64_t)brandRelationships | *((_QWORD *)v4 + 3))
    v11 = -[NSMutableArray isEqual:](brandRelationships, "isEqual:");
  else
    v11 = 1;
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEOPDSearchBrandCountInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_brandKey, "hash");
  v4 = -[NSString hash](self->_legacyBrandName, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v5 = 2654435761u * self->_total;
  else
    v5 = 0;
  v6 = -[NSMutableArray hash](self->_countryOccurrences, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7 = 2654435761u * self->_muid;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSMutableArray hash](self->_brandRelationships, "hash");
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761u * self->_parentMuid;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSMutableArray hash](self->_brandRelationships, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyBrandName, 0);
  objc_storeStrong((id *)&self->_countryOccurrences, 0);
  objc_storeStrong((id *)&self->_brandRelationships, 0);
  objc_storeStrong((id *)&self->_brandKey, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
