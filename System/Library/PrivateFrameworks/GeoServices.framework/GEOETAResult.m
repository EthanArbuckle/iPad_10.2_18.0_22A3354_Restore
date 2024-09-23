@implementation GEOETAResult

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    -[GEOETAResult _readEtaRouteIncidents](result);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = *(id *)(v3 + 24);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2, (_QWORD)v9) & 1) != 0)
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          continue;
        break;
      }
    }

    -[GEOETAResult _readPlaceSearchResponse](v3);
    return objc_msgSend(*(id *)(v3 + 32), "hasGreenTeaWithValue:", a2);
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x10u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOETAResult readAll:](a1, 0);
    objc_msgSend(*(id *)(a1 + 32), "clearUnknownFields:", 1);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = *(id *)(a1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "clearUnknownFields:", 1);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v5);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(id *)(a1 + 24);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "clearUnknownFields:", 1, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

  }
}

- (GEOETAResult)init
{
  GEOETAResult *v2;
  GEOETAResult *v3;
  GEOETAResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETAResult;
  v2 = -[GEOETAResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETAResult)initWithData:(id)a3
{
  GEOETAResult *v3;
  GEOETAResult *v4;
  GEOETAResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETAResult;
  v3 = -[GEOETAResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)status
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 8) != 0)
      return *(unsigned int *)(v1 + 72);
    else
      return 0;
  }
  return result;
}

- (void)_readPlaceSearchResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSearchResponse_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)placeSearchResponse
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOETAResult _readPlaceSearchResponse]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setPlaceSearchResponse:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 76) |= 0x40u;
  *(_WORD *)(a1 + 76) |= 0x100u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readSortedETAs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSortedETAs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)sortedETAs
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOETAResult _readSortedETAs]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addSortedETA:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOETAResult _readSortedETAs](a1);
    -[GEOETAResult _addNoFlagsSortedETA:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_WORD *)(a1 + 76) |= 0x100u;
  }
}

- (void)_addNoFlagsSortedETA:(uint64_t)a1
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

- (void)_readEtaRouteIncidents
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOETAResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaRouteIncidents_tags_0);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)addEtaRouteIncident:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOETAResult _readEtaRouteIncidents](a1);
    -[GEOETAResult _addNoFlagsEtaRouteIncident:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_WORD *)(a1 + 76) |= 0x100u;
  }
}

- (void)_addNoFlagsEtaRouteIncident:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOETAResult;
  -[GEOETAResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETAResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETAResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
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
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOETAResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 76);
  if ((v5 & 8) != 0)
  {
    v6 = *(_DWORD *)(a1 + 72);
    if (v6 <= 29)
    {
      v7 = CFSTR("STATUS_SUCCESS");
      switch(v6)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v7 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v7 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v7 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v6 != 20)
            goto LABEL_15;
          v7 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v6 > 49)
    {
      if (v6 == 50)
      {
        v7 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v6 == 60)
      {
        v7 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v6 == 30)
      {
        v7 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v6 == 40)
      {
        v7 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("status"));

        v5 = *(_WORD *)(a1 + 76);
        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 72));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("liveTravelTime"));

    v5 = *(_WORD *)(a1 + 76);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("historicTravelTime"));

  }
  -[GEOETAResult placeSearchResponse]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v10, "jsonRepresentation");
    else
      objc_msgSend(v10, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("placeSearchResponse"));

  }
  if ((*(_WORD *)(a1 + 76) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("distance"));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v15 = *(id *)(a1 + 40);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("sortedETA"));
  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v23 = *(id *)(a1 + 24);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("etaRouteIncident");
    else
      v30 = CFSTR("eta_route_incident");
    objc_msgSend(v4, "setObject:forKey:", v22, v30);

  }
  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __42__GEOETAResult__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

      v33 = v36;
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETAResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_684_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_685_0;
      GEOETAResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOETAResultCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __42__GEOETAResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  GEOPlaceSearchResponse *v15;
  GEOPlaceSearchResponse *v16;
  GEOPlaceSearchResponse *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  GEOETAResultByType *v27;
  GEOETAResultByType *v28;
  GEOETAResultByType *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  GEOETARouteIncident *v38;
  GEOETARouteIncident *v39;
  GEOETARouteIncident *v40;
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
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_69;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v9 = 30;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v9 = 40;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v9 = 50;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v9 = 60;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_25:
    *(_WORD *)(v6 + 76) |= 0x100u;
    *(_WORD *)(v6 + 76) |= 8u;
    *(_DWORD *)(v6 + 72) = v9;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("liveTravelTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "unsignedIntValue");
    *(_WORD *)(v6 + 76) |= 0x100u;
    *(_WORD *)(v6 + 76) |= 4u;
    *(_DWORD *)(v6 + 68) = v11;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("historicTravelTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_msgSend(v12, "unsignedIntValue");
    *(_WORD *)(v6 + 76) |= 0x100u;
    *(_WORD *)(v6 + 76) |= 2u;
    *(_DWORD *)(v6 + 64) = v13;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeSearchResponse"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOPlaceSearchResponse alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOPlaceSearchResponse initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOPlaceSearchResponse initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = v16;
    -[GEOETAResult setPlaceSearchResponse:](v6, v16);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = objc_msgSend(v18, "unsignedIntValue");
    *(_WORD *)(v6 + 76) |= 0x100u;
    *(_WORD *)(v6 + 76) |= 1u;
    *(_DWORD *)(v6 + 60) = v19;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sortedETA"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v42 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v48 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = [GEOETAResultByType alloc];
            if ((a3 & 1) != 0)
              v28 = -[GEOETAResultByType initWithJSON:](v27, "initWithJSON:", v26);
            else
              v28 = -[GEOETAResultByType initWithDictionary:](v27, "initWithDictionary:", v26);
            v29 = v28;
            -[GEOETAResult addSortedETA:](v6, v28);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v23);
    }

    v5 = v42;
  }

  if (a3)
    v30 = CFSTR("etaRouteIncident");
  else
    v30 = CFSTR("eta_route_incident");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v44 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = [GEOETARouteIncident alloc];
            if ((a3 & 1) != 0)
              v39 = -[GEOETARouteIncident initWithJSON:](v38, "initWithJSON:", v37);
            else
              v39 = -[GEOETARouteIncident initWithDictionary:](v38, "initWithDictionary:", v37);
            v40 = v39;
            -[GEOETAResult addEtaRouteIncident:](v6, v39);

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v34);
    }

    v5 = v42;
  }

