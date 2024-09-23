@implementation PHChangeHandlingDebugger

- (PHChangeHandlingDebugger)init
{
  return -[PHChangeHandlingDebugger initWithMaxPreviousEvents:](self, "initWithMaxPreviousEvents:", 50);
}

- (void)changeHandlingActiveStateDidChange:(BOOL)a3
{
  PLRunWithUnfairLock();
}

- (PHChangeHandlingDebugger)initWithMaxPreviousEvents:(unint64_t)a3
{
  PHChangeHandlingDebugger *v4;
  PHChangeHandlingDebugger *v5;
  NSMutableArray *v6;
  NSMutableArray *eventLock_previousEvents;
  double v8;
  PHChangeHandlingDebugger *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHChangeHandlingDebugger;
  v4 = -[PHChangeHandlingDebugger init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxPreviousEvents = a3;
    v4->_eventLock._os_unfair_lock_opaque = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    eventLock_previousEvents = v5->_eventLock_previousEvents;
    v5->_eventLock_previousEvents = v6;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5->_activeLock._os_unfair_lock_opaque = 0;
    v5->_activeLock_isActive = 0;
    v5->_activeLock_isActiveTimestamp = v8;
    v5->_pendingLock_isChangeProcessingPending = 0;
    v5->_pendingLock_isChangeProcessingPendingTimestamp = v8;
    v9 = v5;
  }

  return v5;
}

uint64_t __63__PHChangeHandlingDebugger_changeHandlingActiveStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) = *(_BYTE *)(a1 + 40);
  result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v3;
  return result;
}

- (id)beginProcessPendingChanges
{
  void *v2;

  PLResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");
  return v2;
}

- (void)endProcessPendingChanges
{
  PLRunWithUnfairLock();
}

- (void)processPendingChangesStateDidChange:(BOOL)a3
{
  PLRunWithUnfairLock();
}

- (id)stateCaptureDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  double (*v24)(_QWORD *);
  void *v25;
  PHChangeHandlingDebugger *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD *);
  void *v40;
  PHChangeHandlingDebugger *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__41847;
  v54 = __Block_byref_object_dispose__41848;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__41847;
  v48 = __Block_byref_object_dispose__41848;
  v49 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v37 = MEMORY[0x1E0C809B0];
  v38 = 3221225472;
  v39 = __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke;
  v40 = &unk_1E35DF160;
  v41 = self;
  v42 = &v50;
  v43 = &v44;
  PLRunWithUnfairLock();
  objc_msgSend((id)v45[5], "_pl_map:", &__block_literal_global_41849);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x2020000000;
  v32 = 0;
  v22 = v3;
  v23 = 3221225472;
  v24 = __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke_3;
  v25 = &unk_1E35DF160;
  v26 = self;
  v27 = &v33;
  v28 = &v29;
  PLRunWithUnfairLock();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  PLRunWithUnfairLock();
  -[PHChangeHandlingDebugger formattedStringFromTimestamp:](self, "formattedStringFromTimestamp:", v30[3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeHandlingDebugger formattedStringFromTimestamp:](self, "formattedStringFromTimestamp:", v15[3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v51[5], "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("currentEvent"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("previousEvents"));
  if (*((_BYTE *)v34 + 24))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v9;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("isActive"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("isActiveTimestamp"));
  if (*((_BYTE *)v19 + 24))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("isChangeProcessingPending"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("isChangeProcessingPendingTimestamp"));
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v7;
}

- (id)formattedStringFromTimestamp:(double)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D71088], "stringFromTimestamp:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x1E0D71088], "stringFromRelativeTimeInterval:", a3 - v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLock_previousEvents, 0);
  objc_storeStrong((id *)&self->_eventLock_nextEvent, 0);
  objc_storeStrong((id *)&self->_eventLock_currentEvent, 0);
}

void __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  v2 = objc_msgSend(*(id *)(a1[4] + 40), "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

double __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke_3(_QWORD *a1)
{
  double result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 52);
  result = *(double *)(a1[4] + 56);
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

double __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke_4(_QWORD *a1)
{
  double result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 68);
  result = *(double *)(a1[4] + 72);
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __50__PHChangeHandlingDebugger_stateCaptureDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

uint64_t __64__PHChangeHandlingDebugger_processPendingChangesStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 68) = *(_BYTE *)(a1 + 40);
  result = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v3;
  return result;
}

void __52__PHChangeHandlingDebugger_endProcessPendingChanges__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "setEndTimestamp:");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  v6 = *(_QWORD *)(a1 + 32);
  if (v5 >= *(_QWORD *)(v6 + 8))
  {
    objc_msgSend(*(id *)(v6 + 40), "objectAtIndexedSubscript:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectAtIndex:", 0);
  }
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", v2);
  }
  else
  {
    PLChangeHandlingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_FAULT, "endProcessPendingChanges: Unexpected nil debugger event", v11, 2u);
    }

  }
}

id __54__PHChangeHandlingDebugger_beginProcessPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  PHChangeHandlingDebugEvent *v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (v3)
  {
    objc_storeStrong((id *)(v2 + 24), v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "reset");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;
  }
  else
  {
    v6 = objc_alloc_init(PHChangeHandlingDebugEvent);
    v7 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;
  }

  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

@end
