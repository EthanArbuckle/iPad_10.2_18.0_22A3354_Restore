@implementation ATXBirthdaysDataSource

- (ATXBirthdaysDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXBirthdaysDataSource *v6;
  ATXBirthdaysDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXBirthdaysDataSource;
  v6 = -[ATXBirthdaysDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)birthdaysWithCallback:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  ATXBirthdaysDataSource *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *context;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  ATXBirthdaysDataSource *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5458) & 1) != 0)
  {
    v39 = v4;
    context = (void *)MEMORY[0x1CAA46CBC]();
    -[ATXHeuristicDevice now](self->_device, "now");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v5;
    objc_msgSend(v6, "startOfDayForDate:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v7;
    objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 1, v7, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = self;
    -[ATXHeuristicDevice eventStore](self->_device, "eventStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v40 = v9;
    objc_msgSend(v9, "sources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v55 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          objc_msgSend(v16, "calendarsForEntityType:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v51;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v51 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
                if (objc_msgSend(v22, "type") == 4)
                  objc_msgSend(v10, "addObject:", v22);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
            }
            while (v19);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v40, "predicateForEventsWithStartDate:endDate:calendars:", v42, v41, v10);
      v23 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_opt_new();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v36 = (void *)v23;
      objc_msgSend(v40, "eventsMatchingPredicate:", v23);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      v25 = v44;
      if (v24)
      {
        v26 = v24;
        v27 = *(_QWORD *)v47;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v47 != v27)
              objc_enumerationMutation(obj);
            -[ATXHeuristicDevice dictForEvent:](v25->_device, "dictForEvent:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v29)
            {
              objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("birthdayContact"));
              v31 = objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                v32 = (void *)v31;
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("birthdayContact"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("isMeContact"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "BOOLValue");

                v25 = v44;
                if ((v35 & 1) == 0)
                  objc_msgSend(v43, "addObject:", v30);
              }
            }

          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        }
        while (v26);
      }

      v4 = v39;
      (*((void (**)(id, void *, _QWORD))v39 + 2))(v39, v43, 0);

    }
    else
    {
      v4 = v39;
      (*((void (**)(id, _QWORD, _QWORD))v39 + 2))(v39, MEMORY[0x1E0C9AA60], 0);
    }

    objc_autoreleasePoolPop(context);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AA60], 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
