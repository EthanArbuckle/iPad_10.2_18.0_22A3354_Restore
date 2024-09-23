@implementation HDSettingsMigrationStep

uint64_t __110__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t (**v9)(void *, const __CFString *, _QWORD, id *);
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  uint64_t v24;

  v5 = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults___block_invoke_2;
  aBlock[3] = &unk_24DB223D0;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v22 = v6;
  v24 = v7;
  v8 = v5;
  v23 = v8;
  v9 = (uint64_t (**)(void *, const __CFString *, _QWORD, id *))_Block_copy(aBlock);
  v10 = *MEMORY[0x24BE46840];
  v20 = 0;
  v11 = v9[2](v9, CFSTR("MenstruationProjectionsEnabled"), v10, &v20);
  v12 = v20;
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    v16 = v12;
    if (!v16)
    {
LABEL_10:

      v17 = 0;
      goto LABEL_11;
    }
    if (!a3)
    {
LABEL_9:
      _HKLogDroppedError();
      goto LABEL_10;
    }
LABEL_6:
    v16 = objc_retainAutorelease(v16);
    *a3 = v16;
    goto LABEL_10;
  }
  v14 = *MEMORY[0x24BE46828];
  v19 = v12;
  v15 = v9[2](v9, CFSTR("FertileWindowProjectionsEnabled"), v14, &v19);
  v16 = v19;

  if ((v15 & 1) == 0)
  {
    v16 = v16;
    if (!v16)
      goto LABEL_10;
    if (!a3)
      goto LABEL_9;
    goto LABEL_6;
  }
  v17 = 1;
LABEL_11:

  return v17;
}

uint64_t __110__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults___block_invoke_2(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "hk_safeNumberForKeyPath:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v10 = *MEMORY[0x24BDD3030];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v23 = v17;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_21961B000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v23 = v12;
    v24 = 2114;
    v25 = v7;
    v26 = 2114;
    v27 = v9;
    _os_log_impl(&dword_21961B000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 40), "featureSettingsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDD2E28];
  v21 = 0;
  v15 = objc_msgSend(v13, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", v9, v8, v14, 0, &v21);
  v16 = v21;

  if ((v15 & 1) != 0)
  {

LABEL_8:
    v18 = 1;
    goto LABEL_14;
  }
  v19 = v16;
  if (v19)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();
  }

  v18 = 0;
LABEL_14:

  return v18;
}

uint64_t __115__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hk_safeNumberForKeyPath:error:", CFSTR("CycleTrackingOnboardingTileDismissedDate"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v7 = *MEMORY[0x24BDD3030];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2114;
      v23 = CFSTR("CycleTrackingOnboardingTileDismissedDate");
      _os_log_impl(&dword_21961B000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v21 = v9;
    v22 = 2114;
    v23 = CFSTR("CycleTrackingOnboardingTileDismissedDate");
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_21961B000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
  }
  v10 = objc_alloc(MEMORY[0x24BE40AD0]);
  v11 = (void *)objc_msgSend(v10, "initWithCategory:domainName:profile:", 1, *MEMORY[0x24BE469D0], v5);
  v19 = 0;
  v12 = objc_msgSend(v11, "hdmc_setOnboardingTileLastDismissedTimeIntervalSinceReferenceDate:error:", v6, &v19);
  v13 = v19;
  v14 = v13;
  if ((v12 & 1) != 0)
  {

LABEL_8:
    v16 = 1;
    goto LABEL_14;
  }
  v17 = v13;
  if (v17)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError();
  }

  v16 = 0;
LABEL_14:

  return v16;
}

uint64_t __99__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenCycleChartRowsSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  os_log_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  os_log_t *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  _QWORD *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hk_safeDictionaryForKeyPath:error:", CFSTR("ShouldHideByChartDataTypeIdentifier"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = a1;
  objc_msgSend(*(id *)(a1 + 32), "hk_safeDictionaryForKeyPath:error:", CFSTR("ShouldHideByDisplayTypeIdentifier"), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x24BDBD1B8];
  if (v7)
    v9 = (void *)v7;
  v44 = v9;

  HKMCCycleChartMainTypes();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCSymptomSampleTypes();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_cycleChartsHiddenRowsDomainWithProfile:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (!v14)
  {
    v38 = 1;
    goto LABEL_32;
  }
  v15 = v14;
  v42 = a3;
  v43 = v5;
  v16 = (os_log_t *)MEMORY[0x24BDD3030];
  v17 = *(_QWORD *)v50;
LABEL_5:
  v18 = 0;
  v45 = v15;
  while (1)
  {
    if (*(_QWORD *)v50 != v17)
      objc_enumerationMutation(obj);
    v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v18);
    if (v6)
    {
      objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v18), "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v6;
LABEL_12:
      objc_msgSend(v21, "objectForKeyedSubscript:", v20, v42);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    HKMCDisplayTypeIdentifierForSampleType();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v44;
      goto LABEL_12;
    }
    v22 = 0;
