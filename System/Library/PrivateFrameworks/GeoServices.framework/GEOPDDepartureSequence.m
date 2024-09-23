@implementation GEOPDDepartureSequence

- (GEOPDDepartureSequence)init
{
  GEOPDDepartureSequence *v2;
  GEOPDDepartureSequence *v3;
  GEOPDDepartureSequence *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDDepartureSequence;
  v2 = -[GEOPDDepartureSequence init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDepartureSequence)initWithData:(id)a3
{
  GEOPDDepartureSequence *v3;
  GEOPDDepartureSequence *v4;
  GEOPDDepartureSequence *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDDepartureSequence;
  v3 = -[GEOPDDepartureSequence initWithData:](&v7, sel_initWithData_, a3);
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

  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)&self->_flags |= 0x20u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_WORD *)&self->_flags |= 0x2000u;
    self->_operatingHoursSpace = 0;
    self->_operatingHoursCount = 0;
    free(self->_operatingHours);
    self->_operatingHours = 0;
  }
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDDepartureSequence;
  -[GEOPDDepartureSequence dealloc](&v3, sel_dealloc);
}

- (void)_readDepartures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDepartures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)departures
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDepartureSequence _readDepartures]((uint64_t)a1);
    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)addDeparture:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDDepartureSequence _readDepartures](a1);
    -[GEOPDDepartureSequence _addNoFlagsDeparture:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 164) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    *(_WORD *)(a1 + 164) |= 0x2000u;
  }
}

- (void)_addNoFlagsDeparture:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readDepartureFrequencys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDepartureFrequencys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)departureFrequencys
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDepartureSequence _readDepartureFrequencys]((uint64_t)a1);
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)addDepartureFrequency:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDDepartureSequence _readDepartureFrequencys](a1);
    -[GEOPDDepartureSequence _addNoFlagsDepartureFrequency:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 164) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
    *(_WORD *)(a1 + 164) |= 0x2000u;
  }
}

- (void)_addNoFlagsDepartureFrequency:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readOperatingHours
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOperatingHours_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (uint64_t)_reserveOperatingHours:(uint64_t)result
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (result)
  {
    v2 = (_QWORD *)result;
    v3 = *(_QWORD *)(result + 56);
    v4 = v3 + a2;
    if (v3 + a2 <= v3)
      return 0;
    v5 = *(_QWORD *)(result + 64);
    if (v5 >= v4)
      return 1;
    v6 = v5 + a2;
    if (v5 + a2)
    {
      v7 = 1;
      while (1)
      {
        v8 = v7;
        if (v7 >= v6)
          break;
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    if (v8 < a2)
      return 0;
LABEL_11:
    if (12 * v8 < v8)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 48), 12 * v8, 0xDF10DD53uLL);
    if (result)
    {
      v2[8] = v8;
      v2[6] = result;
      bzero((void *)(result + 12 * v2[7]), 12 * (v8 - v2[7]));
      return 1;
    }
  }
  return result;
}

- (uint64_t)operatingHoursAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDDepartureSequence _readOperatingHours](result);
    v4 = *(_QWORD *)(v3 + 56);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(_QWORD *)(*(_QWORD *)(v3 + 48) + 12 * a2);
  }
  return result;
}

- (void)_readDirectionNameString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionNameString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)directionNameString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDepartureSequence _readDirectionNameString]((uint64_t)a1);
    a1 = (id *)v1[12];
  }
  return a1;
}

- (void)_readHeadsignString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHeadsignString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)headsignString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDepartureSequence _readHeadsignString]((uint64_t)a1);
    a1 = (id *)v1[14];
  }
  return a1;
}

- (void)_readNextStopIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNextStopIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (uint64_t)nextStopIdAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDDepartureSequence _readNextStopIds](result);
    v4 = *(_QWORD *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(_QWORD *)(*(_QWORD *)(v3 + 24) + 8 * a2);
  }
  return result;
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)displayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDepartureSequence _readDisplayName]((uint64_t)a1);
    a1 = (id *)v1[13];
  }
  return a1;
}

