@implementation GEOLogMsgEventDailyUseSummary

- (GEOLogMsgEventDailyUseSummary)init
{
  GEOLogMsgEventDailyUseSummary *v2;
  GEOLogMsgEventDailyUseSummary *v3;
  GEOLogMsgEventDailyUseSummary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventDailyUseSummary;
  v2 = -[GEOLogMsgEventDailyUseSummary init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventDailyUseSummary)initWithData:(id)a3
{
  GEOLogMsgEventDailyUseSummary *v3;
  GEOLogMsgEventDailyUseSummary *v4;
  GEOLogMsgEventDailyUseSummary *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventDailyUseSummary;
  v3 = -[GEOLogMsgEventDailyUseSummary initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUseEvents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDailyUseSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUseEvents_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)useEvents
{
  -[GEOLogMsgEventDailyUseSummary _readUseEvents]((uint64_t)self);
  return self->_useEvents;
}

- (void)setUseEvents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *useEvents;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  useEvents = self->_useEvents;
  self->_useEvents = v4;

}

- (void)clearUseEvents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_useEvents, "removeAllObjects");
}

- (void)addUseEvents:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventDailyUseSummary _readUseEvents]((uint64_t)self);
  -[GEOLogMsgEventDailyUseSummary _addNoFlagsUseEvents:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsUseEvents:(uint64_t)a1
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

- (unint64_t)useEventsCount
{
  -[GEOLogMsgEventDailyUseSummary _readUseEvents]((uint64_t)self);
  return -[NSMutableArray count](self->_useEvents, "count");
}

- (id)useEventsAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventDailyUseSummary _readUseEvents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_useEvents, "objectAtIndex:", a3);
}

+ (Class)useEventsType
{
  return (Class)objc_opt_class();
}

- (double)firstEventDate
{
  return self->_firstEventDate;
}

- (void)setFirstEventDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_firstEventDate = a3;
}

- (void)setHasFirstEventDate:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasFirstEventDate
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unint64_t)firstEventTimeRoundedToHour
{
  return self->_firstEventTimeRoundedToHour;
}

- (void)setFirstEventTimeRoundedToHour:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_firstEventTimeRoundedToHour = a3;
}

- (void)setHasFirstEventTimeRoundedToHour:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasFirstEventTimeRoundedToHour
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)summaryPeriod
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_summaryPeriod;
  else
    return 0;
}

- (void)setSummaryPeriod:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_summaryPeriod = a3;
}

- (void)setHasSummaryPeriod:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSummaryPeriod
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)summaryPeriodAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C224C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSummaryPeriod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UseSummaryPeriod_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UseSummaryPeriod_DAILY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UseSummaryPeriod_MONTHLY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSummaryDate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventDailyUseSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSummaryDate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSummaryDate
{
  -[GEOLogMsgEventDailyUseSummary _readSummaryDate]((uint64_t)self);
  return self->_summaryDate != 0;
}

- (NSString)summaryDate
{
  -[GEOLogMsgEventDailyUseSummary _readSummaryDate]((uint64_t)self);
  return self->_summaryDate;
}

- (void)setSummaryDate:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_summaryDate, a3);
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
  v8.super_class = (Class)GEOLogMsgEventDailyUseSummary;
  -[GEOLogMsgEventDailyUseSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventDailyUseSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventDailyUseSummary _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("useEvents");
    else
      v13 = CFSTR("use_events");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  v14 = *(_BYTE *)(a1 + 64);
  if ((v14 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 64) & 2) == 0)
      goto LABEL_19;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("firstEventTimeRoundedToHour");
    else
      v18 = CFSTR("first_event_time_rounded_to_hour");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
      goto LABEL_36;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v16 = CFSTR("firstEventDate");
  else
    v16 = CFSTR("first_event_date");
  objc_msgSend(v4, "setObject:forKey:", v15, v16);

  v14 = *(_BYTE *)(a1 + 64);
  if ((v14 & 2) != 0)
    goto LABEL_25;
LABEL_19:
  if ((v14 & 4) != 0)
  {
LABEL_29:
    v19 = *(int *)(a1 + 60);
    if (v19 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E1C224C0[v19];
    }
    if (a2)
      v21 = CFSTR("summaryPeriod");
    else
      v21 = CFSTR("summary_period");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
LABEL_36:
  objc_msgSend((id)a1, "summaryDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (a2)
      v23 = CFSTR("summaryDate");
    else
      v23 = CFSTR("summary_date");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventDailyUseSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventDailyUseSummary)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventDailyUseSummary *)-[GEOLogMsgEventDailyUseSummary _initWithDictionary:isJSON:](self, a3, 0);
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
  GEODailyUseSummaryUseEvent *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_51;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_51;
  if (a3)
    v6 = CFSTR("useEvents");
  else
    v6 = CFSTR("use_events");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v5;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = [GEODailyUseSummaryUseEvent alloc];
            if ((a3 & 1) != 0)
              v15 = -[GEODailyUseSummaryUseEvent initWithJSON:](v14, "initWithJSON:", v13);
            else
              v15 = -[GEODailyUseSummaryUseEvent initWithDictionary:](v14, "initWithDictionary:", v13);
            v16 = (void *)v15;
            objc_msgSend(a1, "addUseEvents:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

    v5 = v29;
  }

  if (a3)
    v17 = CFSTR("firstEventDate");
  else
    v17 = CFSTR("first_event_date");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(a1, "setFirstEventDate:");
  }

  if (a3)
    v19 = CFSTR("firstEventTimeRoundedToHour");
  else
    v19 = CFSTR("first_event_time_rounded_to_hour");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFirstEventTimeRoundedToHour:", objc_msgSend(v20, "unsignedLongLongValue"));

  if (a3)
    v21 = CFSTR("summaryPeriod");
  else
    v21 = CFSTR("summary_period");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = v22;
    if ((objc_msgSend(v23, "isEqualToString:", CFSTR("UseSummaryPeriod_UNSPECIFIED")) & 1) != 0)
    {
      v24 = 0;
    }
    else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("UseSummaryPeriod_DAILY")) & 1) != 0)
    {
      v24 = 1;
    }
    else if (objc_msgSend(v23, "isEqualToString:", CFSTR("UseSummaryPeriod_MONTHLY")))
    {
      v24 = 2;
    }
    else
    {
      v24 = 0;
    }

    goto LABEL_44;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v22, "intValue");
