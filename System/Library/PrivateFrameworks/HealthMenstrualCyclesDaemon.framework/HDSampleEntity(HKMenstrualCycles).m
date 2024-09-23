@implementation HDSampleEntity(HKMenstrualCycles)

+ (id)hdmc_daySummaryAnchorWithHealthDatabase:()HKMenstrualCycles error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BE40BC0];
  v6 = a3;
  HKMCDaySummarySampleTypes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataTypes();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maxRowIDForPredicate:healthDatabase:error:", v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)hdmc_analysisSampleInfo:()HKMenstrualCycles forProfile:error:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40AB0], "contextForReadingProtectedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke;
  v12[3] = &unk_24DB222B8;
  v12[4] = &v14;
  v8 = objc_msgSend(v6, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, &v13, v12, 0);
  v9 = v13;

  v10 = v8 ^ 1;
  if (!a3)
    v10 = 1;
  if ((v10 & 1) == 0)
    *a3 = objc_retainAutorelease((id)v15[5]);

  _Block_object_dispose(&v14, 8);
  return v8;
}

@end
