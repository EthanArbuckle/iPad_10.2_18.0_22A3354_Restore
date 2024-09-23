@implementation ATXPeopleDiscovery

- (ATXPeopleDiscovery)init
{
  ATXPeopleDiscovery *v2;
  uint64_t v3;
  RTRoutineManager *routineManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXPeopleDiscovery;
  v2 = -[ATXPeopleDiscovery init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    routineManager = v2->_routineManager;
    v2->_routineManager = (RTRoutineManager *)v3;

  }
  return v2;
}

- (id)fetchPeopleWithProximityFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  RTRoutineManager *routineManager;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  intptr_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v6 = a3;
  v7 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__93;
  v46 = __Block_byref_object_dispose__93;
  v47 = (id)objc_opt_new();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__93;
  v40 = __Block_byref_object_dispose__93;
  v41 = 0;
  v8 = dispatch_semaphore_create(0);
  routineManager = self->_routineManager;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __70__ATXPeopleDiscovery_fetchPeopleWithProximityFromStartDate_toEndDate___block_invoke;
  v32[3] = &unk_1E82E5670;
  v34 = &v36;
  v35 = &v42;
  v10 = v8;
  v33 = v10;
  -[RTRoutineManager fetchProximityHistoryFromStartDate:endDate:completionHandler:](routineManager, "fetchProximityHistoryFromStartDate:endDate:completionHandler:", v6, v7, v32);
  if (v37[5])
  {
    __atxlog_handle_usage_insights();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXPeopleDiscovery fetchPeopleWithProximityFromStartDate:toEndDate:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  v19 = v10;
  v20 = dispatch_time(0, 5000000000);
  v21 = dispatch_semaphore_wait(v19, v20);

  if (v21)
  {
    __atxlog_handle_usage_insights();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ATXPeopleDiscovery fetchPeopleWithProximityFromStartDate:toEndDate:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    v30 = 0;
  }
  else
  {
    objc_msgSend((id)v43[5], "bpsPublisher");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v30;
}

void __70__ATXPeopleDiscovery_fetchPeopleWithProximityFromStartDate_toEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
}

- (void)fetchPeopleWithProximityFromStartDate:(uint64_t)a3 toEndDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Timed out waiting for proximity history semaphore", a5, a6, a7, a8, 2u);
}

- (void)fetchPeopleWithProximityFromStartDate:(uint64_t)a3 toEndDate:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%s: Error fetching nearby people", a5, a6, a7, a8, 2u);
}

@end
