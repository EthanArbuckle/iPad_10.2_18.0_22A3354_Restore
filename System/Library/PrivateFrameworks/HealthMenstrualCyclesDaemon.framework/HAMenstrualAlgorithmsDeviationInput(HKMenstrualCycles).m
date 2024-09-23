@implementation HAMenstrualAlgorithmsDeviationInput(HKMenstrualCycles)

+ (id)hdmc_deviationInputWithProfile:()HKMenstrualCycles enabledSetExplicitly:calendar:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  os_log_t *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  os_log_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  os_log_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  os_log_t v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  int v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  const __CFString *v64;
  id v65;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  const __CFString *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BE3F5B0]);
  objc_msgSend(a1, "_dayIndexAfterLastDeviationOfType:profile:calendar:", 0, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setJulianDayMinAnalysisWindowStartProlonged:", v11);

  objc_msgSend(a1, "_dayIndexAfterLastDeviationOfType:profile:calendar:", 1, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setJulianDayMinAnalysisWindowStartSpotting:", v12);

  objc_msgSend(a1, "_dayIndexAfterLastDeviationOfType:profile:calendar:", 2, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setJulianDayMinAnalysisWindowStartIrregular:", v13);

  objc_msgSend(a1, "_dayIndexAfterLastDeviationOfType:profile:calendar:", 3, v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setJulianDayMinAnalysisWindowStartInfrequent:", v14);

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "showSensitiveLogItems");

  v17 = (os_log_t *)MEMORY[0x24BDD3030];
  if (v16)
  {
    _HKInitializeLogging();
    v18 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = (void *)objc_opt_class();
      v21 = v20;
      objc_msgSend(v10, "julianDayMinAnalysisWindowStartProlonged");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v20;
      v76 = 2112;
      v77 = v22;
      _os_log_impl(&dword_21961B000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis start day (prolonged): %@", buf, 0x16u);

      v17 = (os_log_t *)MEMORY[0x24BDD3030];
    }
    _HKInitializeLogging();
    v23 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      v25 = (void *)objc_opt_class();
      v26 = v25;
      objc_msgSend(v10, "julianDayMinAnalysisWindowStartSpotting");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v25;
      v76 = 2112;
      v77 = v27;
      _os_log_impl(&dword_21961B000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis start day (spotting): %@", buf, 0x16u);

      v17 = (os_log_t *)MEMORY[0x24BDD3030];
    }
    _HKInitializeLogging();
    v28 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = (void *)objc_opt_class();
      v31 = v30;
      objc_msgSend(v10, "julianDayMinAnalysisWindowStartIrregular");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v30;
      v76 = 2112;
      v77 = v32;
      _os_log_impl(&dword_21961B000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis start day (irregular): %@", buf, 0x16u);

      v17 = (os_log_t *)MEMORY[0x24BDD3030];
    }
    _HKInitializeLogging();
    v33 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      v35 = (void *)objc_opt_class();
      v36 = v35;
      objc_msgSend(v10, "julianDayMinAnalysisWindowStartInfrequent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v35;
      v76 = 2112;
      v77 = v37;
      _os_log_impl(&dword_21961B000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis start day (infrequent): %@", buf, 0x16u);

      v17 = (os_log_t *)MEMORY[0x24BDD3030];
    }
  }
  objc_msgSend(v8, "onboardingCompletionManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x24BDD2E30];
  v73 = 0;
  objc_msgSend(v38, "onboardingCompletionsForHighestVersionOfFeatureIdentifier:error:", v39, &v73);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v73;

  if (!v40)
  {
    _HKInitializeLogging();
    v42 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
      +[HAMenstrualAlgorithmsDeviationInput(HKMenstrualCycles) hdmc_deviationInputWithProfile:enabledSetExplicitly:calendar:].cold.2(v42);
  }
  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(v40, "hk_firstSortedObjectWithComparison:", &__block_literal_global);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "completionDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = v44;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v44, "hk_dayIndexWithCalendar:", v9));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", v8);
    v72 = v41;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "hdmc_unconfirmedDeviationDismissalDayIndexWithError:", &v72);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v72;

    if (v45 || !v46)
    {
      if (v45)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v45, "integerValue") + 10);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
        v70 = v9;
        v54 = a4;
        if (a4)
        {
          v55 = v53;
        }
        else
        {
          v56 = v71;
          if (v53 && v71)
          {
            v67 = (void *)MEMORY[0x24BDD16E0];
            v57 = objc_msgSend(v53, "integerValue");
            v58 = objc_msgSend(v71, "integerValue");
            if (v57 <= v58)
              v59 = v58;
            else
              v59 = v57;
            objc_msgSend(v67, "numberWithInteger:", v59);
            v55 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v53)
              v56 = v53;
            v55 = v56;
          }
        }
        v60 = v55;
        _HKInitializeLogging();
        v61 = (void *)*MEMORY[0x24BDD3030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
        {
          v62 = v61;
          v63 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138544386;
          v64 = CFSTR("NO");
          v75 = v63;
          v76 = 2112;
          if (v54)
            v64 = CFSTR("YES");
          v77 = v60;
          v78 = 2112;
          v79 = v71;
          v80 = 2112;
          v81 = v45;
          v82 = 2112;
          v83 = v64;
          v65 = v63;
          _os_log_impl(&dword_21961B000, v62, OS_LOG_TYPE_DEFAULT, "[%{public}@] Minimum deviation analysis end day: %@ (first onboarded: %@, last dismissed: %@, enabled set explicitly: %@)", buf, 0x34u);

        }
        objc_msgSend(v10, "setJulianDayMinAnalysisWindowEndProlonged:", v60);
        objc_msgSend(v10, "setJulianDayMinAnalysisWindowEndSpotting:", v60);
        objc_msgSend(v10, "setJulianDayMinAnalysisWindowEndIrregular:", v60);
        objc_msgSend(v10, "setJulianDayMinAnalysisWindowEndInfrequent:", v60);
        v52 = v10;

        v9 = v70;
        goto LABEL_40;
      }
    }
    else
    {
      _HKInitializeLogging();
      v47 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        +[HAMenstrualAlgorithmsDeviationInput(HKMenstrualCycles) hdmc_deviationInputWithProfile:enabledSetExplicitly:calendar:].cold.1(v47);
    }
    v53 = 0;
    goto LABEL_24;
  }
  _HKInitializeLogging();
  v48 = *v17;
  if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v48;
    v50 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v75 = v50;
    v51 = v50;
    _os_log_impl(&dword_21961B000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping deviation input configuration due to no onboarding completion", buf, 0xCu);

  }
  v52 = 0;
  v46 = v41;
