@implementation GEOPDPlaceResponse

- (GEOPDPlaceResponse)initWithData:(id)a3
{
  GEOPDPlaceResponse *v3;
  GEOPDPlaceResponse *v4;
  GEOPDPlaceResponse *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceResponse;
  v3 = -[GEOPDPlaceResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

id __52__GEOPDPlaceResponse_Extras__resultsWithResultType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "resultType");
  if (v4 == *(_DWORD *)(a1 + 32))
  {
    switch(v4)
    {
      case 1:
        objc_msgSend(v3, "place");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        objc_msgSend(v3, "collection");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend(v3, "publisher");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        objc_msgSend(v3, "placeQuestionnaire");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        objc_msgSend(v3, "batchReverseGeocode");
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
    v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (NSMutableArray)legacyPlaceResults
{
  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  return self->_legacyPlaceResults;
}

- (void)_readLegacyPlaceResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLegacyPlaceResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOPDPlaceResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus;
}

- (void)_readDatasetAbStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)setClientMetrics:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8020u;
  objc_storeStrong((id *)&self->_clientMetrics, a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceResponseReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOPDPlaceResponse)init
{
  GEOPDPlaceResponse *v2;
  GEOPDPlaceResponse *v3;
  GEOPDPlaceResponse *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceResponse;
  v2 = -[GEOPDPlaceResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (int)status
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_status;
  else
    return 0;
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceResponseIsValid((char *)a3);
}

- (NSMutableArray)mapsResults
{
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  return self->_mapsResults;
}

- (void)_readMapsResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (GEOPDPlaceGlobalResult)globalResult
{
  -[GEOPDPlaceResponse _readGlobalResult]((uint64_t)self);
  return self->_globalResult;
}

- (BOOL)hasGlobalResult
{
  -[GEOPDPlaceResponse _readGlobalResult]((uint64_t)self);
  return self->_globalResult != 0;
}

- (void)_readGlobalResult
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGlobalResult_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)_addNoFlagsMapsResult:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)resultsWithResultType:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  int v10;

  if (-[GEOPDPlaceResponse mapsResultsCount](self, "mapsResultsCount"))
  {
    -[GEOPDPlaceResponse mapsResults](self, "mapsResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__GEOPDPlaceResponse_Extras__resultsWithResultType___block_invoke;
    v9[3] = &__block_descriptor_36_e25__16__0__GEOPDMapsResult_8l;
    v10 = a3;
    objc_msgSend(v5, "_geo_compactMap:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3 == 1)
  {
    -[GEOPDPlaceResponse legacyPlaceResults](self, "legacyPlaceResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "count"))
    v7 = (void *)objc_msgSend(v6, "copy");
  else
    v7 = 0;

  return v7;
}

- (unint64_t)mapsResultsCount
{
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  return -[NSMutableArray count](self->_mapsResults, "count");
}

- (id)_disambiguationLabels
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  void *v7;

  if (-[GEOPDPlaceResponse hasGlobalResult](self, "hasGlobalResult"))
  {
    -[GEOPDPlaceResponse globalResult](self, "globalResult");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      -[GEOPDPlaceGlobalResult _readSearchResult](v3);
      if (*(_QWORD *)(v4 + 368))
      {
        -[GEOPDPlaceGlobalResult searchResult]((id *)v4);
        v5 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSearchResult disambiguationLabels](v5);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v7 = (void *)v6;

LABEL_11:
        return v7;
      }
      -[GEOPDPlaceGlobalResult _readGeocodingResult](v4);
      if (*(_QWORD *)(v4 + 184))
      {
        -[GEOPDPlaceGlobalResult geocodingResult]((id *)v4);
        v5 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDGeocodingResult disambiguationLabels](v5);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      -[GEOPDPlaceGlobalResult _readLocationDirectedSearchResult](v4);
      if (*(_QWORD *)(v4 + 216))
      {
        -[GEOPDPlaceGlobalResult locationDirectedSearchResult]((id *)v4);
        v5 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDLocationDirectedSearchResult disambiguationLabels](v5);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 0;
  return v7;
}

- (unint64_t)dotPlacesCount
{
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  return -[NSMutableArray count](self->_dotPlaces, "count");
}

- (void)_readDotPlaces
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDotPlaces_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenLanguages, 0);
  objc_storeStrong((id *)&self->_legacyPlaceResults, 0);
  objc_storeStrong((id *)&self->_mapsResults, 0);
  objc_storeStrong((id *)&self->_globalResult, 0);
  objc_storeStrong((id *)&self->_dotPlaces, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_debugApiKey, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_clientMetrics, 0);
  objc_storeStrong((id *)&self->_analyticData, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (unint64_t)resultsCountWithResultType:(int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[GEOPDPlaceResponse mapsResultsCount](self, "mapsResultsCount"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[GEOPDPlaceResponse mapsResults](self, "mapsResults", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "resultType") == a3)
          {
            switch(a3)
            {
              case 1:
                v12 = objc_msgSend(v11, "hasPlace");
                goto LABEL_14;
              case 2:
                v12 = objc_msgSend(v11, "hasCollection");
                goto LABEL_14;
              case 3:
                v12 = objc_msgSend(v11, "hasPublisher");
                goto LABEL_14;
              case 4:
                v12 = objc_msgSend(v11, "hasPlaceQuestionnaire");
                goto LABEL_14;
              case 5:
                v12 = objc_msgSend(v11, "hasBatchReverseGeocode");
LABEL_14:
                v8 += v12;
                break;
              default:
                continue;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    if (a3 == 1)
      return -[GEOPDPlaceResponse legacyPlaceResultsCount](self, "legacyPlaceResultsCount");
    return 0;
  }
  return v8;
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  PBDataReader *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceResponseIsDirty((uint64_t)self) & 1) == 0)
  {
    v27 = self->_reader;
    objc_sync_enter(v27);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v28);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v27);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPlaceResponse readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_globalResult)
      PBDataWriterWriteSubmessage();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v7 = self->_legacyPlaceResults;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v46;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v46 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v8);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v11 = self->_displayLanguages;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v42;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteStringField();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v12);
    }

    if (self->_displayRegion)
      PBDataWriterWriteStringField();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = self->_spokenLanguages;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v38;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteStringField();
          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v16);
    }

    if (self->_debugApiKey)
      PBDataWriterWriteStringField();
    if (self->_datasetAbStatus)
      PBDataWriterWriteSubmessage();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v19 = self->_mapsResults;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v34;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v19);
          PBDataWriterWriteSubmessage();
          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v50, 16);
      }
      while (v20);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v23 = self->_dotPlaces;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v30;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v23);
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v49, 16);
      }
      while (v24);
    }

    if (self->_analyticData)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_clientMetrics)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v29);
  }

}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_4583;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4584;
    GEOPDPlaceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPlaceResponseCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (void)setMapsResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *mapsResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  mapsResults = self->_mapsResults;
  self->_mapsResults = v4;

}

