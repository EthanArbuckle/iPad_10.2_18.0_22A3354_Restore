@implementation GEORPPoiEnrichmentUpdate

- (GEORPPoiEnrichmentUpdate)init
{
  GEORPPoiEnrichmentUpdate *v2;
  GEORPPoiEnrichmentUpdate *v3;
  GEORPPoiEnrichmentUpdate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiEnrichmentUpdate;
  v2 = -[GEORPPoiEnrichmentUpdate init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiEnrichmentUpdate)initWithData:(id)a3
{
  GEORPPoiEnrichmentUpdate *v3;
  GEORPPoiEnrichmentUpdate *v4;
  GEORPPoiEnrichmentUpdate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiEnrichmentUpdate;
  v3 = -[GEORPPoiEnrichmentUpdate initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)action
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_action;
  else
    return 0;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C071F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_ADD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_REMOVE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlace
{
  -[GEORPPoiEnrichmentUpdate _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPPoiEnrichmentUpdate _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readImageIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageIds_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)imageIds
{
  -[GEORPPoiEnrichmentUpdate _readImageIds]((uint64_t)self);
  return self->_imageIds;
}

- (void)setImageIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *imageIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  imageIds = self->_imageIds;
  self->_imageIds = v4;

}

- (void)clearImageIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_imageIds, "removeAllObjects");
}

- (void)addImageId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPPoiEnrichmentUpdate _readImageIds]((uint64_t)self);
  -[GEORPPoiEnrichmentUpdate _addNoFlagsImageId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImageId:(uint64_t)a1
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

- (unint64_t)imageIdsCount
{
  -[GEORPPoiEnrichmentUpdate _readImageIds]((uint64_t)self);
  return -[NSMutableArray count](self->_imageIds, "count");
}

- (id)imageIdAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichmentUpdate _readImageIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_imageIds, "objectAtIndex:", a3);
}

+ (Class)imageIdType
{
  return (Class)objc_opt_class();
}

- (void)_readScorecard
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScorecard_tags_268);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasScorecard
{
  -[GEORPPoiEnrichmentUpdate _readScorecard]((uint64_t)self);
  return self->_scorecard != 0;
}

- (GEORPScorecard)scorecard
{
  -[GEORPPoiEnrichmentUpdate _readScorecard]((uint64_t)self);
  return self->_scorecard;
}

- (void)setScorecard:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_scorecard, a3);
}

- (void)_readImageUpdates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImageUpdates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)imageUpdates
{
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  return self->_imageUpdates;
}

- (void)setImageUpdates:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *imageUpdates;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  imageUpdates = self->_imageUpdates;
  self->_imageUpdates = v4;

}

- (void)clearImageUpdates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_imageUpdates, "removeAllObjects");
}

- (void)addImageUpdate:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  -[GEORPPoiEnrichmentUpdate _addNoFlagsImageUpdate:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImageUpdate:(uint64_t)a1
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

- (unint64_t)imageUpdatesCount
{
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  return -[NSMutableArray count](self->_imageUpdates, "count");
}

- (id)imageUpdateAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_imageUpdates, "objectAtIndex:", a3);
}

+ (Class)imageUpdateType
{
  return (Class)objc_opt_class();
}

- (void)_readScorecardUpdate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readScorecardUpdate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasScorecardUpdate
{
  -[GEORPPoiEnrichmentUpdate _readScorecardUpdate]((uint64_t)self);
  return self->_scorecardUpdate != 0;
}

- (GEORPScorecardUpdate)scorecardUpdate
{
  -[GEORPPoiEnrichmentUpdate _readScorecardUpdate]((uint64_t)self);
  return self->_scorecardUpdate;
}

- (void)setScorecardUpdate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_scorecardUpdate, a3);
}

- (void)_readPlaceContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiEnrichmentUpdateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlaceContext
{
  -[GEORPPoiEnrichmentUpdate _readPlaceContext]((uint64_t)self);
  return self->_placeContext != 0;
}

