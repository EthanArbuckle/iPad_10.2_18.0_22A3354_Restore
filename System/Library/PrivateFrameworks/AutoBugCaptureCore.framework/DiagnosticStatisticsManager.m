@implementation DiagnosticStatisticsManager

- (DiagnosticStatisticsManager)initWithWorkspace:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  DiagnosticStatisticsManager *v9;
  DiagnosticStatisticsManager *v10;
  DiagnosticCaseUsageAnalytics *v11;
  DiagnosticCaseUsageAnalytics *caseUsageSpace;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DiagnosticStatisticsManager;
  v9 = -[DiagnosticStatisticsManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_workspace, a3);
    v11 = -[DiagnosticCaseUsageAnalytics initWithWorkspace:withCache:]([DiagnosticCaseUsageAnalytics alloc], "initWithWorkspace:withCache:", v7, 0);
    caseUsageSpace = v10->_caseUsageSpace;
    v10->_caseUsageSpace = v11;

  }
  return v10;
}

- (void)_checkFileWritingLimits:(id)a3
{
  id v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  double v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  _QWORD v25[5];
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[4];
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "dampeningType"))
  {
    *(_QWORD *)buf = 0;
    v27 = buf;
    v28 = 0x2020000000;
    v29 = 0;
    objc_msgSend(v4, "caseOpenedTime");
    if (v5 > 100000000.0)
    {
      objc_msgSend(v4, "caseOpenedTime");
      v8 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSince1970");
      v8 = v7;

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(86400 * ((unint64_t)v8 / 0x15180)));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticStatisticsManager _retrieveDiagnosticCaseUsageForDomain:type:subType:process:onOrAfter:create:](self, "_retrieveDiagnosticCaseUsageForDomain:type:subType:process:onOrAfter:create:", CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    casemanagementLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_msgSend(v12, "count");
      *(_DWORD *)v30 = 134218242;
      v31 = v14;
      v32 = 2112;
      v33 = (unint64_t)v11;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Found %ld case usages since %@", v30, 0x16u);
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __55__DiagnosticStatisticsManager__checkFileWritingLimits___block_invoke;
    v25[3] = &unk_1EA3B5238;
    v25[4] = buf;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configurationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "dampenedIPSLimit");

    v18 = *((_QWORD *)v27 + 3);
    if (v18 > v17)
    {
      casemanagementLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v24 = *((_QWORD *)v27 + 3);
        *(_DWORD *)v30 = 134218240;
        v31 = v24;
        v32 = 2048;
        v33 = v17;
        v21 = "Surpassed limit for dampened cases. Will not write out ips file. (%ld > %ld)";
        v22 = v19;
        v23 = OS_LOG_TYPE_INFO;
        goto LABEL_15;
      }
    }
    else
    {
      casemanagementLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = *((_QWORD *)v27 + 3);
        *(_DWORD *)v30 = 134218240;
        v31 = v20;
        v32 = 2048;
        v33 = v17;
        v21 = "Still under limit for dampened cases. Allowing write out of ips file. (%ld <= %ld)";
        v22 = v19;
        v23 = OS_LOG_TYPE_DEBUG;
LABEL_15:
        _os_log_impl(&dword_1DBAE1000, v22, v23, v21, v30, 0x16u);
      }
    }

    objc_msgSend(v4, "allowIPSFileOutput:", v18 <= v17);
    _Block_object_dispose(buf, 8);
    goto LABEL_17;
  }
  casemanagementLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEBUG, "Case accepted. Allowing write out of ips file by default.", buf, 2u);
  }

LABEL_17:
}

void __55__DiagnosticStatisticsManager__checkFileWritingLimits___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (int)objc_msgSend(v3, "casesSeen");
  v5 = objc_msgSend(v3, "casesAccepted");
  v6 = v4 - v5;
  casemanagementLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = v5;
    objc_msgSend(v3, "lastSeen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218754;
    v11 = v4;
    v12 = 2048;
    v13 = v8;
    v14 = 2048;
    v15 = v6;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_DEBUG, "  Total cases: %ld, cases accepted: %ld, cases dampened: %ld (last seen: %@)", (uint8_t *)&v10, 0x2Au);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6;

}