- (GEOPDPlaceResponse)initWithPlace:(id)a3 forRequestType:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  GEOPDPlaceResponse *v8;
  GEOPDPlaceResponse *v9;
  GEOPDMapsResult *v10;
  objc_super v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "status"))
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOPDPlaceResponse;
    v9 = -[GEOPDPlaceResponse init](&v12, sel_init);
    if (v9)
    {
      v10 = objc_alloc_init(GEOPDMapsResult);
      -[GEOPDMapsResult setResultType:](v10, "setResultType:", 1);
      -[GEOPDMapsResult setPlace:](v10, "setPlace:", v7);
      -[GEOPDPlaceResponse addMapsResult:](v9, "addMapsResult:", v10);
      -[GEOPDPlaceResponse setStatus:](v9, "setStatus:", 0);
      -[GEOPDPlaceResponse setRequestType:](v9, "setRequestType:", v4);

    }
    self = v9;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8004u;
  self->_status = a3;
}

- (void)setRequestType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x8002u;
  self->_requestType = a3;
}

- (void)addMapsResult:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsMapsResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)setHasStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32764;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 29)
  {
    if (a3 > 49)
    {
      if (a3 == 50)
        return CFSTR("STATUS_DEDUPED");
      if (a3 == 60)
        return CFSTR("VERSION_MISMATCH");
    }
    else
    {
      if (a3 == 30)
        return CFSTR("NEEDS_REFINEMENT");
      if (a3 == 40)
        return CFSTR("FAILED_NOT_AUTHORIZED");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("STATUS_SUCCESS");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STATUS_FAILED");
        return v3;
      case 2:
        result = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (a3 != 20)
          goto LABEL_15;
        result = CFSTR("FAILED_NO_RESULT");
        break;
    }
  }
  return result;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)requestType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_requestType;
  else
    return 0;
}

- (void)setHasRequestType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = -32766;
  else
    v3 = 0x8000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasRequestType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)requestTypeAsString:(int)a3
{
  if (a3 < 0x3F)
    return off_1E1C04C28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
  {
    v4 = 61;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
  {
    v4 = 62;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setGlobalResult:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8800u;
  objc_storeStrong((id *)&self->_globalResult, a3);
}

- (void)setLegacyPlaceResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *legacyPlaceResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  legacyPlaceResults = self->_legacyPlaceResults;
  self->_legacyPlaceResults = v4;

}

- (void)clearLegacyPlaceResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_legacyPlaceResults, "removeAllObjects");
}

- (void)addLegacyPlaceResult:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsLegacyPlaceResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsLegacyPlaceResult:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)legacyPlaceResultsCount
{
  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  return -[NSMutableArray count](self->_legacyPlaceResults, "count");
}

- (id)legacyPlaceResultAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_legacyPlaceResults, "objectAtIndex:", a3);
}

+ (Class)legacyPlaceResultType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayLanguages_tags_4540);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)displayLanguages
{
  -[GEOPDPlaceResponse _readDisplayLanguages]((uint64_t)self);
  return self->_displayLanguages;
}

- (void)setDisplayLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  displayLanguages = self->_displayLanguages;
  self->_displayLanguages = v4;

}

- (void)clearDisplayLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_displayLanguages, "removeAllObjects");
}

- (void)addDisplayLanguage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceResponse _readDisplayLanguages]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsDisplayLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (unint64_t)displayLanguagesCount
{
  -[GEOPDPlaceResponse _readDisplayLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_displayLanguages, "count");
}

- (id)displayLanguageAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readDisplayLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayLanguages, "objectAtIndex:", a3);
}

+ (Class)displayLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags_4541);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasDisplayRegion
{
  -[GEOPDPlaceResponse _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOPDPlaceResponse _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (void)setDisplayRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8200u;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (void)_readSpokenLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenLanguages_tags_4542);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)spokenLanguages
{
  -[GEOPDPlaceResponse _readSpokenLanguages]((uint64_t)self);
  return self->_spokenLanguages;
}

- (void)setSpokenLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *spokenLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  spokenLanguages = self->_spokenLanguages;
  self->_spokenLanguages = v4;

}

- (void)clearSpokenLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_spokenLanguages, "removeAllObjects");
}

- (void)addSpokenLanguage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceResponse _readSpokenLanguages]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsSpokenLanguage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)spokenLanguagesCount
{
  -[GEOPDPlaceResponse _readSpokenLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_spokenLanguages, "count");
}

- (id)spokenLanguageAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readSpokenLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_spokenLanguages, "objectAtIndex:", a3);
}

+ (Class)spokenLanguageType
{
  return (Class)objc_opt_class();
}

- (void)_readDebugApiKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugApiKey_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasDebugApiKey
{
  -[GEOPDPlaceResponse _readDebugApiKey]((uint64_t)self);
  return self->_debugApiKey != 0;
}

- (NSString)debugApiKey
{
  -[GEOPDPlaceResponse _readDebugApiKey]((uint64_t)self);
  return self->_debugApiKey;
}

- (void)setDebugApiKey:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8080u;
  objc_storeStrong((id *)&self->_debugApiKey, a3);
}

- (BOOL)hasDatasetAbStatus
{
  -[GEOPDPlaceResponse _readDatasetAbStatus]((uint64_t)self);
  return self->_datasetAbStatus != 0;
}

- (void)setDatasetAbStatus:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8040u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)clearMapsResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_mapsResults, "removeAllObjects");
}

- (id)mapsResultAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_mapsResults, "objectAtIndex:", a3);
}

+ (Class)mapsResultType
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)dotPlaces
{
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  return self->_dotPlaces;
}

- (void)setDotPlaces:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *dotPlaces;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  dotPlaces = self->_dotPlaces;
  self->_dotPlaces = v4;

}

- (void)clearDotPlaces
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
  -[NSMutableArray removeAllObjects](self->_dotPlaces, "removeAllObjects");
}

- (void)addDotPlace:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  -[GEOPDPlaceResponse _addNoFlagsDotPlace:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x8000u;
}

- (void)_addNoFlagsDotPlace:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)dotPlaceAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_dotPlaces, "objectAtIndex:", a3);
}

+ (Class)dotPlaceType
{
  return (Class)objc_opt_class();
}

- (void)_readAnalyticData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAnalyticData
{
  -[GEOPDPlaceResponse _readAnalyticData]((uint64_t)self);
  return self->_analyticData != 0;
}

- (GEOPDPlacesRequestResponseAnalyticsData)analyticData
{
  -[GEOPDPlaceResponse _readAnalyticData]((uint64_t)self);
  return self->_analyticData;
}

