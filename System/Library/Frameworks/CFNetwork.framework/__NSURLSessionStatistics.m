@implementation __NSURLSessionStatistics

+ (void)reportMetricsToSymptoms:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int is_selected_for_reporting;
  CFNetworkTaskMetrics_s *v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  double Helper_x8__symptom_framework_init;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  __NSURLSessionStatistics *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t domain;
  uint64_t label;
  unint64_t v32;
  void *v33;
  __CFString *v34;
  uint64_t v35;
  uint32_t networkscore_sampling_rate_denominator;
  __NSURLSessionStatistics *v37;
  NSMutableDictionary *v38;
  NSObject *v39;
  unint64_t var7;
  __int128 v41;
  void *v42;
  void *v43;
  NSMutableDictionary *v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_private_nw_activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(v3, "_private_nw_activity"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        is_selected_for_reporting = nw_activity_is_selected_for_reporting(),
        v5,
        v4,
        is_selected_for_reporting))
  {
    v7 = +[__NSURLSessionStatistics createCFNetworkTaskMetrics_s:](__NSURLSessionStatistics, "createCFNetworkTaskMetrics_s:", v3);
    if (v7)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v8 = (id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        var7 = v7->var7;
        LODWORD(v41) = 134217984;
        *(_QWORD *)((char *)&v41 + 4) = var7;
        _os_log_debug_impl(&dword_183ECA000, v8, OS_LOG_TYPE_DEBUG, "[Telemetry]: Calling symptoms. The number of transactions are %llu", (uint8_t *)&v41, 0xCu);
      }

      v9 = 120 * v7->var7 + 104;
      Helper_x8__symptom_framework_init = gotLoadHelper_x8__symptom_framework_init(v10);
      v13 = *(_QWORD *)(v12 + 304);
      v14 = v14 || v13 == 0;
      if (!v14)
      {
        if (getSymptomHandle(void)::sInitSymptomFramework != -1)
          dispatch_once(&getSymptomHandle(void)::sInitSymptomFramework, &__block_literal_global_17446);
        symptom_new_delayInitStub(Helper_x8__symptom_framework_init);
        symptom_set_qualifier_delayInitStub(v15);
        symptom_set_additional_qualifier_delayInitStub(v16);
        if (os_variant_has_internal_diagnostics()
          && nw_activity_should_write_metric_stream_to_log())
        {
          v18 = -[__NSURLSessionStatistics initWithCFNetworkReport:length:]([__NSURLSessionStatistics alloc], "initWithCFNetworkReport:length:", v7, v9);
          v19 = -[__NSURLSessionStatistics dictionaryReport](v18, "dictionaryReport");
          if (v19)
          {
            __CFNPopulateTransactionMetrics(v7, v19);
            *(_QWORD *)&v41 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v41 + 1) = 3221225472;
            v42 = ___Z28__CFNReportMetricsToSymptomsPvm_block_invoke;
            v43 = &unk_1E14FE118;
            v44 = v19;
            dispatch_async((dispatch_queue_t)logQueue, &v41);
          }

        }
        else
        {
          symptom_send_delayInitStub(v17);
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "_private_nw_activity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_nw_activity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 == v21;

  if (!v22)
  {
    objc_msgSend(v3, "_private_nw_activity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    if (!v24)
    {
      objc_msgSend(v3, "_private_nw_activity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      nw_activity_complete_with_reason();

    }
  }
  objc_opt_self();
  if (os_variant_has_internal_diagnostics())
  {
    if (nw_settings_networkscore_metrics_enabled())
    {
      if (v7
        || (v7 = +[__NSURLSessionStatistics createCFNetworkTaskMetrics_s:](__NSURLSessionStatistics, "createCFNetworkTaskMetrics_s:", v3)) != 0)
      {
        objc_msgSend(v3, "_private_nw_activity");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 == 0;

        if (!v28)
        {
          objc_msgSend(v3, "_private_nw_activity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          domain = nw_activity_get_domain();
          label = nw_activity_get_label();
          v32 = v7->var7;
          objc_msgSend(v3, "_effectiveConfiguration");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_sourceApplicationBundleIdentifier");
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (setupNetworkScoreReporting(void)::sInitNetworkScoreReporting != -1)
            dispatch_once(&setupNetworkScoreReporting(void)::sInitNetworkScoreReporting, &__block_literal_global_37_17471);
          v35 = setupNetworkScoreReporting(void)::networkScoreReporting;
          if (setupNetworkScoreReporting(void)::networkScoreReporting)
          {
            if (!v34)
            {
              if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"))
                v34 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
              else
                v34 = CFSTR("Not Available");
            }
            networkscore_sampling_rate_denominator = nw_settings_get_networkscore_sampling_rate_denominator();
            if (!arc4random_uniform(networkscore_sampling_rate_denominator))
            {
              if (120 * v32 == -104)
              {
                if (CFNLog::onceToken != -1)
                  dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
                v39 = CFNLog::logger;
                if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v41) = 0;
                  _os_log_debug_impl(&dword_183ECA000, v39, OS_LOG_TYPE_DEBUG, "[NETWORKSCORE] return because the report is empty", (uint8_t *)&v41, 2u);
                }
              }
              else
              {
                v37 = -[__NSURLSessionStatistics initWithCFNetworkReport:length:]([__NSURLSessionStatistics alloc], "initWithCFNetworkReport:length:", v7, 120 * v32 + 104);
                v38 = -[__NSURLSessionStatistics dictionaryReport](v37, "dictionaryReport");
                if (v38)
                {
                  __CFNPopulateTransactionMetrics(v7, v38);
                  -[NSMutableDictionary setValue:forKey:](v38, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", domain), CFSTR("activityDomain"));
                  -[NSMutableDictionary setValue:forKey:](v38, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", label), CFSTR("activityLabel"));
                  *(_QWORD *)&v41 = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&v41 + 1) = 3221225472;
                  v42 = ___Z30__CFNReportNetworkScoreMetricsPvmPK10__CFStringjj_block_invoke;
                  v43 = &unk_1E14FE1E0;
                  v44 = v38;
                  v45 = v34;
                  v46 = v35;
                  dispatch_async((dispatch_queue_t)logQueue, &v41);
                }

              }
            }
          }

        }
      }
    }
  }
  free(v7);

}

- (__NSURLSessionStatistics)initWithCFNetworkReport:(void *)a3 length:(int64_t)a4
{
  void *v7;
  __NSURLSessionStatistics *v8;

  if ((unint64_t)a4 >= 0x68
    && 120 * *((_QWORD *)a3 + 7) + 104 == a4
    && (v7 = malloc_type_malloc(a4, 0x740AC3FFuLL), (self->report = v7) != 0))
  {
    memcpy(v7, a3, a4);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (__NSURLSessionStatistics)initWithJSONData:(id)a3
{
  id v4;
  __NSURLSessionStatistics *v5;
  __NSURLSessionStatistics *v6;
  uint64_t v7;
  id v8;
  NSMutableDictionary *dictionaryReport;
  id v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)__NSURLSessionStatistics;
  v5 = -[__NSURLSessionStatistics init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5 && objc_msgSend(v4, "length"))
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v11);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v11;
    dictionaryReport = v6->_dictionaryReport;
    v6->_dictionaryReport = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  free(self->report);
  v3.receiver = self;
  v3.super_class = (Class)__NSURLSessionStatistics;
  -[__NSURLSessionStatistics dealloc](&v3, sel_dealloc);
}

- (NSUUID)nwActivity
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)self->report + 64);
}

