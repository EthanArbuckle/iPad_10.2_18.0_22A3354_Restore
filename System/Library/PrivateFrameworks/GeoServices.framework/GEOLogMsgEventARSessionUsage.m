@implementation GEOLogMsgEventARSessionUsage

- (GEOLogMsgEventARSessionUsage)init
{
  GEOLogMsgEventARSessionUsage *v2;
  GEOLogMsgEventARSessionUsage *v3;
  GEOLogMsgEventARSessionUsage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventARSessionUsage;
  v2 = -[GEOLogMsgEventARSessionUsage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventARSessionUsage)initWithData:(id)a3
{
  GEOLogMsgEventARSessionUsage *v3;
  GEOLogMsgEventARSessionUsage *v4;
  GEOLogMsgEventARSessionUsage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventARSessionUsage;
  v3 = -[GEOLogMsgEventARSessionUsage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVlfLocalizationResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 64) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventARSessionUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVlfLocalizationResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)vlfLocalizationResults
{
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  return self->_vlfLocalizationResults;
}

- (void)setVlfLocalizationResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *vlfLocalizationResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  vlfLocalizationResults = self->_vlfLocalizationResults;
  self->_vlfLocalizationResults = v4;

}

- (void)clearVlfLocalizationResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_vlfLocalizationResults, "removeAllObjects");
}

- (void)addVlfLocalizationResults:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  -[GEOLogMsgEventARSessionUsage _addNoFlagsVlfLocalizationResults:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsVlfLocalizationResults:(uint64_t)a1
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

- (unint64_t)vlfLocalizationResultsCount
{
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  return -[NSMutableArray count](self->_vlfLocalizationResults, "count");
}

- (id)vlfLocalizationResultsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_vlfLocalizationResults, "objectAtIndex:", a3);
}

+ (Class)vlfLocalizationResultsType
{
  return (Class)objc_opt_class();
}

- (void)_readArElementDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventARSessionUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArElementDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)arElementDetails
{
  -[GEOLogMsgEventARSessionUsage _readArElementDetails]((uint64_t)self);
  return self->_arElementDetails;
}

- (void)setArElementDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *arElementDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  arElementDetails = self->_arElementDetails;
  self->_arElementDetails = v4;

}

- (void)clearArElementDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_arElementDetails, "removeAllObjects");
}

- (void)addArElementDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventARSessionUsage _readArElementDetails]((uint64_t)self);
  -[GEOLogMsgEventARSessionUsage _addNoFlagsArElementDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsArElementDetails:(uint64_t)a1
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

- (unint64_t)arElementDetailsCount
{
  -[GEOLogMsgEventARSessionUsage _readArElementDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_arElementDetails, "count");
}

- (id)arElementDetailsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventARSessionUsage _readArElementDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_arElementDetails, "objectAtIndex:", a3);
}

+ (Class)arElementDetailsType
{
  return (Class)objc_opt_class();
}

- (unsigned)sessionTimeMs
{
  return self->_sessionTimeMs;
}

- (void)setSessionTimeMs:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_sessionTimeMs = a3;
}

- (void)setHasSessionTimeMs:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasSessionTimeMs
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)didLocalize
{
  return self->_didLocalize;
}

- (void)setDidLocalize:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_didLocalize = a3;
}

- (void)setHasDidLocalize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDidLocalize
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)timeRoundedToHour
{
  return self->_timeRoundedToHour;
}

- (void)setTimeRoundedToHour:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_timeRoundedToHour = a3;
}

- (void)setHasTimeRoundedToHour:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimeRoundedToHour
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readThermalPressures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventARSessionUsageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThermalPressures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)thermalPressures
{
  -[GEOLogMsgEventARSessionUsage _readThermalPressures]((uint64_t)self);
  return self->_thermalPressures;
}

- (void)setThermalPressures:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *thermalPressures;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  thermalPressures = self->_thermalPressures;
  self->_thermalPressures = v4;

}

- (void)clearThermalPressures
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_thermalPressures, "removeAllObjects");
}

- (void)addThermalPressure:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventARSessionUsage _readThermalPressures]((uint64_t)self);
  -[GEOLogMsgEventARSessionUsage _addNoFlagsThermalPressure:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsThermalPressure:(uint64_t)a1
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

- (unint64_t)thermalPressuresCount
{
  -[GEOLogMsgEventARSessionUsage _readThermalPressures]((uint64_t)self);
  return -[NSMutableArray count](self->_thermalPressures, "count");
}

- (id)thermalPressureAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventARSessionUsage _readThermalPressures]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_thermalPressures, "objectAtIndex:", a3);
}