- (void)setAnalyticData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x8010u;
  objc_storeStrong((id *)&self->_analyticData, a3);
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
  v8.super_class = (Class)GEOPDPlaceResponse;
  -[GEOPDPlaceResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  unint64_t v4;
  void *v5;
  __int16 v6;
  int v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  _QWORD v71[4];
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  v4 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_WORD *)(a1 + 140);
  if ((v6 & 4) != 0)
  {
    v7 = *(_DWORD *)(a1 + 136);
    if (v7 <= 29)
    {
      v8 = CFSTR("STATUS_SUCCESS");
      switch(v7)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v8 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v8 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v8 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v7 != 20)
            goto LABEL_15;
          v8 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v7 > 49)
    {
      if (v7 == 50)
      {
        v8 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v7 == 60)
      {
        v8 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v7 == 30)
      {
        v8 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v7 == 40)
      {
        v8 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("status"));

        v6 = *(_WORD *)(a1 + 140);
        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 136));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ((v6 & 2) != 0)
  {
    v9 = *(int *)(a1 + 132);
    if (v9 >= 0x3F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C04C28[v9];
    }
    if (a2)
      v11 = CFSTR("requestType");
    else
      v11 = CFSTR("request_type");
    objc_msgSend(v5, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "globalResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("globalResult");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("global_result");
    }
    objc_msgSend(v5, "setObject:forKey:", v14, v15);

  }
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v17 = *(id *)(a1 + 104);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v82 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      }
      while (v19);
    }

    if (a2)
      v24 = CFSTR("placeResult");
    else
      v24 = CFSTR("place_result");
    objc_msgSend(v5, "setObject:forKey:", v16, v24);

    v4 = 0x1E0C99000;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend((id)a1, "displayLanguages");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("displayLanguage");
    else
      v26 = CFSTR("display_language");
    objc_msgSend(v5, "setObject:forKey:", v25, v26);

  }
  objc_msgSend((id)a1, "displayRegion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    if (a2)
      v28 = CFSTR("displayRegion");
    else
      v28 = CFSTR("display_region");
    objc_msgSend(v5, "setObject:forKey:", v27, v28);
  }

  if (*(_QWORD *)(a1 + 112))
  {
    objc_msgSend((id)a1, "spokenLanguages");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("spokenLanguage");
    else
      v30 = CFSTR("spoken_language");
    objc_msgSend(v5, "setObject:forKey:", v29, v30);

  }
  objc_msgSend((id)a1, "debugApiKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    if (a2)
      v32 = CFSTR("debugApiKey");
    else
      v32 = CFSTR("debug_api_key");
    objc_msgSend(v5, "setObject:forKey:", v31, v32);
  }

  objc_msgSend((id)a1, "datasetAbStatus");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("datasetAbStatus");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("dataset_ab_status");
    }
    objc_msgSend(v5, "setObject:forKey:", v35, v36);

  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v38 = *(id *)(a1 + 96);
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v78 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v43, "jsonRepresentation");
          else
            objc_msgSend(v43, "dictionaryRepresentation");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v44);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      }
      while (v40);
    }

    if (a2)
      v45 = CFSTR("mapsResult");
    else
      v45 = CFSTR("maps_result");
    objc_msgSend(v5, "setObject:forKey:", v37, v45);

    v4 = 0x1E0C99000uLL;
  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v47 = *(id *)(a1 + 80);
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v74;
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v74 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v52, "jsonRepresentation");
          else
            objc_msgSend(v52, "dictionaryRepresentation");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v53);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      }
      while (v49);
    }

    if (a2)
      v54 = CFSTR("dotPlace");
    else
      v54 = CFSTR("dot_place");
    objc_msgSend(v5, "setObject:forKey:", v46, v54);

  }
  objc_msgSend((id)a1, "analyticData");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v55, "jsonRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("analyticData");
    }
    else
    {
      objc_msgSend(v55, "dictionaryRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("analytic_data");
    }
    objc_msgSend(v5, "setObject:forKey:", v57, v58);

  }
  if ((*(_WORD *)(a1 + 140) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v60 = CFSTR("debugLatencyMs");
    else
      v60 = CFSTR("debug_latency_ms");
    objc_msgSend(v5, "setObject:forKey:", v59, v60);

  }
  objc_msgSend((id)a1, "clientMetrics");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v61, "jsonRepresentation");
    else
      objc_msgSend(v61, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v63, CFSTR("clientMetrics"));

  }
  v64 = *(void **)(a1 + 16);
  if (v64)
  {
    objc_msgSend(v64, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (a2)
    {
      objc_msgSend(*(id *)(v4 + 3592), "dictionaryWithCapacity:", objc_msgSend(v65, "count"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __48__GEOPDPlaceResponse__dictionaryRepresentation___block_invoke;
      v71[3] = &unk_1E1C00600;
      v68 = v67;
      v72 = v68;
      objc_msgSend(v66, "enumerateKeysAndObjectsUsingBlock:", v71);
      v69 = v68;

      v66 = v69;
    }
    objc_msgSend(v5, "setObject:forKey:", v66, CFSTR("Unknown Fields"));

  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDPlaceResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDPlaceResponse)initWithDictionary:(id)a3
{
  return (GEOPDPlaceResponse *)-[GEOPDPlaceResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(unsigned int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  GEOPDPlaceGlobalResult *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  GEOPDPlace *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  GEOPDDatasetABStatus *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  uint64_t v64;
  GEOPDMapsResult *v65;
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  GEOPDDotPlace *v76;
  void *v77;
  uint64_t v78;
  const __CFString *v79;
  void *v80;
  GEOPDPlacesRequestResponseAnalyticsData *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  GEOClientMetrics *v87;
  uint64_t v88;
  void *v89;
  void *v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_286;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_286;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v8 = 20;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v8 = 30;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v8 = 40;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v8 = 50;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v8 = 60;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_27;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setStatus:", v8);
LABEL_27:

  if (a3)
    v9 = CFSTR("requestType");
  else
    v9 = CFSTR("request_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v92 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
    {
      v12 = 0;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
    {
      v12 = 1;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
    {
      v12 = 2;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
    {
      v12 = 3;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
    {
      v12 = 4;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
    {
      v12 = 5;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
    {
      v12 = 6;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
    {
      v12 = 7;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
    {
      v12 = 8;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
    {
      v12 = 9;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
    {
      v12 = 10;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v12 = 11;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
    {
      v12 = 12;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
    {
      v12 = 13;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v12 = 14;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
    {
      v12 = 15;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
    {
      v12 = 16;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
    {
      v12 = 17;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
    {
      v12 = 18;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
    {
      v12 = 19;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
    {
      v12 = 20;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
    {
      v12 = 21;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
    {
      v12 = 22;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
    {
      v12 = 23;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
    {
      v12 = 24;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
    {
      v12 = 25;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
    {
      v12 = 26;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
    {
      v12 = 27;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
    {
      v12 = 28;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
    {
      v12 = 29;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
    {
      v12 = 30;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
    {
      v12 = 31;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
    {
      v12 = 32;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
    {
      v12 = 33;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
    {
      v12 = 34;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
    {
      v12 = 35;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
    {
      v12 = 36;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
    {
      v12 = 37;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
    {
      v12 = 38;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
    {
      v12 = 39;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
    {
      v12 = 40;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
    {
      v12 = 41;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
    {
      v12 = 42;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
    {
      v12 = 43;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
    {
      v12 = 44;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
    {
      v12 = 45;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
    {
      v12 = 46;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
    {
      v12 = 47;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
    {
      v12 = 48;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
    {
      v12 = 49;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
    {
      v12 = 50;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
    {
      v12 = 51;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
    {
      v12 = 52;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
    {
      v12 = 53;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
    {
      v12 = 54;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
    {
      v12 = 55;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
    {
      v12 = 56;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
    {
      v12 = 57;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
    {
      v12 = 58;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
    {
      v12 = 59;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
    {
      v12 = 60;
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
    {
      v12 = 61;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
    {
      v12 = 62;
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_161;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v10, "intValue");
LABEL_161:
    objc_msgSend(a1, "setRequestType:", v12);
  }

  if (a3)
    v13 = CFSTR("globalResult");
  else
    v13 = CFSTR("global_result");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOPDPlaceGlobalResult alloc];
    if (v15)
      v16 = -[GEOPDPlaceGlobalResult _initWithDictionary:isJSON:](v15, v14, a3);
    else
      v16 = 0;
    objc_msgSend(a1, "setGlobalResult:", v16);

  }
  if (a3)
    v17 = CFSTR("placeResult");
  else
    v17 = CFSTR("place_result");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v91 = v18;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v110 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v25 = [GEOPDPlace alloc];
            if ((a3 & 1) != 0)
              v26 = -[GEOPDPlace initWithJSON:](v25, "initWithJSON:", v24);
            else
              v26 = -[GEOPDPlace initWithDictionary:](v25, "initWithDictionary:", v24);
            v27 = (void *)v26;
            objc_msgSend(a1, "addLegacyPlaceResult:", v26, v91);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v109, v117, 16);
      }
      while (v21);
    }

    v18 = v91;
  }

  if (a3)
    v28 = CFSTR("displayLanguage");
  else
    v28 = CFSTR("display_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28, v91);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v106;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v106 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = (void *)objc_msgSend(v35, "copy");
            objc_msgSend(a1, "addDisplayLanguage:", v36);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
      }
      while (v32);
    }

    v5 = v92;
  }

  if (a3)
    v37 = CFSTR("displayRegion");
  else
    v37 = CFSTR("display_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_msgSend(a1, "setDisplayRegion:", v39);

  }
  if (a3)
    v40 = CFSTR("spokenLanguage");
  else
    v40 = CFSTR("spoken_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v42 = v41;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v102;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v102 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = (void *)objc_msgSend(v47, "copy");
            objc_msgSend(a1, "addSpokenLanguage:", v48);

          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
      }
      while (v44);
    }

    v5 = v92;
  }

  if (a3)
    v49 = CFSTR("debugApiKey");
  else
    v49 = CFSTR("debug_api_key");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(a1, "setDebugApiKey:", v51);

  }
  if (a3)
    v52 = CFSTR("datasetAbStatus");
  else
    v52 = CFSTR("dataset_ab_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = [GEOPDDatasetABStatus alloc];
    if ((a3 & 1) != 0)
      v55 = -[GEOPDDatasetABStatus initWithJSON:](v54, "initWithJSON:", v53);
    else
      v55 = -[GEOPDDatasetABStatus initWithDictionary:](v54, "initWithDictionary:", v53);
    v56 = (void *)v55;
    objc_msgSend(a1, "setDatasetAbStatus:", v55);

  }
  if (a3)
    v57 = CFSTR("mapsResult");
  else
    v57 = CFSTR("maps_result");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v59 = v58;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v98;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v98 != v62)
            objc_enumerationMutation(v59);
          v64 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v65 = [GEOPDMapsResult alloc];
            if ((a3 & 1) != 0)
              v66 = -[GEOPDMapsResult initWithJSON:](v65, "initWithJSON:", v64);
            else
              v66 = -[GEOPDMapsResult initWithDictionary:](v65, "initWithDictionary:", v64);
            v67 = (void *)v66;
            objc_msgSend(a1, "addMapsResult:", v66);

          }
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
      }
      while (v61);
    }

    v5 = v92;
  }

  if (a3)
    v68 = CFSTR("dotPlace");
  else
    v68 = CFSTR("dot_place");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v70 = v69;
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v94;
      do
      {
        v74 = 0;
        do
        {
          if (*(_QWORD *)v94 != v73)
            objc_enumerationMutation(v70);
          v75 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v74);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v76 = [GEOPDDotPlace alloc];
            if (v76)
              v77 = (void *)-[GEOPDDotPlace _initWithDictionary:isJSON:]((uint64_t)v76, v75, a3);
            else
              v77 = 0;
            objc_msgSend(a1, "addDotPlace:", v77);

          }
          ++v74;
        }
        while (v72 != v74);
        v78 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
        v72 = v78;
      }
      while (v78);
    }

    v5 = v92;
  }

  if (a3)
    v79 = CFSTR("analyticData");
  else
    v79 = CFSTR("analytic_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = [GEOPDPlacesRequestResponseAnalyticsData alloc];
    if ((a3 & 1) != 0)
      v82 = -[GEOPDPlacesRequestResponseAnalyticsData initWithJSON:](v81, "initWithJSON:", v80);
    else
      v82 = -[GEOPDPlacesRequestResponseAnalyticsData initWithDictionary:](v81, "initWithDictionary:", v80);
    v83 = (void *)v82;
    objc_msgSend(a1, "setAnalyticData:", v82);

  }
  if (a3)
    v84 = CFSTR("debugLatencyMs");
  else
    v84 = CFSTR("debug_latency_ms");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDebugLatencyMs:", objc_msgSend(v85, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientMetrics"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v87 = [GEOClientMetrics alloc];
    if ((a3 & 1) != 0)
      v88 = -[GEOClientMetrics initWithJSON:](v87, "initWithJSON:", v86);
    else
      v88 = -[GEOClientMetrics initWithDictionary:](v87, "initWithDictionary:", v86);
    v89 = (void *)v88;
    objc_msgSend(a1, "setClientMetrics:", v88);

  }
  a1 = a1;

LABEL_286:
  return a1;
}

- (GEOPDPlaceResponse)initWithJSON:(id)a3
{
  return (GEOPDPlaceResponse *)-[GEOPDPlaceResponse _initWithDictionary:isJSON:](self, a3, 1u);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDPlaceResponseClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *globalResult;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  uint64_t j;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int *v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int *v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  int *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t ii;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _BYTE v135[128];
  uint64_t v136;

  v3 = a3;
  v136 = *MEMORY[0x1E0C80C00];
  -[GEOPDPlaceResponse _readDotPlaces]((uint64_t)self);
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v5 = self->_dotPlaces;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v109;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v109 != v8)
        objc_enumerationMutation(v5);
      if ((-[GEOPDDotPlace hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v9), v3) & 1) != 0)
        goto LABEL_156;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v108, v126, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOPDPlaceResponse _readGlobalResult]((uint64_t)self);
  globalResult = (uint64_t *)self->_globalResult;
  if (!globalResult)
    goto LABEL_139;
  -[GEOPDPlaceGlobalResult _readAllCollectionsViewResult]((uint64_t)self->_globalResult);
  v11 = globalResult[6];
  if (v11)
  {
    -[GEOPDAllCollectionsViewResult _readCollectionIds](globalResult[6]);
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v12 = *(id *)(v11 + 24);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v128;
LABEL_13:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v128 != v15)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * v16), "hasGreenTeaWithValue:", v3) & 1) != 0)
          goto LABEL_159;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
          if (v14)
            goto LABEL_13;
          break;
        }
      }
    }

    -[GEOPDAllCollectionsViewResult _readPublisherSuggestionResult](v11);
    if (-[GEOPDPublisherSuggestionResult hasGreenTeaWithValue:](*(_QWORD *)(v11 + 32), v3))
      return 1;
    -[GEOPDAllCollectionsViewResult _readResultFilters](v11);
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v12 = *(id *)(v11 + 40);
    v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, &v131, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v121;
LABEL_22:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v121 != v19)
          objc_enumerationMutation(v12);
        if (-[GEOPDAllCollectionsViewResultFilter hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * v20), v3))
        {
          goto LABEL_159;
        }
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, &v131, 16);
          if (v18)
            goto LABEL_22;
          break;
        }
      }
    }

  }
  -[GEOPDPlaceGlobalResult _readAllGuidesLocationsViewresult]((uint64_t)globalResult);
  v21 = globalResult[7];
  if (v21)
  {
    -[GEOPDAllGuidesLocationsViewResult _readAllGuidesLocationsSections](globalResult[7]);
    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    v12 = *(id *)(v21 + 24);
    v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, &v131, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v121;
      v24 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
      v94 = *(_QWORD *)v121;
LABEL_32:
      v25 = 0;
      v97 = v22;
      while (1)
      {
        if (*(_QWORD *)v121 != v23)
          objc_enumerationMutation(v12);
        v26 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * v25);
        if (v26)
        {
          -[GEOPDAllGuidesLocationsSection _readEntrys](*(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * v25));
          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          v27 = *(id *)(v26 + v24[151]);
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v128;
            while (2)
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v128 != v30)
                  objc_enumerationMutation(v27);
                if ((-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i), v3) & 1) != 0)
                {

                  goto LABEL_159;
                }
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
              if (v29)
                continue;
              break;
            }
          }

          -[GEOPDAllGuidesLocationsSection _readSectionHeader](v26);
          v32 = *(_QWORD *)(v26 + 32);
          v24 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
          if (v32)
          {
            -[GEOPDAllGuidesLocationsSectionHeader _readPlaceId](v32);
            if ((objc_msgSend(*(id *)(v32 + 32), "hasGreenTeaWithValue:", v3) & 1) != 0)
              break;
          }
        }
        ++v25;
        v23 = v94;
        if (v25 == v97)
        {
          v22 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, &v131, 16);
          if (v22)
            goto LABEL_32;
          goto LABEL_48;
        }
      }
LABEL_159:

      return 1;
    }
LABEL_48:

  }
  -[GEOPDPlaceGlobalResult _readAutocompleteResult]((uint64_t)globalResult);
  v33 = globalResult[8];
  if (!v33)
    goto LABEL_69;
  -[GEOPDAutocompleteResult _readPlaceSummaryLayoutMetadata](globalResult[8]);
  if (objc_msgSend(*(id *)(v33 + 48), "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDAutocompleteResult _readSections](v33);
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v12 = *(id *)(v33 + 56);
  v34 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, &v131, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v121;
    v37 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
    v98 = *(_QWORD *)v121;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v121 != v36)
          objc_enumerationMutation(v12);
        v39 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * j);
        if (v39)
        {
          -[GEOPDAutocompleteResultSection _readEntries](*(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * j));
          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          v40 = *(id *)(v39 + v37[188]);
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v128;
            while (2)
            {
              for (k = 0; k != v42; ++k)
              {
                if (*(_QWORD *)v128 != v43)
                  objc_enumerationMutation(v40);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * k), "hasGreenTeaWithValue:", v3) & 1) != 0)
                {

                  goto LABEL_159;
                }
              }
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
              if (v42)
                continue;
              break;
            }
          }

        }
        v36 = v98;
        v37 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
      }
      v35 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v120, &v131, 16);
    }
    while (v35);
  }

LABEL_69:
  -[GEOPDPlaceGlobalResult _readBatchSpatialLookupResult]((uint64_t)globalResult);
  v45 = globalResult[13];
  if (v45)
  {
    -[GEOPDBatchSpatialLookupResult _readSpatialEventLookupResults](globalResult[13]);
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v12 = *(id *)(v45 + 24);
    v46 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v116, &v131, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v117;
      v48 = &OBJC_IVAR___GEOPDAutocompleteResultSection__readerMarkLength;
      v49 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
      v99 = v12;
      v93 = *(_QWORD *)v117;
      do
      {
        v50 = 0;
        v95 = v46;
        do
        {
          if (*(_QWORD *)v117 != v47)
            objc_enumerationMutation(v12);
          v51 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v50);
          if (v51)
          {
            -[GEOPDSpatialEventLookupResult _readDisplayMapRegion](*(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v50));
            v52 = v48;
            if (objc_msgSend(*(id *)(v51 + v48[704]), "hasGreenTeaWithValue:", v3))
              goto LABEL_159;
            -[GEOPDSpatialEventLookupResult _readEvents](v51);
            v122 = 0u;
            v123 = 0u;
            v120 = 0u;
            v121 = 0u;
            v53 = *(id *)(v51 + v49[655]);
            v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
            if (v54)
            {
              v55 = v54;
              v56 = *(_QWORD *)v121;
              while (2)
              {
                for (m = 0; m != v55; ++m)
                {
                  if (*(_QWORD *)v121 != v56)
                    objc_enumerationMutation(v53);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * m), "hasGreenTeaWithValue:", v3) & 1) != 0)
                  {

LABEL_165:
                    v12 = v99;
                    goto LABEL_159;
                  }
                }
                v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
                if (v55)
                  continue;
                break;
              }
            }

          }
          else
          {
            v52 = v48;
          }
          ++v50;
          v12 = v99;
          v47 = v93;
          v48 = v52;
          v49 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
        }
        while (v50 != v95);
        v46 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v116, &v131, 16);
      }
      while (v46);
    }

    -[GEOPDBatchSpatialLookupResult _readSpatialPlaceLookupResults](v45);
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v58 = *(id *)(v45 + 32);
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v112, &v127, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v113;
      v62 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
      v63 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
      v96 = *(_QWORD *)v113;
      v99 = v58;
      do
      {
        v64 = 0;
        do
        {
          if (*(_QWORD *)v113 != v61)
            objc_enumerationMutation(v58);
          v65 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * v64);
          if (v65)
          {
            -[GEOPDSpatialPlaceLookupResult _readDisplayMapRegion](*(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * v64));
            v66 = v62;
            if (objc_msgSend(*(id *)(v65 + v62[661]), "hasGreenTeaWithValue:", v3))
              goto LABEL_165;
            -[GEOPDSpatialPlaceLookupResult _readPlaces](v65);
            v122 = 0u;
            v123 = 0u;
            v120 = 0u;
            v121 = 0u;
            v67 = *(id *)(v65 + v63[660]);
            v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
            if (v68)
            {
              v69 = v68;
              v70 = *(_QWORD *)v121;
              while (2)
              {
                for (n = 0; n != v69; ++n)
                {
                  if (*(_QWORD *)v121 != v70)
                    objc_enumerationMutation(v67);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * n), "hasGreenTeaWithValue:", v3) & 1) != 0)
                  {

                    goto LABEL_165;
                  }
                }
                v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v120, v135, 16);
                if (v69)
                  continue;
                break;
              }
            }

          }
          else
          {
            v66 = v62;
          }
          ++v64;
          v61 = v96;
          v58 = v99;
          v62 = v66;
          v63 = &OBJC_IVAR___GEORawPathGeometry__pathMatcherInstructions;
        }
        while (v64 != v60);
        v72 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v112, &v127, 16);
        v60 = v72;
      }
      while (v72);
    }

  }
  -[GEOPDPlaceGlobalResult _readCategorySearchResult]((uint64_t)globalResult);
  v73 = globalResult[17];
  if (v73)
  {
    -[GEOPDCategorySearchResult _readDisplayMapRegion](globalResult[17]);
    if ((objc_msgSend(*(id *)(v73 + 56), "hasGreenTeaWithValue:", v3) & 1) != 0)
      return 1;
    -[GEOPDCategorySearchResult _readPlaceSummaryLayoutMetadata](v73);
    if ((objc_msgSend(*(id *)(v73 + 80), "hasGreenTeaWithValue:", v3) & 1) != 0)
      return 1;
    -[GEOPDCategorySearchResult _readRelatedEntitySections](v73);
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v74 = *(id *)(v73 + 96);
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v131, v135, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v132;
      while (2)
      {
        for (ii = 0; ii != v76; ++ii)
        {
          if (*(_QWORD *)v132 != v77)
            objc_enumerationMutation(v74);
          if ((-[GEOPDRelatedEntitySection hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * ii), v3) & 1) != 0)
          {

            return 1;
          }
        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v131, v135, 16);
        if (v76)
          continue;
        break;
      }
    }

    -[GEOPDCategorySearchResult _readResultRefinementGroup](v73);
    if (-[GEOPDResultRefinementGroup hasGreenTeaWithValue:](*(_QWORD *)(v73 + 120), v3))
      return 1;
    -[GEOPDCategorySearchResult _readSectionList](v73);
    if ((-[GEOPDSearchSectionList hasGreenTeaWithValue:](*(_QWORD *)(v73 + 152), v3) & 1) != 0)
      return 1;
  }
  -[GEOPDPlaceGlobalResult _readCollectionSuggestionResult]((uint64_t)globalResult);
  if ((-[GEOPDCollectionSuggestionResult hasGreenTeaWithValue:](globalResult[19], v3) & 1) != 0)
    return 1;
  -[GEOPDPlaceGlobalResult _readGuidesHomeResult]((uint64_t)globalResult);
  if ((-[GEOPDGuidesHomeResult hasGreenTeaWithValue:](globalResult[25], v3) & 1) != 0)
    return 1;
  -[GEOPDPlaceGlobalResult _readIpGeoLookupResult]((uint64_t)globalResult);
  v79 = globalResult[26];
  if (v79)
  {
    -[GEOPDIpGeoLookupResult _readLocation](globalResult[26]);
    if ((objc_msgSend(*(id *)(v79 + 40), "hasGreenTeaWithValue:", v3) & 1) != 0)
      return 1;
  }
  -[GEOPDPlaceGlobalResult _readLocationDirectedSearchResult]((uint64_t)globalResult);
  v80 = globalResult[27];
  if (v80)
  {
    -[GEOPDLocationDirectedSearchResult _readDisplayMapRegion](globalResult[27]);
    if ((objc_msgSend(*(id *)(v80 + 32), "hasGreenTeaWithValue:", v3) & 1) != 0)
      return 1;
  }
  -[GEOPDPlaceGlobalResult _readMapsHomeResult]((uint64_t)globalResult);
  if ((-[GEOPDMapsHomeResult hasGreenTeaWithValue:](globalResult[28], v3) & 1) != 0)
    return 1;
  -[GEOPDPlaceGlobalResult _readMapsSearchHomeResult]((uint64_t)globalResult);
  if ((-[GEOPDMapsSearchHomeResult hasGreenTeaWithValue:](globalResult[30], v3) & 1) != 0)
    return 1;
  -[GEOPDPlaceGlobalResult _readPlaceCollectionLookupResult]((uint64_t)globalResult);
  v81 = globalResult[34];
  if (v81)
  {
    if ((-[GEOPDComponent hasGreenTeaWithValue:](*(_QWORD *)(v81 + 16), v3) & 1) != 0)
      return 1;
  }
  -[GEOPDPlaceGlobalResult _readPopularNearbySearchResult]((uint64_t)globalResult);
  v82 = globalResult[40];
  if (v82)
  {
    -[GEOPDPopularNearbySearchResult _readDisplayMapRegion](globalResult[40]);
    if ((objc_msgSend(*(id *)(v82 + 24), "hasGreenTeaWithValue:", v3) & 1) != 0)
      return 1;
  }
  -[GEOPDPlaceGlobalResult _readPublisherViewResult]((uint64_t)globalResult);
  if ((-[GEOPDPublisherViewResult hasGreenTeaWithValue:](globalResult[41], v3) & 1) != 0)
    return 1;
  -[GEOPDPlaceGlobalResult _readQueryUnderstandingResult]((uint64_t)globalResult);
  if ((-[GEOPDQueryUnderstandingResult hasGreenTeaWithValue:](globalResult[42], v3) & 1) != 0)
    return 1;
  -[GEOPDPlaceGlobalResult _readSearchResult]((uint64_t)globalResult);
  if ((-[GEOPDSearchResult hasGreenTeaWithValue:](globalResult[46], v3) & 1) != 0)
    return 1;