- (NSUUID)taskUUID
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)self->report + 80);
}

- (NSArray)connectionUUIDS
{
  id v3;
  _QWORD *report;
  unint64_t v5;
  char *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  report = self->report;
  if (report[7])
  {
    v5 = 0;
    v6 = (char *)(report + 19);
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v6);
      objc_msgSend(v3, "addObject:", v7);

      ++v5;
      v6 += 120;
    }
    while (report[7] > v5);
  }
  return (NSArray *)v3;
}

- (NSMutableDictionary)dictionaryReport
{
  NSMutableDictionary *dictionaryReport;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  __CFString *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  __CFString *v24;
  _DWORD *v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  uint64_t v43;
  void *v44;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  void *v63;
  NSMutableDictionary *v64;
  NSMutableDictionary *v66;
  __NSURLSessionStatistics *v67;
  id v68;
  unsigned int *report;
  unsigned int v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;

  dictionaryReport = self->_dictionaryReport;
  if (dictionaryReport)
  {
LABEL_63:
    v18 = dictionaryReport;
    return v18;
  }
  if (self->report)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    report = (unsigned int *)self->report;
    v81 = *(_QWORD *)report;
    -[__NSURLSessionStatistics externallyVisibleNwActivity](self, "externallyVisibleNwActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("activityUUID"));

    v7 = *((_QWORD *)report + 1);
    if (v7 < v81 || v7 == 0)
      v9 = 0;
    else
      v9 = v7 - v81;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("didCompleteWithError"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)report + 2));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, CFSTR("numberOfRetries"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)report + 6));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("numberOfRedirects"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)report + 3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, CFSTR("error"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)report + 4));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, CFSTR("underlyingError"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *((_QWORD *)report + 5));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, CFSTR("underlyingErrorDomain"));

    v16 = report[24] - 1;
    if (v16 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), report[24]);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E14FA630[v16];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, CFSTR("taskType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)report + 100));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, CFSTR("isBackground"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)report + 101));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v20, CFSTR("usedUnifiedStack"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)report + 102));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v21, CFSTR("apSleepWakeMonitored"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)report + 103));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v22, CFSTR("resumableUploadSupported"));

    if (*((_QWORD *)report + 7))
    {
      v23 = *((_QWORD *)report + 22) - 1;
      if (v23 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), *((_QWORD *)report + 22));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = off_1E14FA660[v23];
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v24, CFSTR("schedulingTier"));

    }
    v66 = v4;
    v67 = self;
    v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (*((_QWORD *)report + 7))
    {
      v80 = 0;
      v25 = report + 55;
      do
      {
        v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v27 = *(_QWORD *)(v25 - 29);
        v28 = *(_QWORD *)(v25 - 27);
        v29 = *(_QWORD *)(v25 - 25);
        v30 = *(_QWORD *)(v25 - 23);
        v78 = *(_QWORD *)(v25 - 19);
        v79 = *(_QWORD *)(v25 - 21);
        v31 = *(_QWORD *)(v25 - 13);
        v32 = *(v25 - 7);
        v33 = *((_BYTE *)v25 - 24);
        v34 = *((_BYTE *)v25 - 23);
        v76 = *((_BYTE *)v25 - 21);
        v77 = *((_BYTE *)v25 - 22);
        v74 = *(_QWORD *)(v25 - 5);
        v75 = *(_QWORD *)(v25 - 9);
        v73 = *(_QWORD *)(v25 - 3);
        v72 = *((_BYTE *)v25 - 4);
        v71 = *((unsigned __int8 *)v25 - 3);
        v70 = *v25;
        if ((v32 - 1) >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v32);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = off_1E14FA688[(v32 - 1)];
        }
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, CFSTR("networkProtocolName"));

        if (v31 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), v31);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E14FA6B0[v31];
        }
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v36, CFSTR("networkLoadType"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v33 & 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, CFSTR("reusedConnection"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v34 & 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, CFSTR("isRedirected"));

        if (v27 < v81 || v27 == 0)
          v40 = 0;
        else
          v40 = v27 - v81;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v41, CFSTR("requestStart"));

        if (v28 < v81 || v28 == 0)
          v43 = 0;
        else
          v43 = v28 - v81;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v44, CFSTR("requestEnd"));

        if (v29 < v81 || v29 == 0)
          v46 = 0;
        else
          v46 = v29 - v81;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v47, CFSTR("responseStart"));

        if (v30 < v81 || v30 == 0)
          v49 = 0;
        else
          v49 = v30 - v81;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v50, CFSTR("responseEnd"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v79);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v51, CFSTR("totalBytesWritten"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v78);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v52, CFSTR("totalBytesRead"));

        -[__NSURLSessionStatistics externallyVisibleConnectionUUIDs](v67, "externallyVisibleConnectionUUIDs");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectAtIndexedSubscript:", v80);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          objc_msgSend(v54, "UUIDString");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v55, CFSTR("connectionUUID"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v77 & 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v56, CFSTR("apsRelayAttempted"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v76 & 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v57, CFSTR("apsRelaySucceeded"));

        if ((unint64_t)(v75 - 1) >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), v75);
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v58 = off_1E14FA6D0[v75 - 1];
        }
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v58, CFSTR("http3Status"));

        if ((unint64_t)(v74 - 1) >= 0xD)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), v74);
          v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v59 = off_1E14FA6F8[v74 - 1];
        }
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v59, CFSTR("httpServerType"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v73);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v60, CFSTR("reusedAfterTime"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v72 & 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v61, CFSTR("reusedAfterSleepWake"));

        if (v71 >= 0xB)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), v71);
          v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v62 = off_1E14FA760[v71];
        }
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v62, CFSTR("httpMethod"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v70);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v63, CFSTR("statusCode"));

        objc_msgSend(v68, "addObject:", v26);
        v25 += 30;
        ++v80;
      }
      while (*((_QWORD *)report + 7) > v80);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v66, "setObject:forKeyedSubscript:", v68, CFSTR("transactionMetrics"));
    v64 = v67->_dictionaryReport;
    v67->_dictionaryReport = v66;

    dictionaryReport = v67->_dictionaryReport;
    goto LABEL_63;
  }
  v18 = 0;
  return v18;
}

