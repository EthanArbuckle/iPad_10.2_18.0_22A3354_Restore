@implementation GEOInstructionSet

- (GEOInstructionSet)init
{
  GEOInstructionSet *v2;
  GEOInstructionSet *v3;
  GEOInstructionSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOInstructionSet;
  v2 = -[GEOInstructionSet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOInstructionSet)initWithData:(id)a3
{
  GEOInstructionSet *v3;
  GEOInstructionSet *v4;
  GEOInstructionSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOInstructionSet;
  v3 = -[GEOInstructionSet initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTransitSignInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitSignInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTransitSignInstruction
{
  -[GEOInstructionSet _readTransitSignInstruction]((uint64_t)self);
  return self->_transitSignInstruction != 0;
}

- (GEOTransitSignInstruction)transitSignInstruction
{
  -[GEOInstructionSet _readTransitSignInstruction]((uint64_t)self);
  return self->_transitSignInstruction;
}

- (void)setTransitSignInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_transitSignInstruction, a3);
}

- (void)_readTransitListInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitListInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasTransitListInstruction
{
  -[GEOInstructionSet _readTransitListInstruction]((uint64_t)self);
  return self->_transitListInstruction != 0;
}

- (GEOTransitListInstruction)transitListInstruction
{
  -[GEOInstructionSet _readTransitListInstruction]((uint64_t)self);
  return self->_transitListInstruction;
}

- (void)setTransitListInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_transitListInstruction, a3);
}

- (void)_readGenericInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGenericInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasGenericInstruction
{
  -[GEOInstructionSet _readGenericInstruction]((uint64_t)self);
  return self->_genericInstruction != 0;
}

- (GEOGenericInstruction)genericInstruction
{
  -[GEOInstructionSet _readGenericInstruction]((uint64_t)self);
  return self->_genericInstruction;
}

- (void)setGenericInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_genericInstruction, a3);
}

- (void)_readDepartureBar
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDepartureBar_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDepartureBar
{
  -[GEOInstructionSet _readDepartureBar]((uint64_t)self);
  return self->_departureBar != 0;
}

- (GEOFormattedString)departureBar
{
  -[GEOInstructionSet _readDepartureBar]((uint64_t)self);
  return self->_departureBar;
}

- (void)setDepartureBar:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_departureBar, a3);
}

- (int)departureBarStyle
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_departureBarStyle;
  else
    return 0;
}

- (void)setDepartureBarStyle:(int)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_departureBarStyle = a3;
}

- (void)setHasDepartureBarStyle:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasDepartureBarStyle
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)departureBarStyleAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C08298[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDepartureBarStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL_TIME_ON_TIME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL_TIME_DELAYS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLICKABLE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCountStopsText
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountStopsText_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasCountStopsText
{
  -[GEOInstructionSet _readCountStopsText]((uint64_t)self);
  return self->_countStopsText != 0;
}

- (GEOFormattedString)countStopsText
{
  -[GEOInstructionSet _readCountStopsText]((uint64_t)self);
  return self->_countStopsText;
}

- (void)setCountStopsText:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_countStopsText, a3);
}

- (void)_readDrivingWalkingSignInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDrivingWalkingSignInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDrivingWalkingSignInstruction
{
  -[GEOInstructionSet _readDrivingWalkingSignInstruction]((uint64_t)self);
  return self->_drivingWalkingSignInstruction != 0;
}

- (GEODrivingWalkingInstruction)drivingWalkingSignInstruction
{
  -[GEOInstructionSet _readDrivingWalkingSignInstruction]((uint64_t)self);
  return self->_drivingWalkingSignInstruction;
}

- (void)setDrivingWalkingSignInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_drivingWalkingSignInstruction, a3);
}

- (void)_readDrivingWalkingListInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDrivingWalkingListInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDrivingWalkingListInstruction
{
  -[GEOInstructionSet _readDrivingWalkingListInstruction]((uint64_t)self);
  return self->_drivingWalkingListInstruction != 0;
}

- (GEODrivingWalkingInstruction)drivingWalkingListInstruction
{
  -[GEOInstructionSet _readDrivingWalkingListInstruction]((uint64_t)self);
  return self->_drivingWalkingListInstruction;
}

- (void)setDrivingWalkingListInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_drivingWalkingListInstruction, a3);
}