- (void)_readOriginName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 164) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (id)originName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDDepartureSequence _readOriginName]((uint64_t)a1);
    a1 = (id *)v1[16];
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
  v8.super_class = (Class)GEOPDDepartureSequence;
  -[GEOPDDepartureSequence description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDepartureSequence dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDepartureSequence _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDDepartureSequence readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 164);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 120));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("lineId");
    else
      v7 = CFSTR("line_id");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 164);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 136));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("stopId");
    else
      v9 = CFSTR("stop_id");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v11 = *(id *)(a1 + 88);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v61 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("departure"));
  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v18 = *(id *)(a1 + 80);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v57 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v23);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      }
      while (v19);
    }

    if (a2)
      v24 = CFSTR("departureFrequency");
    else
      v24 = CFSTR("departure_frequency");
    objc_msgSend(v4, "setObject:forKey:", v17, v24);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 56));
    if (*(_QWORD *)(a1 + 56))
    {
      v26 = 0;
      v27 = 0;
      do
      {
        _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 48) + v26), a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v28);

        ++v27;
        v26 += 12;
      }
      while (v27 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v29 = CFSTR("operatingHours");
    else
      v29 = CFSTR("operating_hours");
    objc_msgSend(v4, "setObject:forKey:", v25, v29);

  }
  -[GEOPDDepartureSequence directionNameString]((id *)a1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    if (a2)
      v31 = CFSTR("directionNameString");
    else
      v31 = CFSTR("direction_name_string");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);
  }

  -[GEOPDDepartureSequence headsignString]((id *)a1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    if (a2)
      v33 = CFSTR("headsignString");
    else
      v33 = CFSTR("headsign_string");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt64NSArray();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v35 = CFSTR("nextStopId");
    else
      v35 = CFSTR("next_stop_id");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
  if ((*(_WORD *)(a1 + 164) & 0x40) == 0)
  {
    v36 = *(void **)(a1 + 8);
    if (v36)
    {
      v37 = v36;
      objc_sync_enter(v37);
      GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArtwork_tags_2);
      objc_sync_exit(v37);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  v38 = *(id *)(a1 + 72);
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v38, "jsonRepresentation");
    else
      objc_msgSend(v38, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("artwork"));

  }
  if ((*(_WORD *)(a1 + 164) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 144));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v42 = CFSTR("transitId");
    else
      v42 = CFSTR("transit_id");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  -[GEOPDDepartureSequence displayName]((id *)a1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    if (a2)
      v44 = CFSTR("displayName");
    else
      v44 = CFSTR("display_name");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);
  }

  -[GEOPDDepartureSequence originName]((id *)a1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    if (a2)
      v46 = CFSTR("originName");
    else
      v46 = CFSTR("origin_name");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);
  }

  v47 = *(void **)(a1 + 16);
  if (v47)
  {
    objc_msgSend(v47, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __52__GEOPDDepartureSequence__dictionaryRepresentation___block_invoke;
      v54[3] = &unk_1E1C00600;
      v51 = v50;
      v55 = v51;
      objc_msgSend(v49, "enumerateKeysAndObjectsUsingBlock:", v54);
      v52 = v51;

    }
    else
    {
      v52 = v48;
    }
    objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDDepartureSequence _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3004;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3005;
      GEOPDDepartureSequenceReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDDepartureSequenceCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

void __52__GEOPDDepartureSequence__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  GEOPDDeparture *v20;
  GEOPDDeparture *v21;
  GEOPDDeparture *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  GEOPDDepartureFrequency *v31;
  GEOPDDepartureFrequency *v32;
  GEOPDDepartureFrequency *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  id v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  id v53;
  const __CFString *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  void *v61;
  void *v62;
  GEOPBTransitArtwork *v63;
  GEOPBTransitArtwork *v64;
  GEOPBTransitArtwork *v65;
  GEOPBTransitArtwork *v66;
  const __CFString *v67;
  void *v68;
  uint64_t v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  id v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  id v77;
  void *v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  int v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if ((_DWORD)a3)
      v7 = CFSTR("lineId");
    else
      v7 = CFSTR("line_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "unsignedLongLongValue");
      *(_WORD *)(v6 + 164) |= 0x2000u;
      *(_WORD *)(v6 + 164) |= 1u;
      *(_QWORD *)(v6 + 120) = v9;
    }

    if ((_DWORD)a3)
      v10 = CFSTR("stopId");
    else
      v10 = CFSTR("stop_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "unsignedLongLongValue");
      *(_WORD *)(v6 + 164) |= 0x2000u;
      *(_WORD *)(v6 + 164) |= 2u;
      *(_QWORD *)(v6 + 136) = v12;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departure"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v97 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = [GEOPDDeparture alloc];
              if ((a3 & 1) != 0)
                v21 = -[GEOPDDeparture initWithJSON:](v20, "initWithJSON:", v19);
              else
                v21 = -[GEOPDDeparture initWithDictionary:](v20, "initWithDictionary:", v19);
              v22 = v21;
              -[GEOPDDepartureSequence addDeparture:](v6, v21);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
        }
        while (v16);
      }

      v5 = v81;
    }

    if ((_DWORD)a3)
      v23 = CFSTR("departureFrequency");
    else
      v23 = CFSTR("departure_frequency");
    objc_msgSend(v5, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v93;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v93 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v31 = [GEOPDDepartureFrequency alloc];
              if ((a3 & 1) != 0)
                v32 = -[GEOPDDepartureFrequency initWithJSON:](v31, "initWithJSON:", v30);
              else
                v32 = -[GEOPDDepartureFrequency initWithDictionary:](v31, "initWithDictionary:", v30);
              v33 = v32;
              -[GEOPDDepartureSequence addDepartureFrequency:](v6, v32);

            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v92, v102, 16);
        }
        while (v27);
      }

      v5 = v81;
    }

    if ((_DWORD)a3)
      v34 = CFSTR("operatingHours");
    else
      v34 = CFSTR("operating_hours");
    objc_msgSend(v5, "objectForKeyedSubscript:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v79 = v35;
      v36 = v35;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v89;
        do
        {
          for (k = 0; k != v38; ++k)
          {
            if (*(_QWORD *)v89 != v39)
              objc_enumerationMutation(v36);
            v41 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v87 = 0;
              v86 = 0;
              v42 = a3;
              _GEOPDTimeRangeFromDictionaryRepresentation(v41, (uint64_t)&v86, a3);
              v43 = v86;
              v44 = v87;
              -[GEOPDDepartureSequence _readOperatingHours](v6);
              if (-[GEOPDDepartureSequence _reserveOperatingHours:](v6, 1uLL))
              {
                v45 = *(_QWORD *)(v6 + 48) + 12 * *(_QWORD *)(v6 + 56);
                *(_QWORD *)v45 = v43;
                *(_DWORD *)(v45 + 8) = v44;
                ++*(_QWORD *)(v6 + 56);
              }
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v6 + 164) |= 0x20u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 160));
              *(_WORD *)(v6 + 164) |= 0x2000u;
              a3 = v42;
            }
          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
        }
        while (v38);
      }

      v5 = v81;
    }

    if ((_DWORD)a3)
      v46 = CFSTR("directionNameString");
    else
      v46 = CFSTR("direction_name_string");
    objc_msgSend(v5, "objectForKeyedSubscript:", v46, v79);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = (void *)objc_msgSend(v47, "copy");
      v49 = v48;
      *(_WORD *)(v6 + 164) |= 0x200u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 96), v48);

    }
    if ((_DWORD)a3)
      v50 = CFSTR("headsignString");
    else
      v50 = CFSTR("headsign_string");
    objc_msgSend(v5, "objectForKeyedSubscript:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = (void *)objc_msgSend(v51, "copy");
      v53 = v52;
      *(_WORD *)(v6 + 164) |= 0x800u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 112), v52);

    }
    if ((_DWORD)a3)
      v54 = CFSTR("nextStopId");
    else
      v54 = CFSTR("next_stop_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v80 = v55;
      v56 = v55;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v83;
        do
        {
          for (m = 0; m != v58; ++m)
          {
            if (*(_QWORD *)v83 != v59)
              objc_enumerationMutation(v56);
            v61 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * m);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v61, "unsignedLongLongValue");
              -[GEOPDDepartureSequence _readNextStopIds](v6);
              PBRepeatedUInt64Add();
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v6 + 164) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 160));
              *(_WORD *)(v6 + 164) |= 0x2000u;
            }
          }
          v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v82, v100, 16);
        }
        while (v58);
      }

      v5 = v81;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artwork"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = [GEOPBTransitArtwork alloc];
      if ((a3 & 1) != 0)
        v64 = -[GEOPBTransitArtwork initWithJSON:](v63, "initWithJSON:", v62);
      else
        v64 = -[GEOPBTransitArtwork initWithDictionary:](v63, "initWithDictionary:", v62);
      v65 = v64;
      v66 = v64;
      *(_WORD *)(v6 + 164) |= 0x40u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 72), v65);

    }
    if ((_DWORD)a3)
      v67 = CFSTR("transitId");
    else
      v67 = CFSTR("transit_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v67, v80);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v69 = objc_msgSend(v68, "unsignedLongLongValue");
      *(_WORD *)(v6 + 164) |= 0x2000u;
      *(_WORD *)(v6 + 164) |= 4u;
      *(_QWORD *)(v6 + 144) = v69;
    }

    if ((_DWORD)a3)
      v70 = CFSTR("displayName");
    else
      v70 = CFSTR("display_name");
    objc_msgSend(v5, "objectForKeyedSubscript:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v72 = (void *)objc_msgSend(v71, "copy");
      v73 = v72;
      *(_WORD *)(v6 + 164) |= 0x400u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 104), v72);

    }
    if ((_DWORD)a3)
      v74 = CFSTR("originName");
    else
      v74 = CFSTR("origin_name");
    objc_msgSend(v5, "objectForKeyedSubscript:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = (void *)objc_msgSend(v75, "copy");
      v77 = v76;
      *(_WORD *)(v6 + 164) |= 0x1000u;
      *(_WORD *)(v6 + 164) |= 0x2000u;
      objc_storeStrong((id *)(v6 + 128), v76);

    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDepartureSequenceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  int *v6;
  __int16 flags;
  __int16 v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  os_unfair_lock_s *v23;
  char IsDirty;
  PBDataReader *v25;
  void *v26;
  NSMutableArray *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _QWORD v42[18];

  v42[16] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  v6 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
  if (!self->_reader)
    goto LABEL_7;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x2BB0) != 0)
    goto LABEL_7;
  if ((flags & 0x40) != 0)
  {
    if ((GEOPBTransitArtworkIsDirty((os_unfair_lock_s *)self->_artwork) & 1) != 0)
    {
LABEL_7:
      os_unfair_lock_unlock(&self->_readerLock);
      -[GEOPDDepartureSequence readAll:]((uint64_t)self, 0);
      v8 = (__int16)self->_flags;
      if ((v8 & 1) != 0)
      {
        PBDataWriterWriteUint64Field();
        v8 = (__int16)self->_flags;
      }
      if ((v8 & 2) != 0)
        PBDataWriterWriteUint64Field();
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v9 = self->_departures;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v9);
            PBDataWriterWriteSubmessage();
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v10);
      }

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v13 = self->_departureFrequencys;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v13);
            PBDataWriterWriteSubmessage();
          }
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v14);
      }

      if (self->_operatingHoursCount)
      {
        v17 = 0;
        v18 = 0;
        do
        {
          v42[0] = 0;
          PBDataWriterPlaceMark();
          GEOPDTimeRangeWriteTo((uint64_t)&self->_operatingHours[v17]);
          PBDataWriterRecallMark();
          ++v18;
          ++v17;
        }
        while (v18 < self->_operatingHoursCount);
      }
      if (self->_directionNameString)
        PBDataWriterWriteStringField();
      if (self->_headsignString)
        PBDataWriterWriteStringField();
      if (self->_nextStopIds.count)
      {
        v19 = 0;
        do
        {
          PBDataWriterWriteUint64Field();
          ++v19;
        }
        while (v19 < self->_nextStopIds.count);
      }
      if (*(Class *)((char *)&self->super.super.isa + v6[201]))
        PBDataWriterWriteSubmessage();
      if ((*(_WORD *)&self->_flags & 4) != 0)
        PBDataWriterWriteUint64Field();
      if (self->_displayName)
        PBDataWriterWriteStringField();
      if (self->_originName)
        PBDataWriterWriteStringField();
      -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
      goto LABEL_44;
    }
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x1400) != 0)
    goto LABEL_7;
  if ((flags & 0x100) != 0)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = self->_departures;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v37;
      while (2)
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(obj);
          v23 = *(os_unfair_lock_s **)(*((_QWORD *)&v36 + 1) + 8 * k);
          if (v23)
          {
            os_unfair_lock_lock_with_options();
            IsDirty = _GEOPDDepartureIsDirty((uint64_t)v23);
            os_unfair_lock_unlock(v23 + 20);
            if ((IsDirty & 1) != 0)
            {

              v6 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
              goto LABEL_7;
            }
          }
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v20)
          continue;
        break;
      }
    }

  }
  v25 = self->_reader;
  objc_sync_enter(v25);
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeData:", v26);
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v25);
LABEL_44:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  unint64_t operatingHoursCount;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  PBUnknownFields *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDDepartureSequenceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_28;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDepartureSequence readAll:]((uint64_t)self, 0);
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 120) = self->_lineId;
    *(_WORD *)(v5 + 164) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 136) = self->_stopId;
    *(_WORD *)(v5 + 164) |= 2u;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = self->_departures;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDDepartureSequence addDeparture:](v5, v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = self->_departureFrequencys;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v33);
        -[GEOPDDepartureSequence addDepartureFrequency:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v16);
  }

  operatingHoursCount = self->_operatingHoursCount;
  if (operatingHoursCount)
  {
    -[GEOPDDepartureSequence _reserveOperatingHours:](v5, operatingHoursCount);
    memcpy(*(void **)(v5 + 48), self->_operatingHours, 12 * self->_operatingHoursCount);
    *(_QWORD *)(v5 + 56) = self->_operatingHoursCount;
  }
  v21 = -[NSString copyWithZone:](self->_directionNameString, "copyWithZone:", a3, (_QWORD)v33);
  v22 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v21;

  v23 = -[NSString copyWithZone:](self->_headsignString, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v23;

  PBRepeatedUInt64Copy();
  v25 = -[GEOPBTransitArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v25;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_QWORD *)(v5 + 144) = self->_transitId;
    *(_WORD *)(v5 + 164) |= 4u;
  }
  v27 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v27;

  v29 = -[NSString copyWithZone:](self->_originName, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v29;

  v31 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v31;
LABEL_28:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  __int16 flags;
  __int16 v6;
  NSMutableArray *departures;
  NSMutableArray *departureFrequencys;
  unint64_t operatingHoursCount;
  char v10;
  NSString *directionNameString;
  NSString *headsignString;
  GEOPBTransitArtwork *artwork;
  __int16 v15;
  NSString *displayName;
  NSString *originName;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOPDDepartureSequence readAll:]((uint64_t)self, 1);
  -[GEOPDDepartureSequence readAll:]((uint64_t)v4, 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 82);
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || (const void *)self->_lineId != v4[15])
      goto LABEL_18;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_18;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || (const void *)self->_stopId != v4[17])
      goto LABEL_18;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_18;
  }
  departures = self->_departures;
  if ((unint64_t)departures | (unint64_t)v4[11]
    && !-[NSMutableArray isEqual:](departures, "isEqual:"))
  {
    goto LABEL_18;
  }
  departureFrequencys = self->_departureFrequencys;
  if ((unint64_t)departureFrequencys | (unint64_t)v4[10])
  {
    if (!-[NSMutableArray isEqual:](departureFrequencys, "isEqual:"))
      goto LABEL_18;
  }
  operatingHoursCount = self->_operatingHoursCount;
  if ((const void *)operatingHoursCount != v4[7])
    goto LABEL_18;
  if (memcmp(self->_operatingHours, v4[6], 12 * operatingHoursCount))
    goto LABEL_18;
  directionNameString = self->_directionNameString;
  if ((unint64_t)directionNameString | (unint64_t)v4[12])
  {
    if (!-[NSString isEqual:](directionNameString, "isEqual:"))
      goto LABEL_18;
  }
  headsignString = self->_headsignString;
  if ((unint64_t)headsignString | (unint64_t)v4[14])
  {
    if (!-[NSString isEqual:](headsignString, "isEqual:"))
      goto LABEL_18;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_18;
  artwork = self->_artwork;
  if ((unint64_t)artwork | (unint64_t)v4[9])
  {
    if (!-[GEOPBTransitArtwork isEqual:](artwork, "isEqual:"))
      goto LABEL_18;
  }
  v15 = *((_WORD *)v4 + 82);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v15 & 4) == 0 || (const void *)self->_transitId != v4[18])
      goto LABEL_18;
  }
  else if ((v15 & 4) != 0)
  {
LABEL_18:
    v10 = 0;
    goto LABEL_19;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | (unint64_t)v4[13]
    && !-[NSString isEqual:](displayName, "isEqual:"))
  {
    goto LABEL_18;
  }
  originName = self->_originName;
  if ((unint64_t)originName | (unint64_t)v4[16])
    v10 = -[NSString isEqual:](originName, "isEqual:");
  else
    v10 = 1;
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSUInteger v13;
  unint64_t v15;

  -[GEOPDDepartureSequence readAll:]((uint64_t)self, 1);
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v15 = 2654435761u * self->_lineId;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v15 = 0;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_stopId;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSMutableArray hash](self->_departures, "hash");
  v6 = -[NSMutableArray hash](self->_departureFrequencys, "hash");
  v7 = PBHashBytes();
  v8 = -[NSString hash](self->_directionNameString, "hash");
  v9 = -[NSString hash](self->_headsignString, "hash");
  v10 = PBRepeatedUInt64Hash();
  v11 = -[GEOPBTransitArtwork hash](self->_artwork, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v12 = 2654435761u * self->_transitId;
  else
    v12 = 0;
  v13 = v4 ^ v15 ^ v5 ^ v6 ^ v8 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSString hash](self->_displayName, "hash");
  return v13 ^ -[NSString hash](self->_originName, "hash");
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 164) |= 8u;
    *(_WORD *)(v1 + 164) |= 0x2000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 160));
    v2 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;

    -[GEOPDDepartureSequence readAll:](v1, 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = *(id *)(v1 + 88);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "clearUnknownFields:", 1);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v5);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = *(id *)(v1 + 80);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "clearUnknownFields:", 1, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

    return objc_msgSend(*(id *)(v1 + 72), "clearUnknownFields:", 1);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_headsignString, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_directionNameString, 0);
  objc_storeStrong((id *)&self->_departures, 0);
  objc_storeStrong((id *)&self->_departureFrequencys, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
