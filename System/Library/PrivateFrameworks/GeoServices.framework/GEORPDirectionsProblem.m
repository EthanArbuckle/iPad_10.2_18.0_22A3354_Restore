@implementation GEORPDirectionsProblem

- (GEORPDirectionsProblem)init
{
  GEORPDirectionsProblem *v2;
  GEORPDirectionsProblem *v3;
  GEORPDirectionsProblem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPDirectionsProblem;
  v2 = -[GEORPDirectionsProblem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPDirectionsProblem)initWithData:(id)a3
{
  GEORPDirectionsProblem *v3;
  GEORPDirectionsProblem *v4;
  GEORPDirectionsProblem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPDirectionsProblem;
  v3 = -[GEORPDirectionsProblem initWithData:](&v7, sel_initWithData_, a3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponseId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDirectionsResponseId
{
  -[GEORPDirectionsProblem _readDirectionsResponseId]((uint64_t)self);
  return self->_directionsResponseId != 0;
}

- (NSData)directionsResponseId
{
  -[GEORPDirectionsProblem _readDirectionsResponseId]((uint64_t)self);
  return self->_directionsResponseId;
}

- (void)setDirectionsResponseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_directionsResponseId, a3);
}

- (void)_readOverviewScreenshotImageData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOverviewScreenshotImageData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOverviewScreenshotImageData
{
  -[GEORPDirectionsProblem _readOverviewScreenshotImageData]((uint64_t)self);
  return self->_overviewScreenshotImageData != 0;
}

- (NSData)overviewScreenshotImageData
{
  -[GEORPDirectionsProblem _readOverviewScreenshotImageData]((uint64_t)self);
  return self->_overviewScreenshotImageData;
}

- (void)setOverviewScreenshotImageData:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_overviewScreenshotImageData, a3);
}

- (unsigned)problematicStepIndex
{
  return self->_problematicStepIndex;
}

- (void)setProblematicStepIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_problematicStepIndex = a3;
}

- (void)setHasProblematicStepIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasProblematicStepIndex
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readClientSuggestedRoutes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientSuggestedRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)clientSuggestedRoutes
{
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  return self->_clientSuggestedRoutes;
}

- (void)setClientSuggestedRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *clientSuggestedRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  clientSuggestedRoutes = self->_clientSuggestedRoutes;
  self->_clientSuggestedRoutes = v4;

}

- (void)clearClientSuggestedRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_clientSuggestedRoutes, "removeAllObjects");
}

- (void)addClientSuggestedRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  -[GEORPDirectionsProblem _addNoFlagsClientSuggestedRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
}

- (void)_addNoFlagsClientSuggestedRoute:(uint64_t)a1
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

- (unint64_t)clientSuggestedRoutesCount
{
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_clientSuggestedRoutes, "count");
}

- (id)clientSuggestedRouteAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_clientSuggestedRoutes, "objectAtIndex:", a3);
}

+ (Class)clientSuggestedRouteType
{
  return (Class)objc_opt_class();
}

- (void)_readProblematicRouteIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblematicRouteIndexs_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)problematicRouteIndexs
{
  -[GEORPDirectionsProblem _readProblematicRouteIndexs]((uint64_t)self);
  return self->_problematicRouteIndexs;
}

- (void)setProblematicRouteIndexs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *problematicRouteIndexs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  problematicRouteIndexs = self->_problematicRouteIndexs;
  self->_problematicRouteIndexs = v4;

}

- (void)clearProblematicRouteIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_problematicRouteIndexs, "removeAllObjects");
}

- (void)addProblematicRouteIndex:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsProblem _readProblematicRouteIndexs]((uint64_t)self);
  -[GEORPDirectionsProblem _addNoFlagsProblematicRouteIndex:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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
  -[GEORPDirectionsProblem _readProblematicRouteIndexs]((uint64_t)self);
  return -[NSMutableArray count](self->_problematicRouteIndexs, "count");
}

- (id)problematicRouteIndexAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsProblem _readProblematicRouteIndexs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_problematicRouteIndexs, "objectAtIndex:", a3);
}

+ (Class)problematicRouteIndexType
{
  return (Class)objc_opt_class();
}

- (unsigned)problematicLineIndex
{
  return self->_problematicLineIndex;
}

- (void)setProblematicLineIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_problematicLineIndex = a3;
}

- (void)setHasProblematicLineIndex:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasProblematicLineIndex
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readStartWaypoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStartWaypoint_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasStartWaypoint
{
  -[GEORPDirectionsProblem _readStartWaypoint]((uint64_t)self);
  return self->_startWaypoint != 0;
}

