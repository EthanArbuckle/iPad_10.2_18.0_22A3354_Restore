@implementation GEORPDirectionsCorrections

- (GEORPDirectionsCorrections)init
{
  GEORPDirectionsCorrections *v2;
  GEORPDirectionsCorrections *v3;
  GEORPDirectionsCorrections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsCorrections;
  v2 = -[GEORPDirectionsCorrections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsCorrections)initWithData:(id)a3
{
  GEORPDirectionsCorrections *v3;
  GEORPDirectionsCorrections *v4;
  GEORPDirectionsCorrections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsCorrections;
  v3 = -[GEORPDirectionsCorrections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsResponseId
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
        GEORPDirectionsCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponseId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDirectionsResponseId
{
  -[GEORPDirectionsCorrections _readDirectionsResponseId]((uint64_t)self);
  return self->_directionsResponseId != 0;
}

- (NSData)directionsResponseId
{
  -[GEORPDirectionsCorrections _readDirectionsResponseId]((uint64_t)self);
  return self->_directionsResponseId;
}

- (void)setDirectionsResponseId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_directionsResponseId, a3);
}

- (void)_readProblematicRouteIndexs
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
        GEORPDirectionsCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblematicRouteIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)problematicRouteIndexs
{
  -[GEORPDirectionsCorrections _readProblematicRouteIndexs]((uint64_t)self);
  return self->_problematicRouteIndexs;
}

- (void)setProblematicRouteIndexs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *problematicRouteIndexs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  problematicRouteIndexs = self->_problematicRouteIndexs;
  self->_problematicRouteIndexs = v4;

}

- (void)clearProblematicRouteIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_problematicRouteIndexs, "removeAllObjects");
}

- (void)addProblematicRouteIndex:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsCorrections _readProblematicRouteIndexs]((uint64_t)self);
  -[GEORPDirectionsCorrections _addNoFlagsProblematicRouteIndex:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsProblematicRouteIndex:(uint64_t)a1
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

- (unint64_t)problematicRouteIndexsCount
{
  -[GEORPDirectionsCorrections _readProblematicRouteIndexs]((uint64_t)self);
  return -[NSMutableArray count](self->_problematicRouteIndexs, "count");
}

- (id)problematicRouteIndexAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsCorrections _readProblematicRouteIndexs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_problematicRouteIndexs, "objectAtIndex:", a3);
}

+ (Class)problematicRouteIndexType
{
  return (Class)objc_opt_class();
}

- (void)_readInstructionCorrections
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
        GEORPDirectionsCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstructionCorrections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)instructionCorrections
{
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  return self->_instructionCorrections;
}

- (void)setInstructionCorrections:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *instructionCorrections;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  instructionCorrections = self->_instructionCorrections;
  self->_instructionCorrections = v4;

}

- (void)clearInstructionCorrections
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_instructionCorrections, "removeAllObjects");
}

- (void)addInstructionCorrection:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  -[GEORPDirectionsCorrections _addNoFlagsInstructionCorrection:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsInstructionCorrection:(uint64_t)a1
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

- (unint64_t)instructionCorrectionsCount
{
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  return -[NSMutableArray count](self->_instructionCorrections, "count");
}

- (id)instructionCorrectionAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_instructionCorrections, "objectAtIndex:", a3);
}

+ (Class)instructionCorrectionType
{
  return (Class)objc_opt_class();
}

- (void)_readOverviewScreenshotImageId
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
        GEORPDirectionsCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOverviewScreenshotImageId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOverviewScreenshotImageId
{
  -[GEORPDirectionsCorrections _readOverviewScreenshotImageId]((uint64_t)self);
  return self->_overviewScreenshotImageId != 0;
}

- (NSString)overviewScreenshotImageId
{
  -[GEORPDirectionsCorrections _readOverviewScreenshotImageId]((uint64_t)self);
  return self->_overviewScreenshotImageId;
}

- (void)setOverviewScreenshotImageId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_overviewScreenshotImageId, a3);
}

