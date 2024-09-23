@implementation GEOPDTransitSchedule

+ (id)transitScheduleForPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__GEOPDTransitSchedule_PlaceDataExtras__transitScheduleForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 11, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __69__GEOPDTransitSchedule_PlaceDataExtras__transitScheduleForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue transitSchedule](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDTransitSchedule)init
{
  GEOPDTransitSchedule *v2;
  GEOPDTransitSchedule *v3;
  GEOPDTransitSchedule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitSchedule;
  v2 = -[GEOPDTransitSchedule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitSchedule)initWithData:(id)a3
{
  GEOPDTransitSchedule *v3;
  GEOPDTransitSchedule *v4;
  GEOPDTransitSchedule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitSchedule;
  v3 = -[GEOPDTransitSchedule initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDepartureSequences
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDepartureSequences_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (void)addDepartureSequence:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitSchedule _readDepartureSequences](a1);
    -[GEOPDTransitSchedule _addNoFlagsDepartureSequence:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 92) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_BYTE *)(a1 + 92) |= 0x80u;
  }
}

- (void)_addNoFlagsDepartureSequence:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)departureSequenceAtIndex:(id *)a1
{
  id *v3;

  if (a1)
  {
    v3 = a1;
    -[GEOPDTransitSchedule _readDepartureSequences]((uint64_t)a1);
    objc_msgSend(v3[6], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_readDeparturePredicateCountdown
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeparturePredicateCountdown_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)departurePredicateCountdown
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitSchedule _readDeparturePredicateCountdown]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readDeparturePredicateStamp
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeparturePredicateStamp_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)departurePredicateStamp
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitSchedule _readDeparturePredicateStamp]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readDepartureSequenceContainers
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitScheduleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDepartureSequenceContainers_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)departureSequenceContainers
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDTransitSchedule _readDepartureSequenceContainers]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addDepartureSequenceContainer:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDTransitSchedule _readDepartureSequenceContainers](a1);
    -[GEOPDTransitSchedule _addNoFlagsDepartureSequenceContainer:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 92) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_BYTE *)(a1 + 92) |= 0x80u;
  }
}

- (void)_addNoFlagsDepartureSequenceContainer:(uint64_t)a1
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