- (void)_readDrivingWalkingSpokenInstruction
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOInstructionSetReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDrivingWalkingSpokenInstruction_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasDrivingWalkingSpokenInstruction
{
  -[GEOInstructionSet _readDrivingWalkingSpokenInstruction]((uint64_t)self);
  return self->_drivingWalkingSpokenInstruction != 0;
}

- (GEODrivingWalkingSpokenInstruction)drivingWalkingSpokenInstruction
{
  -[GEOInstructionSet _readDrivingWalkingSpokenInstruction]((uint64_t)self);
  return self->_drivingWalkingSpokenInstruction;
}

- (void)setDrivingWalkingSpokenInstruction:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_drivingWalkingSpokenInstruction, a3);
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
  v8.super_class = (Class)GEOInstructionSet;
  -[GEOInstructionSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOInstructionSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOInstructionSet _dictionaryRepresentation:]((uint64_t)self, 0);
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
  uint64_t v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v47[4];
  id v48;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "transitSignInstruction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("transitSignInstruction");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("transit_sign_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "transitListInstruction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("transitListInstruction");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("transit_list_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "genericInstruction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("genericInstruction");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("generic_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "departureBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("departureBar");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("departure_bar");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if ((*(_WORD *)(a1 + 104) & 1) != 0)
  {
    v21 = *(int *)(a1 + 100);
    if (v21 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 100));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E1C08298[v21];
    }
    if (a2)
      v23 = CFSTR("departureBarStyle");
    else
      v23 = CFSTR("departure_bar_style");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  objc_msgSend((id)a1, "countStopsText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("countStopsText");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("count_stops_text");
    }
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

  }
  objc_msgSend((id)a1, "drivingWalkingSignInstruction");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "jsonRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("drivingWalkingSignInstruction");
    }
    else
    {
      objc_msgSend(v28, "dictionaryRepresentation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = CFSTR("driving_walking_sign_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  objc_msgSend((id)a1, "drivingWalkingListInstruction");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "jsonRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("drivingWalkingListInstruction");
    }
    else
    {
      objc_msgSend(v32, "dictionaryRepresentation");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = CFSTR("driving_walking_list_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  objc_msgSend((id)a1, "drivingWalkingSpokenInstruction");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v36, "jsonRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("drivingWalkingSpokenInstruction");
    }
    else
    {
      objc_msgSend(v36, "dictionaryRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = CFSTR("driving_walking_spoken_instruction");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __47__GEOInstructionSet__dictionaryRepresentation___block_invoke;
      v47[3] = &unk_1E1C00600;
      v44 = v43;
      v48 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v47);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOInstructionSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOInstructionSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOInstructionSet)initWithDictionary:(id)a3
{
  return (GEOInstructionSet *)-[GEOInstructionSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOTransitSignInstruction *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOTransitListInstruction *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEOGenericInstruction *v18;
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
  const __CFString *v30;
  void *v31;
  GEOFormattedString *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEODrivingWalkingInstruction *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  GEODrivingWalkingInstruction *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  GEODrivingWalkingSpokenInstruction *v45;
  uint64_t v46;
  void *v47;

  v5 = a2;
  if (!a1)
    goto LABEL_83;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_83;
  if (a3)
    v6 = CFSTR("transitSignInstruction");
  else
    v6 = CFSTR("transit_sign_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOTransitSignInstruction alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOTransitSignInstruction initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOTransitSignInstruction initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setTransitSignInstruction:", v9);

  }
  if (a3)
    v11 = CFSTR("transitListInstruction");
  else
    v11 = CFSTR("transit_list_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOTransitListInstruction alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEOTransitListInstruction initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEOTransitListInstruction initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setTransitListInstruction:", v14);

  }
  if (a3)
    v16 = CFSTR("genericInstruction");
  else
    v16 = CFSTR("generic_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOGenericInstruction alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOGenericInstruction initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOGenericInstruction initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setGenericInstruction:", v19);

  }
  if (a3)
    v21 = CFSTR("departureBar");
  else
    v21 = CFSTR("departure_bar");
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
    objc_msgSend(a1, "setDepartureBar:", v24);

  }
  if (a3)
    v26 = CFSTR("departureBarStyle");
  else
    v26 = CFSTR("departure_bar_style");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    {
      v29 = 0;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("REAL_TIME_ON_TIME")) & 1) != 0)
    {
      v29 = 1;
    }
    else if ((objc_msgSend(v28, "isEqualToString:", CFSTR("REAL_TIME_DELAYS")) & 1) != 0)
    {
      v29 = 2;
    }
    else if (objc_msgSend(v28, "isEqualToString:", CFSTR("CLICKABLE")))
    {
      v29 = 3;
    }
    else
    {
      v29 = 0;
    }

    goto LABEL_51;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = objc_msgSend(v27, "intValue");