- (void)updateCaseStatisticsWith:(id)a3
{
  id v4;

  v4 = a3;
  -[DiagnosticStatisticsManager _updateCaseStatisticsWith:](self, "_updateCaseStatisticsWith:", v4);
  -[DiagnosticStatisticsManager _updateDailyCaseStatisticsWith:](self, "_updateDailyCaseStatisticsWith:", v4);

}

- (void)getDiagnosticCaseUsageStatistics:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DiagnosticStatisticsManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__DiagnosticStatisticsManager_getDiagnosticCaseUsageStatistics___block_invoke;
  v7[3] = &unk_1EA3B4988;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__DiagnosticStatisticsManager_getDiagnosticCaseUsageStatistics___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("lastSeen"), 0);
    v26 = a1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchEntitiesFreeForm:sortDesc:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v2;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v30)
    {
      v28 = *(_QWORD *)v48;
      v4 = CFSTR("N/A");
      v5 = 0x1E0CB3000uLL;
      v29 = v3;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v48 != v28)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v8 = (void *)MEMORY[0x1E0C99D80];
          objc_msgSend(v7, "domain");
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v7, "domain");
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v41 = v36;
          }
          else
          {
            v41 = CFSTR("N/A");
          }
          objc_msgSend(v7, "type");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v7, "type");
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v40 = v35;
          }
          else
          {
            v40 = CFSTR("N/A");
          }
          objc_msgSend(v7, "subtype");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v7, "subtype");
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v38 = v34;
          }
          else
          {
            v38 = CFSTR("N/A");
          }
          objc_msgSend(v7, "process");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v8;
          if (v42)
          {
            objc_msgSend(v7, "process");
            v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v37 = v33;
          }
          else
          {
            v37 = CFSTR("N/A");
          }
          objc_msgSend(*(id *)(v5 + 2024), "numberWithInteger:", (int)objc_msgSend(v7, "casesSeen"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "lastSeen");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)v11;
          if (v12)
          {
            objc_msgSend(v7, "lastSeen");
            v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            v32 = (__CFString *)v13;
          }
          else
          {
            v13 = CFSTR("N/A");
          }
          objc_msgSend(*(id *)(v5 + 2024), "numberWithInteger:", (int)objc_msgSend(v7, "casesAccepted"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "lastAccepted");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)v10;
          v46 = (void *)v9;
          if (v15)
          {
            objc_msgSend(v7, "lastAccepted");
            v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            v31 = (__CFString *)v4;
          }
          v16 = *(void **)(v5 + 2024);
          objc_msgSend(v7, "interarrival_mean");
          objc_msgSend(v16, "numberWithDouble:");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v5;
          v19 = (void *)v17;
          v20 = v18;
          v21 = *(void **)(v18 + 2024);
          objc_msgSend(v7, "interarrival_var");
          objc_msgSend(v21, "numberWithDouble:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v41, CFSTR("domain"), v40, CFSTR("type"), v38, CFSTR("subtype"), v37, CFSTR("detected"), v39, CFSTR("casesSeen"), v13, CFSTR("lastSeen"), v14, CFSTR("casesAccepted"), v4, CFSTR("lastAccepted"), v19,
            CFSTR("interArrivalMean"),
            v22,
            CFSTR("interArrivalVariance"),
            0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          v4 = CFSTR("N/A");
          if (v12)

          v3 = v29;
          v5 = v20;
          if (v42)

          if (v44)
          if (v45)

          if (v46)
          objc_msgSend(v29, "addObject:", v23);

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v30);
    }

    v24 = *(_QWORD *)(v26 + 40);
    if (v24)
      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v3);

  }
}

- (void)_updateCaseStatisticsWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "caseOpenedTime");
  objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "caseDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caseType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caseSubType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caseDetectedProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticStatisticsManager _updateDiagnosticCaseUsageForDomain:type:subType:process:lastSeen:dampeningType:](self, "_updateDiagnosticCaseUsageForDomain:type:subType:process:lastSeen:dampeningType:", v7, v8, v9, v10, v6, objc_msgSend(v4, "dampeningType") != 0);

  }
  else
  {
    casemanagementLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_ERROR, "DiagnosticCase has no timeStamp!", v12, 2u);
    }

  }
}

