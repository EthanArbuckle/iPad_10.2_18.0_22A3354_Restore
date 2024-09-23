@implementation HKHeartRateRecoveryQueryUtility

void __49___HKHeartRateRecoveryQueryUtility__setupQueries__block_invoke(_QWORD *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v6 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1[4] + 40) + 16))();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "workoutRecoveryDateIntervalForWorkout:overlappingWorkouts:", *(_QWORD *)(a1[4] + 16), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = a1[6];
      v10 = (_QWORD *)a1[4];
      if (*(_BYTE *)(*(_QWORD *)(v9 + 8) + 24))
      {
        objc_msgSend((id)objc_opt_class(), "workoutRecoveryHeartRatesForWorkout:recoveryDateInterval:readings:", *(_QWORD *)(a1[4] + 16), v7, *(_QWORD *)(a1[4] + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1[4] + 40) + 16))();

      }
      else
      {
        v12 = v10[2];
        v13 = a1[5];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __49___HKHeartRateRecoveryQueryUtility__setupQueries__block_invoke_2;
        v14[3] = &unk_1E37EE460;
        v16 = v9;
        v14[4] = v10;
        v15 = v7;
        objc_msgSend(v10, "_heartRatesPostWorkout:workoutRecoveryTimePredicate:completionHandler:", v12, v13, v14);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1[4] + 40) + 16))();
    }

  }
}

void __49___HKHeartRateRecoveryQueryUtility__setupQueries__block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  v6 = a1[4];
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(v6 + 48), a2);
    objc_msgSend((id)objc_opt_class(), "workoutRecoveryHeartRatesForWorkout:recoveryDateInterval:readings:", *(_QWORD *)(a1[4] + 16), a1[5], *(_QWORD *)(a1[4] + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1[4] + 40) + 16))();

  }
}

void __106___HKHeartRateRecoveryQueryUtility__heartRatesPostWorkout_workoutRecoveryTimePredicate_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5, char a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HKHeartRateSummaryReading *v20;
  void *v21;
  HKHeartRateSummaryReading *v22;
  id v23;

  v23 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13 && v14)
  {
    v17 = (void *)a1[4];
    objc_msgSend(v14, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v17, "containsDate:", v18);

    if ((_DWORD)v17)
    {
      v19 = (void *)a1[5];
      v20 = [HKHeartRateSummaryReading alloc];
      objc_msgSend(v14, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HKHeartRateSummaryReading initWithDate:quantity:](v20, "initWithDate:quantity:", v21, v13);
      objc_msgSend(v19, "addObject:", v22);

    }
    if ((a6 & 1) != 0)
      goto LABEL_8;
  }
  else if ((a6 & 1) != 0)
  {
LABEL_8:
    (*(void (**)(void))(a1[6] + 16))();
  }

}

uint64_t __94___HKHeartRateRecoveryQueryUtility_workoutRecoveryDateIntervalForWorkout_overlappingWorkouts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v3, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hk_isAfterDate:", v9))
    {
      v10 = *(void **)(a1 + 48);
      objc_msgSend(v3, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "hk_isBeforeDate:", v11);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

uint64_t __102___HKHeartRateRecoveryQueryUtility_workoutRecoveryHeartRatesForWorkout_recoveryDateInterval_readings___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsDate:", v3);

  return v4;
}

@end