LABEL_40:

  return v52;
}

+ (id)_dayIndexAfterLastDeviationOfType:()HKMenstrualCycles profile:calendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  v8 = (void *)MEMORY[0x24BE40BC0];
  HKCategoryTypeFromDeviationType();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityEnumeratorWithType:profile:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3710], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v12);

  HDSampleEntityOrderingTermsForRecentness();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOrderingTerms:", v13);

  objc_msgSend(v10, "setLimitCount:", 1);
  v25 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __109__HAMenstrualAlgorithmsDeviationInput_HKMenstrualCycles___dayIndexAfterLastDeviationOfType_profile_calendar___block_invoke;
  v24[3] = &unk_24DB21BE8;
  v24[4] = &v26;
  objc_msgSend(v10, "enumerateWithError:handler:", &v25, v24);
  v14 = v25;
  v15 = (void *)v27[5];
  if (v15)
  {
    v16 = objc_msgSend(v15, "hk_dayIndexRangeWithCalendar:", v7);
    if (v17 <= 0)
      v18 = 0x8000000000000000;
    else
      v18 = v16 + v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v14)
    {
      _HKInitializeLogging();
      v20 = (id)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = (id)objc_opt_class();
        NSStringFromDeviationType();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v22;
        v34 = 2114;
        v35 = v23;
        v36 = 2114;
        v37 = v14;
        _os_log_error_impl(&dword_21961B000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving last %{public}@ deviation sample: %{public}@", buf, 0x20u);

      }
    }
    v19 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v19;
}

+ (void)hdmc_deviationInputWithProfile:()HKMenstrualCycles enabledSetExplicitly:calendar:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error retrieving unconfirmed deviation dismiss day: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

+ (void)hdmc_deviationInputWithProfile:()HKMenstrualCycles enabledSetExplicitly:calendar:.cold.2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error retrieving deviation detection onboarding completions: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
