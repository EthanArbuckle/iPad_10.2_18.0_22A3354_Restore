@implementation GEOPDLocationDirectedSearchParameters

- (GEOPDLocationDirectedSearchParameters)init
{
  GEOPDLocationDirectedSearchParameters *v2;
  GEOPDLocationDirectedSearchParameters *v3;
  GEOPDLocationDirectedSearchParameters *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocationDirectedSearchParameters;
  v2 = -[GEOPDLocationDirectedSearchParameters init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLocationDirectedSearchParameters)initWithData:(id)a3
{
  GEOPDLocationDirectedSearchParameters *v3;
  GEOPDLocationDirectedSearchParameters *v4;
  GEOPDLocationDirectedSearchParameters *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocationDirectedSearchParameters;
  v3 = -[GEOPDLocationDirectedSearchParameters initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)searchString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLocationDirectedSearchParameters _readSearchString]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setSearchString:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x100u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_2744);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x200u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }

}

- (void)_readSearchLocation
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchLocation_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)setSearchLocation:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x80u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)setNearestTransitParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x10u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)setPaginationParameters:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 96) |= 0x20u;
  *(_WORD *)(a1 + 96) |= 0x400u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readSearchFilter
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchFilter_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)setSearchFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 96) |= 0x40u;
  *(_WORD *)(a1 + 96) |= 0x400u;
  objc_storeStrong((id *)(a1 + 40), a2);

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
  v8.super_class = (Class)GEOPDLocationDirectedSearchParameters;
  -[GEOPDLocationDirectedSearchParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLocationDirectedSearchParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocationDirectedSearchParameters _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v47[4];
  id v48;

  if (!a1)
    return 0;
  -[GEOPDLocationDirectedSearchParameters readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 96);
  if ((v5 & 4) != 0)
  {
    v6 = *(int *)(a1 + 92);
    if (v6 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 92));
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

    v5 = *(_WORD *)(a1 + 96);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("maxResults");
    else
      v10 = CFSTR("max_results");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  -[GEOPDLocationDirectedSearchParameters searchString]((id *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("searchString");
    else
      v12 = CFSTR("search_string");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  -[GEOPDLocationDirectedSearchParameters _readViewportInfo](a1);
  v13 = *(id *)(a1 + 64);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  -[GEOPDLocationDirectedSearchParameters _readSearchLocation](a1);
  v17 = *(id *)(a1 + 48);
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("searchLocation");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("search_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if ((*(_WORD *)(a1 + 96) & 2) != 0)
  {
    v21 = *(int *)(a1 + 88);
    if (v21 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 88));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E1C04B88[v21];
    }
    if (a2)
      v23 = CFSTR("searchType");
    else
      v23 = CFSTR("search_type");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      v25 = v24;
      objc_sync_enter(v25);
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNearestTransitParameters_tags);
      objc_sync_exit(v25);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v26 = *(id *)(a1 + 24);
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "jsonRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("nearestTransitParameters");
    }
    else
    {
      objc_msgSend(v26, "dictionaryRepresentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = CFSTR("nearest_transit_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
  {
    v30 = *(void **)(a1 + 8);
    if (v30)
    {
      v31 = v30;
      objc_sync_enter(v31);
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaginationParameters_tags_2745);
      objc_sync_exit(v31);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v32 = *(id *)(a1 + 32);
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("paginationParameters");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("pagination_parameters");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  -[GEOPDLocationDirectedSearchParameters _readSearchFilter](a1);
  v36 = *(id *)(a1 + 40);
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("searchFilter");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("search_filter");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __67__GEOPDLocationDirectedSearchParameters__dictionaryRepresentation___block_invoke;
      v47[3] = &unk_1E1C00600;
      v44 = v43;
      v48 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v47);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLocationDirectedSearchParameters _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_2768;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2769;
      GEOPDLocationDirectedSearchParametersReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDLocationDirectedSearchParametersCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __67__GEOPDLocationDirectedSearchParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDLocationDirectedSearchParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDLocationDirectedSearchParametersIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)self, 0);
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    v6 = v9;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v6 = v9;
    }
    if (self->_searchString)
    {
      PBDataWriterWriteStringField();
      v6 = v9;
    }
    if (self->_viewportInfo)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_searchLocation)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
    }
    if (self->_nearestTransitParameters)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_paginationParameters)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_searchFilter)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDLocationDirectedSearchParameters _readSearchFilter](result);
    if ((-[GEOPDSSearchFilter hasGreenTeaWithValue:](*(_QWORD *)(v3 + 40), a2) & 1) != 0)
      return 1;
    -[GEOPDLocationDirectedSearchParameters _readSearchLocation](v3);
    if ((objc_msgSend(*(id *)(v3 + 48), "hasGreenTeaWithValue:", a2) & 1) != 0)
    {
      return 1;
    }
    else
    {
      -[GEOPDLocationDirectedSearchParameters _readViewportInfo](v3);
      return objc_msgSend(*(id *)(v3 + 64), "hasGreenTeaWithValue:", a2);
    }
  }
  return result;
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
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  PBUnknownFields *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDLocationDirectedSearchParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_sortOrder;
    *(_WORD *)(v5 + 96) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_maxResults;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[GEOLatLng copyWithZone:](self->_searchLocation, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_searchType;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  v16 = -[GEOPDNearestTransitParameters copyWithZone:](self->_nearestTransitParameters, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[GEOPDPaginationParameters copyWithZone:](self->_paginationParameters, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  v20 = -[GEOPDSSearchFilter copyWithZone:](self->_searchFilter, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *searchString;
  GEOPDViewportInfo *viewportInfo;
  GEOLatLng *searchLocation;
  __int16 v10;
  GEOPDNearestTransitParameters *nearestTransitParameters;
  GEOPDPaginationParameters *paginationParameters;
  GEOPDSSearchFilter *searchFilter;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)self, 1);
  -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 48);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sortOrder != *((_DWORD *)v4 + 23))
      goto LABEL_29;
  }
  else if ((v6 & 4) != 0)
  {
LABEL_29:
    v14 = 0;
    goto LABEL_30;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 21))
      goto LABEL_29;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_29;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_29;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_29;
  }
  searchLocation = self->_searchLocation;
  if ((unint64_t)searchLocation | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](searchLocation, "isEqual:"))
      goto LABEL_29;
  }
  v10 = *((_WORD *)v4 + 48);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_searchType != *((_DWORD *)v4 + 22))
      goto LABEL_29;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_29;
  }
  nearestTransitParameters = self->_nearestTransitParameters;
  if ((unint64_t)nearestTransitParameters | *((_QWORD *)v4 + 3)
    && !-[GEOPDNearestTransitParameters isEqual:](nearestTransitParameters, "isEqual:"))
  {
    goto LABEL_29;
  }
  paginationParameters = self->_paginationParameters;
  if ((unint64_t)paginationParameters | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDPaginationParameters isEqual:](paginationParameters, "isEqual:"))
      goto LABEL_29;
  }
  searchFilter = self->_searchFilter;
  if ((unint64_t)searchFilter | *((_QWORD *)v4 + 5))
    v14 = -[GEOPDSSearchFilter isEqual:](searchFilter, "isEqual:");
  else
    v14 = 1;
