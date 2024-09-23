@implementation HKHealthStore(HKUIAdditions)

+ (id)localizationStringAdditionForWheelchairUser
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v11;

  v2 = objc_alloc_init(MEMORY[0x1E0CB6780]);
  v11 = 0;
  objc_msgSend(v2, "wheelchairUseWithError:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v3, "wheelchairUse") == 2;
  }
  else
  {
    v7 = objc_msgSend(v4, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB52C0];
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[HKHealthStore(HKUIAdditions) localizationStringAdditionForWheelchairUser].cold.1();
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      +[HKHealthStore(HKUIAdditions) localizationStringAdditionForWheelchairUser].cold.2();
    }
    v6 = 0;
  }
  objc_msgSend(a1, "localizationStringSuffixForWheelchairUser:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (__CFString)localizationStringSuffixForWheelchairUser:()HKUIAdditions
{
  __CFString *v3;

  v3 = &stru_1E9C4C428;
  if (a3)
    v3 = CFSTR("_WHEELCHAIR");
  return v3;
}

+ (id)_queryForMostRecentSampleOfType:()HKUIAdditions predicate:sortDescriptors:completion:
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E0CB6AF8];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [v10 alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__HKHealthStore_HKUIAdditions___queryForMostRecentSampleOfType_predicate_sortDescriptors_completion___block_invoke;
  v18[3] = &unk_1E9C422A8;
  v19 = v9;
  v15 = v9;
  v16 = (void *)objc_msgSend(v14, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v13, v12, 1, v11, v18);

  return v16;
}

+ (id)queryForMostRecentSampleOfType:()HKUIAdditions predicate:completion:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0CB6AF8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sortDescriptorsForMostRecentSamples");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_queryForMostRecentSampleOfType:predicate:sortDescriptors:completion:", v11, v10, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)queryForMostRecentQuantityOfType:()HKUIAdditions predicate:completion:
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  void *v18;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB6AF8];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "sortDescriptorsForMostRecentSamples");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__HKHealthStore_HKUIAdditions__queryForMostRecentQuantityOfType_predicate_completion___block_invoke;
  v16[3] = &unk_1E9C44D30;
  v17 = v8;
  v18 = a1;
  v13 = v8;
  objc_msgSend(a1, "_queryForMostRecentSampleOfType:predicate:sortDescriptors:completion:", v11, v10, v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)queryForMostRecentQuantityOfType:()HKUIAdditions healthStore:predicate:completion:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  void *v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB6AF8];
  v14 = a5;
  objc_msgSend(v13, "sortDescriptorsForMostRecentSamples");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__HKHealthStore_HKUIAdditions__queryForMostRecentQuantityOfType_healthStore_predicate_completion___block_invoke;
  v21[3] = &unk_1E9C44D58;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = a1;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(a1, "_queryForMostRecentSampleOfType:predicate:sortDescriptors:completion:", v18, v14, v15, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)queryForMostRecentAttenuatedEAEQuantityWithHealthStore:()HKUIAdditions completion:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB6AF8], "sortDescriptorsForMostRecentSamples");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C78]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__HKHealthStore_HKUIAdditions__queryForMostRecentAttenuatedEAEQuantityWithHealthStore_completion___block_invoke;
  v15[3] = &unk_1E9C44D58;
  v16 = v9;
  v17 = v6;
  v18 = v7;
  v19 = a1;
  v10 = v7;
  v11 = v6;
  v12 = v9;
  objc_msgSend(a1, "_queryForMostRecentSampleOfType:predicate:sortDescriptors:completion:", v12, 0, v8, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)_queryForMostRecentAudioExposureQuantityOfType:()HKUIAdditions sample:healthStore:attenuated:completion:
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v34;
  id v35;
  uint64_t v36;

  v12 = a3;
  v13 = a7;
  v14 = (void *)MEMORY[0x1E0CB6A78];
  v15 = a5;
  v16 = a4;
  objc_msgSend(v16, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateForSamplesWithStartDate:endDate:options:", v17, 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6
    && (objc_msgSend(v12, "identifier"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = (void *)*MEMORY[0x1E0CB5C78],
        v19,
        v19 == v20))
  {
    v21 = _HKStatisticsOptionAttenuateSamples() | 0x20;
  }
  else
  {
    v21 = 32;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "startOfDayForDate:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;

  v28 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v28, "setDay:", 1);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C80]), "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v12, v18, v21, v27, v28);
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __120__HKHealthStore_HKUIAdditions___queryForMostRecentAudioExposureQuantityOfType_sample_healthStore_attenuated_completion___block_invoke;
  v34 = &unk_1E9C44D80;
  v35 = v13;
  v36 = a1;
  v30 = v13;
  objc_msgSend(v29, "setInitialResultsHandler:", &v31);
  objc_msgSend(v15, "executeQuery:", v29, v31, v32, v33, v34);

}

