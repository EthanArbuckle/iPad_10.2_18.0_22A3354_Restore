@implementation GEOTransitBoardingInfoEntry

- (GEOTransitBoardingInfoEntry)init
{
  GEOTransitBoardingInfoEntry *v2;
  GEOTransitBoardingInfoEntry *v3;
  GEOTransitBoardingInfoEntry *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitBoardingInfoEntry;
  v2 = -[GEOTransitBoardingInfoEntry init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitBoardingInfoEntry)initWithData:(id)a3
{
  GEOTransitBoardingInfoEntry *v3;
  GEOTransitBoardingInfoEntry *v4;
  GEOTransitBoardingInfoEntry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitBoardingInfoEntry;
  v3 = -[GEOTransitBoardingInfoEntry initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)expectedDepartureTime
{
  return self->_expectedDepartureTime;
}

- (void)setExpectedDepartureTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_expectedDepartureTime = a3;
}

- (void)setHasExpectedDepartureTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasExpectedDepartureTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMainText
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
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMainText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMainText
{
  -[GEOTransitBoardingInfoEntry _readMainText]((uint64_t)self);
  return self->_mainText != 0;
}

- (GEOFormattedString)mainText
{
  -[GEOTransitBoardingInfoEntry _readMainText]((uint64_t)self);
  return self->_mainText;
}

- (void)setMainText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_mainText, a3);
}

- (void)_readAlternativeText
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
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternativeText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAlternativeText
{
  -[GEOTransitBoardingInfoEntry _readAlternativeText]((uint64_t)self);
  return self->_alternativeText != 0;
}

- (GEOFormattedString)alternativeText
{
  -[GEOTransitBoardingInfoEntry _readAlternativeText]((uint64_t)self);
  return self->_alternativeText;
}

- (void)setAlternativeText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  objc_storeStrong((id *)&self->_alternativeText, a3);
}

- (void)_readMainTimeInstruction
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
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMainTimeInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMainTimeInstruction
{
  -[GEOTransitBoardingInfoEntry _readMainTimeInstruction]((uint64_t)self);
  return self->_mainTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)mainTimeInstruction
{
  -[GEOTransitBoardingInfoEntry _readMainTimeInstruction]((uint64_t)self);
  return self->_mainTimeInstruction;
}

- (void)setMainTimeInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_mainTimeInstruction, a3);
}

- (void)_readAlternativeTimeInstruction
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
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternativeTimeInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasAlternativeTimeInstruction
{
  -[GEOTransitBoardingInfoEntry _readAlternativeTimeInstruction]((uint64_t)self);
  return self->_alternativeTimeInstruction != 0;
}

- (GEOTransitListTimeInstruction)alternativeTimeInstruction
{
  -[GEOTransitBoardingInfoEntry _readAlternativeTimeInstruction]((uint64_t)self);
  return self->_alternativeTimeInstruction;
}

- (void)setAlternativeTimeInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  objc_storeStrong((id *)&self->_alternativeTimeInstruction, a3);
}

- (void)_readOccupancyInfo
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
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOccupancyInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasOccupancyInfo
{
  -[GEOTransitBoardingInfoEntry _readOccupancyInfo]((uint64_t)self);
  return self->_occupancyInfo != 0;
}

- (GEOTransitOccupancyInfo)occupancyInfo
{
  -[GEOTransitBoardingInfoEntry _readOccupancyInfo]((uint64_t)self);
  return self->_occupancyInfo;
}

- (void)setOccupancyInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_occupancyInfo, a3);
}

- (void)_readExitPlanInfoOverride
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
        GEOTransitBoardingInfoEntryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExitPlanInfoOverride_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasExitPlanInfoOverride
{
  -[GEOTransitBoardingInfoEntry _readExitPlanInfoOverride]((uint64_t)self);
  return self->_exitPlanInfoOverride != 0;
}

