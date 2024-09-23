@implementation GEOETATrafficUpdateWaypointRoute

- (GEOETATrafficUpdateWaypointRoute)init
{
  GEOETATrafficUpdateWaypointRoute *v2;
  GEOETATrafficUpdateWaypointRoute *v3;
  GEOETATrafficUpdateWaypointRoute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETATrafficUpdateWaypointRoute;
  v2 = -[GEOETATrafficUpdateWaypointRoute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETATrafficUpdateWaypointRoute)initWithData:(id)a3
{
  GEOETATrafficUpdateWaypointRoute *v3;
  GEOETATrafficUpdateWaypointRoute *v4;
  GEOETATrafficUpdateWaypointRoute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETATrafficUpdateWaypointRoute;
  v3 = -[GEOETATrafficUpdateWaypointRoute initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasIdentifier
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readRouteLegs
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteLegs_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)routeLegs
{
  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  return self->_routeLegs;
}

- (void)setRouteLegs:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeLegs;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  routeLegs = self->_routeLegs;
  self->_routeLegs = v4;

}

- (void)clearRouteLegs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_routeLegs, "removeAllObjects");
}

- (void)addRouteLeg:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  -[GEOETATrafficUpdateWaypointRoute _addNoFlagsRouteLeg:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsRouteLeg:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)routeLegsCount
{
  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  return -[NSMutableArray count](self->_routeLegs, "count");
}

- (id)routeLegAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeLegs, "objectAtIndex:", a3);
}

+ (Class)routeLegType
{
  return (Class)objc_opt_class();
}

- (void)_readTraversalTimes
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTraversalTimes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTraversalTimes
{
  -[GEOETATrafficUpdateWaypointRoute _readTraversalTimes]((uint64_t)self);
  return self->_traversalTimes != 0;
}

- (GEOTraversalTimes)traversalTimes
{
  -[GEOETATrafficUpdateWaypointRoute _readTraversalTimes]((uint64_t)self);
  return self->_traversalTimes;
}

- (void)setTraversalTimes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_traversalTimes, a3);
}

- (void)_readIncidentsOnUserWaypointRoutes
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentsOnUserWaypointRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)incidentsOnUserWaypointRoutes
{
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  return self->_incidentsOnUserWaypointRoutes;
}

- (void)setIncidentsOnUserWaypointRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *incidentsOnUserWaypointRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  incidentsOnUserWaypointRoutes = self->_incidentsOnUserWaypointRoutes;
  self->_incidentsOnUserWaypointRoutes = v4;

}

- (void)clearIncidentsOnUserWaypointRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_incidentsOnUserWaypointRoutes, "removeAllObjects");
}

- (void)addIncidentsOnUserWaypointRoute:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  -[GEOETATrafficUpdateWaypointRoute _addNoFlagsIncidentsOnUserWaypointRoute:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsIncidentsOnUserWaypointRoute:(uint64_t)a1
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

- (unint64_t)incidentsOnUserWaypointRoutesCount
{
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_incidentsOnUserWaypointRoutes, "count");
}

- (id)incidentsOnUserWaypointRouteAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_incidentsOnUserWaypointRoutes, "objectAtIndex:", a3);
}

+ (Class)incidentsOnUserWaypointRouteType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficBannerTexts
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficBannerTexts_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)trafficBannerTexts
{
  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  return self->_trafficBannerTexts;
}

- (void)setTrafficBannerTexts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficBannerTexts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  trafficBannerTexts = self->_trafficBannerTexts;
  self->_trafficBannerTexts = v4;

}

- (void)clearTrafficBannerTexts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_trafficBannerTexts, "removeAllObjects");
}

- (void)addTrafficBannerText:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  -[GEOETATrafficUpdateWaypointRoute _addNoFlagsTrafficBannerText:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsTrafficBannerText:(uint64_t)a1
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

- (unint64_t)trafficBannerTextsCount
{
  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficBannerTexts, "count");
}

- (id)trafficBannerTextAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficBannerTexts, "objectAtIndex:", a3);
}

