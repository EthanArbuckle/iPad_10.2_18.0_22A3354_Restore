@implementation GEOTransitSuggestedRoute

- (GEOTransitSuggestedRoute)init
{
  GEOTransitSuggestedRoute *v2;
  GEOTransitSuggestedRoute *v3;
  GEOTransitSuggestedRoute *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitSuggestedRoute;
  v2 = -[GEOTransitSuggestedRoute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitSuggestedRoute)initWithData:(id)a3
{
  GEOTransitSuggestedRoute *v3;
  GEOTransitSuggestedRoute *v4;
  GEOTransitSuggestedRoute *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitSuggestedRoute;
  v3 = -[GEOTransitSuggestedRoute initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitSuggestedRoute;
  -[GEOTransitSuggestedRoute dealloc](&v3, sel_dealloc);
}

- (unsigned)absStartTime
{
  return self->_absStartTime;
}

- (void)setAbsStartTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_absStartTime = a3;
}

- (void)setHasAbsStartTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131074;
  else
    v3 = 0x20000;
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasAbsStartTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)absEndTime
{
  return self->_absEndTime;
}

- (void)setAbsEndTime:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_absEndTime = a3;
}

- (void)setHasAbsEndTime:(BOOL)a3
{
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasAbsEndTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readSteps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSteps_tags_1620);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)steps
{
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *steps;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  steps = self->_steps;
  self->_steps = v4;

}

- (void)clearSteps
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_steps, "removeAllObjects");
}

- (void)addSteps:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  -[GEOTransitSuggestedRoute _addNoFlagsSteps:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsSteps:(uint64_t)a1
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

- (unint64_t)stepsCount
{
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  return -[NSMutableArray count](self->_steps, "count");
}

- (id)stepsAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_steps, "objectAtIndex:", a3);
}

+ (Class)stepsType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteHandle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteHandle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasRouteHandle
{
  -[GEOTransitSuggestedRoute _readRouteHandle]((uint64_t)self);
  return self->_routeHandle != 0;
}

- (NSData)routeHandle
{
  -[GEOTransitSuggestedRoute _readRouteHandle]((uint64_t)self);
  return self->_routeHandle;
}

- (void)setRouteHandle:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_routeHandle, a3);
}

- (unsigned)rank
{
  return self->_rank;
}

- (void)setRank:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131076;
  else
    v3 = 0x20000;
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasRank
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readTransitIncidentMessage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 158) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitIncidentMessage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasTransitIncidentMessage
{
  -[GEOTransitSuggestedRoute _readTransitIncidentMessage]((uint64_t)self);
  return self->_transitIncidentMessage != 0;
}

- (GEOPBTransitRoutingIncidentMessage)transitIncidentMessage
{
  -[GEOTransitSuggestedRoute _readTransitIncidentMessage]((uint64_t)self);
  return self->_transitIncidentMessage;
}

- (void)setTransitIncidentMessage:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_transitIncidentMessage, a3);
}

- (void)_readAdvisoriesInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisoriesInfo_tags_1621);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasAdvisoriesInfo
{
  -[GEOTransitSuggestedRoute _readAdvisoriesInfo]((uint64_t)self);
  return self->_advisoriesInfo != 0;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  -[GEOTransitSuggestedRoute _readAdvisoriesInfo]((uint64_t)self);
  return self->_advisoriesInfo;
}

- (void)setAdvisoriesInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  objc_storeStrong((id *)&self->_advisoriesInfo, a3);
}

- (void)_readRoutePlanningArtworks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutePlanningArtworks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)routePlanningArtworks
{
  -[GEOTransitSuggestedRoute _readRoutePlanningArtworks]((uint64_t)self);
  return self->_routePlanningArtworks;
}

- (void)setRoutePlanningArtworks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routePlanningArtworks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  routePlanningArtworks = self->_routePlanningArtworks;
  self->_routePlanningArtworks = v4;

}

- (void)clearRoutePlanningArtworks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_routePlanningArtworks, "removeAllObjects");
}

- (void)addRoutePlanningArtwork:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSuggestedRoute _readRoutePlanningArtworks]((uint64_t)self);
  -[GEOTransitSuggestedRoute _addNoFlagsRoutePlanningArtwork:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsRoutePlanningArtwork:(uint64_t)a1
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

- (unint64_t)routePlanningArtworksCount
{
  -[GEOTransitSuggestedRoute _readRoutePlanningArtworks]((uint64_t)self);
  return -[NSMutableArray count](self->_routePlanningArtworks, "count");
}

- (id)routePlanningArtworkAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readRoutePlanningArtworks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routePlanningArtworks, "objectAtIndex:", a3);
}

+ (Class)routePlanningArtworkType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayStrings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayStrings_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasDisplayStrings
{
  -[GEOTransitSuggestedRoute _readDisplayStrings]((uint64_t)self);
  return self->_displayStrings != 0;
}

- (GEOTransitRouteDisplayStrings)displayStrings
{
  -[GEOTransitSuggestedRoute _readDisplayStrings]((uint64_t)self);
  return self->_displayStrings;
}

- (void)setDisplayStrings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  objc_storeStrong((id *)&self->_displayStrings, a3);
}

- (void)_readRouteBadges
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 156) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteBadges_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (unint64_t)routeBadgesCount
{
  -[GEOTransitSuggestedRoute _readRouteBadges]((uint64_t)self);
  return self->_routeBadges.count;
}

- (int)routeBadges
{
  -[GEOTransitSuggestedRoute _readRouteBadges]((uint64_t)self);
  return self->_routeBadges.list;
}

- (void)clearRouteBadges
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  PBRepeatedInt32Clear();
}