- (GEOTransitExitPlanInfo)exitPlanInfoOverride
{
  -[GEOTransitBoardingInfoEntry _readExitPlanInfoOverride]((uint64_t)self);
  return self->_exitPlanInfoOverride;
}

- (void)setExitPlanInfoOverride:(id)a3
{
  *(_WORD *)&self->_flags |= 0x220u;
  objc_storeStrong((id *)&self->_exitPlanInfoOverride, a3);
}

- (BOOL)clearExitPlanInfo
{
  return self->_clearExitPlanInfo;
}

- (void)setClearExitPlanInfo:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_clearExitPlanInfo = a3;
}

- (void)setHasClearExitPlanInfo:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasClearExitPlanInfo
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOTransitBoardingInfoEntry;
  -[GEOTransitBoardingInfoEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitBoardingInfoEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitBoardingInfoEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v40[4];
  id v41;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 92) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("expectedDepartureTime");
    else
      v6 = CFSTR("expected_departure_time");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "mainText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("mainText");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("main_text");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  objc_msgSend((id)a1, "alternativeText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("alternativeText");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("alternative_text");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "mainTimeInstruction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("mainTimeInstruction");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("main_time_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  objc_msgSend((id)a1, "alternativeTimeInstruction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("alternativeTimeInstruction");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("alternative_time_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  objc_msgSend((id)a1, "occupancyInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("occupancyInfo");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("occupancy_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  objc_msgSend((id)a1, "exitPlanInfoOverride");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("exitPlanInfoOverride");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("exit_plan_info_override");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  if ((*(_WORD *)(a1 + 92) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("clearExitPlanInfo");
    else
      v32 = CFSTR("clear_exit_plan_info");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  v33 = *(void **)(a1 + 16);
  if (v33)
  {
    objc_msgSend(v33, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __57__GEOTransitBoardingInfoEntry__dictionaryRepresentation___block_invoke;
      v40[3] = &unk_1E1C00600;
      v37 = v36;
      v41 = v37;
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v40);
      v38 = v37;

      v35 = v38;
    }
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitBoardingInfoEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOTransitBoardingInfoEntry__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitBoardingInfoEntry)initWithDictionary:(id)a3
{
  return (GEOTransitBoardingInfoEntry *)-[GEOTransitBoardingInfoEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOFormattedString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  GEOFormattedString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOTransitListTimeInstruction *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  GEOTransitListTimeInstruction *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOTransitOccupancyInfo *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  GEOTransitExitPlanInfo *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("expectedDepartureTime");
      else
        v6 = CFSTR("expected_departure_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setExpectedDepartureTime:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("mainText");
      else
        v8 = CFSTR("main_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOFormattedString initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOFormattedString initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setMainText:", v11);

      }
      if (a3)
        v13 = CFSTR("alternativeText");
      else
        v13 = CFSTR("alternative_text");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v16 = -[GEOFormattedString initWithJSON:](v15, "initWithJSON:", v14);
        else
          v16 = -[GEOFormattedString initWithDictionary:](v15, "initWithDictionary:", v14);
        v17 = (void *)v16;
        objc_msgSend(a1, "setAlternativeText:", v16);

      }
      if (a3)
        v18 = CFSTR("mainTimeInstruction");
      else
        v18 = CFSTR("main_time_instruction");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = [GEOTransitListTimeInstruction alloc];
        if ((a3 & 1) != 0)
          v21 = -[GEOTransitListTimeInstruction initWithJSON:](v20, "initWithJSON:", v19);
        else
          v21 = -[GEOTransitListTimeInstruction initWithDictionary:](v20, "initWithDictionary:", v19);
        v22 = (void *)v21;
        objc_msgSend(a1, "setMainTimeInstruction:", v21);

      }
      if (a3)
        v23 = CFSTR("alternativeTimeInstruction");
      else
        v23 = CFSTR("alternative_time_instruction");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [GEOTransitListTimeInstruction alloc];
        if ((a3 & 1) != 0)
          v26 = -[GEOTransitListTimeInstruction initWithJSON:](v25, "initWithJSON:", v24);
        else
          v26 = -[GEOTransitListTimeInstruction initWithDictionary:](v25, "initWithDictionary:", v24);
        v27 = (void *)v26;
        objc_msgSend(a1, "setAlternativeTimeInstruction:", v26);

      }
      if (a3)
        v28 = CFSTR("occupancyInfo");
      else
        v28 = CFSTR("occupancy_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = [GEOTransitOccupancyInfo alloc];
        if ((a3 & 1) != 0)
          v31 = -[GEOTransitOccupancyInfo initWithJSON:](v30, "initWithJSON:", v29);
        else
          v31 = -[GEOTransitOccupancyInfo initWithDictionary:](v30, "initWithDictionary:", v29);
        v32 = (void *)v31;
        objc_msgSend(a1, "setOccupancyInfo:", v31);

      }
      if (a3)
        v33 = CFSTR("exitPlanInfoOverride");
      else
        v33 = CFSTR("exit_plan_info_override");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = [GEOTransitExitPlanInfo alloc];
        if ((a3 & 1) != 0)
          v36 = -[GEOTransitExitPlanInfo initWithJSON:](v35, "initWithJSON:", v34);
        else
          v36 = -[GEOTransitExitPlanInfo initWithDictionary:](v35, "initWithDictionary:", v34);
        v37 = (void *)v36;
        objc_msgSend(a1, "setExitPlanInfoOverride:", v36);

      }
      if (a3)
        v38 = CFSTR("clearExitPlanInfo");
      else
        v38 = CFSTR("clear_exit_plan_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setClearExitPlanInfo:", objc_msgSend(v39, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOTransitBoardingInfoEntry)initWithJSON:(id)a3
{
  return (GEOTransitBoardingInfoEntry *)-[GEOTransitBoardingInfoEntry _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_326;
    else
      v8 = (int *)&readAll__nonRecursiveTag_327;
    GEOTransitBoardingInfoEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitBoardingInfoEntryCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitBoardingInfoEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitBoardingInfoEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitBoardingInfoEntryIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitBoardingInfoEntry readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    v5 = v8;
    if (self->_mainText)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_alternativeText)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_mainTimeInstruction)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_alternativeTimeInstruction)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_occupancyInfo)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_exitPlanInfoOverride)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;

  v4 = (id *)a3;
  -[GEOTransitBoardingInfoEntry readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 18) = self->_readerMarkPos;
  *((_DWORD *)v4 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_expectedDepartureTime;
    *((_WORD *)v4 + 46) |= 1u;
  }
  if (self->_mainText)
    objc_msgSend(v4, "setMainText:");
  if (self->_alternativeText)
    objc_msgSend(v4, "setAlternativeText:");
  if (self->_mainTimeInstruction)
    objc_msgSend(v4, "setMainTimeInstruction:");
  if (self->_alternativeTimeInstruction)
    objc_msgSend(v4, "setAlternativeTimeInstruction:");
  if (self->_occupancyInfo)
    objc_msgSend(v4, "setOccupancyInfo:");
  if (self->_exitPlanInfoOverride)
    objc_msgSend(v4, "setExitPlanInfoOverride:");
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v4 + 88) = self->_clearExitPlanInfo;
    *((_WORD *)v4 + 46) |= 2u;
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  PBUnknownFields *v21;

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
      GEOTransitBoardingInfoEntryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitBoardingInfoEntry readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_expectedDepartureTime;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v9 = -[GEOFormattedString copyWithZone:](self->_mainText, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOFormattedString copyWithZone:](self->_alternativeText, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOTransitListTimeInstruction copyWithZone:](self->_mainTimeInstruction, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[GEOTransitListTimeInstruction copyWithZone:](self->_alternativeTimeInstruction, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = -[GEOTransitOccupancyInfo copyWithZone:](self->_occupancyInfo, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v17;

  v19 = -[GEOTransitExitPlanInfo copyWithZone:](self->_exitPlanInfoOverride, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_clearExitPlanInfo;
    *(_WORD *)(v5 + 92) |= 2u;
  }
  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOFormattedString *mainText;
  GEOFormattedString *alternativeText;
  GEOTransitListTimeInstruction *mainTimeInstruction;
  GEOTransitListTimeInstruction *alternativeTimeInstruction;
  GEOTransitOccupancyInfo *occupancyInfo;
  GEOTransitExitPlanInfo *exitPlanInfoOverride;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOTransitBoardingInfoEntry readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 46);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_expectedDepartureTime != *((_DWORD *)v4 + 21))
      goto LABEL_21;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_21;
  }
  mainText = self->_mainText;
  if ((unint64_t)mainText | *((_QWORD *)v4 + 6) && !-[GEOFormattedString isEqual:](mainText, "isEqual:"))
    goto LABEL_21;
  alternativeText = self->_alternativeText;
  if ((unint64_t)alternativeText | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOFormattedString isEqual:](alternativeText, "isEqual:"))
      goto LABEL_21;
  }
  mainTimeInstruction = self->_mainTimeInstruction;
  if ((unint64_t)mainTimeInstruction | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOTransitListTimeInstruction isEqual:](mainTimeInstruction, "isEqual:"))
      goto LABEL_21;
  }
  alternativeTimeInstruction = self->_alternativeTimeInstruction;
  if ((unint64_t)alternativeTimeInstruction | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOTransitListTimeInstruction isEqual:](alternativeTimeInstruction, "isEqual:"))
      goto LABEL_21;
  }
  occupancyInfo = self->_occupancyInfo;
  if ((unint64_t)occupancyInfo | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOTransitOccupancyInfo isEqual:](occupancyInfo, "isEqual:"))
      goto LABEL_21;
  }
  exitPlanInfoOverride = self->_exitPlanInfoOverride;
  if ((unint64_t)exitPlanInfoOverride | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOTransitExitPlanInfo isEqual:](exitPlanInfoOverride, "isEqual:"))
      goto LABEL_21;
  }
  v12 = *((_WORD *)v4 + 46);
  v13 = (v12 & 2) == 0;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v12 & 2) == 0)
    {
LABEL_21:
      v13 = 0;
      goto LABEL_22;
    }
    if (self->_clearExitPlanInfo)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_21;
    }
    v13 = 1;
  }
