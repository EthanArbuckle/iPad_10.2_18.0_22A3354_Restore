@implementation HDSampleEntity

uint64_t __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];

  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke_4;
  v9[3] = &unk_24DB22290;
  v9[4] = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend(v6, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &IDSBAASignerErrorDomain_block_invoke_lookupKey, a3, &__block_literal_global_3, 0, v9);

  return v7;
}

id __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  HKMCCycleTrackingSampleTypes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD35B8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObject:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "hk_map:", &__block_literal_global_190);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("WHERE (samples.data_type IN (%@))"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT samples.data_id, objects.uuid, samples.data_type, objects.type FROM samples INNER JOIN objects USING(data_id) %@ ORDER BY samples.data_id DESC LIMIT 1"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "code"));
}

uint64_t __78__HDSampleEntity_HKMenstrualCycles__hdmc_analysisSampleInfo_forProfile_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = objc_alloc(MEMORY[0x24BE46BF8]);
  v5 = HDSQLiteColumnAsInt64();
  MEMORY[0x219A30F60](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "initWithAnchor:UUID:deleted:", v5, v6, HDSQLiteColumnAsInt64() == 2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return 0;
}

@end
