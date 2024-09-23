@implementation GEOTransitBoardingInfo

- (GEOTransitBoardingInfo)init
{
  GEOTransitBoardingInfo *v2;
  GEOTransitBoardingInfo *v3;
  GEOTransitBoardingInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitBoardingInfo;
  v2 = -[GEOTransitBoardingInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitBoardingInfo)initWithData:(id)a3
{
  GEOTransitBoardingInfo *v3;
  GEOTransitBoardingInfo *v4;
  GEOTransitBoardingInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitBoardingInfo;
  v3 = -[GEOTransitBoardingInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEntrys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntrys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)entrys
{
  -[GEOTransitBoardingInfo _readEntrys]((uint64_t)self);
  return self->_entrys;
}

- (void)setEntrys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *entrys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  entrys = self->_entrys;
  self->_entrys = v4;

}

- (void)clearEntrys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_entrys, "removeAllObjects");
}

- (void)addEntry:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitBoardingInfo _readEntrys]((uint64_t)self);
  -[GEOTransitBoardingInfo _addNoFlagsEntry:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsEntry:(uint64_t)a1
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

- (unint64_t)entrysCount
{
  -[GEOTransitBoardingInfo _readEntrys]((uint64_t)self);
  return -[NSMutableArray count](self->_entrys, "count");
}

- (id)entryAtIndex:(unint64_t)a3
{
  -[GEOTransitBoardingInfo _readEntrys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_entrys, "objectAtIndex:", a3);
}

+ (Class)entryType
{
  return (Class)objc_opt_class();
}

- (void)_readExitPlanInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExitPlanInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasExitPlanInfo
{
  -[GEOTransitBoardingInfo _readExitPlanInfo]((uint64_t)self);
  return self->_exitPlanInfo != 0;
}

- (GEOTransitExitPlanInfo)exitPlanInfo
{
  -[GEOTransitBoardingInfo _readExitPlanInfo]((uint64_t)self);
  return self->_exitPlanInfo;
}

- (void)setExitPlanInfo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_exitPlanInfo, a3);
}

- (void)_readSummaryTimeInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSummaryTimeInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSummaryTimeInstruction
{
  -[GEOTransitBoardingInfo _readSummaryTimeInstruction]((uint64_t)self);
  return self->_summaryTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)summaryTimeInstruction
{
  -[GEOTransitBoardingInfo _readSummaryTimeInstruction]((uint64_t)self);
  return self->_summaryTimeInstruction;
}

- (void)setSummaryTimeInstruction:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_summaryTimeInstruction, a3);
}

- (void)_readEndTimeInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEndTimeInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasEndTimeInstruction
{
  -[GEOTransitBoardingInfo _readEndTimeInstruction]((uint64_t)self);
  return self->_endTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)endTimeInstruction
{
  -[GEOTransitBoardingInfo _readEndTimeInstruction]((uint64_t)self);
  return self->_endTimeInstruction;
}

- (void)setEndTimeInstruction:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  objc_storeStrong((id *)&self->_endTimeInstruction, a3);
}

- (void)_readPreBoardingTimeInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitBoardingInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreBoardingTimeInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPreBoardingTimeInstruction
{
  -[GEOTransitBoardingInfo _readPreBoardingTimeInstruction]((uint64_t)self);
  return self->_preBoardingTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)preBoardingTimeInstruction
{
  -[GEOTransitBoardingInfo _readPreBoardingTimeInstruction]((uint64_t)self);
  return self->_preBoardingTimeInstruction;
}

