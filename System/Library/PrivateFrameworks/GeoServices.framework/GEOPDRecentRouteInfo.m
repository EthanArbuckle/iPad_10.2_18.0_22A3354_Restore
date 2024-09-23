@implementation GEOPDRecentRouteInfo

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)v3, 0);
  v4 = (void *)*((_QWORD *)v3 + 9);
  if (v4)
    -[GEOPDRecentRouteInfo setZilchPoints:](a1, v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *((id *)v3 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[GEOPDRecentRouteInfo addZilchPointSegment:](a1, *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v10 = (void *)*((_QWORD *)v3 + 5);
  if (v10)
    -[GEOPDRecentRouteInfo setOriginalWaypointRoute:](a1, v10);
  v11 = (void *)*((_QWORD *)v3 + 7);
  if (v11)
    -[GEOPDRecentRouteInfo setSessionState:](a1, v11);
  v12 = (void *)*((_QWORD *)v3 + 6);
  if (v12)
    -[GEOPDRecentRouteInfo setRouteId:](a1, v12);
  if ((*((_WORD *)v3 + 48) & 1) != 0)
  {
    *(_DWORD *)(a1 + 92) = *((_DWORD *)v3 + 23);
    *(_WORD *)(a1 + 96) |= 1u;
  }
  v13 = (void *)*((_QWORD *)v3 + 3);
  if (v13)
    -[GEOPDRecentRouteInfo setEtaFilter:](a1, v13);
  v14 = (void *)*((_QWORD *)v3 + 4);
  if (v14)
    -[GEOPDRecentRouteInfo setEvChargingMetadata:](a1, v14);

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 2u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDRecentRouteInfo readAll:](a1, 0);
  }
}

- (GEOPDRecentRouteInfo)init
{
  GEOPDRecentRouteInfo *v2;
  GEOPDRecentRouteInfo *v3;
  GEOPDRecentRouteInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDRecentRouteInfo;
  v2 = -[GEOPDRecentRouteInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDRecentRouteInfo)initWithData:(id)a3
{
  GEOPDRecentRouteInfo *v3;
  GEOPDRecentRouteInfo *v4;
  GEOPDRecentRouteInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDRecentRouteInfo;
  v3 = -[GEOPDRecentRouteInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setZilchPoints:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 96) |= 0x100u;
  *(_WORD *)(a1 + 96) |= 0x200u;
  objc_storeStrong((id *)(a1 + 72), a2);

}

- (void)_readZilchPointSegments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDRecentRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilchPointSegments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)zilchPointSegments
{
  -[GEOPDRecentRouteInfo _readZilchPointSegments](a1);
  return *(id *)(a1 + 64);
}

- (void)addZilchPointSegment:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDRecentRouteInfo _readZilchPointSegments](a1);
    -[GEOPDRecentRouteInfo _addNoFlagsZilchPointSegment:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsZilchPointSegment:(uint64_t)a1
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

- (void)setOriginalWaypointRoute:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x10u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

- (void)setSessionState:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x40u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)setRouteId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 0x20u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)_readEtaFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDRecentRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEtaFilter_tags_4943);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)setEtaFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 96) |= 4u;
    *(_WORD *)(a1 + 96) |= 0x200u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)setEvChargingMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_WORD *)(a1 + 96) |= 8u;
  *(_WORD *)(a1 + 96) |= 0x200u;
  objc_storeStrong((id *)(a1 + 32), a2);

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
  v8.super_class = (Class)GEOPDRecentRouteInfo;
  -[GEOPDRecentRouteInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDRecentRouteInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDRecentRouteInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  const __CFString *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDRecentRouteInfo readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDRecentRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilchPoints_tags_0);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v7 = *(id *)(a1 + 72);
  if (!v7)
  {
    if (!*(_QWORD *)(a1 + 64))
      goto LABEL_21;
    if (a2)
    {
LABEL_11:
      v10 = (void *)MEMORY[0x1E0C99DE8];
      -[GEOPDRecentRouteInfo zilchPointSegments](a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      -[GEOPDRecentRouteInfo zilchPointSegments](a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v55 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v17);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v14);
      }

      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("zilchPointSegment"));
      goto LABEL_21;
    }
LABEL_20:
    -[GEOPDRecentRouteInfo zilchPointSegments](a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("zilch_point_segment"));

    goto LABEL_21;
  }
  v8 = v7;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("zilch_points"));

    if (!*(_QWORD *)(a1 + 64))
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("zilchPoints"));

  if (*(_QWORD *)(a1 + 64))
    goto LABEL_11;