LABEL_139:
  -[GEOPDPlaceResponse _readMapsResults]((uint64_t)self);
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v5 = self->_mapsResults;
  v83 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v105;
LABEL_141:
    v86 = 0;
    while (1)
    {
      if (*(_QWORD *)v105 != v85)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * v86), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_156;
      if (v84 == ++v86)
      {
        v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v104, v125, 16);
        if (v84)
          goto LABEL_141;
        break;
      }
    }
  }

  -[GEOPDPlaceResponse _readLegacyPlaceResults]((uint64_t)self);
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v5 = self->_legacyPlaceResults;
  v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v101;
LABEL_149:
    v90 = 0;
    while (1)
    {
      if (*(_QWORD *)v101 != v89)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * v90), "hasGreenTeaWithValue:", v3) & 1) != 0)
        break;
      if (v88 == ++v90)
      {
        v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v100, v124, 16);
        if (v88)
          goto LABEL_149;
        goto LABEL_155;
      }
    }
LABEL_156:
    v91 = 1;
    goto LABEL_157;
  }
LABEL_155:
  v91 = 0;
LABEL_157:

  return v91;
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  void *v24;
  id *v25;
  id *v26;

  v26 = (id *)a3;
  -[GEOPDPlaceResponse readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v26 + 1, self->_reader);
  *((_DWORD *)v26 + 30) = self->_readerMarkPos;
  *((_DWORD *)v26 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v26 + 34) = self->_status;
    *((_WORD *)v26 + 70) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v26 + 33) = self->_requestType;
    *((_WORD *)v26 + 70) |= 2u;
  }
  if (self->_globalResult)
    objc_msgSend(v26, "setGlobalResult:");
  if (-[GEOPDPlaceResponse legacyPlaceResultsCount](self, "legacyPlaceResultsCount"))
  {
    objc_msgSend(v26, "clearLegacyPlaceResults");
    v5 = -[GEOPDPlaceResponse legacyPlaceResultsCount](self, "legacyPlaceResultsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOPDPlaceResponse legacyPlaceResultAtIndex:](self, "legacyPlaceResultAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addLegacyPlaceResult:", v8);

      }
    }
  }
  if (-[GEOPDPlaceResponse displayLanguagesCount](self, "displayLanguagesCount"))
  {
    objc_msgSend(v26, "clearDisplayLanguages");
    v9 = -[GEOPDPlaceResponse displayLanguagesCount](self, "displayLanguagesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOPDPlaceResponse displayLanguageAtIndex:](self, "displayLanguageAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addDisplayLanguage:", v12);

      }
    }
  }
  if (self->_displayRegion)
    objc_msgSend(v26, "setDisplayRegion:");
  if (-[GEOPDPlaceResponse spokenLanguagesCount](self, "spokenLanguagesCount"))
  {
    objc_msgSend(v26, "clearSpokenLanguages");
    v13 = -[GEOPDPlaceResponse spokenLanguagesCount](self, "spokenLanguagesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOPDPlaceResponse spokenLanguageAtIndex:](self, "spokenLanguageAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSpokenLanguage:", v16);

      }
    }
  }
  if (self->_debugApiKey)
    objc_msgSend(v26, "setDebugApiKey:");
  if (self->_datasetAbStatus)
    objc_msgSend(v26, "setDatasetAbStatus:");
  if (-[GEOPDPlaceResponse mapsResultsCount](self, "mapsResultsCount"))
  {
    objc_msgSend(v26, "clearMapsResults");
    v17 = -[GEOPDPlaceResponse mapsResultsCount](self, "mapsResultsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[GEOPDPlaceResponse mapsResultAtIndex:](self, "mapsResultAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addMapsResult:", v20);

      }
    }
  }
  if (-[GEOPDPlaceResponse dotPlacesCount](self, "dotPlacesCount"))
  {
    objc_msgSend(v26, "clearDotPlaces");
    v21 = -[GEOPDPlaceResponse dotPlacesCount](self, "dotPlacesCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
      {
        -[GEOPDPlaceResponse dotPlaceAtIndex:](self, "dotPlaceAtIndex:", n);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addDotPlace:", v24);

      }
    }
  }
  if (self->_analyticData)
    objc_msgSend(v26, "setAnalyticData:");
  v25 = v26;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v26[7] = (id)self->_debugLatencyMs;
    *((_WORD *)v26 + 70) |= 1u;
  }
  if (self->_clientMetrics)
  {
    objc_msgSend(v26, "setClientMetrics:");
    v25 = v26;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  PBUnknownFields *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceResponseReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_47;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceResponse readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_status;
    *(_WORD *)(v5 + 140) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_requestType;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  v10 = -[GEOPDPlaceGlobalResult copyWithZone:](self->_globalResult, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v10;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v12 = self->_legacyPlaceResults;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLegacyPlaceResult:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v13);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v17 = self->_displayLanguages;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v62 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisplayLanguage:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v18);
  }

  v22 = -[NSString copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v22;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v24 = self->_spokenLanguages;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(v24);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSpokenLanguage:", v28);

      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    }
    while (v25);
  }

  v29 = -[NSString copyWithZone:](self->_debugApiKey, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v29;

  v31 = -[GEOPDDatasetABStatus copyWithZone:](self->_datasetAbStatus, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v31;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v33 = self->_mapsResults;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v54;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMapsResult:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
    }
    while (v34);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v38 = self->_dotPlaces;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v50;
    do
    {
      for (n = 0; n != v39; ++n)
      {
        if (*(_QWORD *)v50 != v40)
          objc_enumerationMutation(v38);
        v42 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v49);
        objc_msgSend((id)v5, "addDotPlace:", v42);

      }
      v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    }
    while (v39);
  }

  v43 = -[GEOPDPlacesRequestResponseAnalyticsData copyWithZone:](self->_analyticData, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v43;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_debugLatencyMs;
    *(_WORD *)(v5 + 140) |= 1u;
  }
  v45 = -[GEOClientMetrics copyWithZone:](self->_clientMetrics, "copyWithZone:", a3, (_QWORD)v49);
  v46 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v45;

  v47 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v47;
