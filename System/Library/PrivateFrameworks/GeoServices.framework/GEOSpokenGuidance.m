@implementation GEOSpokenGuidance

- (GEOSpokenGuidance)init
{
  GEOSpokenGuidance *v2;
  GEOSpokenGuidance *v3;
  GEOSpokenGuidance *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOSpokenGuidance;
  v2 = -[GEOSpokenGuidance init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSpokenGuidance)initWithData:(id)a3
{
  GEOSpokenGuidance *v3;
  GEOSpokenGuidance *v4;
  GEOSpokenGuidance *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOSpokenGuidance;
  v3 = -[GEOSpokenGuidance initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAnnouncements
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 84) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSpokenGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnouncements_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)announcements
{
  -[GEOSpokenGuidance _readAnnouncements]((uint64_t)self);
  return self->_announcements;
}

- (void)setAnnouncements:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *announcements;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  announcements = self->_announcements;
  self->_announcements = v4;

}

- (void)clearAnnouncements
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_announcements, "removeAllObjects");
}

- (void)addAnnouncement:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSpokenGuidance _readAnnouncements]((uint64_t)self);
  -[GEOSpokenGuidance _addNoFlagsAnnouncement:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsAnnouncement:(uint64_t)a1
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

- (unint64_t)announcementsCount
{
  -[GEOSpokenGuidance _readAnnouncements]((uint64_t)self);
  return -[NSMutableArray count](self->_announcements, "count");
}

- (id)announcementAtIndex:(unint64_t)a3
{
  -[GEOSpokenGuidance _readAnnouncements]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_announcements, "objectAtIndex:", a3);
}

+ (Class)announcementType
{
  return (Class)objc_opt_class();
}

- (unsigned)startDesiredTime
{
  return self->_startDesiredTime;
}

- (void)setStartDesiredTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  self->_startDesiredTime = a3;
}

- (void)setHasStartDesiredTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2112;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasStartDesiredTime
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (unsigned)endDesiredTime
{
  return self->_endDesiredTime;
}

- (void)setEndDesiredTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_endDesiredTime = a3;
}

- (void)setHasEndDesiredTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasEndDesiredTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)alignment
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_alignment;
  else
    return 1;
}

- (void)setAlignment:(int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_alignment = a3;
}

- (void)setHasAlignment:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasAlignment
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)alignmentAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C086D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlignment:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ALIGNMENT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AT_START")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WHEN_CONVENIENT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AT_END")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REPETITION_ONLY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)repetitionInterval
{
  return self->_repetitionInterval;
}

- (void)setRepetitionInterval:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_repetitionInterval = a3;
}

- (void)setHasRepetitionInterval:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2080;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRepetitionInterval
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2064;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unsigned)numChainedVariants
{
  return self->_numChainedVariants;
}

- (void)setNumChainedVariants:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_numChainedVariants = a3;
}

- (void)setHasNumChainedVariants:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasNumChainedVariants
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (BOOL)tapBeforeAnnouncement
{
  return self->_tapBeforeAnnouncement;
}

- (void)setTapBeforeAnnouncement:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  self->_tapBeforeAnnouncement = a3;
}

- (void)setHasTapBeforeAnnouncement:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2176;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasTapBeforeAnnouncement
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readTimeGaps
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_WORD *)(a1 + 84) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOSpokenGuidanceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeGaps_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)timeGaps
{
  -[GEOSpokenGuidance _readTimeGaps]((uint64_t)self);
  return self->_timeGaps;
}

- (void)setTimeGaps:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *timeGaps;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  timeGaps = self->_timeGaps;
  self->_timeGaps = v4;

}

- (void)clearTimeGaps
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_timeGaps, "removeAllObjects");
}

- (void)addTimeGap:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOSpokenGuidance _readTimeGaps]((uint64_t)self);
  -[GEOSpokenGuidance _addNoFlagsTimeGap:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsTimeGap:(uint64_t)a1
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

- (unint64_t)timeGapsCount
{
  -[GEOSpokenGuidance _readTimeGaps]((uint64_t)self);
  return -[NSMutableArray count](self->_timeGaps, "count");
}

- (id)timeGapAtIndex:(unint64_t)a3
{
  -[GEOSpokenGuidance _readTimeGaps]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_timeGaps, "objectAtIndex:", a3);
}

+ (Class)timeGapType
{
  return (Class)objc_opt_class();
}

- (unsigned)exclusiveSetIdentifier
{
  return self->_exclusiveSetIdentifier;
}

- (void)setExclusiveSetIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_exclusiveSetIdentifier = a3;
}

