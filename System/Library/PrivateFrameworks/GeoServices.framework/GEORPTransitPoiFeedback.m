@implementation GEORPTransitPoiFeedback

- (GEORPTransitPoiFeedback)init
{
  GEORPTransitPoiFeedback *v2;
  GEORPTransitPoiFeedback *v3;
  GEORPTransitPoiFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPTransitPoiFeedback;
  v2 = -[GEORPTransitPoiFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPTransitPoiFeedback)initWithData:(id)a3
{
  GEORPTransitPoiFeedback *v3;
  GEORPTransitPoiFeedback *v4;
  GEORPTransitPoiFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPTransitPoiFeedback;
  v3 = -[GEORPTransitPoiFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)correctionType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_correctionType;
  else
    return 0;
}

- (void)setCorrectionType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasCorrectionType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C03D70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_POI_CORRECTION_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_POI_CORRECTION_TYPE_STATION_EDIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_POI_CORRECTION_TYPE_LINE_EDIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_POI_CORRECTION_TYPE_OTHER")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCorrections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrections_tags_3167);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCorrections
{
  -[GEORPTransitPoiFeedback _readCorrections]((uint64_t)self);
  return self->_corrections != 0;
}

- (GEORPTransitPoiCorrections)corrections
{
  -[GEORPTransitPoiFeedback _readCorrections]((uint64_t)self);
  return self->_corrections;
}

- (void)setCorrections:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_corrections, a3);
}

- (void)_readPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_3168);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlace
{
  -[GEORPTransitPoiFeedback _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPTransitPoiFeedback _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readTransitLineTileInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitLineTileInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTransitLineTileInfo
{
  -[GEORPTransitPoiFeedback _readTransitLineTileInfo]((uint64_t)self);
  return self->_transitLineTileInfo != 0;
}

- (GEORPTransitLineTileInfo)transitLineTileInfo
{
  -[GEORPTransitPoiFeedback _readTransitLineTileInfo]((uint64_t)self);
  return self->_transitLineTileInfo;
}

- (void)setTransitLineTileInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_transitLineTileInfo, a3);
}

- (void)_readPlaceRequest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRequest_tags_3169);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlaceRequest
{
  -[GEORPTransitPoiFeedback _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPTransitPoiFeedback _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (void)_readDirectionsRequests
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsRequests_tags_3170);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)directionsRequests
{
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  return self->_directionsRequests;
}

- (void)setDirectionsRequests:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsRequests;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  directionsRequests = self->_directionsRequests;
  self->_directionsRequests = v4;

}

- (void)clearDirectionsRequests
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_directionsRequests, "removeAllObjects");
}

- (void)addDirectionsRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  -[GEORPTransitPoiFeedback _addNoFlagsDirectionsRequest:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsDirectionsRequest:(uint64_t)a1
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

- (unint64_t)directionsRequestsCount
{
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsRequests, "count");
}

- (id)directionsRequestAtIndex:(unint64_t)a3
{
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsRequests, "objectAtIndex:", a3);
}

+ (Class)directionsRequestType
{
  return (Class)objc_opt_class();
}

- (void)_readDirectionsResponses
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPTransitPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponses_tags_3171);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)directionsResponses
{
  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  return self->_directionsResponses;
}

- (void)setDirectionsResponses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsResponses;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  directionsResponses = self->_directionsResponses;
  self->_directionsResponses = v4;

}

- (void)clearDirectionsResponses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_directionsResponses, "removeAllObjects");
}

- (void)addDirectionsResponse:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  -[GEORPTransitPoiFeedback _addNoFlagsDirectionsResponse:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsDirectionsResponse:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)directionsResponsesCount
{
  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsResponses, "count");
}

- (id)directionsResponseAtIndex:(unint64_t)a3
{
  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsResponses, "objectAtIndex:", a3);
}

