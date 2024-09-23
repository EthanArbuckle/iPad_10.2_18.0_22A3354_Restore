@implementation GEODrivingWalkingSpokenInstruction

- (GEODrivingWalkingSpokenInstruction)init
{
  GEODrivingWalkingSpokenInstruction *v2;
  GEODrivingWalkingSpokenInstruction *v3;
  GEODrivingWalkingSpokenInstruction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEODrivingWalkingSpokenInstruction;
  v2 = -[GEODrivingWalkingSpokenInstruction init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODrivingWalkingSpokenInstruction)initWithData:(id)a3
{
  GEODrivingWalkingSpokenInstruction *v3;
  GEODrivingWalkingSpokenInstruction *v4;
  GEODrivingWalkingSpokenInstruction *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEODrivingWalkingSpokenInstruction;
  v3 = -[GEODrivingWalkingSpokenInstruction initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readProceedStage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProceedStage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasProceedStage
{
  -[GEODrivingWalkingSpokenInstruction _readProceedStage]((uint64_t)self);
  return self->_proceedStage != 0;
}

- (GEOFormattedString)proceedStage
{
  -[GEODrivingWalkingSpokenInstruction _readProceedStage]((uint64_t)self);
  return self->_proceedStage;
}

- (void)setProceedStage:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_proceedStage, a3);
}

- (void)_readContinueStage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContinueStage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasContinueStage
{
  -[GEODrivingWalkingSpokenInstruction _readContinueStage]((uint64_t)self);
  return self->_continueStage != 0;
}

- (GEOFormattedString)continueStage
{
  -[GEODrivingWalkingSpokenInstruction _readContinueStage]((uint64_t)self);
  return self->_continueStage;
}

- (void)setContinueStage:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_continueStage, a3);
}

- (void)_readInitialStage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInitialStage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasInitialStage
{
  -[GEODrivingWalkingSpokenInstruction _readInitialStage]((uint64_t)self);
  return self->_initialStage != 0;
}

- (GEOFormattedString)initialStage
{
  -[GEODrivingWalkingSpokenInstruction _readInitialStage]((uint64_t)self);
  return self->_initialStage;
}

- (void)setInitialStage:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_initialStage, a3);
}

- (void)_readPreparationStage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreparationStage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPreparationStage
{
  -[GEODrivingWalkingSpokenInstruction _readPreparationStage]((uint64_t)self);
  return self->_preparationStage != 0;
}

- (GEOFormattedString)preparationStage
{
  -[GEODrivingWalkingSpokenInstruction _readPreparationStage]((uint64_t)self);
  return self->_preparationStage;
}

- (void)setPreparationStage:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_preparationStage, a3);
}

- (void)_readExecutionStages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingSpokenInstructionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExecutionStages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)executionStages
{
  -[GEODrivingWalkingSpokenInstruction _readExecutionStages]((uint64_t)self);
  return self->_executionStages;
}

- (void)setExecutionStages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *executionStages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  executionStages = self->_executionStages;
  self->_executionStages = v4;

}

- (void)clearExecutionStages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_executionStages, "removeAllObjects");
}

- (void)addExecutionStage:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODrivingWalkingSpokenInstruction _readExecutionStages]((uint64_t)self);
  -[GEODrivingWalkingSpokenInstruction _addNoFlagsExecutionStage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsExecutionStage:(uint64_t)a1
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

- (unint64_t)executionStagesCount
{
  -[GEODrivingWalkingSpokenInstruction _readExecutionStages]((uint64_t)self);
  return -[NSMutableArray count](self->_executionStages, "count");
}

- (id)executionStageAtIndex:(unint64_t)a3
{
  -[GEODrivingWalkingSpokenInstruction _readExecutionStages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_executionStages, "objectAtIndex:", a3);
}

+ (Class)executionStageType
{
  return (Class)objc_opt_class();
}

- (unsigned)shortChainedInstructionIndex
{
  return self->_shortChainedInstructionIndex;
}

- (void)setShortChainedInstructionIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_shortChainedInstructionIndex = a3;
}

