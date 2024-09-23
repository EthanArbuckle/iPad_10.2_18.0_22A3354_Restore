@implementation GEOPDPoiIconCategoryFilter

- (GEOPDPoiIconCategoryFilter)init
{
  GEOPDPoiIconCategoryFilter *v2;
  GEOPDPoiIconCategoryFilter *v3;
  GEOPDPoiIconCategoryFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPoiIconCategoryFilter;
  v2 = -[GEOPDPoiIconCategoryFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPoiIconCategoryFilter)initWithData:(id)a3
{
  GEOPDPoiIconCategoryFilter *v3;
  GEOPDPoiIconCategoryFilter *v4;
  GEOPDPoiIconCategoryFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPoiIconCategoryFilter;
  v3 = -[GEOPDPoiIconCategoryFilter initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPoiIconCategoryFilter;
  -[GEOPDPoiIconCategoryFilter dealloc](&v3, sel_dealloc);
}

- (void)_readIncludeCategoryFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiIconCategoryFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncludeCategoryFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)addIncludeCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPoiIconCategoryFilter _readIncludeCategoryFilters](a1);
    PBRepeatedUInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 8u;
  }
}

- (uint64_t)includeCategoryFilterAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDPoiIconCategoryFilter _readIncludeCategoryFilters](result);
    v4 = *(_QWORD *)(v3 + 56);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 48) + 4 * a2);
  }
  return result;
}

- (void)_readExcludeCategoryFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPoiIconCategoryFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExcludeCategoryFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)addExcludeCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPoiIconCategoryFilter _readExcludeCategoryFilters](a1);
    PBRepeatedUInt32Add();
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 8u;
  }
}

- (uint64_t)excludeCategoryFilterAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDPoiIconCategoryFilter _readExcludeCategoryFilters](result);
    v4 = *(_QWORD *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 24) + 4 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOPDPoiIconCategoryFilter;
  -[GEOPDPoiIconCategoryFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPoiIconCategoryFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPoiIconCategoryFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;

  if (!a1)
    return 0;
  -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[7])
  {
    PBRepeatedUInt32NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("includeCategoryFilter");
    else
      v6 = CFSTR("include_category_filter");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (a1[4])
  {
    PBRepeatedUInt32NSArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("excludeCategoryFilter");
    else
      v8 = CFSTR("exclude_category_filter");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  v9 = (void *)a1[2];
  if (v9)
  {
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __56__GEOPDPoiIconCategoryFilter__dictionaryRepresentation___block_invoke;
      v16[3] = &unk_1E1C00600;
      v13 = v12;
      v17 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);
      v14 = v13;

      v11 = v14;
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPoiIconCategoryFilter _dictionaryRepresentation:](self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_193_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_194_0;
      GEOPDPoiIconCategoryFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __56__GEOPDPoiIconCategoryFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("includeCategoryFilter");
      else
        v6 = CFSTR("include_category_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v28;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v28 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v13, "unsignedIntValue");
                -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:]((uint64_t)a1);
              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v14 = CFSTR("excludeCategoryFilter");
      else
        v14 = CFSTR("exclude_category_filter");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v24;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v24 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v20);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v21, "unsignedIntValue", (_QWORD)v23);
                -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:]((uint64_t)a1);
              }
              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v18);
        }

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPoiIconCategoryFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self, 0);
    v5 = v10;
    if (self->_includeCategoryFilters.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_includeCategoryFilters.count);
    }
    if (self->_excludeCategoryFilters.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        v5 = v10;
        ++v7;
      }
      while (v7 < self->_excludeCategoryFilters.count);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  PBDataReader *reader;
  PBDataReader *v6;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v6 = reader;
  objc_sync_enter(v6);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self, 0);
    PBRepeatedUInt32Copy();
    PBRepeatedUInt32Copy();
    objc_storeStrong(v4 + 2, self->_unknownFields);
    return v4;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDPoiIconCategoryFilterReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self, 1),
        -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)v4, 1),
        PBRepeatedUInt32IsEqual()))
  {
    IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)self, 1);
  v2 = PBRepeatedUInt32Hash();
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  unint64_t j;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    -[GEOPDPoiIconCategoryFilter readAll:]((uint64_t)v3, 0);
    v3 = v8;
    if (v8)
    {
      -[GEOPDPoiIconCategoryFilter _readIncludeCategoryFilters]((uint64_t)v8);
      v4 = *((_QWORD *)v8 + 7);
      if (v4)
      {
        for (i = 0; i != v4; ++i)
        {
          -[GEOPDPoiIconCategoryFilter includeCategoryFilterAtIndex:]((uint64_t)v8, i);
          -[GEOPDPoiIconCategoryFilter addIncludeCategoryFilter:](a1);
        }
      }
      -[GEOPDPoiIconCategoryFilter _readExcludeCategoryFilters]((uint64_t)v8);
      v3 = v8;
      v6 = *((_QWORD *)v8 + 4);
      if (v6)
      {
        for (j = 0; j != v6; ++j)
        {
          -[GEOPDPoiIconCategoryFilter excludeCategoryFilterAtIndex:]((uint64_t)v8, j);
          -[GEOPDPoiIconCategoryFilter addExcludeCategoryFilter:](a1);
          v3 = v8;
        }
      }
    }
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 1u;
    *(_BYTE *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
      -[GEOPDPoiIconCategoryFilter readAll:](a1, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
