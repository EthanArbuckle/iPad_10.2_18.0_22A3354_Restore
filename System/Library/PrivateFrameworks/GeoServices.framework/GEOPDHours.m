@implementation GEOPDHours

+ (BOOL)operatingHoursAvailableForPlaceData:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__GEOPDHours_PlaceDataExtras__operatingHoursAvailableForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 9, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__GEOPDHours_PlaceDataExtras__operatingHoursAvailableForPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  id v5;

  -[GEOPDComponentValue hours](a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "daysCount") || objc_msgSend(v5, "timeRangesCount"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }

}

+ (id)_allHoursForPlaceData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__GEOPDHours_PlaceDataExtras___allHoursForPlaceData___block_invoke;
  v8[3] = &unk_1E1C09968;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateValidComponentValuesOfType:usingBlock:", 9, v8);

  return v6;
}

void __53__GEOPDHours_PlaceDataExtras___allHoursForPlaceData___block_invoke(uint64_t a1, id *a2)
{
  void *v3;
  void *v4;

  -[GEOPDComponentValue hours](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

+ (BOOL)currentOperatingHoursAvailableForPlaceData:(id)a3 withTimeZone:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char HasOperatingHours;

  v6 = a4;
  objc_msgSend(a1, "_allHoursForPlaceData:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HasOperatingHours = _geoHasOperatingHours(v7, v8, v6);

  }
  else
  {
    HasOperatingHours = 0;
  }

  return HasOperatingHours;
}

+ (id)completeOperatingHoursForPlaceData:(id)a3 date:(id)a4 withTimeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_allHoursForPlaceData:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__36;
    v20 = __Block_byref_object_dispose__36;
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__GEOPDHours_PlaceDataExtras__completeOperatingHoursForPlaceData_date_withTimeZone___block_invoke;
    v15[3] = &unk_1E1C099B0;
    v15[4] = &v16;
    v12 = (void *)MEMORY[0x18D765024](v15);
    _geoNormalizedAndViewHourModelsForPDHours(v11, v9, v10, 0, 0, v12);
    v13 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __84__GEOPDHours_PlaceDataExtras__completeOperatingHoursForPlaceData_date_withTimeZone___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (GEOPDHours)init
{
  GEOPDHours *v2;
  GEOPDHours *v3;
  GEOPDHours *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDHours;
  v2 = -[GEOPDHours init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDHours)initWithData:(id)a3
{
  GEOPDHours *v3;
  GEOPDHours *v4;
  GEOPDHours *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDHours;
  v3 = -[GEOPDHours initWithData:](&v7, sel_initWithData_, a3);
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
  -[GEOPDHours clearTimeRanges](self, "clearTimeRanges");
  v3.receiver = self;
  v3.super_class = (Class)GEOPDHours;
  -[GEOPDHours dealloc](&v3, sel_dealloc);
}

- (void)_readDays
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDays_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)daysCount
{
  -[GEOPDHours _readDays]((uint64_t)self);
  return self->_days.count;
}

- (int)days
{
  -[GEOPDHours _readDays]((uint64_t)self);
  return self->_days.list;
}

- (void)clearDays
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Clear();
}

- (void)addDay:(int)a3
{
  -[GEOPDHours _readDays]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (int)dayAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_days;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDHours _readDays]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Set();
}

- (id)daysAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C0BB28[a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeRanges_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)timeRangesCount
{
  -[GEOPDHours _readTimeRanges]((uint64_t)self);
  return self->_timeRangesCount;
}

- (GEOPDLocalTimeRange)timeRanges
{
  -[GEOPDHours _readTimeRanges]((uint64_t)self);
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
    v4 = *(_QWORD *)(a1 + 56);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 64);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 48), 12 * v9, 0x436556D9uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 64) = v9;
      *(_QWORD *)(a1 + 48) = result;
      bzero((void *)(result + 12 * *(_QWORD *)(a1 + 56)), 12 * (v9 - *(_QWORD *)(a1 + 56)));
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
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_timeRangesSpace = 0;
  self->_timeRangesCount = 0;
  free(self->_timeRanges);
  self->_timeRanges = 0;
}

