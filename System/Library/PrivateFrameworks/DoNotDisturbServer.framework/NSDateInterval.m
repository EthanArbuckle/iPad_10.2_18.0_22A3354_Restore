@implementation NSDateInterval

void __79__NSDateInterval_Schedule__dnds_dateIntervalForScheduleSettings_date_calendar___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id v19;

  v6 = *(_QWORD *)(a1 + 72);
  if ((DNDWeekdaysFromDay() & v6) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateComponents");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "date:matchesComponents:", *(_QWORD *)(a1 + 48), v19))
    {
      v10 = *(id *)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", *(_QWORD *)(a1 + 48), v19, 5124);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", v10, v9, 9216);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v13, "setWeekday:", a2);
    while (DNDSGetLifetimePhase(*(void **)(a1 + 48), (uint64_t)v11, v12) == 2
         || objc_msgSend(v11, "compare:", v12) != -1
         || (objc_msgSend(*(id *)(a1 + 40), "date:matchesComponents:", v11, v13) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", v11, v19, 5120);
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", v12, v9, 9216);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
      v11 = (void *)v14;
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(_QWORD *)(v16 + 40);
    v18 = v17 != 0;
    if (v17)
    {
      if (objc_msgSend(v11, "compare:") != -1)
      {
        v18 = 0;
LABEL_16:
        *a3 = v18;

        return;
      }
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    objc_storeStrong((id *)(v16 + 40), v11);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v12);
    goto LABEL_16;
  }
}

void __102__NSDateInterval_Schedule__dnds_dateIntervalUntilEndOfScheduleForScheduleSettings_startDate_calendar___block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id v19;

  v6 = *(_QWORD *)(a1 + 64);
  if ((DNDWeekdaysFromDay() & v6) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateComponents");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "date:matchesComponents:", *(_QWORD *)(a1 + 48), v19))
    {
      v10 = *(id *)(a1 + 48);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", *(_QWORD *)(a1 + 48), v19, 5124);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", v10, v9, 9216);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v13, "setWeekday:", a2);
    while (DNDSGetLifetimePhase(*(void **)(a1 + 48), *(_QWORD *)(a1 + 48), v12) == 2
         || (objc_msgSend(*(id *)(a1 + 40), "date:matchesComponents:", v11, v13) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", v11, v19, 5120);
      v14 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "nextDateAfterDate:matchingComponents:options:", v12, v9, 9216);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
      v11 = (void *)v14;
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(_QWORD *)(v16 + 40);
    v18 = v17 != 0;
    if (v17)
    {
      if (objc_msgSend(v12, "compare:") != -1)
      {
        v18 = 0;
LABEL_15:
        *a3 = v18;

        return;
      }
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    objc_storeStrong((id *)(v16 + 40), v12);
    goto LABEL_15;
  }
}

@end
