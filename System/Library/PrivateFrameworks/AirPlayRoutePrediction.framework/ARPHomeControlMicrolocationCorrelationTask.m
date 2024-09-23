@implementation ARPHomeControlMicrolocationCorrelationTask

- (ARPHomeControlMicrolocationCorrelationTask)initWithCorrelationsFile:(id)a3 knowledgeStore:(id)a4
{
  id v6;
  id v7;
  ARPHomeControlMicrolocationCorrelationTask *v8;
  uint64_t v9;
  NSString *file;
  ARPHomeControlCorrelationUtilities *v11;
  ARPHomeControlCorrelationUtilities *utilities;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ARPHomeControlMicrolocationCorrelationTask;
  v8 = -[ARPHomeControlMicrolocationCorrelationTask init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    file = v8->_file;
    v8->_file = (NSString *)v9;

    objc_storeStrong((id *)&v8->_knowledgeStore, a4);
    v11 = -[ARPHomeControlCorrelationUtilities initWithKnowledgeStore:]([ARPHomeControlCorrelationUtilities alloc], "initWithKnowledgeStore:", v7);
    utilities = v8->_utilities;
    v8->_utilities = v11;

  }
  return v8;
}

- (id)queryForMicroLocationsOverlappingEvents:(id)a3 maxEvents:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  _QWORD v34[4];
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", 2.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", -2.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "compare:", v11) == 1)
    {
      v12 = objc_alloc(getBMDKEventStreamClass());
      objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithDKStreamIdentifier:contentProtection:", v14, *MEMORY[0x1E0CB2AC0]);

      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      objc_msgSend(v16, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      objc_msgSend(v18, "numberWithDouble:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", v17, v19, 0, 0, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      v37[3] = 0;
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3032000000;
      v35[3] = __Block_byref_object_copy__1;
      v35[4] = __Block_byref_object_dispose__1;
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v34[3] = 0;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __96__ARPHomeControlMicrolocationCorrelationTask_queryForMicroLocationsOverlappingEvents_maxEvents___block_invoke_2;
      v27[3] = &unk_1EA7D4688;
      v30 = v35;
      v31 = v37;
      v28 = v5;
      v22 = v21;
      v29 = v22;
      v32 = v34;
      v33 = a4;
      v23 = (id)objc_msgSend(v20, "sinkWithCompletion:shouldContinue:", &__block_literal_global_4, v27);
      v24 = v29;
      v25 = v22;

      _Block_object_dispose(v34, 8);
      _Block_object_dispose(v35, 8);

      _Block_object_dispose(v37, 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        -[ARPHomeControlMicrolocationCorrelationTask queryForMicroLocationsOverlappingEvents:maxEvents:].cold.1();
      v25 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v25 = (id)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

BOOL __96__ARPHomeControlMicrolocationCorrelationTask_queryForMicroLocationsOverlappingEvents_maxEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  _BOOL8 v19;
  uint64_t v20;
  unint64_t v21;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dkEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    if (v9 <= 2.0)
      break;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(_QWORD *)(v10 + 24) + 1;
    *(_QWORD *)(v10 + 24) = v11;
    if (v11 == objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v19 = 0;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  objc_msgSend(v5, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v16);
  v18 = v17;

  if (v18 <= 2.0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v21 = *(_QWORD *)(v20 + 24) + 1;
    *(_QWORD *)(v20 + 24) = v21;
    v19 = v21 < *(_QWORD *)(a1 + 72);
  }
  else
  {
    v19 = 1;
  }
LABEL_9:

  return v19;
}

- (void)execute
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD793000, a2, OS_LOG_TYPE_ERROR, "Error reading persisted microlocation home controls archive file: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __53__ARPHomeControlMicrolocationCorrelationTask_execute__block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __53__ARPHomeControlMicrolocationCorrelationTask_execute__block_invoke_2(uint64_t a1, void *a2, void *a3)
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

uint64_t __53__ARPHomeControlMicrolocationCorrelationTask_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
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

- (void)registerARPHomeControlNotificationTask
{
  xpc_activity_register("com.apple.coreduetd.homecontrolsuggestion.correlation.notification.task", (xpc_object_t)*MEMORY[0x1E0C80748], &__block_literal_global_26);
}

void __84__ARPHomeControlMicrolocationCorrelationTask_registerARPHomeControlNotificationTask__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  xpc_activity_state_t state;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t v13[4];
  uint8_t buf[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  state = xpc_activity_get_state(v2);
  if (state)
  {
    if (state == 2)
    {
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.AirPlayRoutePrediction.ARPHomeControlSuggester.ReQuery"), "UTF8String"));
      ARPLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD793000, v4, OS_LOG_TYPE_DEFAULT, "ARPHomeControl Suggester Notification After MicroLocations Correlation Notification", buf, 2u);
      }

    }
  }
  else
  {
    v5 = *MEMORY[0x1E0C80898];
    *(_QWORD *)buf = *MEMORY[0x1E0C80760];
    v15 = v5;
    v6 = *MEMORY[0x1E0C80738];
    v16 = *MEMORY[0x1E0C80878];
    v17 = v6;
    v13[0] = xpc_int64_create(2 * *MEMORY[0x1E0C807E0]);
    v7 = (void *)MEMORY[0x1E0C81238];
    v8 = MEMORY[0x1E0C81238];
    v13[1] = v7;
    v13[2] = xpc_string_create((const char *)*MEMORY[0x1E0C80888]);
    v9 = (void *)MEMORY[0x1E0C81240];
    v10 = MEMORY[0x1E0C81240];
    v13[3] = v9;
    v11 = xpc_dictionary_create((const char *const *)buf, v13, 4uLL);
    xpc_activity_set_criteria(v2, v11);

    for (i = 3; i != -1; --i)
  }

}

- (NSString)file
{
  return self->_file;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (ARPHomeControlCorrelationUtilities)utilities
{
  return self->_utilities;
}

- (void)setUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_utilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

- (void)queryForMicroLocationsOverlappingEvents:maxEvents:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1DD793000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "queryForMicroLocationsOverlappingEvents: events not in descending order", v0, 2u);
}

@end