LABEL_47:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOPDPlaceGlobalResult *globalResult;
  NSMutableArray *legacyPlaceResults;
  NSMutableArray *displayLanguages;
  NSString *displayRegion;
  NSMutableArray *spokenLanguages;
  NSString *debugApiKey;
  GEOPDDatasetABStatus *datasetAbStatus;
  NSMutableArray *mapsResults;
  NSMutableArray *dotPlaces;
  GEOPDPlacesRequestResponseAnalyticsData *analyticData;
  __int16 v17;
  GEOClientMetrics *clientMetrics;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  -[GEOPDPlaceResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 70);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_status != *((_DWORD *)v4 + 34))
      goto LABEL_39;
  }
  else if ((v6 & 4) != 0)
  {
LABEL_39:
    v19 = 0;
    goto LABEL_40;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_requestType != *((_DWORD *)v4 + 33))
      goto LABEL_39;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_39;
  }
  globalResult = self->_globalResult;
  if ((unint64_t)globalResult | *((_QWORD *)v4 + 11)
    && !-[GEOPDPlaceGlobalResult isEqual:](globalResult, "isEqual:"))
  {
    goto LABEL_39;
  }
  legacyPlaceResults = self->_legacyPlaceResults;
  if ((unint64_t)legacyPlaceResults | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](legacyPlaceResults, "isEqual:"))
      goto LABEL_39;
  }
  displayLanguages = self->_displayLanguages;
  if ((unint64_t)displayLanguages | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](displayLanguages, "isEqual:"))
      goto LABEL_39;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](displayRegion, "isEqual:"))
      goto LABEL_39;
  }
  spokenLanguages = self->_spokenLanguages;
  if ((unint64_t)spokenLanguages | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](spokenLanguages, "isEqual:"))
      goto LABEL_39;
  }
  debugApiKey = self->_debugApiKey;
  if ((unint64_t)debugApiKey | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](debugApiKey, "isEqual:"))
      goto LABEL_39;
  }
  datasetAbStatus = self->_datasetAbStatus;
  if ((unint64_t)datasetAbStatus | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:"))
      goto LABEL_39;
  }
  mapsResults = self->_mapsResults;
  if ((unint64_t)mapsResults | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](mapsResults, "isEqual:"))
      goto LABEL_39;
  }
  dotPlaces = self->_dotPlaces;
  if ((unint64_t)dotPlaces | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](dotPlaces, "isEqual:"))
      goto LABEL_39;
  }
  analyticData = self->_analyticData;
  if ((unint64_t)analyticData | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDPlacesRequestResponseAnalyticsData isEqual:](analyticData, "isEqual:"))
      goto LABEL_39;
  }
  v17 = *((_WORD *)v4 + 70);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_debugLatencyMs != *((_QWORD *)v4 + 7))
      goto LABEL_39;
  }
  else if ((v17 & 1) != 0)
  {
    goto LABEL_39;
  }
  clientMetrics = self->_clientMetrics;
  if ((unint64_t)clientMetrics | *((_QWORD *)v4 + 4))
    v19 = -[GEOClientMetrics isEqual:](clientMetrics, "isEqual:");
  else
    v19 = 1;
