@implementation HKElectrocardiogramActiveAlgorithmVersion

+ (id)versionWithHealthStore:(id)a3 error:(id *)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v17;

  v6 = a3;
  v7 = CFSTR("HKElectrocardiogramOnboardingCompleted");
  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !objc_msgSend(v9, "integerValue"))
  {
    +[HKKeyValueDomain heartRhythmDefaultsDomainWithHealthStore:](HKKeyValueDomain, "heartRhythmDefaultsDomainWithHealthStore:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v12, "numberForKey:error:", v7, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    if (v13 && objc_msgSend(v13, "integerValue"))
    {
      objc_msgSend(a1, "knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:", v13, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
    if (v14)
    {
      _HKInitializeLogging();
      v15 = HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
      {
        +[HKElectrocardiogramActiveAlgorithmVersion versionWithHealthStore:error:].cold.1((uint64_t)v7, (uint64_t)v14, v15);
        if (a4)
          goto LABEL_10;
      }
      else if (a4)
      {
LABEL_10:
        v11 = 0;
        *a4 = objc_retainAutorelease(v14);
        goto LABEL_13;
      }
    }
    v11 = 0;
    goto LABEL_13;
  }
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "algorithmVersionForOnboardingVersion:", v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v11;
}

+ (id)knownAlgorithmVersionFromOnboardedVersion:(id)a3 keyValueDomain:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int64_t v18;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = +[HKElectrocardiogramActiveAlgorithmVersion algorithmVersionForOnboardingVersion:](HKElectrocardiogramActiveAlgorithmVersion, "algorithmVersionForOnboardingVersion:", objc_msgSend(a3, "integerValue"));
  objc_msgSend(a1, "_maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  if (v9)
  {
    if (v7 == 0x7FFFFFFF)
    {
      _HKInitializeLogging();
      v10 = HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136446210;
        v21 = "+[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:]";
        _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s] Alg version validation: Sync'd alg version is greater than max previously onboarded and known to build.", (uint8_t *)&v20, 0xCu);
      }
      v11 = v8;
    }
    else
    {
      v14 = v9;
      _HKInitializeLogging();
      v15 = HKLogHeartRhythm;
      v16 = os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT);
      if (v7 >= v14)
      {
        if (v16)
        {
          v20 = 136446210;
          v21 = "+[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:]";
          _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}s] Alg version validation: Sync'd alg version is known to this build and not smaller than any version previously onboarded.", (uint8_t *)&v20, 0xCu);
        }
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v18 = v7;
      }
      else
      {
        if (v16)
        {
          v20 = 136446210;
          v21 = "+[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:]";
          _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}s] Alg version validation: Sync'd alg version is less than max previously onboarded and known to build.", (uint8_t *)&v20, 0xCu);
        }
        v17 = (void *)MEMORY[0x1E0CB37E8];
        v18 = v14;
      }
      objc_msgSend(v17, "numberWithInteger:", v18);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;
  }
  else
  {
    _HKInitializeLogging();
    v12 = HKLogHeartRhythm;
    if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136446210;
      v21 = "+[HKElectrocardiogramActiveAlgorithmVersion knownAlgorithmVersionFromOnboardedVersion:keyValueDomain:]";
      _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}s] Alg version validation: Known onboarding history is empty.", (uint8_t *)&v20, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)_maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  NSObject *v9;

  +[HKHeartRhythmAvailability electrocardiogramOnboardingHistoryMaxKnownWithKeyValueDomain:](HKHeartRhythmAvailability, "electrocardiogramOnboardingHistoryMaxKnownWithKeyValueDomain:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    v7 = +[HKElectrocardiogramActiveAlgorithmVersion algorithmVersionForOnboardingVersion:](HKElectrocardiogramActiveAlgorithmVersion, "algorithmVersionForOnboardingVersion:", v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      _HKInitializeLogging();
      v9 = HKLogHeartRhythm;
      if (os_log_type_enabled((os_log_t)HKLogHeartRhythm, OS_LOG_TYPE_ERROR))
        +[HKElectrocardiogramActiveAlgorithmVersion _maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:].cold.1(v9);
    }
    v8 = 0;
  }

  return v8;
}

+ (int64_t)algorithmVersionForOnboardingVersion:(int64_t)a3
{
  int64_t *v3;

  if (!a3)
  {
    v3 = &_HKAppleECGAlgorithmVersionUnknown;
    return *v3;
  }
  if ((unint64_t)a3 >= 5)
  {
    v3 = &_HKAppleECGAlgorithmVersionGreaterThanMax;
    return *v3;
  }
  if (a3 == 4)
    return 2;
  else
    return 1;
}

+ (unint64_t)onboardingVersionForKnownAlgorithmVersion:(int64_t)a3
{
  if (a3 == 1)
    return 3;
  else
    return 4 * (a3 == 2);
}

+ (void)versionWithHealthStore:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "Couldn't read heart rhythm onboarding completion state for key [%@]: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)_maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "+[HKElectrocardiogramActiveAlgorithmVersion _maxKnownAlgorithmVersionOnboardedWithKeyValueDomain:]";
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "[%{pulic}s] More than one max alg version previously onboarded and known to the build.", (uint8_t *)&v1, 0xCu);
}

@end