- (void)addTimeRange:(GEOPDLocalTimeRange)a3
{
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  uint64_t v4;
  GEOPDLocalTimeRange *v6;

  var2 = a3.var2;
  v4 = *(_QWORD *)&a3.var0;
  -[GEOPDHours _readTimeRanges]((uint64_t)self);
  if (self && -[GEOPDHours _reserveTimeRanges:]((uint64_t)self, 1uLL))
  {
    v6 = &self->_timeRanges[self->_timeRangesCount];
    *(_QWORD *)&v6->var0 = v4;
    v6->var2 = var2;
    ++self->_timeRangesCount;
  }
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (GEOPDLocalTimeRange)timeRangeAtIndex:(unint64_t)a3
{
  unint64_t timeRangesCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOPDLocalTimeRange *v10;
  uint64_t v11;
  $7D24B5AD5894795FD85A0EE1D817D743 var2;
  GEOPDLocalTimeRange result;

  -[GEOPDHours _readTimeRanges]((uint64_t)self);
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

- (void)setTimeRanges:(GEOPDLocalTimeRange *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[GEOPDHours clearTimeRanges](self, "clearTimeRanges");
  if (-[GEOPDHours _reserveTimeRanges:]((uint64_t)self, a4))
  {
    memcpy(self->_timeRanges, a3, 12 * a4);
    self->_timeRangesCount = a4;
  }
}

- (void)_readHoursThreshold
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
        GEOPDHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHoursThreshold_tags_4382);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasHoursThreshold
{
  -[GEOPDHours _readHoursThreshold]((uint64_t)self);
  return self->_hoursThreshold != 0;
}

- (GEOPDHoursThreshold)hoursThreshold
{
  -[GEOPDHours _readHoursThreshold]((uint64_t)self);
  return self->_hoursThreshold;
}

- (void)setHoursThreshold:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_hoursThreshold, a3);
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
  v8.super_class = (Class)GEOPDHours;
  -[GEOPDHours description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDHours dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDHours _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1 + 3;
    if (a1[4])
    {
      v7 = 0;
      do
      {
        v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E1C0BB28[v8];
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = a1 + 3;
      }
      while (v7 < a1[4]);
    }
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("day"));

  }
  if (a1[7])
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[7]);
    if (a1[7])
    {
      v11 = 0;
      v12 = 0;
      do
      {
        _GEOWiFiQualityTimeRangeDictionaryRepresentation((unsigned int *)(a1[6] + v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);

        ++v12;
        v11 += 12;
      }
      while (v12 < a1[7]);
    }
    if (a2)
      v14 = CFSTR("timeRange");
    else
      v14 = CFSTR("time_range");
    objc_msgSend(v4, "setObject:forKey:", v10, v14);

  }
  objc_msgSend(a1, "hoursThreshold");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("hoursThreshold");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("hours_threshold");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  v19 = (void *)a1[2];
  if (v19)
  {
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __40__GEOPDHours__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E1C00600;
      v23 = v22;
      v27 = v23;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);
      v24 = v23;

      v21 = v24;
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDHours _dictionaryRepresentation:](self, 1);
}

void __40__GEOPDHours__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDHours)initWithDictionary:(id)a3
{
  return (GEOPDHours *)-[GEOPDHours _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v24;
  void *v25;
  GEOPDHoursThreshold *v26;
  void *v27;
  void *v29;
  id v30;
  int v31;
  uint64_t v32;
  unsigned int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (!a1)
  {
    v7 = 0;
    goto LABEL_56;
  }
  v7 = (void *)objc_msgSend(a1, "init");
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("day"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = a3;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_34;
    v29 = v8;
    v30 = v6;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v3 = v8;
    v9 = objc_msgSend((id)v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (!v9)
      goto LABEL_33;
    v10 = v9;
    v11 = *(_QWORD *)v39;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation((id)v3);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
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
        objc_msgSend(v7, "addDay:", v15);
      }
      v10 = objc_msgSend((id)v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (!v10)
      {
LABEL_33:

        v8 = v29;
        v6 = v30;
LABEL_34:

        if (a3)
          v16 = CFSTR("timeRange");
        else
          v16 = CFSTR("time_range");
        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v35 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v33 = 0;
                  v32 = 0;
                  _GEOWiFiQualityTimeRangeFromDictionaryRepresentation(v23, (uint64_t)&v32);
                  v3 = v3 & 0xFFFFFFFF00000000 | v33;
                  objc_msgSend(v7, "addTimeRange:", v32, v3);
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
            }
            while (v20);
          }

          a3 = v31;
        }

        if (a3)
          v24 = CFSTR("hoursThreshold");
        else
          v24 = CFSTR("hours_threshold");
        objc_msgSend(v6, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = [GEOPDHoursThreshold alloc];
          if (v26)
            v27 = (void *)-[GEOPDHoursThreshold _initWithDictionary:isJSON:](v26, v25, a3);
          else
            v27 = 0;
          objc_msgSend(v7, "setHoursThreshold:", v27);

        }
        break;
      }
    }
  }
LABEL_56:

  return v7;
}