LABEL_13:

    _HKInitializeLogging();
    v23 = *v16;
    v24 = os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT);
    if (v22)
      break;
    if (v24)
    {
      v35 = *(_QWORD *)(v46 + 40);
      v34 = v23;
      objc_msgSend(v19, "identifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v35;
      v55 = 2114;
      v56 = v36;
      _os_log_impl(&dword_21961B000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);

LABEL_20:
    }

    if (v15 == ++v18)
    {
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      v15 = v37;
      if (!v37)
      {
        v38 = 1;
        v5 = v43;
        goto LABEL_32;
      }
      goto LABEL_5;
    }
  }
  if (v24)
  {
    v25 = v6;
    v26 = v17;
    v27 = v13;
    v28 = v16;
    v29 = *(_QWORD *)(v46 + 40);
    v30 = v23;
    objc_msgSend(v19, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v29;
    v16 = v28;
    v13 = v27;
    v17 = v26;
    v6 = v25;
    v15 = v45;
    v55 = 2114;
    v56 = v31;
    v57 = 2114;
    v58 = v22;
    _os_log_impl(&dword_21961B000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v19, "identifier", v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v33 = objc_msgSend(v13, "setNumber:forKey:error:", v22, v32, &v48);
  v34 = v48;

  if ((v33 & 1) != 0)
    goto LABEL_20;
  v39 = v34;
  v40 = v39;
  v5 = v43;
  if (v39)
  {
    if (v42)
      *v42 = objc_retainAutorelease(v39);
    else
      _HKLogDroppedError();
  }

  v38 = 0;
LABEL_32:

  return v38;
}

uint64_t __96__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenLoggingRowsSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(void *, _QWORD, void *, void *, id *);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD aBlock[4];
  id v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenLoggingRowsSettingsWithUserDefaults___block_invoke_2;
  aBlock[3] = &unk_24DB22420;
  v35 = *(_QWORD *)(a1 + 40);
  v6 = v5;
  v34 = v6;
  v7 = (uint64_t (**)(void *, _QWORD, void *, void *, id *))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "hk_safeDictionaryIfExistsForKeyPath:error:", CFSTR("ShouldHideByDisplayTypeIdentifier"), 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x24BDBD1B8];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  HKMCAllDisplayTypeIdentifiers();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v13)
  {
    v14 = v13;
    v26 = a3;
    v27 = v6;
    v15 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v20 = v7[2](v7, v17, v18, v19, &v28);
        v21 = v28;

        if ((v20 & 1) == 0)
        {
          v23 = v21;
          v24 = v23;
          v6 = v27;
          if (v23)
          {
            if (v26)
              *v26 = objc_retainAutorelease(v23);
            else
              _HKLogDroppedError();
          }

          v22 = 0;
          goto LABEL_18;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v14)
        continue;
      break;
    }
    v22 = 1;
    v6 = v27;
  }
  else
  {
    v22 = 1;
  }
LABEL_18:

  return v22;
}

uint64_t __96__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenLoggingRowsSettingsWithUserDefaults___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  _HKInitializeLogging();
  v12 = *MEMORY[0x24BDD3030];
  v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v13)
    {
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2114;
      v27 = v11;
      _os_log_impl(&dword_21961B000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v25 = v14;
    v26 = 2114;
    v27 = v11;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_21961B000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "featureSettingsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDD2E28];
  v23 = 0;
  v17 = objc_msgSend(v15, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", v10, v11, v16, 0, &v23);
  v18 = v23;

  if ((v17 & 1) != 0)
  {

LABEL_8:
    v20 = 1;
    goto LABEL_14;
  }
  v21 = v18;
  if (v21)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v21);
    else
      _HKLogDroppedError();
  }

  v20 = 0;
LABEL_14:

  return v20;
}

uint64_t __106__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveToDeviationDetectionFeatureSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD *v25;
  id obj;
  uint64_t v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v28 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  HKMCAllDeviationTypes();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v5)
  {
    v6 = v5;
    v25 = a3;
    v7 = *(_QWORD *)v31;
    v27 = *MEMORY[0x24BDD2E30];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "integerValue");
        if (v10 >= 4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownType_%ld"), v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_24DB22440[v10];
        }
        objc_msgSend(*(id *)(a1 + 32), "hk_safeNumberForKeyPath:error:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        v13 = *MEMORY[0x24BDD3030];
        v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            v15 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138543874;
            v35 = v15;
            v36 = 2114;
            v37 = v11;
            v38 = 2114;
            v39 = v12;
            _os_log_impl(&dword_21961B000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating %{public}@: %{public}@", buf, 0x20u);
          }
          objc_msgSend(v28, "featureSettingsManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "integerValue");
          HKFeatureSettingsKeyForDeviationDetectionTypeEnabled();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          v18 = objc_msgSend(v16, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", v12, v17, v27, 0, &v29);
          v19 = v29;

          if ((v18 & 1) == 0)
          {
            v22 = v19;
            v23 = v22;
            if (v22)
            {
              if (v25)
                *v25 = objc_retainAutorelease(v22);
              else
                _HKLogDroppedError();
            }

            v21 = 0;
            goto LABEL_24;
          }

        }
        else if (v14)
        {
          v20 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v35 = v20;
          v36 = 2114;
          v37 = v11;
          _os_log_impl(&dword_21961B000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to migrate for %{public}@", buf, 0x16u);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v6)
        continue;
      break;
    }
  }
  v21 = 1;
LABEL_24:

  return v21;
}

@end