LABEL_51:
    objc_msgSend(a1, "setDepartureBarStyle:", v29);
  }

  if (a3)
    v30 = CFSTR("countStopsText");
  else
    v30 = CFSTR("count_stops_text");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEOFormattedString alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEOFormattedString initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEOFormattedString initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setCountStopsText:", v33);

  }
  if (a3)
    v35 = CFSTR("drivingWalkingSignInstruction");
  else
    v35 = CFSTR("driving_walking_sign_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = [GEODrivingWalkingInstruction alloc];
    if (v37)
      v38 = (void *)-[GEODrivingWalkingInstruction _initWithDictionary:isJSON:](v37, v36, a3);
    else
      v38 = 0;
    objc_msgSend(a1, "setDrivingWalkingSignInstruction:", v38);

  }
  if (a3)
    v39 = CFSTR("drivingWalkingListInstruction");
  else
    v39 = CFSTR("driving_walking_list_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = [GEODrivingWalkingInstruction alloc];
    if (v41)
      v42 = (void *)-[GEODrivingWalkingInstruction _initWithDictionary:isJSON:](v41, v40, a3);
    else
      v42 = 0;
    objc_msgSend(a1, "setDrivingWalkingListInstruction:", v42);

  }
  if (a3)
    v43 = CFSTR("drivingWalkingSpokenInstruction");
  else
    v43 = CFSTR("driving_walking_spoken_instruction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v45 = [GEODrivingWalkingSpokenInstruction alloc];
    if ((a3 & 1) != 0)
      v46 = -[GEODrivingWalkingSpokenInstruction initWithJSON:](v45, "initWithJSON:", v44);
    else
      v46 = -[GEODrivingWalkingSpokenInstruction initWithDictionary:](v45, "initWithDictionary:", v44);
    v47 = (void *)v46;
    objc_msgSend(a1, "setDrivingWalkingSpokenInstruction:", v46);

  }
LABEL_83:

  return a1;
}

