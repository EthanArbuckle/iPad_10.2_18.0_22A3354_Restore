@implementation ATXCalendarEventsDataSource

- (ATXCalendarEventsDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXCalendarEventsDataSource *v6;
  ATXCalendarEventsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCalendarEventsDataSource;
  v6 = -[ATXCalendarEventsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)calendarEventsFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  double v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  unint64_t v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D55D8) & 1) != 0)
  {
    -[ATXHeuristicDevice eventStore](self->_device, "eventStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHeuristicDevice visibleCalendarsInCurrentFocus](self->_device, "visibleCalendarsInCurrentFocus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateForEventsWithStartDate:endDate:calendars:", v8, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventsMatchingPredicate:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v8;
    objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    v15 = vcvtpd_u64_f64(v14 / 86400.0 * 50.0);
    __atxlog_handle_heuristic();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      v32 = (const __CFString *)v15;
      v33 = 2048;
      v34 = objc_msgSend(v13, "count");
      v35 = 2048;
      v36 = v11;
      v37 = 2048;
      v38 = objc_msgSend(v12, "count");
      _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_DEFAULT, "Fetching calendar events with limit count of: %ld; actual count: %ld; event store: %p; visible calendars: %ld",
        buf,
        0x2Au);
    }

    v17 = (void *)objc_opt_new();
    v18 = (void *)MEMORY[0x1CAA46CBC]();
    v19 = v12;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 50);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __78__ATXCalendarEventsDataSource_calendarEventsFromStartDate_toEndDate_callback___block_invoke_14;
    v27[3] = &unk_1E82C5898;
    v30 = v15;
    v27[4] = self;
    v28 = v20;
    v21 = v17;
    v29 = v21;
    v22 = v20;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v27);

    objc_autoreleasePoolPop(v18);
    v10[2](v10, v21, 0);

    v8 = v26;
  }
  else
  {
    __atxlog_handle_heuristic();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = CFSTR("com.apple.mobilecal");
      _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "Events data source is not learnable for %{public}@", buf, 0xCu);
    }

    v10[2](v10, (id)MEMORY[0x1E0C9AA60], 0);
  }

}

uint64_t __78__ATXCalendarEventsDataSource_calendarEventsFromStartDate_toEndDate_callback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "atx_isAllowedCalendar");
}

void __78__ATXCalendarEventsDataSource_calendarEventsFromStartDate_toEndDate_callback___block_invoke_14(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (void *)MEMORY[0x1CAA46CBC]();
  if (a4 && *(_QWORD *)(a1 + 56) <= (unint64_t)a3)
  {
    __atxlog_handle_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = a3;
      _os_log_impl(&dword_1C99DF000, v9, OS_LOG_TYPE_DEFAULT, "Stopped iterating events early after index: %ld", (uint8_t *)&v15, 0xCu);
    }

    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dictForEvent:contactCache:", v7, *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_heuristic();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v7, "eventIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412547;
        v16 = v13;
        v17 = 2117;
        v18 = v7;
        _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "Considering event: %@ %{sensitive}@", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v7, "eventIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412547;
        v16 = v14;
        v17 = 2117;
        v18 = v7;
        _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring event: %@ %{sensitive}@", (uint8_t *)&v15, 0x16u);

      }
    }

  }
  objc_autoreleasePoolPop(v8);

}

- (void)visibleCalendarsWithCallback:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);

  v6 = (void (**)(id, void *, _QWORD))a3;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D55F0) & 1) != 0)
  {
    -[ATXHeuristicDevice visibleCalendarsInCurrentFocus](self->_device, "visibleCalendarsInCurrentFocus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5, 0);

  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E0C9AA60], 0);
  }

}

id __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "atx_isAllowedCalendar"))
  {
    objc_msgSend(v2, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "calendarIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v3)
    {
      if (v4)
      {
        v23[0] = CFSTR("title");
        v23[1] = CFSTR("identifier");
        v24[0] = v3;
        v24[1] = v4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
      __atxlog_handle_heuristic();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke_cold_2(v7, v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      __atxlog_handle_heuristic();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    v6 = 0;
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

- (id)eventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5608) & 1) != 0)
  {
    -[ATXHeuristicDevice eventStore](self->_device, "eventStore");
    v11 = objc_claimAutoreleasedReturnValue();
    -[ATXHeuristicDevice visibleCalendarsRegardlessOfFocus](self->_device, "visibleCalendarsRegardlessOfFocus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject predicateForEventsWithStartDate:endDate:calendars:](v11, "predicateForEventsWithStartDate:endDate:calendars:", v8, v9, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject eventsMatchingPredicate:](v11, "eventsMatchingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_context_heuristic();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138413058;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2048;
      v23 = objc_msgSend(v15, "count");
      v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_DEFAULT, "Fetching calendar events start: %@, end: %@ count: %ld reason: %{public}@", (uint8_t *)&v18, 0x2Au);
    }

  }
  else
  {
    __atxlog_handle_heuristic();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = CFSTR("com.apple.mobilecal");
      _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "Events data source is not learnable for %{public}@", (uint8_t *)&v18, 0xCu);
    }
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

uint64_t __66__ATXCalendarEventsDataSource_eventsFromStartDate_endDate_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "atx_isAllowedCalendar");
}

- (id)sortEkEvents:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_29);
}

uint64_t __44__ATXCalendarEventsDataSource_sortEkEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)eventsFromStartDate:(id)a3 endDate:(id)a4 category:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a5;
  -[ATXCalendarEventsDataSource eventsFromStartDate:endDate:reason:](self, "eventsFromStartDate:endDate:reason:", v10, a4, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __75__ATXCalendarEventsDataSource_eventsFromStartDate_endDate_category_reason___block_invoke;
  v22 = &unk_1E82C4E70;
  v23 = v11;
  v24 = v10;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v13, "predicateWithBlock:", &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filteredArrayUsingPredicate:", v16, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

BOOL __75__ATXCalendarEventsDataSource_eventsFromStartDate_endDate_category_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL8 v8;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(v3, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32)),
        v6,
        v7))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Lodging")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v3, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "compare:", v11) == -1;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)flightEventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5
{
  return -[ATXCalendarEventsDataSource eventsFromStartDate:endDate:category:reason:](self, "eventsFromStartDate:endDate:category:reason:", a3, a4, CFSTR("Flight"), a5);
}

- (id)hotelEventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5
{
  return -[ATXCalendarEventsDataSource eventsFromStartDate:endDate:category:reason:](self, "eventsFromStartDate:endDate:category:reason:", a3, a4, CFSTR("Lodging"), a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

void __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C99DF000, a1, a3, "Nullability violation: -[EKCalendar title] returned nil", a5, a6, a7, a8, 0);
}

void __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C99DF000, a1, a3, "Nullability violation: -[EKCalendar calendarIdentifier] returned nil", a5, a6, a7, a8, 0);
}

@end
