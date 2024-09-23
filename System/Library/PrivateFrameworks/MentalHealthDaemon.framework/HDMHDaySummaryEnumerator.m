@implementation HDMHDaySummaryEnumerator

- (HDMHDaySummaryEnumerator)initWithProfile:(id)a3 dayIndexRange:(id)a4 gregorianCalendar:(id)a5 predicate:(id)a6 pendingDailyStateOfMind:(id)a7 ascending:(BOOL)a8
{
  int64_t var1;
  int64_t var0;
  id v14;
  id v15;
  id v16;
  id v17;
  HDMHDaySummaryEnumerator *v18;
  HDMHDaySummaryEnumerator *v19;
  void **p_pendingDailyStateOfMind;
  HKStateOfMind *pendingDailyStateOfMind;
  NSObject *v22;
  void *v23;
  objc_super v25;

  var1 = a4.var1;
  var0 = a4.var0;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HDMHDaySummaryEnumerator;
  v18 = -[HDMHDaySummaryEnumerator init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_profile, v14);
    v19->_dayIndexRange.start = var0;
    v19->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v19->_predicate, a6);
    objc_storeStrong((id *)&v19->_gregorianCalendar, a5);
    p_pendingDailyStateOfMind = (void **)&v19->_pendingDailyStateOfMind;
    objc_storeStrong((id *)&v19->_pendingDailyStateOfMind, a7);
    v19->_ascending = a8;
    pendingDailyStateOfMind = v19->_pendingDailyStateOfMind;
    if (pendingDailyStateOfMind)
    {
      if (-[HKStateOfMind reflectiveInterval](pendingDailyStateOfMind, "reflectiveInterval") != 2)
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x24BDD3038];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3038], OS_LOG_TYPE_FAULT))
          -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:].cold.1(v22);
        v23 = *p_pendingDailyStateOfMind;
        *p_pendingDailyStateOfMind = 0;

      }
    }
  }

  return v19;
}