+ (Class)directionsResponseType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEORPTransitPoiFeedback;
  -[GEORPTransitPoiFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPTransitPoiFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTransitPoiFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
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
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
    v5 = *(int *)(a1 + 84);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C03D70[v5];
    }
    if (a2)
      v7 = CFSTR("correctionType");
    else
      v7 = CFSTR("correction_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "corrections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("corrections"));

  }
  objc_msgSend((id)a1, "place");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("place"));

  }
  objc_msgSend((id)a1, "transitLineTileInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("transitLineTileInfo");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("transit_line_tile_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "placeRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("placeRequest");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("place_request");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v23 = *(id *)(a1 + 32);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v54 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("directionsRequest");
    else
      v30 = CFSTR("directions_request");
    objc_msgSend(v4, "setObject:forKey:", v22, v30);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v32 = *(id *)(a1 + 40);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v50 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v37, "jsonRepresentation");
          else
            objc_msgSend(v37, "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v34);
    }

    if (a2)
      v39 = CFSTR("directionsResponse");
    else
      v39 = CFSTR("directions_response");
    objc_msgSend(v4, "setObject:forKey:", v31, v39);

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
      v47[2] = __53__GEORPTransitPoiFeedback__dictionaryRepresentation___block_invoke;
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
  return -[GEORPTransitPoiFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEORPTransitPoiFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPTransitPoiFeedback)initWithDictionary:(id)a3
{
  return (GEORPTransitPoiFeedback *)-[GEORPTransitPoiFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  GEORPTransitPoiCorrections *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEOPDPlace *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEORPTransitLineTileInfo *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEOPDPlaceRequest *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  GEODirectionsRequest *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  GEODirectionsResponse *v47;
  uint64_t v48;
  void *v49;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_81;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_81;
  if (a3)
    v6 = CFSTR("correctionType");
  else
    v6 = CFSTR("correction_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_POI_CORRECTION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_POI_CORRECTION_TYPE_STATION_EDIT")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_POI_CORRECTION_TYPE_LINE_EDIT")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_POI_CORRECTION_TYPE_OTHER")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_19:
    objc_msgSend(a1, "setCorrectionType:", v9);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("corrections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEORPTransitPoiCorrections alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEORPTransitPoiCorrections initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEORPTransitPoiCorrections initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setCorrections:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOPDPlace alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOPDPlace initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOPDPlace initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setPlace:", v16);

  }
  if (a3)
    v18 = CFSTR("transitLineTileInfo");
  else
    v18 = CFSTR("transit_line_tile_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = [GEORPTransitLineTileInfo alloc];
    if ((a3 & 1) != 0)
      v21 = -[GEORPTransitLineTileInfo initWithJSON:](v20, "initWithJSON:", v19);
    else
      v21 = -[GEORPTransitLineTileInfo initWithDictionary:](v20, "initWithDictionary:", v19);
    v22 = (void *)v21;
    objc_msgSend(a1, "setTransitLineTileInfo:", v21);

  }
  if (a3)
    v23 = CFSTR("placeRequest");
  else
    v23 = CFSTR("place_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = [GEOPDPlaceRequest alloc];
    if ((a3 & 1) != 0)
      v26 = -[GEOPDPlaceRequest initWithJSON:](v25, "initWithJSON:", v24);
    else
      v26 = -[GEOPDPlaceRequest initWithDictionary:](v25, "initWithDictionary:", v24);
    v27 = (void *)v26;
    objc_msgSend(a1, "setPlaceRequest:", v26);

  }
  if (a3)
    v28 = CFSTR("directionsRequest");
  else
    v28 = CFSTR("directions_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v51 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v30 = v29;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v57 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v36 = [GEODirectionsRequest alloc];
            if ((a3 & 1) != 0)
              v37 = -[GEODirectionsRequest initWithJSON:](v36, "initWithJSON:", v35);
            else
              v37 = -[GEODirectionsRequest initWithDictionary:](v36, "initWithDictionary:", v35);
            v38 = (void *)v37;
            objc_msgSend(a1, "addDirectionsRequest:", v37);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v32);
    }

    v5 = v51;
  }

  if (a3)
    v39 = CFSTR("directionsResponse");
  else
    v39 = CFSTR("directions_response");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v53 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = [GEODirectionsResponse alloc];
            if ((a3 & 1) != 0)
              v48 = -[GEODirectionsResponse initWithJSON:](v47, "initWithJSON:", v46);
            else
              v48 = -[GEODirectionsResponse initWithDictionary:](v47, "initWithDictionary:", v46);
            v49 = (void *)v48;
            objc_msgSend(a1, "addDirectionsResponse:", v48);

          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v43);
    }

    v5 = v51;
  }