- (id)departureSequenceContainerAtIndex:(id *)a1
{
  id *v3;

  if (a1)
  {
    v3 = a1;
    -[GEOPDTransitSchedule _readDepartureSequenceContainers]((uint64_t)a1);
    objc_msgSend(v3[5], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
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
  v8.super_class = (Class)GEOPDTransitSchedule;
  -[GEOPDTransitSchedule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitSchedule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitSchedule _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  char v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[4];
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
  if (!a1)
    return 0;
  -[GEOPDTransitSchedule readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v6 = *(id *)(a1 + 48);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v50 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("departureSequence");
    else
      v13 = CFSTR("departure_sequence");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  -[GEOPDTransitSchedule departurePredicateCountdown]((id *)a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("departurePredicateCountdown");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("departure_predicate_countdown");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  -[GEOPDTransitSchedule departurePredicateStamp]((id *)a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("departurePredicateStamp");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("departure_predicate_stamp");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(_BYTE *)(a1 + 92);
  if ((v22 & 1) != 0)
  {
    if (a2)
      v23 = CFSTR("operatingHoursRange");
    else
      v23 = CFSTR("operating_hours_range");
    _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(a1 + 56), a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, v23);

    v22 = *(_BYTE *)(a1 + 92);
  }
  if ((v22 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("ttlSeconds");
    else
      v26 = CFSTR("ttl_seconds");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v28 = *(id *)(a1 + 40);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v46 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v33, "jsonRepresentation");
          else
            objc_msgSend(v33, "dictionaryRepresentation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v34);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v30);
    }

    if (a2)
      v35 = CFSTR("departureSequenceContainer");
    else
      v35 = CFSTR("departure_sequence_container");
    objc_msgSend(v4, "setObject:forKey:", v27, v35);

  }
  v36 = *(void **)(a1 + 16);
  if (v36)
  {
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __50__GEOPDTransitSchedule__dictionaryRepresentation___block_invoke;
      v43[3] = &unk_1E1C00600;
      v40 = v39;
      v44 = v40;
      objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v43);
      v41 = v40;

      v38 = v41;
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitSchedule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_7106;
      else
        v6 = (int *)&readAll__nonRecursiveTag_7107;
      GEOPDTransitScheduleReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDTransitScheduleCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __50__GEOPDTransitSchedule__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitScheduleReadAllFrom((uint64_t)self, a3, 0);
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
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
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
    -[GEOPDTransitSchedule readAll:]((uint64_t)self, 0);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_departureSequences;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    if (self->_departurePredicateCountdown)
      PBDataWriterWriteSubmessage();
    if (self->_departurePredicateStamp)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      v21 = 0;
      PBDataWriterPlaceMark();
      GEOPDTimeRangeWriteTo((uint64_t)&self->_operatingHoursRange);
      PBDataWriterRecallMark();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint64Field();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_departureSequenceContainers;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
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
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
      }
      while (v12);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
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
  id v14;
  void *v15;
  id v16;
  void *v17;
  char flags;
  $B85216D09A238EDB5177F50F3CAD2EB5 has;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  PBUnknownFields *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
      GEOPDTransitScheduleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitSchedule readAll:]((uint64_t)self, 0);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = self->_departureSequences;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDTransitSchedule addDepartureSequence:](v5, v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  v14 = -[GEOPDDeparturePredicate copyWithZone:](self->_departurePredicateCountdown, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[GEOPDDeparturePredicate copyWithZone:](self->_departurePredicateStamp, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    has = self->_operatingHoursRange._has;
    *(_QWORD *)(v5 + 56) = *(_QWORD *)&self->_operatingHoursRange._duration;
    *($B85216D09A238EDB5177F50F3CAD2EB5 *)(v5 + 64) = has;
    *(_BYTE *)(v5 + 92) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_ttlSeconds;
    *(_BYTE *)(v5 + 92) |= 2u;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = self->_departureSequenceContainers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        -[GEOPDTransitSchedule addDepartureSequenceContainer:](v5, v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v21);
  }

  v25 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v25;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int *v4;
  NSMutableArray *departureSequences;
  GEOPDDeparturePredicate *departurePredicateCountdown;
  GEOPDDeparturePredicate *departurePredicateStamp;
  NSMutableArray *departureSequenceContainers;
  char v10;

  v4 = (unsigned int *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  -[GEOPDTransitSchedule readAll:]((uint64_t)self, 1);
  -[GEOPDTransitSchedule readAll:]((uint64_t)v4, 1);
  departureSequences = self->_departureSequences;
  if ((unint64_t)departureSequences | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](departureSequences, "isEqual:"))
      goto LABEL_24;
  }
  departurePredicateCountdown = self->_departurePredicateCountdown;
  if ((unint64_t)departurePredicateCountdown | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDDeparturePredicate isEqual:](departurePredicateCountdown, "isEqual:"))
      goto LABEL_24;
  }
  departurePredicateStamp = self->_departurePredicateStamp;
  if ((unint64_t)departurePredicateStamp | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDDeparturePredicate isEqual:](departurePredicateStamp, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[23] & 1) == 0)
      goto LABEL_24;
    if (*(_QWORD *)&self->_operatingHoursRange._duration != *((_QWORD *)v4 + 7)
      || *(_DWORD *)&self->_operatingHoursRange._has != (unint64_t)v4[16])
    {
      goto LABEL_24;
    }
  }
  else if ((v4[23] & 1) != 0)
  {
LABEL_24:
    v10 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[23] & 2) == 0 || self->_ttlSeconds != *((_QWORD *)v4 + 9))
      goto LABEL_24;
  }
  else if ((v4[23] & 2) != 0)
  {
    goto LABEL_24;
  }
  departureSequenceContainers = self->_departureSequenceContainers;
  if ((unint64_t)departureSequenceContainers | *((_QWORD *)v4 + 5))
    v10 = -[NSMutableArray isEqual:](departureSequenceContainers, "isEqual:");
  else
    v10 = 1;
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[GEOPDTransitSchedule readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_departureSequences, "hash");
  v4 = -[GEOPDDeparturePredicate hash](self->_departurePredicateCountdown, "hash");
  v5 = -[GEOPDDeparturePredicate hash](self->_departurePredicateStamp, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v6 = PBHashBytes();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSMutableArray hash](self->_departureSequenceContainers, "hash");
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761u * self->_ttlSeconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSMutableArray hash](self->_departureSequenceContainers, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departureSequences, 0);
  objc_storeStrong((id *)&self->_departureSequenceContainers, 0);
  objc_storeStrong((id *)&self->_departurePredicateStamp, 0);
  objc_storeStrong((id *)&self->_departurePredicateCountdown, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
