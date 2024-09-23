@implementation HDMHLoggingPatternDetector

- (HDMHLoggingPatternDetector)initWithProfile:(id)a3
{
  id v4;
  HDMHLoggingPatternDetector *v5;
  HDMHLoggingPatternDetector *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMHLoggingPatternDetector;
  v5 = -[HDMHLoggingPatternDetector init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)isUnpleasantLoggingPatternDetectedWithCurrentDate:(id)a3 gregorianCalendar:(id)a4 pendingStateOfMind:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id WeakRetained;
  void *v18;
  HDMHDaySummaryEnumerator *v19;
  _BOOL8 v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v10, "hk_dayIndexWithCalendar:", v11);
  v14 = *MEMORY[0x24BE65D78];
  v15 = v13 - *MEMORY[0x24BE65D78] + 1;
  if (objc_msgSend(v12, "reflectiveInterval") == 2)
    v16 = v12;
  else
    v16 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(MEMORY[0x24BE40C18], "predicateForReflectiveInterval:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 1;
  v19 = -[HDMHDaySummaryEnumerator initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:]([HDMHDaySummaryEnumerator alloc], "initWithProfile:dayIndexRange:gregorianCalendar:predicate:pendingDailyStateOfMind:ascending:", WeakRetained, v15, v14, v11, v18, v16, v24);
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __123__HDMHLoggingPatternDetector_isUnpleasantLoggingPatternDetectedWithCurrentDate_gregorianCalendar_pendingStateOfMind_error___block_invoke;
  v25[3] = &unk_2511A23A8;
  v25[4] = &v30;
  v25[5] = &v26;
  if (-[HDMHDaySummaryEnumerator enumerateWithError:handler:](v19, "enumerateWithError:handler:", a6, v25))
  {
    v21 = v31[3] >= *MEMORY[0x24BE65D88] && v27[3] < *MEMORY[0x24BE65D80];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v22;
}

void __123__HDMHLoggingPatternDetector_isUnpleasantLoggingPatternDetectedWithCurrentDate_gregorianCalendar_pendingStateOfMind_error___block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a2, "dailyStateOfMind");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "valenceClassification") == 2
    || objc_msgSend(v6, "valenceClassification") == 1
    || objc_msgSend(v6, "valenceClassification") == 3;
  v4 = objc_msgSend(v6, "valenceClassification") == 6
    || objc_msgSend(v6, "valenceClassification") == 7
    || objc_msgSend(v6, "valenceClassification") == 5;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
LABEL_13:
    ++*(_QWORD *)(*(_QWORD *)(v5 + 8) + 24);
    goto LABEL_14;
  }
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    goto LABEL_13;
  }
LABEL_14:

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

@end
