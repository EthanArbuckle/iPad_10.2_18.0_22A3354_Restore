@implementation HDMobilityAnalyticsUtilities

+ (id)ageWithProfile:(id)a3 date:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v21;

  v8 = a4;
  v9 = (void *)MEMORY[0x24BDD3DC0];
  v10 = *MEMORY[0x24BDD2A88];
  v11 = a3;
  objc_msgSend(v9, "characteristicTypeForIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userCharacteristicsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(v13, "userCharacteristicForType:error:", v12, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BE46D88], "yearsBetweenStartDateComponents:endDate:", v14, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x24BDD3040];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
        +[HDMobilityAnalyticsUtilities ageWithProfile:date:error:].cold.2((uint64_t)a1, v17);
    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
      +[HDMobilityAnalyticsUtilities ageWithProfile:date:error:].cold.1((uint64_t)a1, (uint64_t)v15, v18);
    v19 = v15;
    if (v19)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }

  return v16;
}

+ (id)biologicalSexWithProfile:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD39A0];
  v7 = *MEMORY[0x24BDD2A78];
  v8 = a3;
  objc_msgSend(v6, "characteristicTypeForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userCharacteristicsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(v10, "userCharacteristicForType:error:", v9, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;

  if (v11)
  {
    v13 = v11;
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = a1;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_2160FB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unable to retrieve biological sex, returning not set: %{public}@", buf, 0x16u);
    }
    v15 = v12;
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    v13 = &unk_24D4E2260;
  }

  return v13;
}

+ (void)ageWithProfile:(uint64_t)a1 date:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_2160FB000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to read date of birth with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

+ (void)ageWithProfile:(uint64_t)a1 date:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2160FB000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to convert date of birth to a date", (uint8_t *)&v2, 0xCu);
}

@end
