@implementation CalLocationPrediction

+ (id)predictedLocationOfInterestForEventTitle:(id)a3 eventLocation:(id)a4 calendarIdentifier:(id)a5 timeout:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(EKWeakLinkClass(CFSTR("RTRoutineManager"), 0xAuLL), "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__6;
  v44 = __Block_byref_object_dispose__6;
  v45 = 0;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__6;
  v38 = __Block_byref_object_dispose__6;
  v39 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke;
  v27[3] = &unk_1E2A84DF0;
  v15 = v10;
  v28 = v15;
  v16 = v11;
  v29 = v16;
  v17 = v12;
  v30 = v17;
  v32 = &v34;
  v33 = &v40;
  v18 = v14;
  v31 = v18;
  objc_msgSend(v13, "fetchPredictedLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:withHandler:", v15, v16, v17, v27);
  v19 = a7;
  if (dispatch_group_wait(v18, a6))
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v49 = v15;
      v50 = 2112;
      v51 = v16;
      v52 = 2112;
      v53 = v17;
      _os_log_error_impl(&dword_18FC12000, v20, OS_LOG_TYPE_ERROR, "Error fetching locations of interest for title %@, location: %@, calendar: %@: Request timed out", buf, 0x20u);
    }

    if (v19)
    {
      v46 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prediction timed out for title %@, location: %@, calendar: %@"), v15, v16, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CalLocationPredictionErrorDomain"), 0, v22);
      *v19 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a7)
  {
    v23 = (void *)v35[5];
    if (v23)
      *a7 = objc_retainAutorelease(v23);
  }
  v24 = (id)v41[5];

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

void __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_3((_QWORD *)a1, v6, v7);

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = v6;
    v10 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    v11 = objc_msgSend(v5, "count");
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v12)
        __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_2(v5, (_QWORD *)a1, v10);

      objc_msgSend(v5, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v10 = *(NSObject **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else if (v12)
    {
      __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_1((_QWORD *)a1, v10);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_1(_QWORD *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = 138412802;
  v6 = v2;
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_18FC12000, a2, OS_LOG_TYPE_DEBUG, "No locations of interest found for title %@, location: %@, calendar: %@", (uint8_t *)&v5, 0x20u);
}

void __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_2(void *a1, _QWORD *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  v6 = a2[4];
  v7 = a2[5];
  v8 = a2[6];
  v9 = 134218754;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2112;
  v16 = v8;
  _os_log_debug_impl(&dword_18FC12000, a3, OS_LOG_TYPE_DEBUG, "%lu locations of interest found for title %@, location: %@, calendar: %@", (uint8_t *)&v9, 0x2Au);
}

void __113__CalLocationPrediction_predictedLocationOfInterestForEventTitle_eventLocation_calendarIdentifier_timeout_error___block_invoke_cold_3(_QWORD *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  objc_msgSend(a2, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  _os_log_error_impl(&dword_18FC12000, a3, OS_LOG_TYPE_ERROR, "Error fetching locations of interest for title %@, location: %@, calendar: %@: %@", (uint8_t *)&v8, 0x2Au);

}

@end
