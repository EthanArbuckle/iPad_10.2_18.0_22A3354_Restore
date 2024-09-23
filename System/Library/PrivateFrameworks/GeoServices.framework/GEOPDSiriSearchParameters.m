@implementation GEOPDSiriSearchParameters

- (GEOPDSiriSearchParameters)init
{
  GEOPDSiriSearchParameters *v2;
  GEOPDSiriSearchParameters *v3;
  GEOPDSiriSearchParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSiriSearchParameters;
  v2 = -[GEOPDSiriSearchParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSiriSearchParameters)initWithData:(id)a3
{
  GEOPDSiriSearchParameters *v3;
  GEOPDSiriSearchParameters *v4;
  GEOPDSiriSearchParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSiriSearchParameters;
  v3 = -[GEOPDSiriSearchParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x200u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 56), a2);

}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 104) & 0x800) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSiriSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_5452);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x800u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 72), a2);

}

- (void)setAddress:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x20u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readBusinessCategoryFilters
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSiriSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessCategoryFilters_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
}

- (void)addBusinessCategoryFilter:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSiriSearchParameters _readBusinessCategoryFilters](a1);
    -[GEOPDSiriSearchParameters _addNoFlagsBusinessCategoryFilter:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 104) |= 0x1000u;
  }
}

- (void)_addNoFlagsBusinessCategoryFilter:(uint64_t)a1
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

- (void)addSearchSubstringDescriptor:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 104) & 0x400) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSiriSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchSubstringDescriptors_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDSiriSearchParameters _addNoFlagsSearchSubstringDescriptor:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 104) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 104) |= 0x1000u;
  }
}

- (void)_addNoFlagsSearchSubstringDescriptor:(uint64_t)a1
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

- (void)setIndexFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x80u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)setRecentRouteInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 104) |= 0x100u;
  *(_WORD *)(a1 + 104) |= 0x1000u;
  objc_storeStrong((id *)(a1 + 48), a2);

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
  v8.super_class = (Class)GEOPDSiriSearchParameters;
  -[GEOPDSiriSearchParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSiriSearchParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSiriSearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  const __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSiriSearchParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 2) != 0)
  {
    v6 = *(int *)(a1 + 96);
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 96));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C05188[v6];
    }
    if (a2)
      v8 = CFSTR("sortOrder");
    else
      v8 = CFSTR("sort_order");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_WORD *)(a1 + 104);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("maxResultCount");
    else
      v10 = CFSTR("max_result_count");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDSiriSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchString_tags_5451);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v13 = *(id *)(a1 + 56);
  if (v13)
  {
    if (a2)
      v14 = CFSTR("searchString");
    else
      v14 = CFSTR("search_string");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  -[GEOPDSiriSearchParameters _readViewportInfo](a1);
  v15 = *(id *)(a1 + 72);
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = v19;
      objc_sync_enter(v20);
      GEOPDSiriSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags_0);
      objc_sync_exit(v20);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v21 = *(id *)(a1 + 24);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v21, "jsonRepresentation");
    else
      objc_msgSend(v21, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("address"));

  }
  if (*(_QWORD *)(a1 + 32))
  {
    -[GEOPDSiriSearchParameters _readBusinessCategoryFilters](a1);
    v24 = *(id *)(a1 + 32);
    if (a2)
      v25 = CFSTR("businessCategoryFilter");
    else
      v25 = CFSTR("business_category_filter");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  v26 = *(_WORD *)(a1 + 104);
  if ((v26 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("isStrictMapRegion");
    else
      v28 = CFSTR("is_strict_map_region");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v26 = *(_WORD *)(a1 + 104);
  }
  if ((v26 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 101));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("structuredSearch");
    else
      v30 = CFSTR("structured_search");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v32 = *(id *)(a1 + 64);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v61 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v36, "jsonRepresentation");
          else
            objc_msgSend(v36, "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      }
      while (v33);
    }

    if (a2)
      v38 = CFSTR("searchSubstringDescriptor");
    else
      v38 = CFSTR("search_substring_descriptor");
    objc_msgSend(v4, "setObject:forKey:", v31, v38);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
  {
    v39 = *(void **)(a1 + 8);
    if (v39)
    {
      v40 = v39;
      objc_sync_enter(v40);
      GEOPDSiriSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIndexFilter_tags);
      objc_sync_exit(v40);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v41 = *(id *)(a1 + 40);
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("indexFilter");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("index_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
  {
    v45 = *(void **)(a1 + 8);
    if (v45)
    {
      v46 = v45;
      objc_sync_enter(v46);
      GEOPDSiriSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRecentRouteInfo_tags_5454);
      objc_sync_exit(v46);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v47 = *(id *)(a1 + 48);
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("recentRouteInfo");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("recent_route_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  v51 = *(void **)(a1 + 16);
  if (v51)
  {
    objc_msgSend(v51, "dictionaryRepresentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v52, "count"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __55__GEOPDSiriSearchParameters__dictionaryRepresentation___block_invoke;
      v58[3] = &unk_1E1C00600;
      v55 = v54;
      v59 = v55;
      objc_msgSend(v53, "enumerateKeysAndObjectsUsingBlock:", v58);
      v56 = v55;

    }
    else
    {
      v56 = v52;
    }
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSiriSearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_5477;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5478;
      GEOPDSiriSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSiriSearchParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __55__GEOPDSiriSearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSiriSearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDSiriSearchParametersIsDirty((uint64_t)self))
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSiriSearchParameters readAll:]((uint64_t)self, 0);
    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_searchString)
      PBDataWriterWriteStringField();
    if (self->_viewportInfo)
      PBDataWriterWriteSubmessage();
    if (self->_address)
      PBDataWriterWriteSubmessage();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = self->_businessCategoryFilters;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteStringField();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }

    v11 = (__int16)self->_flags;
    if ((v11 & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v11 = (__int16)self->_flags;
    }
    if ((v11 & 8) != 0)
      PBDataWriterWriteBOOLField();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = self->_searchSubstringDescriptors;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteSubmessage();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v13);
    }

    if (self->_indexFilter)
      PBDataWriterWriteSubmessage();
    if (self->_recentRouteInfo)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int16 v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  PBUnknownFields *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSiriSearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_28;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSiriSearchParameters readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_sortOrder;
    *(_WORD *)(v5 + 104) |= 2u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_maxResultCount;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v14 = -[GEOAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = self->_businessCategoryFilters;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSiriSearchParameters addBusinessCategoryFilter:](v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v17);
  }

  v21 = (__int16)self->_flags;
  if ((v21 & 4) != 0)
  {
    *(_BYTE *)(v5 + 100) = self->_isStrictMapRegion;
    *(_WORD *)(v5 + 104) |= 4u;
    v21 = (__int16)self->_flags;
  }
  if ((v21 & 8) != 0)
  {
    *(_BYTE *)(v5 + 101) = self->_structuredSearch;
    *(_WORD *)(v5 + 104) |= 8u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = self->_searchSubstringDescriptors;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v22);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v33);
        -[GEOPDSiriSearchParameters addSearchSubstringDescriptor:](v5, v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v23);
  }

  v27 = -[GEOPDIndexQueryNode copyWithZone:](self->_indexFilter, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v27;

  v29 = -[GEOPDRecentRouteInfo copyWithZone:](self->_recentRouteInfo, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v29;

  v31 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v31;
LABEL_28:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *searchString;
  GEOPDViewportInfo *viewportInfo;
  GEOAddress *address;
  NSMutableArray *businessCategoryFilters;
  __int16 v11;
  __int16 v12;
  NSMutableArray *searchSubstringDescriptors;
  GEOPDIndexQueryNode *indexFilter;
  GEOPDRecentRouteInfo *recentRouteInfo;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[GEOPDSiriSearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSiriSearchParameters readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 52);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_sortOrder != *((_DWORD *)v4 + 24))
      goto LABEL_42;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_maxResultCount != *((_DWORD *)v4 + 23))
      goto LABEL_42;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_42;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_42;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_42;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOAddress isEqual:](address, "isEqual:"))
      goto LABEL_42;
  }
  businessCategoryFilters = self->_businessCategoryFilters;
  if ((unint64_t)businessCategoryFilters | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](businessCategoryFilters, "isEqual:"))
      goto LABEL_42;
  }
  v11 = (__int16)self->_flags;
  v12 = *((_WORD *)v4 + 52);
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0)
      goto LABEL_42;
    if (self->_isStrictMapRegion)
    {
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_42;
    }
    else if (*((_BYTE *)v4 + 100))
    {
      goto LABEL_42;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) != 0)
    {
      if (self->_structuredSearch)
      {
        if (!*((_BYTE *)v4 + 101))
          goto LABEL_42;
        goto LABEL_36;
      }
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_36;
    }
