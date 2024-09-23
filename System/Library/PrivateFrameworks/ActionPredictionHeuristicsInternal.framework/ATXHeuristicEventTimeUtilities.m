@implementation ATXHeuristicEventTimeUtilities

- (ATXHeuristicEventTimeUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicEventTimeUtilities;
  return -[ATXHeuristicEventTimeUtilities init](&v3, sel_init);
}

- (id)travelTimeToEvent:(id)a3 destination:(id)a4 transportType:(id)a5 heuristicDevice:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  ATXEventTravelTimeDataSource *v30;
  CLPlacemark **p_destination;
  OS_dispatch_semaphore *v32;
  OS_dispatch_semaphore *semaphore;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSString *transportType;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  _QWORD v58[7];
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v57 = a4;
  v56 = a5;
  v12 = a6;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__17;
  v66 = __Block_byref_object_dispose__17;
  v67 = 0;
  v59 = 0;
  v60[0] = &v59;
  v60[1] = 0x3032000000;
  v60[2] = __Block_byref_object_copy__17;
  v60[3] = __Block_byref_object_dispose__17;
  v61 = 0;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "compare:", v14) == 1;

    if (v15)
    {
      __atxlog_handle_context_heuristic();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicEventTimeUtilities travelTimeToEvent:destination:transportType:heuristicDevice:].cold.3(v16, v17, v18, v19, v20, v21, v22, v23);

    }
    objc_msgSend(v11, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dateByAddingTimeInterval:", -600.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    v30 = -[ATXEventTravelTimeDataSource initWithDevice:]([ATXEventTravelTimeDataSource alloc], "initWithDevice:", v12);
    objc_storeStrong((id *)&self->_event, a3);
    objc_storeStrong((id *)&self->_dataSource, v30);
    p_destination = &self->_destination;
    objc_storeStrong((id *)&self->_destination, a4);
    objc_storeStrong((id *)&self->_transportType, a5);
    v32 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    semaphore = self->_semaphore;
    self->_semaphore = v32;

    __atxlog_handle_context_heuristic();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "eventIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLPlacemark name](*p_destination, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = v35;
      v70 = 2112;
      v71 = v36;
      _os_log_impl(&dword_1C99DF000, v34, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEventTimeUtilities: Calling datasource for time (Eid: %@), D:(%@)", buf, 0x16u);

    }
    -[EKEvent eventIdentifier](self->_event, "eventIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLPlacemark location](*p_destination, "location");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    transportType = self->_transportType;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __94__ATXHeuristicEventTimeUtilities_travelTimeToEvent_destination_transportType_heuristicDevice___block_invoke;
    v58[3] = &unk_1E82C56A8;
    v58[6] = &v59;
    v58[4] = self;
    v58[5] = &v62;
    -[ATXEventTravelTimeDataSource travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:callback:](v30, "travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:callback:", v37, v38, v25, transportType, 1, v58);

    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", self->_semaphore, 1.0);
    if (*(_QWORD *)(v60[0] + 40))
    {
      __atxlog_handle_context_heuristic();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicEventTimeUtilities travelTimeToEvent:destination:transportType:heuristicDevice:].cold.2((uint64_t)v60, v40, v41, v42, v43, v44, v45, v46);

    }
    v47 = (id)v63[5];
    goto LABEL_19;
  }
  __atxlog_handle_context_heuristic();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v26, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEventTimeUtilities: Event is nil, setting destination expiry time to an hour from now", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dateByAddingTimeInterval:", 3600.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_context_heuristic();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v57, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v69 = v29;
    _os_log_impl(&dword_1C99DF000, v28, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEventTimeUtilities: Determining travel time: (event is nil), D:(%@)", buf, 0xCu);

  }
  if (v57)
    goto LABEL_12;
  __atxlog_handle_context_heuristic();
  v30 = (ATXEventTravelTimeDataSource *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v30->super, OS_LOG_TYPE_ERROR))
    -[ATXHeuristicEventTimeUtilities travelTimeToEvent:destination:transportType:heuristicDevice:].cold.1(&v30->super, v49, v50, v51, v52, v53, v54, v55);
  v47 = 0;
LABEL_19:

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v62, 8);

  return v47;
}

void __94__ATXHeuristicEventTimeUtilities_travelTimeToEvent_destination_transportType_heuristicDevice___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 40));
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (ATXEventTravelTimeDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (CLPlacemark)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
  objc_storeStrong((id *)&self->_transportType, a3);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (NSDictionary)resolvedTimeInformation
{
  return self->_resolvedTimeInformation;
}

- (void)setResolvedTimeInformation:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedTimeInformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedTimeInformation, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)travelTimeToEvent:(uint64_t)a3 destination:(uint64_t)a4 transportType:(uint64_t)a5 heuristicDevice:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, a1, a3, "ATXHeuristicEventTimeUtilities: Error: Unable to resolve time to travel destination (nil)", a5, a6, a7, a8, 0);
}

- (void)travelTimeToEvent:(uint64_t)a3 destination:(uint64_t)a4 transportType:(uint64_t)a5 heuristicDevice:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a2, a3, "ATXHeuristicEventTimeUtilities: Error while resolving time to travel destination: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)travelTimeToEvent:(uint64_t)a3 destination:(uint64_t)a4 transportType:(uint64_t)a5 heuristicDevice:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, a1, a3, "ATXHeuristicEventTimeUtilities: While computing time, current time is later than event start time. Will still compute time", a5, a6, a7, a8, 0);
}

@end
