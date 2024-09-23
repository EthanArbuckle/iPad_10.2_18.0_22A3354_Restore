@implementation ATXTripEventsDataSource

- (ATXTripEventsDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXTripEventsDataSource *v6;
  ATXTripEventsDataSource *v7;
  uint64_t v8;
  PPEventStore *eventStore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXTripEventsDataSource;
  v6 = -[ATXTripEventsDataSource init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = objc_opt_new();
    eventStore = v7->_eventStore;
    v7->_eventStore = (PPEventStore *)v8;

  }
  return v7;
}

- (id)fetchTripEventsFromStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  PPEventStore *eventStore;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t v28[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5440) & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    v27 = (id)objc_opt_new();
    v10 = objc_alloc_init(MEMORY[0x1E0D70CF0]);
    objc_msgSend(v10, "setFromDate:", v8);
    objc_msgSend(v10, "setToDate:", v9);
    objc_msgSend(v10, "setTripOptions:", 0);
    eventStore = self->_eventStore;
    v21 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __70__ATXTripEventsDataSource_fetchTripEventsFromStartDate_endDate_error___block_invoke;
    v20[3] = &unk_1E82C4678;
    v20[4] = buf;
    -[PPEventStore iterScoredEventsWithQuery:error:block:](eventStore, "iterScoredEventsWithQuery:error:block:", v10, &v21, v20);
    v12 = v21;
    if (v12)
    {
      __atxlog_handle_heuristic();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v28 = 138412802;
        v29 = (uint64_t)v12;
        v30 = 2114;
        v31 = v8;
        v32 = 2114;
        v33 = v9;
        _os_log_error_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_ERROR, "Error when fetching trip events from PersonalPortrait: %@ from %{public}@ to %{public}@", v28, 0x20u);
      }

      v14 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v12);
    }
    else
    {
      __atxlog_handle_heuristic();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(*((id *)v23 + 5), "count");
        v18 = *((_QWORD *)v23 + 5);
        *(_DWORD *)v28 = 134218754;
        v29 = v17;
        v30 = 2114;
        v31 = v8;
        v32 = 2114;
        v33 = v9;
        v34 = 2112;
        v35 = v18;
        _os_log_impl(&dword_1C99DF000, v16, OS_LOG_TYPE_DEFAULT, "Got %tu trip events from PersonalPortrait from %{public}@ to %{public}@: %@", v28, 0x2Au);
      }

      v14 = *((id *)v23 + 5);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __atxlog_handle_heuristic();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, "Calendar is not learnable for trip event fetching", buf, 2u);
    }

    v14 = (id)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

void __70__ATXTripEventsDataSource_fetchTripEventsFromStartDate_endDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
  }
  else
  {
    __atxlog_handle_heuristic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __70__ATXTripEventsDataSource_fetchTripEventsFromStartDate_endDate_error___block_invoke_cold_1((uint64_t)v3, v4);

  }
}

- (void)getLocationForMostRelevantTripInRangeFrom:(id)a3 to:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  const __CFString *v62;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _BYTE v66[128];
  void *v67;
  uint8_t buf[4];
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v61 = 0;
  -[ATXTripEventsDataSource fetchTripEventsFromStartDate:endDate:error:](self, "fetchTripEventsFromStartDate:endDate:error:", v8, v9, &v61);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v61;
  if (v11 && objc_msgSend(v11, "count"))
  {
    v48 = v12;
    v50 = v10;
    v51 = v9;
    v52 = v8;
    v13 = (void *)objc_opt_new();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v49 = v11;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v58 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          objc_msgSend(v19, "startDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "compare:", v21);

          if (v22 == 1)
            objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v16);
    }

    __atxlog_handle_heuristic();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      v69 = v24;
      _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "Got %tu trip events after discarding old trips.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingDescriptors:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v50;
    if (objc_msgSend(v27, "count"))
    {
      v28 = v25;
      v47 = v27;
      objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_heuristic();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = (uint64_t)v29;
        _os_log_impl(&dword_1C99DF000, v30, OS_LOG_TYPE_DEFAULT, "Considering first trip: %@", buf, 0xCu);
      }

      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v29, "tripParts");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      if (v32)
      {
        v33 = v32;
        v34 = 0;
        v35 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v54 != v35)
              objc_enumerationMutation(v31);
            v37 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            if (objc_msgSend(v37, "tripMode") == 2)
            {
              objc_msgSend(v37, "mainLocation");
              v38 = objc_claimAutoreleasedReturnValue();

              v34 = (void *)v38;
            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        }
        while (v33);

        v25 = v28;
        v27 = v47;
        if (v34)
        {
          objc_msgSend(v34, "name");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {

            v9 = v51;
            v8 = v52;
            v11 = v49;
          }
          else
          {
            objc_msgSend(v34, "locality");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v51;
            v8 = v52;
            v11 = v49;
            if (!v42)
            {
              v62 = CFSTR("location");
              v63 = v34;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *, _QWORD))v50 + 2))(v50, v46, 0);

LABEL_43:
              v12 = v48;
              goto LABEL_44;
            }
          }
          v64[0] = CFSTR("location");
          v64[1] = CFSTR("locality");
          v65[0] = v34;
          objc_msgSend(v34, "locality");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (!v43)
          {
            objc_msgSend(v34, "name");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v65[1] = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, _QWORD))v50 + 2))(v50, v45, 0);

          if (!v43)
          v27 = v47;
          goto LABEL_43;
        }
      }
      else
      {

        v25 = v28;
      }
    }
    __atxlog_handle_heuristic();
    v41 = objc_claimAutoreleasedReturnValue();
    v9 = v51;
    v8 = v52;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v41, OS_LOG_TYPE_DEFAULT, "No selected placemark for trips", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v50 + 2))(v50, 0, 0);
    v34 = 0;
    v11 = v49;
    goto LABEL_43;
  }
  if (v12)
    v40 = v12;
  else
    v40 = 0;
  (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v40);
LABEL_44:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __70__ATXTripEventsDataSource_fetchTripEventsFromStartDate_endDate_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_FAULT, "Expect trip event for trip query but got %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