+ (void)_processQuantitySample:()HKUIAdditions error:completion:
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
  if (!v8)
  {
    v12 = 0;
    v13 = 0;
    if (!v10)
      goto LABEL_4;
    goto LABEL_3;
  }
  v14 = 0;
  v15 = 0;
  objc_msgSend(a1, "_assignMostRecentQuantity:dateInterval:forQuantitySample:", &v15, &v14, v8);
  v12 = v15;
  v13 = v14;
  if (v11)
LABEL_3:
    ((void (**)(_QWORD, id, id, id))v11)[2](v11, v12, v13, v9);
LABEL_4:

}

+ (void)_processStatisticsCollection:()HKUIAdditions error:completion:
{
  void (**v7)(id, void *, void *, id);
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v8, "_mostRecentQuantityStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_mostRecentQuantityDateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v7[2](v7, v9, v10, v11);

}

+ (uint64_t)_isAudioExposureQuantityType:()HKUIAdditions
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB5CA8];
  v10[0] = *MEMORY[0x1E0CB5C78];
  v10[1] = v3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "containsObject:", v7);
  return v8;
}

+ (id)_mostRecentEndDateSortDescriptorForQuantityType:()HKUIAdditions
{
  objc_msgSend(a3, "dataObjectClass");
  objc_opt_class();
  objc_opt_isKindOfClass();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E48], 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)_assignMostRecentQuantity:()HKUIAdditions dateInterval:forQuantitySample:
{
  id v7;
  BOOL v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a5;
  if (a3)
    v8 = a4 == 0;
  else
    v8 = 1;
  v9 = !v8;
  if (!v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "mostRecentQuantity");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mostRecentQuantityDateInterval");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "quantity");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v7, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v10, "initWithStartDate:endDate:", v11, v12);

    }
  }

  return v9;
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  HKDemographicsInformationWrapper *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  os_log_t *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[8];

  v44[6] = *MEMORY[0x1E0C80C00];
  v35 = a4;
  if ((a3 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
    {
      v7 = (void *)objc_opt_new();
      v8 = *MEMORY[0x1E0C96780];
      v44[0] = *MEMORY[0x1E0C966D0];
      v44[1] = v8;
      v9 = *MEMORY[0x1E0C96670];
      v44[2] = *MEMORY[0x1E0C966C0];
      v44[3] = v9;
      v10 = *MEMORY[0x1E0C966A8];
      v44[4] = *MEMORY[0x1E0C967F0];
      v44[5] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v11, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v12 = objc_alloc_init(HKDemographicsInformationWrapper);
  v43 = 0;
  objc_msgSend(a1, "dateOfBirthComponentsWithError:", &v43);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v43;
  if (v14 && (_HKInitializeLogging(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR)))
  {
    -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.8();
    if (v13)
      goto LABEL_13;
  }
  else if (v13)
  {
    goto LABEL_13;
  }
  if (v6)
  {
    objc_msgSend(v6, "birthday");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "year") == 0x7FFFFFFFFFFFFFFFLL)
      v13 = 0;
    else
      v13 = v15;

  }
LABEL_13:
  v34 = v6;
  if (v13)
    -[HKDemographicsInformationWrapper setDateOfBirthComponents:](v12, "setDateOfBirthComponents:", v13);
  v42 = v14;
  objc_msgSend(a1, "biologicalSexWithError:", &v42);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v42;

  v18 = (os_log_t *)MEMORY[0x1E0CB5348];
  if (v17)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.7();
  }
  v33 = (void *)v16;
  -[HKDemographicsInformationWrapper setBiologicalSexObject:](v12, "setBiologicalSexObject:", v16);
  v41 = v17;
  objc_msgSend(a1, "_heightCharacteristicQuantityWithError:", &v41);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v41;

  if (v20)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.6();
  }
  -[HKDemographicsInformationWrapper setHeightQuantity:](v12, "setHeightQuantity:", v19);
  v40 = v20;
  objc_msgSend(a1, "_bodyMassCharacteristicQuantityWithError:", &v40);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v40;

  if (v22)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.5();
  }
  -[HKDemographicsInformationWrapper setWeightQuantity:](v12, "setWeightQuantity:", v21, v21);
  v39 = v22;
  objc_msgSend(a1, "fitzpatrickSkinTypeWithError:", &v39);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v39;

  if (v24)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.4();
  }
  -[HKDemographicsInformationWrapper setFitzpatrickSkinTypeObject:](v12, "setFitzpatrickSkinTypeObject:", v23);
  v38 = v24;
  objc_msgSend(a1, "bloodTypeWithError:", &v38);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v38;

  if (v26)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.3();
  }
  v27 = (void *)v19;
  -[HKDemographicsInformationWrapper setBloodTypeObject:](v12, "setBloodTypeObject:", v25);
  v37 = v26;
  objc_msgSend(a1, "wheelchairUseWithError:", &v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v37;

  if (v29)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.2();
  }
  -[HKDemographicsInformationWrapper setWheelchairUseObject:](v12, "setWheelchairUseObject:", v28);
  v36 = v29;
  objc_msgSend(a1, "_cardioFitnessMedicationsUseWithError:", &v36);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v36;

  if (v31)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      -[HKHealthStore(HKUIAdditions) hk_fetchExistingDemographicInformationWithOptions:completion:].cold.1();
  }
  -[HKDemographicsInformationWrapper setCardioFitnessMedicationsUseObject:](v12, "setCardioFitnessMedicationsUseObject:", v30);
  objc_msgSend(a1, "_fetchFirstAndLastNamesForInfoWrapper:meContact:completion:", v12, v34, v35);

}