- (void)setPreBoardingTimeInstruction:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_preBoardingTimeInstruction, a3);
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
  v8.super_class = (Class)GEOTransitBoardingInfo;
  -[GEOTransitBoardingInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitBoardingInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitBoardingInfo _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("entry"));
  }
  objc_msgSend((id)a1, "exitPlanInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("exitPlanInfo");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("exit_plan_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "summaryTimeInstruction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("summaryTimeInstruction");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("summary_time_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend((id)a1, "endTimeInstruction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("endTimeInstruction");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("end_time_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  objc_msgSend((id)a1, "preBoardingTimeInstruction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("preBoardingTimeInstruction");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("pre_boarding_time_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  v29 = *(void **)(a1 + 16);
  if (v29)
  {
    objc_msgSend(v29, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v30, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __52__GEOTransitBoardingInfo__dictionaryRepresentation___block_invoke;
      v36[3] = &unk_1E1C00600;
      v33 = v32;
      v37 = v33;
      objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v36);
      v34 = v33;

      v31 = v34;
    }
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitBoardingInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOTransitBoardingInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitBoardingInfo)initWithDictionary:(id)a3
{
  return (GEOTransitBoardingInfo *)-[GEOTransitBoardingInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOTransitBoardingInfoEntry *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOTransitExitPlanInfo *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEOTransitListTimeInstruction *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  GEOTransitListTimeInstruction *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  GEOTransitListTimeInstruction *v33;
  uint64_t v34;
  void *v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("entry"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = v5;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v39 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = [GEOTransitBoardingInfoEntry alloc];
                if ((a3 & 1) != 0)
                  v14 = -[GEOTransitBoardingInfoEntry initWithJSON:](v13, "initWithJSON:", v12);
                else
                  v14 = -[GEOTransitBoardingInfoEntry initWithDictionary:](v13, "initWithDictionary:", v12);
                v15 = (void *)v14;
                objc_msgSend(a1, "addEntry:", v14);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v9);
        }

        v5 = v37;
      }

      if (a3)
        v16 = CFSTR("exitPlanInfo");
      else
        v16 = CFSTR("exit_plan_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOTransitExitPlanInfo alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOTransitExitPlanInfo initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOTransitExitPlanInfo initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setExitPlanInfo:", v19);

      }
      if (a3)
        v21 = CFSTR("summaryTimeInstruction");
      else
        v21 = CFSTR("summary_time_instruction");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEOTransitListTimeInstruction alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEOTransitListTimeInstruction initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEOTransitListTimeInstruction initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setSummaryTimeInstruction:", v24);

      }
      if (a3)
        v26 = CFSTR("endTimeInstruction");
      else
        v26 = CFSTR("end_time_instruction");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEOTransitListTimeInstruction alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEOTransitListTimeInstruction initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEOTransitListTimeInstruction initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setEndTimeInstruction:", v29);

      }
      if (a3)
        v31 = CFSTR("preBoardingTimeInstruction");
      else
        v31 = CFSTR("pre_boarding_time_instruction");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = [GEOTransitListTimeInstruction alloc];
        if ((a3 & 1) != 0)
          v34 = -[GEOTransitListTimeInstruction initWithJSON:](v33, "initWithJSON:", v32);
        else
          v34 = -[GEOTransitListTimeInstruction initWithDictionary:](v33, "initWithDictionary:", v32);
        v35 = (void *)v34;
        objc_msgSend(a1, "setPreBoardingTimeInstruction:", v34);

      }
    }
  }

  return a1;
}