LABEL_22:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  -[GEOTransitBoardingInfoEntry readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_expectedDepartureTime;
  else
    v3 = 0;
  v4 = -[GEOFormattedString hash](self->_mainText, "hash");
  v5 = -[GEOFormattedString hash](self->_alternativeText, "hash");
  v6 = -[GEOTransitListTimeInstruction hash](self->_mainTimeInstruction, "hash");
  v7 = -[GEOTransitListTimeInstruction hash](self->_alternativeTimeInstruction, "hash");
  v8 = -[GEOTransitOccupancyInfo hash](self->_occupancyInfo, "hash");
  v9 = -[GEOTransitExitPlanInfo hash](self->_exitPlanInfoOverride, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v10 = 2654435761 * self->_clearExitPlanInfo;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  GEOFormattedString *mainText;
  uint64_t v6;
  GEOFormattedString *alternativeText;
  uint64_t v8;
  GEOTransitListTimeInstruction *mainTimeInstruction;
  uint64_t v10;
  GEOTransitListTimeInstruction *alternativeTimeInstruction;
  uint64_t v12;
  GEOTransitOccupancyInfo *occupancyInfo;
  uint64_t v14;
  GEOTransitExitPlanInfo *exitPlanInfoOverride;
  uint64_t v16;
  unsigned int *v17;

  v17 = (unsigned int *)a3;
  objc_msgSend(v17, "readAll:", 0);
  v4 = v17;
  if ((v17[23] & 1) != 0)
  {
    self->_expectedDepartureTime = v17[21];
    *(_WORD *)&self->_flags |= 1u;
  }
  mainText = self->_mainText;
  v6 = *((_QWORD *)v17 + 6);
  if (mainText)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOFormattedString mergeFrom:](mainText, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOTransitBoardingInfoEntry setMainText:](self, "setMainText:");
  }
  v4 = v17;