- (void)setHasExclusiveSetIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasExclusiveSetIdentifier
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOSpokenGuidance;
  -[GEOSpokenGuidance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSpokenGuidance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpokenGuidance _dictionaryRepresentation:]((uint64_t)self, 0);
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
  __int16 v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v6 = *(id *)(a1 + 24);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v52 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("announcement"));
  }
  v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("startDesiredTime");
    else
      v35 = CFSTR("start_desired_time");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

    v13 = *(_WORD *)(a1 + 84);
    if ((v13 & 2) == 0)
    {
LABEL_16:
      if ((v13 & 1) == 0)
        goto LABEL_17;
      goto LABEL_58;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v37 = CFSTR("endDesiredTime");
  else
    v37 = CFSTR("end_desired_time");
  objc_msgSend(v4, "setObject:forKey:", v36, v37);

  v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 1) == 0)
  {
LABEL_17:
    if ((v13 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_62;
  }
LABEL_58:
  v38 = *(int *)(a1 + 52);
  if (v38 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = off_1E1C086D0[v38];
  }
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("alignment"));

  v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 0x20) == 0)
  {
LABEL_18:
    if ((v13 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_66;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v41 = CFSTR("repetitionInterval");
  else
    v41 = CFSTR("repetition_interval");
  objc_msgSend(v4, "setObject:forKey:", v40, v41);

  v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 0x10) == 0)
  {
LABEL_19:
    if ((v13 & 8) == 0)
      goto LABEL_20;
LABEL_67:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("numChainedVariants");
    else
      v44 = CFSTR("num_chained_variants");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

    if ((*(_WORD *)(a1 + 84) & 0x80) == 0)
      goto LABEL_25;
    goto LABEL_21;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("priority"));

  v13 = *(_WORD *)(a1 + 84);
  if ((v13 & 8) != 0)
    goto LABEL_67;
LABEL_20:
  if ((v13 & 0x80) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("tapBeforeAnnouncement");
    else
      v15 = CFSTR("tap_before_announcement");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
LABEL_25:
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v17 = *(id *)(a1 + 32);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v19);
    }

    if (a2)
      v24 = CFSTR("timeGap");
    else
      v24 = CFSTR("time_gap");
    objc_msgSend(v4, "setObject:forKey:", v16, v24);

  }
  if ((*(_WORD *)(a1 + 84) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("exclusiveSetIdentifier");
    else
      v26 = CFSTR("exclusive_set_identifier");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  v27 = *(void **)(a1 + 16);
  if (v27)
  {
    objc_msgSend(v27, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __47__GEOSpokenGuidance__dictionaryRepresentation___block_invoke;
      v45[3] = &unk_1E1C00600;
      v31 = v30;
      v46 = v31;
      objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v45);
      v32 = v31;

      v29 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSpokenGuidance _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOSpokenGuidance__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSpokenGuidance)initWithDictionary:(id)a3
{
  return (GEOSpokenGuidance *)-[GEOSpokenGuidance _initWithDictionary:isJSON:](self, a3, 0);
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
  GEOFormattedString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  GEOTimeGap *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_83;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_83;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("announcement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v44 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = [GEOFormattedString alloc];
            if ((a3 & 1) != 0)
              v14 = -[GEOFormattedString initWithJSON:](v13, "initWithJSON:", v12);
            else
              v14 = -[GEOFormattedString initWithDictionary:](v13, "initWithDictionary:", v12);
            v15 = (void *)v14;
            objc_msgSend(a1, "addAnnouncement:", v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v9);
    }

    v5 = v44;
  }

  if (a3)
    v16 = CFSTR("startDesiredTime");
  else
    v16 = CFSTR("start_desired_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStartDesiredTime:", objc_msgSend(v17, "unsignedIntValue"));

  if (a3)
    v18 = CFSTR("endDesiredTime");
  else
    v18 = CFSTR("end_desired_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEndDesiredTime:", objc_msgSend(v19, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alignment"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v20;
    if ((objc_msgSend(v21, "isEqualToString:", CFSTR("UNKNOWN_ALIGNMENT")) & 1) != 0)
    {
      v22 = 0;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("AT_START")) & 1) != 0)
    {
      v22 = 1;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("WHEN_CONVENIENT")) & 1) != 0)
    {
      v22 = 2;
    }
    else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("AT_END")) & 1) != 0)
    {
      v22 = 3;
    }
    else if (objc_msgSend(v21, "isEqualToString:", CFSTR("REPETITION_ONLY")))
    {
      v22 = 4;
    }
    else
    {
      v22 = 0;
    }

    goto LABEL_42;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = objc_msgSend(v20, "intValue");
