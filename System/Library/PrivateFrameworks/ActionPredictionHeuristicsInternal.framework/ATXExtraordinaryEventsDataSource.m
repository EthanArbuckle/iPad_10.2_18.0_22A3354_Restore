@implementation ATXExtraordinaryEventsDataSource

- (ATXExtraordinaryEventsDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXExtraordinaryEventsDataSource *v6;
  ATXExtraordinaryEventsDataSource *v7;
  uint64_t v8;
  PPEventStore *extraordinaryEventStore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXExtraordinaryEventsDataSource;
  v6 = -[ATXExtraordinaryEventsDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_opt_new();
    extraordinaryEventStore = v7->_extraordinaryEventStore;
    v7->_extraordinaryEventStore = (PPEventStore *)v8;

  }
  return v7;
}

- (id)_ekEventForHighlight:(id)a3 eventStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "eventIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    __atxlog_handle_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXExtraordinaryEventsDataSource _ekEventForHighlight:eventStore:].cold.1(v5, v9);

  }
  return v8;
}

- (id)_fetchExtraordinaryEvents
{
  void *v3;
  void *v4;
  void *v5;
  PPEventStore *extraordinaryEventStore;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "_endOfDayAfterDate:numberOfDays:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  extraordinaryEventStore = self->_extraordinaryEventStore;
  v21 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __61__ATXExtraordinaryEventsDataSource__fetchExtraordinaryEvents__block_invoke;
  v19 = &unk_1E82C48C0;
  v7 = v3;
  v20 = v7;
  -[PPEventStore iterEventHighlightsFrom:to:options:error:block:](extraordinaryEventStore, "iterEventHighlightsFrom:to:options:error:block:", v4, v5, 0, &v21, &v16);
  v8 = v21;
  __atxlog_handle_heuristic();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXExtraordinaryEventsDataSource _fetchExtraordinaryEvents].cold.1((uint64_t)v8, v10, v11);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v7, "count", v16, v17, v18, v19);
    *(_DWORD *)buf = 134217984;
    v23 = v12;
    _os_log_impl(&dword_1C99DF000, v10, OS_LOG_TYPE_INFO, "Got %tu event highlights from PersonalPortrait.", buf, 0xCu);
  }

  v13 = v20;
  v14 = v7;

  return v14;
}

uint64_t __61__ATXExtraordinaryEventsDataSource__fetchExtraordinaryEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)getEventsWithProminentFeature:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  ATXExtraordinaryEventsDataSource *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5470) & 1) != 0)
  {
    v29 = v7;
    v31 = (void *)objc_opt_new();
    -[ATXExtraordinaryEventsDataSource _fetchExtraordinaryEvents](self, "_fetchExtraordinaryEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHeuristicDevice eventStore](self->_device, "eventStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v36;
      v30 = v6;
      do
      {
        v12 = 0;
        v32 = v10;
        do
        {
          if (*(_QWORD *)v36 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1CAA46CBC]();
          if (!v6 || (v15 = objc_msgSend(v13, "prominentFeature"), v15 == objc_msgSend(v6, "unsignedIntegerValue")))
          {
            -[ATXExtraordinaryEventsDataSource _ekEventForHighlight:eventStore:](self, "_ekEventForHighlight:eventStore:", v13, v34, v29);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = self;
              -[ATXHeuristicDevice dictForEvent:](self->_device, "dictForEvent:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18;
              if (v18)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("contacts"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v13, "isExtraordinary"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("isExtraordinary"));

                  objc_msgSend(v13, "score");
                  if (v22 != 0.0)
                  {
                    v23 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v13, "score");
                    objc_msgSend(v23, "numberWithDouble:");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("extraordinaryScore"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "prominentFeature"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("extraordinaryProminentFeature"));

                  }
                  objc_msgSend(v31, "addObject:", v19);
                  v6 = v30;
                }
              }

              self = v17;
              v10 = v32;
            }

          }
          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDateTimestamp"), 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v26;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("extraordinaryScore"), 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "sortUsingDescriptors:", v28);

    v7 = v29;
    (*((void (**)(id, void *, _QWORD))v29 + 2))(v29, v31, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA60], 0);
  }

}

+ (id)_endOfDayAfterDate:(id)a3 numberOfDays:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0C99D48];
    v6 = a3;
    objc_msgSend(v5, "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 28, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setHour:", 23);
    objc_msgSend(v8, "setMinute:", 59);
    objc_msgSend(v8, "setSecond:", 59);
    objc_msgSend(v8, "setNanosecond:", 999999999);
    objc_msgSend(v7, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setDay:", a4);
    objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v10, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraordinaryEventStore, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_ekEventForHighlight:(void *)a1 eventStore:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_5(&dword_1C99DF000, a2, v4, "Failed to get event with identifier %@", (uint8_t *)&v5);

}

- (void)_fetchExtraordinaryEvents
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_1C99DF000, a2, a3, "Error when fetching event highlights from PersonalPortrait: %@", (uint8_t *)&v3);
}

@end
