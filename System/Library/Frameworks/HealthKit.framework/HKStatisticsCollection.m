@implementation HKStatisticsCollection

- (id)asJSONObject
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sources"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HKStatisticsCollection sources](self, "sources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "asJSONObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("statistics"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HKStatisticsCollection statistics](self, "statistics", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "asJSONObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  return v3;
}

- (HKStatisticsCollection)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKStatisticsCollection)initWithAnchorDate:(id)a3 statisticsInterval:(id)a4
{
  return -[HKStatisticsCollection initWithAnchorDate:statisticsInterval:emptyStatisticsConstructor:](self, "initWithAnchorDate:statisticsInterval:emptyStatisticsConstructor:", a3, a4, &__block_literal_global_111);
}

uint64_t __64__HKStatisticsCollection_initWithAnchorDate_statisticsInterval___block_invoke()
{
  return 0;
}

- (HKStatisticsCollection)initWithAnchorDate:(id)a3 statisticsInterval:(id)a4 emptyStatisticsConstructor:(id)a5
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  HKStatisticsCollection *v14;
  HKStatisticsCollection *v15;
  uint64_t v16;
  NSDateComponents *statisticsInterval;
  void *v18;
  NSDateComponents *v19;
  void *v20;
  uint64_t v21;
  id emptyStatisticsConstructor;
  uint64_t v23;
  NSMutableDictionary *statisticsByIndex;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ must be given a statistics constructor"), objc_opt_class());
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ must have an anchor date"), objc_opt_class());
LABEL_3:
  objc_msgSend(v10, "hk_approximateDuration");
  v13 = v12;
  if (v12 == 0.0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ statistics interval must be non zero: %@"), objc_opt_class(), v10);
  v26.receiver = self;
  v26.super_class = (Class)HKStatisticsCollection;
  v14 = -[HKStatisticsCollection init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_anchorDate, a3);
    v16 = objc_msgSend(v10, "copy");
    statisticsInterval = v15->_statisticsInterval;
    v15->_statisticsInterval = (NSDateComponents *)v16;

    -[NSDateComponents calendar](v15->_statisticsInterval, "calendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = v15->_statisticsInterval;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateComponents setCalendar:](v19, "setCalendar:", v20);

    }
    v21 = objc_msgSend(v11, "copy");
    emptyStatisticsConstructor = v15->_emptyStatisticsConstructor;
    v15->_emptyStatisticsConstructor = (id)v21;

    v15->_approximateStatisticsInterval = v13;
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    statisticsByIndex = v15->_statisticsByIndex;
    v15->_statisticsByIndex = (NSMutableDictionary *)v23;

  }
  return v15;
}

- (HKStatistics)statisticsForDate:(NSDate *)date
{
  void *v4;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *statisticsByIndex;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void (**emptyStatisticsConstructor)(id, void *, void *);
  void *v12;
  void *v13;
  uint64_t v15;

  v15 = 0;
  -[HKStatisticsCollection _statisticsDateIntervalAndIndex:forDate:](self, "_statisticsDateIntervalAndIndex:forDate:", &v15, date);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    statisticsByIndex = self->_statisticsByIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](statisticsByIndex, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      emptyStatisticsConstructor = (void (**)(id, void *, void *))self->_emptyStatisticsConstructor;
      objc_msgSend(v4, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      emptyStatisticsConstructor[2](emptyStatisticsConstructor, v12, v13);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v10 = 0;
  }

  return (HKStatistics *)v10;
}

- (void)enumerateStatisticsFromDate:(NSDate *)startDate toDate:(NSDate *)endDate withBlock:(void *)block
{
  NSDate *v8;
  void *v9;
  NSDate *v10;
  _QWORD v11[5];
  id v12;

  v10 = startDate;
  v8 = endDate;
  v9 = block;
  if (v10)
  {
    if (v8)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("End date cannot be nil"));
    if (!v9)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Start date cannot be nil"));
  if (!v8)
    goto LABEL_7;
LABEL_3:
  if (v9)
  {
LABEL_4:
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__HKStatisticsCollection_enumerateStatisticsFromDate_toDate_withBlock___block_invoke;
    v11[3] = &unk_1E37F5348;
    v11[4] = self;
    v12 = v9;
    -[HKStatisticsCollection _enumerateStatisticsIndexesFromDate:toDate:withBlock:](self, "_enumerateStatisticsIndexesFromDate:toDate:withBlock:", v10, v8, v11);

  }
LABEL_5:

}

void __71__HKStatisticsCollection_enumerateStatisticsFromDate_toDate_withBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_statisticsForIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = v6;
  }
  else
  {
    *a3 = 1;
  }

}

