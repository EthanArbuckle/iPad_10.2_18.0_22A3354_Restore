@implementation NTKTimelineEntryModelCache

- (NTKTimelineEntryModelCache)init
{
  NTKTimelineEntryModelCache *v2;
  uint64_t v3;
  NSMutableArray *cachedEntryModels;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKTimelineEntryModelCache;
  v2 = -[NTKTimelineEntryModelCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    cachedEntryModels = v2->_cachedEntryModels;
    v2->_cachedEntryModels = (NSMutableArray *)v3;

    -[NTKTimelineEntryModelCache invalidate](v2, "invalidate");
  }
  return v2;
}

- (BOOL)hasEntryModelForDate:(id)a3
{
  void *v3;
  BOOL v4;

  -[NTKTimelineEntryModelCache _cachedEntryModelForDate:](self, "_cachedEntryModelForDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)entryModelForDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NTKTimelineEntryModelCache _extendCacheTowardDate:](self, "_extendCacheTowardDate:", v4);
  -[NTKTimelineEntryModelCache _cachedEntryModelForDate:](self, "_cachedEntryModelForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)entryModelsBeforeDate:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_startOfDayBeforeDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKTimelineEntryModelCache _extendCacheTowardDate:](self, "_extendCacheTowardDate:", v7);
  -[NTKTimelineEntryModelCache _cachedEntryModelBeforeDate:limit:](self, "_cachedEntryModelBeforeDate:limit:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)entryModelsAfterDate:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_startOfDayAfterDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKTimelineEntryModelCache _extendCacheTowardDate:](self, "_extendCacheTowardDate:", v7);
  -[NTKTimelineEntryModelCache _cachedEntryModelAfterDate:limit:](self, "_cachedEntryModelAfterDate:limit:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)invalidate
{
  NSMutableArray *cachedEntryModels;
  NSDate *cacheStartDate;
  NSDate *cacheEndDate;

  -[NSMutableArray removeAllObjects](self->_cachedEntryModels, "removeAllObjects");
  cachedEntryModels = self->_cachedEntryModels;
  self->_cachedEntryModels = 0;

  cacheStartDate = self->_cacheStartDate;
  self->_cacheStartDate = 0;

  cacheEndDate = self->_cacheEndDate;
  self->_cacheEndDate = 0;

}

- (void)_extendCacheTowardDate:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSDate *v11;
  NSDate *v12;
  void *v13;
  void *v14;
  NSDate *v15;
  NSDate *cacheStartDate;
  NSDate *v17;
  NSDate *cacheEndDate;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *cachedEntryModels;
  id v22;

  v4 = a3;
  v22 = v4;
  if (!self->_cachedEntryModels)
  {
    objc_msgSend((id)objc_opt_class(), "_startOfDayForDate:", v4);
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    cacheStartDate = self->_cacheStartDate;
    self->_cacheStartDate = v15;

    objc_msgSend((id)objc_opt_class(), "_endOfDayForDate:", v22);
    v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
    cacheEndDate = self->_cacheEndDate;
    self->_cacheEndDate = v17;

    -[NTKTimelineEntryModelCache dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loadEntryModelsForDay:", self->_cacheStartDate);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (NSMutableArray *)objc_msgSend(v19, "mutableCopy");
    cachedEntryModels = self->_cachedEntryModels;
    self->_cachedEntryModels = v20;

    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isBeforeDate:", self->_cacheStartDate))
  {
    objc_msgSend((id)objc_opt_class(), "_startOfDayBeforeDate:", self->_cacheStartDate);
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cacheStartDate;
    self->_cacheStartDate = v5;

    -[NTKTimelineEntryModelCache dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadEntryModelsForDay:", self->_cacheStartDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");

    -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", self->_cachedEntryModels);
    v10 = self->_cachedEntryModels;
    self->_cachedEntryModels = v9;

  }
  if (objc_msgSend(v22, "isAfterDate:", self->_cacheEndDate))
  {
    objc_msgSend((id)objc_opt_class(), "_startOfDayAfterDate:", self->_cacheEndDate);
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cacheEndDate;
    self->_cacheEndDate = v11;

    -[NTKTimelineEntryModelCache dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loadEntryModelsForDay:", self->_cacheEndDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObjectsFromArray:](self->_cachedEntryModels, "addObjectsFromArray:", v14);
LABEL_7:

  }
}

- (id)_cachedEntryModelForDate:(id)a3
{
  id v4;
  NSMutableArray *cachedEntryModels;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__47;
  v16 = __Block_byref_object_dispose__47;
  v17 = 0;
  cachedEntryModels = self->_cachedEntryModels;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__NTKTimelineEntryModelCache__cachedEntryModelForDate___block_invoke;
  v9[3] = &unk_1E6BD90E8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](cachedEntryModels, "enumerateObjectsWithOptions:usingBlock:", 2, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__NTKTimelineEntryModelCache__cachedEntryModelForDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isBeforeDate:", v7) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_cachedEntryModelBeforeDate:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  -[NTKTimelineEntryModelCache _cachedEntryModelForDate:](self, "_cachedEntryModelForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray indexOfObject:](self->_cachedEntryModels, "indexOfObject:", v7);
  v9 = v8;
  if (v8 >= a4)
    v10 = a4;
  else
    v10 = v8;
  v11 = v8 - v10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  while (v9 > v11)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_cachedEntryModels, "objectAtIndexedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "compare:", v6);

    if (v15 == -1)
      objc_msgSend(v12, "addObject:", v13);

    --v9;
  }

  return v12;
}

- (id)_cachedEntryModelAfterDate:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSMutableArray *cachedEntryModels;
  void *v11;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  NSMutableArray *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NTKTimelineEntryModelCache _cachedEntryModelForDate:](self, "_cachedEntryModelForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NTKTimelineEntryModelCache _cachedEntryModelAfterDate:limit:].cold.1((uint64_t)v6, (uint64_t)self, v9);
    goto LABEL_7;
  }
  v8 = -[NSMutableArray indexOfObject:](self->_cachedEntryModels, "indexOfObject:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      cachedEntryModels = self->_cachedEntryModels;
      v19 = 138412802;
      v20 = v7;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = cachedEntryModels;
      _os_log_error_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_ERROR, "NTKTimelineEntryModelCache: Failed to find entryForDate %@ for date %@ in models: %@.", (uint8_t *)&v19, 0x20u);
    }
LABEL_7:

    v11 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_8;
  }
  v13 = v8;
  v14 = -[NSMutableArray count](self->_cachedEntryModels, "count");
  if (v14 - v13 >= a4)
    v15 = a4;
  else
    v15 = v14 - v13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 < v15 + v13)
  {
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_cachedEntryModels, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "entryDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "compare:", v6);

      if (v18 == 1)
        objc_msgSend(v11, "addObject:", v16);

      ++v13;
      --v15;
    }
    while (v15);
  }
LABEL_8:

  return v11;
}

- (id)calendar
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
}

+ (id)_startOfDayForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_startOfDayBeforeDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -1, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_startOfDayAfterDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_endOfDayForDate:(id)a3
{
  return NTKEndOfDayForDate(a3);
}

- (NSDate)cacheStartDate
{
  return self->_cacheStartDate;
}

- (NSDate)cacheEndDate
{
  return self->_cacheEndDate;
}

- (NTKTimelineEntryModelCacheDataSource)dataSource
{
  return (NTKTimelineEntryModelCacheDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cacheEndDate, 0);
  objc_storeStrong((id *)&self->_cacheStartDate, 0);
  objc_storeStrong((id *)&self->_cachedEntryModels, 0);
}

- (void)_cachedEntryModelAfterDate:(os_log_t)log limit:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "NTKTimelineEntryModelCache: entryForDate is nil for date: %@. Models: %@", (uint8_t *)&v4, 0x16u);
}

@end