- (void)addRouteBadge:(int)a3
{
  -[GEOTransitSuggestedRoute _readRouteBadges]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (int)routeBadgeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_routeBadges;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitSuggestedRoute _readRouteBadges]((uint64_t)self);
  p_routeBadges = &self->_routeBadges;
  count = self->_routeBadges.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_routeBadges->list[a3];
}

- (void)setRouteBadges:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  PBRepeatedInt32Set();
}

- (id)routeBadgesAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C034E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRouteBadges:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_BADGE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_BADGE_FASTEST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_BADGE_FEWEST_TRANSFERS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_BADGE_LEAST_WALKING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_BADGE_LOWEST_FARE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSectionOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)sectionOptions
{
  -[GEOTransitSuggestedRoute _readSectionOptions]((uint64_t)self);
  return self->_sectionOptions;
}

- (void)setSectionOptions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *sectionOptions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  sectionOptions = self->_sectionOptions;
  self->_sectionOptions = v4;

}

- (void)clearSectionOptions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_sectionOptions, "removeAllObjects");
}

- (void)addSectionOption:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSuggestedRoute _readSectionOptions]((uint64_t)self);
  -[GEOTransitSuggestedRoute _addNoFlagsSectionOption:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsSectionOption:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)sectionOptionsCount
{
  -[GEOTransitSuggestedRoute _readSectionOptions]((uint64_t)self);
  return -[NSMutableArray count](self->_sectionOptions, "count");
}

- (id)sectionOptionAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readSectionOptions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_sectionOptions, "objectAtIndex:", a3);
}

+ (Class)sectionOptionType
{
  return (Class)objc_opt_class();
}

- (void)_readSections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (NSMutableArray)sections
{
  -[GEOTransitSuggestedRoute _readSections]((uint64_t)self);
  return self->_sections;
}

- (void)setSections:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *sections;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  sections = self->_sections;
  self->_sections = v4;

}

- (void)clearSections
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
}

- (void)addSection:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitSuggestedRoute _readSections]((uint64_t)self);
  -[GEOTransitSuggestedRoute _addNoFlagsSection:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x4000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x20000u;
}

- (void)_addNoFlagsSection:(uint64_t)a1
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

- (unint64_t)sectionsCount
{
  -[GEOTransitSuggestedRoute _readSections]((uint64_t)self);
  return -[NSMutableArray count](self->_sections, "count");
}

- (id)sectionAtIndex:(unint64_t)a3
{
  -[GEOTransitSuggestedRoute _readSections]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", a3);
}

+ (Class)sectionType
{
  return (Class)objc_opt_class();
}

- (unsigned)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_travelTimeAggressiveEstimate = a3;
}

- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131080;
  else
    v3 = 0x20000;
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTravelTimeAggressiveEstimate
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (void)setTravelTimeConservativeEstimate:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20010u;
  self->_travelTimeConservativeEstimate = a3;
}

- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131088;
  else
    v3 = 0x20000;
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasTravelTimeConservativeEstimate
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readEngineDebugData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_BYTE *)(a1 + 157) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitSuggestedRouteReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEngineDebugData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)hasEngineDebugData
{
  -[GEOTransitSuggestedRoute _readEngineDebugData]((uint64_t)self);
  return self->_engineDebugData != 0;
}

- (GEOTransitEngineDebugData)engineDebugData
{
  -[GEOTransitSuggestedRoute _readEngineDebugData]((uint64_t)self);
  return self->_engineDebugData;
}

- (void)setEngineDebugData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_engineDebugData, a3);
}

- (BOOL)supportsRouteUpdates
{
  return self->_supportsRouteUpdates;
}

- (void)setSupportsRouteUpdates:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  self->_supportsRouteUpdates = a3;
}