+ (Class)thermalPressureType
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
  v8.super_class = (Class)GEOLogMsgEventARSessionUsage;
  -[GEOLogMsgEventARSessionUsage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventARSessionUsage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventARSessionUsage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  char v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
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
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v49 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("vlfLocalizationResults");
    else
      v13 = CFSTR("vlf_localization_results");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v15 = *(id *)(a1 + 16);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("arElementDetails");
    else
      v22 = CFSTR("ar_element_details");
    objc_msgSend(v4, "setObject:forKey:", v14, v22);

  }
  v23 = *(_BYTE *)(a1 + 64);
  if ((v23 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
      goto LABEL_34;
LABEL_59:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("didLocalize");
    else
      v39 = CFSTR("did_localize");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

    if ((*(_BYTE *)(a1 + 64) & 2) == 0)
      goto LABEL_39;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v37 = CFSTR("sessionTimeMs");
  else
    v37 = CFSTR("session_time_ms");
  objc_msgSend(v4, "setObject:forKey:", v36, v37);

  v23 = *(_BYTE *)(a1 + 64);
  if ((v23 & 4) != 0)
    goto LABEL_59;
LABEL_34:
  if ((v23 & 2) != 0)
  {
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("timeRoundedToHour");
    else
      v25 = CFSTR("time_rounded_to_hour");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
LABEL_39:
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v27 = *(id *)(a1 + 24);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v41;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v41 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v32, "jsonRepresentation");
          else
            objc_msgSend(v32, "dictionaryRepresentation", (_QWORD)v40);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v33, (_QWORD)v40);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v29);
    }

    if (a2)
      v34 = CFSTR("thermalPressure");
    else
      v34 = CFSTR("thermal_pressure");
    objc_msgSend(v4, "setObject:forKey:", v26, v34, (_QWORD)v40);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventARSessionUsage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventARSessionUsage)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventARSessionUsage *)-[GEOLogMsgEventARSessionUsage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOVLFLocalizationResults *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  GEOARElementDetails *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  GEOARSessionThermalPressure *v42;
  uint64_t v43;
  void *v44;
  id v46;
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
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("vlfLocalizationResults");
      else
        v6 = CFSTR("vlf_localization_results");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v46 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v56 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOVLFLocalizationResults alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOVLFLocalizationResults initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOVLFLocalizationResults initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addVlfLocalizationResults:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
          }
          while (v10);
        }

        v5 = v46;
      }

      if (a3)
        v17 = CFSTR("arElementDetails");
      else
        v17 = CFSTR("ar_element_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v52;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v52 != v22)
                objc_enumerationMutation(v19);
              v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = [GEOARElementDetails alloc];
                if ((a3 & 1) != 0)
                  v26 = -[GEOARElementDetails initWithJSON:](v25, "initWithJSON:", v24);
                else
                  v26 = -[GEOARElementDetails initWithDictionary:](v25, "initWithDictionary:", v24);
                v27 = (void *)v26;
                objc_msgSend(a1, "addArElementDetails:", v26);

              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          }
          while (v21);
        }

        v5 = v46;
      }

      if (a3)
        v28 = CFSTR("sessionTimeMs");
      else
        v28 = CFSTR("session_time_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSessionTimeMs:", objc_msgSend(v29, "unsignedIntValue"));

      if (a3)
        v30 = CFSTR("didLocalize");
      else
        v30 = CFSTR("did_localize");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDidLocalize:", objc_msgSend(v31, "BOOLValue"));

      if (a3)
        v32 = CFSTR("timeRoundedToHour");
      else
        v32 = CFSTR("time_rounded_to_hour");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTimeRoundedToHour:", objc_msgSend(v33, "unsignedIntValue"));

      if (a3)
        v34 = CFSTR("thermalPressure");
      else
        v34 = CFSTR("thermal_pressure");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v36 = v35;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v48;
          do
          {
            for (k = 0; k != v38; ++k)
            {
              if (*(_QWORD *)v48 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = [GEOARSessionThermalPressure alloc];
                if ((a3 & 1) != 0)
                  v43 = -[GEOARSessionThermalPressure initWithJSON:](v42, "initWithJSON:", v41);
                else
                  v43 = -[GEOARSessionThermalPressure initWithDictionary:](v42, "initWithDictionary:", v41);
                v44 = (void *)v43;
                objc_msgSend(a1, "addThermalPressure:", v43);

              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          }
          while (v38);
        }

        v5 = v46;
      }

    }
  }

  return a1;
}