LABEL_30:

  return v14;
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
  NSUInteger v10;
  unint64_t v11;
  unint64_t v12;

  -[GEOPDLocationDirectedSearchParameters readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
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
      v5 = 2654435761 * self->_maxResults;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_searchString, "hash");
  v7 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  v8 = -[GEOLatLng hash](self->_searchLocation, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v9 = 2654435761 * self->_searchType;
  else
    v9 = 0;
  v10 = v5 ^ v4 ^ v6 ^ v7 ^ v8;
  v11 = v9 ^ -[GEOPDNearestTransitParameters hash](self->_nearestTransitParameters, "hash");
  v12 = v10 ^ v11 ^ -[GEOPDPaginationParameters hash](self->_paginationParameters, "hash");
  return v12 ^ -[GEOPDSSearchFilter hash](self->_searchFilter, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchLocation, 0);
  objc_storeStrong((id *)&self->_searchFilter, 0);
  objc_storeStrong((id *)&self->_paginationParameters, 0);
  objc_storeStrong((id *)&self->_nearestTransitParameters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDLocationDirectedSearchParameters)initWithSearchURLQuery:(id)a3 coordinate:(id)a4 maxResults:(unsigned int)a5 traits:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  GEOPDLocationDirectedSearchParameters *v13;
  GEOPDLocationDirectedSearchParameters *v14;
  GEOLatLng *v15;
  void *v16;
  GEOPDLocationDirectedSearchParameters *v17;
  objc_super v19;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a3;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)GEOPDLocationDirectedSearchParameters;
  v13 = -[GEOPDLocationDirectedSearchParameters init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    if (a5)
    {
      *(_WORD *)&v13->_flags |= 0x400u;
      *(_WORD *)&v13->_flags |= 1u;
      v13->_maxResults = a5;
    }
    if (objc_msgSend(v11, "length"))
      -[GEOPDLocationDirectedSearchParameters setSearchString:]((uint64_t)v14, v11);
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      v15 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", var0, var1);
      -[GEOPDLocationDirectedSearchParameters setSearchLocation:]((uint64_t)v14, v15);

    }
    +[GEOPDViewportInfo viewportInfoForTraits:](GEOPDViewportInfo, "viewportInfoForTraits:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDLocationDirectedSearchParameters setViewportInfo:]((uint64_t)v14, v16);

    v17 = v14;
  }

  return v14;
}

@end