- (GEORPPoiEnrichmentPlaceContext)placeContext
{
  -[GEORPPoiEnrichmentUpdate _readPlaceContext]((uint64_t)self);
  return self->_placeContext;
}

- (void)setPlaceContext:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_placeContext, a3);
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
  v8.super_class = (Class)GEORPPoiEnrichmentUpdate;
  -[GEORPPoiEnrichmentUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPoiEnrichmentUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiEnrichmentUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v5 = *(int *)(a1 + 76);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C071F0[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("action"));

  }
  objc_msgSend((id)a1, "place");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("place"));

  }
  if (*(_QWORD *)(a1 + 16))
  {
    objc_msgSend((id)a1, "imageIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("imageId");
    else
      v11 = CFSTR("image_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  objc_msgSend((id)a1, "scorecard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v12, "jsonRepresentation");
    else
      objc_msgSend(v12, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("scorecard"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = *(id *)(a1 + 24);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v21, "jsonRepresentation");
          else
            objc_msgSend(v21, "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v18);
    }

    if (a2)
      v23 = CFSTR("imageUpdate");
    else
      v23 = CFSTR("image_update");
    objc_msgSend(v4, "setObject:forKey:", v15, v23);

  }
  objc_msgSend((id)a1, "scorecardUpdate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("scorecardUpdate");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("scorecard_update");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  objc_msgSend((id)a1, "placeContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("placeContext");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("place_context");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiEnrichmentUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPPoiEnrichmentUpdate)initWithDictionary:(id)a3
{
  return (GEORPPoiEnrichmentUpdate *)-[GEORPPoiEnrichmentUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEOPDPlace *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  GEORPScorecard *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  GEORPImageUpdate *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  GEORPScorecardUpdate *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  GEORPPoiEnrichmentPlaceContext *v44;
  uint64_t v45;
  void *v46;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_75;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_75;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_ADD")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_REMOVE")) & 1) != 0)
    {
      v8 = 2;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED")))
    {
      v8 = 3;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_16:
    objc_msgSend(a1, "setAction:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOPDPlace alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOPDPlace initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOPDPlace initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setPlace:", v11);

  }
  if (a3)
    v13 = CFSTR("imageId");
  else
    v13 = CFSTR("image_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v48 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v54 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = (void *)objc_msgSend(v20, "copy");
            objc_msgSend(a1, "addImageId:", v21);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v17);
    }

    v5 = v48;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scorecard"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = [GEORPScorecard alloc];
    if ((a3 & 1) != 0)
      v24 = -[GEORPScorecard initWithJSON:](v23, "initWithJSON:", v22);
    else
      v24 = -[GEORPScorecard initWithDictionary:](v23, "initWithDictionary:", v22);
    v25 = (void *)v24;
    objc_msgSend(a1, "setScorecard:", v24);

  }
  if (a3)
    v26 = CFSTR("imageUpdate");
  else
    v26 = CFSTR("image_update");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v28 = v27;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v50 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = [GEORPImageUpdate alloc];
            if ((a3 & 1) != 0)
              v35 = -[GEORPImageUpdate initWithJSON:](v34, "initWithJSON:", v33);
            else
              v35 = -[GEORPImageUpdate initWithDictionary:](v34, "initWithDictionary:", v33);
            v36 = (void *)v35;
            objc_msgSend(a1, "addImageUpdate:", v35);

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v30);
    }

    v5 = v48;
  }

  if (a3)
    v37 = CFSTR("scorecardUpdate");
  else
    v37 = CFSTR("scorecard_update");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = [GEORPScorecardUpdate alloc];
    if ((a3 & 1) != 0)
      v40 = -[GEORPScorecardUpdate initWithJSON:](v39, "initWithJSON:", v38);
    else
      v40 = -[GEORPScorecardUpdate initWithDictionary:](v39, "initWithDictionary:", v38);
    v41 = (void *)v40;
    objc_msgSend(a1, "setScorecardUpdate:", v40);

  }
  if (a3)
    v42 = CFSTR("placeContext");
  else
    v42 = CFSTR("place_context");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = [GEORPPoiEnrichmentPlaceContext alloc];
    if ((a3 & 1) != 0)
      v45 = -[GEORPPoiEnrichmentPlaceContext initWithJSON:](v44, "initWithJSON:", v43);
    else
      v45 = -[GEORPPoiEnrichmentPlaceContext initWithDictionary:](v44, "initWithDictionary:", v43);
    v46 = (void *)v45;
    objc_msgSend(a1, "setPlaceContext:", v45);

  }