- (GEOTransitBoardingInfo)initWithJSON:(id)a3
{
  return (GEOTransitBoardingInfo *)-[GEOTransitBoardingInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_247;
    else
      v8 = (int *)&readAll__nonRecursiveTag_248;
    GEOTransitBoardingInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitBoardingInfoCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitBoardingInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitBoardingInfoReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOTransitBoardingInfoIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOTransitBoardingInfo readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_entrys;
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

    if (self->_exitPlanInfo)
      PBDataWriterWriteSubmessage();
    if (self->_summaryTimeInstruction)
      PBDataWriterWriteSubmessage();
    if (self->_endTimeInstruction)
      PBDataWriterWriteSubmessage();
    if (self->_preBoardingTimeInstruction)
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
  id *v9;

  v9 = (id *)a3;
  -[GEOTransitBoardingInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 16) = self->_readerMarkPos;
  *((_DWORD *)v9 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTransitBoardingInfo entrysCount](self, "entrysCount"))
  {
    objc_msgSend(v9, "clearEntrys");
    v4 = -[GEOTransitBoardingInfo entrysCount](self, "entrysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTransitBoardingInfo entryAtIndex:](self, "entryAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addEntry:", v7);

      }
    }
  }
  if (self->_exitPlanInfo)
    objc_msgSend(v9, "setExitPlanInfo:");
  v8 = v9;
  if (self->_summaryTimeInstruction)
  {
    objc_msgSend(v9, "setSummaryTimeInstruction:");
    v8 = v9;
  }
  if (self->_endTimeInstruction)
  {
    objc_msgSend(v9, "setEndTimeInstruction:");
    v8 = v9;
  }
  if (self->_preBoardingTimeInstruction)
  {
    objc_msgSend(v9, "setPreBoardingTimeInstruction:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
      GEOTransitBoardingInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitBoardingInfo readAll:](self, "readAll:", 0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_entrys;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addEntry:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  v13 = -[GEOTransitExitPlanInfo copyWithZone:](self->_exitPlanInfo, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[GEOTransitListTimeInstruction copyWithZone:](self->_summaryTimeInstruction, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = -[GEOTransitListTimeInstruction copyWithZone:](self->_endTimeInstruction, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = -[GEOTransitListTimeInstruction copyWithZone:](self->_preBoardingTimeInstruction, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *entrys;
  GEOTransitExitPlanInfo *exitPlanInfo;
  GEOTransitListTimeInstruction *summaryTimeInstruction;
  GEOTransitListTimeInstruction *endTimeInstruction;
  GEOTransitListTimeInstruction *preBoardingTimeInstruction;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOTransitBoardingInfo readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         entrys = self->_entrys,
         !((unint64_t)entrys | v4[4]))
     || -[NSMutableArray isEqual:](entrys, "isEqual:"))
    && ((exitPlanInfo = self->_exitPlanInfo, !((unint64_t)exitPlanInfo | v4[5]))
     || -[GEOTransitExitPlanInfo isEqual:](exitPlanInfo, "isEqual:"))
    && ((summaryTimeInstruction = self->_summaryTimeInstruction, !((unint64_t)summaryTimeInstruction | v4[7]))
     || -[GEOTransitListTimeInstruction isEqual:](summaryTimeInstruction, "isEqual:"))
    && ((endTimeInstruction = self->_endTimeInstruction, !((unint64_t)endTimeInstruction | v4[3]))
     || -[GEOTransitListTimeInstruction isEqual:](endTimeInstruction, "isEqual:")))
  {
    preBoardingTimeInstruction = self->_preBoardingTimeInstruction;
    if ((unint64_t)preBoardingTimeInstruction | v4[6])
      v10 = -[GEOTransitListTimeInstruction isEqual:](preBoardingTimeInstruction, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[GEOTransitBoardingInfo readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_entrys, "hash");
  v4 = -[GEOTransitExitPlanInfo hash](self->_exitPlanInfo, "hash") ^ v3;
  v5 = -[GEOTransitListTimeInstruction hash](self->_summaryTimeInstruction, "hash");
  v6 = v4 ^ v5 ^ -[GEOTransitListTimeInstruction hash](self->_endTimeInstruction, "hash");
  return v6 ^ -[GEOTransitListTimeInstruction hash](self->_preBoardingTimeInstruction, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOTransitExitPlanInfo *exitPlanInfo;
  id v11;
  GEOTransitListTimeInstruction *summaryTimeInstruction;
  id v13;
  GEOTransitListTimeInstruction *endTimeInstruction;
  id v15;
  GEOTransitListTimeInstruction *preBoardingTimeInstruction;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        -[GEOTransitBoardingInfo addEntry:](self, "addEntry:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  exitPlanInfo = self->_exitPlanInfo;
  v11 = v4[5];
  if (exitPlanInfo)
  {
    if (v11)
      -[GEOTransitExitPlanInfo mergeFrom:](exitPlanInfo, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOTransitBoardingInfo setExitPlanInfo:](self, "setExitPlanInfo:");
  }
  summaryTimeInstruction = self->_summaryTimeInstruction;
  v13 = v4[7];
  if (summaryTimeInstruction)
  {
    if (v13)
      -[GEOTransitListTimeInstruction mergeFrom:](summaryTimeInstruction, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOTransitBoardingInfo setSummaryTimeInstruction:](self, "setSummaryTimeInstruction:");
  }
  endTimeInstruction = self->_endTimeInstruction;
  v15 = v4[3];
  if (endTimeInstruction)
  {
    if (v15)
      -[GEOTransitListTimeInstruction mergeFrom:](endTimeInstruction, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOTransitBoardingInfo setEndTimeInstruction:](self, "setEndTimeInstruction:");
  }
  preBoardingTimeInstruction = self->_preBoardingTimeInstruction;
  v17 = v4[6];
  if (preBoardingTimeInstruction)
  {
    if (v17)
      -[GEOTransitListTimeInstruction mergeFrom:](preBoardingTimeInstruction, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEOTransitBoardingInfo setPreBoardingTimeInstruction:](self, "setPreBoardingTimeInstruction:");
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
      GEOTransitBoardingInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_251);
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
  *(_BYTE *)&self->_flags |= 0x41u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitBoardingInfo readAll:](self, "readAll:", 0);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_entrys;
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

    -[GEOTransitExitPlanInfo clearUnknownFields:](self->_exitPlanInfo, "clearUnknownFields:", 1);
    -[GEOTransitListTimeInstruction clearUnknownFields:](self->_summaryTimeInstruction, "clearUnknownFields:", 1);
    -[GEOTransitListTimeInstruction clearUnknownFields:](self->_endTimeInstruction, "clearUnknownFields:", 1);
    -[GEOTransitListTimeInstruction clearUnknownFields:](self->_preBoardingTimeInstruction, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryTimeInstruction, 0);
  objc_storeStrong((id *)&self->_preBoardingTimeInstruction, 0);
  objc_storeStrong((id *)&self->_exitPlanInfo, 0);
  objc_storeStrong((id *)&self->_entrys, 0);
  objc_storeStrong((id *)&self->_endTimeInstruction, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  return -[GEOTransitBoardingInfo entrysCount](self, "entrysCount")
      || -[GEOTransitBoardingInfo hasExitPlanInfo](self, "hasExitPlanInfo")
      || -[GEOTransitBoardingInfo hasPreBoardingTimeInstruction](self, "hasPreBoardingTimeInstruction")
      || -[GEOTransitBoardingInfo hasSummaryTimeInstruction](self, "hasSummaryTimeInstruction")
      || -[GEOTransitBoardingInfo hasEndTimeInstruction](self, "hasEndTimeInstruction");
}

- (void)_transit_mergeFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  char v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;

  v4 = a3;
  -[GEOTransitBoardingInfo clearEntrys](self, "clearEntrys");
  v55 = v4;
  -[GEOTransitBoardingInfo entrys](self, "entrys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "entrys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (!v8)
  {
    v12 = v7;
    goto LABEL_19;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v9 = (id)_MergedGlobals_219;
  v10 = v8;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v10, "conformsToProtocol:", _MergedGlobals_219))
  {
    v11 = objc_msgSend(v10, "_transit_hasAnyFieldSet");

    if ((v11 & 1) != 0)
    {
LABEL_14:
      if (objc_msgSend(v10, "conformsToProtocol:", v9)
        && objc_msgSend(v7, "conformsToProtocol:", v9))
      {
        objc_msgSend(v7, "_transit_mergeFrom:", v10);
        v10 = v7;
      }
      v12 = v10;
      goto LABEL_18;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_14;
    }
    objc_msgSend(v10, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
      goto LABEL_14;
  }
  v12 = 0;
LABEL_18:

LABEL_19:
  -[GEOTransitBoardingInfo setEntrys:](self, "setEntrys:", v12);

  -[GEOTransitBoardingInfo exitPlanInfo](self, "exitPlanInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "exitPlanInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  if (!v18)
  {
    v22 = v17;
    goto LABEL_37;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v19 = (id)_MergedGlobals_219;
  v20 = v18;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v20, "conformsToProtocol:", _MergedGlobals_219))
  {
    v21 = objc_msgSend(v20, "_transit_hasAnyFieldSet");

    if ((v21 & 1) != 0)
    {
LABEL_32:
      if (objc_msgSend(v20, "conformsToProtocol:", v19)
        && objc_msgSend(v17, "conformsToProtocol:", v19))
      {
        objc_msgSend(v17, "_transit_mergeFrom:", v20);
        v20 = v17;
      }
      v22 = v20;
      goto LABEL_36;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_32;
    }
    objc_msgSend(v20, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
      goto LABEL_32;
  }
  v22 = 0;
LABEL_36:

LABEL_37:
  -[GEOTransitBoardingInfo setExitPlanInfo:](self, "setExitPlanInfo:", v22);

  -[GEOTransitBoardingInfo preBoardingTimeInstruction](self, "preBoardingTimeInstruction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "preBoardingTimeInstruction");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v25;
  v28 = v26;
  if (!v28)
  {
    v32 = v27;
    goto LABEL_55;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v29 = (id)_MergedGlobals_219;
  v30 = v28;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v30, "conformsToProtocol:", _MergedGlobals_219))
  {
    v31 = objc_msgSend(v30, "_transit_hasAnyFieldSet");

    if ((v31 & 1) != 0)
    {
LABEL_50:
      if (objc_msgSend(v30, "conformsToProtocol:", v29)
        && objc_msgSend(v27, "conformsToProtocol:", v29))
      {
        objc_msgSend(v27, "_transit_mergeFrom:", v30);
        v30 = v27;
      }
      v32 = v30;
      goto LABEL_54;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_50;
    }
    objc_msgSend(v30, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34)
      goto LABEL_50;
  }
  v32 = 0;
LABEL_54:

LABEL_55:
  -[GEOTransitBoardingInfo setPreBoardingTimeInstruction:](self, "setPreBoardingTimeInstruction:", v32);

  -[GEOTransitBoardingInfo summaryTimeInstruction](self, "summaryTimeInstruction");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "summaryTimeInstruction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v35;
  v38 = v36;
  if (!v38)
  {
    v42 = v37;
    goto LABEL_73;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v39 = (id)_MergedGlobals_219;
  v40 = v38;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v40, "conformsToProtocol:", _MergedGlobals_219))
  {
    v41 = objc_msgSend(v40, "_transit_hasAnyFieldSet");

    if ((v41 & 1) != 0)
    {
LABEL_68:
      if (objc_msgSend(v40, "conformsToProtocol:", v39)
        && objc_msgSend(v37, "conformsToProtocol:", v39))
      {
        objc_msgSend(v37, "_transit_mergeFrom:", v40);
        v40 = v37;
      }
      v42 = v40;
      goto LABEL_72;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_68;
    }
    objc_msgSend(v40, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");

    if (v44)
      goto LABEL_68;
  }
  v42 = 0;
LABEL_72:

LABEL_73:
  -[GEOTransitBoardingInfo setSummaryTimeInstruction:](self, "setSummaryTimeInstruction:", v42);

  -[GEOTransitBoardingInfo endTimeInstruction](self, "endTimeInstruction");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "endTimeInstruction");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v45;
  v48 = v46;
  if (v48)
  {
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    v49 = (id)_MergedGlobals_219;
    v50 = v48;
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    if (objc_msgSend(v50, "conformsToProtocol:", _MergedGlobals_219))
    {
      v51 = objc_msgSend(v50, "_transit_hasAnyFieldSet");

      if ((v51 & 1) != 0)
      {
LABEL_86:
        if (objc_msgSend(v50, "conformsToProtocol:", v49)
          && objc_msgSend(v47, "conformsToProtocol:", v49))
        {
          objc_msgSend(v47, "_transit_mergeFrom:", v50);
          v50 = v47;
        }
        v52 = v50;
        goto LABEL_90;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_86;
      }
      objc_msgSend(v50, "dictionaryRepresentation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "count");

      if (v54)
        goto LABEL_86;
    }
    v52 = 0;
LABEL_90:

    goto LABEL_91;
  }
  v52 = v47;
LABEL_91:

  -[GEOTransitBoardingInfo setEndTimeInstruction:](self, "setEndTimeInstruction:", v52);
}

@end