- (void)_fetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions meContact:completion:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "profileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");

  if (v11 == 1)
    objc_msgSend(a1, "_primaryProfileFetchFirstAndLastNamesForInfoWrapper:meContact:completion:", v9, v12, v8);
  else
    objc_msgSend(a1, "_nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper:completion:", v9, v8);

}

- (void)_primaryProfileFetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions meContact:completion:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB67F0], "healthAppDefaultsDomainWithHealthStore:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB7820];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__HKHealthStore_HKUIAdditions___primaryProfileFetchFirstAndLastNamesForInfoWrapper_meContact_completion___block_invoke;
  v16[3] = &unk_1E9C44DD0;
  v16[4] = a1;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v11, "propertyListValueForKey:completion:", v12, v16);

}

- (void)_nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper:()HKUIAdditions completion:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A18]), "initWithHealthStore:", a1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__HKHealthStore_HKUIAdditions___nonPrimaryProfileFetchFirstAndLastNamesForInfoWrapper_completion___block_invoke;
  v11[3] = &unk_1E9C44DF8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "fetchDisplayName:", v11);

}

- (uint64_t)hk_fetchExistingDemographicInformationWithCompletion:()HKUIAdditions
{
  return objc_msgSend(a1, "hk_fetchExistingDemographicInformationWithOptions:completion:", 0, a3);
}

- (void)_populateDemographicsWrapper:()HKUIAdditions withFirstName:lastName:meContact:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v9 = a5;
  v10 = a6;
  v11 = a3;
  objc_msgSend(v10, "middleName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(v10, "givenName");
    v13 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v13;
  }
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(v10, "familyName");
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  objc_msgSend(v11, "setFirstName:", v17);
  objc_msgSend(v11, "setMiddleName:", v12);
  objc_msgSend(v11, "setLastName:", v9);
  objc_msgSend(v10, "postalAddresses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPostalAddresses:", v15);

  objc_msgSend(v10, "emailAddresses");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEmailAddresses:", v16);

}

+ (void)localizationStringAdditionForWheelchairUser
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Failed to fetch wheelchair use: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error getting cardio fitness medications use: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error getting wheelchair use: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error getting blood type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error getting Fitzpatrick skin type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error getting weight characteristic: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error getting height characteristic: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error getting biological sex: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)hk_fetchExistingDemographicInformationWithOptions:()HKUIAdditions completion:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Error getting birth date: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

@end
