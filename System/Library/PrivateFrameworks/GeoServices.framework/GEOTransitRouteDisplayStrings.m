@implementation GEOTransitRouteDisplayStrings

- (GEOTransitRouteDisplayStrings)init
{
  GEOTransitRouteDisplayStrings *v2;
  GEOTransitRouteDisplayStrings *v3;
  GEOTransitRouteDisplayStrings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteDisplayStrings;
  v2 = -[GEOTransitRouteDisplayStrings init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteDisplayStrings)initWithData:(id)a3
{
  GEOTransitRouteDisplayStrings *v3;
  GEOTransitRouteDisplayStrings *v4;
  GEOTransitRouteDisplayStrings *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteDisplayStrings;
  v3 = -[GEOTransitRouteDisplayStrings initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlanningDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlanningDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasPlanningDescription
{
  -[GEOTransitRouteDisplayStrings _readPlanningDescription]((uint64_t)self);
  return self->_planningDescription != 0;
}

- (GEOFormattedString)planningDescription
{
  -[GEOTransitRouteDisplayStrings _readPlanningDescription]((uint64_t)self);
  return self->_planningDescription;
}

- (void)setPlanningDescription:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_planningDescription, a3);
}

- (void)_readDuration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDuration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDuration
{
  -[GEOTransitRouteDisplayStrings _readDuration]((uint64_t)self);
  return self->_duration != 0;
}

- (GEOFormattedString)duration
{
  -[GEOTransitRouteDisplayStrings _readDuration]((uint64_t)self);
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_duration, a3);
}

- (void)_readDurationList
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDurationList_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDurationList
{
  -[GEOTransitRouteDisplayStrings _readDurationList]((uint64_t)self);
  return self->_durationList != 0;
}

- (GEOFormattedString)durationList
{
  -[GEOTransitRouteDisplayStrings _readDurationList]((uint64_t)self);
  return self->_durationList;
}

- (void)setDurationList:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_durationList, a3);
}

- (void)_readTravelDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTravelDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTravelDescription
{
  -[GEOTransitRouteDisplayStrings _readTravelDescription]((uint64_t)self);
  return self->_travelDescription != 0;
}

- (GEOFormattedString)travelDescription
{
  -[GEOTransitRouteDisplayStrings _readTravelDescription]((uint64_t)self);
  return self->_travelDescription;
}

- (void)setTravelDescription:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_travelDescription, a3);
}

- (void)_readAdvisorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdvisorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (NSMutableArray)advisorys
{
  -[GEOTransitRouteDisplayStrings _readAdvisorys]((uint64_t)self);
  return self->_advisorys;
}

- (void)setAdvisorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *advisorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  advisorys = self->_advisorys;
  self->_advisorys = v4;

}

- (void)clearAdvisorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_advisorys, "removeAllObjects");
}

- (void)addAdvisory:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitRouteDisplayStrings _readAdvisorys]((uint64_t)self);
  -[GEOTransitRouteDisplayStrings _addNoFlagsAdvisory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsAdvisory:(uint64_t)a1
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

- (unint64_t)advisorysCount
{
  -[GEOTransitRouteDisplayStrings _readAdvisorys]((uint64_t)self);
  return -[NSMutableArray count](self->_advisorys, "count");
}

- (id)advisoryAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteDisplayStrings _readAdvisorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_advisorys, "objectAtIndex:", a3);
}

+ (Class)advisoryType
{
  return (Class)objc_opt_class();
}

- (void)_readBadge
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteDisplayStringsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBadge_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasBadge
{
  -[GEOTransitRouteDisplayStrings _readBadge]((uint64_t)self);
  return self->_badge != 0;
}

- (GEOFormattedString)badge
{
  -[GEOTransitRouteDisplayStrings _readBadge]((uint64_t)self);
  return self->_badge;
}

