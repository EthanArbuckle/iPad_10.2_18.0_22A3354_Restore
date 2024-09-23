@implementation HKHearingFeatures

+ (BOOL)isHeadphoneExposureNotificationsEnabled
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  if (_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled)
    return objc_msgSend((id)_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled, "BOOLValue");
  v4 = *MEMORY[0x24BE0A1E8];
  v5 = *MEMORY[0x24BE0A1E0];
  v15[0] = *MEMORY[0x24BE0A1E8];
  v15[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(a1, "_numbersForPreferenceKeys:error:", v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    v9 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v4, 0, v7), v7);
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x24BDD3000];
    v11 = *MEMORY[0x24BDD3000];
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled].cold.1();
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_2175BF000, v10, OS_LOG_TYPE_INFO, "Unable to read preferences %{public}@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_BOOLForPreferenceKey:(id)a3 defaultValue:(BOOL)a4 fromValues:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x24BDD3000];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      {
        v12 = v9;
        HKStringFromBool();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138544130;
        v15 = v7;
        v16 = 2114;
        v17 = v13;
        v18 = 2112;
        v19 = objc_opt_class();
        v20 = 2112;
        v21 = objc_opt_class();
        _os_log_fault_impl(&dword_2175BF000, v12, OS_LOG_TYPE_FAULT, "Error reading %{public}@ using defaultValue %{public}@: Unexpected class (expected %@, found %@)", (uint8_t *)&v14, 0x2Au);

      }
    }
    a4 = objc_msgSend(v8, "BOOLValue");
  }
  else
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_ERROR))
      +[HKHearingFeatures _BOOLForPreferenceKey:defaultValue:fromValues:].cold.1((uint64_t)v7, v10);
  }

  return a4;
}

+ (id)_numbersForPreferenceKeys:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a1, "_sharedAudioDataAnalysisManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPreferencesFor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_sharedAudioDataAnalysisManager
{
  if (_sharedAudioDataAnalysisManager_onceToken != -1)
    dispatch_once(&_sharedAudioDataAnalysisManager_onceToken, &__block_literal_global);
  return (id)_sharedAudioDataAnalysisManager_manager;
}

+ (void)startObservingForChanges
{
  id v2;

  v2 = (id)objc_msgSend(a1, "sharedInstance");
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HKHearingFeatures_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

+ (BOOL)isHeadphoneExposureMeasureLevelsEnabled
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE0A1E8];
  v4 = *MEMORY[0x24BE0A1A8];
  v11[0] = *MEMORY[0x24BE0A1E8];
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(a1, "_numbersForPreferenceKeys:error:", v5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v6)
  {
    if ((objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v3, 0, v6) & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v4, 0, v6);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled].cold.1();
    v8 = 0;
  }

  return v8;
}

+ (BOOL)areHeadphoneExposureNotificationsMandatory
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE0A1E8];
  v10[0] = *MEMORY[0x24BE0A1E8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(a1, "_numbersForPreferenceKeys:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    v7 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v3, 0, v5);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled].cold.1();
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isHeadphoneExposureNotificationsSupportedOnActiveWatch
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "activePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("FFF1DEA3-3FB3-43F8-B986-EAFC838148EA"));
    v4 = objc_msgSend(v2, "supportsCapability:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isHeadphoneExposureNotificationsEnabledOnActiveWatchWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "hasActivePairedDevice") & 1) != 0)
  {
    v5 = *MEMORY[0x24BE0A1E8];
    v6 = *MEMORY[0x24BE0A1E0];
    v11[0] = *MEMORY[0x24BE0A1E8];
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_numbersForWatchPreferenceKeys:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v6, objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, 0, v8), v8);
    }
    else
    {
      if (objc_msgSend(a1, "isHeadphoneExposureNotificationsSupportedOnActiveWatch"))
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 11, CFSTR("Unable to read preferences %@."), v7);
      else
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 110, CFSTR("Unable to read preferences %@. Feature not supported."), v7);
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 110, CFSTR("Unable to read preferences. No active watch."));
    return 0;
  }
  return v9;
}

+ (BOOL)isHeadphoneExposureMeasureLevelsEnabledOnActiveWatchWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "hasActivePairedDevice") & 1) != 0)
  {
    v5 = *MEMORY[0x24BE0A1E8];
    v6 = *MEMORY[0x24BE0A1A8];
    v11[0] = *MEMORY[0x24BE0A1E8];
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_numbersForWatchPreferenceKeys:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, 0, v8) & 1) != 0)
        v9 = 1;
      else
        v9 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v6, 0, v8);
    }
    else
    {
      if (objc_msgSend(a1, "isHeadphoneExposureNotificationsSupportedOnActiveWatch"))
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 11, CFSTR("Unable to read preferences %@."), v7);
      else
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 110, CFSTR("Unable to read preferences %@. Feature not supported."), v7);
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 110, CFSTR("Unable to read preferences. No active watch."));
    return 0;
  }
  return v9;
}