LABEL_21:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = v19;
      objc_sync_enter(v20);
      GEOPDRecentRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalWaypointRoute_tags);
      objc_sync_exit(v20);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v21 = *(id *)(a1 + 40);
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "base64EncodedStringWithOptions:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("originalWaypointRoute"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("original_waypoint_route"));
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
  {
    v24 = *(void **)(a1 + 8);
    if (v24)
    {
      v25 = v24;
      objc_sync_enter(v25);
      GEOPDRecentRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionState_tags);
      objc_sync_exit(v25);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v26 = *(id *)(a1 + 56);
  v27 = v26;
  if (v26)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v26, "base64EncodedStringWithOptions:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("sessionState"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("session_state"));
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
  {
    v29 = *(void **)(a1 + 8);
    if (v29)
    {
      v30 = v29;
      objc_sync_enter(v30);
      GEOPDRecentRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteId_tags);
      objc_sync_exit(v30);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v31 = *(id *)(a1 + 48);
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "base64EncodedStringWithOptions:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("routeId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("route_id"));
    }
  }

  if ((*(_WORD *)(a1 + 96) & 1) != 0)
  {
    v34 = *(int *)(a1 + 92);
    if (v34 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 92));
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_1E1C05158[v34];
    }
    if (a2)
      v36 = CFSTR("preferredTransportType");
    else
      v36 = CFSTR("preferred_transport_type");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  -[GEOPDRecentRouteInfo _readEtaFilter](a1);
  v37 = *(id *)(a1 + 24);
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v37, "base64EncodedStringWithOptions:", 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("etaFilter"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("eta_filter"));
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_WORD *)(a1 + 96) & 8) == 0)
  {
    v40 = *(void **)(a1 + 8);
    if (v40)
    {
      v41 = v40;
      objc_sync_enter(v41);
      GEOPDRecentRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargingMetadata_tags);
      objc_sync_exit(v41);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v42 = *(id *)(a1 + 32);
  v43 = v42;
  if (v42)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v42, "base64EncodedStringWithOptions:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("evChargingMetadata"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("ev_charging_metadata"));
    }
  }

  v45 = *(void **)(a1 + 16);
  if (v45)
  {
    objc_msgSend(v45, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v46, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __50__GEOPDRecentRouteInfo__dictionaryRepresentation___block_invoke;
      v52[3] = &unk_1E1C00600;
      v49 = v48;
      v53 = v49;
      objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v52);
      v50 = v49;

    }
    else
    {
      v50 = v46;
    }
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDRecentRouteInfo _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_4972;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4973;
      GEOPDRecentRouteInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __50__GEOPDRecentRouteInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  int v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (!v6)
    goto LABEL_68;
  if (a3)
    v7 = CFSTR("zilchPoints");
  else
    v7 = CFSTR("zilch_points");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
    -[GEOPDRecentRouteInfo setZilchPoints:](v6, v9);

  }
  if (a3)
    v10 = CFSTR("zilchPointSegment");
  else
    v10 = CFSTR("zilch_point_segment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = a3;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v41;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v41 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v17, 0);
            -[GEOPDRecentRouteInfo addZilchPointSegment:](v6, v18);

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v14);
    }

    a3 = v39;
  }

  if (a3)
    v19 = CFSTR("originalWaypointRoute");
  else
    v19 = CFSTR("original_waypoint_route");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v20, 0);
    -[GEOPDRecentRouteInfo setOriginalWaypointRoute:](v6, v21);

  }
  if (a3)
    v22 = CFSTR("sessionState");
  else
    v22 = CFSTR("session_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v23, 0);
    -[GEOPDRecentRouteInfo setSessionState:](v6, v24);

  }
  if (a3)
    v25 = CFSTR("routeId");
  else
    v25 = CFSTR("route_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v26, 0);
    -[GEOPDRecentRouteInfo setRouteId:](v6, v27);

  }
  if (a3)
    v28 = CFSTR("preferredTransportType");
  else
    v28 = CFSTR("preferred_transport_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v29;
    if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_NONE")) & 1) != 0)
    {
      v31 = 0;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_DRIVING")) & 1) != 0)
    {
      v31 = 1;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_WALKING")) & 1) != 0)
    {
      v31 = 2;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_TRANSIT")) & 1) != 0)
    {
      v31 = 3;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_RIDESHARE")) & 1) != 0)
    {
      v31 = 4;
    }
    else if (objc_msgSend(v30, "isEqualToString:", CFSTR("PREFERRED_TRANSPORT_TYPE_CYCLING")))
    {
      v31 = 5;
    }
    else
    {
      v31 = 0;
    }

    goto LABEL_56;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = objc_msgSend(v29, "intValue");
LABEL_56:
    *(_WORD *)(v6 + 96) |= 0x200u;
    *(_WORD *)(v6 + 96) |= 1u;
    *(_DWORD *)(v6 + 92) = v31;
  }

  if (a3)
    v32 = CFSTR("etaFilter");
  else
    v32 = CFSTR("eta_filter");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v33, 0);
    -[GEOPDRecentRouteInfo setEtaFilter:](v6, v34);

  }
  if (a3)
    v35 = CFSTR("evChargingMetadata");
  else
    v35 = CFSTR("ev_charging_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v36, 0);
    -[GEOPDRecentRouteInfo setEvChargingMetadata:](v6, v37);

  }
LABEL_68:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDRecentRouteInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x3FC) == 0))
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
    -[GEOPDRecentRouteInfo readAll:]((uint64_t)self, 0);
    if (self->_zilchPoints)
      PBDataWriterWriteDataField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_zilchPointSegments;
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
          PBDataWriterWriteDataField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_originalWaypointRoute)
      PBDataWriterWriteDataField();
    if (self->_sessionState)
      PBDataWriterWriteDataField();
    if (self->_routeId)
      PBDataWriterWriteDataField();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_etaFilter)
      PBDataWriterWriteDataField();
    if (self->_evChargingMetadata)
      PBDataWriterWriteDataField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  PBUnknownFields *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
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
      GEOPDRecentRouteInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)self, 0);
  v9 = -[NSData copyWithZone:](self->_zilchPoints, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_zilchPointSegments;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v28);
        -[GEOPDRecentRouteInfo addZilchPointSegment:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  v16 = -[NSData copyWithZone:](self->_originalWaypointRoute, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  v18 = -[NSData copyWithZone:](self->_sessionState, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  v20 = -[NSData copyWithZone:](self->_routeId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_preferredTransportType;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  v22 = -[NSData copyWithZone:](self->_etaFilter, "copyWithZone:", a3, (_QWORD)v28);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  v24 = -[NSData copyWithZone:](self->_evChargingMetadata, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v24;

  v26 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v26;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *zilchPoints;
  NSMutableArray *zilchPointSegments;
  NSData *originalWaypointRoute;
  NSData *sessionState;
  NSData *routeId;
  __int16 v10;
  NSData *etaFilter;
  NSData *evChargingMetadata;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)self, 1);
  -[GEOPDRecentRouteInfo readAll:]((uint64_t)v4, 1);
  zilchPoints = self->_zilchPoints;
  if ((unint64_t)zilchPoints | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](zilchPoints, "isEqual:"))
      goto LABEL_21;
  }
  zilchPointSegments = self->_zilchPointSegments;
  if ((unint64_t)zilchPointSegments | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](zilchPointSegments, "isEqual:"))
      goto LABEL_21;
  }
  originalWaypointRoute = self->_originalWaypointRoute;
  if ((unint64_t)originalWaypointRoute | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](originalWaypointRoute, "isEqual:"))
      goto LABEL_21;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:"))
      goto LABEL_21;
  }
  routeId = self->_routeId;
  if ((unint64_t)routeId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](routeId, "isEqual:"))
      goto LABEL_21;
  }
  v10 = *((_WORD *)v4 + 48);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_preferredTransportType != *((_DWORD *)v4 + 23))
      goto LABEL_21;
  }
  else if ((v10 & 1) != 0)
  {
LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  etaFilter = self->_etaFilter;
  if ((unint64_t)etaFilter | *((_QWORD *)v4 + 3) && !-[NSData isEqual:](etaFilter, "isEqual:"))
    goto LABEL_21;
  evChargingMetadata = self->_evChargingMetadata;
  if ((unint64_t)evChargingMetadata | *((_QWORD *)v4 + 4))
    v13 = -[NSData isEqual:](evChargingMetadata, "isEqual:");
  else
    v13 = 1;
LABEL_22:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[GEOPDRecentRouteInfo readAll:]((uint64_t)self, 1);
  v3 = -[NSData hash](self->_zilchPoints, "hash");
  v4 = -[NSMutableArray hash](self->_zilchPointSegments, "hash");
  v5 = -[NSData hash](self->_originalWaypointRoute, "hash");
  v6 = -[NSData hash](self->_sessionState, "hash");
  v7 = -[NSData hash](self->_routeId, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_preferredTransportType;
  else
    v8 = 0;
  v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  v10 = v8 ^ -[NSData hash](self->_etaFilter, "hash");
  return v9 ^ v10 ^ -[NSData hash](self->_evChargingMetadata, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilchPoints, 0);
  objc_storeStrong((id *)&self->_zilchPointSegments, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_routeId, 0);
  objc_storeStrong((id *)&self->_originalWaypointRoute, 0);
  objc_storeStrong((id *)&self->_evChargingMetadata, 0);
  objc_storeStrong((id *)&self->_etaFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
