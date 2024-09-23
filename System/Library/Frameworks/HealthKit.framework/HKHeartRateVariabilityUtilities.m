@implementation HKHeartRateVariabilityUtilities

+ (id)_hrvType
{
  return +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", CFSTR("HKQuantityTypeIdentifierHeartRateVariabilitySDNN"));
}

+ (id)_sequenceType
{
  return +[HKSeriesType heartbeatSeriesType](HKSeriesType, "heartbeatSeriesType");
}

+ (void)queryForParentSequenceOfHRV:(id)a3 healthStore:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HKSampleQuery *v31;
  HKSampleQuery *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "quantityType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hrvType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKHeartRateVariabilityUtilities.m"), 52, CFSTR("Should only query for parents sequence for HRV samples"));

  }
  objc_msgSend(v9, "sourceRevision");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "_isAppleWatch");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v9, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithFormat:", CFSTR("startDate >= %@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v9, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateWithFormat:", CFSTR("endDate <= %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sourceRevision");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "source");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuery predicateForObjectsFromSource:](HKQuery, "predicateForObjectsFromSource:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0CB3528];
    v36[0] = v20;
    v36[1] = v23;
    v36[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "andPredicateWithSubpredicates:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKSeriesType heartbeatSeriesType](HKSeriesType, "heartbeatSeriesType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = [HKSampleQuery alloc];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __86__HKHeartRateVariabilityUtilities_queryForParentSequenceOfHRV_healthStore_completion___block_invoke;
    v34[3] = &unk_1E37F7EA8;
    v35 = v11;
    v32 = -[HKSampleQuery initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:](v31, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v30, v29, 1, 0, v34);
    objc_msgSend(v10, "executeQuery:", v32);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

void __86__HKHeartRateVariabilityUtilities_queryForParentSequenceOfHRV_healthStore_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)deleteHRVSample:(id)a3 healthStore:(id)a4 predicate:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  id v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  id v32;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke;
  aBlock[3] = &unk_1E37F7EF8;
  v15 = v12;
  v28 = v15;
  v29 = v11;
  v31 = a6;
  v32 = a1;
  v16 = v13;
  v30 = v16;
  v17 = v11;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_31;
  v21[3] = &unk_1E37F7F48;
  v22 = v15;
  v23 = _Block_copy(aBlock);
  v25 = a6;
  v26 = a1;
  v24 = v16;
  v18 = v16;
  v19 = v23;
  v20 = v15;
  objc_msgSend(a1, "queryForParentSequenceOfHRV:healthStore:completion:", v17, v20, v21);

}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2;
  v4[3] = &unk_1E37F7ED0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "deleteObject:options:withCompletion:", v2, v3, v4);

}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR))
      __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_cold_1();
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);

}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_31(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_32;
    v8[3] = &unk_1E37F7F20;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = v6;
    v11 = v7;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "deleteObject:options:withCompletion:", a2, v4, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_32(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR))
      __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_32_cold_1();
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
  }

}

+ (void)deleteHRVSamplesFromStartDate:(id)a3 endDate:(id)a4 predicate:(id)a5 options:(unint64_t)a6 healthStore:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a7;
  v16 = a8;
  +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", a3, a4, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v14)
  {
    v19 = (void *)MEMORY[0x1E0CB3528];
    v34[0] = v14;
    v34[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v21;
  }
  objc_msgSend(a1, "_sequenceType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke;
  v27[3] = &unk_1E37F7F98;
  v28 = v15;
  v29 = v18;
  v32 = a1;
  v33 = a6;
  v30 = v14;
  v31 = v16;
  v23 = v14;
  v24 = v18;
  v25 = v15;
  v26 = v16;
  objc_msgSend(v25, "deleteObjectsOfType:predicate:options:withCompletion:", v22, v24, a6, v27);

}

void __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v6 = a4;
  if ((a2 & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 64), "_hrvType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_34;
    v12[3] = &unk_1E37F7F70;
    v9 = *(_QWORD *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v7, "deleteObjectsOfType:predicate:options:withCompletion:", v8, v10, v9, v12);

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR))
      __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_cold_1();
    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v6);
  }

}

void __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;

  v6 = a4;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = HKLogHeartRate;
    if (os_log_type_enabled((os_log_t)HKLogHeartRate, OS_LOG_TYPE_ERROR))
      __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_34_cold_1(a1, (uint64_t)v6, v7);
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v6);

}

+ (id)instantaneousBPMsForHeartbeatSeriesSample:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  char v16;
  _QWORD v17[4];

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__HKHeartRateVariabilityUtilities_instantaneousBPMsForHeartbeatSeriesSample___block_invoke;
  v10[3] = &unk_1E37F7FC0;
  v12 = v15;
  v13 = v17;
  v14 = v7;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v3, "_enumerateHeartbeatDataWithBlock:", v10);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

  return v8;
}

uint64_t __77__HKHeartRateVariabilityUtilities_instantaneousBPMsForHeartbeatSeriesSample___block_invoke(uint64_t a1, char a2, double a3)
{
  HKBeatToBeatInstantaneousBPM *v5;

  if ((a2 & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = -[HKBeatToBeatInstantaneousBPM initWithBPM:time:]([HKBeatToBeatInstantaneousBPM alloc], "initWithBPM:time:", 1.0 / ((a3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) / 60.0), *(double *)(a1 + 56) + a3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return 1;
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%@: Error deleting HRV: %@");
  OUTLINED_FUNCTION_3();
}

void __92__HKHeartRateVariabilityUtilities_deleteHRVSample_healthStore_predicate_options_completion___block_invoke_2_32_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%@: Error deleting heartbeat sequence, cannot delete corresponding HRV: %@");
  OUTLINED_FUNCTION_3();
}

void __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%@: Error deleting heartbeat sequences, cannot delete corresponding HRV: %@");
  OUTLINED_FUNCTION_3();
}

void __114__HKHeartRateVariabilityUtilities_deleteHRVSamplesFromStartDate_endDate_predicate_options_healthStore_completion___block_invoke_34_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
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
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "%@: Error deleting HRV samples with predicate %@: %@", (uint8_t *)&v5, 0x20u);
}

@end
