@implementation GEOWiFiQualityHours

- (GEOWiFiQualityHours)init
{
  GEOWiFiQualityHours *v2;
  GEOWiFiQualityHours *v3;
  GEOWiFiQualityHours *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityHours;
  v2 = -[GEOWiFiQualityHours init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityHours)initWithData:(id)a3
{
  GEOWiFiQualityHours *v3;
  GEOWiFiQualityHours *v4;
  GEOWiFiQualityHours *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityHours;
  v3 = -[GEOWiFiQualityHours initWithData:](&v7, sel_initWithData_, a3);
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
  -[GEOWiFiQualityHours clearTimeRanges](self, "clearTimeRanges");
  v3.receiver = self;
  v3.super_class = (Class)GEOWiFiQualityHours;
  -[GEOWiFiQualityHours dealloc](&v3, sel_dealloc);
}

- (void)_readDays
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDays_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)daysCount
{
  -[GEOWiFiQualityHours _readDays]((uint64_t)self);
  return self->_days.count;
}

- (int)days
{
  -[GEOWiFiQualityHours _readDays]((uint64_t)self);
  return self->_days.list;
}

- (void)clearDays
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Clear();
}

- (void)addDays:(int)a3
{
  -[GEOWiFiQualityHours _readDays]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (int)daysAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_days;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWiFiQualityHours _readDays]((uint64_t)self);
  p_days = &self->_days;
  count = self->_days.count;
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
  return p_days->list[a3];
}

- (void)setDays:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Set();
}

- (id)daysAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C09F90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDays:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVERYDAY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUNDAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONDAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TUESDAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THURSDAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRIDAY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SATURDAY")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readTimeRanges
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
        GEOWiFiQualityHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeRanges_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)timeRangesCount
{
  -[GEOWiFiQualityHours _readTimeRanges]((uint64_t)self);
  return self->_timeRangesCount;
}

- (GEOWiFiQualityTimeRange)timeRanges
{
  -[GEOWiFiQualityHours _readTimeRanges]((uint64_t)self);
  return self->_timeRanges;
}

- (uint64_t)_reserveTimeRanges:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 56);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (12 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 40), 12 * v9, 0xE2BA7521uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 56) = v9;
      *(_QWORD *)(a1 + 40) = result;
      bzero((void *)(result + 12 * *(_QWORD *)(a1 + 48)), 12 * (v9 - *(_QWORD *)(a1 + 48)));
      return 1;
    }
  }
  return result;
}

- (void)clearTimeRanges
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  self->_timeRangesSpace = 0;
  self->_timeRangesCount = 0;
  free(self->_timeRanges);
  self->_timeRanges = 0;
}

- (void)addTimeRanges:(GEOWiFiQualityTimeRange)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  uint64_t v4;
  GEOWiFiQualityTimeRange *v6;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  -[GEOWiFiQualityHours _readTimeRanges]((uint64_t)self);
  if (self && -[GEOWiFiQualityHours _reserveTimeRanges:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_timeRanges[self->_timeRangesCount];
    *(_QWORD *)&v6->var0 = v4;
    v6->var2 = var2;
    ++self->_timeRangesCount;
  }
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (GEOWiFiQualityTimeRange)timeRangesAtIndex:(unint64_t)a3
{
  unint64_t timeRangesCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOWiFiQualityTimeRange *v10;
  uint64_t v11;
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  GEOWiFiQualityTimeRange result;

  -[GEOWiFiQualityHours _readTimeRanges]((uint64_t)self);
  timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, timeRangesCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  v10 = &self->_timeRanges[a3];
  v11 = *(_QWORD *)&v10->var0;
  var2 = v10->var2;
  result.var0 = v11;
  result.var1 = HIDWORD(v11);
  result.var2 = var2;
  return result;
}

- (void)setTimeRanges:(GEOWiFiQualityTimeRange *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  -[GEOWiFiQualityHours clearTimeRanges](self, "clearTimeRanges");
  if (-[GEOWiFiQualityHours _reserveTimeRanges:]((uint64_t)self, a4))
  {
    memcpy(self->_timeRanges, a3, 12 * a4);
    self->_timeRangesCount = a4;
  }
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
  v8.super_class = (Class)GEOWiFiQualityHours;
  -[GEOWiFiQualityHours description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiQualityHours dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityHours _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  int v5;
  void *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  const __CFString *v15;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[3])
    {
      v5 = a2;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1 + 2;
      if (a1[3])
      {
        v8 = 0;
        do
        {
          v9 = *(int *)(*v7 + 4 * v8);
          if (v9 >= 8)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = off_1E1C09F90[v9];
          }
          objc_msgSend(v6, "addObject:", v10);

          ++v8;
          v7 = a1 + 2;
        }
        while (v8 < a1[3]);
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("days"));

      a2 = v5;
    }
    if (a1[6])
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[6]);
      if (a1[6])
      {
        v12 = 0;
        v13 = 0;
        do
        {
          _GEOWiFiQualityTimeRangeDictionaryRepresentation((unsigned int *)(a1[5] + v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v14);

          ++v13;
          v12 += 12;
        }
        while (v13 < a1[6]);
      }
      if (a2)
        v15 = CFSTR("timeRanges");
      else
        v15 = CFSTR("time_ranges");
      objc_msgSend(v4, "setObject:forKey:", v11, v15);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiQualityHours _dictionaryRepresentation:](self, 1);
}

