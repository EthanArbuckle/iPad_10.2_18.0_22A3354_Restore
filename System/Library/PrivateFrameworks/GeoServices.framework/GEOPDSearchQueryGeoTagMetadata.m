@implementation GEOPDSearchQueryGeoTagMetadata

- (GEOPDSearchQueryGeoTagMetadata)init
{
  GEOPDSearchQueryGeoTagMetadata *v2;
  GEOPDSearchQueryGeoTagMetadata *v3;
  GEOPDSearchQueryGeoTagMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryGeoTagMetadata;
  v2 = -[GEOPDSearchQueryGeoTagMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryGeoTagMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryGeoTagMetadata *v3;
  GEOPDSearchQueryGeoTagMetadata *v4;
  GEOPDSearchQueryGeoTagMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryGeoTagMetadata;
  v3 = -[GEOPDSearchQueryGeoTagMetadata initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryGeoTagMetadata;
  -[GEOPDSearchQueryGeoTagMetadata dealloc](&v3, sel_dealloc);
}

- (void)addGeoTypeMap:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryGeoTagMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoTypeMaps_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDSearchQueryGeoTagMetadata _addNoFlagsGeoTypeMap:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 92) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_BYTE *)(a1 + 92) |= 0x10u;
  }
}

- (void)_addNoFlagsGeoTypeMap:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchQueryGeoTagMetadata;
  -[GEOPDSearchQueryGeoTagMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryGeoTagMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryGeoTagMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  __CFString *v29;
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
  -[GEOPDSearchQueryGeoTagMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 48))
    {
      v7 = 0;
      do
      {
        v8 = *(unsigned int *)(*v6 + 4 * v7);
        if ((v8 - 1) >= 0x1C)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C0A778[(int)v8 - 1];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 40);
      }
      while (v7 < *(_QWORD *)(a1 + 48));
    }
    if (a2)
      v10 = CFSTR("tagSources");
    else
      v10 = CFSTR("tag_sources");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_BYTE *)(a1 + 92) & 4) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDSearchQueryGeoTagMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoParsingResult_tags);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v13 = *(id *)(a1 + 64);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("geoParsingResult");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("geo_parsing_result");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v18 = *(id *)(a1 + 72);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }

    if (a2)
      v24 = CFSTR("geoTypeMap");
    else
      v24 = CFSTR("geo_type_map");
    objc_msgSend(v4, "setObject:forKey:", v17, v24);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v27 = 0;
      do
      {
        v28 = *(unsigned int *)(*v26 + 4 * v27);
        if ((v28 - 1) >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v28);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = off_1E1C0A858[(int)v28 - 1];
        }
        objc_msgSend(v25, "addObject:", v29);

        ++v27;
        v26 = (_QWORD *)(a1 + 16);
      }
      while (v27 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v30 = CFSTR("geoRewriteTypes");
    else
      v30 = CFSTR("geo_rewrite_types");
    objc_msgSend(v4, "setObject:forKey:", v25, v30);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryGeoTagMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_1081;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1082;
      GEOPDSearchQueryGeoTagMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchQueryGeoTagMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryGeoTagMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_geoRewriteTypes;
  unint64_t v12;
  PBDataReader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryGeoTagMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)self, 0);
    if (self->_tagSources.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_tagSources.count);
    }
    if (self->_geoParsingResult)
      PBDataWriterWriteSubmessage();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_geoTypeMaps;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    p_geoRewriteTypes = &self->_geoRewriteTypes;
    if (p_geoRewriteTypes->count)
    {
      v12 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v12;
      }
      while (v12 < p_geoRewriteTypes->count);
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchQueryGeoTagMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)self, 0);
  PBRepeatedInt32Copy();
  v8 = -[GEOPDSearchGeoParsingResult copyWithZone:](self->_geoParsingResult, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_geoTypeMaps;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        -[GEOPDSearchQueryGeoTagMetadata addGeoTypeMap:]((uint64_t)v5, v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDSearchGeoParsingResult *geoParsingResult;
  NSMutableArray *geoTypeMaps;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)self, 1),
        -[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)v4, 1),
        PBRepeatedInt32IsEqual())
    && ((geoParsingResult = self->_geoParsingResult, !((unint64_t)geoParsingResult | v4[8]))
     || -[GEOPDSearchGeoParsingResult isEqual:](geoParsingResult, "isEqual:"))
    && ((geoTypeMaps = self->_geoTypeMaps, !((unint64_t)geoTypeMaps | v4[9]))
     || -[NSMutableArray isEqual:](geoTypeMaps, "isEqual:")))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  -[GEOPDSearchQueryGeoTagMetadata readAll:]((uint64_t)self, 1);
  v3 = PBRepeatedInt32Hash();
  v4 = -[GEOPDSearchGeoParsingResult hash](self->_geoParsingResult, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_geoTypeMaps, "hash");
  return v4 ^ v5 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoTypeMaps, 0);
  objc_storeStrong((id *)&self->_geoParsingResult, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