- (GEORPUserSearchInput)startWaypoint
{
  -[GEORPDirectionsProblem _readStartWaypoint]((uint64_t)self);
  return self->_startWaypoint;
}

- (void)setStartWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_startWaypoint, a3);
}

- (void)_readEndWaypoint
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEndWaypoint_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasEndWaypoint
{
  -[GEORPDirectionsProblem _readEndWaypoint]((uint64_t)self);
  return self->_endWaypoint != 0;
}

- (GEORPUserSearchInput)endWaypoint
{
  -[GEORPDirectionsProblem _readEndWaypoint]((uint64_t)self);
  return self->_endWaypoint;
}

- (void)setEndWaypoint:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_endWaypoint, a3);
}

- (void)_readInstructionCorrections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPDirectionsProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInstructionCorrections_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)instructionCorrections
{
  -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
  return self->_instructionCorrections;
}

- (void)setInstructionCorrections:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *instructionCorrections;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  instructionCorrections = self->_instructionCorrections;
  self->_instructionCorrections = v4;

}

- (void)clearInstructionCorrections
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
  -[NSMutableArray removeAllObjects](self->_instructionCorrections, "removeAllObjects");
}

- (void)addInstructionCorrection:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
  -[GEORPDirectionsProblem _addNoFlagsInstructionCorrection:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x200u;
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
  -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
  return -[NSMutableArray count](self->_instructionCorrections, "count");
}

- (id)instructionCorrectionAtIndex:(unint64_t)a3
{
  -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_instructionCorrections, "objectAtIndex:", a3);
}

