@implementation HDCategorySampleEntity(HKMenstrualCycles)

+ (id)hdmc_ongoingFactorsOnDayIndex:()HKMenstrualCycles profile:calendarCache:error:
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  HKMCCycleFactorsTypes();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hdmc_ongoingFactorsOnDayIndex:factorTypes:profile:calendarCache:error:", a3, v12, v11, v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)hdmc_ongoingFactorsOnDayIndex:()HKMenstrualCycles factorTypes:profile:calendarCache:error:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BE40A50];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entityEnumeratorWithTypes:profile:error:", v15, v12, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BE40E48], "hdmc_predicateForPossibleOngoingSamplesOnDayIndex:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);

    objc_msgSend(v16, "setLimitCount:", *MEMORY[0x24BE40E68]);
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __115__HDCategorySampleEntity_HKMenstrualCycles__hdmc_ongoingFactorsOnDayIndex_factorTypes_profile_calendarCache_error___block_invoke;
    v28[3] = &unk_24DB21B58;
    v19 = v13;
    v30 = &v32;
    v31 = a3;
    v29 = v19;
    if (objc_msgSend(v16, "enumerateWithError:handler:", a7, v28))
    {
      v20 = (void *)v33[5];
      v23 = v18;
      v24 = 3221225472;
      v25 = __115__HDCategorySampleEntity_HKMenstrualCycles__hdmc_ongoingFactorsOnDayIndex_factorTypes_profile_calendarCache_error___block_invoke_2;
      v26 = &unk_24DB21B80;
      v27 = v19;
      objc_msgSend(v20, "sortUsingComparator:", &v23);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v33[5], v23, v24, v25, v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