- (void)_readArrivalCoordinate
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
        GEORPDirectionsCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArrivalCoordinate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasArrivalCoordinate
{
  -[GEORPDirectionsCorrections _readArrivalCoordinate]((uint64_t)self);
  return self->_arrivalCoordinate != 0;
}

- (GEORPCorrectedCoordinate)arrivalCoordinate
{
  -[GEORPDirectionsCorrections _readArrivalCoordinate]((uint64_t)self);
  return self->_arrivalCoordinate;
}

- (void)setArrivalCoordinate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_arrivalCoordinate, a3);
}

- (BOOL)noGoodRoutesShown
{
  return self->_noGoodRoutesShown;
}

- (void)setNoGoodRoutesShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_noGoodRoutesShown = a3;
}

- (void)setHasNoGoodRoutesShown:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasNoGoodRoutesShown
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEORPDirectionsCorrections;
  -[GEORPDirectionsCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPDirectionsCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsCorrections _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "directionsResponseId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("directionsResponseId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("directions_response_id"));
    }
  }

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v9 = *(id *)(a1 + 56);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v48 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v11);
    }

    if (a2)
      v16 = CFSTR("problematicRouteIndex");
    else
      v16 = CFSTR("problematic_route_index");
    objc_msgSend(v4, "setObject:forKey:", v8, v16);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v18 = *(id *)(a1 + 40);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v23, "jsonRepresentation");
          else
            objc_msgSend(v23, "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v20);
    }

    if (a2)
      v25 = CFSTR("instructionCorrection");
    else
      v25 = CFSTR("instruction_correction");
    objc_msgSend(v4, "setObject:forKey:", v17, v25);

  }
  objc_msgSend((id)a1, "overviewScreenshotImageId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    if (a2)
      v27 = CFSTR("overviewScreenshotImageId");
    else
      v27 = CFSTR("overview_screenshot_image_id");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);
  }

  objc_msgSend((id)a1, "arrivalCoordinate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("arrivalCoordinate");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("arrival_coordinate");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("noGoodRoutesShown");
    else
      v33 = CFSTR("no_good_routes_shown");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  v34 = *(void **)(a1 + 16);
  if (v34)
  {
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __56__GEORPDirectionsCorrections__dictionaryRepresentation___block_invoke;
      v41[3] = &unk_1E1C00600;
      v38 = v37;
      v42 = v38;
      objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v41);
      v39 = v38;

      v36 = v39;
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDirectionsCorrections _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPDirectionsCorrections__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPDirectionsCorrections)initWithDictionary:(id)a3
{
  return (GEORPDirectionsCorrections *)-[GEORPDirectionsCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GEORPSuggestedRouteIndex *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  GEORPInstructionCorrection *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  GEORPCorrectedCoordinate *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("directionsResponseId");
      else
        v6 = CFSTR("directions_response_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
        objc_msgSend(a1, "setDirectionsResponseId:", v8);

      }
      if (a3)
        v9 = CFSTR("problematicRouteIndex");
      else
        v9 = CFSTR("problematic_route_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v42 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v48 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = [GEORPSuggestedRouteIndex alloc];
                if ((a3 & 1) != 0)
                  v18 = -[GEORPSuggestedRouteIndex initWithJSON:](v17, "initWithJSON:", v16);
                else
                  v18 = -[GEORPSuggestedRouteIndex initWithDictionary:](v17, "initWithDictionary:", v16);
                v19 = (void *)v18;
                objc_msgSend(a1, "addProblematicRouteIndex:", v18);

              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          }
          while (v13);
        }

        v5 = v42;
      }

      if (a3)
        v20 = CFSTR("instructionCorrection");
      else
        v20 = CFSTR("instruction_correction");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v44 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = [GEORPInstructionCorrection alloc];
                if ((a3 & 1) != 0)
                  v29 = -[GEORPInstructionCorrection initWithJSON:](v28, "initWithJSON:", v27);
                else
                  v29 = -[GEORPInstructionCorrection initWithDictionary:](v28, "initWithDictionary:", v27);
                v30 = (void *)v29;
                objc_msgSend(a1, "addInstructionCorrection:", v29);

              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v24);
        }

        v5 = v42;
      }

      if (a3)
        v31 = CFSTR("overviewScreenshotImageId");
      else
        v31 = CFSTR("overview_screenshot_image_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = (void *)objc_msgSend(v32, "copy");
        objc_msgSend(a1, "setOverviewScreenshotImageId:", v33);

      }
      if (a3)
        v34 = CFSTR("arrivalCoordinate");
      else
        v34 = CFSTR("arrival_coordinate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = [GEORPCorrectedCoordinate alloc];
        if ((a3 & 1) != 0)
          v37 = -[GEORPCorrectedCoordinate initWithJSON:](v36, "initWithJSON:", v35);
        else
          v37 = -[GEORPCorrectedCoordinate initWithDictionary:](v36, "initWithDictionary:", v35);
        v38 = (void *)v37;
        objc_msgSend(a1, "setArrivalCoordinate:", v37);

      }
      if (a3)
        v39 = CFSTR("noGoodRoutesShown");
      else
        v39 = CFSTR("no_good_routes_shown");
      objc_msgSend(v5, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNoGoodRoutesShown:", objc_msgSend(v40, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPDirectionsCorrections)initWithJSON:(id)a3
{
  return (GEORPDirectionsCorrections *)-[GEORPDirectionsCorrections _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_564;
    else
      v8 = (int *)&readAll__nonRecursiveTag_565;
    GEORPDirectionsCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPDirectionsCorrectionsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsCorrectionsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPDirectionsCorrectionsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPDirectionsCorrections readAll:](self, "readAll:", 0);
    if (self->_directionsResponseId)
      PBDataWriterWriteDataField();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_problematicRouteIndexs;
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
    v10 = self->_instructionCorrections;
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

    if (self->_overviewScreenshotImageId)
      PBDataWriterWriteStringField();
    if (self->_arrivalCoordinate)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEORPDirectionsCorrections _readArrivalCoordinate]((uint64_t)self);
  if (-[GEORPCorrectedCoordinate hasGreenTeaWithValue:](self->_arrivalCoordinate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPDirectionsCorrections _readInstructionCorrections]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_instructionCorrections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_13;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_13:

  return v5;
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
  -[GEORPDirectionsCorrections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 16) = self->_readerMarkPos;
  *((_DWORD *)v13 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsResponseId)
    objc_msgSend(v13, "setDirectionsResponseId:");
  if (-[GEORPDirectionsCorrections problematicRouteIndexsCount](self, "problematicRouteIndexsCount"))
  {
    objc_msgSend(v13, "clearProblematicRouteIndexs");
    v4 = -[GEORPDirectionsCorrections problematicRouteIndexsCount](self, "problematicRouteIndexsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPDirectionsCorrections problematicRouteIndexAtIndex:](self, "problematicRouteIndexAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addProblematicRouteIndex:", v7);

      }
    }
  }
  if (-[GEORPDirectionsCorrections instructionCorrectionsCount](self, "instructionCorrectionsCount"))
  {
    objc_msgSend(v13, "clearInstructionCorrections");
    v8 = -[GEORPDirectionsCorrections instructionCorrectionsCount](self, "instructionCorrectionsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPDirectionsCorrections instructionCorrectionAtIndex:](self, "instructionCorrectionAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addInstructionCorrection:", v11);

      }
    }
  }
  if (self->_overviewScreenshotImageId)
    objc_msgSend(v13, "setOverviewScreenshotImageId:");
  v12 = v13;
  if (self->_arrivalCoordinate)
  {
    objc_msgSend(v13, "setArrivalCoordinate:");
    v12 = v13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_BYTE *)v12 + 76) = self->_noGoodRoutesShown;
    *((_BYTE *)v12 + 80) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  PBUnknownFields *v25;
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
      GEORPDirectionsCorrectionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPDirectionsCorrections readAll:](self, "readAll:", 0);
  v9 = -[NSData copyWithZone:](self->_directionsResponseId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = self->_problematicRouteIndexs;
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
        objc_msgSend((id)v5, "addProblematicRouteIndex:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = self->_instructionCorrections;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addInstructionCorrection:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v17);
  }

  v21 = -[NSString copyWithZone:](self->_overviewScreenshotImageId, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v21;

  v23 = -[GEORPCorrectedCoordinate copyWithZone:](self->_arrivalCoordinate, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v23;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 76) = self->_noGoodRoutesShown;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v25 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *directionsResponseId;
  NSMutableArray *problematicRouteIndexs;
  NSMutableArray *instructionCorrections;
  NSString *overviewScreenshotImageId;
  GEORPCorrectedCoordinate *arrivalCoordinate;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEORPDirectionsCorrections readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  directionsResponseId = self->_directionsResponseId;
  if ((unint64_t)directionsResponseId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](directionsResponseId, "isEqual:"))
      goto LABEL_14;
  }
  problematicRouteIndexs = self->_problematicRouteIndexs;
  if ((unint64_t)problematicRouteIndexs | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](problematicRouteIndexs, "isEqual:"))
      goto LABEL_14;
  }
  instructionCorrections = self->_instructionCorrections;
  if ((unint64_t)instructionCorrections | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](instructionCorrections, "isEqual:"))
      goto LABEL_14;
  }
  overviewScreenshotImageId = self->_overviewScreenshotImageId;
  if ((unint64_t)overviewScreenshotImageId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](overviewScreenshotImageId, "isEqual:"))
      goto LABEL_14;
  }
  arrivalCoordinate = self->_arrivalCoordinate;
  if ((unint64_t)arrivalCoordinate | *((_QWORD *)v4 + 3))
  {
    if (!-[GEORPCorrectedCoordinate isEqual:](arrivalCoordinate, "isEqual:"))
      goto LABEL_14;
  }
  v10 = (*((_BYTE *)v4 + 80) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0)
    {
LABEL_14:
      v10 = 0;
      goto LABEL_15;
    }
    if (self->_noGoodRoutesShown)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 76))
    {
      goto LABEL_14;
    }
    v10 = 1;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;

  -[GEORPDirectionsCorrections readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_directionsResponseId, "hash");
  v4 = -[NSMutableArray hash](self->_problematicRouteIndexs, "hash");
  v5 = -[NSMutableArray hash](self->_instructionCorrections, "hash");
  v6 = -[NSString hash](self->_overviewScreenshotImageId, "hash");
  v7 = -[GEORPCorrectedCoordinate hash](self->_arrivalCoordinate, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_noGoodRoutesShown;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  GEORPCorrectedCoordinate *arrivalCoordinate;
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

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 4))
    -[GEORPDirectionsCorrections setDirectionsResponseId:](self, "setDirectionsResponseId:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *((id *)v4 + 7);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        -[GEORPDirectionsCorrections addProblematicRouteIndex:](self, "addProblematicRouteIndex:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *((id *)v4 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[GEORPDirectionsCorrections addInstructionCorrection:](self, "addInstructionCorrection:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 6))
    -[GEORPDirectionsCorrections setOverviewScreenshotImageId:](self, "setOverviewScreenshotImageId:");
  arrivalCoordinate = self->_arrivalCoordinate;
  v16 = *((_QWORD *)v4 + 3);
  if (arrivalCoordinate)
  {
    if (v16)
      -[GEORPCorrectedCoordinate mergeFrom:](arrivalCoordinate, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEORPDirectionsCorrections setArrivalCoordinate:](self, "setArrivalCoordinate:");
  }
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_noGoodRoutesShown = *((_BYTE *)v4 + 76);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPDirectionsCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_568);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEORPDirectionsCorrections readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problematicRouteIndexs, 0);
  objc_storeStrong((id *)&self->_overviewScreenshotImageId, 0);
  objc_storeStrong((id *)&self->_instructionCorrections, 0);
  objc_storeStrong((id *)&self->_directionsResponseId, 0);
  objc_storeStrong((id *)&self->_arrivalCoordinate, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