LABEL_42:
    v16 = 0;
    goto LABEL_43;
  }
  if ((v12 & 8) != 0)
    goto LABEL_42;
LABEL_36:
  searchSubstringDescriptors = self->_searchSubstringDescriptors;
  if ((unint64_t)searchSubstringDescriptors | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](searchSubstringDescriptors, "isEqual:"))
  {
    goto LABEL_42;
  }
  indexFilter = self->_indexFilter;
  if ((unint64_t)indexFilter | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDIndexQueryNode isEqual:](indexFilter, "isEqual:"))
      goto LABEL_42;
  }
  recentRouteInfo = self->_recentRouteInfo;
  if ((unint64_t)recentRouteInfo | *((_QWORD *)v4 + 6))
    v16 = -[GEOPDRecentRouteInfo isEqual:](recentRouteInfo, "isEqual:");
  else
    v16 = 1;
LABEL_43:

  return v16;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  unint64_t v15;

  -[GEOPDSiriSearchParameters readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v4 = 2654435761 * self->_sortOrder;
    if ((flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_maxResultCount;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_searchString, "hash");
  v7 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  v8 = -[GEOAddress hash](self->_address, "hash");
  v9 = -[NSMutableArray hash](self->_businessCategoryFilters, "hash");
  v10 = (__int16)self->_flags;
  if ((v10 & 4) != 0)
  {
    v11 = 2654435761 * self->_isStrictMapRegion;
    if ((v10 & 8) != 0)
      goto LABEL_8;
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v11 = 0;
  if ((v10 & 8) == 0)
    goto LABEL_10;
LABEL_8:
  v12 = 2654435761 * self->_structuredSearch;
LABEL_11:
  v13 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v12;
  v14 = -[NSMutableArray hash](self->_searchSubstringDescriptors, "hash");
  v15 = v14 ^ -[GEOPDIndexQueryNode hash](self->_indexFilter, "hash");
  return v13 ^ v15 ^ -[GEOPDRecentRouteInfo hash](self->_recentRouteInfo, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_searchSubstringDescriptors, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_recentRouteInfo, 0);
  objc_storeStrong((id *)&self->_indexFilter, 0);
  objc_storeStrong((id *)&self->_businessCategoryFilters, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