- (GEOPDHours)initWithJSON:(id)a3
{
  return (GEOPDHours *)-[GEOPDHours _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_4385;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4386;
    GEOPDHoursReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDHoursIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDHoursReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1E) == 0))
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
    -[GEOPDHours readAll:](self, "readAll:", 0);
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
        GEOPDLocalTimeRangeWriteTo((uint64_t)&self->_timeRanges[v7]);
        PBDataWriterRecallMark();
        ++v8;
        ++v7;
      }
      while (v8 < self->_timeRangesCount);
    }
    if (self->_hoursThreshold)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
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
  -[GEOPDHours readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 20) = self->_readerMarkPos;
  *((_DWORD *)v12 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPDHours daysCount](self, "daysCount"))
  {
    objc_msgSend(v12, "clearDays");
    v4 = -[GEOPDHours daysCount](self, "daysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v12, "addDay:", -[GEOPDHours dayAtIndex:](self, "dayAtIndex:", i));
    }
  }
  if (-[GEOPDHours timeRangesCount](self, "timeRangesCount"))
  {
    objc_msgSend(v12, "clearTimeRanges");
    v7 = -[GEOPDHours timeRangesCount](self, "timeRangesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        v10 = -[GEOPDHours timeRangeAtIndex:](self, "timeRangeAtIndex:", j);
        objc_msgSend(v12, "addTimeRange:", v10, v11);
      }
    }
  }
  if (self->_hoursThreshold)
    objc_msgSend(v12, "setHoursThreshold:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  unint64_t timeRangesCount;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDHoursReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDHours readAll:](self, "readAll:", 0);
  PBRepeatedInt32Copy();
  timeRangesCount = self->_timeRangesCount;
  if (timeRangesCount)
  {
    -[GEOPDHours _reserveTimeRanges:](v5, timeRangesCount);
    memcpy(*(void **)(v5 + 48), self->_timeRanges, 12 * self->_timeRangesCount);
    *(_QWORD *)(v5 + 56) = self->_timeRangesCount;
  }
  v9 = -[GEOPDHoursThreshold copyWithZone:](self->_hoursThreshold, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timeRangesCount;
  char v6;
  GEOPDHoursThreshold *hoursThreshold;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDHours readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedInt32IsEqual())
    && (timeRangesCount = self->_timeRangesCount, timeRangesCount == *((_QWORD *)v4 + 7))
    && !memcmp(self->_timeRanges, *((const void **)v4 + 6), 12 * timeRangesCount))
  {
    hoursThreshold = self->_hoursThreshold;
    if ((unint64_t)hoursThreshold | *((_QWORD *)v4 + 9))
      v6 = -[GEOPDHoursThreshold isEqual:](hoursThreshold, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOPDHours readAll:](self, "readAll:", 1);
  v3 = PBRepeatedInt32Hash();
  v4 = PBHashBytes();
  return v4 ^ v3 ^ -[GEOPDHoursThreshold hash](self->_hoursThreshold, "hash");
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
  GEOPDHoursThreshold *hoursThreshold;
  void *v13;
  void *v14;
  id v15;
  char v16;
  _QWORD *v17;

  v17 = a3;
  objc_msgSend(v17, "readAll:", 0);
  v4 = objc_msgSend(v17, "daysCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOPDHours addDay:](self, "addDay:", objc_msgSend(v17, "dayAtIndex:", i));
  }
  v7 = objc_msgSend(v17, "timeRangesCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
    {
      v10 = objc_msgSend(v17, "timeRangeAtIndex:", j);
      -[GEOPDHours addTimeRange:](self, "addTimeRange:", v10, v11);
    }
  }
  hoursThreshold = self->_hoursThreshold;
  v13 = v17;
  v14 = (void *)v17[9];
  if (hoursThreshold)
  {
    if (v14)
    {
      v15 = v14;
      v16 = *((_BYTE *)v15 + 24);
      if ((v16 & 2) != 0)
      {
        hoursThreshold->_openingSoonMessageThresholdSecond = *((_DWORD *)v15 + 5);
        *(_BYTE *)&hoursThreshold->_flags |= 2u;
        v16 = *((_BYTE *)v15 + 24);
      }
      if ((v16 & 1) != 0)
      {
        hoursThreshold->_closingSoonMessageThresholdSecond = *((_DWORD *)v15 + 4);
        *(_BYTE *)&hoursThreshold->_flags |= 1u;
      }

      goto LABEL_16;
    }
  }
  else if (v14)
  {
    -[GEOPDHours setHoursThreshold:](self, "setHoursThreshold:");
LABEL_16:
    v13 = v17;
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
      GEOPDHoursReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_4389);
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
  GEOPDHoursThreshold *hoursThreshold;
  PBUnknownFields *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDHours readAll:](self, "readAll:", 0);
    hoursThreshold = self->_hoursThreshold;
    if (hoursThreshold)
    {
      v8 = hoursThreshold->_unknownFields;
      hoursThreshold->_unknownFields = 0;

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoursThreshold, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