- (void)_updateDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6 lastSeen:(id)a7 dampeningType:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  -[DiagnosticStatisticsManager _retrieveDiagnosticCaseUsageForDomain:type:subType:process:](self, "_retrieveDiagnosticCaseUsageForDomain:type:subType:process:", v14, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 1)
  {
    objc_msgSend(v19, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      v30 = a8;
      casemanagementLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = (uint64_t)v21;
        _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_INFO, "Updating DiagCaseUsage: %@", buf, 0xCu);
      }

      -[NSObject lastSeen](v21, "lastSeen");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSObject casesSeen](v21, "casesSeen");
      -[NSObject setCasesSeen:](v21, "setCasesSeen:", (v23 + 1));
      -[NSObject setLastSeen:](v21, "setLastSeen:", v18);
      -[NSObject interarrival_mean](v21, "interarrival_mean");
      if (v23 >= 1)
      {
        v25 = v24;
        objc_msgSend(v18, "timeIntervalSinceDate:", v31);
        v27 = v26;
        +[MathUtility computeNewMeanFromValue:currentMean:currentCount:](MathUtility, "computeNewMeanFromValue:currentMean:currentCount:", (v23 - 1));
        -[NSObject setInterarrival_mean:](v21, "setInterarrival_mean:");
        if (v23 != 1)
        {
          -[NSObject interarrival_var](v21, "interarrival_var");
          +[MathUtility computeNewVarianceFromValue:currentMean:currentCount:currentVariance:](MathUtility, "computeNewVarianceFromValue:currentMean:currentCount:currentVariance:", (v23 - 1), v27, v25, v28);
          -[NSObject setInterarrival_var:](v21, "setInterarrival_var:");
        }
      }
      if (!v30)
      {
        -[NSObject setCasesAccepted:](v21, "setCasesAccepted:", -[NSObject casesAccepted](v21, "casesAccepted") + 1);
        -[NSObject setLastAccepted:](v21, "setLastAccepted:", v18);
      }
      -[ObjectAnalytics save](self->_caseUsageSpace, "save");

      goto LABEL_16;
    }
  }
  else
  {
    casemanagementLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219010;
      v33 = objc_msgSend(v19, "count");
      v34 = 2112;
      v35 = v14;
      v36 = 2112;
      v37 = v15;
      v38 = 2112;
      v39 = v16;
      v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1DBAE1000, v29, OS_LOG_TYPE_INFO, "Found %ld DiagCaseUsage objects that matched with (%@, %@, %@, %@)", buf, 0x34u);
    }

  }
  casemanagementLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, "DiagnosticCaseUsage is nil.", buf, 2u);
  }
LABEL_16:

}