+ (Class)instructionCorrectionType
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
  v8.super_class = (Class)GEORPDirectionsProblem;
  -[GEORPDirectionsProblem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPDirectionsProblem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPDirectionsProblem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
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
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
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

  objc_msgSend((id)a1, "overviewScreenshotImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("overviewScreenshotImageData"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("overview_screenshot_image_data"));
    }
  }

  if ((*(_WORD *)(a1 + 92) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("problematicStepIndex");
    else
      v12 = CFSTR("problematic_step_index");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v14 = *(id *)(a1 + 16);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v20);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v16);
    }

    if (a2)
      v21 = CFSTR("clientSuggestedRoute");
    else
      v21 = CFSTR("client_suggested_route");
    objc_msgSend(v4, "setObject:forKey:", v13, v21);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v23 = *(id *)(a1 + 56);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v56 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("problematicRouteIndex");
    else
      v30 = CFSTR("problematic_route_index");
    objc_msgSend(v4, "setObject:forKey:", v22, v30);

  }
  if ((*(_WORD *)(a1 + 92) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("problematicLineIndex");
    else
      v32 = CFSTR("problematic_line_index");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  objc_msgSend((id)a1, "startWaypoint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("startWaypoint");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("start_waypoint");
    }
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  objc_msgSend((id)a1, "endWaypoint");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v37, "jsonRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("endWaypoint");
    }
    else
    {
      objc_msgSend(v37, "dictionaryRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("end_waypoint");
    }
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v42 = *(id *)(a1 + 40);
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v52;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v52 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v47, "jsonRepresentation");
          else
            objc_msgSend(v47, "dictionaryRepresentation", (_QWORD)v51);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "addObject:", v48, (_QWORD)v51);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v44);
    }

    if (a2)
      v49 = CFSTR("instructionCorrection");
    else
      v49 = CFSTR("instruction_correction");
    objc_msgSend(v4, "setObject:forKey:", v41, v49, (_QWORD)v51);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPDirectionsProblem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPDirectionsProblem)initWithDictionary:(id)a3
{
  return (GEORPDirectionsProblem *)-[GEORPDirectionsProblem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  GEOTransitSuggestedRoute *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  GEORPSuggestedRouteIndex *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  GEORPUserSearchInput *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  GEORPUserSearchInput *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  GEORPInstructionCorrection *v56;
  uint64_t v57;
  void *v58;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
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
        v9 = CFSTR("overviewScreenshotImageData");
      else
        v9 = CFSTR("overview_screenshot_image_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
        objc_msgSend(a1, "setOverviewScreenshotImageData:", v11);

      }
      if (a3)
        v12 = CFSTR("problematicStepIndex");
      else
        v12 = CFSTR("problematic_step_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setProblematicStepIndex:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("clientSuggestedRoute");
      else
        v14 = CFSTR("client_suggested_route");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v60 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v70 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = [GEOTransitSuggestedRoute alloc];
                if ((a3 & 1) != 0)
                  v23 = -[GEOTransitSuggestedRoute initWithJSON:](v22, "initWithJSON:", v21);
                else
                  v23 = -[GEOTransitSuggestedRoute initWithDictionary:](v22, "initWithDictionary:", v21);
                v24 = (void *)v23;
                objc_msgSend(a1, "addClientSuggestedRoute:", v23);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
          }
          while (v18);
        }

        v5 = v60;
      }

      if (a3)
        v25 = CFSTR("problematicRouteIndex");
      else
        v25 = CFSTR("problematic_route_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v66;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v66 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = [GEORPSuggestedRouteIndex alloc];
                if ((a3 & 1) != 0)
                  v34 = -[GEORPSuggestedRouteIndex initWithJSON:](v33, "initWithJSON:", v32);
                else
                  v34 = -[GEORPSuggestedRouteIndex initWithDictionary:](v33, "initWithDictionary:", v32);
                v35 = (void *)v34;
                objc_msgSend(a1, "addProblematicRouteIndex:", v34);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
          }
          while (v29);
        }

        v5 = v60;
      }

      if (a3)
        v36 = CFSTR("problematicLineIndex");
      else
        v36 = CFSTR("problematic_line_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setProblematicLineIndex:", objc_msgSend(v37, "unsignedIntValue"));

      if (a3)
        v38 = CFSTR("startWaypoint");
      else
        v38 = CFSTR("start_waypoint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEORPUserSearchInput alloc];
        if ((a3 & 1) != 0)
          v41 = -[GEORPUserSearchInput initWithJSON:](v40, "initWithJSON:", v39);
        else
          v41 = -[GEORPUserSearchInput initWithDictionary:](v40, "initWithDictionary:", v39);
        v42 = (void *)v41;
        objc_msgSend(a1, "setStartWaypoint:", v41);

      }
      if (a3)
        v43 = CFSTR("endWaypoint");
      else
        v43 = CFSTR("end_waypoint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = [GEORPUserSearchInput alloc];
        if ((a3 & 1) != 0)
          v46 = -[GEORPUserSearchInput initWithJSON:](v45, "initWithJSON:", v44);
        else
          v46 = -[GEORPUserSearchInput initWithDictionary:](v45, "initWithDictionary:", v44);
        v47 = (void *)v46;
        objc_msgSend(a1, "setEndWaypoint:", v46);

      }
      if (a3)
        v48 = CFSTR("instructionCorrection");
      else
        v48 = CFSTR("instruction_correction");
      objc_msgSend(v5, "objectForKeyedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v50 = v49;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v62;
          do
          {
            for (k = 0; k != v52; ++k)
            {
              if (*(_QWORD *)v62 != v53)
                objc_enumerationMutation(v50);
              v55 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v56 = [GEORPInstructionCorrection alloc];
                if ((a3 & 1) != 0)
                  v57 = -[GEORPInstructionCorrection initWithJSON:](v56, "initWithJSON:", v55);
                else
                  v57 = -[GEORPInstructionCorrection initWithDictionary:](v56, "initWithDictionary:", v55);
                v58 = (void *)v57;
                objc_msgSend(a1, "addInstructionCorrection:", v57);

              }
            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
          }
          while (v52);
        }

        v5 = v60;
      }

    }
  }

  return a1;
}

- (GEORPDirectionsProblem)initWithJSON:(id)a3
{
  return (GEORPDirectionsProblem *)-[GEORPDirectionsProblem _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_827;
    else
      v8 = (int *)&readAll__nonRecursiveTag_828;
    GEORPDirectionsProblemReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPDirectionsProblemCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDirectionsProblemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDirectionsProblemReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
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
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPDirectionsProblemIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPDirectionsProblem readAll:](self, "readAll:", 0);
    if (self->_directionsResponseId)
      PBDataWriterWriteDataField();
    if (self->_overviewScreenshotImageData)
      PBDataWriterWriteDataField();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_clientSuggestedRoutes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = self->_problematicRouteIndexs;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v11);
    }

    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_startWaypoint)
      PBDataWriterWriteSubmessage();
    if (self->_endWaypoint)
      PBDataWriterWriteSubmessage();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_instructionCorrections;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v15);
    }

  }
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
  -[GEORPDirectionsProblem _readClientSuggestedRoutes]((uint64_t)self);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_clientSuggestedRoutes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
LABEL_19:

    return 1;
  }