+ (BOOL)areHeadphoneExposureNotificationsMandatoryOnActiveWatchWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "hasActivePairedDevice") & 1) != 0)
  {
    v5 = *MEMORY[0x24BE0A1E8];
    v10[0] = *MEMORY[0x24BE0A1E8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_numbersForWatchPreferenceKeys:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, 0, v7);
    }
    else
    {
      if (objc_msgSend(a1, "isHeadphoneExposureNotificationsSupportedOnActiveWatch"))
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 11, CFSTR("Unable to read preferences %@."), v6);
      else
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 110, CFSTR("Unable to read preferences %@. Feature not supported."), v6);
      v8 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 110, CFSTR("Unable to read preferences. No active watch."));
    return 0;
  }
  return v8;
}

+ (BOOL)_setHeadphoneExposureNotificationsEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  id v9;

  v5 = a3;
  v6 = *MEMORY[0x24BE0A1E0];
  v9 = 0;
  objc_msgSend(a1, "setBoolForPreferenceKey:newValue:forPairedWatch:error:", v6, v5, 0, &v9);
  v7 = v9;
  if (v7)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  return v7 == 0;
}

+ (BOOL)_setHeadphoneExposureMeasureLevelsEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  id v9;

  v5 = a3;
  v6 = *MEMORY[0x24BE0A1A8];
  v9 = 0;
  objc_msgSend(a1, "setBoolForPreferenceKey:newValue:forPairedWatch:error:", v6, v5, 0, &v9);
  v7 = v9;
  if (v7)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  return v7 == 0;
}

+ (BOOL)_setHeadphoneExposureNotificationsEnabledOnActiveWatch:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  id v9;

  v5 = a3;
  v6 = *MEMORY[0x24BE0A1E0];
  v9 = 0;
  objc_msgSend(a1, "setBoolForPreferenceKey:newValue:forPairedWatch:error:", v6, v5, 1, &v9);
  v7 = v9;
  if (v7)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  return v7 == 0;
}

+ (BOOL)_setHeadphoneExposureMeasureLevelsEnabledOnActiveWatch:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  id v9;

  v5 = a3;
  v6 = *MEMORY[0x24BE0A1A8];
  v9 = 0;
  objc_msgSend(a1, "setBoolForPreferenceKey:newValue:forPairedWatch:error:", v6, v5, 1, &v9);
  v7 = v9;
  if (v7)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  return v7 == 0;
}

+ (BOOL)_isHeadphoneExposureDataTransient
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  char v9;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE0A1E8];
  v4 = *MEMORY[0x24BE0A200];
  v12[0] = *MEMORY[0x24BE0A1E8];
  v12[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(a1, "_numbersForPreferenceKeys:error:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v8 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v3, 0, v6);
    v9 = 0;
    if (v8)
      v9 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v4, 0, v6);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_isMeasureOtherHeadphonesEnabled
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  int v10;
  id v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE0A1E8];
  v4 = *MEMORY[0x24BE0A1A8];
  v13[0] = *MEMORY[0x24BE0A1E8];
  v13[1] = v4;
  v5 = *MEMORY[0x24BE0A1B0];
  v13[2] = *MEMORY[0x24BE0A1B0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(a1, "_numbersForPreferenceKeys:error:", v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    if ((objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v3, 0, v7) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v10 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v4, 0, v7);
      v9 = 0;
      if (v10)
        v9 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, 0, v7);
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      +[HKHearingFeatures isHeadphoneExposureNotificationsEnabled].cold.1();
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_isHeadphoneExposureDataTransientOnActiveWatchWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "hasActivePairedDevice") & 1) != 0)
  {
    v5 = *MEMORY[0x24BE0A1E8];
    v6 = *MEMORY[0x24BE0A200];
    v11[0] = *MEMORY[0x24BE0A1E8];
    v11[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_numbersForWatchPreferenceKeys:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = 0;
      if (objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, 0, v8))
        v9 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v6, 0, v8);
    }
    else
    {
      if (objc_msgSend(a1, "isHeadphoneExposureNotificationsSupportedOnActiveWatch"))
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 11, CFSTR("Unable to read preferences %@."), v7);
      else
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 110, CFSTR("Unable to read preferences %@. Feature not supported."), v7);
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 110, CFSTR("Unable to read preferences. No active watch."));
    return 0;
  }
  return v9;
}