- (void)setHasSupportsRouteUpdates:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131104;
  else
    v3 = 0x20000;
  self->_flags = ($A76889D6E2F3CF6FA600569BC086DEAC)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasSupportsRouteUpdates
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitSuggestedRoute;
  -[GEOTransitSuggestedRoute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitSuggestedRoute dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSuggestedRoute _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;
  __CFString *v49;
  const __CFString *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  _QWORD v86[4];
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
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
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0x1ECDA9000uLL;
  v6 = *(_DWORD *)(a1 + 156);
  v7 = 0x1E0CB3000uLL;
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("absStartTime");
    else
      v9 = CFSTR("abs_start_time");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v6 = *(_DWORD *)(a1 + 156);
  }
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 132));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("absEndTime");
    else
      v11 = CFSTR("abs_end_time");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v13 = *(id *)(a1 + 104);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v101 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("steps"));
    v5 = 0x1ECDA9000uLL;
  }
  objc_msgSend((id)a1, "routeHandle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("routeHandle"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("route_handle"));
    }
  }

  if ((*(_BYTE *)(a1 + 156) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("rank"));

  }
  objc_msgSend((id)a1, "transitIncidentMessage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("transitIncidentMessage");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("transit_incident_message");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  objc_msgSend((id)a1, "advisoriesInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("advisoriesInfo");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("advisories_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v33 = *(id *)(a1 + 80);
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v97;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v97 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v38, "jsonRepresentation");
          else
            objc_msgSend(v38, "dictionaryRepresentation");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v39);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
      }
      while (v35);
    }

    if (a2)
      v40 = CFSTR("routePlanningArtwork");
    else
      v40 = CFSTR("route_planning_artwork");
    objc_msgSend(v4, "setObject:forKey:", v32, v40);

    v5 = 0x1ECDA9000;
  }
  objc_msgSend((id)a1, "displayStrings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("displayStrings");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("display_strings");
    }
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v47 = 0;
      do
      {
        v48 = *(int *)(*v46 + 4 * v47);
        if (v48 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v48);
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v49 = off_1E1C034E8[v48];
        }
        objc_msgSend(v45, "addObject:", v49);

        ++v47;
        v46 = (_QWORD *)(a1 + 24);
      }
      while (v47 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v50 = CFSTR("routeBadge");
    else
      v50 = CFSTR("route_badge");
    objc_msgSend(v4, "setObject:forKey:", v45, v50);

    v7 = 0x1E0CB3000;
    v5 = 0x1ECDA9000uLL;
  }
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v52 = *(id *)(a1 + 88);
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v93;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v93 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v57, "jsonRepresentation");
          else
            objc_msgSend(v57, "dictionaryRepresentation");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v58);

        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
      }
      while (v54);
    }

    if (a2)
      v59 = CFSTR("sectionOption");
    else
      v59 = CFSTR("section_option");
    objc_msgSend(v4, "setObject:forKey:", v51, v59);

    v7 = 0x1E0CB3000;
  }
  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v61 = *(id *)(a1 + 96);
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v89;
      do
      {
        for (m = 0; m != v63; ++m)
        {
          if (*(_QWORD *)v89 != v64)
            objc_enumerationMutation(v61);
          v66 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v66, "jsonRepresentation");
          else
            objc_msgSend(v66, "dictionaryRepresentation");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v67);

        }
        v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
      }
      while (v63);
    }

    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("section"));
    v7 = 0x1E0CB3000uLL;
  }
  v68 = *(_DWORD *)(a1 + *(int *)(v5 + 3908));
  if ((v68 & 8) != 0)
  {
    objc_msgSend(*(id *)(v7 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 144));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v70 = CFSTR("travelTimeAggressiveEstimate");
    else
      v70 = CFSTR("travel_time_aggressive_estimate");
    objc_msgSend(v4, "setObject:forKey:", v69, v70);

    v68 = *(_DWORD *)(a1 + 156);
  }
  if ((v68 & 0x10) != 0)
  {
    objc_msgSend(*(id *)(v7 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v72 = CFSTR("travelTimeConservativeEstimate");
    else
      v72 = CFSTR("travel_time_conservative_estimate");
    objc_msgSend(v4, "setObject:forKey:", v71, v72);

  }
  objc_msgSend((id)a1, "engineDebugData");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (v73)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v73, "jsonRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("engineDebugData");
    }
    else
    {
      objc_msgSend(v73, "dictionaryRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("engine_debug_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v75, v76);

  }
  if ((*(_BYTE *)(a1 + *(int *)(v5 + 3908)) & 0x20) != 0)
  {
    objc_msgSend(*(id *)(v7 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 152));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v78 = CFSTR("supportsRouteUpdates");
    else
      v78 = CFSTR("supports_route_updates");
    objc_msgSend(v4, "setObject:forKey:", v77, v78);

  }
  v79 = *(void **)(a1 + 16);
  if (v79)
  {
    objc_msgSend(v79, "dictionaryRepresentation");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v80;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v80, "count"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __54__GEOTransitSuggestedRoute__dictionaryRepresentation___block_invoke;
      v86[3] = &unk_1E1C00600;
      v83 = v82;
      v87 = v83;
      objc_msgSend(v81, "enumerateKeysAndObjectsUsingBlock:", v86);
      v84 = v83;

      v81 = v84;
    }
    objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitSuggestedRoute _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEOTransitSuggestedRoute__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitSuggestedRoute)initWithDictionary:(id)a3
{
  return (GEOTransitSuggestedRoute *)-[GEOTransitSuggestedRoute _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOTransitStep *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOPBTransitRoutingIncidentMessage *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  GEOAdvisoriesInfo *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  GEOTransitSegmentArtworkSet *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  GEOTransitRouteDisplayStrings *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  id v58;
  uint64_t v59;
  const __CFString *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t m;
  uint64_t v67;
  GEOTransitSectionOption *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t n;
  uint64_t v77;
  GEOTransitSection *v78;
  uint64_t v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  GEOTransitEngineDebugData *v87;
  uint64_t v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  void *v93;
  id v94;
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
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("absStartTime");
      else
        v7 = CFSTR("abs_start_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setAbsStartTime:", objc_msgSend(v8, "unsignedIntValue"));

      if (a3)
        v9 = CFSTR("absEndTime");
      else
        v9 = CFSTR("abs_end_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setAbsEndTime:", objc_msgSend(v10, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("steps"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v94 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v113 = 0u;
        v114 = 0u;
        v111 = 0u;
        v112 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v112;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v112 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = [GEOTransitStep alloc];
                if ((a3 & 1) != 0)
                  v19 = -[GEOTransitStep initWithJSON:](v18, "initWithJSON:", v17);
                else
                  v19 = -[GEOTransitStep initWithDictionary:](v18, "initWithDictionary:", v17);
                v20 = (void *)v19;
                objc_msgSend(v6, "addSteps:", v19);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v111, v119, 16);
          }
          while (v14);
        }

        v5 = v94;
      }

      if (a3)
        v21 = CFSTR("routeHandle");
      else
        v21 = CFSTR("route_handle");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v22, 0);
        objc_msgSend(v6, "setRouteHandle:", v23);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rank"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setRank:", objc_msgSend(v24, "unsignedIntValue"));

      if (a3)
        v25 = CFSTR("transitIncidentMessage");
      else
        v25 = CFSTR("transit_incident_message");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEOPBTransitRoutingIncidentMessage alloc];
        if (v27)
          v28 = (void *)-[GEOPBTransitRoutingIncidentMessage _initWithDictionary:isJSON:]((uint64_t)v27, v26, a3);
        else
          v28 = 0;
        objc_msgSend(v6, "setTransitIncidentMessage:", v28);

      }
      if (a3)
        v29 = CFSTR("advisoriesInfo");
      else
        v29 = CFSTR("advisories_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = [GEOAdvisoriesInfo alloc];
        if ((a3 & 1) != 0)
          v32 = -[GEOAdvisoriesInfo initWithJSON:](v31, "initWithJSON:", v30);
        else
          v32 = -[GEOAdvisoriesInfo initWithDictionary:](v31, "initWithDictionary:", v30);
        v33 = (void *)v32;
        objc_msgSend(v6, "setAdvisoriesInfo:", v32);

      }
      if (a3)
        v34 = CFSTR("routePlanningArtwork");
      else
        v34 = CFSTR("route_planning_artwork");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v36 = v35;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v108;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v108 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = [GEOTransitSegmentArtworkSet alloc];
                if ((a3 & 1) != 0)
                  v43 = -[GEOTransitSegmentArtworkSet initWithJSON:](v42, "initWithJSON:", v41);
                else
                  v43 = -[GEOTransitSegmentArtworkSet initWithDictionary:](v42, "initWithDictionary:", v41);
                v44 = (void *)v43;
                objc_msgSend(v6, "addRoutePlanningArtwork:", v43);

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v107, v118, 16);
          }
          while (v38);
        }

        v5 = v94;
      }

      if (a3)
        v45 = CFSTR("displayStrings");
      else
        v45 = CFSTR("display_strings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = [GEOTransitRouteDisplayStrings alloc];
        if ((a3 & 1) != 0)
          v48 = -[GEOTransitRouteDisplayStrings initWithJSON:](v47, "initWithJSON:", v46);
        else
          v48 = -[GEOTransitRouteDisplayStrings initWithDictionary:](v47, "initWithDictionary:", v46);
        v49 = (void *)v48;
        objc_msgSend(v6, "setDisplayStrings:", v48);

      }
      if (a3)
        v50 = CFSTR("routeBadge");
      else
        v50 = CFSTR("route_badge");
      objc_msgSend(v5, "objectForKeyedSubscript:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v93 = v51;
        v52 = v51;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
        if (!v53)
          goto LABEL_101;
        v54 = v53;
        v55 = *(_QWORD *)v104;
        while (1)
        {
          for (k = 0; k != v54; ++k)
          {
            if (*(_QWORD *)v104 != v55)
              objc_enumerationMutation(v52);
            v57 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v58 = v57;
              if ((objc_msgSend(v58, "isEqualToString:", CFSTR("ROUTE_BADGE_UNKNOWN")) & 1) != 0)
              {
                v59 = 0;
              }
              else if ((objc_msgSend(v58, "isEqualToString:", CFSTR("ROUTE_BADGE_FASTEST")) & 1) != 0)
              {
                v59 = 1;
              }
              else if ((objc_msgSend(v58, "isEqualToString:", CFSTR("ROUTE_BADGE_FEWEST_TRANSFERS")) & 1) != 0)
              {
                v59 = 2;
              }
              else if ((objc_msgSend(v58, "isEqualToString:", CFSTR("ROUTE_BADGE_LEAST_WALKING")) & 1) != 0)
              {
                v59 = 3;
              }
              else if (objc_msgSend(v58, "isEqualToString:", CFSTR("ROUTE_BADGE_LOWEST_FARE")))
              {
                v59 = 4;
              }
              else
              {
                v59 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v59 = objc_msgSend(v57, "intValue");
            }
            objc_msgSend(v6, "addRouteBadge:", v59, v93);
          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
          if (!v54)
          {
LABEL_101:

            v51 = v93;
            v5 = v94;
            break;
          }
        }
      }

      if (a3)
        v60 = CFSTR("sectionOption");
      else
        v60 = CFSTR("section_option");
      objc_msgSend(v5, "objectForKeyedSubscript:", v60, v93);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v62 = v61;
        v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v100;
          do
          {
            for (m = 0; m != v64; ++m)
            {
              if (*(_QWORD *)v100 != v65)
                objc_enumerationMutation(v62);
              v67 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * m);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v68 = [GEOTransitSectionOption alloc];
                if ((a3 & 1) != 0)
                  v69 = -[GEOTransitSectionOption initWithJSON:](v68, "initWithJSON:", v67);
                else
                  v69 = -[GEOTransitSectionOption initWithDictionary:](v68, "initWithDictionary:", v67);
                v70 = (void *)v69;
                objc_msgSend(v6, "addSectionOption:", v69);

              }
            }
            v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
          }
          while (v64);
        }

        v5 = v94;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("section"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        v72 = v71;
        v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
        if (v73)
        {
          v74 = v73;
          v75 = *(_QWORD *)v96;
          do
          {
            for (n = 0; n != v74; ++n)
            {
              if (*(_QWORD *)v96 != v75)
                objc_enumerationMutation(v72);
              v77 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * n);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v78 = [GEOTransitSection alloc];
                if ((a3 & 1) != 0)
                  v79 = -[GEOTransitSection initWithJSON:](v78, "initWithJSON:", v77);
                else
                  v79 = -[GEOTransitSection initWithDictionary:](v78, "initWithDictionary:", v77);
                v80 = (void *)v79;
                objc_msgSend(v6, "addSection:", v79);

              }
            }
            v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v95, v115, 16);
          }
          while (v74);
        }

        v5 = v94;
      }

      if (a3)
        v81 = CFSTR("travelTimeAggressiveEstimate");
      else
        v81 = CFSTR("travel_time_aggressive_estimate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setTravelTimeAggressiveEstimate:", objc_msgSend(v82, "unsignedIntValue"));

      if (a3)
        v83 = CFSTR("travelTimeConservativeEstimate");
      else
        v83 = CFSTR("travel_time_conservative_estimate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setTravelTimeConservativeEstimate:", objc_msgSend(v84, "unsignedIntValue"));

      if (a3)
        v85 = CFSTR("engineDebugData");
      else
        v85 = CFSTR("engine_debug_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v87 = [GEOTransitEngineDebugData alloc];
        if ((a3 & 1) != 0)
          v88 = -[GEOTransitEngineDebugData initWithJSON:](v87, "initWithJSON:", v86);
        else
          v88 = -[GEOTransitEngineDebugData initWithDictionary:](v87, "initWithDictionary:", v86);
        v89 = (void *)v88;
        objc_msgSend(v6, "setEngineDebugData:", v88);

      }
      if (a3)
        v90 = CFSTR("supportsRouteUpdates");
      else
        v90 = CFSTR("supports_route_updates");
      objc_msgSend(v5, "objectForKeyedSubscript:", v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "setSupportsRouteUpdates:", objc_msgSend(v91, "BOOLValue"));

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOTransitSuggestedRoute)initWithJSON:(id)a3
{
  return (GEOTransitSuggestedRoute *)-[GEOTransitSuggestedRoute _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1667;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1668;
    GEOTransitSuggestedRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitSuggestedRouteCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSuggestedRouteIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSuggestedRouteReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $A76889D6E2F3CF6FA600569BC086DEAC flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  $A76889D6E2F3CF6FA600569BC086DEAC v24;
  PBDataReader *v25;
  void *v26;
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

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitSuggestedRouteIsDirty((uint64_t)self) & 1) == 0)
  {
    v25 = self->_reader;
    objc_sync_enter(v25);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v26);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v25);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitSuggestedRoute readAll:](self, "readAll:", 0);
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_steps;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v40;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v40 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v8);
    }

    if (self->_routeHandle)
      PBDataWriterWriteDataField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_transitIncidentMessage)
      PBDataWriterWriteSubmessage();
    if (self->_advisoriesInfo)
      PBDataWriterWriteSubmessage();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = self->_routePlanningArtworks;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v12);
    }

    if (self->_displayStrings)
      PBDataWriterWriteSubmessage();
    if (self->_routeBadges.count)
    {
      v15 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v15;
      }
      while (v15 < self->_routeBadges.count);
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = self->_sectionOptions;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v32;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v16);
          PBDataWriterWriteSubmessage();
          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v17);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v20 = self->_sections;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v20);
          PBDataWriterWriteSubmessage();
          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v21);
    }

    v24 = self->_flags;
    if ((*(_BYTE *)&v24 & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      v24 = self->_flags;
    }
    if ((*(_BYTE *)&v24 & 0x10) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_engineDebugData)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v27);
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
  -[GEOTransitSuggestedRoute _readAdvisoriesInfo]((uint64_t)self);
  if (-[GEOAdvisoriesInfo hasGreenTeaWithValue:](self->_advisoriesInfo, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOTransitSuggestedRoute _readSteps]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_steps;
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
  $A76889D6E2F3CF6FA600569BC086DEAC flags;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t n;
  void *v23;
  $A76889D6E2F3CF6FA600569BC086DEAC v24;
  id *v25;
  id *v26;

  v26 = (id *)a3;
  -[GEOTransitSuggestedRoute readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v26 + 1, self->_reader);
  *((_DWORD *)v26 + 30) = self->_readerMarkPos;
  *((_DWORD *)v26 + 31) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *((_DWORD *)v26 + 34) = self->_absStartTime;
    *((_DWORD *)v26 + 39) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *((_DWORD *)v26 + 33) = self->_absEndTime;
    *((_DWORD *)v26 + 39) |= 1u;
  }
  if (-[GEOTransitSuggestedRoute stepsCount](self, "stepsCount"))
  {
    objc_msgSend(v26, "clearSteps");
    v5 = -[GEOTransitSuggestedRoute stepsCount](self, "stepsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOTransitSuggestedRoute stepsAtIndex:](self, "stepsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSteps:", v8);

      }
    }
  }
  if (self->_routeHandle)
    objc_msgSend(v26, "setRouteHandle:");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v26 + 35) = self->_rank;
    *((_DWORD *)v26 + 39) |= 4u;
  }
  if (self->_transitIncidentMessage)
    objc_msgSend(v26, "setTransitIncidentMessage:");
  if (self->_advisoriesInfo)
    objc_msgSend(v26, "setAdvisoriesInfo:");
  if (-[GEOTransitSuggestedRoute routePlanningArtworksCount](self, "routePlanningArtworksCount"))
  {
    objc_msgSend(v26, "clearRoutePlanningArtworks");
    v9 = -[GEOTransitSuggestedRoute routePlanningArtworksCount](self, "routePlanningArtworksCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOTransitSuggestedRoute routePlanningArtworkAtIndex:](self, "routePlanningArtworkAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addRoutePlanningArtwork:", v12);

      }
    }
  }
  if (self->_displayStrings)
    objc_msgSend(v26, "setDisplayStrings:");
  if (-[GEOTransitSuggestedRoute routeBadgesCount](self, "routeBadgesCount"))
  {
    objc_msgSend(v26, "clearRouteBadges");
    v13 = -[GEOTransitSuggestedRoute routeBadgesCount](self, "routeBadgesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(v26, "addRouteBadge:", -[GEOTransitSuggestedRoute routeBadgeAtIndex:](self, "routeBadgeAtIndex:", k));
    }
  }
  if (-[GEOTransitSuggestedRoute sectionOptionsCount](self, "sectionOptionsCount"))
  {
    objc_msgSend(v26, "clearSectionOptions");
    v16 = -[GEOTransitSuggestedRoute sectionOptionsCount](self, "sectionOptionsCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOTransitSuggestedRoute sectionOptionAtIndex:](self, "sectionOptionAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSectionOption:", v19);

      }
    }
  }
  if (-[GEOTransitSuggestedRoute sectionsCount](self, "sectionsCount"))
  {
    objc_msgSend(v26, "clearSections");
    v20 = -[GEOTransitSuggestedRoute sectionsCount](self, "sectionsCount");
    if (v20)
    {
      v21 = v20;
      for (n = 0; n != v21; ++n)
      {
        -[GEOTransitSuggestedRoute sectionAtIndex:](self, "sectionAtIndex:", n);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSection:", v23);

      }
    }
  }
  v24 = self->_flags;
  v25 = v26;
  if ((*(_BYTE *)&v24 & 8) != 0)
  {
    *((_DWORD *)v26 + 36) = self->_travelTimeAggressiveEstimate;
    *((_DWORD *)v26 + 39) |= 8u;
    v24 = self->_flags;
  }
  if ((*(_BYTE *)&v24 & 0x10) != 0)
  {
    *((_DWORD *)v26 + 37) = self->_travelTimeConservativeEstimate;
    *((_DWORD *)v26 + 39) |= 0x10u;
  }
  if (self->_engineDebugData)
  {
    objc_msgSend(v26, "setEngineDebugData:");
    v25 = v26;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *((_BYTE *)v25 + 152) = self->_supportsRouteUpdates;
    *((_DWORD *)v25 + 39) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $A76889D6E2F3CF6FA600569BC086DEAC flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  void *v37;
  $A76889D6E2F3CF6FA600569BC086DEAC v38;
  id v39;
  void *v40;
  PBUnknownFields *v41;
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
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitSuggestedRouteReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_46;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitSuggestedRoute readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_absStartTime;
    *(_DWORD *)(v5 + 156) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_absEndTime;
    *(_DWORD *)(v5 + 156) |= 1u;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v10 = self->_steps;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v56 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSteps:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v11);
  }

  v15 = -[NSData copyWithZone:](self->_routeHandle, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v15;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_rank;
    *(_DWORD *)(v5 + 156) |= 4u;
  }
  v17 = -[GEOPBTransitRoutingIncidentMessage copyWithZone:](self->_transitIncidentMessage, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v17;

  v19 = -[GEOAdvisoriesInfo copyWithZone:](self->_advisoriesInfo, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v21 = self->_routePlanningArtworks;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRoutePlanningArtwork:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v22);
  }

  v26 = -[GEOTransitRouteDisplayStrings copyWithZone:](self->_displayStrings, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v26;

  PBRepeatedInt32Copy();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v28 = self->_sectionOptions;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v48 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSectionOption:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v29);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v33 = self->_sections;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v34; ++m)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(v33);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v43);
        objc_msgSend((id)v5, "addSection:", v37);

      }
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    }
    while (v34);
  }

  v38 = self->_flags;
  if ((*(_BYTE *)&v38 & 8) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_travelTimeAggressiveEstimate;
    *(_DWORD *)(v5 + 156) |= 8u;
    v38 = self->_flags;
  }
  if ((*(_BYTE *)&v38 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_travelTimeConservativeEstimate;
    *(_DWORD *)(v5 + 156) |= 0x10u;
  }
  v39 = -[GEOTransitEngineDebugData copyWithZone:](self->_engineDebugData, "copyWithZone:", a3, (_QWORD)v43);
  v40 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v39;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 152) = self->_supportsRouteUpdates;
    *(_DWORD *)(v5 + 156) |= 0x20u;
  }
  v41 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v41;
