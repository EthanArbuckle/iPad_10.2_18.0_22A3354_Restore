@implementation CLSCalendarEventsCache

- (CLSCalendarEventsCache)init
{
  CLSCalendarEventsCache *v2;
  uint64_t v3;
  NSMutableSet *years;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSCalendarEventsCache;
  v2 = -[CLSCalendarEventsCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    years = v2->_years;
    v2->_years = (NSMutableSet *)v3;

  }
  return v2;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSMutableSet debugDescription](self->_years, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)insertEvent:(id)a3
{
  id v4;
  CLSCalendarEventsCache *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__CLSCalendarEventsCache_insertEvent___block_invoke;
    v8[3] = &unk_1E84F8F48;
    v8[4] = v5;
    v9 = v4;
    -[CLSCalendarEventsCache _enumerateDaysFromStartDate:toEndDate:usingBlock:](v5, "_enumerateDaysFromStartDate:toEndDate:usingBlock:", v6, v7, v8);

    objc_sync_exit(v5);
  }

}

- (void)enumerateEventsFromStartDate:(id)a3 toEndDate:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLSCalendarEventsCache *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = self;
    objc_sync_enter(v11);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__CLSCalendarEventsCache_enumerateEventsFromStartDate_toEndDate_usingBlock___block_invoke;
    v12[3] = &unk_1E84F8F70;
    v12[4] = v11;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    -[CLSCalendarEventsCache _enumerateDaysFromStartDate:toEndDate:usingBlock:](v11, "_enumerateDaysFromStartDate:toEndDate:usingBlock:", v13, v14, v12);

    objc_sync_exit(v11);
  }

}

- (id)eventsForStartDate:(id)a3 endDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__CLSCalendarEventsCache_eventsForStartDate_endDate___block_invoke;
  v12[3] = &unk_1E84F8F98;
  v10 = v9;
  v13 = v10;
  -[CLSCalendarEventsCache enumerateEventsFromStartDate:toEndDate:usingBlock:](self, "enumerateEventsFromStartDate:toEndDate:usingBlock:", v8, v7, v12);

  return v10;
}

- (id)eventsForDate:(id)a3
{
  id v4;
  CLSCalendarEventsCache *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CLSCalendarEventsCache _storeDayForDate:createIfNeeded:](v5, "_storeDayForDate:createIfNeeded:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)hasEventsFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__CLSCalendarEventsCache_hasEventsFromStartDate_toEndDate___block_invoke;
  v9[3] = &unk_1E84F8FC0;
  v9[4] = &v10;
  -[CLSCalendarEventsCache enumerateEventsFromStartDate:toEndDate:usingBlock:](self, "enumerateEventsFromStartDate:toEndDate:usingBlock:", v6, v7, v9);
  LOBYTE(self) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)self;
}