- (void)_updateDailyCaseStatisticsWith:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t, _BYTE *);
  void *v29;
  NSObject *v30;
  __int128 *p_buf;
  uint8_t v32[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int128 buf;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "caseOpenedTime");
  v6 = v5;
  if (v5 >= 100000000.0)
  {
    v9 = objc_msgSend(v4, "dampeningType");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(86400 * ((unint64_t)v6 / 0x15180)));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy_;
    v39 = __Block_byref_object_dispose_;
    v40 = 0;
    -[DiagnosticStatisticsManager _retrieveDiagnosticCaseUsageForDomain:type:subType:process:onOrAfter:create:](self, "_retrieveDiagnosticCaseUsageForDomain:type:subType:process:onOrAfter:create:", CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    casemanagementLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v32 = 134218242;
      v33 = objc_msgSend(v12, "count");
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_DEBUG, "Found %ld case usages on or later than %@", v32, 0x16u);
    }

    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __62__DiagnosticStatisticsManager__updateDailyCaseStatisticsWith___block_invoke;
    v29 = &unk_1EA3B5260;
    v7 = v10;
    v30 = v7;
    p_buf = &buf;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v26);
    v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v14)
      goto LABEL_10;
    casemanagementLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138412290;
      v33 = (uint64_t)v7;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_DEFAULT, "Creating a new aggregated DiagnosticCaseUsage for cases on GMT date %@.", v32, 0xCu);
    }

    v16 = -[DiagnosticStatisticsManager _createDiagnosticCaseUsageForDomain:type:subType:process:](self, "_createDiagnosticCaseUsageForDomain:type:subType:process:", CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), v26, v27, v28, v29);
    v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v16;

    v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    if (v14)
    {
LABEL_10:
      objc_msgSend(v14, "lastSeen", v26, v27, v28, v29);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "casesSeen");
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setCasesSeen:", (v19 + 1));
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setLastSeen:", v11);
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "interarrival_mean");
      if (v19 >= 1)
      {
        v21 = v20;
        objc_msgSend(v11, "timeIntervalSinceDate:", v18);
        v23 = v22;
        +[MathUtility computeNewMeanFromValue:currentMean:currentCount:](MathUtility, "computeNewMeanFromValue:currentMean:currentCount:", (v19 - 1));
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setInterarrival_mean:");
        if (v19 >= 2)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "interarrival_var");
          +[MathUtility computeNewVarianceFromValue:currentMean:currentCount:currentVariance:](MathUtility, "computeNewVarianceFromValue:currentMean:currentCount:currentVariance:", (v19 - 1), v23, v21, v24);
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setInterarrival_var:");
        }
      }
      if (!v9)
      {
        v25 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "casesAccepted");
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setCasesAccepted:", (v25 + 1));
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "setLastAccepted:", v11);
      }
      -[ObjectAnalytics save](self->_caseUsageSpace, "save");
    }
    else
    {
      casemanagementLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 138412290;
        v33 = (uint64_t)v7;
        _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "Aggregated DiagnosticCaseUsage for case on GMT date %@ is nil.", v32, 0xCu);
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    casemanagementLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "caseOpenedTime");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_ERROR, "DiagnosticCase has an invalid timeStamp! (%.0lf)", (uint8_t *)&buf, 0xCu);
    }
  }

}

void __62__DiagnosticStatisticsManager__updateDailyCaseStatisticsWith___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  void *v12;
  double v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v7, "lastSeen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = (unint64_t)v10;
  objc_msgSend(v7, "lastSeen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  objc_msgSend(v8, "dateWithTimeIntervalSince1970:", (double)(v11 + 86400 * ((unint64_t)v13 / 0x15180) - (unint64_t)v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToDate:", v14))
  {
    casemanagementLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "Found aggregated DiagnosticCaseUsage for cases on GMT date %@.", (uint8_t *)&v17, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_retrieveDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6
{
  return -[DiagnosticStatisticsManager _retrieveDiagnosticCaseUsageForDomain:type:subType:process:onOrAfter:create:](self, "_retrieveDiagnosticCaseUsageForDomain:type:subType:process:onOrAfter:create:", a3, a4, a5, a6, 0, 1);
}

- (id)_retrieveDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6 onOrAfter:(id)a7 create:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  _BOOL4 v33;
  id v34;
  DiagnosticStatisticsManager *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v8 = a8;
  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(v14, "length") && objc_msgSend(v15, "length"))
  {
    v33 = v8;
    v35 = self;
    v19 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@ AND %K == %@"), CFSTR("domain"), v14, CFSTR("type"), v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithObjects:", v20, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("subtype"), v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v21, "addObject:", v22);

    }
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("process"), v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v21, "addObject:", v23);

    }
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("lastSeen"), v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v21, "addObject:", v24);

    }
    v34 = v18;
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("lastSeen"), 0);
    -[ObjectAnalytics fetchEntitiesFreeForm:sortDesc:](v35->_caseUsageSpace, "fetchEntitiesFreeForm:sortDesc:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "count") || !v33)
    {
      v31 = v27;
    }
    else
    {
      casemanagementLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v37 = v14;
        v38 = 2112;
        v39 = v15;
        v40 = 2112;
        v41 = v16;
        v42 = 2112;
        v43 = v17;
        _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_INFO, "Creating a new DiagnosticCaseUsage with domain %@, type %@, subtype %@, process %@.", buf, 0x2Au);
      }

      v29 = (void *)MEMORY[0x1E0C99D20];
      v30 = -[DiagnosticStatisticsManager _createDiagnosticCaseUsageForDomain:type:subType:process:](v35, "_createDiagnosticCaseUsageForDomain:type:subType:process:", v14, v15, v16, v17);
      objc_msgSend(v29, "arrayWithObject:", v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = v34;
  }
  else
  {
    casemanagementLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_ERROR, "Domain and Type are required", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (id)_createDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[ObjectAnalytics createEntity](self->_caseUsageSpace, "createEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setDomain:", v10);
    objc_msgSend(v15, "setType:", v11);
    objc_msgSend(v15, "setSubtype:", v12);
    objc_msgSend(v15, "setProcess:", v13);
  }

  return v15;
}

