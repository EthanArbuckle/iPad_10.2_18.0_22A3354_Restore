@implementation DKHistogramQuery

void __58___DKHistogramQuery__fetchRemoteResultsWithStorage_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[2];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v3 = (void *)MEMORY[0x1E0C97B20];
  +[_DKHistogram entityName](_DKHistogram, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v5);

  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v7);

  objc_msgSend(v2, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "remoteHistogramLimit"));
  +[_CDMutablePerfMetric perfMetricForFetchRequest:type:]((uint64_t)_CDMutablePerfMetric, v2, CFSTR("Histogram Queries"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = 0;
  v21[1] = 0;
  v9 = *(void **)(a1 + 32);
  v20 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v2, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  if (!_DKEventQueryPerformanceTesting && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v2, "fetchLimit");
    objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceNow");
    v14 = v13;
    v15 = objc_msgSend(v10, "count");
    objc_msgSend(v2, "predicate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v23 = v12;
    v24 = 2048;
    v25 = -v14;
    v26 = 2048;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "_DKHistogramQuery _fetchRemoteResultsWithStorage finished executeFetchRequest, fetchLimit %lu object(s), elapsed %f(sec), returned %lu object(s), Predicate: %@ ", buf, 0x2Au);

  }
  if (v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v11);
    CDPerfMetricEndTimingAndIncrementErrorCount(v8, (uint64_t)v21);
  }
  else
  {
    CDPerfMetricEndTimingAndSetResultCount(v8, (uint64_t)v21, objc_msgSend(v10, "count"));
    if (objc_msgSend(v10, "count"))
    {
      -[_DKHistogramQuery _histogramFromManagedObjects:](*(_DKHistogram **)(a1 + 48), v10);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
  }

}

uint64_t __55___DKHistogramQuery_executeUsingCoreDataStorage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __58___DKHistogramQuery__fetchRemoteResultsWithStorage_error___block_invoke_cold_1(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = objc_begin_catch(a1);
  *a3 = v4;
  v5 = v4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v6 = 138412290;
    v7 = v5;
    _os_log_fault_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Execute fetch request caught:%@", (uint8_t *)&v6, 0xCu);
  }
}

@end
