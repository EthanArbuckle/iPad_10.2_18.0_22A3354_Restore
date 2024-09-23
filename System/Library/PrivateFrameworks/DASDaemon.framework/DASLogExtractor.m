@implementation DASLogExtractor

uint64_t __36___DASLogExtractor_initWithArchive___block_invoke()
{
  return 1;
}

void __45___DASLogExtractor_getDefaultFilterPredicate__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = (void *)getDefaultFilterPredicate_subpredicates;
  getDefaultFilterPredicate_subpredicates = (uint64_t)v0;

  v2 = (void *)getDefaultFilterPredicate_subpredicates;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("type = %d"), 1024);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
    NSLog(CFSTR("Error when preparing log store: %@"), v6);
  if (v5 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE60C80]), "initWithSource:", v5);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setFlags:", 391);
    objc_msgSend(*(id *)(a1 + 32), "getDefaultFilterPredicate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setFilterPredicate:", v12);

    v13 = dispatch_semaphore_create(0);
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v15 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke_2;
    v22[3] = &unk_24E138840;
    v24 = *(_QWORD *)(a1 + 72);
    v23 = *(id *)(a1 + 56);
    objc_msgSend(v14, "setEventHandler:", v22);
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke_3;
    v19[3] = &unk_24E138868;
    v21 = &v25;
    v17 = v13;
    v20 = v17;
    objc_msgSend(v16, "setInvalidationHandler:", v19);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "activateStreamFromDate:", *(_QWORD *)(a1 + 48));
    NSLog(CFSTR("Fetching information"));
    v18 = dispatch_time(0xFFFFFFFFFFFFFFFFLL, 1000000000);
    dispatch_semaphore_wait(v17, v18);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *((_DWORD *)v26 + 6);

    _Block_object_dispose(&v25, 8);
  }

}

void __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = *(id *)(a1 + 40);
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    objc_msgSend(v3, "eventStream");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

  }
}

intptr_t __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2 != 5)
  {
    NSLog(CFSTR("Error in getting the entire stream"));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __67___DASLogExtractor_summarizePolicyDenialsOverMessages_maxDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v9 <= v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v13 = v16 < v18;

  }
  else
  {
    v13 = -1;
  }

  return v13;
}

uint64_t __71___DASLogExtractor_copyActivitySummary_startDate_endDate_detail_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DASLogEntry logEntryForDate:category:message:](_DASLogEntry, "logEntryForDate:category:message:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  return 1;
}

uint64_t __74___DASLogExtractor_copyApplicationSummary_startDate_endDate_detail_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DASLogEntry logEntryForDate:category:message:](_DASLogEntry, "logEntryForDate:category:message:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  return 1;
}

uint64_t __88___DASLogExtractor_addConditionToHistory_fromMessage_atTimestamp_compactRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", &stru_24E138A50) ^ 1;
}

uint64_t __55___DASLogExtractor_sysConditionsLog_startDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v5, "composedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addConditionToHistory:fromMessage:atTimestamp:compactRepresentation:", v4, v6, v7, *(unsigned __int8 *)(a1 + 48));
  return 1;
}

void __55___DASLogExtractor_sysConditionsLog_startDate_endDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  FILE **v5;
  FILE *v6;
  id v7;
  const char *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (FILE **)MEMORY[0x24BDAC8E8];
  v6 = (FILE *)*MEMORY[0x24BDAC8E8];
  objc_msgSend(a2, "description");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  objc_msgSend(v13, "description");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v6, "%s:-----------\n%s\n\n", v8, (const char *)objc_msgSend(v9, "UTF8String"));

  objc_msgSend(v13, "idealIntervals");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v13, "idealIntervals");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  else
  {
    fwrite("No ideal intervals.\n", 0x14uLL, 1uLL, *v5);
  }

}

@end
