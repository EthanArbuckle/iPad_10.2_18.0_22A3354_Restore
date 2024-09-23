@implementation GEOPDLocationDirectedSearchResult

- (GEOPDLocationDirectedSearchResult)init
{
  GEOPDLocationDirectedSearchResult *v2;
  GEOPDLocationDirectedSearchResult *v3;
  GEOPDLocationDirectedSearchResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocationDirectedSearchResult;
  v2 = -[GEOPDLocationDirectedSearchResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLocationDirectedSearchResult)initWithData:(id)a3
{
  GEOPDLocationDirectedSearchResult *v3;
  GEOPDLocationDirectedSearchResult *v4;
  GEOPDLocationDirectedSearchResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocationDirectedSearchResult;
  v3 = -[GEOPDLocationDirectedSearchResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayMapRegion
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDLocationDirectedSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_2784);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 4u;
  *(_BYTE *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readDisambiguationLabels
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDLocationDirectedSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisambiguationLabels_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)disambiguationLabels
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDLocationDirectedSearchResult _readDisambiguationLabels]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addDisambiguationLabel:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDLocationDirectedSearchResult _readDisambiguationLabels](a1);
    -[GEOPDLocationDirectedSearchResult _addNoFlagsDisambiguationLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsDisambiguationLabel:(uint64_t)a1
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

- (void)setPaginationInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 8u;
  *(_BYTE *)(a1 + 60) |= 0x10u;
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
  v8.super_class = (Class)GEOPDLocationDirectedSearchResult;
  -[GEOPDLocationDirectedSearchResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLocationDirectedSearchResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocationDirectedSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDLocationDirectedSearchResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDLocationDirectedSearchResult _readDisplayMapRegion](a1);
  v5 = *(id *)(a1 + 32);
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("displayMapRegion");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("display_map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = *(id *)(a1 + 24);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("disambiguationLabel");
    else
      v16 = CFSTR("disambiguation_label");
    objc_msgSend(v4, "setObject:forKey:", v9, v16);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 60) & 8) == 0)
  {
    v17 = *(void **)(a1 + 8);
    if (v17)
    {
      v18 = v17;
      objc_sync_enter(v18);
      GEOPDLocationDirectedSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPaginationInfo_tags_2785);
      objc_sync_exit(v18);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v19 = *(id *)(a1 + 40);
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("paginationInfo");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("pagination_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __63__GEOPDLocationDirectedSearchResult__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

    }
    else
    {
      v28 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDLocationDirectedSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_2786;
      else
        v6 = (int *)&readAll__nonRecursiveTag_2787;
      GEOPDLocationDirectedSearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDLocationDirectedSearchResultCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __63__GEOPDLocationDirectedSearchResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDLocationDirectedSearchResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDLocationDirectedSearchResultIsDirty((uint64_t)self))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)self, 0);
    if (self->_displayMapRegion)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_disambiguationLabels;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_paginationInfo)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOPDLocationDirectedSearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)self, 0);
  v8 = -[GEOMapRegion copyWithZone:](self->_displayMapRegion, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_disambiguationLabels;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v18);
        -[GEOPDLocationDirectedSearchResult addDisambiguationLabel:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15 = -[GEOPDPaginationInfo copyWithZone:](self->_paginationInfo, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOMapRegion *displayMapRegion;
  NSMutableArray *disambiguationLabels;
  GEOPDPaginationInfo *paginationInfo;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)self, 1),
         -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)v4, 1),
         displayMapRegion = self->_displayMapRegion,
         !((unint64_t)displayMapRegion | v4[4]))
     || -[GEOMapRegion isEqual:](displayMapRegion, "isEqual:"))
    && ((disambiguationLabels = self->_disambiguationLabels, !((unint64_t)disambiguationLabels | v4[3]))
     || -[NSMutableArray isEqual:](disambiguationLabels, "isEqual:")))
  {
    paginationInfo = self->_paginationInfo;
    if ((unint64_t)paginationInfo | v4[5])
      v8 = -[GEOPDPaginationInfo isEqual:](paginationInfo, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEOPDLocationDirectedSearchResult readAll:]((uint64_t)self, 1);
  v3 = -[GEOMapRegion hash](self->_displayMapRegion, "hash");
  v4 = -[NSMutableArray hash](self->_disambiguationLabels, "hash") ^ v3;
  return v4 ^ -[GEOPDPaginationInfo hash](self->_paginationInfo, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_disambiguationLabels, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
