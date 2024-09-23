@implementation ATXTripDuetDataProvider

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
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v13 = v12;

  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Semantic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "atx_publisherFromStartTime:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXTripDuetDataProvider groupTripsFromPublisher:startTimestamp:endTimestamp:](self, "groupTripsFromPublisher:startTimestamp:endTimestamp:", v18, v11, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)groupTripsFromPublisher:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  double v24;
  double v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD v30[5];
  id v31;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__89;
  v30[4] = __Block_byref_object_dispose__89;
  v31 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke;
  v29[3] = &__block_descriptor_48_e22_B16__0__BMStoreEvent_8l;
  *(double *)&v29[4] = a4;
  *(double *)&v29[5] = a5;
  objc_msgSend(v7, "filterWithIsIncluded:", v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_2;
  v28[3] = &unk_1E82E7F98;
  v28[4] = v30;
  objc_msgSend(v11, "scanWithInitial:nextPartialResult:", v9, v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_3;
  v27[3] = &unk_1E82E7FC0;
  v27[4] = v30;
  objc_msgSend(v12, "filterWithIsIncluded:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_4;
  v26[3] = &unk_1E82E7FE8;
  v26[4] = v30;
  objc_msgSend(v13, "mapWithTransform:", v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_5;
  v22[3] = &unk_1E82E8010;
  v23 = v8;
  v24 = a4;
  v25 = a5;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_16;
  v20[3] = &unk_1E82E8038;
  v15 = v23;
  v21 = v15;
  v16 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v22, v20);

  v17 = v21;
  v18 = v15;

  _Block_object_dispose(v30, 8);
  return v18;
}

BOOL __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _BOOL8 v5;
  double v6;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  if (v4 >= *(double *)(a1 + 32))
  {
    objc_msgSend(v3, "timestamp");
    v5 = v6 <= *(double *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "starting");

  if (!v8)
  {
    v10 = (void *)MEMORY[0x1E0D81638];
    v11 = v6;
    goto LABEL_5;
  }
  objc_msgSend(v5, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0D81638];
    v11 = 0;
LABEL_5:
    objc_msgSend(v10, "tupleWithFirst:second:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v5, "first");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "timestamp");
    v16 = objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  v19 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(v5, "first");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tupleWithFirst:second:", v20, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v12;
}

uint64_t __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  objc_msgSend(v3, "first");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  objc_msgSend(v3, "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v3, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v10 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

ATXTripDuetEvent *__79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  ATXTripDuetEvent *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  ATXTripDuetEvent *v24;

  v3 = (objc_class *)MEMORY[0x1E0C99D68];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timestamp");
  v7 = (void *)objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");

  v8 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v4, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v10 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");

  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v12 = v11;
  v13 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v4, "second");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timestamp");
  v15 = objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = [ATXTripDuetEvent alloc];
  objc_msgSend(v4, "first");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "eventBody");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userSpecificPlaceType");
  objc_msgSend(v4, "second");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "eventBody");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ATXTripDuetEvent initWithOrigin:destination:durationAtOrigin:startDate:endDate:](v18, "initWithOrigin:destination:durationAtOrigin:startDate:endDate:", v21, objc_msgSend(v23, "userSpecificPlaceType"), v7, v10, v12);

  return v24;
}

void __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_5_cold_1(a1, v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138412802;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    v14 = 2048;
    v15 = v9;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Successfully fetched %@ Biome events for semantic location between %f and %f", (uint8_t *)&v10, 0x20u);

  }
}

void __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    v5 = objc_msgSend(v3, "origin");
    v6 = objc_msgSend(v7, "destination");
    v4 = v7;
    if (v5 != v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
      v4 = v7;
    }
  }

}

void __79__ATXTripDuetDataProvider_groupTripsFromPublisher_startTimestamp_endTimestamp___block_invoke_5_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "Error encountered while fetching events from Biome for semantic location between %f and %f: %@", (uint8_t *)&v7, 0x20u);

}

@end