- (NSUUID)externallyVisibleNwActivity
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExternallyVisibleNwActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)externallyVisibleConnectionUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExternallyVisibleConnectionUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externallyVisibleConnectionUUIDs, 0);
  objc_storeStrong((id *)&self->_externallyVisibleNwActivity, 0);
  objc_storeStrong((id *)&self->_dictionaryReport, 0);
}

+ (CFNetworkTaskMetrics_s)createCFNetworkTaskMetrics_s:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  CFNetworkTaskMetrics_s *v6;
  void *v7;
  double v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t *i;
  id v30;
  const char *v31;
  id Property;
  const char *v33;
  void *v34;
  id v35;
  int v36;
  const char *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  double v41;
  BOOL *p_var11;
  _QWORD *v43;
  unint64_t v44;
  SEL v45;
  id v46;
  const char *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  const char *v57;
  _BYTE *v58;
  BOOL v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  id v66;
  int v67;
  uint64_t v68;
  unint64_t *p_var6;
  void *v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;

  v3 = a3;
  objc_msgSend(v3, "_metrics");
  v4 = objc_claimAutoreleasedReturnValue();
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__9397;
  v80 = __Block_byref_object_dispose__9398;
  v81 = 0;
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __57____NSURLSessionStatistics_createCFNetworkTaskMetrics_s___block_invoke;
  v73[3] = &unk_1E14FB1A8;
  v5 = v3;
  v74 = v5;
  v75 = &v76;
  -[__CFN_TaskMetrics lockTransactionMetrics:](v4, v73);
  v72 = (void *)v4;
  v6 = (CFNetworkTaskMetrics_s *)malloc_type_calloc(1uLL, 120 * objc_msgSend((id)v77[5], "count") + 104, 0xFABE8F92uLL);
  v71 = v5;
  if (v6)
  {
    objc_msgSend(v5, "_uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getUUIDBytes:", v6->var9);

    if (v4)
    {
      v6->var0 = (unint64_t)(*(double *)(v4 + 56) * 1000.0);
      v8 = *(double *)(v4 + 64);
    }
    else
    {
      v6->var0 = 0;
      v8 = 0.0;
    }
    v6->var1 = (unint64_t)(v8 * 1000.0);
    v9 = v5;
    objc_opt_self();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = 3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = 4;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = 5;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v10 = 6;
            else
              v10 = 1;
          }
        }
      }
    }

    v6->var10 = v10;
    objc_msgSend(v9, "session");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = CFEqual((CFTypeRef)objc_msgSend(*(id *)(v11 + 112), "disposition"), &unk_1EDD00610) != 0;
    else
      v13 = 0;
    v6->var11 = v13;

    v6->var12 = 0;
    objc_msgSend(v9, "session");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = objc_msgSend(*(id *)(v14 + 112), "_disableAPWakeOnIdleConnections");
    else
      v16 = 0;
    v6->var13 = v16;

    if (v4)
      v17 = *(_BYTE *)(v4 + 12) != 0;
    else
      v17 = 0;
    v6->var14 = v17;
    objc_msgSend(v9, "_private_nw_activity", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v9, "_private_nw_activity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      nw_activity_get_token();

    }
    v6->var7 = objc_msgSend((id)v77[5], "count");
    objc_msgSend(v9, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v9, "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v6->var3 = objc_msgSend(v21, "code");

      objc_msgSend(v9, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("_kCFStreamErrorCodeKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6->var4 = objc_msgSend(v24, "integerValue");

      objc_msgSend(v9, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "userInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("_kCFStreamErrorDomainKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v6->var5 = objc_msgSend(v27, "integerValue");

    }
    v28 = 0;
    for (i = &v6->var15[0].var1; objc_msgSend((id)v77[5], "count") > v28; i += 15)
    {
      objc_msgSend((id)v77[5], "objectAtIndexedSubscript:", v28);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      if (v30)
      {
        Property = objc_getProperty(v30, v31, 88, 1);
        v34 = Property;
        if (Property)
          Property = objc_getProperty(Property, v33, 160, 1);
      }
      else
      {
        v34 = 0;
        Property = 0;
      }
      v35 = Property;
      objc_opt_self();
      if (v35)
      {
        if ((objc_msgSend(v35, "isEqualToString:", CFSTR("http/1.1")) & 1) != 0)
        {
          v36 = 3;
        }
        else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("h2")) & 1) != 0)
        {
          v36 = 4;
        }
        else if (objc_msgSend(v35, "isEqualToString:", CFSTR("h3")))
        {
          v36 = 5;
        }
        else
        {
          v36 = 1;
        }
      }
      else
      {
        v36 = 1;
      }

      *((_DWORD *)i + 20) = v36;
      if (v30)
      {
        if (*((_BYTE *)v30 + 8))
        {
          v38 = 1;
          if (*((_BYTE *)v30 + 10))
            v38 = 2;
          i[7] = v38;
        }
        else
        {
          v39 = *((id *)v30 + 9);
          v40 = 3;
          if (!v39)
            v40 = 0;
          i[7] = v40;

        }
        i[8] = *((_QWORD *)v30 + 27);
        v41 = *((double *)v30 + 22);
        p_var11 = &v6->var15[v28].var11;
        *((_BYTE *)i + 84) = *((_BYTE *)v30 + 9) ^ 1;
        *((_BYTE *)i + 85) = *((_QWORD *)v30 + 26) == 2;
        *(i - 1) = (unint64_t)(v41 * 1000.0);
        *i = (unint64_t)(*((double *)v30 + 23) * 1000.0);
        i[1] = (unint64_t)(*((double *)v30 + 24) * 1000.0);
        i[2] = (unint64_t)(*((double *)v30 + 25) * 1000.0);
        i[3] = *((_QWORD *)v30 + 14) + *((_QWORD *)v30 + 12);
        i[4] = *((_QWORD *)v30 + 17) + *((_QWORD *)v30 + 15);
        *((_BYTE *)i + 86) = *((_BYTE *)v30 + 11);
        *((_BYTE *)i + 87) = *((_BYTE *)v30 + 12);
        v43 = objc_getProperty(v30, v37, 88, 1);
        if (v43)
          v44 = v43[16];
        else
          v44 = 0;
        i[9] = v44;

        v46 = objc_getProperty(v30, v45, 88, 1);
        v48 = v46;
        if (v46)
          v46 = objc_getProperty(v46, v47, 64, 1);
      }
      else
      {
        i[7] = 0;
        *((_DWORD *)i + 21) = 1;
        p_var11 = (BOOL *)i + 84;
        i[8] = 0;
        *(_OWORD *)(i - 1) = 0u;
        *(_OWORD *)(i + 1) = 0u;
        *(_OWORD *)(i + 3) = 0u;
        i[9] = 0;
        v48 = 0;
        v46 = 0;
      }
      v49 = v46;
      objc_msgSend(v49, "getUUIDBytes:", i + 5);

      if (v30)
        v50 = (void *)*((_QWORD *)v30 + 10);
      else
        v50 = 0;
      v51 = v50;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v53 = 1;
        goto LABEL_80;
      }
      objc_msgSend(v51, "valueForHTTPHeaderField:", CFSTR("x-akam-sw-version"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v53 = 6;
      }
      else
      {
        objc_msgSend(v51, "valueForHTTPHeaderField:", CFSTR("x-fb-debug"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v52)
        {
          objc_msgSend(v51, "valueForHTTPHeaderField:", CFSTR("via"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v54;
          if (v54 && objc_msgSend(v54, "rangeOfString:options:", CFSTR("CloudFront"), 1) != 0x7FFFFFFFFFFFFFFFLL)
          {
            v53 = 5;
            goto LABEL_79;
          }
          objc_msgSend(v51, "valueForHTTPHeaderField:", CFSTR("server"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v55;
          if (v55)
          {
            if (objc_msgSend(v55, "rangeOfString:options:", CFSTR("gws"), 1) == 0x7FFFFFFFFFFFFFFFLL
              && objc_msgSend(v56, "rangeOfString:options:", CFSTR("GSE"), 1) == 0x7FFFFFFFFFFFFFFFLL
              && objc_msgSend(v56, "rangeOfString:options:", CFSTR("ESF"), 1) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend(v56, "rangeOfString:options:", CFSTR("cloudflare"), 1) == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (objc_msgSend(v56, "rangeOfString:options:", CFSTR("ApacheTrafficServer"), 1) == 0x7FFFFFFFFFFFFFFFLL
                  && objc_msgSend(v56, "rangeOfString:options:", CFSTR("ATS"), 1) == 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (objc_msgSend(v56, "rangeOfString:options:", CFSTR("apache"), 1) == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (objc_msgSend(v56, "rangeOfString:options:", CFSTR("nginx"), 1) == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      if (objc_msgSend(v56, "rangeOfString:options:", CFSTR("LiteSpeed"), 1) == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        if (objc_msgSend(v56, "rangeOfString:options:", CFSTR("lighttpd"), 1) == 0x7FFFFFFFFFFFFFFFLL)
                        {
                          if (objc_msgSend(v56, "rangeOfString:options:", CFSTR("nghttpx"), 1) == 0x7FFFFFFFFFFFFFFFLL)
                            goto LABEL_73;
                          v53 = 12;
                        }
                        else
                        {
                          v53 = 11;
                        }
                      }
                      else
                      {
                        v53 = 10;
                      }
                    }
                    else
                    {
                      v53 = 9;
                    }
                  }
                  else
                  {
                    v53 = 8;
                  }
                }
                else
                {
                  v53 = 7;
                }
              }
              else
              {
                v53 = 4;
              }
            }
            else
            {
              v53 = 2;
            }
          }
          else
          {
LABEL_73:
            if (v52 && objc_msgSend(v52, "rangeOfString:options:", CFSTR("varnish"), 1) != 0x7FFFFFFFFFFFFFFFLL)
              v53 = 13;
            else
              v53 = 1;
          }

          goto LABEL_79;
        }
        v53 = 3;
      }
LABEL_79:

LABEL_80:
      i[11] = v53;

      if (*p_var11)
      {
        if (v30)
        {
          i[12] = (unint64_t)(*((double *)v30 + 29) * 1000.0);
          v58 = objc_getProperty(v30, v57, 88, 1);
          if (v58)
          {
            v59 = v58[21] != 0;
            goto LABEL_84;
          }
        }
        else
        {
          i[12] = 0;
          v58 = 0;
        }
        v59 = 0;
LABEL_84:
        *((_BYTE *)i + 104) = v59;

        if (v30)
          goto LABEL_85;
        goto LABEL_99;
      }
      i[12] = 0;
      *((_BYTE *)i + 104) = 0;
      if (v30)
      {
LABEL_85:
        v60 = (void *)*((_QWORD *)v30 + 7);
        goto LABEL_86;
      }
LABEL_99:
      v60 = 0;
LABEL_86:
      v61 = v60;
      objc_msgSend(v61, "HTTPMethod");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v62)
      {
        if (objc_msgSend(v62, "caseInsensitiveCompare:", CFSTR("GET")))
        {
          if (objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("HEAD")))
          {
            if (objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("POST")))
            {
              if (objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("PUT")))
              {
                if (objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("DELETE")))
                {
                  if (objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("CONNECT")))
                  {
                    if (objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("OPTIONS")))
                    {
                      if (objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("TRACE")))
                      {
                        if (objc_msgSend(v63, "caseInsensitiveCompare:", CFSTR("PATCH")))
                          v64 = 1;
                        else
                          v64 = 10;
                      }
                      else
                      {
                        v64 = 9;
                      }
                    }
                    else
                    {
                      v64 = 8;
                    }
                  }
                  else
                  {
                    v64 = 7;
                  }
                }
                else
                {
                  v64 = 6;
                }
              }
              else
              {
                v64 = 5;
              }
            }
            else
            {
              v64 = 4;
            }
          }
          else
          {
            v64 = 3;
          }
        }
        else
        {
          v64 = 2;
        }
      }
      else
      {
        v64 = 0;
      }

      *((_BYTE *)i + 105) = v64;
      if (v30)
        v65 = (void *)*((_QWORD *)v30 + 10);
      else
        v65 = 0;
      v66 = v65;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v67 = objc_msgSend(v66, "statusCode");
      else
        v67 = 0;

      *((_DWORD *)i + 27) = v67;
      if (v30)
      {
        v68 = *((_QWORD *)v30 + 26);
        p_var6 = &v6->var6;
        if (v68 != 2)
        {
          if (v68 != 1025)
            goto LABEL_119;
          p_var6 = &v6->var2;
        }
        ++*p_var6;
      }
LABEL_119:

      ++v28;
    }
  }

  _Block_object_dispose(&v76, 8);
  return v6;
}

@end