LABEL_81:
  return a1;
}

- (GEORPTransitPoiFeedback)initWithJSON:(id)a3
{
  return (GEORPTransitPoiFeedback *)-[GEORPTransitPoiFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3178;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3179;
    GEORPTransitPoiFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPTransitPoiFeedbackCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTransitPoiFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTransitPoiFeedbackReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPTransitPoiFeedbackIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPTransitPoiFeedback readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_corrections)
      PBDataWriterWriteSubmessage();
    if (self->_place)
      PBDataWriterWriteSubmessage();
    if (self->_transitLineTileInfo)
      PBDataWriterWriteSubmessage();
    if (self->_placeRequest)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_directionsRequests;
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
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_directionsResponses;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPTransitPoiFeedbackClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[GEORPTransitPoiFeedback _readCorrections]((uint64_t)self);
  if (-[GEORPTransitPoiCorrections hasGreenTeaWithValue:](self->_corrections, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPTransitPoiFeedback _readDirectionsRequests]((uint64_t)self);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_directionsRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_20;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v7)
          goto LABEL_4;
        break;
      }
    }
  }

  -[GEORPTransitPoiFeedback _readDirectionsResponses]((uint64_t)self);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_directionsResponses;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
LABEL_12:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (_QWORD)v15) & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
LABEL_20:

    return 1;
  }