LABEL_46:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $A76889D6E2F3CF6FA600569BC086DEAC flags;
  int v6;
  NSMutableArray *steps;
  NSData *routeHandle;
  int v9;
  GEOPBTransitRoutingIncidentMessage *transitIncidentMessage;
  GEOAdvisoriesInfo *advisoriesInfo;
  NSMutableArray *routePlanningArtworks;
  GEOTransitRouteDisplayStrings *displayStrings;
  NSMutableArray *sectionOptions;
  NSMutableArray *sections;
  $A76889D6E2F3CF6FA600569BC086DEAC v16;
  int v17;
  GEOTransitEngineDebugData *engineDebugData;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  -[GEOTransitSuggestedRoute readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_absStartTime != *((_DWORD *)v4 + 34))
      goto LABEL_50;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_absEndTime != *((_DWORD *)v4 + 33))
      goto LABEL_50;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_50;
  }
  steps = self->_steps;
  if ((unint64_t)steps | *((_QWORD *)v4 + 13) && !-[NSMutableArray isEqual:](steps, "isEqual:"))
    goto LABEL_50;
  routeHandle = self->_routeHandle;
  if ((unint64_t)routeHandle | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](routeHandle, "isEqual:"))
      goto LABEL_50;
  }
  v9 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_rank != *((_DWORD *)v4 + 35))
      goto LABEL_50;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_50;
  }
  transitIncidentMessage = self->_transitIncidentMessage;
  if ((unint64_t)transitIncidentMessage | *((_QWORD *)v4 + 14)
    && !-[GEOPBTransitRoutingIncidentMessage isEqual:](transitIncidentMessage, "isEqual:"))
  {
    goto LABEL_50;
  }
  advisoriesInfo = self->_advisoriesInfo;
  if ((unint64_t)advisoriesInfo | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOAdvisoriesInfo isEqual:](advisoriesInfo, "isEqual:"))
      goto LABEL_50;
  }
  routePlanningArtworks = self->_routePlanningArtworks;
  if ((unint64_t)routePlanningArtworks | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](routePlanningArtworks, "isEqual:"))
      goto LABEL_50;
  }
  displayStrings = self->_displayStrings;
  if ((unint64_t)displayStrings | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOTransitRouteDisplayStrings isEqual:](displayStrings, "isEqual:"))
      goto LABEL_50;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_50;
  sectionOptions = self->_sectionOptions;
  if ((unint64_t)sectionOptions | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](sectionOptions, "isEqual:"))
      goto LABEL_50;
  }
  sections = self->_sections;
  if ((unint64_t)sections | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](sections, "isEqual:"))
      goto LABEL_50;
  }
  v16 = self->_flags;
  v17 = *((_DWORD *)v4 + 39);
  if ((*(_BYTE *)&v16 & 8) != 0)
  {
    if ((v17 & 8) == 0 || self->_travelTimeAggressiveEstimate != *((_DWORD *)v4 + 36))
      goto LABEL_50;
  }
  else if ((v17 & 8) != 0)
  {
    goto LABEL_50;
  }
  if ((*(_BYTE *)&v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_travelTimeConservativeEstimate != *((_DWORD *)v4 + 37))
      goto LABEL_50;
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_50;
  }
  engineDebugData = self->_engineDebugData;
  if ((unint64_t)engineDebugData | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOTransitEngineDebugData isEqual:](engineDebugData, "isEqual:"))
      goto LABEL_50;
    v16 = self->_flags;
    v17 = *((_DWORD *)v4 + 39);
  }
  if ((*(_BYTE *)&v16 & 0x20) != 0)
  {
    if ((v17 & 0x20) != 0)
    {
      if (self->_supportsRouteUpdates)
      {
        if (!*((_BYTE *)v4 + 152))
          goto LABEL_50;
      }
      else if (*((_BYTE *)v4 + 152))
      {
        goto LABEL_50;
      }
      v19 = 1;
      goto LABEL_51;
    }
LABEL_50:
    v19 = 0;
    goto LABEL_51;
  }
  v19 = (v17 & 0x20) == 0;