LABEL_75:

  return a1;
}

- (GEORPPoiEnrichmentUpdate)initWithJSON:(id)a3
{
  return (GEORPPoiEnrichmentUpdate *)-[GEORPPoiEnrichmentUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_287;
    else
      v8 = (int *)&readAll__nonRecursiveTag_288;
    GEORPPoiEnrichmentUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPPoiEnrichmentUpdateCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiEnrichmentUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiEnrichmentUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  if (self->_reader && (_GEORPPoiEnrichmentUpdateIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPPoiEnrichmentUpdate readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_place)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_imageIds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if (self->_scorecard)
      PBDataWriterWriteSubmessage();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_imageUpdates;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_scorecardUpdate)
      PBDataWriterWriteSubmessage();
    if (self->_placeContext)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPPoiEnrichmentUpdateClearSensitiveFields((uint64_t)self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEORPPoiEnrichmentUpdate _readImageUpdates]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_imageUpdates;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEORPPoiEnrichmentUpdate _readPlace]((uint64_t)self);
  if (-[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPPoiEnrichmentUpdate _readPlaceContext]((uint64_t)self);
  return -[GEORPPoiEnrichmentPlaceContext hasGreenTeaWithValue:](self->_placeContext, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEORPPoiEnrichmentUpdate readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 16) = self->_readerMarkPos;
  *((_DWORD *)v13 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v13 + 19) = self->_action;
    *((_BYTE *)v13 + 80) |= 1u;
  }
  if (self->_place)
    objc_msgSend(v13, "setPlace:");
  if (-[GEORPPoiEnrichmentUpdate imageIdsCount](self, "imageIdsCount"))
  {
    objc_msgSend(v13, "clearImageIds");
    v4 = -[GEORPPoiEnrichmentUpdate imageIdsCount](self, "imageIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPPoiEnrichmentUpdate imageIdAtIndex:](self, "imageIdAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addImageId:", v7);

      }
    }
  }
  if (self->_scorecard)
    objc_msgSend(v13, "setScorecard:");
  if (-[GEORPPoiEnrichmentUpdate imageUpdatesCount](self, "imageUpdatesCount"))
  {
    objc_msgSend(v13, "clearImageUpdates");
    v8 = -[GEORPPoiEnrichmentUpdate imageUpdatesCount](self, "imageUpdatesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPPoiEnrichmentUpdate imageUpdateAtIndex:](self, "imageUpdateAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addImageUpdate:", v11);

      }
    }
  }
  if (self->_scorecardUpdate)
    objc_msgSend(v13, "setScorecardUpdate:");
  v12 = v13;
  if (self->_placeContext)
  {
    objc_msgSend(v13, "setPlaceContext:");
    v12 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
      GEORPPoiEnrichmentUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPoiEnrichmentUpdate readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_action;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v9 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = self->_imageIds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addImageId:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

  v16 = -[GEORPScorecard copyWithZone:](self->_scorecard, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_imageUpdates;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addImageUpdate:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  v23 = -[GEORPScorecardUpdate copyWithZone:](self->_scorecardUpdate, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v23;

  v25 = -[GEORPPoiEnrichmentPlaceContext copyWithZone:](self->_placeContext, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v25;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDPlace *place;
  NSMutableArray *imageIds;
  GEORPScorecard *scorecard;
  NSMutableArray *imageUpdates;
  GEORPScorecardUpdate *scorecardUpdate;
  GEORPPoiEnrichmentPlaceContext *placeContext;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEORPPoiEnrichmentUpdate readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_action != *((_DWORD *)v4 + 19))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 5) && !-[GEOPDPlace isEqual:](place, "isEqual:"))
    goto LABEL_19;
  imageIds = self->_imageIds;
  if ((unint64_t)imageIds | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](imageIds, "isEqual:"))
      goto LABEL_19;
  }
  scorecard = self->_scorecard;
  if ((unint64_t)scorecard | *((_QWORD *)v4 + 7))
  {
    if (!-[GEORPScorecard isEqual:](scorecard, "isEqual:"))
      goto LABEL_19;
  }
  imageUpdates = self->_imageUpdates;
  if ((unint64_t)imageUpdates | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](imageUpdates, "isEqual:"))
      goto LABEL_19;
  }
  scorecardUpdate = self->_scorecardUpdate;
  if ((unint64_t)scorecardUpdate | *((_QWORD *)v4 + 6))
  {
    if (!-[GEORPScorecardUpdate isEqual:](scorecardUpdate, "isEqual:"))
      goto LABEL_19;
  }
  placeContext = self->_placeContext;
  if ((unint64_t)placeContext | *((_QWORD *)v4 + 4))
    v11 = -[GEORPPoiEnrichmentPlaceContext isEqual:](placeContext, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  -[GEORPPoiEnrichmentUpdate readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_action;
  else
    v3 = 0;
  v4 = -[GEOPDPlace hash](self->_place, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_imageIds, "hash");
  v6 = v4 ^ v5 ^ -[GEORPScorecard hash](self->_scorecard, "hash");
  v7 = -[NSMutableArray hash](self->_imageUpdates, "hash");
  v8 = v7 ^ -[GEORPScorecardUpdate hash](self->_scorecardUpdate, "hash");
  return v6 ^ v8 ^ -[GEORPPoiEnrichmentPlaceContext hash](self->_placeContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOPDPlace *place;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEORPScorecard *scorecard;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  GEORPScorecardUpdate *scorecardUpdate;
  uint64_t v20;
  GEORPPoiEnrichmentPlaceContext *placeContext;
  uint64_t v22;
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
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_action = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_flags |= 1u;
  }
  place = self->_place;
  v6 = *((_QWORD *)v4 + 5);
  if (place)
  {
    if (v6)
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPPoiEnrichmentUpdate setPlace:](self, "setPlace:");
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        -[GEORPPoiEnrichmentUpdate addImageId:](self, "addImageId:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  scorecard = self->_scorecard;
  v13 = *((_QWORD *)v4 + 7);
  if (scorecard)
  {
    if (v13)
      -[GEORPScorecard mergeFrom:](scorecard, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPPoiEnrichmentUpdate setScorecard:](self, "setScorecard:");
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = *((id *)v4 + 3);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        -[GEORPPoiEnrichmentUpdate addImageUpdate:](self, "addImageUpdate:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  scorecardUpdate = self->_scorecardUpdate;
  v20 = *((_QWORD *)v4 + 6);
  if (scorecardUpdate)
  {
    if (v20)
      -[GEORPScorecardUpdate mergeFrom:](scorecardUpdate, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEORPPoiEnrichmentUpdate setScorecardUpdate:](self, "setScorecardUpdate:");
  }
  placeContext = self->_placeContext;
  v22 = *((_QWORD *)v4 + 4);
  if (placeContext)
  {
    if (v22)
      -[GEORPPoiEnrichmentPlaceContext mergeFrom:](placeContext, "mergeFrom:");
  }
  else if (v22)
  {
    -[GEORPPoiEnrichmentUpdate setPlaceContext:](self, "setPlaceContext:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scorecard, 0);
  objc_storeStrong((id *)&self->_scorecardUpdate, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeContext, 0);
  objc_storeStrong((id *)&self->_imageUpdates, 0);
  objc_storeStrong((id *)&self->_imageIds, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