LABEL_18:

  -[GEORPTransitPoiFeedback _readPlace]((uint64_t)self);
  if (!-[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3))
  {
    -[GEORPTransitPoiFeedback _readPlaceRequest]((uint64_t)self);
    return -[GEOPDPlaceRequest hasGreenTeaWithValue:](self->_placeRequest, "hasGreenTeaWithValue:", v3);
  }
  return 1;
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

  v12 = (id *)a3;
  -[GEORPTransitPoiFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 18) = self->_readerMarkPos;
  *((_DWORD *)v12 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v12 + 21) = self->_correctionType;
    *((_WORD *)v12 + 44) |= 1u;
  }
  if (self->_corrections)
    objc_msgSend(v12, "setCorrections:");
  if (self->_place)
    objc_msgSend(v12, "setPlace:");
  if (self->_transitLineTileInfo)
    objc_msgSend(v12, "setTransitLineTileInfo:");
  if (self->_placeRequest)
    objc_msgSend(v12, "setPlaceRequest:");
  if (-[GEORPTransitPoiFeedback directionsRequestsCount](self, "directionsRequestsCount"))
  {
    objc_msgSend(v12, "clearDirectionsRequests");
    v4 = -[GEORPTransitPoiFeedback directionsRequestsCount](self, "directionsRequestsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPTransitPoiFeedback directionsRequestAtIndex:](self, "directionsRequestAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDirectionsRequest:", v7);

      }
    }
  }
  if (-[GEORPTransitPoiFeedback directionsResponsesCount](self, "directionsResponsesCount"))
  {
    objc_msgSend(v12, "clearDirectionsResponses");
    v8 = -[GEORPTransitPoiFeedback directionsResponsesCount](self, "directionsResponsesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPTransitPoiFeedback directionsResponseAtIndex:](self, "directionsResponseAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addDirectionsResponse:", v11);

      }
    }
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  PBUnknownFields *v27;
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPTransitPoiFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPTransitPoiFeedback readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_correctionType;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v9 = -[GEORPTransitPoiCorrections copyWithZone:](self->_corrections, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  v13 = -[GEORPTransitLineTileInfo copyWithZone:](self->_transitLineTileInfo, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v13;

  v15 = -[GEOPDPlaceRequest copyWithZone:](self->_placeRequest, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = self->_directionsRequests;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDirectionsRequest:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v18);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = self->_directionsResponses;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v22);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v29);
        objc_msgSend((id)v5, "addDirectionsResponse:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

  v27 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v27;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEORPTransitPoiCorrections *corrections;
  GEOPDPlace *place;
  GEORPTransitLineTileInfo *transitLineTileInfo;
  GEOPDPlaceRequest *placeRequest;
  NSMutableArray *directionsRequests;
  NSMutableArray *directionsResponses;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEORPTransitPoiFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_correctionType != *((_DWORD *)v4 + 21))
      goto LABEL_19;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  corrections = self->_corrections;
  if ((unint64_t)corrections | *((_QWORD *)v4 + 3)
    && !-[GEORPTransitPoiCorrections isEqual:](corrections, "isEqual:"))
  {
    goto LABEL_19;
  }
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:"))
      goto LABEL_19;
  }
  transitLineTileInfo = self->_transitLineTileInfo;
  if ((unint64_t)transitLineTileInfo | *((_QWORD *)v4 + 8))
  {
    if (!-[GEORPTransitLineTileInfo isEqual:](transitLineTileInfo, "isEqual:"))
      goto LABEL_19;
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:"))
      goto LABEL_19;
  }
  directionsRequests = self->_directionsRequests;
  if ((unint64_t)directionsRequests | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](directionsRequests, "isEqual:"))
      goto LABEL_19;
  }
  directionsResponses = self->_directionsResponses;
  if ((unint64_t)directionsResponses | *((_QWORD *)v4 + 5))
    v12 = -[NSMutableArray isEqual:](directionsResponses, "isEqual:");
  else
    v12 = 1;
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  -[GEORPTransitPoiFeedback readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_correctionType;
  else
    v3 = 0;
  v4 = -[GEORPTransitPoiCorrections hash](self->_corrections, "hash") ^ v3;
  v5 = -[GEOPDPlace hash](self->_place, "hash");
  v6 = v4 ^ v5 ^ -[GEORPTransitLineTileInfo hash](self->_transitLineTileInfo, "hash");
  v7 = -[GEOPDPlaceRequest hash](self->_placeRequest, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_directionsRequests, "hash");
  return v6 ^ v8 ^ -[NSMutableArray hash](self->_directionsResponses, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEORPTransitPoiCorrections *corrections;
  uint64_t v6;
  GEOPDPlace *place;
  uint64_t v8;
  GEORPTransitLineTileInfo *transitLineTileInfo;
  uint64_t v10;
  GEOPDPlaceRequest *placeRequest;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
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
  if ((*((_WORD *)v4 + 44) & 1) != 0)
  {
    self->_correctionType = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  corrections = self->_corrections;
  v6 = *((_QWORD *)v4 + 3);
  if (corrections)
  {
    if (v6)
      -[GEORPTransitPoiCorrections mergeFrom:](corrections, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPTransitPoiFeedback setCorrections:](self, "setCorrections:");
  }
  place = self->_place;
  v8 = *((_QWORD *)v4 + 7);
  if (place)
  {
    if (v8)
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEORPTransitPoiFeedback setPlace:](self, "setPlace:");
  }
  transitLineTileInfo = self->_transitLineTileInfo;
  v10 = *((_QWORD *)v4 + 8);
  if (transitLineTileInfo)
  {
    if (v10)
      -[GEORPTransitLineTileInfo mergeFrom:](transitLineTileInfo, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEORPTransitPoiFeedback setTransitLineTileInfo:](self, "setTransitLineTileInfo:");
  }
  placeRequest = self->_placeRequest;
  v12 = *((_QWORD *)v4 + 6);
  if (placeRequest)
  {
    if (v12)
      -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEORPTransitPoiFeedback setPlaceRequest:](self, "setPlaceRequest:");
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = *((id *)v4 + 4);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        -[GEORPTransitPoiFeedback addDirectionsRequest:](self, "addDirectionsRequest:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v15);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = *((id *)v4 + 5);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        -[GEORPTransitPoiFeedback addDirectionsResponse:](self, "addDirectionsResponse:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPTransitPoiFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3182);
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

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x102u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPTransitPoiFeedback readAll:](self, "readAll:", 0);
    -[GEORPTransitPoiCorrections clearUnknownFields:](self->_corrections, "clearUnknownFields:", 1);
    -[GEOPDPlace clearUnknownFields:](self->_place, "clearUnknownFields:", 1);
    -[GEOPDPlaceRequest clearUnknownFields:](self->_placeRequest, "clearUnknownFields:", 1);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_directionsRequests;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_directionsResponses;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLineTileInfo, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_directionsResponses, 0);
  objc_storeStrong((id *)&self->_directionsRequests, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