+ (Class)trafficBannerTextType
{
  return (Class)objc_opt_class();
}

- (void)_readNewWaypointRoutes
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNewWaypointRoutes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)newWaypointRoutes
{
  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  return self->_newWaypointRoutes;
}

- (void)setNewWaypointRoutes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *newWaypointRoutes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  newWaypointRoutes = self->_newWaypointRoutes;
  self->_newWaypointRoutes = v4;

}

- (void)clearNewWaypointRoutes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
  -[NSMutableArray removeAllObjects](self->_newWaypointRoutes, "removeAllObjects");
}

- (void)addNewWaypointRoutes:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  -[GEOETATrafficUpdateWaypointRoute _addNoFlagsNewWaypointRoutes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x100u;
}

- (void)_addNoFlagsNewWaypointRoutes:(uint64_t)a1
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

- (unint64_t)newWaypointRoutesCount
{
  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  return -[NSMutableArray count](self->_newWaypointRoutes, "count");
}

- (id)newWaypointRoutesAtIndex:(unint64_t)a3
{
  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  -[NSMutableArray objectAtIndex:](self->_newWaypointRoutes, "objectAtIndex:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)newWaypointRoutesType
{
  objc_opt_class();
  return (Class)objc_claimAutoreleasedReturnValue();
}

- (void)_readNavigabilityInfo
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
        GEOETATrafficUpdateWaypointRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNavigabilityInfo_tags_1540);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasNavigabilityInfo
{
  -[GEOETATrafficUpdateWaypointRoute _readNavigabilityInfo]((uint64_t)self);
  return self->_navigabilityInfo != 0;
}

- (GEONavigabilityInfo)navigabilityInfo
{
  -[GEOETATrafficUpdateWaypointRoute _readNavigabilityInfo]((uint64_t)self);
  return self->_navigabilityInfo;
}

- (void)setNavigabilityInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_navigabilityInfo, a3);
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
  v8.super_class = (Class)GEOETATrafficUpdateWaypointRoute;
  -[GEOETATrafficUpdateWaypointRoute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETATrafficUpdateWaypointRoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETATrafficUpdateWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  _QWORD v57[4];
  id v58;
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
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v7 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v72 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v12, "jsonRepresentation");
          else
            objc_msgSend(v12, "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
      }
      while (v9);
    }

    if (a2)
      v14 = CFSTR("routeLeg");
    else
      v14 = CFSTR("route_leg");
    objc_msgSend(v4, "setObject:forKey:", v6, v14);

  }
  objc_msgSend((id)a1, "traversalTimes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("traversalTimes");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("traversal_times");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v20 = *(id *)(a1 + 24);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v68 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      }
      while (v22);
    }

    if (a2)
      v27 = CFSTR("incidentsOnUserWaypointRoute");
    else
      v27 = CFSTR("incidents_on_user_waypoint_route");
    objc_msgSend(v4, "setObject:forKey:", v19, v27);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v29 = *(id *)(a1 + 56);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v64 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v34, "jsonRepresentation");
          else
            objc_msgSend(v34, "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v35);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
      }
      while (v31);
    }

    if (a2)
      v36 = CFSTR("trafficBannerText");
    else
      v36 = CFSTR("traffic_banner_text");
    objc_msgSend(v4, "setObject:forKey:", v28, v36);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v38 = *(id *)(a1 + 40);
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v60;
      do
      {
        for (m = 0; m != v40; ++m)
        {
          if (*(_QWORD *)v60 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v43, "jsonRepresentation");
          else
            objc_msgSend(v43, "dictionaryRepresentation");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v44);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
      }
      while (v40);
    }

    if (a2)
      v45 = CFSTR("newWaypointRoutes");
    else
      v45 = CFSTR("new_waypoint_routes");
    objc_msgSend(v4, "setObject:forKey:", v37, v45);

  }
  objc_msgSend((id)a1, "navigabilityInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v46, "jsonRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("navigabilityInfo");
    }
    else
    {
      objc_msgSend(v46, "dictionaryRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("navigability_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

  }
  v50 = *(void **)(a1 + 16);
  if (v50)
  {
    objc_msgSend(v50, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v51, "count"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __62__GEOETATrafficUpdateWaypointRoute__dictionaryRepresentation___block_invoke;
      v57[3] = &unk_1E1C00600;
      v54 = v53;
      v58 = v54;
      objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", v57);
      v55 = v54;

      v52 = v55;
    }
    objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETATrafficUpdateWaypointRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOETATrafficUpdateWaypointRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOETATrafficUpdateWaypointRoute)initWithDictionary:(id)a3
{
  return (GEOETATrafficUpdateWaypointRoute *)-[GEOETATrafficUpdateWaypointRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  GEOETARoute *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOTraversalTimes *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  GEORouteIncident *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  GEOTrafficBannerText *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  uint64_t v52;
  GEOWaypointRoute *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  GEONavigabilityInfo *v58;
  uint64_t v59;
  void *v60;
  id v62;
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
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v6, "unsignedIntValue"));

      if (a3)
        v7 = CFSTR("routeLeg");
      else
        v7 = CFSTR("route_leg");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v62 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v76;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v76 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = [GEOETARoute alloc];
                if ((a3 & 1) != 0)
                  v16 = -[GEOETARoute initWithJSON:](v15, "initWithJSON:", v14);
                else
                  v16 = -[GEOETARoute initWithDictionary:](v15, "initWithDictionary:", v14);
                v17 = (void *)v16;
                objc_msgSend(a1, "addRouteLeg:", v16);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
          }
          while (v11);
        }

        v5 = v62;
      }

      if (a3)
        v18 = CFSTR("traversalTimes");
      else
        v18 = CFSTR("traversal_times");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOTraversalTimes alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOTraversalTimes initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOTraversalTimes initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setTraversalTimes:", v21);

      }
      if (a3)
        v23 = CFSTR("incidentsOnUserWaypointRoute");
      else
        v23 = CFSTR("incidents_on_user_waypoint_route");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v72;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v72 != v28)
                objc_enumerationMutation(v25);
              v30 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = [GEORouteIncident alloc];
                if ((a3 & 1) != 0)
                  v32 = -[GEORouteIncident initWithJSON:](v31, "initWithJSON:", v30);
                else
                  v32 = -[GEORouteIncident initWithDictionary:](v31, "initWithDictionary:", v30);
                v33 = (void *)v32;
                objc_msgSend(a1, "addIncidentsOnUserWaypointRoute:", v32);

              }
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
          }
          while (v27);
        }

        v5 = v62;
      }

      if (a3)
        v34 = CFSTR("trafficBannerText");
      else
        v34 = CFSTR("traffic_banner_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v36 = v35;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v68;
          do
          {
            for (k = 0; k != v38; ++k)
            {
              if (*(_QWORD *)v68 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = [GEOTrafficBannerText alloc];
                if ((a3 & 1) != 0)
                  v43 = -[GEOTrafficBannerText initWithJSON:](v42, "initWithJSON:", v41);
                else
                  v43 = -[GEOTrafficBannerText initWithDictionary:](v42, "initWithDictionary:", v41);
                v44 = (void *)v43;
                objc_msgSend(a1, "addTrafficBannerText:", v43);

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
          }
          while (v38);
        }

        v5 = v62;
      }

      if (a3)
        v45 = CFSTR("newWaypointRoutes");
      else
        v45 = CFSTR("new_waypoint_routes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v47 = v46;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v64;
          do
          {
            for (m = 0; m != v49; ++m)
            {
              if (*(_QWORD *)v64 != v50)
                objc_enumerationMutation(v47);
              v52 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v53 = [GEOWaypointRoute alloc];
                if ((a3 & 1) != 0)
                  v54 = -[GEOWaypointRoute initWithJSON:](v53, "initWithJSON:", v52);
                else
                  v54 = -[GEOWaypointRoute initWithDictionary:](v53, "initWithDictionary:", v52);
                v55 = (void *)v54;
                objc_msgSend(a1, "addNewWaypointRoutes:", v54);

              }
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
          }
          while (v49);
        }

        v5 = v62;
      }

      if (a3)
        v56 = CFSTR("navigabilityInfo");
      else
        v56 = CFSTR("navigability_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = [GEONavigabilityInfo alloc];
        if ((a3 & 1) != 0)
          v59 = -[GEONavigabilityInfo initWithJSON:](v58, "initWithJSON:", v57);
        else
          v59 = -[GEONavigabilityInfo initWithDictionary:](v58, "initWithDictionary:", v57);
        v60 = (void *)v59;
        objc_msgSend(a1, "setNavigabilityInfo:", v59);

      }
    }
  }

  return a1;
}