- (void)setHasShortChainedInstructionIndex:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasShortChainedInstructionIndex
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEODrivingWalkingSpokenInstruction;
  -[GEODrivingWalkingSpokenInstruction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODrivingWalkingSpokenInstruction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODrivingWalkingSpokenInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "proceedStage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("proceedStage");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("proceed_stage");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "continueStage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("continueStage");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("continue_stage");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "initialStage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("initialStage");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("initial_stage");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "preparationStage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("preparationStage");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("preparation_stage");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v22 = *(id *)(a1 + 32);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v27, "jsonRepresentation");
          else
            objc_msgSend(v27, "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v24);
    }

    if (a2)
      v29 = CFSTR("executionStage");
    else
      v29 = CFSTR("execution_stage");
    objc_msgSend(v4, "setObject:forKey:", v21, v29);

  }
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("shortChainedInstructionIndex");
    else
      v31 = CFSTR("short_chained_instruction_index");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  v32 = *(void **)(a1 + 16);
  if (v32)
  {
    objc_msgSend(v32, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v33, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __64__GEODrivingWalkingSpokenInstruction__dictionaryRepresentation___block_invoke;
      v39[3] = &unk_1E1C00600;
      v36 = v35;
      v40 = v36;
      objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v39);
      v37 = v36;

      v34 = v37;
    }
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEODrivingWalkingSpokenInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEODrivingWalkingSpokenInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEODrivingWalkingSpokenInstruction)initWithDictionary:(id)a3
{
  return (GEODrivingWalkingSpokenInstruction *)-[GEODrivingWalkingSpokenInstruction _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOFormattedString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOFormattedString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOFormattedString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEOFormattedString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  GEOFormattedString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
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
        v6 = CFSTR("proceedStage");
      else
        v6 = CFSTR("proceed_stage");
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
        objc_msgSend(a1, "setProceedStage:", v9);

      }
      if (a3)
        v11 = CFSTR("continueStage");
      else
        v11 = CFSTR("continue_stage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOFormattedString initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOFormattedString initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setContinueStage:", v14);

      }
      if (a3)
        v16 = CFSTR("initialStage");
      else
        v16 = CFSTR("initial_stage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEOFormattedString initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEOFormattedString initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setInitialStage:", v19);

      }
      if (a3)
        v21 = CFSTR("preparationStage");
      else
        v21 = CFSTR("preparation_stage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEOFormattedString initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEOFormattedString initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setPreparationStage:", v24);

      }
      if (a3)
        v26 = CFSTR("executionStage");
      else
        v26 = CFSTR("execution_stage");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = v5;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v28 = v27;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v42 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v34 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v35 = -[GEOFormattedString initWithJSON:](v34, "initWithJSON:", v33);
                else
                  v35 = -[GEOFormattedString initWithDictionary:](v34, "initWithDictionary:", v33);
                v36 = (void *)v35;
                objc_msgSend(a1, "addExecutionStage:", v35);

              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v30);
        }

        v5 = v40;
      }

      if (a3)
        v37 = CFSTR("shortChainedInstructionIndex");
      else
        v37 = CFSTR("short_chained_instruction_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setShortChainedInstructionIndex:", objc_msgSend(v38, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEODrivingWalkingSpokenInstruction)initWithJSON:(id)a3
{
  return (GEODrivingWalkingSpokenInstruction *)-[GEODrivingWalkingSpokenInstruction _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1273;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1274;
    GEODrivingWalkingSpokenInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEODrivingWalkingSpokenInstructionCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODrivingWalkingSpokenInstructionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODrivingWalkingSpokenInstructionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  if (self->_reader && (_GEODrivingWalkingSpokenInstructionIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEODrivingWalkingSpokenInstruction readAll:](self, "readAll:", 0);
    if (self->_proceedStage)
      PBDataWriterWriteSubmessage();
    if (self->_continueStage)
      PBDataWriterWriteSubmessage();
    if (self->_initialStage)
      PBDataWriterWriteSubmessage();
    if (self->_preparationStage)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_executionStages;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
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
  -[GEODrivingWalkingSpokenInstruction readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_proceedStage)
    objc_msgSend(v8, "setProceedStage:");
  if (self->_continueStage)
    objc_msgSend(v8, "setContinueStage:");
  if (self->_initialStage)
    objc_msgSend(v8, "setInitialStage:");
  if (self->_preparationStage)
    objc_msgSend(v8, "setPreparationStage:");
  if (-[GEODrivingWalkingSpokenInstruction executionStagesCount](self, "executionStagesCount"))
  {
    objc_msgSend(v8, "clearExecutionStages");
    v4 = -[GEODrivingWalkingSpokenInstruction executionStagesCount](self, "executionStagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEODrivingWalkingSpokenInstruction executionStageAtIndex:](self, "executionStageAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addExecutionStage:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v8 + 19) = self->_shortChainedInstructionIndex;
    *((_BYTE *)v8 + 80) |= 1u;
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
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  PBUnknownFields *v22;
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
      GEODrivingWalkingSpokenInstructionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEODrivingWalkingSpokenInstruction readAll:](self, "readAll:", 0);
  v9 = -[GEOFormattedString copyWithZone:](self->_proceedStage, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[GEOFormattedString copyWithZone:](self->_continueStage, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOFormattedString copyWithZone:](self->_initialStage, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[GEOFormattedString copyWithZone:](self->_preparationStage, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_executionStages;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addExecutionStage:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_shortChainedInstructionIndex;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v22 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOFormattedString *proceedStage;
  GEOFormattedString *continueStage;
  GEOFormattedString *initialStage;
  GEOFormattedString *preparationStage;
  NSMutableArray *executionStages;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEODrivingWalkingSpokenInstruction readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  proceedStage = self->_proceedStage;
  if ((unint64_t)proceedStage | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOFormattedString isEqual:](proceedStage, "isEqual:"))
      goto LABEL_16;
  }
  continueStage = self->_continueStage;
  if ((unint64_t)continueStage | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOFormattedString isEqual:](continueStage, "isEqual:"))
      goto LABEL_16;
  }
  initialStage = self->_initialStage;
  if ((unint64_t)initialStage | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOFormattedString isEqual:](initialStage, "isEqual:"))
      goto LABEL_16;
  }
  preparationStage = self->_preparationStage;
  if ((unint64_t)preparationStage | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOFormattedString isEqual:](preparationStage, "isEqual:"))
      goto LABEL_16;
  }
  executionStages = self->_executionStages;
  if ((unint64_t)executionStages | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](executionStages, "isEqual:"))
      goto LABEL_16;
  }
  v10 = (*((_BYTE *)v4 + 80) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) != 0 && self->_shortChainedInstructionIndex == *((_DWORD *)v4 + 19))
    {
      v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEODrivingWalkingSpokenInstruction readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_proceedStage, "hash");
  v4 = -[GEOFormattedString hash](self->_continueStage, "hash");
  v5 = -[GEOFormattedString hash](self->_initialStage, "hash");
  v6 = -[GEOFormattedString hash](self->_preparationStage, "hash");
  v7 = -[NSMutableArray hash](self->_executionStages, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v8 = 2654435761 * self->_shortChainedInstructionIndex;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOFormattedString *proceedStage;
  uint64_t v6;
  GEOFormattedString *continueStage;
  uint64_t v8;
  GEOFormattedString *initialStage;
  uint64_t v10;
  GEOFormattedString *preparationStage;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  proceedStage = self->_proceedStage;
  v6 = *((_QWORD *)v4 + 7);
  if (proceedStage)
  {
    if (v6)
      -[GEOFormattedString mergeFrom:](proceedStage, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEODrivingWalkingSpokenInstruction setProceedStage:](self, "setProceedStage:");
  }
  continueStage = self->_continueStage;
  v8 = *((_QWORD *)v4 + 3);
  if (continueStage)
  {
    if (v8)
      -[GEOFormattedString mergeFrom:](continueStage, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEODrivingWalkingSpokenInstruction setContinueStage:](self, "setContinueStage:");
  }
  initialStage = self->_initialStage;
  v10 = *((_QWORD *)v4 + 5);
  if (initialStage)
  {
    if (v10)
      -[GEOFormattedString mergeFrom:](initialStage, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEODrivingWalkingSpokenInstruction setInitialStage:](self, "setInitialStage:");
  }
  preparationStage = self->_preparationStage;
  v12 = *((_QWORD *)v4 + 6);
  if (preparationStage)
  {
    if (v12)
      -[GEOFormattedString mergeFrom:](preparationStage, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEODrivingWalkingSpokenInstruction setPreparationStage:](self, "setPreparationStage:");
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = *((id *)v4 + 4);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[GEODrivingWalkingSpokenInstruction addExecutionStage:](self, "addExecutionStage:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_shortChainedInstructionIndex = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEODrivingWalkingSpokenInstructionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1277);
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
  *(_BYTE *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEODrivingWalkingSpokenInstruction readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_proceedStage, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_continueStage, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_initialStage, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_preparationStage, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_executionStages;
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

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proceedStage, 0);
  objc_storeStrong((id *)&self->_preparationStage, 0);
  objc_storeStrong((id *)&self->_initialStage, 0);
  objc_storeStrong((id *)&self->_executionStages, 0);
  objc_storeStrong((id *)&self->_continueStage, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