+ (BOOL)_isMeasureOtherHeadphonesEnabledOnActiveWatchWithError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(a1, "hasActivePairedDevice") & 1) != 0)
  {
    v5 = *MEMORY[0x24BE0A1E8];
    v6 = *MEMORY[0x24BE0A1A8];
    v12[0] = *MEMORY[0x24BE0A1E8];
    v12[1] = v6;
    v7 = *MEMORY[0x24BE0A1B0];
    v12[2] = *MEMORY[0x24BE0A1B0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_numbersForWatchPreferenceKeys:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v5, 0, v9) & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v6, 0, v9))
          v10 = objc_msgSend(a1, "_BOOLForPreferenceKey:defaultValue:fromValues:", v7, 0, v9);
      }
    }
    else
    {
      if (objc_msgSend(a1, "isHeadphoneExposureNotificationsSupportedOnActiveWatch"))
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 11, CFSTR("Unable to read preferences %@."), v8);
      else
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a3, 110, CFSTR("Unable to read preferences %@. Feature not supported."), v8);
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 110, CFSTR("Unable to read preferences. No active watch."));
    return 0;
  }
  return v10;
}

+ (void)unitTesting_overrideIsHeadphoneExposureNotificationsEnabled:(id)a3
{
  id v5;
  _BOOL4 v6;
  void *v7;
  objc_class *v8;
  objc_method *InstanceMethod;
  objc_method *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = _unitTesting_overrideIsHeadphoneExposureNotificationsEnabled == 0;
  objc_storeStrong((id *)&_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled, a3);
  if (((v6 ^ (_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled != 0)) & 1) == 0)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v7 = (void *)getHAENDefaultsClass_softClass;
    v15 = getHAENDefaultsClass_softClass;
    if (!getHAENDefaultsClass_softClass)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getHAENDefaultsClass_block_invoke;
      v11[3] = &unk_24D7BD658;
      v11[4] = &v12;
      __getHAENDefaultsClass_block_invoke((uint64_t)v11);
      v7 = (void *)v13[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v12, 8);
    InstanceMethod = class_getInstanceMethod(v8, sel_isHAENFeatureEnabled);
    v10 = class_getInstanceMethod((Class)a1, sel_swizzled_isHAENFeatureEnabled);
    method_exchangeImplementations(InstanceMethod, v10);
  }

}

- (BOOL)swizzled_isHAENFeatureEnabled
{
  return objc_msgSend((id)_unitTesting_overrideIsHeadphoneExposureNotificationsEnabled, "BOOLValue");
}

+ (BOOL)unitTesting_simulateLocalHeadphonePlayback
{
  return objc_msgSend((id)_unitTesting_simulateLocalHeadphonePlayback, "BOOLValue");
}

+ (void)unitTesting_overrideSimulateLocalHeadphonePlayback:(id)a3
{
  objc_storeStrong((id *)&_unitTesting_simulateLocalHeadphonePlayback, a3);
}

+ (BOOL)unitTesting_forceDefaultHeadphoneDataCollectionInterval
{
  return objc_msgSend((id)_unitTesting_forceDefaultHeadphoneDataCollectionInterval, "BOOLValue");
}

+ (void)unitTesting_overrideForceDefaultHeadphoneDataCollectionInterval:(id)a3
{
  objc_storeStrong((id *)&_unitTesting_forceDefaultHeadphoneDataCollectionInterval, a3);
}

void __35__HKHearingFeatures_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (HKHearingFeatures)init
{
  HKHearingFeatures *v2;
  HKHearingFeatures *v3;
  HKHearingFeatures *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKHearingFeatures;
  v2 = -[HKHearingFeatures init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HKHearingFeatures _startObservingForChanges](v2, "_startObservingForChanges");
    -[HKHearingFeatures _startObservingForChangesOnActiveWatch](v3, "_startObservingForChangesOnActiveWatch");
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[HKHearingFeatures _stopObservingForChanges](self, "_stopObservingForChanges");
  v3.receiver = self;
  v3.super_class = (Class)HKHearingFeatures;
  -[HKHearingFeatures dealloc](&v3, sel_dealloc);
}