LABEL_42:
    objc_msgSend(a1, "setAlignment:", v22);
  }

  if (a3)
    v23 = CFSTR("repetitionInterval");
  else
    v23 = CFSTR("repetition_interval");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRepetitionInterval:", objc_msgSend(v24, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priority"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPriority:", objc_msgSend(v25, "unsignedIntValue"));

  if (a3)
    v26 = CFSTR("numChainedVariants");
  else
    v26 = CFSTR("num_chained_variants");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNumChainedVariants:", objc_msgSend(v27, "unsignedIntValue"));

  if (a3)
    v28 = CFSTR("tapBeforeAnnouncement");
  else
    v28 = CFSTR("tap_before_announcement");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTapBeforeAnnouncement:", objc_msgSend(v29, "BOOLValue"));

  if (a3)
    v30 = CFSTR("timeGap");
  else
    v30 = CFSTR("time_gap");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = [GEOTimeGap alloc];
            if ((a3 & 1) != 0)
              v39 = -[GEOTimeGap initWithJSON:](v38, "initWithJSON:", v37);
            else
              v39 = -[GEOTimeGap initWithDictionary:](v38, "initWithDictionary:", v37);
            v40 = (void *)v39;
            objc_msgSend(a1, "addTimeGap:", v39);

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v34);
    }

    v5 = v44;
  }

  if (a3)
    v41 = CFSTR("exclusiveSetIdentifier");
  else
    v41 = CFSTR("exclusive_set_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setExclusiveSetIdentifier:", objc_msgSend(v42, "unsignedIntValue"));

LABEL_83:
  return a1;
}

- (GEOSpokenGuidance)initWithJSON:(id)a3
{
  return (GEOSpokenGuidance *)-[GEOSpokenGuidance _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_5795;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5796;
    GEOSpokenGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOSpokenGuidanceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSpokenGuidanceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSpokenGuidanceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0xE00) == 0))
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSpokenGuidance readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_announcements;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 0x40) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x80) != 0)
      PBDataWriterWriteBOOLField();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_timeGaps;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 flags;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEOSpokenGuidance readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 10) = self->_readerMarkPos;
  *((_DWORD *)v13 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOSpokenGuidance announcementsCount](self, "announcementsCount"))
  {
    objc_msgSend(v13, "clearAnnouncements");
    v4 = -[GEOSpokenGuidance announcementsCount](self, "announcementsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOSpokenGuidance announcementAtIndex:](self, "announcementAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAnnouncement:", v7);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    *((_DWORD *)v13 + 19) = self->_startDesiredTime;
    *((_WORD *)v13 + 42) |= 0x40u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0)
        goto LABEL_8;
      goto LABEL_22;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v13 + 14) = self->_endDesiredTime;
  *((_WORD *)v13 + 42) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v13 + 13) = self->_alignment;
  *((_WORD *)v13 + 42) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_9:
    if ((flags & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v13 + 18) = self->_repetitionInterval;
  *((_WORD *)v13 + 42) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_10:
    if ((flags & 8) == 0)
      goto LABEL_11;
LABEL_25:
    *((_DWORD *)v13 + 16) = self->_numChainedVariants;
    *((_WORD *)v13 + 42) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_24:
  *((_DWORD *)v13 + 17) = self->_priority;
  *((_WORD *)v13 + 42) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_25;
LABEL_11:
  if ((flags & 0x80) != 0)
  {
LABEL_12:
    *((_BYTE *)v13 + 80) = self->_tapBeforeAnnouncement;
    *((_WORD *)v13 + 42) |= 0x80u;
  }
LABEL_13:
  if (-[GEOSpokenGuidance timeGapsCount](self, "timeGapsCount"))
  {
    objc_msgSend(v13, "clearTimeGaps");
    v9 = -[GEOSpokenGuidance timeGapsCount](self, "timeGapsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOSpokenGuidance timeGapAtIndex:](self, "timeGapAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTimeGap:", v12);

      }
    }
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v13 + 15) = self->_exclusiveSetIdentifier;
    *((_WORD *)v13 + 42) |= 4u;
  }

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
  __int16 flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  PBUnknownFields *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOSpokenGuidanceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOSpokenGuidance readAll:](self, "readAll:", 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_announcements;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAnnouncement:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_startDesiredTime;
    *(_WORD *)(v5 + 84) |= 0x40u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_14:
      if ((flags & 1) == 0)
        goto LABEL_15;
      goto LABEL_33;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v5 + 56) = self->_endDesiredTime;
  *(_WORD *)(v5 + 84) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_15:
    if ((flags & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 52) = self->_alignment;
  *(_WORD *)(v5 + 84) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_16:
    if ((flags & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 72) = self->_repetitionInterval;
  *(_WORD *)(v5 + 84) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_17:
    if ((flags & 8) == 0)
      goto LABEL_18;
LABEL_36:
    *(_DWORD *)(v5 + 64) = self->_numChainedVariants;
    *(_WORD *)(v5 + 84) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x80) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_35:
  *(_DWORD *)(v5 + 68) = self->_priority;
  *(_WORD *)(v5 + 84) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_36;
LABEL_18:
  if ((flags & 0x80) != 0)
  {
LABEL_19:
    *(_BYTE *)(v5 + 80) = self->_tapBeforeAnnouncement;
    *(_WORD *)(v5 + 84) |= 0x80u;
  }
LABEL_20:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self->_timeGaps;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        objc_msgSend((id)v5, "addTimeGap:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_exclusiveSetIdentifier;
    *(_WORD *)(v5 + 84) |= 4u;
  }
  v20 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *announcements;
  __int16 flags;
  __int16 v7;
  NSMutableArray *timeGaps;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  -[GEOSpokenGuidance readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  announcements = self->_announcements;
  if ((unint64_t)announcements | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](announcements, "isEqual:"))
      goto LABEL_49;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 42);
  if ((flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_startDesiredTime != *((_DWORD *)v4 + 19))
      goto LABEL_49;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_endDesiredTime != *((_DWORD *)v4 + 14))
      goto LABEL_49;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_alignment != *((_DWORD *)v4 + 13))
      goto LABEL_49;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_repetitionInterval != *((_DWORD *)v4 + 18))
      goto LABEL_49;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_priority != *((_DWORD *)v4 + 17))
      goto LABEL_49;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_numChainedVariants != *((_DWORD *)v4 + 16))
      goto LABEL_49;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_49;
    if (self->_tapBeforeAnnouncement)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_49;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  timeGaps = self->_timeGaps;
  if (!((unint64_t)timeGaps | *((_QWORD *)v4 + 4)))
    goto LABEL_45;
  if (!-[NSMutableArray isEqual:](timeGaps, "isEqual:"))
  {
LABEL_49:
    v9 = 0;
    goto LABEL_50;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 42);
