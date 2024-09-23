@implementation ATXInspectionServer

void __38___ATXInspectionServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_43;
  sharedInstance__pasExprOnceResult_43 = v1;

  objc_autoreleasePoolPop(v0);
}

void __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_14()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_14_cold_1();

}

uint64_t __55___ATXInspectionServer_appHistoryActionWithUUID_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  objc_msgSend(v4, "description");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if ((ATXDetailedActionLoggingEnabled() & 1) == 0)
  {
    v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "mutableCopy");
    objc_msgSend(v4, "actionTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR("actionTitle: %@\n"), v11);

    objc_msgSend(v4, "actionSubtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR("actionSubtitle: %@\n"), v12);

    objc_msgSend(v4, "actionDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR("actionDescription: %@\n"), v13);

    v14 = objc_msgSend(v10, "copy");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  return 0;
}

void __99___ATXInspectionServer_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __99___ATXInspectionServer_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke_cold_1((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Successfully donated INIntent!", v6, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48___ATXInspectionServer_createAppPredictionLogs___block_invoke(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_99(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Successfully generated app prediction logs", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_100(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB28A8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Requesting app prediction logs timed out");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 666, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);

}

uint64_t __38___ATXInspectionServer_getActionLogs___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, void *a8, double a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14)
{
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[13];
  _QWORD v70[13];
  _BYTE v71[128];
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v20 = a3;
  v64 = a4;
  v63 = a7;
  v62 = a8;
  v61 = a11;
  v58 = a12;
  v69[0] = CFSTR("action");
  v60 = v19;
  objc_msgSend(v19, "json");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v57;
  v69[1] = CFSTR("slotSets");
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_opt_new();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v25 = v21;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v66 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "parameters");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "sortedArrayUsingDescriptors:", v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v24, "addObject:", v31);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v32);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v27);
  }

  v33 = objc_msgSend(v24, "copy");
  v56 = (void *)v33;
  v70[1] = v33;
  v69[2] = CFSTR("date");
  v34 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v64, "timeIntervalSinceReferenceDate");
  objc_msgSend(v34, "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v51;
  v69[3] = CFSTR("timeOfDay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v53;
  v69[4] = CFSTR("dayOfWeek");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v55;
  v69[5] = CFSTR("prevLocationUUID");
  if (v63)
  {
    objc_msgSend(v63, "UUIDString");
    v35 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = CFSTR("No previous location");
  }
  v50 = (__CFString *)v35;
  v70[5] = v35;
  v69[6] = CFSTR("locationUUID");
  if (v62)
  {
    objc_msgSend(v62, "UUIDString");
    v36 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = CFSTR("No location");
  }
  v70[6] = v36;
  v69[7] = CFSTR("motionType");
  objc_msgSend(MEMORY[0x1E0D80E00], "getMotionStringFromMotionType:", a10, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v70[7] = v37;
  v69[8] = CFSTR("appSessionStartDate");
  if (v61)
  {
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v61, "timeIntervalSinceReferenceDate");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = CFSTR("No app session start date");
  }
  v70[8] = v39;
  v69[9] = CFSTR("appSessionEndDate");
  if (v58)
  {
    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v58, "timeIntervalSinceReferenceDate");
    objc_msgSend(v40, "numberWithDouble:");
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = CFSTR("No app session end date");
  }
  v70[9] = v41;
  v69[10] = CFSTR("weight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70[10] = v42;
  v69[11] = CFSTR("geohash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a13);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v70[11] = v43;
  v69[12] = CFSTR("coarseGeohash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a14);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v70[12] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 13);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "mutableCopy");

  if (v58)
  if (v61)

  if (v62)
  if (v63)

  if (objc_msgSend(v60, "actionType") == 1)
  {
    objc_msgSend(v60, "userActivityString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v47, CFSTR("userActivityString"));

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v46);

  return 1;
}

uint64_t __38___ATXInspectionServer_getActionLogs___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10)
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  void *v38;
  _QWORD v41[9];
  _QWORD v42[9];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a2;
  objc_msgSend(a3, "parameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingDescriptors:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = CFSTR("action");
  objc_msgSend(v18, "json");
  v23 = objc_claimAutoreleasedReturnValue();

  v37 = v23;
  v42[0] = v23;
  v41[1] = CFSTR("slotSet");
  v24 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[1] = v24;
  v41[2] = CFSTR("confirms");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a9, v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v25;
  v41[3] = CFSTR("rejects");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v26;
  v41[4] = CFSTR("geohash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v27;
  v41[5] = CFSTR("coarseGeohash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v28;
  v41[6] = CFSTR("feedbackType");
  objc_msgSend(MEMORY[0x1E0CF8C40], "actionFeedbackTypeToString:", a6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v29;
  v41[7] = CFSTR("date");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v17, "timeIntervalSince1970");
  v32 = v31;

  objc_msgSend(v30, "numberWithDouble:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v33;
  v41[8] = CFSTR("consumerSubType");
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v35);

  return 1;
}

void __43___ATXInspectionServer_histogramsInMemory___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[_ATXDataStore stringForHistogramType:](_ATXDataStore, "stringForHistogramType:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __43___ATXInspectionServer_histogramsInMemory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[_ATXDataStore stringForHistogramType:](_ATXDataStore, "stringForHistogramType:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "histogramDataForHistogramType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_ATXDataStore stringForHistogramType:](_ATXDataStore, "stringForHistogramType:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
}

void __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "categoricalHistogramDataForHistogramType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_ATXDataStore stringForHistogramType:](_ATXDataStore, "stringForHistogramType:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
}

uint64_t __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

id __49___ATXInspectionServer_histogramsInMemoryBySize___block_invoke_4(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@:%@"), v6, v8);

  return v9;
}

uint64_t __44___ATXInspectionServer_allHistogramsBySize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

id __44___ATXInspectionServer_allHistogramsBySize___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@:%@"), v6, v8);

  return v9;
}

uint64_t __48___ATXInspectionServer_updateAppDirectoryCache___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59___ATXInspectionServer_generateDataForStressTestWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59___ATXInspectionServer_clearAllDataForStressTestWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Unexpected interruption on App Prediction inspection interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59___ATXInspectionServer_listener_shouldAcceptNewConnection___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Connection invalidated on App Prediction inspection interface. Client went away.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __99___ATXInspectionServer_appIntentHistoryDonateINIntent_intentType_startDate_endDate_timeZone_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ERROR: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __48___ATXInspectionServer_createAppPredictionLogs___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "logs flushed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