- (GEOInstructionSet)initWithJSON:(id)a3
{
  return (GEOInstructionSet *)-[GEOInstructionSet _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2675;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2676;
    GEOInstructionSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOInstructionSetCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOInstructionSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOInstructionSetReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOInstructionSetIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOInstructionSet readAll:](self, "readAll:", 0);
    if (self->_transitSignInstruction)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_transitListInstruction)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_genericInstruction)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_departureBar)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v8;
    }
    if (self->_countStopsText)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_drivingWalkingSignInstruction)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_drivingWalkingListInstruction)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_drivingWalkingSpokenInstruction)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOInstructionSet readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 22) = self->_readerMarkPos;
  *((_DWORD *)v5 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_transitSignInstruction)
    objc_msgSend(v5, "setTransitSignInstruction:");
  if (self->_transitListInstruction)
    objc_msgSend(v5, "setTransitListInstruction:");
  v4 = v5;
  if (self->_genericInstruction)
  {
    objc_msgSend(v5, "setGenericInstruction:");
    v4 = v5;
  }
  if (self->_departureBar)
  {
    objc_msgSend(v5, "setDepartureBar:");
    v4 = v5;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_departureBarStyle;
    *((_WORD *)v4 + 52) |= 1u;
  }
  if (self->_countStopsText)
  {
    objc_msgSend(v5, "setCountStopsText:");
    v4 = v5;
  }
  if (self->_drivingWalkingSignInstruction)
  {
    objc_msgSend(v5, "setDrivingWalkingSignInstruction:");
    v4 = v5;
  }
  if (self->_drivingWalkingListInstruction)
  {
    objc_msgSend(v5, "setDrivingWalkingListInstruction:");
    v4 = v5;
  }
  if (self->_drivingWalkingSpokenInstruction)
  {
    objc_msgSend(v5, "setDrivingWalkingSpokenInstruction:");
    v4 = v5;
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
  id v21;
  void *v22;
  id v23;
  void *v24;
  PBUnknownFields *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOInstructionSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOInstructionSet readAll:](self, "readAll:", 0);
  v9 = -[GEOTransitSignInstruction copyWithZone:](self->_transitSignInstruction, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[GEOTransitListInstruction copyWithZone:](self->_transitListInstruction, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = -[GEOGenericInstruction copyWithZone:](self->_genericInstruction, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v13;

  v15 = -[GEOFormattedString copyWithZone:](self->_departureBar, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_departureBarStyle;
    *(_WORD *)(v5 + 104) |= 1u;
  }
  v17 = -[GEOFormattedString copyWithZone:](self->_countStopsText, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = -[GEODrivingWalkingInstruction copyWithZone:](self->_drivingWalkingSignInstruction, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v19;

  v21 = -[GEODrivingWalkingInstruction copyWithZone:](self->_drivingWalkingListInstruction, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v21;

  v23 = -[GEODrivingWalkingSpokenInstruction copyWithZone:](self->_drivingWalkingSpokenInstruction, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v23;

  v25 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOTransitSignInstruction *transitSignInstruction;
  GEOTransitListInstruction *transitListInstruction;
  GEOGenericInstruction *genericInstruction;
  GEOFormattedString *departureBar;
  __int16 v9;
  GEOFormattedString *countStopsText;
  GEODrivingWalkingInstruction *drivingWalkingSignInstruction;
  GEODrivingWalkingInstruction *drivingWalkingListInstruction;
  GEODrivingWalkingSpokenInstruction *drivingWalkingSpokenInstruction;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEOInstructionSet readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  transitSignInstruction = self->_transitSignInstruction;
  if ((unint64_t)transitSignInstruction | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOTransitSignInstruction isEqual:](transitSignInstruction, "isEqual:"))
      goto LABEL_23;
  }
  transitListInstruction = self->_transitListInstruction;
  if ((unint64_t)transitListInstruction | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOTransitListInstruction isEqual:](transitListInstruction, "isEqual:"))
      goto LABEL_23;
  }
  genericInstruction = self->_genericInstruction;
  if ((unint64_t)genericInstruction | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOGenericInstruction isEqual:](genericInstruction, "isEqual:"))
      goto LABEL_23;
  }
  departureBar = self->_departureBar;
  if ((unint64_t)departureBar | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOFormattedString isEqual:](departureBar, "isEqual:"))
      goto LABEL_23;
  }
  v9 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_departureBarStyle != *((_DWORD *)v4 + 25))
      goto LABEL_23;
  }
  else if ((v9 & 1) != 0)
  {
LABEL_23:
    v14 = 0;
    goto LABEL_24;
  }
  countStopsText = self->_countStopsText;
  if ((unint64_t)countStopsText | *((_QWORD *)v4 + 3)
    && !-[GEOFormattedString isEqual:](countStopsText, "isEqual:"))
  {
    goto LABEL_23;
  }
  drivingWalkingSignInstruction = self->_drivingWalkingSignInstruction;
  if ((unint64_t)drivingWalkingSignInstruction | *((_QWORD *)v4 + 6))
  {
    if (!-[GEODrivingWalkingInstruction isEqual:](drivingWalkingSignInstruction, "isEqual:"))
      goto LABEL_23;
  }
  drivingWalkingListInstruction = self->_drivingWalkingListInstruction;
  if ((unint64_t)drivingWalkingListInstruction | *((_QWORD *)v4 + 5))
  {
    if (!-[GEODrivingWalkingInstruction isEqual:](drivingWalkingListInstruction, "isEqual:"))
      goto LABEL_23;
  }
  drivingWalkingSpokenInstruction = self->_drivingWalkingSpokenInstruction;
  if ((unint64_t)drivingWalkingSpokenInstruction | *((_QWORD *)v4 + 7))
    v14 = -[GEODrivingWalkingSpokenInstruction isEqual:](drivingWalkingSpokenInstruction, "isEqual:");
  else
    v14 = 1;