- (void)setBadge:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_badge, a3);
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
  v8.super_class = (Class)GEOTransitRouteDisplayStrings;
  -[GEOTransitRouteDisplayStrings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitRouteDisplayStrings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteDisplayStrings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "planningDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("planningDescription");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("planning_description");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "duration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v9, "jsonRepresentation");
    else
      objc_msgSend(v9, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("duration"));

  }
  objc_msgSend((id)a1, "durationList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("durationList");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("duration_list");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "travelDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("travelDescription");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("travel_description");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v21 = *(id *)(a1 + 24);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v23);
    }

    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("advisory"));
  }
  objc_msgSend((id)a1, "badge");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v28, "jsonRepresentation");
    else
      objc_msgSend(v28, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("badge"));

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
      v38[2] = __59__GEOTransitRouteDisplayStrings__dictionaryRepresentation___block_invoke;
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
  return -[GEOTransitRouteDisplayStrings _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOTransitRouteDisplayStrings__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitRouteDisplayStrings)initWithDictionary:(id)a3
{
  return (GEOTransitRouteDisplayStrings *)-[GEOTransitRouteDisplayStrings _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOFormattedString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  GEOFormattedString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEOFormattedString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOFormattedString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  GEOTransitAdvisory *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  GEOFormattedString *v36;
  uint64_t v37;
  void *v38;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("planningDescription");
      else
        v6 = CFSTR("planning_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOFormattedString initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOFormattedString initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPlanningDescription:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v13 = -[GEOFormattedString initWithJSON:](v12, "initWithJSON:", v11);
        else
          v13 = -[GEOFormattedString initWithDictionary:](v12, "initWithDictionary:", v11);
        v14 = (void *)v13;
        objc_msgSend(a1, "setDuration:", v13);

      }
      if (a3)
        v15 = CFSTR("durationList");
      else
        v15 = CFSTR("duration_list");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOFormattedString initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOFormattedString initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = (void *)v18;
        objc_msgSend(a1, "setDurationList:", v18);

      }
      if (a3)
        v20 = CFSTR("travelDescription");
      else
        v20 = CFSTR("travel_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOFormattedString initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOFormattedString initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setTravelDescription:", v23);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("advisory"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v5;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v42 != v29)
                objc_enumerationMutation(v26);
              v31 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = [GEOTransitAdvisory alloc];
                if ((a3 & 1) != 0)
                  v33 = -[GEOTransitAdvisory initWithJSON:](v32, "initWithJSON:", v31);
                else
                  v33 = -[GEOTransitAdvisory initWithDictionary:](v32, "initWithDictionary:", v31);
                v34 = (void *)v33;
                objc_msgSend(a1, "addAdvisory:", v33);

              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v28);
        }

        v5 = v40;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("badge"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v37 = -[GEOFormattedString initWithJSON:](v36, "initWithJSON:", v35);
        else
          v37 = -[GEOFormattedString initWithDictionary:](v36, "initWithDictionary:", v35);
        v38 = (void *)v37;
        objc_msgSend(a1, "setBadge:", v37);

      }
    }
  }

  return a1;
}

