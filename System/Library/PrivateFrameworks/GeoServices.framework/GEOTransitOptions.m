@implementation GEOTransitOptions

- (GEOTransitOptions)init
{
  GEOTransitOptions *v2;
  GEOTransitOptions *v3;
  GEOTransitOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitOptions;
  v2 = -[GEOTransitOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitOptions)initWithData:(id)a3
{
  GEOTransitOptions *v3;
  GEOTransitOptions *v4;
  GEOTransitOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitOptions;
  v3 = -[GEOTransitOptions initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOTransitOptions;
  -[GEOTransitOptions dealloc](&v3, sel_dealloc);
}

- (void)_readAvoidedModes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAvoidedModes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)avoidedModesCount
{
  -[GEOTransitOptions _readAvoidedModes]((uint64_t)self);
  return self->_avoidedModes.count;
}

- (int)avoidedModes
{
  -[GEOTransitOptions _readAvoidedModes]((uint64_t)self);
  return self->_avoidedModes.list;
}

- (void)clearAvoidedModes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Clear();
}

- (void)addAvoidedMode:(int)a3
{
  -[GEOTransitOptions _readAvoidedModes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (int)avoidedModeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_avoidedModes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitOptions _readAvoidedModes]((uint64_t)self);
  p_avoidedModes = &self->_avoidedModes;
  count = self->_avoidedModes.count;
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
  return p_avoidedModes->list[a3];
}

- (void)setAvoidedModes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Set();
}

- (id)avoidedModesAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C087D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAvoidedModes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AVOID_OTHER")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AVOID_METRO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AVOID_RAIL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AVOID_LIGHT_RAIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AVOID_BUS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AVOID_FERRY")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)prioritization
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_prioritization;
  else
    return 0;
}

- (void)setPrioritization:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_prioritization = a3;
}

- (void)setHasPrioritization:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasPrioritization
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)prioritizationAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C08808[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPrioritization:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRAVEL_TIME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readFareOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFareOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasFareOptions
{
  -[GEOTransitOptions _readFareOptions]((uint64_t)self);
  return self->_fareOptions != 0;
}

- (GEOFareOptions)fareOptions
{
  -[GEOTransitOptions _readFareOptions]((uint64_t)self);
  return self->_fareOptions;
}

- (void)setFareOptions:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_fareOptions, a3);
}

- (int)routingBehavior
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_routingBehavior;
  else
    return 0;
}

- (void)setRoutingBehavior:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_routingBehavior = a3;
}

- (void)setHasRoutingBehavior:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRoutingBehavior
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)routingBehaviorAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C08828[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRoutingBehavior:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATIC")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL_TIME_DISPLAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REAL_TIME_ROUTING")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)enableIncidents
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 4) == 0 || self->_enableIncidents;
}

- (void)setEnableIncidents:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_enableIncidents = a3;
}