LABEL_24:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  -[GEOInstructionSet readAll:](self, "readAll:", 1);
  v3 = -[GEOTransitSignInstruction hash](self->_transitSignInstruction, "hash");
  v4 = -[GEOTransitListInstruction hash](self->_transitListInstruction, "hash");
  v5 = -[GEOGenericInstruction hash](self->_genericInstruction, "hash");
  v6 = -[GEOFormattedString hash](self->_departureBar, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_departureBarStyle;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[GEOFormattedString hash](self->_countStopsText, "hash");
  v10 = v8 ^ v9 ^ -[GEODrivingWalkingInstruction hash](self->_drivingWalkingSignInstruction, "hash");
  v11 = -[GEODrivingWalkingInstruction hash](self->_drivingWalkingListInstruction, "hash");
  return v10 ^ v11 ^ -[GEODrivingWalkingSpokenInstruction hash](self->_drivingWalkingSpokenInstruction, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOTransitSignInstruction *transitSignInstruction;
  uint64_t v6;
  GEOTransitListInstruction *transitListInstruction;
  uint64_t v8;
  GEOGenericInstruction *genericInstruction;
  uint64_t v10;
  GEOFormattedString *departureBar;
  uint64_t v12;
  GEOFormattedString *countStopsText;
  uint64_t v14;
  GEODrivingWalkingInstruction *drivingWalkingSignInstruction;
  void *v16;
  GEODrivingWalkingInstruction *drivingWalkingListInstruction;
  void *v18;
  GEODrivingWalkingSpokenInstruction *drivingWalkingSpokenInstruction;
  uint64_t v20;
  _QWORD *v21;

  v21 = a3;
  objc_msgSend(v21, "readAll:", 0);
  v4 = v21;
  transitSignInstruction = self->_transitSignInstruction;
  v6 = v21[10];
  if (transitSignInstruction)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOTransitSignInstruction mergeFrom:](transitSignInstruction, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOInstructionSet setTransitSignInstruction:](self, "setTransitSignInstruction:");
  }
  v4 = v21;
LABEL_7:
  transitListInstruction = self->_transitListInstruction;
  v8 = v4[9];
  if (transitListInstruction)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOTransitListInstruction mergeFrom:](transitListInstruction, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOInstructionSet setTransitListInstruction:](self, "setTransitListInstruction:");
  }
  v4 = v21;