LABEL_51:

  return v19;
}

- (unint64_t)hash
{
  $A76889D6E2F3CF6FA600569BC086DEAC flags;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  $A76889D6E2F3CF6FA600569BC086DEAC v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  -[GEOTransitSuggestedRoute readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v21 = 2654435761 * self->_absStartTime;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_absEndTime;
      goto LABEL_6;
    }
  }
  v20 = 0;
LABEL_6:
  v19 = -[NSMutableArray hash](self->_steps, "hash");
  v18 = -[NSData hash](self->_routeHandle, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v17 = 2654435761 * self->_rank;
  else
    v17 = 0;
  v16 = -[GEOPBTransitRoutingIncidentMessage hash](self->_transitIncidentMessage, "hash");
  v15 = -[GEOAdvisoriesInfo hash](self->_advisoriesInfo, "hash");
  v4 = -[NSMutableArray hash](self->_routePlanningArtworks, "hash");
  v5 = -[GEOTransitRouteDisplayStrings hash](self->_displayStrings, "hash");
  v6 = PBRepeatedInt32Hash();
  v7 = -[NSMutableArray hash](self->_sectionOptions, "hash");
  v8 = -[NSMutableArray hash](self->_sections, "hash");
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 8) != 0)
  {
    v10 = 2654435761 * self->_travelTimeAggressiveEstimate;
    if ((*(_BYTE *)&v9 & 0x10) != 0)
      goto LABEL_11;
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&v9 & 0x10) != 0)
    {
LABEL_11:
      v11 = 2654435761 * self->_travelTimeConservativeEstimate;
      goto LABEL_14;
    }
  }
  v11 = 0;