- (NSArray)statistics
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_statisticsByIndex, "copy");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v7, "addObject:", v15);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (NSSet)sources
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *cachedSources;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_cachedSources)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSMutableDictionary allValues](self->_statisticsByIndex, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "sources");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setWithArray:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v4);
    v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
    cachedSources = self->_cachedSources;
    self->_cachedSources = v13;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_cachedSources;
}

- (unint64_t)statisticsCount
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableDictionary count](self->_statisticsByIndex, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_maxSumQuantityStatistics
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_statisticsByIndex, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "sumQuantity", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v8, "compare:", v12);

        if (v13 == -1 || v8 == 0)
        {
          objc_msgSend(v11, "sumQuantity");
          v15 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_minSumQuantityStatistics
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_statisticsByIndex, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "sumQuantity", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v8, "compare:", v12);

        if (v13 == 1 || v8 == 0)
        {
          objc_msgSend(v11, "sumQuantity");
          v15 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_mostRecentQuantityStatistics
{
  void *v2;
  void *v3;

  -[HKStatisticsCollection _statisticsForLastIndex](self, "_statisticsForLastIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostRecentQuantity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mostRecentQuantityDateInterval
{
  void *v2;
  void *v3;

  -[HKStatisticsCollection _statisticsForLastIndex](self, "_statisticsForLastIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostRecentQuantityDateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_clearSourcesCache
{
  os_unfair_lock_s *p_lock;
  NSSet *cachedSources;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedSources = self->_cachedSources;
  self->_cachedSources = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_insertStatistics:(id)a3
{
  id v4;
  HKDateInterval *v5;
  void *v6;
  void *v7;
  HKDateInterval *v8;
  void *v9;
  void *v10;
  int v11;
  os_unfair_lock_s *p_lock;
  uint64_t v13;
  NSMutableDictionary *statisticsByIndex;
  void *v15;
  uint64_t v17;

  v4 = a3;
  -[HKStatisticsCollection _clearSourcesCache](self, "_clearSourcesCache");
  v5 = [HKDateInterval alloc];
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKDateInterval initWithStartDate:endDate:](v5, "initWithStartDate:endDate:", v6, v7);

  v17 = 0;
  -[HKDateInterval startDate](v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStatisticsCollection _statisticsDateIntervalAndIndex:forDate:](self, "_statisticsDateIntervalAndIndex:forDate:", &v17, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v8);

  if (v11)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v13 = objc_msgSend(v4, "dataCount");
    statisticsByIndex = self->_statisticsByIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[NSMutableDictionary setObject:forKey:](statisticsByIndex, "setObject:forKey:", v4, v15);
    else
      -[NSMutableDictionary removeObjectForKey:](statisticsByIndex, "removeObjectForKey:", v15);

    os_unfair_lock_unlock(p_lock);
  }

  return v11;
}

- (void)_resetStatistics:(id)a3
{
  id v4;
  NSSet *cachedSources;
  NSMutableDictionary *v6;
  NSMutableDictionary *statisticsByIndex;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  cachedSources = self->_cachedSources;
  self->_cachedSources = 0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  statisticsByIndex = self->_statisticsByIndex;
  self->_statisticsByIndex = v6;

  os_unfair_lock_unlock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        -[HKStatisticsCollection _insertStatistics:](self, "_insertStatistics:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_enumerateTimePeriodsFromDate:(id)a3 toDate:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__49;
  v23[4] = __Block_byref_object_dispose__49;
  v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__49;
  v21[4] = __Block_byref_object_dispose__49;
  v22 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 1;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__49;
  v18[4] = __Block_byref_object_dispose__49;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__HKStatisticsCollection__enumerateTimePeriodsFromDate_toDate_withBlock___block_invoke;
  v12[3] = &unk_1E37F5370;
  v14 = v23;
  v15 = v21;
  v12[4] = self;
  v16 = v18;
  v17 = v20;
  v11 = v10;
  v13 = v11;
  -[HKStatisticsCollection _enumerateStatisticsIndexesFromDate:toDate:withBlock:](self, "_enumerateStatisticsIndexesFromDate:toDate:withBlock:", v8, v9, v12);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
}

uint64_t __73__HKStatisticsCollection__enumerateTimePeriodsFromDate_toDate_withBlock___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;
  id obj;

  v3 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v3 + 40);
  v5 = (id *)(v3 + 40);
  v4 = v6;
  v7 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v7 + 40);
  v9 = (id *)(v7 + 40);
  v8 = v10;
  if (v4 && v8)
  {
    objc_storeStrong(v5, v8);
    v11 = *(void **)(a1[4] + 56);
    ++*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
    objc_msgSend(v11, "hk_dateByAddingInterval:toDate:");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[7] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    v15 = (void *)a1[4];
    v17 = v8;
    obj = v4;
    objc_msgSend(v15, "_timePeriodForStatisticsAtIndex:startDate:endDate:", a2, &obj, &v17);
    objc_storeStrong(v5, obj);
    objc_storeStrong(v9, v17);
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)enumeratePopulatedStatisticsWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary copy](self->_statisticsByIndex, "copy");
  os_unfair_lock_unlock(p_lock);
  v18 = 0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v4[2](v4, v13, &v18);
          if (v18)
          {

            goto LABEL_12;
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)_statisticsForLastIndex
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_statisticsByIndex, "copy");
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v13, "integerValue") > v7)
          v7 = objc_msgSend(v13, "integerValue");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v19 = 0;
    v20 = 0;
    -[HKStatisticsCollection _timePeriodForStatisticsAtIndex:startDate:endDate:](self, "_timePeriodForStatisticsAtIndex:startDate:endDate:", v7, &v20, &v19);
    v16 = v20;
    v17 = v19;
    (*((void (**)(void))self->_emptyStatisticsConstructor + 2))();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)_statisticsForIndex:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *statisticsByIndex;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v12;
  id v13;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  statisticsByIndex = self->_statisticsByIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](statisticsByIndex, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  if (!v8)
  {
    v12 = 0;
    v13 = 0;
    -[HKStatisticsCollection _timePeriodForStatisticsAtIndex:startDate:endDate:](self, "_timePeriodForStatisticsAtIndex:startDate:endDate:", a3, &v13, &v12);
    v9 = v13;
    v10 = v12;
    (*((void (**)(void))self->_emptyStatisticsConstructor + 2))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_timePeriodForStatisticsAtIndex:(int64_t)a3 startDate:(id *)a4 endDate:(id *)a5
{
  void *v9;
  id v10;

  -[NSDateComponents hk_dateByAddingInterval:toDate:](self->_statisticsInterval, "hk_dateByAddingInterval:toDate:", a3, self->_anchorDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4)
  {
    *a4 = objc_retainAutorelease(v9);
    v9 = v10;
  }
  if (a5)
  {
    -[NSDateComponents hk_dateByAddingInterval:toDate:](self->_statisticsInterval, "hk_dateByAddingInterval:toDate:", a3 + 1, self->_anchorDate);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v10;
  }

}

- (void)_enumerateStatisticsIndexesFromDate:(id)a3 toDate:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, char *);
  void *v11;
  void *v12;
  void *v13;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, char *))a5;
  if (v8)
  {
    if (v9)
    {
      v17 = 0;
      -[HKStatisticsCollection _statisticsDateIntervalAndIndex:forDate:](self, "_statisticsDateIntervalAndIndex:forDate:", &v17, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v16 = 0;
        -[HKStatisticsCollection _statisticsDateIntervalAndIndex:forDate:](self, "_statisticsDateIntervalAndIndex:forDate:", &v16, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v15 = 0;
          do
          {
            v13 = (void *)MEMORY[0x19AEC7968]();
            v10[2](v10, v17++, &v15);
            objc_autoreleasePoolPop(v13);
          }
          while (v17 <= v16 && v15 == 0);
        }
      }
    }
  }

}