LABEL_69:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOETAResultReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v15;
  void *v16;
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETAResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
    goto LABEL_30;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETAResult readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_5;
LABEL_27:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_27;
LABEL_5:
  if ((flags & 2) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_placeSearchResponse)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint32Field();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_sortedETAs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_etaRouteIncidents;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
LABEL_30:

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
  PBUnknownFields *v22;
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
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
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
      GEOETAResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETAResult readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
    if ((flags & 4) == 0)
      goto LABEL_7;
LABEL_28:
    *(_DWORD *)(v5 + 68) = self->_liveTravelTime;
    *(_WORD *)(v5 + 76) |= 4u;
    if ((*(_WORD *)&self->_flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 72) = self->_status;
  *(_WORD *)(v5 + 76) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_28;
LABEL_7:
  if ((flags & 2) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 64) = self->_historicTravelTime;
    *(_WORD *)(v5 + 76) |= 2u;
  }
LABEL_9:
  v10 = -[GEOPlaceSearchResponse copyWithZone:](self->_placeSearchResponse, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_distance;
    *(_WORD *)(v5 + 76) |= 1u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = self->_sortedETAs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOETAResult addSortedETA:](v5, v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_etaRouteIncidents;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v24);
        -[GEOETAResult addEtaRouteIncident:](v5, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v18);
  }

  v22 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOPlaceSearchResponse *placeSearchResponse;
  NSMutableArray *sortedETAs;
  NSMutableArray *etaRouteIncidents;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOETAResult readAll:]((uint64_t)self, 1);
  -[GEOETAResult readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 38);
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_status != *((_DWORD *)v4 + 18))
      goto LABEL_29;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_liveTravelTime != *((_DWORD *)v4 + 17))
      goto LABEL_29;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 16))
      goto LABEL_29;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_29;
  }
  placeSearchResponse = self->_placeSearchResponse;
  if ((unint64_t)placeSearchResponse | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPlaceSearchResponse isEqual:](placeSearchResponse, "isEqual:"))
    {
LABEL_29:
      v10 = 0;
      goto LABEL_30;
    }
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 38);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_distance != *((_DWORD *)v4 + 15))
      goto LABEL_29;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_29;
  }
  sortedETAs = self->_sortedETAs;
  if ((unint64_t)sortedETAs | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](sortedETAs, "isEqual:"))
  {
    goto LABEL_29;
  }
  etaRouteIncidents = self->_etaRouteIncidents;
  if ((unint64_t)etaRouteIncidents | *((_QWORD *)v4 + 3))
    v10 = -[NSMutableArray isEqual:](etaRouteIncidents, "isEqual:");
  else
    v10 = 1;
LABEL_30:

  return v10;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  -[GEOETAResult readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
    v4 = 0;
    if ((flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((flags & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_status;
  if ((flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_liveTravelTime;
  if ((flags & 2) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_historicTravelTime;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[GEOPlaceSearchResponse hash](self->_placeSearchResponse, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_distance;
  else
    v8 = 0;
  v9 = v5 ^ v4 ^ v6 ^ v8 ^ v7;
  v10 = -[NSMutableArray hash](self->_sortedETAs, "hash");
  return v9 ^ v10 ^ -[NSMutableArray hash](self->_etaRouteIncidents, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedETAs, 0);
  objc_storeStrong((id *)&self->_placeSearchResponse, 0);
  objc_storeStrong((id *)&self->_etaRouteIncidents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