- (GEOETATrafficUpdateWaypointRoute)initWithJSON:(id)a3
{
  return (GEOETATrafficUpdateWaypointRoute *)-[GEOETATrafficUpdateWaypointRoute _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1560;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1561;
    GEOETATrafficUpdateWaypointRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOETATrafficUpdateWaypointRouteCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETATrafficUpdateWaypointRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETATrafficUpdateWaypointRouteReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t m;
  PBDataReader *v22;
  void *v23;
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
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETATrafficUpdateWaypointRouteIsDirty((uint64_t)self) & 1) == 0)
  {
    v22 = self->_reader;
    objc_sync_enter(v22);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v23);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v22);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOETATrafficUpdateWaypointRoute readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v6 = self->_routeLegs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v37 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v7);
    }

    if (self->_traversalTimes)
      PBDataWriterWriteSubmessage();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = self->_incidentsOnUserWaypointRoutes;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      }
      while (v11);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_trafficBannerTexts;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v29;
      do
      {
        for (k = 0; k != v15; ++k)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteSubmessage();
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v15);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = self->_newWaypointRoutes;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v25;
      do
      {
        for (m = 0; m != v19; ++m)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
      }
      while (v19);
    }

    if (self->_navigabilityInfo)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v24);
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
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
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v3 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  -[GEOETATrafficUpdateWaypointRoute _readIncidentsOnUserWaypointRoutes]((uint64_t)self);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = self->_incidentsOnUserWaypointRoutes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_34;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOETATrafficUpdateWaypointRoute _readNewWaypointRoutes]((uint64_t)self);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->_newWaypointRoutes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_34;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        if (v11)
          goto LABEL_11;
        break;
      }
    }
  }

  -[GEOETATrafficUpdateWaypointRoute _readRouteLegs]((uint64_t)self);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_routeLegs;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