LABEL_13:
  genericInstruction = self->_genericInstruction;
  v10 = v4[8];
  if (genericInstruction)
  {
    if (!v10)
      goto LABEL_19;
    -[GEOGenericInstruction mergeFrom:](genericInstruction, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[GEOInstructionSet setGenericInstruction:](self, "setGenericInstruction:");
  }
  v4 = v21;
LABEL_19:
  departureBar = self->_departureBar;
  v12 = v4[4];
  if (departureBar)
  {
    if (!v12)
      goto LABEL_25;
    -[GEOFormattedString mergeFrom:](departureBar, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_25;
    -[GEOInstructionSet setDepartureBar:](self, "setDepartureBar:");
  }
  v4 = v21;
LABEL_25:
  if ((v4[13] & 1) != 0)
  {
    self->_departureBarStyle = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 1u;
  }
  countStopsText = self->_countStopsText;
  v14 = v4[3];
  if (countStopsText)
  {
    if (!v14)
      goto LABEL_33;
    -[GEOFormattedString mergeFrom:](countStopsText, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[GEOInstructionSet setCountStopsText:](self, "setCountStopsText:");
  }
  v4 = v21;
LABEL_33:
  drivingWalkingSignInstruction = self->_drivingWalkingSignInstruction;
  v16 = (void *)v4[6];
  if (drivingWalkingSignInstruction)
  {
    if (!v16)
      goto LABEL_39;
    -[GEODrivingWalkingInstruction mergeFrom:](drivingWalkingSignInstruction, v16);
  }
  else
  {
    if (!v16)
      goto LABEL_39;
    -[GEOInstructionSet setDrivingWalkingSignInstruction:](self, "setDrivingWalkingSignInstruction:", v4[6]);
  }
  v4 = v21;
LABEL_39:
  drivingWalkingListInstruction = self->_drivingWalkingListInstruction;
  v18 = (void *)v4[5];
  if (drivingWalkingListInstruction)
  {
    if (!v18)
      goto LABEL_45;
    -[GEODrivingWalkingInstruction mergeFrom:](drivingWalkingListInstruction, v18);
  }
  else
  {
    if (!v18)
      goto LABEL_45;
    -[GEOInstructionSet setDrivingWalkingListInstruction:](self, "setDrivingWalkingListInstruction:", v4[5]);
  }
  v4 = v21;
LABEL_45:
  drivingWalkingSpokenInstruction = self->_drivingWalkingSpokenInstruction;
  v20 = v4[7];
  if (drivingWalkingSpokenInstruction)
  {
    if (v20)
    {
      -[GEODrivingWalkingSpokenInstruction mergeFrom:](drivingWalkingSpokenInstruction, "mergeFrom:");
LABEL_50:
      v4 = v21;
    }
  }
  else if (v20)
  {
    -[GEOInstructionSet setDrivingWalkingSpokenInstruction:](self, "setDrivingWalkingSpokenInstruction:");
    goto LABEL_50;
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
      GEOInstructionSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2679);
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
  *(_WORD *)&self->_flags |= 0x402u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOInstructionSet readAll:](self, "readAll:", 0);
    -[GEOTransitSignInstruction clearUnknownFields:](self->_transitSignInstruction, "clearUnknownFields:", 1);
    -[GEOTransitListInstruction clearUnknownFields:](self->_transitListInstruction, "clearUnknownFields:", 1);
    -[GEOGenericInstruction clearUnknownFields:](self->_genericInstruction, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_departureBar, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_countStopsText, "clearUnknownFields:", 1);
    -[GEODrivingWalkingInstruction clearUnknownFields:]((uint64_t)self->_drivingWalkingSignInstruction);
    -[GEODrivingWalkingInstruction clearUnknownFields:]((uint64_t)self->_drivingWalkingListInstruction);
    -[GEODrivingWalkingSpokenInstruction clearUnknownFields:](self->_drivingWalkingSpokenInstruction, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSignInstruction, 0);
  objc_storeStrong((id *)&self->_transitListInstruction, 0);
  objc_storeStrong((id *)&self->_genericInstruction, 0);
  objc_storeStrong((id *)&self->_drivingWalkingSpokenInstruction, 0);
  objc_storeStrong((id *)&self->_drivingWalkingSignInstruction, 0);
  objc_storeStrong((id *)&self->_drivingWalkingListInstruction, 0);
  objc_storeStrong((id *)&self->_departureBar, 0);
  objc_storeStrong((id *)&self->_countStopsText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (BOOL)_transit_hasAnyFieldSet
{
  return -[GEOInstructionSet hasDepartureBar](self, "hasDepartureBar")
      || -[GEOInstructionSet hasDepartureBarStyle](self, "hasDepartureBarStyle")
      || -[GEOInstructionSet hasCountStopsText](self, "hasCountStopsText")
      || -[GEOInstructionSet hasTransitListInstruction](self, "hasTransitListInstruction")
      || -[GEOInstructionSet hasTransitSignInstruction](self, "hasTransitSignInstruction");
}

- (void)_transit_mergeFrom:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;

  v44 = a3;
  -[GEOInstructionSet departureBar](self, "departureBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "departureBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (!v7)
  {
    v11 = v6;
    goto LABEL_19;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v8 = (id)_MergedGlobals_219;
  v9 = v7;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v9, "conformsToProtocol:", _MergedGlobals_219))
  {
    v10 = objc_msgSend(v9, "_transit_hasAnyFieldSet");

    if ((v10 & 1) != 0)
    {
LABEL_14:
      if (objc_msgSend(v9, "conformsToProtocol:", v8)
        && objc_msgSend(v6, "conformsToProtocol:", v8))
      {
        objc_msgSend(v6, "_transit_mergeFrom:", v9);
        v9 = v6;
      }
      v11 = v9;
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
    objc_msgSend(v9, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      goto LABEL_14;
  }
  v11 = 0;
LABEL_18:

LABEL_19:
  -[GEOInstructionSet setDepartureBar:](self, "setDepartureBar:", v11);

  -[GEOInstructionSet setDepartureBarStyle:](self, "setDepartureBarStyle:", objc_msgSend(v44, "departureBarStyle"));
  -[GEOInstructionSet countStopsText](self, "countStopsText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "countStopsText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v17 = v15;
  if (!v17)
  {
    v21 = v16;
    goto LABEL_37;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v18 = (id)_MergedGlobals_219;
  v19 = v17;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v19, "conformsToProtocol:", _MergedGlobals_219))
  {
    v20 = objc_msgSend(v19, "_transit_hasAnyFieldSet");

    if ((v20 & 1) != 0)
    {
LABEL_32:
      if (objc_msgSend(v19, "conformsToProtocol:", v18)
        && objc_msgSend(v16, "conformsToProtocol:", v18))
      {
        objc_msgSend(v16, "_transit_mergeFrom:", v19);
        v19 = v16;
      }
      v21 = v19;
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
    objc_msgSend(v19, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
      goto LABEL_32;
  }
  v21 = 0;
LABEL_36:

LABEL_37:
  -[GEOInstructionSet setCountStopsText:](self, "setCountStopsText:", v21);

  -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "transitListInstruction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v24;
  v27 = v25;
  if (!v27)
  {
    v31 = v26;
    goto LABEL_55;
  }
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  v28 = (id)_MergedGlobals_219;
  v29 = v27;
  if (qword_1ECDBBD40 != -1)
    dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
  if (objc_msgSend(v29, "conformsToProtocol:", _MergedGlobals_219))
  {
    v30 = objc_msgSend(v29, "_transit_hasAnyFieldSet");

    if ((v30 & 1) != 0)
    {
LABEL_50:
      if (objc_msgSend(v29, "conformsToProtocol:", v28)
        && objc_msgSend(v26, "conformsToProtocol:", v28))
      {
        objc_msgSend(v26, "_transit_mergeFrom:", v29);
        v29 = v26;
      }
      v31 = v29;
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
    objc_msgSend(v29, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
      goto LABEL_50;
  }
  v31 = 0;
LABEL_54:

LABEL_55:
  -[GEOInstructionSet setTransitListInstruction:](self, "setTransitListInstruction:", v31);

  -[GEOInstructionSet transitSignInstruction](self, "transitSignInstruction");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "transitSignInstruction");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v34;
  v37 = v35;
  if (v37)
  {
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    v38 = (id)_MergedGlobals_219;
    v39 = v37;
    if (qword_1ECDBBD40 != -1)
      dispatch_once(&qword_1ECDBBD40, &__block_literal_global_63);
    if (objc_msgSend(v39, "conformsToProtocol:", _MergedGlobals_219))
    {
      v40 = objc_msgSend(v39, "_transit_hasAnyFieldSet");

      if ((v40 & 1) != 0)
      {
LABEL_68:
        if (objc_msgSend(v39, "conformsToProtocol:", v38)
          && objc_msgSend(v36, "conformsToProtocol:", v38))
        {
          objc_msgSend(v36, "_transit_mergeFrom:", v39);
          v39 = v36;
        }
        v41 = v39;
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
      objc_msgSend(v39, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43)
        goto LABEL_68;
    }
    v41 = 0;
LABEL_72:

    goto LABEL_73;
  }
  v41 = v36;
LABEL_73:

  -[GEOInstructionSet setTransitSignInstruction:](self, "setTransitSignInstruction:", v41);
}

- (GEOServerFormattedString)departureBarFormattedString
{
  void *v3;

  if (-[GEOInstructionSet hasDepartureBar](self, "hasDepartureBar"))
  {
    -[GEOInstructionSet departureBar](self, "departureBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOServerFormattedString *)v3;
}

- (int64_t)departureBarFormatStyle
{
  uint64_t v2;

  v2 = -[GEOInstructionSet departureBarStyle](self, "departureBarStyle") - 1;
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

- (GEOServerFormattedString)countStopsFormattedString
{
  void *v3;

  if (-[GEOInstructionSet hasCountStopsText](self, "hasCountStopsText"))
  {
    -[GEOInstructionSet countStopsText](self, "countStopsText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOServerFormattedString *)v3;
}

- (GEOServerFormattedString)expandableListFormattedString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasExpandableListFormatted");

  if (v4)
  {
    -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expandableListFormatted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (GEOServerFormattedString *)v6;
}

- (GEOServerFormattedString)primaryTimeFormattedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasTimeInstructions"))
  {
    -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeInstructions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  if (objc_msgSend(v5, "hasPrimaryText"))
  {
    objc_msgSend(v5, "primaryText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (GEOServerFormattedString *)v6;
}

- (GEOServerFormattedString)secondaryTimeFormattedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasTimeInstructions"))
  {
    -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeInstructions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  if (objc_msgSend(v5, "hasSecondaryText"))
  {
    objc_msgSend(v5, "secondaryText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (GEOServerFormattedString *)v6;
}

- (BOOL)hideTimeInstructionsIfCollapsed
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasTimeInstructions"))
  {
    -[GEOInstructionSet transitListInstruction](self, "transitListInstruction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeInstructions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  if (objc_msgSend(v5, "hasHideWhenListCollapsed"))
    v6 = objc_msgSend(v5, "hideWhenListCollapsed");
  else
    v6 = 0;

  return v6;
}

@end