- (void)setHasEnableIncidents:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEnableIncidents
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOTransitOptions;
  -[GEOTransitOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  char v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C087D8[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = (_QWORD *)(a1 + 24);
      }
      while (v7 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v10 = CFSTR("avoidedMode");
    else
      v10 = CFSTR("avoided_mode");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v11 = *(int *)(a1 + 68);
    if (v11 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E1C08808[v11];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("prioritization"));

  }
  objc_msgSend((id)a1, "fareOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("fareOptions");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("fare_options");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(_BYTE *)(a1 + 80);
  if ((v17 & 2) != 0)
  {
    v18 = *(int *)(a1 + 72);
    if (v18 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 72));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E1C08828[v18];
    }
    if (a2)
      v20 = CFSTR("routingBehavior");
    else
      v20 = CFSTR("routing_behavior");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    v17 = *(_BYTE *)(a1 + 80);
  }
  if ((v17 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("enableIncidents");
    else
      v22 = CFSTR("enable_incidents");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __47__GEOTransitOptions__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOTransitOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitOptions)initWithDictionary:(id)a3
{
  return (GEOTransitOptions *)-[GEOTransitOptions _initWithDictionary:isJSON:](self, a3, 0);
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
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  GEOFareOptions *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_76;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("avoidedMode");
    else
      v7 = CFSTR("avoided_mode");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v5;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v32 = v8;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (!v10)
        goto LABEL_32;
      v11 = v10;
      v12 = *(_QWORD *)v35;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AVOID_OTHER")) & 1) != 0)
            {
              v16 = 0;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AVOID_METRO")) & 1) != 0)
            {
              v16 = 1;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AVOID_RAIL")) & 1) != 0)
            {
              v16 = 2;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AVOID_LIGHT_RAIL")) & 1) != 0)
            {
              v16 = 3;
            }
            else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("AVOID_BUS")) & 1) != 0)
            {
              v16 = 4;
            }
            else if (objc_msgSend(v15, "isEqualToString:", CFSTR("AVOID_FERRY")))
            {
              v16 = 5;
            }
            else
            {
              v16 = 0;
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v16 = objc_msgSend(v14, "intValue");
          }
          objc_msgSend(v6, "addAvoidedMode:", v16);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (!v11)
        {
LABEL_32:

          v5 = v33;
          v8 = v32;
          break;
        }
      }
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prioritization"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_DEFAULT")) & 1) != 0)
      {
        v19 = 0;
      }
      else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRAVEL_TIME")) & 1) != 0)
      {
        v19 = 1;
      }
      else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_TRANSFER_COUNT")) & 1) != 0)
      {
        v19 = 2;
      }
      else if (objc_msgSend(v18, "isEqualToString:", CFSTR("TRANSIT_PRIORITIZE_BY_WALKING_DISTANCE")))
      {
        v19 = 3;
      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_47;
      v19 = objc_msgSend(v17, "intValue");
    }
    objc_msgSend(v6, "setPrioritization:", v19);
LABEL_47:

    if (a3)
      v20 = CFSTR("fareOptions");
    else
      v20 = CFSTR("fare_options");
    objc_msgSend(v5, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = [GEOFareOptions alloc];
      if ((a3 & 1) != 0)
        v23 = -[GEOFareOptions initWithJSON:](v22, "initWithJSON:", v21);
      else
        v23 = -[GEOFareOptions initWithDictionary:](v22, "initWithDictionary:", v21);
      v24 = (void *)v23;
      objc_msgSend(v6, "setFareOptions:", v23);

    }
    if (a3)
      v25 = CFSTR("routingBehavior");
    else
      v25 = CFSTR("routing_behavior");
    objc_msgSend(v5, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v26;
      if ((objc_msgSend(v27, "isEqualToString:", CFSTR("STATIC")) & 1) != 0)
      {
        v28 = 0;
      }
      else if ((objc_msgSend(v27, "isEqualToString:", CFSTR("REAL_TIME_DISPLAY")) & 1) != 0)
      {
        v28 = 1;
      }
      else if (objc_msgSend(v27, "isEqualToString:", CFSTR("REAL_TIME_ROUTING")))
      {
        v28 = 2;
      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_70:

        if (a3)
          v29 = CFSTR("enableIncidents");
        else
          v29 = CFSTR("enable_incidents");
        objc_msgSend(v5, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setEnableIncidents:", objc_msgSend(v30, "BOOLValue"));

        goto LABEL_76;
      }
      v28 = objc_msgSend(v26, "intValue");
    }
    objc_msgSend(v6, "setRoutingBehavior:", v28);
    goto LABEL_70;
  }
LABEL_76:

  return v6;
}

