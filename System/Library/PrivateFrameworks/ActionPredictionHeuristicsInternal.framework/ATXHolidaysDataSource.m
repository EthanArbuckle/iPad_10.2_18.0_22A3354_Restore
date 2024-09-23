@implementation ATXHolidaysDataSource

- (ATXHolidaysDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXHolidaysDataSource *v6;
  ATXHolidaysDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHolidaysDataSource;
  v6 = -[ATXHolidaysDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (id)_holidayCalendarForEventStore:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a3, "sources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v8, "calendarsForEntityType:", 0, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
              if (objc_msgSend(v14, "type") == 3 && (objc_msgSend(v14, "isSubscribedHolidayCalendar") & 1) != 0)
              {
                v15 = v14;

                goto LABEL_20;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v15 = 0;
    }
    while (v5);
  }
  else
  {
    v15 = 0;
  }
LABEL_20:

  return v15;
}

- (void)holidaysFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D55C0) & 1) != 0)
  {
    -[ATXHeuristicDevice eventStore](self->_device, "eventStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHolidaysDataSource _holidayCalendarForEventStore:](self, "_holidayCalendarForEventStore:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v25 = (void *)v12;
      v32[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v8;
      objc_msgSend(v11, "predicateForEventsWithStartDate:endDate:calendars:", v8, v9, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v24 = (void *)v15;
      objc_msgSend(v11, "eventsMatchingPredicate:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (objc_msgSend(v22, "isAllDay"))
            {
              -[ATXHeuristicDevice dictForEvent:](self->_device, "dictForEvent:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
                objc_msgSend(v16, "addObject:", v23);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v19);
      }

      v10[2](v10, v16, 0);
      v13 = v25;
      v8 = v26;
    }
    else
    {
      v10[2](v10, (void *)MEMORY[0x1E0C9AA60], 0);
    }

  }
  else
  {
    v10[2](v10, (void *)MEMORY[0x1E0C9AA60], 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