LABEL_40:

  return v19;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  -[GEOPDPlaceResponse readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v17 = 2654435761 * self->_status;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v17 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v16 = 2654435761 * self->_requestType;
      goto LABEL_6;
    }
  }
  v16 = 0;
LABEL_6:
  v15 = -[GEOPDPlaceGlobalResult hash](self->_globalResult, "hash");
  v14 = -[NSMutableArray hash](self->_legacyPlaceResults, "hash");
  v4 = -[NSMutableArray hash](self->_displayLanguages, "hash");
  v5 = -[NSString hash](self->_displayRegion, "hash");
  v6 = -[NSMutableArray hash](self->_spokenLanguages, "hash");
  v7 = -[NSString hash](self->_debugApiKey, "hash");
  v8 = -[GEOPDDatasetABStatus hash](self->_datasetAbStatus, "hash");
  v9 = -[NSMutableArray hash](self->_mapsResults, "hash");
  v10 = -[NSMutableArray hash](self->_dotPlaces, "hash");
  v11 = -[GEOPDPlacesRequestResponseAnalyticsData hash](self->_analyticData, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v12 = 2654435761u * self->_debugLatencyMs;
  else
    v12 = 0;
  return v16 ^ v17 ^ v14 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[GEOClientMetrics hash](self->_clientMetrics, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  GEOPDPlaceGlobalResult *globalResult;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  GEOPDDatasetABStatus *datasetAbStatus;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t n;
  GEOPDPlacesRequestResponseAnalyticsData *analyticData;
  uint64_t v36;
  GEOClientMetrics *clientMetrics;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 70);
  if ((v5 & 4) != 0)
  {
    self->_status = *((_DWORD *)v4 + 34);
    *(_WORD *)&self->_flags |= 4u;
    v5 = *((_WORD *)v4 + 70);
  }
  if ((v5 & 2) != 0)
  {
    self->_requestType = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_flags |= 2u;
  }
  globalResult = self->_globalResult;
  v7 = (void *)*((_QWORD *)v4 + 11);
  if (globalResult)
  {
    if (v7)
      -[GEOPDPlaceGlobalResult mergeFrom:](globalResult, v7);
  }
  else if (v7)
  {
    -[GEOPDPlaceResponse setGlobalResult:](self, "setGlobalResult:", *((_QWORD *)v4 + 11));
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v8 = *((id *)v4 + 13);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(v8);
        -[GEOPDPlaceResponse addLegacyPlaceResult:](self, "addLegacyPlaceResult:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v10);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v13 = *((id *)v4 + 8);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v52 != v16)
          objc_enumerationMutation(v13);
        -[GEOPDPlaceResponse addDisplayLanguage:](self, "addDisplayLanguage:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v15);
  }

  if (*((_QWORD *)v4 + 9))
    -[GEOPDPlaceResponse setDisplayRegion:](self, "setDisplayRegion:");
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v18 = *((id *)v4 + 14);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v48 != v21)
          objc_enumerationMutation(v18);
        -[GEOPDPlaceResponse addSpokenLanguage:](self, "addSpokenLanguage:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    }
    while (v20);
  }

  if (*((_QWORD *)v4 + 6))
    -[GEOPDPlaceResponse setDebugApiKey:](self, "setDebugApiKey:");
  datasetAbStatus = self->_datasetAbStatus;
  v24 = *((_QWORD *)v4 + 5);
  if (datasetAbStatus)
  {
    if (v24)
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEOPDPlaceResponse setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v25 = *((id *)v4 + 12);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v44 != v28)
          objc_enumerationMutation(v25);
        -[GEOPDPlaceResponse addMapsResult:](self, "addMapsResult:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * m));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v60, 16);
    }
    while (v27);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v30 = *((id *)v4 + 10);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v40;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(v30);
        -[GEOPDPlaceResponse addDotPlace:](self, "addDotPlace:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * n), (_QWORD)v39);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    }
    while (v32);
  }

  analyticData = self->_analyticData;
  v36 = *((_QWORD *)v4 + 3);
  if (analyticData)
  {
    if (v36)
      -[GEOPDPlacesRequestResponseAnalyticsData mergeFrom:](analyticData, "mergeFrom:");
  }
  else if (v36)
  {
    -[GEOPDPlaceResponse setAnalyticData:](self, "setAnalyticData:");
  }
  if ((*((_WORD *)v4 + 70) & 1) != 0)
  {
    self->_debugLatencyMs = *((_QWORD *)v4 + 7);
    *(_WORD *)&self->_flags |= 1u;
  }
  clientMetrics = self->_clientMetrics;
  v38 = *((_QWORD *)v4 + 4);
  if (clientMetrics)
  {
    if (v38)
      -[GEOClientMetrics mergeFrom:](clientMetrics, "mergeFrom:");
  }
  else if (v38)
  {
    -[GEOPDPlaceResponse setClientMetrics:](self, "setClientMetrics:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDPlaceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4587);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x8008u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDPlaceResponse readAll:](self, "readAll:", 0);
    -[GEOPDPlaceGlobalResult clearUnknownFields:]((uint64_t)self->_globalResult);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_legacyPlaceResults;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    -[GEOPDDatasetABStatus clearUnknownFields:](self->_datasetAbStatus, "clearUnknownFields:", 1);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = self->_mapsResults;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v14);
    }

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = self->_dotPlaces;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          -[GEOPDDotPlace clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v21++), 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

    -[GEOPDPlacesRequestResponseAnalyticsData clearUnknownFields:](self->_analyticData, "clearUnknownFields:", 1, (_QWORD)v22);
    -[GEOClientMetrics clearUnknownFields:](self->_clientMetrics, "clearUnknownFields:", 1);
  }
}

- (unint64_t)debugLatencyMs
{
  return self->_debugLatencyMs;
}

- (void)setDebugLatencyMs:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x8001u;
  self->_debugLatencyMs = a3;
}

- (void)setHasDebugLatencyMs:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0x7FFE | a3 | 0x8000;
}

- (BOOL)hasDebugLatencyMs
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readClientMetrics
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceResponseReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientMetrics_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasClientMetrics
{
  -[GEOPDPlaceResponse _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics != 0;
}

- (GEOClientMetrics)clientMetrics
{
  -[GEOPDPlaceResponse _readClientMetrics]((uint64_t)self);
  return self->_clientMetrics;
}

@end