- (GEOTransitOptions)initWithJSON:(id)a3
{
  return (GEOTransitOptions *)-[GEOTransitOptions _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6940;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6941;
    GEOTransitOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOFareOptions readAll:](self->_fareOptions, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  char flags;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x70) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitOptions readAll:](self, "readAll:", 0);
    v5 = v10;
    if (self->_avoidedModes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v10;
        ++v6;
      }
      while (v6 < self->_avoidedModes.count);
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v10;
    }
    if (self->_fareOptions)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v10;
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;
  char flags;
  id *v9;

  v9 = (id *)a3;
  -[GEOTransitOptions readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 14) = self->_readerMarkPos;
  *((_DWORD *)v9 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTransitOptions avoidedModesCount](self, "avoidedModesCount"))
  {
    objc_msgSend(v9, "clearAvoidedModes");
    v4 = -[GEOTransitOptions avoidedModesCount](self, "avoidedModesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v9, "addAvoidedMode:", -[GEOTransitOptions avoidedModeAtIndex:](self, "avoidedModeAtIndex:", i));
    }
  }
  v7 = v9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v9 + 17) = self->_prioritization;
    *((_BYTE *)v9 + 80) |= 1u;
  }
  if (self->_fareOptions)
  {
    objc_msgSend(v9, "setFareOptions:");
    v7 = v9;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v7 + 18) = self->_routingBehavior;
    *((_BYTE *)v7 + 80) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *((_BYTE *)v7 + 76) = self->_enableIncidents;
    *((_BYTE *)v7 + 80) |= 4u;
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
  char flags;
  PBUnknownFields *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTransitOptionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitOptions readAll:](self, "readAll:", 0);
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_prioritization;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v9 = -[GEOFareOptions copyWithZone:](self->_fareOptions, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_routingBehavior;
    *(_BYTE *)(v5 + 80) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 76) = self->_enableIncidents;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
  v12 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOFareOptions *fareOptions;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOTransitOptions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_18;
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 80);
  if ((flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_prioritization != *((_DWORD *)v4 + 17))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_18;
  }
  fareOptions = self->_fareOptions;
  if ((unint64_t)fareOptions | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOFareOptions isEqual:](fareOptions, "isEqual:"))
      goto LABEL_18;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 80);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_routingBehavior != *((_DWORD *)v4 + 18))
      goto LABEL_18;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_18;
  }
  v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_enableIncidents)
      {
        if (!*((_BYTE *)v4 + 76))
          goto LABEL_18;
      }
      else if (*((_BYTE *)v4 + 76))
      {
        goto LABEL_18;
      }
      v8 = 1;
      goto LABEL_19;
    }
LABEL_18:
    v8 = 0;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOTransitOptions readAll:](self, "readAll:", 1);
  v3 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_prioritization;
  else
    v4 = 0;
  v5 = -[GEOFareOptions hash](self->_fareOptions, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v6 = 2654435761 * self->_routingBehavior;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v7 = 2654435761 * self->_enableIncidents;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int *v7;
  GEOFareOptions *fareOptions;
  uint64_t v9;
  char v10;
  int *v11;

  v11 = (int *)a3;
  objc_msgSend(v11, "readAll:", 0);
  v4 = objc_msgSend(v11, "avoidedModesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOTransitOptions addAvoidedMode:](self, "addAvoidedMode:", objc_msgSend(v11, "avoidedModeAtIndex:", i));
  }
  v7 = v11;
  if ((v11[20] & 1) != 0)
  {
    self->_prioritization = v11[17];
    *(_BYTE *)&self->_flags |= 1u;
  }
  fareOptions = self->_fareOptions;
  v9 = *((_QWORD *)v11 + 6);
  if (fareOptions)
  {
    if (!v9)
      goto LABEL_12;
    -[GEOFareOptions mergeFrom:](fareOptions, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_12;
    -[GEOTransitOptions setFareOptions:](self, "setFareOptions:");
  }
  v7 = v11;
LABEL_12:
  v10 = *((_BYTE *)v7 + 80);
  if ((v10 & 2) != 0)
  {
    self->_routingBehavior = v7[18];
    *(_BYTE *)&self->_flags |= 2u;
    v10 = *((_BYTE *)v7 + 80);
  }
  if ((v10 & 4) != 0)
  {
    self->_enableIncidents = *((_BYTE *)v7 + 76);
    *(_BYTE *)&self->_flags |= 4u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_6944);
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
  *(_BYTE *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitOptions readAll:](self, "readAll:", 0);
    -[GEOFareOptions clearUnknownFields:](self->_fareOptions, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fareOptions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