LABEL_9:

  -[GEORPDirectionsProblem _readEndWaypoint]((uint64_t)self);
  if (!-[GEORPUserSearchInput hasGreenTeaWithValue:](self->_endWaypoint, "hasGreenTeaWithValue:", v3))
  {
    -[GEORPDirectionsProblem _readInstructionCorrections]((uint64_t)self);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_instructionCorrections;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (!v10)
    {
LABEL_18:

      -[GEORPDirectionsProblem _readStartWaypoint]((uint64_t)self);
      return -[GEORPUserSearchInput hasGreenTeaWithValue:](self->_startWaypoint, "hasGreenTeaWithValue:", v3);
    }
    v11 = v10;
    v12 = *(_QWORD *)v16;
LABEL_12:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (_QWORD)v15) & 1) != 0)
        goto LABEL_19;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
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
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  id *v16;

  v16 = (id *)a3;
  -[GEORPDirectionsProblem readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v16 + 1, self->_reader);
  *((_DWORD *)v16 + 18) = self->_readerMarkPos;
  *((_DWORD *)v16 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_directionsResponseId)
    objc_msgSend(v16, "setDirectionsResponseId:");
  if (self->_overviewScreenshotImageData)
    objc_msgSend(v16, "setOverviewScreenshotImageData:");
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v16 + 22) = self->_problematicStepIndex;
    *((_WORD *)v16 + 46) |= 2u;
  }
  if (-[GEORPDirectionsProblem clientSuggestedRoutesCount](self, "clientSuggestedRoutesCount"))
  {
    objc_msgSend(v16, "clearClientSuggestedRoutes");
    v4 = -[GEORPDirectionsProblem clientSuggestedRoutesCount](self, "clientSuggestedRoutesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPDirectionsProblem clientSuggestedRouteAtIndex:](self, "clientSuggestedRouteAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addClientSuggestedRoute:", v7);

      }
    }
  }
  if (-[GEORPDirectionsProblem problematicRouteIndexsCount](self, "problematicRouteIndexsCount"))
  {
    objc_msgSend(v16, "clearProblematicRouteIndexs");
    v8 = -[GEORPDirectionsProblem problematicRouteIndexsCount](self, "problematicRouteIndexsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEORPDirectionsProblem problematicRouteIndexAtIndex:](self, "problematicRouteIndexAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addProblematicRouteIndex:", v11);

      }
    }
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v16 + 21) = self->_problematicLineIndex;
    *((_WORD *)v16 + 46) |= 1u;
  }
  if (self->_startWaypoint)
    objc_msgSend(v16, "setStartWaypoint:");
  if (self->_endWaypoint)
    objc_msgSend(v16, "setEndWaypoint:");
  if (-[GEORPDirectionsProblem instructionCorrectionsCount](self, "instructionCorrectionsCount"))
  {
    objc_msgSend(v16, "clearInstructionCorrections");
    v12 = -[GEORPDirectionsProblem instructionCorrectionsCount](self, "instructionCorrectionsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEORPDirectionsProblem instructionCorrectionAtIndex:](self, "instructionCorrectionAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addInstructionCorrection:", v15);

      }
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
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
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
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPDirectionsProblemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPDirectionsProblem readAll:](self, "readAll:", 0);
  v9 = -[NSData copyWithZone:](self->_directionsResponseId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSData copyWithZone:](self->_overviewScreenshotImageData, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_problematicStepIndex;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = self->_clientSuggestedRoutes;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addClientSuggestedRoute:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v14);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = self->_problematicRouteIndexs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addProblematicRouteIndex:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v19);
  }

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_problematicLineIndex;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v23 = -[GEORPUserSearchInput copyWithZone:](self->_startWaypoint, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v23;

  v25 = -[GEORPUserSearchInput copyWithZone:](self->_endWaypoint, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v25;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_instructionCorrections;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(v8);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend((id)v5, "addInstructionCorrection:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v27);
  }
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *directionsResponseId;
  NSData *overviewScreenshotImageData;
  __int16 v7;
  NSMutableArray *clientSuggestedRoutes;
  NSMutableArray *problematicRouteIndexs;
  __int16 v10;
  GEORPUserSearchInput *startWaypoint;
  GEORPUserSearchInput *endWaypoint;
  NSMutableArray *instructionCorrections;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEORPDirectionsProblem readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  directionsResponseId = self->_directionsResponseId;
  if ((unint64_t)directionsResponseId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](directionsResponseId, "isEqual:"))
      goto LABEL_26;
  }
  overviewScreenshotImageData = self->_overviewScreenshotImageData;
  if ((unint64_t)overviewScreenshotImageData | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](overviewScreenshotImageData, "isEqual:"))
      goto LABEL_26;
  }
  v7 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_problematicStepIndex != *((_DWORD *)v4 + 22))
      goto LABEL_26;
  }
  else if ((v7 & 2) != 0)
  {
LABEL_26:
    v14 = 0;
    goto LABEL_27;
  }
  clientSuggestedRoutes = self->_clientSuggestedRoutes;
  if ((unint64_t)clientSuggestedRoutes | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](clientSuggestedRoutes, "isEqual:"))
  {
    goto LABEL_26;
  }
  problematicRouteIndexs = self->_problematicRouteIndexs;
  if ((unint64_t)problematicRouteIndexs | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](problematicRouteIndexs, "isEqual:"))
      goto LABEL_26;
  }
  v10 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_problematicLineIndex != *((_DWORD *)v4 + 21))
      goto LABEL_26;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_26;
  }
  startWaypoint = self->_startWaypoint;
  if ((unint64_t)startWaypoint | *((_QWORD *)v4 + 8)
    && !-[GEORPUserSearchInput isEqual:](startWaypoint, "isEqual:"))
  {
    goto LABEL_26;
  }
  endWaypoint = self->_endWaypoint;
  if ((unint64_t)endWaypoint | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPUserSearchInput isEqual:](endWaypoint, "isEqual:"))
      goto LABEL_26;
  }
  instructionCorrections = self->_instructionCorrections;
  if ((unint64_t)instructionCorrections | *((_QWORD *)v4 + 5))
    v14 = -[NSMutableArray isEqual:](instructionCorrections, "isEqual:");
  else
    v14 = 1;