LABEL_44:
    objc_msgSend(a1, "setSummaryPeriod:", v24);
  }

  if (a3)
    v25 = CFSTR("summaryDate");
  else
    v25 = CFSTR("summary_date");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(a1, "setSummaryDate:", v27);

  }
LABEL_51:

  return a1;
}

- (GEOLogMsgEventDailyUseSummary)initWithJSON:(id)a3
{
  return (GEOLogMsgEventDailyUseSummary *)-[GEOLogMsgEventDailyUseSummary _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1765;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1766;
    GEOLogMsgEventDailyUseSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventDailyUseSummaryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventDailyUseSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventDailyUseSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventDailyUseSummary readAll:](self, "readAll:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_useEvents;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    if ((flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_summaryDate)
      PBDataWriterWriteStringField();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOLogMsgEventDailyUseSummary readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 12) = self->_readerMarkPos;
  *((_DWORD *)v10 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOLogMsgEventDailyUseSummary useEventsCount](self, "useEventsCount"))
  {
    objc_msgSend(v10, "clearUseEvents");
    v4 = -[GEOLogMsgEventDailyUseSummary useEventsCount](self, "useEventsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLogMsgEventDailyUseSummary useEventsAtIndex:](self, "useEventsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addUseEvents:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  v9 = v10;
  if ((flags & 1) != 0)
  {
    v10[2] = *(id *)&self->_firstEventDate;
    *((_BYTE *)v10 + 64) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_7;
  }
  v10[3] = (id)self->_firstEventTimeRoundedToHour;
  *((_BYTE *)v10 + 64) |= 2u;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v10 + 15) = self->_summaryPeriod;
    *((_BYTE *)v10 + 64) |= 4u;
  }
LABEL_9:
  if (self->_summaryDate)
  {
    objc_msgSend(v10, "setSummaryDate:");
    v9 = v10;
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
  char flags;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventDailyUseSummary readAll:](self, "readAll:", 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = self->_useEvents;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
          objc_msgSend((id)v5, "addUseEvents:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      *(double *)(v5 + 16) = self->_firstEventDate;
      *(_BYTE *)(v5 + 64) |= 1u;
      flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_14:
        if ((flags & 4) == 0)
        {
LABEL_16:
          v15 = -[NSString copyWithZone:](self->_summaryDate, "copyWithZone:", a3, (_QWORD)v17);
          v8 = *(id *)(v5 + 32);
          *(_QWORD *)(v5 + 32) = v15;
          goto LABEL_17;
        }
LABEL_15:
        *(_DWORD *)(v5 + 60) = self->_summaryPeriod;
        *(_BYTE *)(v5 + 64) |= 4u;
        goto LABEL_16;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      goto LABEL_14;
    }
    *(_QWORD *)(v5 + 24) = self->_firstEventTimeRoundedToHour;
    *(_BYTE *)(v5 + 64) |= 2u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventDailyUseSummaryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_17:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *useEvents;
  NSString *summaryDate;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOLogMsgEventDailyUseSummary readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  useEvents = self->_useEvents;
  if ((unint64_t)useEvents | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](useEvents, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_firstEventDate != *((double *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_firstEventTimeRoundedToHour != *((_QWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_summaryPeriod != *((_DWORD *)v4 + 15))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_21;
  }
  summaryDate = self->_summaryDate;
  if ((unint64_t)summaryDate | *((_QWORD *)v4 + 4))
    v7 = -[NSString isEqual:](summaryDate, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  char flags;
  unint64_t v5;
  double firstEventDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;

  -[GEOLogMsgEventDailyUseSummary readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_useEvents, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    firstEventDate = self->_firstEventDate;
    v7 = -firstEventDate;
    if (firstEventDate >= 0.0)
      v7 = self->_firstEventDate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 2) != 0)
  {
    v10 = 2654435761u * self->_firstEventTimeRoundedToHour;
    if ((flags & 4) != 0)
      goto LABEL_11;
LABEL_13:
    v11 = 0;
    return v5 ^ v3 ^ v10 ^ v11 ^ -[NSString hash](self->_summaryDate, "hash");
  }
  v10 = 0;
  if ((flags & 4) == 0)
    goto LABEL_13;
LABEL_11:
  v11 = 2654435761 * self->_summaryPeriod;
  return v5 ^ v3 ^ v10 ^ v11 ^ -[NSString hash](self->_summaryDate, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[GEOLogMsgEventDailyUseSummary addUseEvents:](self, "addUseEvents:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 64);
  if ((v10 & 1) != 0)
  {
    self->_firstEventDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v10 = *((_BYTE *)v4 + 64);
    if ((v10 & 2) == 0)
    {
LABEL_10:
      if ((v10 & 4) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_firstEventTimeRoundedToHour = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
LABEL_11:
    self->_summaryPeriod = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 4))
    -[GEOLogMsgEventDailyUseSummary setSummaryDate:](self, "setSummaryDate:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useEvents, 0);
  objc_storeStrong((id *)&self->_summaryDate, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