- (double)_calculateAverageCasesPerDayFromDailyAggregatedStatistics
{
  void *v3;
  double v4;
  unint64_t v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = (unint64_t)v4;
  objc_msgSend(v3, "timeIntervalSince1970");
  v7 = (double)(v5 + 86400 * ((unint64_t)v6 / 0x15180) - (unint64_t)v6);
  -[DiagnosticStatisticsManager _retrieveDiagnosticCaseUsageForDomain:type:subType:process:onOrAfter:create:](self, "_retrieveDiagnosticCaseUsageForDomain:type:subType:process:onOrAfter:create:", CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), CFSTR("DAILY_AGGREGATE"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__DiagnosticStatisticsManager__calculateAverageCasesPerDayFromDailyAggregatedStatistics__block_invoke;
  v12[3] = &unk_1EA3B5288;
  *(double *)&v12[6] = v7;
  v12[4] = &v17;
  v12[5] = &v13;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  v9 = v14[3];
  if (v9 < 1)
    v10 = 0.0;
  else
    v10 = (double)v18[3] / (double)v9;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __88__DiagnosticStatisticsManager__calculateAverageCasesPerDayFromDailyAggregatedStatistics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "lastSeen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = (unint64_t)v5;
  objc_msgSend(v3, "lastSeen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = (double)(v6 + 86400 * ((unint64_t)v8 / 0x15180) - (unint64_t)v8);

  if (*(double *)(a1 + 48) != v9)
  {
    casemanagementLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 1024;
      v15 = objc_msgSend(v3, "casesSeen");
      _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_DEFAULT, "Daily aggregated case usage on %@ has %d cases", (uint8_t *)&v12, 0x12u);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += (int)objc_msgSend(v3, "casesSeen");
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (int64_t)_removeDiagnosticCaseUsageMatchingDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  NSObject *v21;
  uint8_t buf[4];
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("domain"), a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("type"), v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("subtype"), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("process"), v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v18);

  }
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ObjectAnalytics removeEntitiesMatching:](self->_caseUsageSpace, "removeEntitiesMatching:", v19);
  if (v20)
  {
    casemanagementLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v20;
      _os_log_impl(&dword_1DBAE1000, v21, OS_LOG_TYPE_INFO, "Removed %ld DiagnosticCaseUsage.", buf, 0xCu);
    }

  }
  return v20;
}

- (int64_t)_removeAllDiagnosticCaseUsageFor:(id)a3
{
  return -[ObjectAnalytics removeEntitiesMatching:](self->_caseUsageSpace, "removeEntitiesMatching:", a3);
}

- (void)resetDiagnosticCaseUsage
{
  NSObject *v3;
  _QWORD block[5];

  -[DiagnosticStatisticsManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__DiagnosticStatisticsManager_resetDiagnosticCaseUsage__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __55__DiagnosticStatisticsManager_resetDiagnosticCaseUsage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Resetting DiagnosticCaseUsage", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_removeAllDiagnosticCaseUsageFor:", 0);
}

- (void)cleanupDiagnosticCaseUsage
{
  NSObject *v3;
  _QWORD block[5];

  -[DiagnosticStatisticsManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__DiagnosticStatisticsManager_cleanupDiagnosticCaseUsage__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(v3, block);

}

void __57__DiagnosticStatisticsManager_cleanupDiagnosticCaseUsage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  casemanagementLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v2, OS_LOG_TYPE_INFO, "Purging old DiagnosticCaseUsage objects.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -1209600.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("lastSeen"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeEntitiesMatching:", v5);
  casemanagementLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v9 = v6;
    v10 = 1024;
    v11 = 14;
    _os_log_impl(&dword_1DBAE1000, v7, OS_LOG_TYPE_INFO, "Purged %ld DiagnosticCaseUsage object(s) with lastSeen older than %d days.", buf, 0x12u);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseUsageSpace, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