LABEL_27:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  -[GEORPDirectionsProblem readAll:](self, "readAll:", 1);
  v3 = -[NSData hash](self->_directionsResponseId, "hash");
  v4 = -[NSData hash](self->_overviewScreenshotImageData, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v5 = 2654435761 * self->_problematicStepIndex;
  else
    v5 = 0;
  v6 = -[NSMutableArray hash](self->_clientSuggestedRoutes, "hash");
  v7 = -[NSMutableArray hash](self->_problematicRouteIndexs, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_problematicLineIndex;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[GEORPUserSearchInput hash](self->_startWaypoint, "hash");
  v10 = -[GEORPUserSearchInput hash](self->_endWaypoint, "hash");
  return v9 ^ v10 ^ -[NSMutableArray hash](self->_instructionCorrections, "hash");
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
  GEORPUserSearchInput *startWaypoint;
  uint64_t v16;
  GEORPUserSearchInput *endWaypoint;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
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
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEORPDirectionsProblem setDirectionsResponseId:](self, "setDirectionsResponseId:");
  if (*((_QWORD *)v4 + 6))
    -[GEORPDirectionsProblem setOverviewScreenshotImageData:](self, "setOverviewScreenshotImageData:");
  if ((*((_WORD *)v4 + 46) & 2) != 0)
  {
    self->_problematicStepIndex = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 2u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        -[GEORPDirectionsProblem addClientSuggestedRoute:](self, "addClientSuggestedRoute:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = *((id *)v4 + 7);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        -[GEORPDirectionsProblem addProblematicRouteIndex:](self, "addProblematicRouteIndex:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v12);
  }

  if ((*((_WORD *)v4 + 46) & 1) != 0)
  {
    self->_problematicLineIndex = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  startWaypoint = self->_startWaypoint;
  v16 = *((_QWORD *)v4 + 8);
  if (startWaypoint)
  {
    if (v16)
      -[GEORPUserSearchInput mergeFrom:](startWaypoint, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEORPDirectionsProblem setStartWaypoint:](self, "setStartWaypoint:");
  }
  endWaypoint = self->_endWaypoint;
  v18 = *((_QWORD *)v4 + 4);
  if (endWaypoint)
  {
    if (v18)
      -[GEORPUserSearchInput mergeFrom:](endWaypoint, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEORPDirectionsProblem setEndWaypoint:](self, "setEndWaypoint:");
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = *((id *)v4 + 5);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        -[GEORPDirectionsProblem addInstructionCorrection:](self, "addInstructionCorrection:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * k), (_QWORD)v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v21);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startWaypoint, 0);
  objc_storeStrong((id *)&self->_problematicRouteIndexs, 0);
  objc_storeStrong((id *)&self->_overviewScreenshotImageData, 0);
  objc_storeStrong((id *)&self->_instructionCorrections, 0);
  objc_storeStrong((id *)&self->_endWaypoint, 0);
  objc_storeStrong((id *)&self->_directionsResponseId, 0);
  objc_storeStrong((id *)&self->_clientSuggestedRoutes, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