LABEL_9:
  alternativeText = self->_alternativeText;
  v8 = *((_QWORD *)v4 + 3);
  if (alternativeText)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOFormattedString mergeFrom:](alternativeText, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOTransitBoardingInfoEntry setAlternativeText:](self, "setAlternativeText:");
  }
  v4 = v17;
LABEL_15:
  mainTimeInstruction = self->_mainTimeInstruction;
  v10 = *((_QWORD *)v4 + 7);
  if (mainTimeInstruction)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOTransitListTimeInstruction mergeFrom:](mainTimeInstruction, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEOTransitBoardingInfoEntry setMainTimeInstruction:](self, "setMainTimeInstruction:");
  }
  v4 = v17;
LABEL_21:
  alternativeTimeInstruction = self->_alternativeTimeInstruction;
  v12 = *((_QWORD *)v4 + 4);
  if (alternativeTimeInstruction)
  {
    if (!v12)
      goto LABEL_27;
    -[GEOTransitListTimeInstruction mergeFrom:](alternativeTimeInstruction, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[GEOTransitBoardingInfoEntry setAlternativeTimeInstruction:](self, "setAlternativeTimeInstruction:");
  }
  v4 = v17;
LABEL_27:
  occupancyInfo = self->_occupancyInfo;
  v14 = *((_QWORD *)v4 + 8);
  if (occupancyInfo)
  {
    if (!v14)
      goto LABEL_33;
    -[GEOTransitOccupancyInfo mergeFrom:](occupancyInfo, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[GEOTransitBoardingInfoEntry setOccupancyInfo:](self, "setOccupancyInfo:");
  }
  v4 = v17;
LABEL_33:
  exitPlanInfoOverride = self->_exitPlanInfoOverride;
  v16 = *((_QWORD *)v4 + 5);
  if (exitPlanInfoOverride)
  {
    if (!v16)
      goto LABEL_39;
    -[GEOTransitExitPlanInfo mergeFrom:](exitPlanInfoOverride, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_39;
    -[GEOTransitBoardingInfoEntry setExitPlanInfoOverride:](self, "setExitPlanInfoOverride:");
  }
  v4 = v17;
LABEL_39:
  if ((v4[23] & 2) != 0)
  {
    self->_clearExitPlanInfo = *((_BYTE *)v4 + 88);
    *(_WORD *)&self->_flags |= 2u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitBoardingInfoEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_330);
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
  *(_WORD *)&self->_flags |= 0x204u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitBoardingInfoEntry readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_mainText, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_alternativeText, "clearUnknownFields:", 1);
    -[GEOTransitListTimeInstruction clearUnknownFields:](self->_mainTimeInstruction, "clearUnknownFields:", 1);
    -[GEOTransitListTimeInstruction clearUnknownFields:](self->_alternativeTimeInstruction, "clearUnknownFields:", 1);
    -[GEOTransitOccupancyInfo clearUnknownFields:](self->_occupancyInfo, "clearUnknownFields:", 1);
    -[GEOTransitExitPlanInfo clearUnknownFields:](self->_exitPlanInfoOverride, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occupancyInfo, 0);
  objc_storeStrong((id *)&self->_mainTimeInstruction, 0);
  objc_storeStrong((id *)&self->_mainText, 0);
  objc_storeStrong((id *)&self->_exitPlanInfoOverride, 0);
  objc_storeStrong((id *)&self->_alternativeTimeInstruction, 0);
  objc_storeStrong((id *)&self->_alternativeText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
