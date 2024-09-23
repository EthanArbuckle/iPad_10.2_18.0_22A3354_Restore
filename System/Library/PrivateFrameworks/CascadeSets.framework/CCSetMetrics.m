@implementation CCSetMetrics

- (CCSetMetrics)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (void)computeAndReportMetricsForAllSets:(id)a3 shouldDefer:(id)a4
{
  unsigned int (**v5)(_QWORD);
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  int v16;
  __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  NSObject *v25;
  __int128 v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35;
  char v36[15];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const __CFString *v43;
  __int16 v44;
  NSObject *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v5 = (unsigned int (**)(_QWORD))a4;
  if (+[CCSetMetrics shouldReportAnalyticsEventWithName:](CCSetMetrics, "shouldReportAnalyticsEventWithName:", CFSTR("com.apple.CascadeSets.SetDistribution")))
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v7;
      _os_log_impl(&dword_237B25000, v6, OS_LOG_TYPE_DEFAULT, "Preparing to enumerate and compute metrics for %@ set(s)", buf, 0xCu);

    }
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v27;
    v28 = v8;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v10)
    {
      v29 = *(_QWORD *)v38;
      *(_QWORD *)&v11 = 138412546;
      v26 = v11;
LABEL_6:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v9);
        v13 = *(const __CFString **)(*((_QWORD *)&v37 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x23B82079C]();
        if (v5 && v5[2](v5))
        {
          __biome_log_for_category();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            +[CCSetMetrics computeAndReportMetricsForAllSets:shouldDefer:].cold.1(&v35, v36, v15);
          v16 = 1;
        }
        else
        {
          v34 = 0;
          +[CCSetMetrics _computeMetricsForSet:shouldDefer:error:](CCSetMetrics, "_computeMetricsForSet:shouldDefer:error:", v13, v5, &v34, v26);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v34;
          if (v17)
          {
            __biome_log_for_category();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v17;
              _os_log_impl(&dword_237B25000, v18, OS_LOG_TYPE_DEFAULT, "Computed set metrics: %@", buf, 0xCu);
            }

            -[NSObject addObject:](v28, "addObject:", v17);
            v16 = 0;
          }
          else
          {
            __biome_log_for_category();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v26;
              v43 = v13;
              v44 = 2112;
              v45 = v15;
              _os_log_error_impl(&dword_237B25000, v19, OS_LOG_TYPE_ERROR, "Failed to compute metrics for set: %@ error: %@", buf, 0x16u);
            }

            v16 = 1;
          }

        }
        objc_autoreleasePoolPop(v14);
        if (v16)
          break;
        if (v10 == ++v12)
        {
          v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v10)
            goto LABEL_6;
          goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:

      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSObject count](v28, "count"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v43 = v21;
        _os_log_impl(&dword_237B25000, v20, OS_LOG_TYPE_DEFAULT, "Reporting metrics for %@ set(s)", buf, 0xCu);

      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v9 = v28;
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v9);
            +[CCSetMetrics reportAnalyticsEvent:withName:](CCSetMetrics, "reportAnalyticsEvent:withName:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), CFSTR("com.apple.CascadeSets.SetDistribution"), v26);
          }
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
        }
        while (v22);
      }
    }

    v25 = v28;
  }
  else
  {
    __biome_log_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = CFSTR("com.apple.CascadeSets.SetDistribution");
      _os_log_impl(&dword_237B25000, v25, OS_LOG_TYPE_DEFAULT, "Skipping metrics computation as the event: %@ is not used.", buf, 0xCu);
    }
  }

}

+ (id)_computeMetricsForSet:(id)a3 shouldDefer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  CCSetDistribution *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v7 = a3;
  v8 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__7;
  v35 = __Block_byref_object_dispose__7;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__7;
  v25 = __Block_byref_object_dispose__7;
  v26 = -[CCSetDistribution initWithSet:]([CCSetDistribution alloc], "initWithSet:", v7);
  objc_msgSend(v7, "changePublisherWithUseCase:", *MEMORY[0x24BE0C058]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __56__CCSetMetrics__computeMetricsForSet_shouldDefer_error___block_invoke;
  v20[3] = &unk_250991050;
  v20[4] = &v27;
  v20[5] = &v31;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __56__CCSetMetrics__computeMetricsForSet_shouldDefer_error___block_invoke_2;
  v17 = &unk_250991078;
  v19 = &v21;
  v10 = v8;
  v18 = v10;
  v11 = (id)objc_msgSend(v9, "sinkWithCompletion:shouldContinue:", v20, &v14);

  if (*((_BYTE *)v28 + 24))
  {
    objc_msgSend((id)v22[5], "compute", v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CCSetError(a5, (id)v32[5]);
    v12 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v12;
}

void __56__CCSetMetrics__computeMetricsForSet_shouldDefer_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state"))
  {
    objc_msgSend(v6, "error");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

BOOL __56__CCSetMetrics__computeMetricsForSet_shouldDefer_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addSetChange:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = !v4 || ((*(uint64_t (**)(void))(v4 + 16))() & 1) == 0;

  return v5;
}

+ (double)_populationStandardDeviation:(shared_ptr<std:(double)a4 :vector<unsigned short>>)a3 mean:
{
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  uint64_t v6;
  double v7;
  unsigned int v8;

  v5 = **(unsigned __int16 ***)a3.__ptr_;
  v4 = *(unsigned __int16 **)(*(_QWORD *)a3.__ptr_ + 8);
  if (v4 == v5)
    return 0.0;
  v6 = v4 - v5;
  v7 = 0.0;
  do
  {
    v8 = *v5++;
    v7 = v7 + ((double)v8 - a4) * ((double)v8 - a4);
  }
  while (v5 != v4);
  return sqrt(v7 / (double)(unint64_t)v6);
}

+ (BOOL)shouldReportAnalyticsEventWithName:(id)a3
{
  return AnalyticsIsEventUsed();
}

+ (void)reportAnalyticsEvent:(id)a3 withName:(id)a4
{
  AnalyticsSendEvent();
}

+ (void)computeAndReportMetricsForAllSets:(os_log_t)log shouldDefer:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Aborting due to deferral signal", buf, 2u);
}

@end
