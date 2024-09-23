@implementation HKHealthStore

void __58__HKHealthStore_HKMedicalIDAdditions__createMedicalIDData__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __101__HKHealthStore_HKUIAdditions___queryForMostRecentSampleOfType_predicate_sortDescriptors_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = a4;
    objc_msgSend(a3, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

  }
}

uint64_t __86__HKHealthStore_HKUIAdditions__queryForMostRecentQuantityOfType_predicate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "_processQuantitySample:error:completion:", a2, a3, *(_QWORD *)(a1 + 32));
}

void __98__HKHealthStore_HKUIAdditions__queryForMostRecentQuantityOfType_healthStore_predicate_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (void *)a1[7];
  v6 = a1[4];
  v7 = a2;
  v8 = objc_msgSend(v5, "_isAudioExposureQuantityType:", v6);
  v9 = (void *)a1[7];
  if (v8)
    objc_msgSend(v9, "_queryForMostRecentAudioExposureQuantityOfType:sample:healthStore:attenuated:completion:", a1[4], v7, a1[5], 0, a1[6]);
  else
    objc_msgSend(v9, "_processQuantitySample:error:completion:", v7, v10, a1[6]);

}

uint64_t __98__HKHealthStore_HKUIAdditions__queryForMostRecentAttenuatedEAEQuantityWithHealthStore_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 56), "_queryForMostRecentAudioExposureQuantityOfType:sample:healthStore:attenuated:completion:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

uint64_t __120__HKHealthStore_HKUIAdditions___queryForMostRecentAudioExposureQuantityOfType_sample_healthStore_attenuated_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 40), "_processStatisticsCollection:error:completion:", a3, a4, *(_QWORD *)(a1 + 32));
}

void __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD v18[5];
  id v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke_cold_1();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7808]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = &stru_1E9C4C428;
  v10 = v9;

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB7810]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E9C4C428;
  v14 = v13;

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke_280;
  v18[3] = &unk_1E9C44DA8;
  v15 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v15;
  v20 = v10;
  v21 = v14;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v16 = v14;
  v17 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

uint64_t __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke_280(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_populateDemographicsWrapper:withFirstName:lastName:meContact:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

void __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke_cold_1();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke_284;
  v12[3] = &unk_1E9C40210;
  v13 = *(id *)(a1 + 32);
  v14 = v7;
  v15 = v8;
  v16 = *(id *)(a1 + 40);
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

uint64_t __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke_284(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t result;

  v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(const __CFString **)(v4 + 8);
  if (v3)
    v5 = v3;
  else
    v5 = &stru_1E9C4C428;
  objc_msgSend(v2, "setFirstName:", v5);
  if (*(_QWORD *)(a1 + 48))
    v6 = *(const __CFString **)(a1 + 48);
  else
    v6 = &stru_1E9C4C428;
  objc_msgSend(*(id *)(a1 + 32), "setLastName:", v6);
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error fetching user name: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

void __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error fetching user name from profile store: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

@end