- (void)_enumerateDaysFromStartDate:(id)a3 toEndDate:(id)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, id, _BYTE *);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;

  v7 = a4;
  v8 = (void (**)(id, id, _BYTE *))a5;
  if (v8)
  {
    v14 = 0;
    +[CLSCalendar startOfDayForDate:](CLSCalendar, "startOfDayForDate:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSCalendar startOfDayForDate:](CLSCalendar, "startOfDayForDate:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v8[2](v8, v11, &v14);
    v12 = v11;
    if (!v14)
    {
      v13 = v11;
      while (objc_msgSend(v13, "compare:", v10) == -1)
      {
        +[CLSCalendar dateByAddingDays:toDate:](CLSCalendar, "dateByAddingDays:toDate:", 1, v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v8[2](v8, v12, &v14);
        v13 = v12;
        if (v14)
          goto LABEL_8;
      }
      v12 = v13;
    }
LABEL_8:

  }
}

- (id)_storeDayForDate:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CLSCalendarEventsCacheYear *v11;
  CLSCalendarEventsCacheYear *v12;
  void *v13;
  CLSCalendarEventsCacheMonth *v14;
  CLSCalendarEventsCacheMonth *v15;
  void *v16;
  void *v17;
  CLSCalendarEventsCacheDay *v18;
  CLSCalendarEventsCacheDay *v19;
  void *v20;

  v4 = a4;
  v6 = a3;
  if (_storeDayForDate_createIfNeeded__onceToken != -1)
    dispatch_once(&_storeDayForDate_createIfNeeded__onceToken, &__block_literal_global_5704);
  +[CLSCalendar components:fromDate:](CLSCalendar, "components:fromDate:", 28, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "year");
  objc_msgSend((id)_storeDayForDate_createIfNeeded__s_fakeYear, "setYear:", v8);
  v9 = objc_msgSend(v7, "month");
  objc_msgSend((id)_storeDayForDate_createIfNeeded__s_fakeMonth, "setMonth:", v9);
  v10 = objc_msgSend(v7, "day");
  objc_msgSend((id)_storeDayForDate_createIfNeeded__s_fakeDay, "setDay:", v10);
  -[NSMutableSet member:](self->_years, "member:", _storeDayForDate_createIfNeeded__s_fakeYear);
  v11 = (CLSCalendarEventsCacheYear *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (!v4)
    {
      v18 = 0;
      goto LABEL_14;
    }
    v12 = [CLSCalendarEventsCacheYear alloc];
    v11 = -[CLSCalendarEventsCacheYear initWithYear:](v12, "initWithYear:", objc_msgSend((id)_storeDayForDate_createIfNeeded__s_fakeYear, "year"));
    -[NSMutableSet addObject:](self->_years, "addObject:", v11);
  }
  -[CLSCalendarEventsCacheYear months](v11, "months");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "member:", _storeDayForDate_createIfNeeded__s_fakeMonth);
  v14 = (CLSCalendarEventsCacheMonth *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_9;
  if (v4)
  {
    v15 = [CLSCalendarEventsCacheMonth alloc];
    v14 = -[CLSCalendarEventsCacheMonth initWithMonth:](v15, "initWithMonth:", objc_msgSend((id)_storeDayForDate_createIfNeeded__s_fakeMonth, "month"));
    -[CLSCalendarEventsCacheYear months](v11, "months");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v14);

LABEL_9:
    -[CLSCalendarEventsCacheMonth days](v14, "days");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "member:", _storeDayForDate_createIfNeeded__s_fakeDay);
    v18 = (CLSCalendarEventsCacheDay *)objc_claimAutoreleasedReturnValue();

    if (!v18 && v4)
    {
      v19 = [CLSCalendarEventsCacheDay alloc];
      v18 = -[CLSCalendarEventsCacheDay initWithDay:](v19, "initWithDay:", objc_msgSend((id)_storeDayForDate_createIfNeeded__s_fakeDay, "day"));
      -[CLSCalendarEventsCacheMonth days](v14, "days");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v18);

    }
    goto LABEL_13;
  }
  v18 = 0;
LABEL_13:

LABEL_14:
  return v18;
}

- (NSMutableSet)years
{
  return self->_years;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_years, 0);
}

void __58__CLSCalendarEventsCache__storeDayForDate_createIfNeeded___block_invoke()
{
  CLSCalendarEventsCacheYear *v0;
  void *v1;
  CLSCalendarEventsCacheMonth *v2;
  void *v3;
  CLSCalendarEventsCacheDay *v4;
  void *v5;

  v0 = -[CLSCalendarEventsCacheYear initWithYear:]([CLSCalendarEventsCacheYear alloc], "initWithYear:", 0);
  v1 = (void *)_storeDayForDate_createIfNeeded__s_fakeYear;
  _storeDayForDate_createIfNeeded__s_fakeYear = (uint64_t)v0;

  v2 = -[CLSCalendarEventsCacheMonth initWithMonth:]([CLSCalendarEventsCacheMonth alloc], "initWithMonth:", 0);
  v3 = (void *)_storeDayForDate_createIfNeeded__s_fakeMonth;
  _storeDayForDate_createIfNeeded__s_fakeMonth = (uint64_t)v2;

  v4 = -[CLSCalendarEventsCacheDay initWithDay:]([CLSCalendarEventsCacheDay alloc], "initWithDay:", 0);
  v5 = (void *)_storeDayForDate_createIfNeeded__s_fakeDay;
  _storeDayForDate_createIfNeeded__s_fakeDay = (uint64_t)v4;

}

uint64_t __59__CLSCalendarEventsCache_hasEventsFromStartDate_toEndDate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

uint64_t __53__CLSCalendarEventsCache_eventsForStartDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __76__CLSCalendarEventsCache_enumerateEventsFromStartDate_toEndDate_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v24 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  objc_msgSend(*(id *)(a1 + 32), "eventsForDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "startDate", v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 40);
        v13 = *(id *)(a1 + 48);
        v14 = v12;
        objc_msgSend(v10, "timeIntervalSinceReferenceDate");
        v16 = v15;
        objc_msgSend(v11, "timeIntervalSinceReferenceDate");
        v18 = v17;
        objc_msgSend(v14, "timeIntervalSinceReferenceDate");
        v20 = v19;
        objc_msgSend(v13, "timeIntervalSinceReferenceDate");
        v22 = v21;

        if (v16 <= v22 && v18 >= v20)
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

}

void __38__CLSCalendarEventsCache_insertEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_storeDayForDate:createIfNeeded:", a2, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

@end
