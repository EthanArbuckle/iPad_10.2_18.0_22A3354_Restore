@implementation GEOPDSearchBusinessIntent

- (GEOPDSearchBusinessIntent)init
{
  GEOPDSearchBusinessIntent *v2;
  GEOPDSearchBusinessIntent *v3;
  GEOPDSearchBusinessIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchBusinessIntent;
  v2 = -[GEOPDSearchBusinessIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchBusinessIntent)initWithData:(id)a3
{
  GEOPDSearchBusinessIntent *v3;
  GEOPDSearchBusinessIntent *v4;
  GEOPDSearchBusinessIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchBusinessIntent;
  v3 = -[GEOPDSearchBusinessIntent initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchBusinessIntent;
  -[GEOPDSearchBusinessIntent dealloc](&v3, sel_dealloc);
}

- (void)_readCenter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchBusinessIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCenter_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)addKeywordMapping:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 96) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchBusinessIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKeywordMappings_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDSearchBusinessIntent _addNoFlagsKeywordMapping:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 96) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_BYTE *)(a1 + 96) |= 0x80u;
  }
}

- (void)_addNoFlagsKeywordMapping:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
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
  v8.super_class = (Class)GEOPDSearchBusinessIntent;
  -[GEOPDSearchBusinessIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchBusinessIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchBusinessIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const __CFString *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchBusinessIntent readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_BYTE *)(a1 + 96) & 0x20) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchBusinessIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_217);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v7 = *(id *)(a1 + 64);
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_BYTE *)(a1 + 96) & 0x40) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDSearchBusinessIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenSet_tags_218);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v10 = *(id *)(a1 + 72);
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("tokenSet");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("token_set");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if ((*(_BYTE *)(a1 + 96) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("businessId");
    else
      v15 = CFSTR("business_id");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  -[GEOPDSearchBusinessIntent _readCenter](a1);
  v16 = *(id *)(a1 + 48);
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v16, "jsonRepresentation");
    else
      objc_msgSend(v16, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("center"));

  }
  if ((*(_BYTE *)(a1 + 96) & 2) != 0)
  {
    v19 = *(int *)(a1 + 92);
    if (v19 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 92));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E1C0A5C0[v19];
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("businessType"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt64NSArray();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("keywordMuid");
    else
      v22 = CFSTR("keyword_muid");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = *(id *)(a1 + 56);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("keywordMapping");
    else
      v30 = CFSTR("keyword_mapping");
    objc_msgSend(v4, "setObject:forKey:", v23, v30);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchBusinessIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_235;
      else
        v6 = (int *)&readAll__nonRecursiveTag_236;
      GEOPDSearchBusinessIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchBusinessIntentCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchBusinessIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  if (self->_reader && (_GEOPDSearchBusinessIntentIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSearchBusinessIntent readAll:]((uint64_t)self, 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_tokenSet)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_center)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_keywordMuids.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_keywordMuids.count);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_keywordMappings;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchBusinessIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchBusinessIntent readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[GEOPDSearchTokenSet copyWithZone:](self->_tokenSet, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_businessId;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v13 = -[GEOLatLng copyWithZone:](self->_center, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_businessType;
    *(_BYTE *)(v5 + 96) |= 2u;
  }
  PBRepeatedUInt64Copy();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_keywordMappings;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v8);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        -[GEOPDSearchBusinessIntent addKeywordMapping:](v5, v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  GEOPDSearchTokenSet *tokenSet;
  char flags;
  char v8;
  GEOLatLng *center;
  NSMutableArray *keywordMappings;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[GEOPDSearchBusinessIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchBusinessIntent readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_22;
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:"))
      goto LABEL_22;
  }
  flags = (char)self->_flags;
  v8 = *((_BYTE *)v4 + 96);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_businessId != *((_QWORD *)v4 + 5))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_22;
  }
  center = self->_center;
  if ((unint64_t)center | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:"))
      goto LABEL_22;
    flags = (char)self->_flags;
    v8 = *((_BYTE *)v4 + 96);
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_businessType != *((_DWORD *)v4 + 23))
      goto LABEL_22;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_22;
  }
  if (!PBRepeatedUInt64IsEqual())
  {
LABEL_22:
    v11 = 0;
    goto LABEL_23;
  }
  keywordMappings = self->_keywordMappings;
  if ((unint64_t)keywordMappings | *((_QWORD *)v4 + 7))
    v11 = -[NSMutableArray isEqual:](keywordMappings, "isEqual:");
  else
    v11 = 1;
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[GEOPDSearchBusinessIntent readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[GEOPDSearchTokenSet hash](self->_tokenSet, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761u * self->_businessId;
  else
    v5 = 0;
  v6 = -[GEOLatLng hash](self->_center, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v7 = 2654435761 * self->_businessType;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  v9 = PBRepeatedUInt64Hash();
  return v8 ^ v9 ^ -[NSMutableArray hash](self->_keywordMappings, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_keywordMappings, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