LABEL_19:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_34;
      if (v15 == ++v17)
      {
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
        if (v15)
          goto LABEL_19;
        break;
      }
    }
  }

  -[GEOETATrafficUpdateWaypointRoute _readTrafficBannerTexts]((uint64_t)self);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_trafficBannerTexts;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
LABEL_27:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v20)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3, (_QWORD)v24) & 1) != 0)
        break;
      if (v19 == ++v21)
      {
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
        if (v19)
          goto LABEL_27;
        goto LABEL_33;
      }
    }
LABEL_34:
    v22 = 1;
    goto LABEL_35;
  }
LABEL_33:
  v22 = 0;
LABEL_35:

  return v22;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  id v19;
  id *v20;

  v20 = (id *)a3;
  -[GEOETATrafficUpdateWaypointRoute readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v20 + 1, self->_reader);
  *((_DWORD *)v20 + 18) = self->_readerMarkPos;
  *((_DWORD *)v20 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v20 + 21) = self->_identifier;
    *((_WORD *)v20 + 44) |= 1u;
  }
  if (-[GEOETATrafficUpdateWaypointRoute routeLegsCount](self, "routeLegsCount"))
  {
    objc_msgSend(v20, "clearRouteLegs");
    v4 = -[GEOETATrafficUpdateWaypointRoute routeLegsCount](self, "routeLegsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOETATrafficUpdateWaypointRoute routeLegAtIndex:](self, "routeLegAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addRouteLeg:", v7);

      }
    }
  }
  if (self->_traversalTimes)
    objc_msgSend(v20, "setTraversalTimes:");
  if (-[GEOETATrafficUpdateWaypointRoute incidentsOnUserWaypointRoutesCount](self, "incidentsOnUserWaypointRoutesCount"))
  {
    objc_msgSend(v20, "clearIncidentsOnUserWaypointRoutes");
    v8 = -[GEOETATrafficUpdateWaypointRoute incidentsOnUserWaypointRoutesCount](self, "incidentsOnUserWaypointRoutesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOETATrafficUpdateWaypointRoute incidentsOnUserWaypointRouteAtIndex:](self, "incidentsOnUserWaypointRouteAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addIncidentsOnUserWaypointRoute:", v11);

      }
    }
  }
  if (-[GEOETATrafficUpdateWaypointRoute trafficBannerTextsCount](self, "trafficBannerTextsCount"))
  {
    objc_msgSend(v20, "clearTrafficBannerTexts");
    v12 = -[GEOETATrafficUpdateWaypointRoute trafficBannerTextsCount](self, "trafficBannerTextsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEOETATrafficUpdateWaypointRoute trafficBannerTextAtIndex:](self, "trafficBannerTextAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addTrafficBannerText:", v15);

      }
    }
  }
  if (-[GEOETATrafficUpdateWaypointRoute newWaypointRoutesCount](self, "newWaypointRoutesCount"))
  {
    objc_msgSend(v20, "clearNewWaypointRoutes");
    v16 = -[GEOETATrafficUpdateWaypointRoute newWaypointRoutesCount](self, "newWaypointRoutesCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        v19 = -[GEOETATrafficUpdateWaypointRoute newWaypointRoutesAtIndex:](self, "newWaypointRoutesAtIndex:", m);
        objc_msgSend(v20, "addNewWaypointRoutes:", v19);

      }
    }
  }
  if (self->_navigabilityInfo)
    objc_msgSend(v20, "setNavigabilityInfo:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  void *v30;
  id v31;
  void *v32;
  PBUnknownFields *v33;
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
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
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
      GEOETATrafficUpdateWaypointRouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_36;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETATrafficUpdateWaypointRoute readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_identifier;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v9 = self->_routeLegs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v48 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteLeg:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v10);
  }

  v14 = -[GEOTraversalTimes copyWithZone:](self->_traversalTimes, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v16 = self->_incidentsOnUserWaypointRoutes;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIncidentsOnUserWaypointRoute:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v17);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = self->_trafficBannerTexts;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficBannerText:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v22);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = self->_newWaypointRoutes;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v26);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v35);
        objc_msgSend((id)v5, "addNewWaypointRoutes:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v27);
  }

  v31 = -[GEONavigabilityInfo copyWithZone:](self->_navigabilityInfo, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v31;

  v33 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v33;
LABEL_36:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSMutableArray *routeLegs;
  GEOTraversalTimes *traversalTimes;
  NSMutableArray *incidentsOnUserWaypointRoutes;
  NSMutableArray *trafficBannerTexts;
  NSMutableArray *newWaypointRoutes;
  GEONavigabilityInfo *navigabilityInfo;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOETATrafficUpdateWaypointRoute readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_identifier != *((_DWORD *)v4 + 21))
      goto LABEL_19;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  routeLegs = self->_routeLegs;
  if ((unint64_t)routeLegs | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](routeLegs, "isEqual:"))
  {
    goto LABEL_19;
  }
  traversalTimes = self->_traversalTimes;
  if ((unint64_t)traversalTimes | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOTraversalTimes isEqual:](traversalTimes, "isEqual:"))
      goto LABEL_19;
  }
  incidentsOnUserWaypointRoutes = self->_incidentsOnUserWaypointRoutes;
  if ((unint64_t)incidentsOnUserWaypointRoutes | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](incidentsOnUserWaypointRoutes, "isEqual:"))
      goto LABEL_19;
  }
  trafficBannerTexts = self->_trafficBannerTexts;
  if ((unint64_t)trafficBannerTexts | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](trafficBannerTexts, "isEqual:"))
      goto LABEL_19;
  }
  newWaypointRoutes = self->_newWaypointRoutes;
  if ((unint64_t)newWaypointRoutes | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](newWaypointRoutes, "isEqual:"))
      goto LABEL_19;
  }
  navigabilityInfo = self->_navigabilityInfo;
  if ((unint64_t)navigabilityInfo | *((_QWORD *)v4 + 4))
    v12 = -[GEONavigabilityInfo isEqual:](navigabilityInfo, "isEqual:");
  else
    v12 = 1;
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOETATrafficUpdateWaypointRoute readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_identifier;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_routeLegs, "hash") ^ v3;
  v5 = -[GEOTraversalTimes hash](self->_traversalTimes, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_incidentsOnUserWaypointRoutes, "hash");
  v7 = -[NSMutableArray hash](self->_trafficBannerTexts, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_newWaypointRoutes, "hash");
  return v6 ^ v8 ^ -[GEONavigabilityInfo hash](self->_navigabilityInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOTraversalTimes *traversalTimes;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  GEONavigabilityInfo *navigabilityInfo;
  uint64_t v28;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_WORD *)v4 + 44) & 1) != 0)
  {
    self->_identifier = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = *((id *)v4 + 6);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        -[GEOETATrafficUpdateWaypointRoute addRouteLeg:](self, "addRouteLeg:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v7);
  }

  traversalTimes = self->_traversalTimes;
  v11 = *((_QWORD *)v4 + 8);
  if (traversalTimes)
  {
    if (v11)
      -[GEOTraversalTimes mergeFrom:](traversalTimes, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOETATrafficUpdateWaypointRoute setTraversalTimes:](self, "setTraversalTimes:");
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = *((id *)v4 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(v12);
        -[GEOETATrafficUpdateWaypointRoute addIncidentsOnUserWaypointRoute:](self, "addIncidentsOnUserWaypointRoute:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v14);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = *((id *)v4 + 7);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        -[GEOETATrafficUpdateWaypointRoute addTrafficBannerText:](self, "addTrafficBannerText:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v19);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = *((id *)v4 + 5);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        -[GEOETATrafficUpdateWaypointRoute addNewWaypointRoutes:](self, "addNewWaypointRoutes:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * m), (_QWORD)v29);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    }
    while (v24);
  }

  navigabilityInfo = self->_navigabilityInfo;
  v28 = *((_QWORD *)v4 + 4);
  if (navigabilityInfo)
  {
    if (v28)
      -[GEONavigabilityInfo mergeFrom:](navigabilityInfo, "mergeFrom:");
  }
  else if (v28)
  {
    -[GEOETATrafficUpdateWaypointRoute setNavigabilityInfo:](self, "setNavigabilityInfo:");
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
      GEOETATrafficUpdateWaypointRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1564);
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
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x102u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOETATrafficUpdateWaypointRoute readAll:](self, "readAll:", 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_routeLegs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v9);
    }

    -[GEOTraversalTimes clearUnknownFields:](self->_traversalTimes, "clearUnknownFields:", 1);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = self->_incidentsOnUserWaypointRoutes;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v14);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_trafficBannerTexts;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v19);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = self->_newWaypointRoutes;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (_QWORD)v27);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v24);
    }

    -[GEONavigabilityInfo clearUnknownFields:](self->_navigabilityInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traversalTimes, 0);
  objc_storeStrong((id *)&self->_trafficBannerTexts, 0);
  objc_storeStrong((id *)&self->_routeLegs, 0);
  objc_storeStrong((id *)&self->_newWaypointRoutes, 0);
  objc_storeStrong((id *)&self->_navigabilityInfo, 0);
  objc_storeStrong((id *)&self->_incidentsOnUserWaypointRoutes, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