LABEL_45:
  v9 = (v7 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_exclusiveSetIdentifier != *((_DWORD *)v4 + 15))
      goto LABEL_49;
    v9 = 1;
  }
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  -[GEOSpokenGuidance readAll:](self, "readAll:", 1);
  v14 = -[NSMutableArray hash](self->_announcements, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    v4 = 2654435761 * self->_startDesiredTime;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_endDesiredTime;
      if ((flags & 1) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((flags & 1) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_alignment;
    if ((flags & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v6 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_repetitionInterval;
    if ((flags & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v7 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_priority;
    if ((flags & 8) != 0)
      goto LABEL_7;
LABEL_14:
    v9 = 0;
    if ((flags & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v8 = 0;
  if ((flags & 8) == 0)
    goto LABEL_14;
LABEL_7:
  v9 = 2654435761 * self->_numChainedVariants;
  if ((flags & 0x80) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_tapBeforeAnnouncement;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
LABEL_16:
  v11 = -[NSMutableArray hash](self->_timeGaps, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v12 = 2654435761 * self->_exclusiveSetIdentifier;
  else
    v12 = 0;
  return v4 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[GEOSpokenGuidance addAnnouncement:](self, "addAnnouncement:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 42);
  if ((v10 & 0x40) != 0)
  {
    self->_startDesiredTime = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 0x40u;
    v10 = *((_WORD *)v4 + 42);
    if ((v10 & 2) == 0)
    {
LABEL_10:
      if ((v10 & 1) == 0)
        goto LABEL_11;
      goto LABEL_28;
    }
  }
  else if ((v10 & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_endDesiredTime = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_flags |= 2u;
  v10 = *((_WORD *)v4 + 42);
  if ((v10 & 1) == 0)
  {
LABEL_11:
    if ((v10 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  self->_alignment = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_flags |= 1u;
  v10 = *((_WORD *)v4 + 42);
  if ((v10 & 0x20) == 0)
  {
LABEL_12:
    if ((v10 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  self->_repetitionInterval = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_flags |= 0x20u;
  v10 = *((_WORD *)v4 + 42);
  if ((v10 & 0x10) == 0)
  {
LABEL_13:
    if ((v10 & 8) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  self->_priority = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_flags |= 0x10u;
  v10 = *((_WORD *)v4 + 42);
  if ((v10 & 8) == 0)
  {
LABEL_14:
    if ((v10 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_31:
  self->_numChainedVariants = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_flags |= 8u;
  if ((*((_WORD *)v4 + 42) & 0x80) != 0)
  {
LABEL_15:
    self->_tapBeforeAnnouncement = *((_BYTE *)v4 + 80);
    *(_WORD *)&self->_flags |= 0x80u;
  }
LABEL_16:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v4 + 4);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[GEOSpokenGuidance addTimeGap:](self, "addTimeGap:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if ((*((_WORD *)v4 + 42) & 4) != 0)
  {
    self->_exclusiveSetIdentifier = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 4u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x100) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOSpokenGuidanceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5799);
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x900u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOSpokenGuidance readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_announcements;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_timeGaps;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeGaps, 0);
  objc_storeStrong((id *)&self->_announcements, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