- (BOOL)enumerateWithError:(id *)a3 handler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t start;
  BOOL v11;
  int64_t v12;
  void *v14;
  id v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  HDMHDaySummaryBuilder *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  HDMHDaySummaryEnumerator *v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  HKStateOfMind *v49;

  v6 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  v49 = self->_pendingDailyStateOfMind;
  objc_msgSend((id)v45[5], "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", self->_gregorianCalendar);

  v9 = (void *)v45[5];
  if (v9)
  {
    start = self->_dayIndexRange.start;
    v11 = __OFSUB__(v8, start);
    v12 = v8 - start;
    if (v12 < 0 != v11 || v12 >= self->_dayIndexRange.duration)
    {
      v45[5] = 0;

    }
  }
  -[HDMHDaySummaryEnumerator _makeStateOfMindSampleEnumerator](self, "_makeStateOfMindSampleEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __55__HDMHDaySummaryEnumerator_enumerateWithError_handler___block_invoke;
  v27 = &unk_2511A2220;
  v28 = self;
  v30 = &v38;
  v32 = &v34;
  v33 = v8;
  v31 = &v44;
  v15 = v6;
  v29 = v15;
  v16 = objc_msgSend(v14, "enumerateWithError:handler:", a3, &v24);
  if (*((_BYTE *)v35 + 24))
    v17 = v16;
  else
    v17 = 0;
  if (!*((_BYTE *)v35 + 24) && ((v16 ^ 1) & 1) == 0)
  {
    v18 = v39[5];
    if (v18)
    {
      v19 = -[HDMHDaySummaryEnumerator _finishCurrentSummaryBuilder:pendingDailyStateOfMind:pendingDailyStateOfMindDayIndex:clientRequestedStop:handler:](self, "_finishCurrentSummaryBuilder:pendingDailyStateOfMind:pendingDailyStateOfMindDayIndex:clientRequestedStop:handler:", v18, v45[5], v8, v35 + 3, v15, v24, v25, v26, v27, v28);
      if (*((_BYTE *)v35 + 24))
      {
LABEL_18:
        v17 = 1;
        goto LABEL_19;
      }
      if (v19)
      {
        v20 = (void *)v45[5];
        v45[5] = 0;

      }
    }
    if (v45[5])
    {
      v21 = -[HDMHDaySummaryBuilder initWithDayIndex:gregorianCalendar:]([HDMHDaySummaryBuilder alloc], "initWithDayIndex:gregorianCalendar:", v8, self->_gregorianCalendar);
      -[HDMHDaySummaryBuilder addStateOfMind:](v21, "addStateOfMind:", v45[5]);
      -[HDMHDaySummaryBuilder daySummary](v21, "daySummary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, uint64_t *))v15 + 2))(v15, v22, v35 + 3);

    }
    goto LABEL_18;
  }
LABEL_19:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v17;
}

uint64_t __55__HDMHDaySummaryEnumerator_enumerateWithError_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HDMHDaySummaryBuilder *v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hk_dayIndexWithCalendar:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v6)
  {
LABEL_7:
    v11 = -[HDMHDaySummaryBuilder initWithDayIndex:gregorianCalendar:]([HDMHDaySummaryBuilder alloc], "initWithDayIndex:gregorianCalendar:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    goto LABEL_8;
  }
  if (objc_msgSend(v6, "dayIndex") == v5)
  {
LABEL_8:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addStateOfMind:", v3);
    v8 = 1;
    goto LABEL_9;
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "_finishCurrentSummaryBuilder:pendingDailyStateOfMind:pendingDailyStateOfMindDayIndex:clientRequestedStop:handler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, *(_QWORD *)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (v7)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = 0;

    }
    goto LABEL_7;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)_finishCurrentSummaryBuilder:(id)a3 pendingDailyStateOfMind:(id)a4 pendingDailyStateOfMindDayIndex:(int64_t)a5 clientRequestedStop:(BOOL *)a6 handler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *, BOOL *);
  int64_t v15;
  HDMHDaySummaryBuilder *v16;
  void *v17;
  BOOL v18;
  void *v19;

  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, void *, BOOL *))a7;
  if (!v12 || !v13)
  {
    v18 = v13 == 0;
    if (!v12)
      goto LABEL_12;
    goto LABEL_11;
  }
  v15 = -[HDMHDaySummaryEnumerator _compareDayIndex:withDayIndex:](self, "_compareDayIndex:withDayIndex:", a5, objc_msgSend(v12, "dayIndex"));
  if (!v15)
  {
    objc_msgSend(v12, "addStateOfMind:", v13);
    v18 = 1;
LABEL_11:
    objc_msgSend(v12, "daySummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v19, a6);

    goto LABEL_12;
  }
  if (v15 != -1)
  {
    v18 = 0;
    goto LABEL_11;
  }
  v16 = -[HDMHDaySummaryBuilder initWithDayIndex:gregorianCalendar:]([HDMHDaySummaryBuilder alloc], "initWithDayIndex:gregorianCalendar:", a5, self->_gregorianCalendar);
  -[HDMHDaySummaryBuilder addStateOfMind:](v16, "addStateOfMind:", v13);
  -[HDMHDaySummaryBuilder daySummary](v16, "daySummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v17, a6);

  LODWORD(v17) = *a6;
  v18 = 1;
  if (!(_DWORD)v17)
    goto LABEL_11;
LABEL_12:

  return v18;
}

- (int64_t)_compareDayIndex:(int64_t)a3 withDayIndex:(int64_t)a4
{
  int64_t v5;
  int64_t v6;

  if (a3 == a4)
    return 0;
  v5 = 1;
  if (a3 >= a4)
    v5 = -1;
  v6 = -1;
  if (a3 >= a4)
    v6 = 1;
  if (self->_ascending)
    return v6;
  else
    return v5;
}

- (id)_makeStateOfMindSampleEnumerator
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3F08], "stateOfMindType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE40BC0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v4, "entityEnumeratorWithType:profile:", v3, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMHDaySummaryEnumerator _queryPredicate](self, "_queryPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(MEMORY[0x24BE40E40], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x24BE40948], objc_opt_class(), self->_ascending);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOrderingTerms:", v9);

  return v6;
}

- (id)_queryPredicate
{
  void *v4;
  int64_t duration;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  if (self->_dayIndexRange.start == *MEMORY[0x24BDD2B60]
    && self->_dayIndexRange.duration == *(_QWORD *)(MEMORY[0x24BDD2B60] + 8))
  {
    return self->_predicate;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_dateOnDayIndex:atHour:calendar:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  duration = self->_dayIndexRange.duration;
  if (duration <= 0)
    v6 = 0x8000000000000000;
  else
    v6 = duration + self->_dayIndexRange.start;
  objc_msgSend(MEMORY[0x24BDBCE60], "hk_dateOnDayIndex:atHour:calendar:", v6, 0, self->_gregorianCalendar);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v15[0] = v8;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_predicate)
    objc_msgSend(v12, "addObject:");
  objc_msgSend(MEMORY[0x24BE40E20], "predicateMatchingAllPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDailyStateOfMind, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)initWithProfile:(os_log_t)log dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2416F5000, log, OS_LOG_TYPE_FAULT, "pendingDailyStateOfMind must have HKStateOfMindReflectiveIntervalDaily", v1, 2u);
}

@end
