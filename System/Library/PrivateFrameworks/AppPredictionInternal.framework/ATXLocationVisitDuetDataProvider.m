@implementation ATXLocationVisitDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 13;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v10);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__41;
  v30 = __Block_byref_object_dispose__41;
  v31 = 0;
  v14 = dispatch_semaphore_create(0);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __106__ATXLocationVisitDuetDataProvider_fetchEventsBetweenStartDate_andEndDate_withPredicates_limit_ascending___block_invoke;
  v23 = &unk_1E82DC280;
  v25 = &v26;
  v15 = v14;
  v24 = v15;
  objc_msgSend(v12, "fetchLocationsOfInterestVisitedDuring:handler:", v13, &v20);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v15, 10.0, v20, v21, v22, v23);
  __atxlog_handle_anchor();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v27[5];
    *(_DWORD *)buf = 138412290;
    v33 = v17;
    _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "SortedLoiEvents: %@", buf, 0xCu);
  }

  v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v18;
}

void __106__ATXLocationVisitDuetDataProvider_fetchEventsBetweenStartDate_andEndDate_withPredicates_limit_ascending___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ATXLocationVisitDuetEvent *v16;
  void *v17;
  ATXLocationVisitDuetEvent *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v29 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v2;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v35;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        v28 = v3;
        v4 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v3);
        __atxlog_handle_anchor();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v4;
          _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "LOI: %@", buf, 0xCu);
        }

        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v4, "visits");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v31 != v9)
                objc_enumerationMutation(v6);
              v11 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "rangeValue");
              v13 = v12;
              v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)v11);
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)(v11 + v13));
              v16 = [ATXLocationVisitDuetEvent alloc];
              objc_msgSend(v4, "uuid");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[ATXLocationVisitDuetEvent initWithLocationOfInterestIdentifier:startDate:endDate:](v16, "initWithLocationOfInterestIdentifier:startDate:endDate:", v17, v14, v15);

              objc_msgSend(v29, "addObject:", v18);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v8);
        }

        v3 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v27);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedArrayUsingDescriptors:", v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