LABEL_14:
  v12 = -[GEOTransitEngineDebugData hash](self->_engineDebugData, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v13 = 2654435761 * self->_supportsRouteUpdates;
  else
    v13 = 0;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  GEOPBTransitRoutingIncidentMessage *transitIncidentMessage;
  void *v12;
  GEOAdvisoriesInfo *advisoriesInfo;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  GEOTransitRouteDisplayStrings *displayStrings;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
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
  int v35;
  GEOTransitEngineDebugData *engineDebugData;
  uint64_t v37;
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
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_DWORD *)v4 + 39);
  if ((v5 & 2) != 0)
  {
    self->_absStartTime = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_flags |= 2u;
    v5 = *((_DWORD *)v4 + 39);
  }
  if ((v5 & 1) != 0)
  {
    self->_absEndTime = *((_DWORD *)v4 + 33);
    *(_DWORD *)&self->_flags |= 1u;
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = *((id *)v4 + 13);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v6);
        -[GEOTransitSuggestedRoute addSteps:](self, "addSteps:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v4 + 9))
    -[GEOTransitSuggestedRoute setRouteHandle:](self, "setRouteHandle:");
  if ((*((_BYTE *)v4 + 156) & 4) != 0)
  {
    self->_rank = *((_DWORD *)v4 + 35);
    *(_DWORD *)&self->_flags |= 4u;
  }
  transitIncidentMessage = self->_transitIncidentMessage;
  v12 = (void *)*((_QWORD *)v4 + 14);
  if (transitIncidentMessage)
  {
    if (v12)
      -[GEOPBTransitRoutingIncidentMessage mergeFrom:]((uint64_t)transitIncidentMessage, v12);
  }
  else if (v12)
  {
    -[GEOTransitSuggestedRoute setTransitIncidentMessage:](self, "setTransitIncidentMessage:", *((_QWORD *)v4 + 14));
  }
  advisoriesInfo = self->_advisoriesInfo;
  v14 = *((_QWORD *)v4 + 6);
  if (advisoriesInfo)
  {
    if (v14)
      -[GEOAdvisoriesInfo mergeFrom:](advisoriesInfo, "mergeFrom:");
  }
  else if (v14)
  {
    -[GEOTransitSuggestedRoute setAdvisoriesInfo:](self, "setAdvisoriesInfo:");
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v15 = *((id *)v4 + 10);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v47 != v18)
          objc_enumerationMutation(v15);
        -[GEOTransitSuggestedRoute addRoutePlanningArtwork:](self, "addRoutePlanningArtwork:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v17);
  }

  displayStrings = self->_displayStrings;
  v21 = *((_QWORD *)v4 + 7);
  if (displayStrings)
  {
    if (v21)
      -[GEOTransitRouteDisplayStrings mergeFrom:](displayStrings, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOTransitSuggestedRoute setDisplayStrings:](self, "setDisplayStrings:");
  }
  v22 = objc_msgSend(v4, "routeBadgesCount");
  if (v22)
  {
    v23 = v22;
    for (k = 0; k != v23; ++k)
      -[GEOTransitSuggestedRoute addRouteBadge:](self, "addRouteBadge:", objc_msgSend(v4, "routeBadgeAtIndex:", k));
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = *((id *)v4 + 11);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    do
    {
      for (m = 0; m != v27; ++m)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v25);
        -[GEOTransitSuggestedRoute addSectionOption:](self, "addSectionOption:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * m));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v27);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = *((id *)v4 + 12);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v39;
    do
    {
      for (n = 0; n != v32; ++n)
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(v30);
        -[GEOTransitSuggestedRoute addSection:](self, "addSection:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * n), (_QWORD)v38);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    }
    while (v32);
  }

  v35 = *((_DWORD *)v4 + 39);
  if ((v35 & 8) != 0)
  {
    self->_travelTimeAggressiveEstimate = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_flags |= 8u;
    v35 = *((_DWORD *)v4 + 39);
  }
  if ((v35 & 0x10) != 0)
  {
    self->_travelTimeConservativeEstimate = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  engineDebugData = self->_engineDebugData;
  v37 = *((_QWORD *)v4 + 8);
  if (engineDebugData)
  {
    if (v37)
      -[GEOTransitEngineDebugData mergeFrom:](engineDebugData, "mergeFrom:");
  }
  else if (v37)
  {
    -[GEOTransitSuggestedRoute setEngineDebugData:](self, "setEngineDebugData:");
  }
  if ((*((_BYTE *)v4 + 156) & 0x20) != 0)
  {
    self->_supportsRouteUpdates = *((_BYTE *)v4 + 152);
    *(_DWORD *)&self->_flags |= 0x20u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitSuggestedRouteReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1671);
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
  *(_DWORD *)&self->_flags |= 0x20040u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitSuggestedRoute readAll:](self, "readAll:", 0);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_steps;
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

    -[GEOPBTransitRoutingIncidentMessage clearUnknownFields:]((uint64_t)self->_transitIncidentMessage, 1);
    -[GEOAdvisoriesInfo clearUnknownFields:](self->_advisoriesInfo, "clearUnknownFields:", 1);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = self->_routePlanningArtworks;
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

    -[GEOTransitRouteDisplayStrings clearUnknownFields:](self->_displayStrings, "clearUnknownFields:", 1);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_sectionOptions;
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
    v22 = self->_sections;
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

    -[GEOTransitEngineDebugData clearUnknownFields:](self->_engineDebugData, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidentMessage, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sectionOptions, 0);
  objc_storeStrong((id *)&self->_routePlanningArtworks, 0);
  objc_storeStrong((id *)&self->_routeHandle, 0);
  objc_storeStrong((id *)&self->_engineDebugData, 0);
  objc_storeStrong((id *)&self->_displayStrings, 0);
  objc_storeStrong((id *)&self->_advisoriesInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)instanceCompatibleWithProtocolVersion:(unint64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  GEOTransitSuggestedRoute *v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 3;
  GEOFindOrCreateLog("com.apple.GeoServices", "CompanionCompatibility");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v7)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v12;
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = a3;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is not compatible with protocol version %lu", (uint8_t *)&v23, 0x20u);

    }
    v13 = (void *)-[GEOTransitSuggestedRoute copy](self, "copy");
    objc_msgSend(v13, "displayStrings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "planningDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    migrateFormattedString(v15, a3);

    objc_msgSend(v13, "displayStrings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "duration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    migrateFormattedString(v17, a3);

    objc_msgSend(v13, "displayStrings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "travelDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    migrateFormattedString(v19, a3);

    objc_msgSend(v13, "displayStrings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "badge");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    migrateFormattedString(v21, a3);

    objc_msgSend(v13, "steps");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    migrateTransitSteps(v22, a3);

    return v13;
  }
  else
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v9;
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = a3;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "%@<%p> is compatible with protocol version %lu", (uint8_t *)&v23, 0x20u);

    }
    return self;
  }
}

- (BOOL)isWalkingOnlyRoute
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[GEOTransitSuggestedRoute steps](self, "steps", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "segmentTypeForManeuver") == 6)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (id)nextOptionForOption:(id)a3 withRideIndex:(unint64_t)a4
{
  id v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (objc_msgSend(v6, "sectionsCount") <= a4)
    v7 = objc_msgSend(v6, "defaultSectionIndex");
  else
    v7 = objc_msgSend(v6, "sectionAtIndex:", a4);
  v8 = v7;

  if (-[GEOTransitSuggestedRoute sectionsCount](self, "sectionsCount") <= v8)
  {
    v9 = 0;
  }
  else
  {
    -[GEOTransitSuggestedRoute sectionAtIndex:](self, "sectionAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "hasNextOptionsIndex"))
  {
    -[GEOTransitSuggestedRoute sectionOptionAtIndex:](self, "sectionOptionAtIndex:", (int)objc_msgSend(v9, "nextOptionsIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