- (id)_statisticsDateIntervalAndIndex:(int64_t *)a3 forDate:(id)a4
{
  void *v4;
  NSObject *v5;

  if (a4)
  {
    -[NSDateComponents hk_dateIntervalForDate:anchorDate:outIndex:](self->_statisticsInterval, "hk_dateIntervalForDate:anchorDate:outIndex:", a4, self->_anchorDate, a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v5 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
      -[HKStatisticsCollection _statisticsDateIntervalAndIndex:forDate:].cold.1(v5);
    v4 = 0;
  }
  return v4;
}

- (id)_statisticsDateIntervalAtIndex:(int64_t)a3
{
  HKDateInterval *v5;
  void *v6;
  void *v7;
  HKDateInterval *v8;

  v5 = [HKDateInterval alloc];
  -[NSDateComponents hk_dateByAddingInterval:toDate:](self->_statisticsInterval, "hk_dateByAddingInterval:toDate:", a3, self->_anchorDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponents hk_dateByAddingInterval:toDate:](self->_statisticsInterval, "hk_dateByAddingInterval:toDate:", a3 + 1, self->_anchorDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKDateInterval initWithStartDate:endDate:](v5, "initWithStartDate:endDate:", v6, v7);

  return v8;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_cachedSources, 0);
  objc_storeStrong((id *)&self->_statisticsByIndex, 0);
  objc_storeStrong(&self->_emptyStatisticsConstructor, 0);
}

- (void)_statisticsDateIntervalAndIndex:(os_log_t)log forDate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Cannot find statistics period for nil date", v1, 2u);
}

@end