- (GEOLogMsgEventARSessionUsage)initWithJSON:(id)a3
{
  return (GEOLogMsgEventARSessionUsage *)-[GEOLogMsgEventARSessionUsage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1497;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1498;
    GEOLogMsgEventARSessionUsageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventARSessionUsageCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventARSessionUsageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventARSessionUsageReadAllFrom((uint64_t)self, a3, 0);
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
  char flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  PBDataReader *v19;
  void *v20;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x78) == 0))
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventARSessionUsage readAll:](self, "readAll:", 0);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = self->_vlfLocalizationResults;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v7);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_arElementDetails;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v11);
    }

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = self->_thermalPressures;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v16);
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
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOLogMsgEventARSessionUsage _readVlfLocalizationResults]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_vlfLocalizationResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
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
  char flags;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  id *v17;

  v17 = (id *)a3;
  -[GEOLogMsgEventARSessionUsage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 10) = self->_readerMarkPos;
  *((_DWORD *)v17 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLogMsgEventARSessionUsage vlfLocalizationResultsCount](self, "vlfLocalizationResultsCount"))
  {
    objc_msgSend(v17, "clearVlfLocalizationResults");
    v4 = -[GEOLogMsgEventARSessionUsage vlfLocalizationResultsCount](self, "vlfLocalizationResultsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEventARSessionUsage vlfLocalizationResultsAtIndex:](self, "vlfLocalizationResultsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addVlfLocalizationResults:", v7);

      }
    }
  }
  if (-[GEOLogMsgEventARSessionUsage arElementDetailsCount](self, "arElementDetailsCount"))
  {
    objc_msgSend(v17, "clearArElementDetails");
    v8 = -[GEOLogMsgEventARSessionUsage arElementDetailsCount](self, "arElementDetailsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOLogMsgEventARSessionUsage arElementDetailsAtIndex:](self, "arElementDetailsAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addArElementDetails:", v11);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_11;
LABEL_19:
    *((_BYTE *)v17 + 60) = self->_didLocalize;
    *((_BYTE *)v17 + 64) |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *((_DWORD *)v17 + 13) = self->_sessionTimeMs;
  *((_BYTE *)v17 + 64) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_19;
LABEL_11:
  if ((flags & 2) != 0)
  {
LABEL_12:
    *((_DWORD *)v17 + 14) = self->_timeRoundedToHour;
    *((_BYTE *)v17 + 64) |= 2u;
  }
LABEL_13:
  if (-[GEOLogMsgEventARSessionUsage thermalPressuresCount](self, "thermalPressuresCount"))
  {
    objc_msgSend(v17, "clearThermalPressures");
    v13 = -[GEOLogMsgEventARSessionUsage thermalPressuresCount](self, "thermalPressuresCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[GEOLogMsgEventARSessionUsage thermalPressureAtIndex:](self, "thermalPressureAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addThermalPressure:", v16);

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
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char flags;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
      GEOLogMsgEventARSessionUsageReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventARSessionUsage readAll:](self, "readAll:", 0);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = self->_vlfLocalizationResults;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addVlfLocalizationResults:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v10);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_arElementDetails;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addArElementDetails:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v15);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_sessionTimeMs;
    *(_BYTE *)(v5 + 64) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_21:
      if ((flags & 2) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_21;
  }
  *(_BYTE *)(v5 + 60) = self->_didLocalize;
  *(_BYTE *)(v5 + 64) |= 4u;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_22:
    *(_DWORD *)(v5 + 56) = self->_timeRoundedToHour;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
LABEL_23:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_thermalPressures;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v8);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addThermalPressure:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v20);
  }
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *vlfLocalizationResults;
  NSMutableArray *arElementDetails;
  NSMutableArray *thermalPressures;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEOLogMsgEventARSessionUsage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  vlfLocalizationResults = self->_vlfLocalizationResults;
  if ((unint64_t)vlfLocalizationResults | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](vlfLocalizationResults, "isEqual:"))
      goto LABEL_26;
  }
  arElementDetails = self->_arElementDetails;
  if ((unint64_t)arElementDetails | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](arElementDetails, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_sessionTimeMs != *((_DWORD *)v4 + 13))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) != 0)
    {
      if (self->_didLocalize)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_26;
        goto LABEL_19;
      }
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_19;
    }
LABEL_26:
    v8 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 64) & 4) != 0)
    goto LABEL_26;
LABEL_19:
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_timeRoundedToHour != *((_DWORD *)v4 + 14))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_26;
  }
  thermalPressures = self->_thermalPressures;
  if ((unint64_t)thermalPressures | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](thermalPressures, "isEqual:");
  else
    v8 = 1;
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOLogMsgEventARSessionUsage readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_vlfLocalizationResults, "hash");
  v4 = -[NSMutableArray hash](self->_arElementDetails, "hash");
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSMutableArray hash](self->_thermalPressures, "hash");
  }
  v5 = 2654435761 * self->_sessionTimeMs;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_didLocalize;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_timeRoundedToHour;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSMutableArray hash](self->_thermalPressures, "hash");
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
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
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
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgEventARSessionUsage addVlfLocalizationResults:](self, "addVlfLocalizationResults:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = *((id *)v4 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        -[GEOLogMsgEventARSessionUsage addArElementDetails:](self, "addArElementDetails:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v12);
  }

  v15 = *((_BYTE *)v4 + 64);
  if ((v15 & 1) != 0)
  {
    self->_sessionTimeMs = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
    v15 = *((_BYTE *)v4 + 64);
    if ((v15 & 4) == 0)
    {
LABEL_17:
      if ((v15 & 2) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 4) == 0)
  {
    goto LABEL_17;
  }
  self->_didLocalize = *((_BYTE *)v4 + 60);
  *(_BYTE *)&self->_flags |= 4u;
  if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
LABEL_18:
    self->_timeRoundedToHour = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_19:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *((id *)v4 + 3);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[GEOLogMsgEventARSessionUsage addThermalPressure:](self, "addThermalPressure:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * k), (_QWORD)v21);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlfLocalizationResults, 0);
  objc_storeStrong((id *)&self->_thermalPressures, 0);
  objc_storeStrong((id *)&self->_arElementDetails, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