- (GEOTransitRouteDisplayStrings)initWithJSON:(id)a3
{
  return (GEOTransitRouteDisplayStrings *)-[GEOTransitRouteDisplayStrings _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_955;
    else
      v8 = (int *)&readAll__nonRecursiveTag_956;
    GEOTransitRouteDisplayStringsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitRouteDisplayStringsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteDisplayStringsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteDisplayStringsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOTransitRouteDisplayStringsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOTransitRouteDisplayStrings readAll:](self, "readAll:", 0);
    if (self->_planningDescription)
      PBDataWriterWriteSubmessage();
    if (self->_duration)
      PBDataWriterWriteSubmessage();
    if (self->_durationList)
      PBDataWriterWriteSubmessage();
    if (self->_travelDescription)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_advisorys;
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

    if (self->_badge)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOTransitRouteDisplayStrings readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 18) = self->_readerMarkPos;
  *((_DWORD *)v8 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_planningDescription)
    objc_msgSend(v8, "setPlanningDescription:");
  if (self->_duration)
    objc_msgSend(v8, "setDuration:");
  if (self->_durationList)
    objc_msgSend(v8, "setDurationList:");
  if (self->_travelDescription)
    objc_msgSend(v8, "setTravelDescription:");
  if (-[GEOTransitRouteDisplayStrings advisorysCount](self, "advisorysCount"))
  {
    objc_msgSend(v8, "clearAdvisorys");
    v4 = -[GEOTransitRouteDisplayStrings advisorysCount](self, "advisorysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTransitRouteDisplayStrings advisoryAtIndex:](self, "advisoryAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAdvisory:", v7);

      }
    }
  }
  if (self->_badge)
    objc_msgSend(v8, "setBadge:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      GEOTransitRouteDisplayStringsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitRouteDisplayStrings readAll:](self, "readAll:", 0);
  v8 = -[GEOFormattedString copyWithZone:](self->_planningDescription, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[GEOFormattedString copyWithZone:](self->_duration, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[GEOFormattedString copyWithZone:](self->_durationList, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[GEOFormattedString copyWithZone:](self->_travelDescription, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = self->_advisorys;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addAdvisory:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  v21 = -[GEOFormattedString copyWithZone:](self->_badge, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v21;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *planningDescription;
  GEOFormattedString *duration;
  GEOFormattedString *durationList;
  GEOFormattedString *travelDescription;
  NSMutableArray *advisorys;
  GEOFormattedString *badge;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTransitRouteDisplayStrings readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         planningDescription = self->_planningDescription,
         !((unint64_t)planningDescription | v4[7]))
     || -[GEOFormattedString isEqual:](planningDescription, "isEqual:"))
    && ((duration = self->_duration, !((unint64_t)duration | v4[6]))
     || -[GEOFormattedString isEqual:](duration, "isEqual:"))
    && ((durationList = self->_durationList, !((unint64_t)durationList | v4[5]))
     || -[GEOFormattedString isEqual:](durationList, "isEqual:"))
    && ((travelDescription = self->_travelDescription, !((unint64_t)travelDescription | v4[8]))
     || -[GEOFormattedString isEqual:](travelDescription, "isEqual:"))
    && ((advisorys = self->_advisorys, !((unint64_t)advisorys | v4[3]))
     || -[NSMutableArray isEqual:](advisorys, "isEqual:")))
  {
    badge = self->_badge;
    if ((unint64_t)badge | v4[4])
      v11 = -[GEOFormattedString isEqual:](badge, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[GEOTransitRouteDisplayStrings readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_planningDescription, "hash");
  v4 = -[GEOFormattedString hash](self->_duration, "hash") ^ v3;
  v5 = -[GEOFormattedString hash](self->_durationList, "hash");
  v6 = v4 ^ v5 ^ -[GEOFormattedString hash](self->_travelDescription, "hash");
  v7 = -[NSMutableArray hash](self->_advisorys, "hash");
  return v6 ^ v7 ^ -[GEOFormattedString hash](self->_badge, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  GEOFormattedString *planningDescription;
  id v6;
  GEOFormattedString *duration;
  id v8;
  GEOFormattedString *durationList;
  id v10;
  GEOFormattedString *travelDescription;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  GEOFormattedString *badge;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  planningDescription = self->_planningDescription;
  v6 = v4[7];
  if (planningDescription)
  {
    if (v6)
      -[GEOFormattedString mergeFrom:](planningDescription, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOTransitRouteDisplayStrings setPlanningDescription:](self, "setPlanningDescription:");
  }
  duration = self->_duration;
  v8 = v4[6];
  if (duration)
  {
    if (v8)
      -[GEOFormattedString mergeFrom:](duration, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOTransitRouteDisplayStrings setDuration:](self, "setDuration:");
  }
  durationList = self->_durationList;
  v10 = v4[5];
  if (durationList)
  {
    if (v10)
      -[GEOFormattedString mergeFrom:](durationList, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEOTransitRouteDisplayStrings setDurationList:](self, "setDurationList:");
  }
  travelDescription = self->_travelDescription;
  v12 = v4[8];
  if (travelDescription)
  {
    if (v12)
      -[GEOFormattedString mergeFrom:](travelDescription, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOTransitRouteDisplayStrings setTravelDescription:](self, "setTravelDescription:");
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v4[3];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        -[GEOTransitRouteDisplayStrings addAdvisory:](self, "addAdvisory:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  badge = self->_badge;
  v19 = v4[4];
  if (badge)
  {
    if (v19)
      -[GEOFormattedString mergeFrom:](badge, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOTransitRouteDisplayStrings setBadge:](self, "setBadge:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitRouteDisplayStringsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_959);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitRouteDisplayStrings readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_planningDescription, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_duration, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_durationList, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_travelDescription, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_advisorys;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[GEOFormattedString clearUnknownFields:](self->_badge, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelDescription, 0);
  objc_storeStrong((id *)&self->_planningDescription, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_durationList, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_advisorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOServerFormattedString)planningDescriptionFormatString
{
  void *v3;

  if (-[GEOTransitRouteDisplayStrings hasPlanningDescription](self, "hasPlanningDescription"))
  {
    -[GEOTransitRouteDisplayStrings planningDescription](self, "planningDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)previewDurationFormatString
{
  void *v3;

  if (-[GEOTransitRouteDisplayStrings hasDuration](self, "hasDuration"))
  {
    -[GEOTransitRouteDisplayStrings duration](self, "duration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)pickingDurationFormatString
{
  void *v3;

  if (-[GEOTransitRouteDisplayStrings hasDurationList](self, "hasDurationList"))
  {
    -[GEOTransitRouteDisplayStrings durationList](self, "durationList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)transitDescriptionFormatString
{
  void *v3;

  if (-[GEOTransitRouteDisplayStrings hasTravelDescription](self, "hasTravelDescription"))
  {
    -[GEOTransitRouteDisplayStrings travelDescription](self, "travelDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)transitRouteBadge
{
  void *v3;

  if (-[GEOTransitRouteDisplayStrings hasBadge](self, "hasBadge"))
  {
    -[GEOTransitRouteDisplayStrings badge](self, "badge");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOServerFormattedString *)v3;
}

@end