- (void)_startObservingForChanges
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2175BF000, v3, OS_LOG_TYPE_DEFAULT, "Starting observation for HKHearingFeatures changes to current device.", v5, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_adasPreferenceDidChange, (CFStringRef)*MEMORY[0x24BE0A158], 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_startObservingForChangesOnActiveWatch
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2175BF000, v3, OS_LOG_TYPE_DEFAULT, "Starting observation for HKHearingFeatures changes to active watch.", v5, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_adasPreferenceDidChange, (CFStringRef)*MEMORY[0x24BE0A170], 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_stopObservingForChanges
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2175BF000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering for HKHearingFeatures changes.", v5, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_adasPreferenceDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("HKHearingFeatureHeadphoneExposureNotificationsEnabledDidChange"), self, v5);

}

+ (id)_numbersForPreferenceKeys:(id)a3 fromActiveWatch:(BOOL)a4
{
  if (a4)
    objc_msgSend(a1, "_numbersForWatchPreferenceKeys:", a3);
  else
    objc_msgSend(a1, "_numbersForPhonePreferenceKeys:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_numbersForPhonePreferenceKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_sharedAudioDataAnalysisManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPreferencesFor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_numbersForWatchPreferenceKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_sharedAudioDataAnalysisManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNanoPreferencesFor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_setBoolForPreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5
{
  id v6;
  id v8;

  v8 = 0;
  objc_msgSend(a1, "_setBoolForPhonePreferenceKey:newValue:error:", a3, a4, &v8);
  v6 = v8;
  if (v6)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();
  }

  return v6 == 0;
}

+ (BOOL)_setBoolForPhonePreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v8 = (objc_class *)MEMORY[0x24BDD16E0];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithBool:", v6);
  objc_msgSend(a1, "_sharedAudioDataAnalysisManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreferenceFor:value:notify:", v9, v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
  }

  return v13 == 0;
}

+ (BOOL)_setBoolForWatchPreferenceKey:(id)a3 newValue:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v8 = (objc_class *)MEMORY[0x24BDD16E0];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithBool:", v6);
  objc_msgSend(a1, "_sharedAudioDataAnalysisManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNanoPreferenceFor:value:notify:", v9, v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    else
      _HKLogDroppedError();
  }

  return v13 == 0;
}

void __52__HKHearingFeatures__sharedAudioDataAnalysisManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE0A230]);
  v1 = (void *)_sharedAudioDataAnalysisManager_manager;
  _sharedAudioDataAnalysisManager_manager = (uint64_t)v0;

}

+ (BOOL)setBoolForPreferenceKey:(id)a3 newValue:(BOOL)a4 forPairedWatch:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id *v18;
  id v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD v26[3];

  v7 = a5;
  v8 = a4;
  v26[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v12 = *MEMORY[0x24BE0A1A8];
  v26[0] = *MEMORY[0x24BE0A1E0];
  v11 = v26[0];
  v26[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a6, 3, CFSTR("Preference key not supported %@"), v10);
LABEL_21:
    v20 = 0;
    goto LABEL_22;
  }
  if (v7)
  {
    v24 = 0;
    v15 = objc_msgSend(a1, "areHeadphoneExposureNotificationsMandatoryOnActiveWatchWithError:", &v24);
    v16 = v24;
    if (v16)
    {
      v17 = v16;
      if (a6)
        *a6 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();

      goto LABEL_21;
    }
    if (!v15 || (objc_msgSend(v14, "containsObject:", v10) & 1) != 0)
    {
      v23 = 0;
      v18 = (id *)&v23;
      objc_msgSend(a1, "_setBoolForWatchPreferenceKey:newValue:error:", v10, v8, &v23);
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  if ((objc_msgSend(a1, "areHeadphoneExposureNotificationsMandatory") & 1) != 0
    && (objc_msgSend(v14, "containsObject:", v10) & 1) == 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a6, 110, CFSTR("Property can not be set when feature is mandatory."));
    goto LABEL_21;
  }
  v22 = 0;
  v18 = (id *)&v22;
  objc_msgSend(a1, "_setBoolForPreferenceKey:newValue:error:", v10, v8, &v22);
LABEL_13:
  v19 = *v18;
  v20 = v19 == 0;
  if (v19)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();
  }

LABEL_22:
  return v20;
}

+ (id)activePairedDevice
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE6B4D8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)hasActivePairedDevice
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "activePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (void)isHeadphoneExposureNotificationsEnabled
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2175BF000, v0, v1, "Unable to read preferences %{public}@: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)_BOOLForPreferenceKey:(uint64_t)a1 defaultValue:(void *)a2 fromValues:.cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKStringFromBool();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = a1;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_2175BF000, v3, OS_LOG_TYPE_ERROR, "Missing preference for %{public}@, using defaultValue %{public}@.", (uint8_t *)&v5, 0x16u);

}

@end