- (GEOWiFiQualityHours)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityHours *)-[GEOWiFiQualityHours _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  unint64_t v3;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v25;
  id v26;
  uint64_t v27;
  unsigned int v28;
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
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!a1)
  {
    v7 = 0;
    goto LABEL_49;
  }
  v7 = (void *)objc_msgSend(a1, "init");
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("days"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_34;
    v26 = v6;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = v8;
    v3 = v8;
    v9 = objc_msgSend((id)v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (!v9)
      goto LABEL_33;
    v10 = v9;
    v11 = *(_QWORD *)v34;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation((id)v3);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          if ((objc_msgSend(v14, "isEqualToString:", CFSTR("EVERYDAY")) & 1) != 0)
          {
            v15 = 0;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SUNDAY")) & 1) != 0)
          {
            v15 = 1;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("MONDAY")) & 1) != 0)
          {
            v15 = 2;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("TUESDAY")) & 1) != 0)
          {
            v15 = 3;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) != 0)
          {
            v15 = 4;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("THURSDAY")) & 1) != 0)
          {
            v15 = 5;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("FRIDAY")) & 1) != 0)
          {
            v15 = 6;
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("SATURDAY")))
          {
            v15 = 7;
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v15 = objc_msgSend(v13, "intValue");
        }
        objc_msgSend(v7, "addDays:", v15);
      }
      v10 = objc_msgSend((id)v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (!v10)
      {
LABEL_33:

        v6 = v26;
        v8 = v25;
LABEL_34:

        if (a3)
          v16 = CFSTR("timeRanges");
        else
          v16 = CFSTR("time_ranges");
        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v30 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v28 = 0;
                  v27 = 0;
                  _GEOWiFiQualityTimeRangeFromDictionaryRepresentation(v23, (uint64_t)&v27);
                  v3 = v3 & 0xFFFFFFFF00000000 | v28;
                  objc_msgSend(v7, "addTimeRanges:", v27, v3);
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v20);
          }

        }
        break;
      }
    }
  }
LABEL_49:

  return v7;
}

- (GEOWiFiQualityHours)initWithJSON:(id)a3
{
  return (GEOWiFiQualityHours *)-[GEOWiFiQualityHours _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_261;
    else
      v8 = (int *)&readAll__nonRecursiveTag_262;
    GEOWiFiQualityHoursReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityHoursIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityHoursReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWiFiQualityHours readAll:](self, "readAll:", 0);
    if (self->_days.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_days.count);
    }
    if (self->_timeRangesCount)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOWiFiQualityTimeRangeWriteTo((uint64_t)&self->_timeRanges[v7]);
        PBDataWriterRecallMark();
        ++v8;
        ++v7;
      }
      while (v8 < self->_timeRangesCount);
    }
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  uint64_t v10;
  unsigned int v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOWiFiQualityHours readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 16) = self->_readerMarkPos;
  *((_DWORD *)v12 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOWiFiQualityHours daysCount](self, "daysCount"))
  {
    objc_msgSend(v12, "clearDays");
    v4 = -[GEOWiFiQualityHours daysCount](self, "daysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v12, "addDays:", -[GEOWiFiQualityHours daysAtIndex:](self, "daysAtIndex:", i));
    }
  }
  if (-[GEOWiFiQualityHours timeRangesCount](self, "timeRangesCount"))
  {
    objc_msgSend(v12, "clearTimeRanges");
    v7 = -[GEOWiFiQualityHours timeRangesCount](self, "timeRangesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        v10 = -[GEOWiFiQualityHours timeRangesAtIndex:](self, "timeRangesAtIndex:", j);
        objc_msgSend(v12, "addTimeRanges:", v10, v11);
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  PBDataReader *reader;
  PBDataReader *v6;
  unint64_t timeRangesCount;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v6 = reader;
    objc_sync_enter(v6);
    if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOWiFiQualityHoursReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v6);

      return (id)v4;
    }
    objc_sync_exit(v6);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWiFiQualityHours readAll:](self, "readAll:", 0);
  PBRepeatedInt32Copy();
  timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount)
  {
    -[GEOWiFiQualityHours _reserveTimeRanges:](v4, timeRangesCount);
    memcpy(*(void **)(v4 + 40), self->_timeRanges, 12 * self->_timeRangesCount);
    *(_QWORD *)(v4 + 48) = self->_timeRangesCount;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t timeRangesCount;
  BOOL v6;

  v4 = (const void **)a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOWiFiQualityHours readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedInt32IsEqual())
    && (timeRangesCount = self->_timeRangesCount, (const void *)timeRangesCount == v4[6])
    && memcmp(self->_timeRanges, v4[5], 12 * timeRangesCount) == 0;

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  -[GEOWiFiQualityHours readAll:](self, "readAll:", 1);
  v2 = PBRepeatedInt32Hash();
  return PBHashBytes() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  unsigned int v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = objc_msgSend(v12, "daysCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOWiFiQualityHours addDays:](self, "addDays:", objc_msgSend(v12, "daysAtIndex:", i));
  }
  v7 = objc_msgSend(v12, "timeRangesCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
    {
      v10 = objc_msgSend(v12, "timeRangesAtIndex:", j);
      -[GEOWiFiQualityHours addTimeRanges:](self, "addTimeRanges:", v10, v11);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
