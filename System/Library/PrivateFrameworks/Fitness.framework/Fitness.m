uint64_t FIDeviceMeetsMinimumOSVersion(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _Unwind_Exception *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getNRPairedDeviceRegistryClass(), "activePairedDeviceSelectorBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v12 = 0;
    goto LABEL_10;
  }
  v6 = v5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v7 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  v18 = getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr;
  if (!getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr)
  {
    v8 = (void *)NanoRegistryLibrary();
    v7 = dlsym(v8, "NRWatchOSVersionForRemoteDevice");
    v16[3] = (uint64_t)v7;
    getNRWatchOSVersionForRemoteDeviceSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v15, 8);
  if (!v7)
  {
    FIIsDeviceSatellitePaired_cold_1();
    goto LABEL_12;
  }
  v9 = ((uint64_t (*)(id))v7)(v6);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v10 = getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  v18 = getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr;
  if (!getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr)
  {
    v11 = (void *)NanoRegistryLibrary();
    v10 = dlsym(v11, "NRVersionIsGreaterThanOrEqual");
    v16[3] = (uint64_t)v10;
    getNRVersionIsGreaterThanOrEqualSymbolLoc_ptr = v10;
  }
  _Block_object_dispose(&v15, 8);
  if (!v10)
  {
LABEL_12:
    v14 = (_Unwind_Exception *)FIIsDeviceSatellitePaired_cold_1();
    _Block_object_dispose(&v15, 8);
    _Unwind_Resume(v14);
  }
  v12 = ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, a1);
LABEL_10:

  return v12;
}

id getNRPairedDeviceRegistryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_24CC4F2B8;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_211691DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  Class result;

  NanoRegistryLibrary();
  result = objc_getClass("NRPairedDeviceRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNRPairedDeviceRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    return (Class)NanoRegistryLibrary();
  }
  return result;
}

uint64_t NanoRegistryLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NanoRegistryLibraryCore_frameworkLibrary)
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = NanoRegistryLibraryCore_frameworkLibrary;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_211692464(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t FIExperienceTypeWithHealthStore(void *a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v7[8];
  id v8;

  v8 = 0;
  objc_msgSend(a1, "dateOfBirthComponentsWithError:", &v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v8;
  if (v2)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21168F000, v3, OS_LOG_TYPE_DEFAULT, "Unable to fetch date of birth, unable to determine fitness experience type", v7, 2u);
    }
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = FIExperienceTypeForBirthDateComponents(v1, v5);

  }
  return v4;
}

uint64_t FIExperienceTypeForBirthDateComponents(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar(v5, v6, v4);

  v8 = 2;
  if (v7 <= 9)
    v8 = 3;
  if (v7 > 12)
    v9 = 1;
  else
    v9 = v8;

  return v9;
}

uint64_t FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x24BDBCE48];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "hk_gregorianCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "components:fromDate:toDate:options:", 4, v10, v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "year");
  return v12;
}

uint64_t FIDeviceMeetsMinimumOSVersionDaytona()
{
  return FIDeviceMeetsMinimumOSVersion(196608);
}

void FIActivityAnalyticsSubmission(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11[0] = a3;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA(v8, v9, 1);
}

void FIActivityAnalyticsSubmissionWithPayload(void *a1, void *a2)
{
  FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA(a1, a2, 1);
}

void FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (a3
    && (objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isHealthDataSubmissionAllowed"),
        v7,
        !v8))
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_21168F000, v9, OS_LOG_TYPE_DEFAULT, "[#analytics] health data submission not allowed. Not sending analytics for event: %@", buf, 0xCu);
    }
  }
  else
  {
    v10 = v5;
    v11 = v6;
    AnalyticsSendEventLazy();

  }
}

uint64_t _ValidateSample(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = objc_msgSend(v7, "fi_overlapsStartDate:endDate:", v8, v9);
  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sample %@ does not overlap with startDate:%@ endDate: %@"), v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FIIntervalErrorWithDescription(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FISetOutErrorIfNotNull(a4, v12);

  }
  return v10;
}

void sub_211694788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_211694CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_211695254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_2116957B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_211695D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

unint64_t activitySummaryIndexForReporting()
{
  void *v0;
  unint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = activitySummaryIndexForReportingForDate(v0);

  return v1;
}

unint64_t activitySummaryIndexForReportingForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "hk_gregorianCalendarWithUTCTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayForDate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, -2, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = llround(v6);

  return v7;
}

id FIActivitySummaryForSummaryIndex(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40A10]), "initWithProfile:", v5);
  objc_msgSend(v6, "setShouldIncludePrivateProperties:", 0);
  HDActivityCacheEntityPredicateForCacheIndex();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __FIActivitySummaryForSummaryIndex_block_invoke;
  v10[3] = &unk_24CC4E690;
  v10[4] = &v11;
  v10[5] = a2;
  objc_msgSend(v6, "enumerateActivitySummariesWithPredicate:error:handler:", v7, a3, v10);
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_211696240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile(void *a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[8];
  id v17;

  v17 = 0;
  FIActivitySummaryForSummaryIndex(a1, a2, (uint64_t)&v17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v17;
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v2, "_standHoursCompletionPercentage");
    v6 = v5;
    objc_msgSend(v2, "_exerciseTimeCompletionPercentage");
    v8 = 2;
    if (v6 < 1.0)
      v8 = 1;
    if (v7 >= 1.0)
      v9 = v8;
    else
      v9 = v6 >= 1.0;
    objc_msgSend(v2, "_activeEnergyCompletionPercentage");
    if (v10 >= 1.0 || (objc_msgSend(v2, "_moveMinutesCompletionPercentage"), v11 >= 1.0))
      ++v9;
  }
  else
  {
    if (v3)
    {
      v12 = objc_msgSend(v3, "hk_isDatabaseAccessibilityError");
      _HKInitializeLogging();
      v13 = *MEMORY[0x24BDD2FC8];
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_1();
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_2();
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x24BDD2FC8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_21168F000, v14, OS_LOG_TYPE_DEFAULT, "No activity summary found for yesterday", v16, 2u);
      }
    }
    v9 = -1;
  }

  return v9;
}

id FIActivitySummaryAnalyticsPayloadForProfileAndSummaryCacheIndex(void *a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  _BOOL8 v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  NSObject *v34;
  uint8_t v36[16];
  id v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  FIActivitySummaryForSummaryIndex(a1, a2, (uint64_t)&v37);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v37;
  v4 = v3;
  if (v2)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCED8]);
    v38[0] = CFSTR("isMoveRingClosed");
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v2, "_activeEnergyCompletionPercentage");
    if (v7 >= 1.0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v2, "_moveMinutesCompletionPercentage");
      v9 = v8 >= 1.0;
    }
    objc_msgSend(v6, "numberWithInt:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = CFSTR("dailyGoalPaused");
    v39[0] = v12;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v2, "isPaused"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v5, "initWithDictionary:", v14);

    objc_msgSend(v2, "standHoursGoal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v2, "_standHoursCompletionPercentage");
      objc_msgSend(v17, "numberWithInt:", v18 >= 1.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("isStandRingClosed"));

      v20 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v2, "standHoursGoal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValueForUnit:", v22);
      objc_msgSend(v20, "numberWithInt:", v23 != 12.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("customizedStand"));

    }
    objc_msgSend(v2, "exerciseTimeGoal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v2, "_exerciseTimeCompletionPercentage");
      objc_msgSend(v26, "numberWithInt:", v27 >= 1.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, CFSTR("isExerciseRingClosed"));

      v29 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v2, "exerciseTimeGoal");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValueForUnit:", v31);
      objc_msgSend(v29, "numberWithInt:", v32 != 30.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, CFSTR("customizedExercise"));

    }
  }
  else
  {
    if (v3)
    {
      v10 = objc_msgSend(v3, "hk_isDatabaseAccessibilityError");
      _HKInitializeLogging();
      v11 = *MEMORY[0x24BDD2FC8];
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_1();
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_2();
      }
    }
    else
    {
      _HKInitializeLogging();
      v34 = *MEMORY[0x24BDD2FC8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_21168F000, v34, OS_LOG_TYPE_DEFAULT, "No activity summary found for yesterday", v36, 2u);
      }
    }
    v15 = 0;
  }

  return v15;
}

uint64_t FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _HKActivityCacheDateComponentsFromCacheIndex();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateFromComponents:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startOfDayForDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_dateByAddingDays:toDate:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE40E48];
  v6 = (void *)MEMORY[0x24BE40E18];
  v7 = *MEMORY[0x24BE40940];
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:greaterThanOrEqualToValue:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE40E18];
  v12 = *MEMORY[0x24BE40948];
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithProperty:lessThanValue:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compoundPredicateWithPredicate:otherPredicate:", v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE40D00], "entityEnumeratorWithProfile:", v1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPredicate:", v16);
  objc_msgSend(v17, "setLimitCount:", 1);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v26[4] = &v28;
  v27 = 0;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_block_invoke;
  v26[3] = &unk_24CC4E6B8;
  v18 = objc_msgSend(v17, "enumerateWithError:handler:", &v27, v26);
  v19 = v27;
  v20 = v19;
  if (v19)
    v21 = v18;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
  {
    if (objc_msgSend(v19, "hk_isDatabaseAccessibilityError"))
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_DEBUG))
        FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_cold_1();
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC8], OS_LOG_TYPE_ERROR))
        FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_cold_2();
    }
  }
  v22 = *((unsigned __int8 *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v22;
}

void sub_211696AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id FISampleQuantityInsideDateInterval(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;

  v5 = a1;
  v6 = (objc_class *)MEMORY[0x24BDD1508];
  v7 = a2;
  v8 = [v6 alloc];
  objc_msgSend(v5, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);

  objc_msgSend(v11, "intersectionWithDateInterval:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v11, "duration"), v13 >= 2.22044605e-16))
  {
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    objc_msgSend(v12, "duration");
    v21 = v20;
    objc_msgSend(v11, "duration");
    v23 = v21 / v22;
    objc_msgSend(v5, "quantity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quantity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_unit");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValueForUnit:", v26);
    v28 = v23 * v27;

    v29 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(v5, "quantity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_unit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v29;
    v19 = v16;
    v17 = v28;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(v5, "quantity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_unit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0.0;
    v18 = v14;
    v19 = v16;
  }
  objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19, v17);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

id FIFilterPauseResumeEvents(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v8, "type", (_QWORD)v11) - 1) <= 1)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(v2, "copy");
  return v9;
}

id FISortEventsByDate(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithArray:", v2);

  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_0);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

id FIFilterSamplesByType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "quantityType", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

id FISortSamplesByDate(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithArray:", v2);

  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_187);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

id FIThresholdDateInsideSample(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;

  v7 = a3;
  v8 = a2;
  v9 = a1;
  objc_msgSend(v9, "quantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_unit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "quantity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", v11);
  v14 = v13;

  objc_msgSend(v8, "doubleValueForUnit:", v11);
  v16 = v15;

  objc_msgSend(v7, "doubleValueForUnit:", v11);
  v18 = v17;

  v19 = (v14 - (v16 - v18)) / v14;
  objc_msgSend(v9, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v21);
  v23 = v22;

  v24 = v19 * v23;
  if (a4)
  {
    objc_msgSend(v9, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = -v24;
    v27 = v25;
  }
  else
  {
    objc_msgSend(v9, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v25;
    v26 = v24;
  }
  objc_msgSend(v27, "dateByAddingTimeInterval:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_5()
{
  uint64_t v0;

  return v0;
}

id FILocalizedNameForIndoorAgnosticActivityType()
{
  void *v0;
  void *v1;
  void *v2;

  FIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _HKWorkoutActivityNameForActivityType();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", v1, &stru_24CC50B10, CFSTR("Localizable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FILocalizedActivityNameWithWorkout(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;

  v3 = a1;
  v4 = objc_msgSend(v3, "workoutActivityType");
  v5 = objc_msgSend(v3, "fi_swimmingLocationType");
  objc_msgSend(v3, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(v4, v5, 0, v8, a2, &stru_24CC50B10, 0);
}

id FILocalizedActivityNameWithFormatting(uint64_t a1, unint64_t a2, int a3, int a4)
{
  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, a4, &stru_24CC50B10, 0);
}

id FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(uint64_t a1, unint64_t a2, int a3, int a4, int a5, void *a6, int a7)
{
  id v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;

  v13 = a6;
  if ((unint64_t)(a1 - 13) <= 0x3B)
  {
    if (((1 << (a1 - 13)) & 0xEB4508095401889) != 0)
      goto LABEL_3;
    if (a1 == 46)
    {
      if (a2 >= 3)
        v16 = 0;
      else
        v16 = off_24CC4E7A0[a2];
      goto LABEL_8;
    }
  }
  if ((unint64_t)(a1 - 77) <= 7)
  {
    if (((1 << (a1 - 77)) & 0xA9) != 0)
      goto LABEL_3;
    if (a1 == 83)
    {
      v16 = CFSTR("ACTIVITY_TRANSITION");
      goto LABEL_8;
    }
  }
  if (a1 != 3000)
  {
    FILocalizedNameForIndoorAgnosticActivityType();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      if (v13)
      {
        objc_msgSend(v13, "stringByAppendingString:", CFSTR("ACTIVITY_OTHER_FORMAT_%@"));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = CFSTR("ACTIVITY_OTHER_FORMAT_%@");
      }
      v26 = (void *)MEMORY[0x24BDD17C8];
      FIBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", v22, &stru_24CC50B10, CFSTR("Localizable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v28, v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = CFSTR("ACTIVITY_OTHER_FORMAT_%@");
      goto LABEL_19;
    }
    _HKWorkoutActivityNameForActivityType();
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_3:
  if (a3)
    FILocalizationKeyForHKWorkoutActivityType(a1);
  else
    FILocalizationKeyForHKWorkoutActivityTypeAndIsIndoor(a1, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ACTIVITY_"), "stringByAppendingString:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v16 = (__CFString *)v15;

LABEL_8:
  v17 = &stru_24CC50B10;
  if (v16)
    v17 = v16;
  v18 = v17;

  if (v13)
  {
    objc_msgSend(v13, "stringByAppendingString:", v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v18;
  }
  v14 = v19;
  if (a7)
  {
    -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR("_PLURAL"));
    v20 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v20;
  }
  FIBundle();
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a1 == 46)
    v23 = CFSTR("Localizable-Ariel");
  else
    v23 = CFSTR("Localizable");
  -[__CFString localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", v14, &stru_24CC50B10, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v24;
}

id FILocalizedActivityNameWithFormattingPrefix(uint64_t a1, unint64_t a2, int a3, int a4, void *a5)
{
  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, a4, a5, 0);
}

id FILocalizedNameForActivityType(uint64_t a1, unint64_t a2, int a3)
{
  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, 0, &stru_24CC50B10, 0);
}

id FILocalizedNameForActivityTypePlural(uint64_t a1, unint64_t a2, int a3)
{
  return FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, 0, &stru_24CC50B10, 1);
}

id FILapsShortDescriptionWithLapCount(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  FIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LAPS_SHORT_DESCRIPTION"), &stru_24CC50B10, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FIFlightsShortDescriptionWithFlightsCount(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  FIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FLIGHTS_COUNT_SHORT_DESCRIPTION"), &stru_24CC50B10, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FIPowerShortDescriptionWithPower(double a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  FIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("POWER_SHORT_DESCRIPTION"), &stru_24CC50B10, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4, *(_QWORD *)&a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *FILocalizedStrokeStyleName(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  __CFString *v4;

  switch(a1)
  {
    case 0:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("STROKE_STYLE_UNKNOWN");
      goto LABEL_10;
    case 1:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("STROKE_STYLE_MIXED");
      goto LABEL_10;
    case 2:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("STROKE_STYLE_FREESTYLE");
      goto LABEL_10;
    case 3:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("STROKE_STYLE_BACKSTROKE");
      goto LABEL_10;
    case 4:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("STROKE_STYLE_BREASTSTROKE");
      goto LABEL_10;
    case 5:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("STROKE_STYLE_BUTTERFLY");
      goto LABEL_10;
    case 6:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("STROKE_STYLE_KICKBOARD");
LABEL_10:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_24CC50B10, CFSTR("Localizable-Ariel"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = CFSTR("STROKE_STYLE_NAME_UNIMPLEMENTED");
      break;
  }
  return v4;
}

id FILocalizedActivityNameComponentsWithFormatting(uint64_t a1, unint64_t a2, int a3, int a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  if (a1 == 71)
  {
    FIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_WHEELCHAIR_RUN_PACE_LINE1"), &stru_24CC50B10, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    FIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_WHEELCHAIR_RUN_PACE_LINE2"), &stru_24CC50B10, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v8;
    v9 = (void *)MEMORY[0x24BDBCE30];
    v10 = v19;
    goto LABEL_5;
  }
  if (a1 == 70)
  {
    FIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_WHEELCHAIR_WALK_PACE_LINE1"), &stru_24CC50B10, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    FIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_WHEELCHAIR_WALK_PACE_LINE2"), &stru_24CC50B10, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v8;
    v9 = (void *)MEMORY[0x24BDBCE30];
    v10 = v20;
LABEL_5:
    objc_msgSend(v9, "arrayWithObjects:count:", v10, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (a4)
  {
    FIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACTIVITY_OTHER"), &stru_24CC50B10, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, 0, &stru_24CC50B10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    FILocalizedActivityNameWithFormattingPrefixAndIsLocationAgnosticPlural(a1, a2, 0, a3, 0, &stru_24CC50B10, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:

  return v11;
}

__CFString *FILocalizedMachineName(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  __CFString *v4;

  switch(a1)
  {
    case 0:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CONNECTED_GYM_MACHINE_UNKNOWN");
      goto LABEL_10;
    case 1:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CONNECTED_GYM_MACHINE_TREADMILL");
      goto LABEL_10;
    case 2:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CONNECTED_GYM_MACHINE_ELLIPTICAL");
      goto LABEL_10;
    case 3:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CONNECTED_GYM_MACHINE_STEPCLIMBER");
      goto LABEL_10;
    case 4:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CONNECTED_GYM_MACHINE_STAIRCLIMBER");
      goto LABEL_10;
    case 5:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CONNECTED_GYM_MACHINE_ROWER");
      goto LABEL_10;
    case 6:
      FIBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CONNECTED_GYM_MACHINE_BIKE");
LABEL_10:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_24CC50B10, CFSTR("Localizable"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = CFSTR("CONNECTED_GYM_MACHINE_UNIMPLEMENTED");
      break;
  }
  return v4;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return objc_opt_class();
}

void sub_21169AE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_21169B980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FICanonicalQuantityUnitForIntervalType(uint64_t a1)
{
  void *v1;

  if (a1 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a1 != 2)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v1)
LABEL_7:
    FICanonicalQuantityUnitForIntervalType_cold_1();
  return v1;
}

void sub_21169CFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_21169D174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21169D2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21169D44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FILocalizeCount(double a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (FILocalizeCount_onceToken != -1)
    dispatch_once(&FILocalizeCount_onceToken, &__block_literal_global_3);
  v2 = (void *)FILocalizeCount___formatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id FILocalizePercentComplete(double a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (FILocalizePercentComplete_onceToken != -1)
    dispatch_once(&FILocalizePercentComplete_onceToken, &__block_literal_global_191);
  v2 = (void *)FILocalizePercentComplete___formatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id FILocalizedDayName(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = FILocalizedDayName_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&FILocalizedDayName_onceToken, &__block_literal_global_192);
  objc_msgSend((id)FILocalizedDayName___formatter, "stringFromDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id FILocalizedMonthName(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = FILocalizedMonthName_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&FILocalizedMonthName_onceToken, &__block_literal_global_196);
  objc_msgSend((id)FILocalizedMonthName___formatter, "stringFromDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id FIRandomStringForPrefixWithTableName(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  FIRandomKeyForPrefixWithTableName(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    _FIStringWithExactKeyWithTableName(v8, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("__key_not_found__")))
      goto LABEL_7;

  }
  _HKInitializeLogging();
  v11 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_FAULT))
  {
    v13 = 138543874;
    v14 = v5;
    v15 = 2114;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_fault_impl(&dword_21168F000, v11, OS_LOG_TYPE_FAULT, "Unable to find a random string for prefix %{public}@ in bundle %{public}@ with table name %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v10 = 0;
LABEL_7:

  return v10;
}

id FIRandomKeyForPrefixWithTableName(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v16;

  v16 = a1;
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
    v8 = 1;
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%d"), v16, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", v9, CFSTR("__key_not_found__"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("__key_not_found__")) & 1) != 0)
        break;
      v8 = (v8 + 1);
      objc_msgSend(v7, "arrayByAddingObject:", v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v11;
    }

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v7, "count")));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x24BDD2FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEBUG))
        FIRandomKeyForPrefixWithTableName_cold_1((uint64_t)v16, v14);
      v12 = v16;
    }
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id _FIStringWithExactKeyWithTableName(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", v5, CFSTR("__key_not_found__"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("__key_not_found__")) & 1) != 0)
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Localizable")) & 1) != 0)
      {
        v8 = 0;
LABEL_9:

        goto LABEL_10;
      }
      _FIStringForKeyInDefaultLocalizableTable(v5, v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v9;
    }
    v8 = v10;
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

id FIRandomStringWithKeyAndPossibleSuffixesWithTableName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  _HKInitializeLogging();
  v14 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v41 = v10;
    v42 = 2112;
    v43 = v9;
    v44 = 2112;
    v45 = v12;
    _os_log_impl(&dword_21168F000, v14, OS_LOG_TYPE_DEFAULT, "Working with possible suffixes: %@, key %@, and table name %@", buf, 0x20u);
  }
  if (!objc_msgSend(v10, "count"))
  {
    FIRandomStringForPrefixWithTableName(v9, v11, v12);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
      goto LABEL_33;
    goto LABEL_30;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v10, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v15)
  {
    v16 = v15;
    v31 = v13;
    v32 = v10;
    v17 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "stringByAppendingString:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        FIRandomStringForPrefixWithTableName(v20, v11, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21 && (objc_msgSend(v21, "isEqualToString:", CFSTR("__key_not_found__")) & 1) == 0)
        {
          if (objc_msgSend(v19, "containsString:", CFSTR("NAME")))
          {
            v34 = 0;
            v13 = v31;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@"), &v34, v31);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            v25 = v34;
            v26 = v25;
            if (v24)
              v27 = 1;
            else
              v27 = v25 == 0;
            v10 = v32;
            if (!v27)
            {
              _HKInitializeLogging();
              v28 = *MEMORY[0x24BDD2FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
                FIRandomStringWithKeyAndPossibleSuffixesWithTableName_cold_1((uint64_t)v20, (uint64_t)v26, v28);
            }

          }
          else
          {
            v24 = v22;
            v13 = v31;
            v10 = v32;
          }

          goto LABEL_29;
        }
        _HKInitializeLogging();
        v23 = *MEMORY[0x24BDD2FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v20;
          _os_log_impl(&dword_21168F000, v23, OS_LOG_TYPE_DEFAULT, "Attempted to localize key %@", buf, 0xCu);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v16)
        continue;
      break;
    }
    v24 = 0;
    v13 = v31;
    v10 = v32;
  }
  else
  {
    v24 = 0;
  }
LABEL_29:

  if (!v24)
  {
LABEL_30:
    _HKInitializeLogging();
    v29 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21168F000, v29, OS_LOG_TYPE_DEFAULT, "Result of localization is nil, returning original key", buf, 2u);
    }
    v24 = v9;
  }
LABEL_33:

  return v24;
}

id FIStringByReplacingDynamicPlaceholder(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v5;
  v9 = objc_msgSend(v8, "rangeOfString:", v6);
  v20 = v8;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v9;
    v13 = v10;
    do
    {
      v14 = v8;
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, CFSTR("%@"), 0, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), &v21, v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v21;

      if (v8)
        v17 = 1;
      else
        v17 = v16 == 0;
      if (!v17)
      {
        _HKInitializeLogging();
        v18 = *MEMORY[0x24BDD2FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v23 = v6;
          v24 = 2112;
          v25 = v16;
          _os_log_error_impl(&dword_21168F000, v18, OS_LOG_TYPE_ERROR, "Error formatting string with placeholder (%@): %@", buf, 0x16u);
        }
      }
      v12 = objc_msgSend(v8, "rangeOfString:", v6);
      v13 = v19;

    }
    while (v12 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v8;
}

id _FIStringForKeyInDefaultLocalizableTable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, CFSTR("__key_not_found__"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("__key_not_found__")) & 1) != 0)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x24BDD2FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543874;
        v11 = v3;
        v12 = 2114;
        v13 = v5;
        v14 = 2114;
        v15 = CFSTR("Localizable");
        _os_log_impl(&dword_21168F000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find the string for key %{public}@ in bundle %{public}@ with table name %{public}@", (uint8_t *)&v10, 0x20u);
      }
      v6 = 0;
    }
    else
    {
      v6 = v7;
    }

  }
  return v6;
}

id FILocalizedStringForKey(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24CC50B10, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t FIMindfulnessDayOffsetFromSunday(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 7)
    return 0;
  else
    return a1 - 1;
}

uint64_t FIMindfulnessWeekdaySelectionFromWeekday(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return 0;
  else
    return qword_2116C2168[a1 - 1];
}

uint64_t FIMindfulnessWeekdayForCalendarWeekday(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 7)
    return -2;
  return result;
}

uint64_t FIMindfulnessWeekendDaySelectionForCalendar(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(v1, "hk_weekendDays");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __FIMindfulnessWeekendDaySelectionForCalendar_block_invoke;
  v5[3] = &unk_24CC4EB38;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_21169E7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FIMindfulnessWeekdayDaySelectionForCalendar(void *a1)
{
  return ~FIMindfulnessWeekendDaySelectionForCalendar(a1) & 0x7F;
}

void sub_21169EF08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_21169F7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t FIDistanceTypeForActivityType(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "identifier");
  if (v2 > 45)
  {
    if (v2 <= 59)
    {
      if (v2 == 46)
      {
        if (objc_msgSend(v1, "hasLocationTypePool"))
          v3 = 3;
        else
          v3 = 4;
      }
      else if (v2 == 52)
      {
LABEL_3:
        v3 = 1;
      }
      else
      {
LABEL_15:
        v3 = 0;
      }
    }
    else
    {
      switch(v2)
      {
        case '<':
          v3 = 6;
          break;
        case '=':
        case 'C':
          v3 = 7;
          break;
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'D':
        case 'E':
          goto LABEL_15;
        case 'F':
        case 'G':
          goto LABEL_3;
        default:
          if (v2 != 75)
            goto LABEL_15;
          goto LABEL_3;
      }
    }
  }
  else
  {
    v3 = 2;
    switch(v2)
    {
      case 13:
        break;
      case 14:
      case 15:
      case 17:
      case 18:
      case 19:
      case 20:
      case 22:
      case 23:
      case 26:
      case 28:
      case 29:
      case 30:
      case 32:
      case 33:
      case 34:
      case 38:
      case 40:
        goto LABEL_15;
      case 16:
      case 21:
      case 24:
      case 25:
      case 27:
      case 36:
      case 37:
      case 41:
        goto LABEL_3;
      case 31:
        v3 = 8;
        break;
      case 35:
        v3 = 9;
        break;
      case 39:
        v3 = 10;
        break;
      default:
        if (v2 != 1 && v2 != 3)
          goto LABEL_15;
        goto LABEL_3;
    }
  }

  return v3;
}

id FIHKUnitForDistanceUnit(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  switch(a1)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit", v1, v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9, v1, v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD4048], "mileUnit", v1, v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD4048], "yardUnit", v1, v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD4048], "footUnit", v1, v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

id FIHKQuantityForDistanceUnitAndType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;

  if ((unint64_t)(a2 - 2) > 7)
    v3 = 1;
  else
    v3 = qword_2116C21E0[a2 - 2];
  v4 = (double)(unint64_t)FINumberOfUnitsInPaceForPaceFormat(v3);
  FIHKUnitForDistanceUnit(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t FIPaceFormatForDistanceType(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 7)
    return 1;
  else
    return qword_2116C21E0[a1 - 2];
}

uint64_t FIDistanceUnitForHKUnit(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  if (FIDistanceUnitForHKUnit_onceToken != -1)
    dispatch_once(&FIDistanceUnitForHKUnit_onceToken, &__block_literal_global_4);
  objc_msgSend(v1, "unitString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)FIDistanceUnitForHKUnit___distanceUnitsByUnitString, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      FIDistanceUnitForHKUnit_cold_1();
    v5 = 2;
  }

  return v5;
}

BOOL FIDistanceUnitIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 5;
}

uint64_t FIPaceFormatForWorkoutActivityType(void *a1)
{
  uint64_t v1;

  v1 = FIDistanceTypeForActivityType(a1);
  if ((unint64_t)(v1 - 2) > 7)
    return 1;
  else
    return qword_2116C21E0[v1 - 2];
}

double FISpeedForDurationOverDistance(void *a1, double a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x24BDD4048];
  v4 = a1;
  objc_msgSend(v3, "meterUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValueForUnit:", v5);
  v7 = v6;

  return v7 / a2;
}

uint64_t FICurrentLocaleUsesMetricSystem()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x24BDBCB60]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

BOOL FIDistanceUnitIsMetric(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

uint64_t FIHKUnitIsCalorieUnit(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqual:", v2) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4048], "largeCalorieUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v1, "isEqual:", v4);

  }
  return v3;
}

uint64_t _IsValidUserUnitForQuantityType(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (_IsValidUserUnitForQuantityType_onceToken != -1)
  {
    dispatch_once(&_IsValidUserUnitForQuantityType_onceToken, &__block_literal_global_293);
    if (v5)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)_IsValidUserUnitForQuantityType___validUnitStringsByQuantityType, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

LABEL_6:
  return v8;
}

id FISplitsForMeasuringSystemIdentifier(void *a1, uint64_t a2)
{
  _QWORD v3[5];

  if (!a1)
    return MEMORY[0x24BDBD1A8];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __FISplitsForMeasuringSystemIdentifier_block_invoke;
  v3[3] = &__block_descriptor_40_e24_B16__0__HKWorkoutEvent_8l;
  v3[4] = a2;
  objc_msgSend(a1, "fi_filteredArrayUsingBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id FICustomSplits(void *a1)
{
  if (!a1)
    return MEMORY[0x24BDBD1A8];
  objc_msgSend(a1, "fi_filteredArrayUsingBlock:", &__block_literal_global_5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_2116A262C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

uint64_t _ValidateSample_0(void *a1, void *a2, void *a3, int a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  if (a4)
  {
    FIIntervalErrorWithDescription(CFSTR("Cannot add sample - segment is finalized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FISetOutErrorIfNotNull(a5, v12);
LABEL_6:

    v13 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v9, "fi_overlapsStartDate:endDate:", v10, v11) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sample %@ does not overlap with startDate:%@ endDate: %@"), v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FIIntervalErrorWithDescription(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    FISetOutErrorIfNotNull(a5, v14);

    goto LABEL_6;
  }
  v13 = 1;
LABEL_7:

  return v13;
}

void sub_2116A2C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t FINumberOfUnitsInPaceForPaceFormat(uint64_t a1)
{
  uint64_t v1;

  v1 = 100;
  if (a1 != 2)
    v1 = 1;
  if (a1 == 3)
    return 500;
  else
    return v1;
}

double FIPace(void *a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  id v8;
  void *v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v15;

  v7 = a1;
  v8 = a2;
  if (a3 == 4)
    FIPace_cold_1();
  v9 = v8;
  objc_msgSend(v7, "doubleValueForUnit:", v8);
  v11 = 100;
  if (a3 != 2)
    v11 = 1;
  if (a3 == 3)
    v11 = 500;
  v12 = v10 / (double)v11;
  v13 = 0.0;
  if (v12 > 0.0)
    v13 = round(a4 / v12);
  if (v13 > 3600.0 || v12 < 2.22044605e-16)
    v15 = 0.0;
  else
    v15 = v13;

  return v15;
}

double FIPaceInMetersPerSecond(double a1, double a2)
{
  double result;

  result = a1 / a2;
  if (a2 <= 2.22044605e-16)
    return 0.0;
  return result;
}

uint64_t _FIBoolForStandardDomainAndKey(void *a1, void *a2)
{
  return _FIBoolForStandardDomainAndKeyWithDefaultValue(a1, a2, 0);
}

uint64_t _FIBoolForStandardDomainAndKeyWithDefaultValue(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDBCF50];
  v6 = a2;
  v7 = a1;
  objc_msgSend(v5, "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentDomainForName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    a3 = objc_msgSend(v10, "BOOLValue");

  return a3;
}

void _FIWriteBoolToStandardDomain(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  v7 = a1;
  CFPreferencesSetAppValue(v7, (CFPropertyListRef)objc_msgSend(v5, "numberWithBool:", a2), v6);
  CFPreferencesAppSynchronize(v6);
  v9 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "synchronizeUserDefaultsDomain:keys:", v6, v8);
}

id _FINumberForStandardDomainAndKey(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentDomainForName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void _FIWriteIntegerToStandardDomain(void *a1, uint64_t a2, void *a3)
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  v7 = a1;
  CFPreferencesSetAppValue(v7, (CFPropertyListRef)objc_msgSend(v5, "numberWithInteger:", a2), v6);
  CFPreferencesAppSynchronize(v6);
  v9 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "synchronizeUserDefaultsDomain:keys:", v6, v8);
}

uint64_t _FIBoolForPerGizmoDomainAndKey(void *a1, void *a2)
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(a1, a2, 0);
}

uint64_t _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(void *a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x24BE6B2C0];
  v6 = a2;
  v7 = a1;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithDomain:", v7);

  v9 = (id)objc_msgSend(v8, "synchronize");
  objc_msgSend(v8, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    a3 = objc_msgSend(v10, "BOOLValue");

  return a3;
}

void _FIWriteBoolToPerGizmoDomain(void *a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x24BE6B2C0];
  v6 = a3;
  v7 = a1;
  v11 = (id)objc_msgSend([v5 alloc], "initWithDomain:", v6);
  objc_msgSend(v11, "setBool:forKey:", a2, v7);
  v8 = (id)objc_msgSend(v11, "synchronize");
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "synchronizeNanoDomain:keys:", v6, v10);
}

void _FIWriteBoolsToPerGizmoDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", v4);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          objc_msgSend(v5, "setBool:forKey:", objc_msgSend(v12, "BOOLValue"), v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v14 = (id)objc_msgSend(v5, "synchronize");
  v15 = (void *)objc_opt_new();
  v16 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v6, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "synchronizeNanoDomain:keys:", v4, v18);

}

id _FINumberForPerGizmoDomainAndKey(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BE6B2C0];
  v4 = a2;
  v5 = a1;
  v6 = (void *)objc_msgSend([v3 alloc], "initWithDomain:", v5);

  v7 = (id)objc_msgSend(v6, "synchronize");
  objc_msgSend(v6, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void _FIWriteIntegerToPerGizmoDomain(void *a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x24BE6B2C0];
  v6 = a3;
  v7 = a1;
  v11 = (id)objc_msgSend([v5 alloc], "initWithDomain:", v6);
  objc_msgSend(v11, "setInteger:forKey:", a2, v7);
  v8 = (id)objc_msgSend(v11, "synchronize");
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "synchronizeNanoDomain:keys:", v6, v10);
}

__CFString *FIWorkoutSplitMeasurementSystemDescription(unint64_t a1)
{
  if (a1 < 3)
    return off_24CC4EEC8[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("INVALID_IDENTIFIER(%lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id FIGeneralizedActivityTypeKey(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  if (a1 == 46)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu.%lu"), 46, a3);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a1, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".indoor"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

id FIQuantityForGoalTypeAndValue(uint64_t a1, double a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  switch(a1)
  {
    case 1:
      v3 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v3 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      v3 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      return v6;
  }
  v5 = (void *)v4;
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

double FIDoubleValueForQuantityAndGoalType(void *a1, uint64_t a2)
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  double v7;

  v3 = a1;
  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "secondUnit");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v4 = 0.0;
  if (a2 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = (void *)v5;
    objc_msgSend(v3, "doubleValueForUnit:", v5);
    v4 = v7;

  }
  return v4;
}

uint64_t FIActivityTypeIsSupported(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = 1;
  if (a1 <= 76)
  {
    v3 = a1 - 13;
    if (v3 <= 0x3B && ((1 << v3) & 0xE34508281400889) != 0)
      return result;
    return 0;
  }
  if (a1 != 77 && a1 != 80 && a1 != 3000)
    return 0;
  return result;
}

uint64_t FIActivityTypeIsCalorimetryOptimized(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = 1;
  if ((unint64_t)(a1 - 13) > 0x3B || ((1 << (a1 - 13)) & 0xE34D08281400889) == 0)
  {
    v3 = a1 - 77;
    if (v3 > 5 || ((1 << v3) & 0x29) == 0)
      return 0;
  }
  return result;
}

uint64_t FIIsCategorizedOtherActivityType(uint64_t a1)
{
  return FIActivityTypeIsCalorimetryOptimized(a1) ^ 1;
}

id FIOpenGoalUUIDForActivityType(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  const __CFString *v5;
  char v6;
  char v7;
  uint64_t v8;
  char v9;

  v1 = a1;
  v2 = objc_msgSend(v1, "effectiveTypeIdentifier");
  v3 = 0;
  if (v2 > 56)
  {
    switch(v2)
    {
      case '9':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("CB8860F7-2573-4E06-9526-2B9D29941567");
        goto LABEL_60;
      case ':':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'A':
      case 'C':
      case 'D':
      case 'E':
        goto LABEL_61;
      case ';':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("26AE82DC-AA7D-49B2-A309-91ED198DE5F4");
        goto LABEL_60;
      case '?':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("B13FD43F-7859-47C4-BD87-D2F6D8350DAC");
        goto LABEL_60;
      case 'B':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("62C3D3CF-8A23-4E48-A1B5-FE2098C15338");
        goto LABEL_60;
      case 'F':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("76433BE8-3A5D-41BC-8C67-23C5B3F85081");
        goto LABEL_60;
      case 'G':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("AB8DDB22-313E-436D-954E-112553E197A5");
        goto LABEL_60;
      case 'H':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("C36E60C0-9DF8-4C81-9EF8-994CB1B6E791");
        goto LABEL_60;
      default:
        if (v2 != 77)
        {
          if (v2 != 80)
            goto LABEL_61;
          if ((objc_msgSend(v1, "isIndoor") & 1) == 0)
          {
            v4 = objc_alloc(MEMORY[0x24BDD1880]);
            v5 = CFSTR("A6A9C4DD-12C3-4F74-BCF1-85C84F7CB349");
            goto LABEL_60;
          }
          goto LABEL_54;
        }
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("3BE0D7FF-AFAE-4A9F-8E44-74A55D93A959");
        break;
    }
    goto LABEL_60;
  }
  if (v2 > 34)
  {
    switch(v2)
    {
      case ',':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("C5F93E17-7D72-4654-9C80-70B10EF900C6");
        goto LABEL_60;
      case '-':
      case '/':
      case '0':
      case '1':
      case '3':
        goto LABEL_61;
      case '.':
        if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
          goto LABEL_54;
        v8 = objc_msgSend(v1, "swimmingLocationType");
        switch(v8)
        {
          case 0:
            goto LABEL_54;
          case 2:
            v4 = objc_alloc(MEMORY[0x24BDD1880]);
            v5 = CFSTR("C7D48B54-D31F-4172-B89C-B173A77AF8D9");
            goto LABEL_60;
          case 1:
            v4 = objc_alloc(MEMORY[0x24BDD1880]);
            v5 = CFSTR("8632810D-5AE8-49AE-8861-23719EAEDC43");
            goto LABEL_60;
        }
LABEL_49:
        if ((objc_msgSend(v1, "isIndoor") & 1) == 0)
        {
          v4 = objc_alloc(MEMORY[0x24BDD1880]);
          v5 = CFSTR("73009EF0-58A6-40CE-9598-DBF394A80415");
          goto LABEL_60;
        }
        goto LABEL_54;
      case '2':
        goto LABEL_49;
      case '4':
        v9 = objc_msgSend(v1, "isIndoor");
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        if ((v9 & 1) != 0)
          v5 = CFSTR("51F97983-0223-467C-ADAE-1CFFE5383CBE");
        else
          v5 = CFSTR("9CD2ED1B-6C09-4D6B-911F-CFB9C8C418BE");
        goto LABEL_60;
      default:
        if (v2 == 35)
        {
          if ((objc_msgSend(v1, "isIndoor") & 1) != 0)
            goto LABEL_54;
          v4 = objc_alloc(MEMORY[0x24BDD1880]);
          v5 = CFSTR("0A5FC9FB-CCFF-48D0-BCF3-9766C211FE2D");
        }
        else
        {
          if (v2 != 37)
            goto LABEL_61;
          v6 = objc_msgSend(v1, "isIndoor");
          v4 = objc_alloc(MEMORY[0x24BDD1880]);
          if ((v6 & 1) != 0)
            v5 = CFSTR("2583F09E-8522-43F6-9E82-B0701414CF68");
          else
            v5 = CFSTR("3D1CE8DF-FB42-48EC-B0B9-28CA40BA65C9");
        }
        break;
    }
    goto LABEL_60;
  }
  if (v2 > 19)
  {
    if (v2 == 20)
    {
      if ((objc_msgSend(v1, "isIndoor") & 1) == 0)
      {
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("D65AB2CF-D621-4FAA-BABB-28670DB18152");
        goto LABEL_60;
      }
LABEL_54:
      v3 = 0;
      goto LABEL_61;
    }
    if (v2 == 24)
    {
      if ((objc_msgSend(v1, "isIndoor") & 1) == 0)
      {
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("329E0317-E58E-4237-8083-4F0BE76357F1");
        goto LABEL_60;
      }
      goto LABEL_54;
    }
  }
  else
  {
    if (v2 == 13)
    {
      v7 = objc_msgSend(v1, "isIndoor");
      v4 = objc_alloc(MEMORY[0x24BDD1880]);
      if ((v7 & 1) != 0)
        v5 = CFSTR("E06981DB-4C2C-412A-A22F-7629BFD56505");
      else
        v5 = CFSTR("5256B1ED-936D-4419-8F97-4A5CB7A77BE3");
      goto LABEL_60;
    }
    if (v2 == 16)
    {
      if ((objc_msgSend(v1, "isIndoor") & 1) == 0)
      {
        v4 = objc_alloc(MEMORY[0x24BDD1880]);
        v5 = CFSTR("63200046-5236-4523-85D7-D5B8B85410E5");
LABEL_60:
        v3 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
        goto LABEL_61;
      }
      goto LABEL_54;
    }
  }
LABEL_61:

  return v3;
}

__CFString *FILocalizationKeyForHKWorkoutActivityTypeAndIsIndoor(uint64_t a1, int a2)
{
  return FILocalizationKeyForHKWorkoutActivityTypeIsLocationAgnosticAndIsIndoor(a1, 0, a2);
}

__CFString *FILocalizationKeyForHKWorkoutActivityTypeIsLocationAgnosticAndIsIndoor(uint64_t a1, char a2, int a3)
{
  __CFString *v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;
  int v11;
  int v12;
  int v13;

  v6 = 0;
  if (a1 <= 34)
  {
    switch(a1)
    {
      case 16:
        return CFSTR("ELLIPTICAL");
      case 17:
      case 18:
      case 19:
      case 21:
      case 22:
      case 23:
        return v6;
      case 20:
        return CFSTR("FUNCTIONAL_STRENGTH_TRAINING");
      case 24:
        return CFSTR("HIKING");
      case 25:
        v11 = _os_feature_enabled_impl();
        v6 = CFSTR("HOCKEY");
        if (!v11 || (a2 & 1) != 0)
          return v6;
        v8 = CFSTR("OUTDOOR_HOCKEY");
        v9 = CFSTR("INDOOR_HOCKEY");
        break;
      default:
        if (a1 != 13)
          return v6;
        if ((a2 & 1) != 0)
          return CFSTR("CYCLING");
        v8 = CFSTR("OUTDOOR_CYCLING");
        v9 = CFSTR("INDOOR_CYCLING");
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case '#':
        v7 = _os_feature_enabled_impl();
        v6 = CFSTR("ROWING");
        if (!v7 || (a2 & 1) != 0)
          return v6;
        v8 = CFSTR("OUTDOOR_ROWING");
        v9 = CFSTR("INDOOR_ROWING");
        break;
      case '$':
      case '&':
      case '(':
      case '*':
      case '+':
      case '-':
      case '/':
      case '0':
      case '1':
      case '2':
      case '3':
      case '5':
      case '6':
      case '7':
      case '8':
      case ':':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'C':
      case 'E':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'N':
      case 'O':
      case 'Q':
      case 'S':
        return v6;
      case '%':
        if ((a2 & 1) != 0)
          return CFSTR("RUNNING");
        v8 = CFSTR("OUTDOOR_RUNNING");
        v9 = CFSTR("INDOOR_RUNNING");
        break;
      case '\'':
        v12 = _os_feature_enabled_impl();
        v6 = CFSTR("SKATING_SPORTS");
        if (!v12 || (a2 & 1) != 0)
          return v6;
        v8 = CFSTR("OUTDOOR_SKATING_SPORTS");
        v9 = CFSTR("INDOOR_SKATING_SPORTS");
        break;
      case ')':
        v13 = _os_feature_enabled_impl();
        v6 = CFSTR("SOCCER");
        if (!v13 || (a2 & 1) != 0)
          return v6;
        v8 = CFSTR("OUTDOOR_SOCCER");
        v9 = CFSTR("INDOOR_SOCCER");
        break;
      case ',':
        return CFSTR("STEPPER");
      case '.':
        return CFSTR("SWIMMING");
      case '4':
        if ((a2 & 1) != 0)
          return CFSTR("WALKING");
        v8 = CFSTR("OUTDOOR_WALKING");
        v9 = CFSTR("INDOOR_WALKING");
        break;
      case '9':
        return CFSTR("YOGA");
      case ';':
        return CFSTR("CORE_TRAINING");
      case '?':
        return CFSTR("HIGH_INTENSITY_INTERVAL_TRAINING");
      case 'A':
        return CFSTR("KICKBOXING");
      case 'B':
        return CFSTR("PILATES");
      case 'D':
        return CFSTR("STAIRS");
      case 'F':
        return CFSTR("WHEELCHAIR_WALK_PACE");
      case 'G':
        return CFSTR("WHEELCHAIR_RUN_PACE");
      case 'H':
        return CFSTR("TAI_CHI");
      case 'M':
        return CFSTR("CARDIO_DANCE");
      case 'P':
        return CFSTR("COOLDOWN");
      case 'R':
        return CFSTR("MULTISPORT");
      case 'T':
        return CFSTR("UNDERWATER_DIVING");
      default:
        if (a1 == 3000)
          return CFSTR("OTHER");
        else
          return (__CFString *)0;
    }
  }
  if (a3)
    v8 = (__CFString *)v9;
  v6 = v8;
  return v6;
}

__CFString *FILocalizationKeyForHKWorkoutActivityType(uint64_t a1)
{
  return FILocalizationKeyForHKWorkoutActivityTypeIsLocationAgnosticAndIsIndoor(a1, 1, 0);
}

id FIStandardFitnessDefaultActivityTypes(int a1, char a2)
{
  uint64_t *v3;
  _QWORD block[4];
  char v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __FIStandardFitnessDefaultActivityTypes_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v6 = a2;
  if (FIStandardFitnessDefaultActivityTypes_onceToken != -1)
    dispatch_once(&FIStandardFitnessDefaultActivityTypes_onceToken, block);
  v3 = &FIStandardFitnessDefaultActivityTypes_activityTypes;
  if (a1)
    v3 = &FIStandardFitnessDefaultActivityTypes_wheelchairActivityTypes;
  return (id)*v3;
}

id FIFitnessJuniorDefaultActivityTypes()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 52, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 37, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 13, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 24, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void FIActivityMoveModeAnalyticsSendActivityMoveModeSwitchedInSettings(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  id v3;

  v1 = CFSTR("Active Energy");
  if (a1 == 2)
    v1 = CFSTR("Apple Move Time");
  v2 = v1;
  objc_msgSend(CFSTR("com.apple.Fitness.analytics.fitnessJr"), "stringByAppendingString:", CFSTR(".activityMoveModeSwitchedInSettings"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission(v3, CFSTR("newActivityMoveMode"), v2);

}

void FIActivityMoveModeAnalyticsSendExperienceType(unint64_t a1)
{
  __CFString *v1;
  id v2;

  if (a1 > 3)
    v1 = 0;
  else
    v1 = off_24CC4F050[a1];
  objc_msgSend(CFSTR("com.apple.Fitness.analytics.fitnessJr"), "stringByAppendingString:", CFSTR(".ageBucket"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  FIActivityAnalyticsSubmission(v2, CFSTR("ageBucket"), v1);

}

uint64_t FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar(void *a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar(a1, a3, a2);
  v4 = 2;
  if (v3 <= 9)
    v4 = 3;
  if (v3 > 12)
    return 1;
  else
    return v4;
}

uint64_t FIExperienceTypeWithHealthStoreAndDefaultExperienceType(void *a1, uint64_t a2)
{
  uint64_t result;

  result = FIExperienceTypeWithHealthStore(a1);
  if (!result)
    return a2;
  return result;
}

const __CFString *FILocalizationTableForExperienceType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Localizable");
  if (a1 == 2)
    v1 = CFSTR("Localizable-Modified-tinker");
  if (a1 == 3)
    return CFSTR("Localizable-Simplified-tinker");
  else
    return v1;
}

id UnitForMoveGoal(void *a1)
{
  if ((unint64_t)a1 >= 2)
  {
    if (a1 == (void *)2)
    {
      objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    _HKWorkoutCanonicalEnergyBurnedUnit();
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t UnitForExerciseGoal()
{
  return objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
}

uint64_t UnitForStandGoal()
{
  return objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
}

double MoveValueForActivitySummary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  v1 = a1;
  UnitForMoveGoal((void *)objc_msgSend(v1, "activityMoveMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "activityMoveMode") == 2)
    objc_msgSend(v1, "appleMoveMinutes");
  else
    objc_msgSend(v1, "activeEnergyBurned");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "doubleValueForUnit:", v2);
  v5 = v4;

  return v5;
}

double MoveGoalValueForActivitySummary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  v1 = a1;
  UnitForMoveGoal((void *)objc_msgSend(v1, "activityMoveMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "activityMoveMode") == 2)
    objc_msgSend(v1, "appleMoveMinutesGoal");
  else
    objc_msgSend(v1, "activeEnergyBurnedGoal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "doubleValueForUnit:", v2);
  v5 = v4;

  return v5;
}

void sub_2116AADC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double MovePercentageForActivitySummary(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  if (objc_msgSend(v1, "activityMoveMode") == 2)
    objc_msgSend(v1, "_moveMinutesCompletionPercentage");
  else
    objc_msgSend(v1, "_activeEnergyCompletionPercentage");
  v3 = v2;

  return v3;
}

void sub_2116AB654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v15 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_2116ABCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2116AC350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

id MoveStatisticsForActivitySummary(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "activityMoveMode") == 2)
    objc_msgSend(v1, "_dailyMoveMinutesStatistics");
  else
    objc_msgSend(v1, "_dailyEnergyBurnedStatistics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_2116ADB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCMCalorieUserInfoClass_block_invoke(uint64_t a1)
{
  CoreMotionLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CMCalorieUserInfo");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCMCalorieUserInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCMCalorieUserInfoClass_block_invoke_cold_1();
    CoreMotionLibrary();
  }
}

void CoreMotionLibrary()
{
  void *v0;

  if (!CoreMotionLibraryCore_frameworkLibrary)
    CoreMotionLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreMotionLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getCMNatalimeterClass_block_invoke(uint64_t a1)
{
  CoreMotionLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CMNatalimeter");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCMNatalimeterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCMNatalimeterClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_3();
  }
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

BOOL FIInternalCoachingDataCollectionEnabled()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AppleInternalDataCollectionEnabled"), CFSTR("com.apple.nanolifestyle"), 0) != 0;
}

const __CFString *FIStringFromDailyGoalType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("FIDailyGoalTypeNone");
  else
    return off_24CC4F460[a1 - 1];
}

uint64_t FIDailyGoalTypeFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (FIDailyGoalTypeNameMappings_onceToken != -1)
    dispatch_once(&FIDailyGoalTypeNameMappings_onceToken, &__block_literal_global_8);
  objc_msgSend((id)FIDailyGoalTypeNameMappings_typeNameMappings, "objectForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0;

  return v4;
}

_QWORD *FISetOutErrorIfNotNull(_QWORD *result, id a2)
{
  _QWORD *v2;

  if (result)
  {
    v2 = result;
    result = objc_retainAutorelease(a2);
    *v2 = result;
  }
  return result;
}

id FIIntervalErrorWithDescription(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = a1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.fitness.intervals"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t FICMotionConditionForWheelchairUse(uint64_t a1)
{
  if (a1 == 2)
    return 6;
  else
    return 0;
}

uint64_t FIAgeInYearsForDateOfBirth(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x24BDBCE60];
  v2 = a1;
  objc_msgSend(v1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = FIAgeInYearsForDateOfBirthWithCurrentDateAndCalendar((uint64_t)v2, (uint64_t)v3, v4);

  return v5;
}

uint64_t FIAgeInYearsForDateOfBirthWithCurrentDateAndCalendar(uint64_t result, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    objc_msgSend(a3, "components:fromDate:toDate:options:", 4, result, a2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "year");
    if (v4 <= 1)
      v5 = 1;
    else
      v5 = v4;

    return v5;
  }
  return result;
}

uint64_t FIAgeInYearsForDateOfBirthComponents(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x24BDBCE60];
  v2 = a1;
  objc_msgSend(v1, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar(v2, v3, v4);

  return v5;
}

id FIStandardDistanceQuantity(void *a1)
{
  int v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "_isMetricDistance");
  v2 = (void *)MEMORY[0x24BDD3E50];
  if (v1)
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 9);
  else
    objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id FIGetActivePairedDevice()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getNRPairedDeviceRegistryClass(), "activePairedDeviceSelectorBlock");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t FIIsActivePairedDeviceSatellitePaired()
{
  id NRPairedDeviceRegistryClass;
  void *v2;
  uint64_t v3;

  NRPairedDeviceRegistryClass = getNRPairedDeviceRegistryClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(NRPairedDeviceRegistryClass, "isActiveDeviceAltAccount");
  FIGetActivePairedDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FIIsDeviceSatellitePaired(v2);

  return v3;
}

uint64_t FIIsDeviceSatellitePaired(void *a1)
{
  id v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v2 = (_QWORD *)getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
  v11 = getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
  if (!getNRDevicePropertyIsAltAccountSymbolLoc_ptr)
  {
    v3 = (void *)NanoRegistryLibrary();
    v2 = dlsym(v3, "NRDevicePropertyIsAltAccount");
    v9[3] = (uint64_t)v2;
    getNRDevicePropertyIsAltAccountSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    v7 = (_Unwind_Exception *)FIIsDeviceSatellitePaired_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  objc_msgSend(v1, "valueForProperty:", *v2, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

uint64_t FIDeviceMeetsMinimumOSVersionGlory()
{
  return FIDeviceMeetsMinimumOSVersion(327680);
}

uint64_t FIIsTinkerVegaOrFitnessJunior()
{
  void *v0;
  uint64_t active;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isStandalonePhoneFitnessMode") & 1) != 0 || FIActivityMoveModeUserDefault() == 2)
    active = 1;
  else
    active = FIIsActivePairedDeviceSatellitePaired();

  return active;
}

uint64_t FIIsEndRemindersEnabled(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
  v3 = (id)objc_msgSend(v2, "synchronize");
  objc_msgSend(v2, "objectForKey:", CFSTR("NLPredictedActivityEndEnableNotification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x24BDC13D0], "isWorkoutEndReminderEnabledWhenDeviceIsInMoveTimeMode:withCurrentSetting:", a1 == 2, v4);

  return v5;
}

uint64_t FIIsStartRemindersEnabled(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
  v5 = (id)objc_msgSend(v4, "synchronize");
  objc_msgSend(v4, "objectForKey:", CFSTR("NLPredictedActivityStartEnableNotification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(MEMORY[0x24BDC13D0], "isWorkoutStartReminderEnabledWhenDeviceIsSatellitePaired:isInMoveTimeMode:withCurrentSetting:", a1, a2 == 2, v6);

  return v7;
}

uint64_t FIIsResumeRemindersEnabled(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
  v4 = (id)objc_msgSend(v3, "synchronize");
  objc_msgSend(v3, "objectForKey:", CFSTR("NLPredictedActivityResumeEnableNotification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x24BDC13D0], "isWorkoutResumeReminderEnabledWhenDeviceIsInMoveTimeMode:withCurrentSetting:", a2 == 2, v5);

  return v6;
}

uint64_t FIIsFitnessTrackingEnabled()
{
  return _FIBoolForStandardDomainAndKeyWithDefaultValue((void *)*MEMORY[0x24BDD46C0], (void *)*MEMORY[0x24BDD46D0], 1);
}

void FISetFitnessTrackingEnabled(uint64_t a1)
{
  _FIWriteBoolToStandardDomain((void *)*MEMORY[0x24BDD46D0], a1, (void *)*MEMORY[0x24BDD46C0]);
}

uint64_t FIAreFitnessAppsRestricted()
{
  void *v0;
  uint64_t v1;
  void *v2;
  BOOL v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.ActivityMonitorApp"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.SessionTrackerApp"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v0)
    v3 = v1 == 0;
  else
    v3 = 1;
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v17[0] = v0;
    v17[1] = v1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    v4 = v6;
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "appState", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isRestricted");

          if ((v10 & 1) != 0)
          {
            v4 = 1;
            goto LABEL_17;
          }
          ++v8;
        }
        while (v4 != v8);
        v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_17:

  }
  return v4;
}

uint64_t FIAreGoalCompletionNotificationsEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("com.apple.ActivityMonitorApp"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appState");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isInstalled");

  if ((_DWORD)v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.ActivityMonitorApp"));
    objc_msgSend(v3, "notificationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "authorizationStatus");
    v6 = objc_alloc(MEMORY[0x24BDBCF50]);
    v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x24BDD46A0]);
    objc_msgSend(v7, "objectForKey:", CFSTR("EnableGoalCompletions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == 2)
    {
      if (v8)
        v2 = objc_msgSend(v8, "BOOLValue");
      else
        v2 = 1;
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

uint64_t FIMirrorModeEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("MirrorModeEnabled"), 1);
}

void FISetMirrorModeEnabled(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("MirrorModeEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _FIWriteBoolsToPerGizmoDomain(v2, CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));

}

uint64_t FIAlertOnWatchWhenMirrored()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("AlertOnWatchWhenMirrored"), 1);
}

void FISetAlertOnWatchWhenMirrored(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("AlertOnWatchWhenMirrored");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _FIWriteBoolsToPerGizmoDomain(v2, CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));

}

uint64_t FIShouldTrackTrainingLoad()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("ShouldTrackTrainingLoad"), 0);
}

void FISetShouldTrackTrainingLoad(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  const __CFString *v10;
  _QWORD v11[2];

  v1 = a1;
  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("ShouldTrackTrainingLoad");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _FIWriteBoolsToPerGizmoDomain(v3, CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));

  if (v1)
    v4 = CFSTR("opt-in");
  else
    v4 = CFSTR("opt-out");
  v8[0] = CFSTR("toggle");
  v8[1] = CFSTR("source");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  FIActivityAnalyticsSubmissionWithPayloadAndRequiresIHA(CFSTR("com.apple.postWorkoutPromptToggle"), v7, 1);
}

uint64_t FIShouldShowTrackTrainingLoadPrompt()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("ShouldShowTrackTrainingLoadPrompt"), 1);
}

void FISetShouldShowTrackTrainingLoadPrompt(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("ShouldShowTrackTrainingLoadPrompt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _FIWriteBoolsToPerGizmoDomain(v2, CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));

}

uint64_t FIHasSeenTrainingLoadOnboarding()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("HasSeenTrainingLoadOnboarding"), 0);
}

void FISetHasSeenTrainingLoadOnboarding(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("HasSeenTrainingLoadOnboarding");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _FIWriteBoolsToPerGizmoDomain(v2, CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));

}

uint64_t FISystemRootDirectory()
{
  if (FISystemRootDirectory_onceToken != -1)
    dispatch_once(&FISystemRootDirectory_onceToken, &__block_literal_global_10);
  return FISystemRootDirectory_systemRootDirectory;
}

id FIBundle()
{
  if (FIBundle_onceToken != -1)
    dispatch_once(&FIBundle_onceToken, &__block_literal_global_221);
  return (id)FIBundle___bundle;
}

id FIAssetsBundle()
{
  if (FIAssetsBundle_onceToken != -1)
    dispatch_once(&FIAssetsBundle_onceToken, &__block_literal_global_224);
  return (id)FIAssetsBundle___bundle;
}

uint64_t FIDeviceSupportsSwimming()
{
  void *v1;
  void *v2;
  uint64_t v3;

  if ((_FIBoolForPerGizmoDomainAndKey(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("ForceSwimmingSupport")) & 1) != 0)return 1;
  FIGetActivePairedDevice();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("61415300-E200-4EDE-9853-BF83E3DE3A8A"));
  v3 = objc_msgSend(v1, "supportsCapability:", v2);

  return v3;
}

uint64_t FIIsWorkoutSafetyCheckInEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("WorkoutSafetyCheckInEnabled"), 0);
}

void FISetWorkoutSafetyCheckInEnabled(uint64_t a1)
{
  _FIWriteBoolToPerGizmoDomain(CFSTR("WorkoutSafetyCheckInEnabled"), a1, CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
}

uint64_t FIIsNextWorkoutSafetyCheckInEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("NextWorkoutSafetyCheckInEnabled"), 0);
}

void FISetNextWorkoutSafetyCheckInEnabled(uint64_t a1)
{
  _FIWriteBoolToPerGizmoDomain(CFSTR("NextWorkoutSafetyCheckInEnabled"), a1, CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
}

uint64_t FIIsWorkoutSafetyCheckInTipEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(CFSTR("com.apple.nanolifestyle.sessiontrackerapp"), CFSTR("WorkoutSafetyCheckInTipEnabled"), 1);
}

void FISetWorkoutSafetyCheckInTipEnabled(uint64_t a1)
{
  _FIWriteBoolToPerGizmoDomain(CFSTR("WorkoutSafetyCheckInTipEnabled"), a1, CFSTR("com.apple.nanolifestyle.sessiontrackerapp"));
}

__n128 FIEffectiveOperatingSystemVersion@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  int v4;
  __n128 *v5;
  __n128 result;

  if (FIEffectiveOperatingSystemVersion_onceToken != -1)
    dispatch_once(&FIEffectiveOperatingSystemVersion_onceToken, &__block_literal_global_238);
  v4 = HKNSOperatingSystemVersionsEqual();
  v5 = (__n128 *)&FIEffectiveOperatingSystemVersion_moonstoneVersion;
  if (!v4)
    v5 = a1;
  result = *v5;
  *a2 = *v5;
  a2[1].n128_u64[0] = v5[1].n128_u64[0];
  return result;
}

uint64_t FIIsWorkoutNFCAllDayDefaultEnabled()
{
  return _FIBoolForPerGizmoDomainAndKeyWithDefaultValue((void *)*MEMORY[0x24BDD4588], (void *)*MEMORY[0x24BDD4580], 0);
}

uint64_t FIIsWorkoutNFCAllDayEnabled()
{
  void *v0;
  uint64_t v1;
  void *v2;
  objc_class *v3;
  id v4;
  int v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v0 = (void *)*MEMORY[0x24BDD4588];
  v1 = _FIBoolForPerGizmoDomainAndKeyWithDefaultValue((void *)*MEMORY[0x24BDD4588], (void *)*MEMORY[0x24BDD4580], 0);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getNPKExpressGymKitAvailabilityManagerClass_softClass;
  v12 = getNPKExpressGymKitAvailabilityManagerClass_softClass;
  if (!getNPKExpressGymKitAvailabilityManagerClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getNPKExpressGymKitAvailabilityManagerClass_block_invoke;
    v8[3] = &unk_24CC4F2B8;
    v8[4] = &v9;
    __getNPKExpressGymKitAvailabilityManagerClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  v4 = objc_alloc_init(v3);
  v5 = objc_msgSend(v4, "isExpressGymKitAllowed");
  v6 = _FIBoolForPerGizmoDomainAndKeyWithDefaultValue(v0, (void *)*MEMORY[0x24BDD4590], v1) & v5;

  return v6;
}

void sub_2116B07C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FISetWorkoutNFCAllDayEnabled(uint64_t a1)
{
  _FIWriteBoolToPerGizmoDomain((void *)*MEMORY[0x24BDD4590], a1, (void *)*MEMORY[0x24BDD4588]);
  return notify_post((const char *)*MEMORY[0x24BDD4578]);
}

Class __getNPKExpressGymKitAvailabilityManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoPassKitLibraryCore_frameworkLibrary)
  {
    NanoPassKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoPassKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NPKExpressGymKitAvailabilityManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNPKExpressGymKitAvailabilityManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getNPKExpressGymKitAvailabilityManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id FIDefaultExerciseGoalQuantityForActivityMoveMode(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x24BDD4318];
  if (a1 != 2)
    v4 = (uint64_t *)MEMORY[0x24BDD4308];
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, (double)*v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id FIDefaultStandGoalQuantityForActivityMoveMode(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x24BDD4310];
  if (a1 != 2)
    v4 = (uint64_t *)MEMORY[0x24BDD4300];
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, (double)*v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t FIActivityMoveModeWithHealthStore(void *a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  id v6;

  v6 = 0;
  objc_msgSend(a1, "_activityMoveModeWithError:", &v6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v6;
  if (v2)
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
    {
      FIActivityMoveModeWithHealthStore_cold_1((uint64_t)v2, v3);
      if (v1)
        goto LABEL_4;
LABEL_6:
      v4 = 1;
      goto LABEL_7;
    }
  }
  if (!v1)
    goto LABEL_6;
LABEL_4:
  v4 = objc_msgSend(v1, "integerValue");
LABEL_7:

  return v4;
}

uint64_t FIActivityMoveModeUserDefault()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  v1 = (void *)objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x24BDD46A0]);
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BDD2760]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "integerValue");
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      FIActivityMoveModeUserDefault_cold_1(v5);
    v4 = 1;
  }

  return v4;
}

uint64_t FIDefaultActivityMoveModeWithAge(uint64_t a1)
{
  if (a1 >= 13)
    return 1;
  else
    return 2;
}

id FIMoveQuantityForActivitySummary(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "activityMoveMode") == 2)
    objc_msgSend(v1, "appleMoveMinutes");
  else
    objc_msgSend(v1, "activeEnergyBurned");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id FIMoveGoalQuantityForActivitySummary(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "activityMoveMode") == 2)
    objc_msgSend(v1, "appleMoveMinutesGoal");
  else
    objc_msgSend(v1, "activeEnergyBurnedGoal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t FIActivitySummaryHasNonZeroMoveGoal(void *a1)
{
  void *v1;
  uint64_t v2;

  FIMoveGoalQuantityForActivitySummary(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_isZero") ^ 1;

  return v2;
}

void FISaveGoalsForNewActivityMoveMode(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;

  v13 = (void *)MEMORY[0x24BDBCEB8];
  v27 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v26 = a2;
  objc_msgSend(v13, "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (a1 == 2)
    objc_msgSend(MEMORY[0x24BDD3DC0], "moveMinuteGoal");
  else
    objc_msgSend(MEMORY[0x24BDD3DC0], "calorieGoal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:", v18, v17, v14, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "addObject:", v19);
  v20 = (void *)MEMORY[0x24BDD3E68];
  objc_msgSend(MEMORY[0x24BDD3DC0], "exerciseGoal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "quantitySampleWithType:quantity:startDate:endDate:", v21, v16, v14, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "addObject:", v22);
  v23 = (void *)MEMORY[0x24BDD3E68];
  objc_msgSend(MEMORY[0x24BDD3DC0], "standGoal");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "quantitySampleWithType:quantity:startDate:endDate:", v24, v15, v14, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "addObject:", v25);
  objc_msgSend(v26, "saveObjects:withCompletion:", v28, v27);

}

id FIActivityMoveModeChangeSampleForDateComponents(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD3DC0];
  v4 = *MEMORY[0x24BDD42B0];
  v5 = a2;
  objc_msgSend(v3, "categoryTypeForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _HKCacheIndexFromDateComponents();

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", (double)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3988], "categorySampleWithType:value:startDate:endDate:", v6, a1, v8, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

const __CFString *NLHKActivityMoveModeString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("HKActivityMoveModeNotSet");
  if (a1 == 1)
    v1 = CFSTR("HKActivityMoveModeActiveEnergy");
  if (a1 == 2)
    return CFSTR("HKActivityMoveModeAppleMoveTime");
  else
    return v1;
}

id FIDistanceQuantityTypeIdentifierForActivityType(uint64_t a1)
{
  id *v1;
  id *v2;

  v1 = (id *)MEMORY[0x24BDD3558];
  v2 = (id *)MEMORY[0x24BDD3530];
  if (a1 != 13)
    v2 = (id *)MEMORY[0x24BDD3560];
  if (a1 != 46)
    v1 = v2;
  return *v1;
}

uint64_t FIQuantityTypeForActivityType(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)MEMORY[0x24BDD3558];
  v2 = (_QWORD *)MEMORY[0x24BDD3530];
  if (a1 != 13)
    v2 = (_QWORD *)MEMORY[0x24BDD3560];
  if (a1 != 46)
    v1 = v2;
  return objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *v1);
}

uint64_t sub_2116B1084()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(unint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254ABDFA0);
  v0 = *(_QWORD *)(type metadata accessor for PauseRingsPeriod() - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2116C2320;
  v4 = v3 + v2;
  v5 = sub_2116BFACC();
  v6 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v6(v4, 1, 3, v5);
  v6(v4 + v1, 2, 3, v5);
  v6(v4 + 2 * v1, 3, 3, v5);
  sub_2116BFAC0();
  result = ((uint64_t (*)(unint64_t, _QWORD, uint64_t, uint64_t))v6)(v4 + 3 * v1, 0, 3, v5);
  qword_254ABE2A8 = v3;
  return result;
}

uint64_t *sub_2116B117C()
{
  if (qword_254ABE2A0 != -1)
    swift_once();
  return &qword_254ABE2A8;
}

uint64_t static PauseRingsPeriod.allCases.getter()
{
  if (qword_254ABE2A0 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static PauseRingsPeriod.allCases.setter(uint64_t a1)
{
  if (qword_254ABE2A0 != -1)
    swift_once();
  swift_beginAccess();
  qword_254ABE2A8 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PauseRingsPeriod.allCases.modify())()
{
  if (qword_254ABE2A0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

void PauseRingsPeriod.localizedTitleForCurrentDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t v15;

  v15 = sub_2116BFB74();
  v13[6] = *(_QWORD *)(v15 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = sub_2116BFB5C();
  v13[5] = *(_QWORD *)(v14 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v1 = sub_2116BFA78();
  v13[3] = *(_QWORD *)(v1 - 8);
  v13[4] = v1;
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13[2] = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v13[1] = (char *)v13 - v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D8A1D0);
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_2116BFACC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v8);
  v9 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2116B1A94(v0, (uint64_t)v11);
  v12 = (char *)&loc_2116B14F0
      + *((int *)qword_2116B1A08 + (*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 3, v6));
  __asm { BR              X10 }
}

uint64_t sub_2116B1500()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  v1 = (void *)sub_2116BFBE0();
  v2 = FILocalizedStringForKey(v1);

  if (!v2)
  {
    __break(1u);
    JUMPOUT(0x2116B190CLL);
  }
  v3 = sub_2116BFBEC();

  sub_2116B1AD8(v0);
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BDFD7C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for PauseRingsPeriod()
{
  uint64_t result;

  result = qword_254ABE430;
  if (!qword_254ABE430)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2116B1A94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PauseRingsPeriod();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2116B1AD8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PauseRingsPeriod();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void PauseRingsPeriod.date()(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  _QWORD v33[18];

  v33[12] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254ABDED8);
  MEMORY[0x24BDAC7A8](v2);
  v33[7] = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254ABDEE0);
  MEMORY[0x24BDAC7A8](v4);
  v33[6] = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2116BFA78();
  v33[8] = *(_QWORD *)(v6 - 8);
  v33[9] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D8A1D0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v33[5] = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v33[4] = (char *)v33 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v13 = sub_2116BFB50();
  v33[13] = *(_QWORD *)(v13 - 8);
  v33[14] = v13;
  MEMORY[0x24BDAC7A8](v13);
  v33[10] = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2116BFACC();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v33[1] = (char *)v33 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v33[3] = (char *)v33 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v33[0] = (char *)v33 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v33[2] = (char *)v33 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)v33 - v29;
  v31 = sub_2116BFB5C();
  v33[15] = *(_QWORD *)(v31 - 8);
  v33[16] = v31;
  MEMORY[0x24BDAC7A8](v31);
  sub_2116BFB44();
  v33[17] = v30;
  sub_2116BFAC0();
  sub_2116B1A94(v1, (uint64_t)v17);
  v33[11] = v19;
  v32 = (char *)sub_2116B1E50
      + 4 * byte_2116C2340[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 3, v18)];
  __asm { BR              X10 }
}

uint64_t sub_2116B1E50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v5 = *(_QWORD *)(v4 - 136);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v3, v1);
  v7 = *(_QWORD *)(v4 - 120);
  v6 = *(_QWORD *)(v4 - 112);
  v8 = *(_QWORD *)(v4 - 144);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v8, *MEMORY[0x24BDCF220], v6);
  sub_2116BFB38();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v6);
  v9 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9(v2, v1);
  v9(*(_QWORD *)(v4 - 88), v1);
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 104) + 8))(v0, *(_QWORD *)(v4 - 96));
}

void PauseRingsPeriod.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  v1 = sub_2116BFACC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2116B1A94(v0, (uint64_t)v5);
  v6 = (char *)sub_2116B2650
     + 4 * byte_2116C2344[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v5, 3, v1)];
  __asm { BR              X10 }
}

uint64_t sub_2116B2650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
  sub_2116BFE5C();
  sub_2116B35C4(&qword_254ABDEF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_2116BFBC8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
}

void PauseRingsPeriod.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v1 = v0;
  v2 = sub_2116BFACC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2116BFE50();
  sub_2116B1A94(v1, (uint64_t)v6);
  v7 = (char *)sub_2116B27B4
     + 4 * byte_2116C2348[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v6, 3, v2)];
  __asm { BR              X10 }
}

uint64_t sub_2116B27B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v0);
  sub_2116BFE5C();
  sub_2116B35C4(&qword_254ABDEF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_2116BFBC8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v0);
  return sub_2116BFE68();
}

uint64_t sub_2116B285C@<X0>(_QWORD *a1@<X8>)
{
  if (qword_254ABE2A0 != -1)
    swift_once();
  swift_beginAccess();
  *a1 = qword_254ABE2A8;
  return swift_bridgeObjectRetain();
}

void sub_2116B28D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v1 = v0;
  v2 = sub_2116BFACC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2116BFE50();
  sub_2116B1A94(v1, (uint64_t)v6);
  v7 = (char *)sub_2116B29AC
     + 4 * byte_2116C234C[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v6, 3, v2)];
  __asm { BR              X10 }
}

uint64_t sub_2116B29AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v0);
  sub_2116BFE5C();
  sub_2116B35C4(&qword_254ABDEF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_2116BFBC8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v0);
  return sub_2116BFE68();
}

void _s7Fitness16PauseRingsPeriodO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v4 = sub_2116BFACC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = type metadata accessor for PauseRingsPeriod();
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254ABDF80);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_2116B1A94(a1, (uint64_t)v10);
  sub_2116B1A94(a2, v11);
  v12 = (char *)sub_2116B2B70
      + 4 * byte_2116C2350[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 3, v4)];
  __asm { BR              X10 }
}

uint64_t sub_2116B2B70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  char v7;
  void (*v9)(uint64_t, uint64_t);

  sub_2116B1A94(v1, v3);
  if (v4(v5, 3, v0))
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v0);
    sub_2116B3588(v1, &qword_254ABDF80);
    v7 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, v5, v0);
    v7 = sub_2116BFA9C();
    v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v9(v2, v0);
    v9(v3, v0);
    sub_2116B1AD8(v1);
  }
  return v7 & 1;
}

uint64_t sub_2116B2C80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_2116BFB50();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254ABDF88);
    v10 = sub_2116BFD30();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_2116B35C4(&qword_254ABDF90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_2116BFBBC();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_2116B35C4(&qword_254ABDF98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_2116BFBD4();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

unint64_t sub_2116B2EEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254ABDEF8;
  if (!qword_254ABDEF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254ABDF00);
    result = MEMORY[0x212BDFD94](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254ABDEF8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BDFD88](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2116B2F7C()
{
  return sub_2116B35C4(&qword_254ABDF08, (uint64_t (*)(uint64_t))type metadata accessor for PauseRingsPeriod, (uint64_t)&protocol conformance descriptor for PauseRingsPeriod);
}

uint64_t *initializeBufferWithCopyOfBuffer for PauseRingsPeriod(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = sub_2116BFACC();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t destroy for PauseRingsPeriod(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_2116BFACC();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 3, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *initializeWithCopy for PauseRingsPeriod(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2116BFACC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithCopy for PauseRingsPeriod(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_2116BFACC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

void *initializeWithTake for PauseRingsPeriod(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2116BFACC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *assignWithTake for PauseRingsPeriod(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_2116BFACC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PauseRingsPeriod()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2116B340C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = sub_2116BFACC();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4)
    return v5 - 3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PauseRingsPeriod()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2116B3464(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 3);
  else
    v5 = 0;
  v6 = sub_2116BFACC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_2116B34B8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2116BFACC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
}

uint64_t sub_2116B34F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2116BFACC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 3, v4);
}

uint64_t sub_2116B3534()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2116BFACC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_2116B3588(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2116B35C4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BDFD94](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2116B3604()
{
  return 0;
}

id sub_2116B360C()
{
  return objc_msgSend((id)objc_opt_self(), sel_weakObjectsHashTable);
}

id sub_2116B3638(void *a1)
{
  id v2;

  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHealthStore_, a1);

  return v2;
}

id sub_2116B367C(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  char *v5;
  id v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR___FIPregnancyStateProvider_query] = 0;
  v3 = OBJC_IVAR___FIPregnancyStateProvider_observers;
  v4 = (void *)objc_opt_self();
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, sel_weakObjectsHashTable);
  *(_QWORD *)&v5[OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___FIPregnancyStateProvider_healthStore] = a1;
  v6 = a1;

  v9.receiver = v5;
  v9.super_class = (Class)FIPregnancyStateProvider;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  objc_msgSend(v7, sel_activate);

  return v7;
}

id sub_2116B377C()
{
  void *v0;
  os_log_type_t v1;
  void *v2;
  os_log_type_t v3;
  NSObject *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  swift_getObjectType();
  v1 = sub_2116BFCAC();
  v2 = (void *)*MEMORY[0x24BDD2FA8];
  v3 = v1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v1))
  {
    v4 = v2;
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v11 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = sub_2116BFE74();
    v10 = sub_2116B4900(v7, v8, &v11);
    sub_2116BFD00();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21168F000, v4, v3, "%s De-init called.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDFE0C](v6, -1, -1);
    MEMORY[0x212BDFE0C](v5, -1, -1);

  }
  objc_msgSend(v0, sel_stopQuery, v10, v11);
  v12.receiver = v0;
  v12.super_class = (Class)FIPregnancyStateProvider;
  return objc_msgSendSuper2(&v12, sel_dealloc);
}

void *sub_2116B396C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel);
  v2 = v1;
  return v1;
}

void *sub_2116B39A8()
{
  uint64_t v0;
  void *result;

  result = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel);
  if (result)
    return (void *)(objc_msgSend(result, sel_state) == (id)1);
  return result;
}

id sub_2116B3A10(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIPregnancyStateProvider_observers), sel_addObject_, a1);
}

id sub_2116B3A44(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIPregnancyStateProvider_observers), sel_removeObject_, a1);
}

void sub_2116B3A78(uint64_t a1)
{
  uint64_t v1;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;

  v3 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___FIPregnancyStateProvider_observers), sel_allObjects);
  v4 = sub_2116BFC40();

  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v5 = sub_2116BFDCC();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_13;
LABEL_3:
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
        MEMORY[0x212BDF554](i, v4);
      else
        swift_unknownObjectRetain();
      v7 = (void *)swift_dynamicCastObjCProtocolConditional();
      if (v7)
        objc_msgSend(v7, sel_pregnancyModelDidChangeWithProvider_model_, v1, a1);
      swift_unknownObjectRelease();
    }
    goto LABEL_13;
  }
  __break(1u);
}

void sub_2116B3C44()
{
  uint64_t v0;
  uint64_t ObjectType;
  os_log_type_t v2;
  void *v3;
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t aBlock[6];

  ObjectType = swift_getObjectType();
  v2 = sub_2116BFCAC();
  v3 = (void *)*MEMORY[0x24BDD2FA8];
  v4 = v2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v2))
  {
    v5 = v3;
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    aBlock[0] = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = sub_2116BFE74();
    sub_2116B4900(v8, v9, aBlock);
    sub_2116BFD00();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21168F000, v5, v4, "%s Starting pregnancy state query.", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDFE0C](v7, -1, -1);
    MEMORY[0x212BDFE0C](v6, -1, -1);

  }
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = ObjectType;
  v12 = objc_allocWithZone(MEMORY[0x24BDD3CB8]);
  aBlock[4] = (uint64_t)sub_2116B4FE8;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2116B483C;
  aBlock[3] = (uint64_t)&block_descriptor;
  v13 = _Block_copy(aBlock);
  swift_retain();
  v14 = objc_msgSend(v12, sel_initWithUpdateHandler_, v13);
  _Block_release(v13);
  swift_release();
  swift_release();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___FIPregnancyStateProvider_healthStore), sel_executeQuery_, v14);
  v15 = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_query);
  *(_QWORD *)(v0 + OBJC_IVAR___FIPregnancyStateProvider_query) = v14;

}

void sub_2116B3EC8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  os_log_type_t v3;
  void *v4;
  os_log_type_t v5;
  NSObject *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;

  swift_getObjectType();
  v1 = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_query);
  if (v1)
  {
    v2 = *(void **)(v0 + OBJC_IVAR___FIPregnancyStateProvider_healthStore);
    v11 = v1;
    objc_msgSend(v2, sel_stopQuery_);
    v3 = sub_2116BFCAC();
    v4 = (void *)*MEMORY[0x24BDD2FA8];
    v5 = v3;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v3))
    {
      v6 = v4;
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v12 = v8;
      *(_DWORD *)v7 = 136315138;
      v9 = sub_2116BFE74();
      sub_2116B4900(v9, v10, &v12);
      sub_2116BFD00();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21168F000, v6, v5, "%s Stopping pregnancy state query.", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BDFE0C](v8, -1, -1);
      MEMORY[0x212BDFE0C](v7, -1, -1);

    }
    else
    {

    }
  }
}

void sub_2116B40A4(void *a1)
{
  char *v1;
  char *v2;
  os_log_type_t v4;
  os_log_t *v5;
  void *v6;
  os_log_type_t v7;
  id v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  os_log_type_t v20;
  os_log_t v21;
  _BOOL4 v22;
  BOOL v23;
  id v24;
  uint8_t *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint8_t *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *log;
  NSObject *loga;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;

  v2 = v1;
  swift_getObjectType();
  v4 = sub_2116BFCAC();
  v5 = (os_log_t *)MEMORY[0x24BDD2FA8];
  v6 = (void *)*MEMORY[0x24BDD2FA8];
  v7 = v4;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v4))
  {
    v8 = a1;
    log = v6;
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    *(_DWORD *)v9 = 136315138;
    v43 = v10;
    v44 = 0;
    v45 = 0xE000000000000000;
    sub_2116BFD3C();
    sub_2116BFC10();
    sub_2116BFE74();
    sub_2116BFC10();
    swift_bridgeObjectRelease();
    sub_2116BFC10();
    v11 = objc_msgSend(v8, sel_description);
    sub_2116BFBEC();

    sub_2116BFC10();
    swift_bridgeObjectRelease();
    sub_2116BFC10();
    v12 = (void *)sub_2116BFBE0();
    swift_bridgeObjectRelease();
    v13 = (id)HKSensitiveLogItem();

    sub_2116BFD18();
    swift_unknownObjectRelease();
    v14 = sub_2116BFBF8();
    v44 = sub_2116B4900(v14, v15, &v43);
    sub_2116BFD00();

    v5 = (os_log_t *)MEMORY[0x24BDD2FA8];
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21168F000, log, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BDFE0C](v10, -1, -1);
    MEMORY[0x212BDFE0C](v9, -1, -1);

  }
  v16 = OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel;
  v17 = *(_QWORD *)&v2[OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel];
  if (v17)
    v18 = objc_msgSend(*(id *)&v2[OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel], sel_state);
  else
    v18 = 0;
  v19 = objc_msgSend(a1, sel_state);
  v20 = sub_2116BFCAC();
  v21 = *v5;
  v22 = os_log_type_enabled(*v5, v20);
  if (v17)
    v23 = v18 == v19;
  else
    v23 = 0;
  if (v23)
  {
    if (v22)
    {
      v33 = v21;
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      *(_DWORD *)v34 = 136315138;
      v43 = v35;
      v44 = 0;
      v45 = 0xE000000000000000;
      sub_2116BFD3C();
      sub_2116BFC10();
      sub_2116BFE74();
      sub_2116BFC10();
      swift_bridgeObjectRelease();
      sub_2116BFC10();
      v36 = (void *)sub_2116BFBE0();
      swift_bridgeObjectRelease();
      v37 = (id)HKSensitiveLogItem();

      sub_2116BFD18();
      swift_unknownObjectRelease();
      v38 = sub_2116BFBF8();
      v44 = sub_2116B4900(v38, v39, &v43);
      sub_2116BFD00();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21168F000, v33, v20, "%s", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BDFE0C](v35, -1, -1);
      MEMORY[0x212BDFE0C](v34, -1, -1);

    }
  }
  else
  {
    if (v22)
    {
      v24 = a1;
      loga = v21;
      v25 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      *(_DWORD *)v25 = 136315138;
      v43 = v40;
      v44 = 0;
      v45 = 0xE000000000000000;
      sub_2116BFD3C();
      sub_2116BFC10();
      sub_2116BFE74();
      sub_2116BFC10();
      swift_bridgeObjectRelease();
      sub_2116BFC10();
      v26 = objc_msgSend(v24, sel_description);
      sub_2116BFBEC();

      sub_2116BFC10();
      swift_bridgeObjectRelease();
      sub_2116BFC10();
      v27 = (void *)sub_2116BFBE0();
      swift_bridgeObjectRelease();
      v28 = (id)HKSensitiveLogItem();

      sub_2116BFD18();
      swift_unknownObjectRelease();
      v29 = sub_2116BFBF8();
      v44 = sub_2116B4900(v29, v30, &v43);
      sub_2116BFD00();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21168F000, loga, v20, "%s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BDFE0C](v40, -1, -1);
      MEMORY[0x212BDFE0C](v25, -1, -1);

    }
    v31 = *(void **)&v2[v16];
    *(_QWORD *)&v2[v16] = a1;
    v32 = a1;

    if (*(_QWORD *)&v2[v16])
      objc_msgSend(v2, sel_notifyObservers_);

  }
}

void __swiftcall FIPregnancyStateProvider.init()(FIPregnancyStateProvider *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void FIPregnancyStateProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2116B483C(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(id, void *, void *);
  id v8;
  id v9;
  id v10;

  v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(v10, a3, a4);
  swift_release();

}

unint64_t type metadata accessor for FIPregnancyStateProvider()
{
  unint64_t result;

  result = qword_254ABE440[0];
  if (!qword_254ABE440[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_254ABE440);
  }
  return result;
}

uint64_t sub_2116B4900(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2116B49D0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2116B4F60((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2116B4F60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2116B49D0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2116BFD0C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2116B4B88(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2116BFD60();
  if (!v8)
  {
    sub_2116BFDA8();
    __break(1u);
LABEL_17:
    result = sub_2116BFDE4();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2116B4B88(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2116B4C1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2116B4DF4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2116B4DF4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2116B4C1C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2116B4D90(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2116BFD48();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2116BFDA8();
      __break(1u);
LABEL_10:
      v2 = sub_2116BFC1C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2116BFDE4();
    __break(1u);
LABEL_14:
    result = sub_2116BFDA8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2116B4D90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE038);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2116B4DF4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE038);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2116BFDE4();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2116B4F60(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2116B4FA0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2116B4FC4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2116B4FE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  void *v8;
  os_log_type_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_QWORD *)(v3 + 16) + 16;
  swift_beginAccess();
  v7 = (void *)MEMORY[0x212BDFE54](v6);
  if (v7)
  {
    v8 = v7;
    if (a2)
    {
      objc_msgSend(v7, sel_pregnancyModelDidChangeWithModel_, a2);
LABEL_7:

      return;
    }
    v9 = sub_2116BFCA0();
    v10 = (void *)*MEMORY[0x24BDD2FA8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v9))
      goto LABEL_7;
    v11 = a3;
    v12 = a3;
    v13 = v10;
    v14 = swift_slowAlloc();
    v15 = (_QWORD *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v21 = v16;
    *(_DWORD *)v14 = 136315394;
    v17 = sub_2116BFE74();
    sub_2116B4900(v17, v18, &v21);
    sub_2116BFD00();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    if (a3)
    {
      v19 = a3;
      v20 = _swift_stdlib_bridgeErrorToNSError();
      sub_2116BFD00();
    }
    else
    {
      sub_2116BFD00();
      v20 = 0;
    }
    *v15 = v20;

    _os_log_impl(&dword_21168F000, v13, v9, "%s Error when trying to get model from pregnancy state query: %@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE040);
    swift_arrayDestroy();
    MEMORY[0x212BDFE0C](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x212BDFE0C](v16, -1, -1);
    MEMORY[0x212BDFE0C](v14, -1, -1);

  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

BOOL sub_2116B5258(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2116B5268()
{
  return sub_2116BFE5C();
}

uint64_t sub_2116B528C()
{
  sub_2116BFE50();
  sub_2116BFE5C();
  return sub_2116BFE68();
}

BOOL sub_2116B52D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2116B52E4()
{
  sub_2116BFE50();
  sub_2116BFE5C();
  return sub_2116BFE68();
}

uint64_t sub_2116B5328()
{
  return sub_2116BFE5C();
}

uint64_t sub_2116B5350()
{
  sub_2116BFE50();
  sub_2116BFE5C();
  return sub_2116BFE68();
}

uint64_t sub_2116B53CC()
{
  return sub_2116BFBE0();
}

uint64_t sub_2116B5414()
{
  return sub_2116BFBE0();
}

uint64_t sub_2116B545C()
{
  return sub_2116BFBE0();
}

uint64_t sub_2116B549C()
{
  return 0x65676E6172;
}

uint64_t sub_2116B54B0()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2116B54BC()
{
  return 1;
}

uint64_t sub_2116B54C4()
{
  uint64_t ObjectType;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD aBlock[6];

  ObjectType = swift_getObjectType();
  v1 = sub_2116BFB8C();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v14 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2116BFBA4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2116BE10C(0, &qword_253D8A250);
  v9 = (void *)sub_2116BFCD0();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = ObjectType;
  aBlock[4] = sub_2116BDE70;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B70D0;
  aBlock[3] = &block_descriptor_101;
  v11 = _Block_copy(aBlock);
  swift_release();
  sub_2116BFB98();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2116B35C4(&qword_253D8A260, v2, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
  sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
  sub_2116BFD24();
  MEMORY[0x212BDF4DC](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_2116B56D0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  char v8;

  v2 = v1;
  v4 = OBJC_IVAR___FIPauseRingsCoordinator_state;
  v5 = *(void **)(v2 + OBJC_IVAR___FIPauseRingsCoordinator_state);
  *(_QWORD *)(v2 + OBJC_IVAR___FIPauseRingsCoordinator_state) = a1;
  sub_2116BB0D8(v5);
  sub_2116BB0D8(a1);
  sub_2116BAFE4(v5);
  v6 = *(void **)(v2 + v4);
  if (v6 == (void *)1 || v5 == (void *)1)
    goto LABEL_6;
  if (!v5)
  {
    if (!v6)
    {
      v5 = 0;
      goto LABEL_7;
    }
    sub_2116BAFE4(0);
    goto LABEL_6;
  }
  if (!v6
    || (sub_2116BE10C(0, &qword_254ABE168),
        sub_2116BB0D8(v5),
        sub_2116BB0D8(v6),
        v8 = sub_2116BFCF4(),
        sub_2116BAFE4(v6),
        sub_2116BAFE4(v5),
        (v8 & 1) == 0))
  {
LABEL_6:
    sub_2116B54C4();
  }
LABEL_7:
  sub_2116BAFE4(a1);
  sub_2116BAFE4(v5);
}

void sub_2116B57C0(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, _QWORD, uint64_t);
  uint64_t v19;
  char *v20;
  id v21;
  void *ObjCClassFromMetadata;
  char *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t ObjectType;
  id v34;
  void *v35;
  id v36;
  unsigned int v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  char *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  char *v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  objc_super v60;
  uint64_t aBlock;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;

  v59 = sub_2116BFCC4();
  v57 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2116BFCB8();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_2116BFBA4();
  MEMORY[0x24BDAC7A8](v7);
  *(_QWORD *)&v1[OBJC_IVAR___FIPauseRingsCoordinator_query] = 0;
  v8 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals] = MEMORY[0x24BEE4AF8];
  v9 = v8;
  *(_QWORD *)&v1[OBJC_IVAR___FIPauseRingsCoordinator_state] = 1;
  *(_QWORD *)&v1[OBJC_IVAR___FIPauseRingsCoordinator_healthStore] = a1;
  v56 = sub_2116BE10C(0, &qword_253D8A250);
  v58 = v1;
  v51 = a1;
  sub_2116BFB98();
  aBlock = v9;
  sub_2116B35C4(&qword_253D8A248, v6, MEMORY[0x24BEE5698]);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A230);
  v11 = sub_2116BB8DC(&qword_253D8A238, &qword_253D8A230);
  v54 = v10;
  v55 = v11;
  sub_2116BFD24();
  v12 = *MEMORY[0x24BEE5750];
  v57 = *(_QWORD *)(v57 + 104);
  v52 = v4;
  v53 = v12;
  v13 = v59;
  ((void (*)(char *, uint64_t, uint64_t))v57)(v4, v12, v59);
  v14 = sub_2116BFCE8();
  v15 = v58;
  *(_QWORD *)&v58[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue] = v14;
  sub_2116BFB98();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_2116BFD24();
  v16 = v52;
  v17 = v12;
  v18 = (void (*)(char *, _QWORD, uint64_t))v57;
  ((void (*)(char *, uint64_t, uint64_t))v57)(v52, v17, v13);
  *(_QWORD *)&v15[OBJC_IVAR___FIPauseRingsCoordinator_syncQueue] = sub_2116BFCE8();
  sub_2116BFB98();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_2116BFD24();
  v18(v16, v53, v59);
  v19 = sub_2116BFCE8();
  v20 = v58;
  *(_QWORD *)&v58[OBJC_IVAR___FIPauseRingsCoordinator_metricQueue] = v19;

  v60.receiver = v20;
  v60.super_class = (Class)FIPauseRingsCoordinator;
  v21 = objc_msgSendSuper2(&v60, sel_init);
  sub_2116BE10C(0, &qword_253D8A240);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v23 = (char *)v21;
  v24 = objc_msgSend(ObjCClassFromMetadata, sel_pauseRingsScheduleType);
  if (!v24)
  {
    __break(1u);
    goto LABEL_9;
  }
  v25 = v24;
  v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v27 = objc_allocWithZone(MEMORY[0x24BDD3DC8]);
  v65 = sub_2116B5EEC;
  v66 = v26;
  v28 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v62 = 1107296256;
  v63 = sub_2116BAF1C;
  v64 = &block_descriptor_0;
  v29 = _Block_copy(&aBlock);
  swift_retain();
  v30 = objc_msgSend(v27, sel_initWithSampleType_predicate_updateHandler_, v25, 0, v29);

  _Block_release(v29);
  swift_release();
  swift_release();
  v31 = *(void **)&v23[OBJC_IVAR___FIPauseRingsCoordinator_query];
  *(_QWORD *)&v23[OBJC_IVAR___FIPauseRingsCoordinator_query] = v30;
  v32 = v30;

  ObjectType = swift_getObjectType();
  v34 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v34)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v35 = v34;
  v36 = objc_msgSend(v34, sel_features);

  if (!v36)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v37 = objc_msgSend(v36, sel_pauseRings);

  if (!v37)
  {
LABEL_7:

    return;
  }
  sub_2116BFBEC();
  v38 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v39 = (void *)sub_2116BFBE0();
  swift_bridgeObjectRelease();
  v40 = objc_msgSend(v38, sel_initWithKey_ascending_, v39, 1);

  v41 = objc_msgSend(ObjCClassFromMetadata, sel_pauseRingsScheduleType);
  if (v41)
  {
    v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A288);
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_2116C2440;
    *(_QWORD *)(v43 + 32) = v40;
    aBlock = v43;
    sub_2116BFC4C();
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = v23;
    *(_QWORD *)(v44 + 24) = ObjectType;
    v45 = objc_allocWithZone(MEMORY[0x24BDD3F00]);
    sub_2116BE10C(0, &qword_253D8A278);
    v46 = v40;
    v47 = v23;
    v48 = (void *)sub_2116BFC34();
    swift_bridgeObjectRelease();
    v65 = sub_2116BE3E0;
    v66 = v44;
    aBlock = v28;
    v62 = 1107296256;
    v63 = sub_2116BBE00;
    v64 = &block_descriptor_143;
    v49 = _Block_copy(&aBlock);
    v50 = objc_msgSend(v45, sel_initWithSampleType_predicate_limit_sortDescriptors_resultsHandler_, v42, 0, 0, v48, v49);

    _Block_release(v49);
    swift_release();
    objc_msgSend(*(id *)&v47[OBJC_IVAR___FIPauseRingsCoordinator_healthStore], sel_executeQuery_, v50);

    goto LABEL_7;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_2116B5EC8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2116B5EEC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  swift_beginAccess();
  v1 = MEMORY[0x212BDFE54](v0 + 16);
  if (v1)
  {
    v2 = (void *)v1;
    sub_2116B5F3C();

  }
}

void sub_2116B5F3C()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[6];

  v1 = v0;
  sub_2116BFCAC();
  v2 = (id)*MEMORY[0x24BDD2FA8];
  sub_2116BFB80();

  sub_2116BFBEC();
  v3 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v4 = (void *)sub_2116BFBE0();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithKey_ascending_, v4, 1);

  sub_2116BE10C(0, &qword_253D8A240);
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_pauseRingsScheduleType);
  if (v6)
  {
    v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A288);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_2116C2440;
    *(_QWORD *)(v8 + 32) = v5;
    sub_2116BFC4C();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v1;
    v10 = objc_allocWithZone(MEMORY[0x24BDD3F00]);
    sub_2116BE10C(0, &qword_253D8A278);
    v11 = v5;
    v12 = v1;
    v13 = (void *)sub_2116BFC34();
    swift_bridgeObjectRelease();
    v16[4] = sub_2116BDE1C;
    v16[5] = v9;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_2116BBE00;
    v16[3] = &block_descriptor_89;
    v14 = _Block_copy(v16);
    v15 = objc_msgSend(v10, sel_initWithSampleType_predicate_limit_sortDescriptors_resultsHandler_, v7, 0, 0, v13, v14);

    _Block_release(v14);
    swift_release();
    objc_msgSend(*(id *)&v12[OBJC_IVAR___FIPauseRingsCoordinator_healthStore], sel_executeQuery_, v15);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2116B62E0(unint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  os_log_type_t v15;
  void *v16;
  NSObject *v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v8 = sub_2116BFB8C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2116BFBA4();
  v28 = *(_QWORD *)(v12 - 8);
  v29 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2116BFCAC();
  v16 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v15))
  {
    v26 = a4;
    v27 = v9;
    swift_bridgeObjectRetain_n();
    v17 = v16;
    v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v18 = 134217984;
    if (a1)
    {
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        v19 = sub_2116BFDCC();
        swift_bridgeObjectRelease();
      }
      else
      {
        v19 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v19 = 0;
    }
    aBlock[0] = v19;
    sub_2116BFD00();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21168F000, v17, v15, "[PauseRingsCoordinator] Received initial query results (%ld count)...", v18, 0xCu);
    MEMORY[0x212BDFE0C](v18, -1, -1);

    a4 = v26;
    v9 = v27;
  }
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a1;
  v20[4] = a2;
  v20[5] = a4;
  aBlock[4] = sub_2116BE43C;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B70D0;
  aBlock[3] = &block_descriptor_149;
  v21 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v22 = a3;
  v23 = a2;
  sub_2116BFB98();
  v30 = MEMORY[0x24BEE4AF8];
  sub_2116B35C4(&qword_253D8A260, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
  sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
  sub_2116BFD24();
  MEMORY[0x212BDF4DC](0, v14, v11, v21);
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v29);
  return swift_release();
}

id sub_2116B65E4(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  id result;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v8 = sub_2116BFB8C();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v21 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2116BFBA4();
  v12 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2116B6838(a2, a3);
  sub_2116BE10C(0, &qword_253D8A250);
  v15 = (void *)sub_2116BFCD0();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a4;
  aBlock[4] = sub_2116BE448;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B70D0;
  aBlock[3] = &block_descriptor_155;
  v17 = _Block_copy(aBlock);
  v18 = a1;
  swift_release();
  sub_2116BFB98();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2116B35C4(&qword_253D8A260, v9, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
  sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
  sub_2116BFD24();
  MEMORY[0x212BDF4DC](0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v8);
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  if (*(_QWORD *)&v18[OBJC_IVAR___FIPauseRingsCoordinator_query])
    return objc_msgSend(*(id *)&v18[OBJC_IVAR___FIPauseRingsCoordinator_healthStore], sel_executeQuery_);
  return result;
}

void sub_2116B6838(unint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  BOOL v25;
  unint64_t v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char *v37;
  char *v38;
  char *v39;
  unint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  os_log_type_t v47;
  void *v48;
  os_log_type_t v49;
  id v50;
  id v51;
  NSObject *v52;
  uint8_t *v53;
  _QWORD *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;

  v4 = (_QWORD *)sub_2116BFB5C();
  v5 = *(v4 - 1);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (_QWORD *)sub_2116BFACC();
  v9 = *(v8 - 1);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (uint64_t)&v58 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v65 = (uint64_t)&v58 - v19;
  if (a2)
    goto LABEL_57;
  if (!a1)
    goto LABEL_57;
  v20 = sub_2116B9A0C(a1);
  if (!v20)
    goto LABEL_57;
  v21 = v20;
  v22 = v20 & 0xFFFFFFFFFFFFFF8;
  v23 = v20 >> 62;
  if (!(v20 >> 62))
  {
    v24 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v24)
      goto LABEL_6;
    goto LABEL_56;
  }
  while (2)
  {
    v63 = v23;
    v24 = sub_2116BFDCC();
    v23 = v63;
    if (!v24)
    {
LABEL_56:
      swift_bridgeObjectRelease();
LABEL_57:
      sub_2116BFCAC();
      v45 = (id)*MEMORY[0x24BDD2FA8];
      v46 = MEMORY[0x24BEE4AF8];
      sub_2116BFB80();

      *(_QWORD *)(v66 + OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals) = v46;
      swift_bridgeObjectRelease();
      sub_2116B56D0(0);
      return;
    }
LABEL_6:
    v25 = __OFSUB__(v24, 1);
    v26 = v24 - 1;
    if (v25)
      goto LABEL_60;
    v63 = v23;
    v64 = v21 & 0xC000000000000001;
    v62 = v22;
    if ((v21 & 0xC000000000000001) == 0)
    {
      if ((v26 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (v26 < *(_QWORD *)(v22 + 16))
      {
        v27 = *(id *)(v21 + 8 * v26 + 32);
        goto LABEL_11;
      }
      __break(1u);
      goto LABEL_64;
    }
LABEL_61:
    v27 = (id)MEMORY[0x212BDF554](v26, v21);
LABEL_11:
    v28 = v27;
    v59 = objc_msgSend(v27, sel_endDateIndex);
    v61 = v28;
    v60 = objc_msgSend(v28, sel_startDateIndex);
    sub_2116BFAC0();
    v29 = (void *)sub_2116BFA90();
    (*(void (**)(char *, _QWORD *))(v9 + 8))(v11, v8);
    v30 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
    sub_2116BFB14();

    v31 = (void *)sub_2116BFAFC();
    (*(void (**)(char *, _QWORD *))(v5 + 8))(v7, v4);
    v32 = (id)_HKActivityCacheDateComponentsFromDate();

    if (v32)
    {
      sub_2116BFA3C();

      v33 = sub_2116BFA78();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v18, 0, 1, v33);
    }
    else
    {
      v33 = sub_2116BFA78();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v18, 1, 1, v33);
    }
    v34 = v65;
    v9 = v66;
    v22 = v64;
    sub_2116BAFF4(v18, v65);
    sub_2116BB03C(v34, (uint64_t)v15);
    sub_2116BFA78();
    v35 = *(_QWORD *)(v33 - 8);
    v36 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v15, 1, v33) != 1)
    {
      v36 = (void *)sub_2116BFA30();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v33);
    }
    v5 = _HKCacheIndexFromDateComponents();

    if (!v63)
    {
      v15 = *(char **)(v62 + 16);
      swift_bridgeObjectRetain();
      if (v15)
        goto LABEL_18;
      break;
    }
LABEL_64:
    swift_bridgeObjectRetain();
    v15 = (char *)sub_2116BFDCC();
    if (v15)
    {
LABEL_18:
      v18 = 0;
      v7 = 0;
      v8 = 0;
      v62 = v5;
      v63 = v21 + 32;
      v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v5 = 1;
      while (1)
      {
        if (v22)
          v37 = (char *)MEMORY[0x212BDF554](v18, v21);
        else
          v37 = (char *)*(id *)(v63 + 8 * v18);
        v11 = v37;
        v25 = __OFADD__(v18++, 1);
        if (v25)
          goto LABEL_53;
        if ((v5 & 1) != 0)
        {
          v7 = (char *)objc_msgSend(v37, sel_startDateIndex);
          v8 = objc_msgSend(v11, sel_endDateIndex);

          if ((uint64_t)v8 < (uint64_t)v7)
            goto LABEL_59;
          if ((char *)v18 == v15)
            goto LABEL_48;
          if (v22)
            v38 = (char *)MEMORY[0x212BDF554](v18, v21);
          else
            v38 = (char *)*(id *)(v63 + 8 * v18);
          v11 = v38;
          v25 = __OFADD__(v18++, 1);
          if (v25)
            goto LABEL_53;
        }
        if ((uint64_t)v8 >= (uint64_t)objc_msgSend(v11, sel_startDateIndex))
          break;
LABEL_42:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_2116BBEA0(0, v4[2] + 1, 1, v4);
        v5 = v4[2];
        v40 = v4[3];
        if (v5 >= v40 >> 1)
          v4 = sub_2116BBEA0((_QWORD *)(v40 > 1), v5 + 1, 1, v4);
        v4[2] = v5 + 1;
        v41 = &v4[2 * v5];
        v41[4] = v7;
        v41[5] = v8;
        v7 = (char *)objc_msgSend(v11, sel_startDateIndex);
        v8 = objc_msgSend(v11, sel_endDateIndex);

        if ((uint64_t)v8 < (uint64_t)v7)
        {
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
          goto LABEL_61;
        }
        v5 = 0;
        v22 = v64;
        if ((char *)v18 == v15)
          goto LABEL_48;
      }
      v8 = objc_msgSend(v11, sel_endDateIndex);

      if ((uint64_t)v8 < (uint64_t)v7)
      {
LABEL_54:
        __break(1u);
        continue;
      }
      if ((char *)v18 != v15)
      {
        while (1)
        {
          v39 = v22 ? (char *)MEMORY[0x212BDF554](v18, v21) : (char *)*(id *)(v21 + 8 * v18 + 32);
          v11 = v39;
          v5 = v18 + 1;
          if (__OFADD__(v18, 1))
            break;
          if ((uint64_t)v8 < (uint64_t)objc_msgSend(v39, sel_startDateIndex))
          {
            ++v18;
            goto LABEL_42;
          }
          v8 = objc_msgSend(v11, sel_endDateIndex);

          if ((uint64_t)v8 < (uint64_t)v7)
            goto LABEL_54;
          ++v18;
          if ((char *)v5 == v15)
            goto LABEL_48;
        }
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
LABEL_48:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_2116BBEA0(0, v4[2] + 1, 1, v4);
      v43 = v4[2];
      v42 = v4[3];
      if (v43 >= v42 >> 1)
        v4 = sub_2116BBEA0((_QWORD *)(v42 > 1), v43 + 1, 1, v4);
      v4[2] = v43 + 1;
      v44 = &v4[2 * v43];
      v44[4] = v7;
      v44[5] = v8;
      v5 = v62;
      goto LABEL_66;
    }
    break;
  }
  swift_bridgeObjectRelease();
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_66:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v9 + OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals) = v4;
  swift_bridgeObjectRelease();
  v47 = sub_2116BFCAC();
  v48 = (void *)*MEMORY[0x24BDD2FA8];
  if (v5 < (uint64_t)v60 || v5 >= (uint64_t)v59)
  {
    v56 = v48;
    sub_2116BFB80();

    v51 = 0;
    v50 = v61;
  }
  else
  {
    v49 = v47;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v47))
    {
      v50 = v61;
      v51 = v61;
      v52 = v48;
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v53 = 138412290;
      v67 = v51;
      v55 = v51;
      sub_2116BFD00();
      *v54 = v51;

      _os_log_impl(&dword_21168F000, v52, v49, "[PauseRingsCoordinator] State = paused: %@", v53, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE040);
      swift_arrayDestroy();
      MEMORY[0x212BDFE0C](v54, -1, -1);
      MEMORY[0x212BDFE0C](v53, -1, -1);

    }
    else
    {
      v50 = v61;
      v51 = v61;
    }
    v57 = v50;
  }
  sub_2116B56D0(v51);

  sub_2116B3588(v65, &qword_253D8A258);
}

uint64_t sub_2116B70D4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_2116B7100()
{
  void *v0;

  return objc_msgSend(v0, sel_isPausedForActivitySummary_, 0);
}

void sub_2116B7134(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  char *v41;
  uint64_t v42;
  _QWORD aBlock[6];
  unint64_t v44;

  v40 = a1;
  v1 = sub_2116BFB5C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2116BFACC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v40 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v42 = (uint64_t)&v40 - v16;
  v17 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v17)
    goto LABEL_25;
  v18 = v17;
  v19 = objc_msgSend(v17, sel_features);

  if (!v19)
  {
LABEL_26:
    __break(1u);
    return;
  }
  v20 = objc_msgSend(v19, sel_pauseRings);

  if (!v20)
    return;
  sub_2116BFAC0();
  v21 = (void *)sub_2116BFA90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v22 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  sub_2116BFB14();

  v23 = (void *)sub_2116BFAFC();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v24 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v24)
  {
    sub_2116BFA3C();

    v25 = sub_2116BFA78();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v15, 0, 1, v25);
  }
  else
  {
    v25 = sub_2116BFA78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v15, 1, 1, v25);
  }
  v26 = v42;
  sub_2116BAFF4((uint64_t)v15, v42);
  sub_2116BB03C(v26, (uint64_t)v12);
  sub_2116BFA78();
  v27 = *(_QWORD *)(v25 - 8);
  v28 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v12, 1, v25) != 1)
  {
    v28 = (void *)sub_2116BFA30();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v25);
  }
  _HKCacheIndexFromDateComponents();

  v44 = 2;
  v29 = v41;
  v30 = *(NSObject **)&v41[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = &v44;
  *(_QWORD *)(v31 + 24) = v29;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = sub_2116BB084;
  *(_QWORD *)(v32 + 24) = v31;
  aBlock[4] = sub_2116BB098;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B76C0;
  aBlock[3] = &block_descriptor_9;
  v33 = _Block_copy(aBlock);
  v34 = v29;
  swift_retain();
  swift_release();
  dispatch_sync(v30, v33);
  _Block_release(v33);
  LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v33 & 1) != 0)
  {
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v35 = (id)v44;
  if (v44 >= 3)
  {
    v37 = v40;
    if (!v40)
    {
      sub_2116B3588(v26, &qword_253D8A258);
      sub_2116BB0B8((id)v44);
      swift_release();
      return;
    }
    sub_2116BB0C8((id)v44);
    v38 = v37;
    v39 = objc_msgSend(v35, sel_startDateIndex);
    if ((uint64_t)objc_msgSend(v35, sel_endDateIndex) >= (uint64_t)v39)
    {
      objc_msgSend(v38, sel__activitySummaryIndex);
      objc_msgSend(v38, sel__activitySummaryIndex);
      objc_msgSend(v38, sel_paused);

      sub_2116BB0B8(v35);
      sub_2116B3588(v42, &qword_253D8A258);
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  if (v40)
  {
    v36 = v40;
    if (objc_msgSend(v36, sel_paused))
    {
      objc_msgSend(v36, sel__activitySummaryIndex);

      sub_2116B3588(v26, &qword_253D8A258);
LABEL_22:
      sub_2116BB0B8((id)v44);
      swift_release();
      return;
    }
    sub_2116B3588(v26, &qword_253D8A258);

  }
  else
  {
    sub_2116B3588(v26, &qword_253D8A258);
  }
  sub_2116BB0B8((id)v44);
  swift_release();
}

uint64_t sub_2116B76C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_2116B7730(uint64_t a1)
{
  char *v1;
  id v3;
  void *v4;
  id v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char isEscapingClosureAtFileLocation;
  uint64_t v13;
  _QWORD *v14;
  _QWORD aBlock[6];
  uint64_t v17;

  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v3)
    goto LABEL_16;
  v4 = v3;
  v5 = objc_msgSend(v3, sel_features);

  if (!v5)
  {
LABEL_17:
    __break(1u);
    return;
  }
  v6 = objc_msgSend(v5, sel_pauseRings);

  if (!v6)
    return;
  v17 = MEMORY[0x24BEE4AF8];
  v7 = *(NSObject **)&v1[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = &v17;
  *(_QWORD *)(v8 + 24) = v1;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_2116BB10C;
  *(_QWORD *)(v9 + 24) = v8;
  aBlock[4] = sub_2116BE508;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B76C0;
  aBlock[3] = &block_descriptor_19;
  v10 = _Block_copy(aBlock);
  v11 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v13 = *(_QWORD *)(v17 + 16);
  if (v13)
  {
    v14 = (_QWORD *)(v17 + 40);
    do
    {
      if (*(v14 - 1) <= a1 && *v14 > a1)
        break;
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_2116B796C(uint64_t a1, uint64_t a2)
{
  char *v2;
  id v5;
  void *v6;
  id v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char isEscapingClosureAtFileLocation;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];
  uint64_t v23;

  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v5)
    goto LABEL_22;
  v6 = v5;
  v7 = objc_msgSend(v5, sel_features);

  if (!v7)
  {
LABEL_23:
    __break(1u);
    return;
  }
  v8 = objc_msgSend(v7, sel_pauseRings);

  if (!v8)
    return;
  v23 = MEMORY[0x24BEE4AF8];
  v9 = *(NSObject **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = &v23;
  *(_QWORD *)(v10 + 24) = v2;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_2116BB10C;
  *(_QWORD *)(v11 + 24) = v10;
  aBlock[4] = sub_2116BE508;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B76C0;
  aBlock[3] = &block_descriptor_29;
  v12 = _Block_copy(aBlock);
  v13 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v9, v12);
  _Block_release(v12);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v15 = *(_QWORD *)(v23 + 16);
  if (v15)
  {
    v16 = (uint64_t *)(v23 + 40);
    do
    {
      v18 = *(v16 - 1);
      v17 = *v16;
      if (v18 <= a1 && v17 > a1 && v18 <= a2 && v17 > a2)
        break;
      v16 += 2;
      --v15;
    }
    while (v15);
  }
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_2116B7BC8(char *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  unsigned int v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];

  v27 = a2;
  v28 = a3;
  v26 = a1;
  v4 = sub_2116BFB8C();
  v31 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2116BFBA4();
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2116BFACC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v14)
  {
    __break(1u);
    goto LABEL_7;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, sel_features);

  if (!v16)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v17 = objc_msgSend(v16, sel_pauseRings);

  if (v17)
  {
    v25 = *(_QWORD *)&v3[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v10);
    v18 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v19 = (char *)swift_allocObject();
    v20 = v27;
    *((_QWORD *)v19 + 2) = v3;
    *((_QWORD *)v19 + 3) = v20;
    v26 = v9;
    v21 = v4;
    *((_QWORD *)v19 + 4) = v28;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v19[v18], v13, v10);
    aBlock[4] = sub_2116BB1EC;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2116B70D0;
    aBlock[3] = &block_descriptor_35;
    v22 = _Block_copy(aBlock);
    v23 = v3;
    sub_2116BB8CC(v20);
    v24 = v26;
    sub_2116BFB98();
    v32 = MEMORY[0x24BEE4AF8];
    sub_2116B35C4(&qword_253D8A260, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
    sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
    sub_2116BFD24();
    MEMORY[0x212BDF4DC](0, v24, v6, v22);
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v21);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v30);
    swift_release();
  }
}

uint64_t sub_2116B7EB8(_QWORD *a1, void *a2)
{
  uint64_t v2;
  char **v3;
  uint64_t v4;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  char **v11;
  id v12;
  char **v13;
  char **v14;
  _QWORD *v15;
  char **v16;
  char **v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  char **v21;
  _QWORD *v22;
  uint64_t result;
  unint64_t v24;
  _QWORD *v25;

  v4 = v2;
  v7 = OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals;
  v25 = *(_QWORD **)(v2 + OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals);
  swift_bridgeObjectRetain_n();
  sub_2116BC108((uint64_t *)&v25);
  swift_bridgeObjectRelease();
  v8 = v25;
  if (!a2 || (v9 = v25[2]) == 0)
  {
LABEL_9:
    if (a1)
      goto LABEL_10;
    goto LABEL_19;
  }
  v24 = v9 - 1;
  v10 = &v25[2 * v9 - 2];
  v11 = (char **)v10[4];
  v3 = (char **)v10[5];
  v12 = a2;
  v13 = &selRef_otherWorkoutActivityTypes;
  v14 = (char **)objc_msgSend(v12, sel_startDateIndex);
  if ((uint64_t)v14 < (uint64_t)v11 || (uint64_t)v14 >= (uint64_t)v3)
  {

    goto LABEL_9;
  }
  if (v11 == objc_msgSend(v12, byte_24CC58C5A))
  {
    sub_2116B9930(v24);

    if (!a1)
      goto LABEL_19;
LABEL_10:
    v15 = a1;
    v16 = (char **)objc_msgSend(v15, sel_startDateIndex);
    v17 = (char **)objc_msgSend(v15, sel_endDateIndex);
    if ((uint64_t)v17 < (uint64_t)v16)
    {
      __break(1u);
    }
    else
    {
      v3 = v17;
      a1 = v25;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
LABEL_12:
        v19 = a1[2];
        v18 = a1[3];
        if (v19 >= v18 >> 1)
          a1 = sub_2116BBEA0((_QWORD *)(v18 > 1), v19 + 1, 1, a1);
        a1[2] = v19 + 1;
        v20 = &a1[2 * v19];
        v20[4] = v16;
        v20[5] = v3;

        goto LABEL_20;
      }
    }
    a1 = sub_2116BBEA0(0, a1[2] + 1, 1, a1);
    goto LABEL_12;
  }
  v21 = (char **)objc_msgSend(v12, byte_24CC58C5A);
  if ((uint64_t)v21 < (uint64_t)v11)
  {
    __break(1u);
  }
  else
  {
    v13 = v21;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      goto LABEL_17;
  }
  v8 = sub_2116BC170(v8);
LABEL_17:
  if (v9 <= v8[2])
  {
    v22 = &v8[2 * v24];
    v22[4] = v11;
    v22[5] = v13;

    v25 = v8;
    if (a1)
      goto LABEL_10;
LABEL_19:
    a1 = v25;
LABEL_20:
    *(_QWORD *)(v4 + v7) = a1;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_2116B80E0(char a1, void *a2, void *a3, char a4, char a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v11 = sub_2116BFB8C();
  v24 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_2116BFBA4();
  v14 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = FIIsFitnessTrackingEnabled();
  if ((_DWORD)result)
  {
    v22 = *(_QWORD *)(v5 + OBJC_IVAR___FIPauseRingsCoordinator_metricQueue);
    v18 = swift_allocObject();
    *(_BYTE *)(v18 + 16) = a1;
    *(_QWORD *)(v18 + 24) = a2;
    *(_QWORD *)(v18 + 32) = a3;
    *(_BYTE *)(v18 + 40) = a4 & 1;
    *(_BYTE *)(v18 + 41) = a5 & 1;
    aBlock[4] = sub_2116BDF24;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2116B70D0;
    aBlock[3] = &block_descriptor_107;
    v19 = _Block_copy(aBlock);
    v20 = a3;
    v21 = a2;
    sub_2116BFB98();
    v25 = MEMORY[0x24BEE4AF8];
    sub_2116B35C4(&qword_253D8A260, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
    sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
    sub_2116BFD24();
    MEMORY[0x212BDF4DC](0, v16, v13, v19);
    _Block_release(v19);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v23);
    return swift_release();
  }
  return result;
}

uint64_t sub_2116B82FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2116BFB8C();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v14 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2116BFBA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = *(_QWORD *)(v1 + OBJC_IVAR___FIPauseRingsCoordinator_syncQueue);
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_2116BDD34;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B70D0;
  aBlock[3] = &block_descriptor_80;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_2116BFB98();
  v15 = MEMORY[0x24BEE4AF8];
  sub_2116B35C4(&qword_253D8A260, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
  sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
  sub_2116BFD24();
  MEMORY[0x212BDF4DC](0, v9, v5, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  return swift_release();
}

void sub_2116B8508(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_2116B8568(char a1, void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v11 = sub_2116BFB8C();
  v24 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_2116BFBA4();
  v14 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_QWORD *)&a3[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  v17 = swift_allocObject();
  *(_BYTE *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  *(_QWORD *)(v17 + 32) = a3;
  aBlock[4] = a5;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B70D0;
  aBlock[3] = a6;
  v18 = _Block_copy(aBlock);
  v19 = a2;
  v20 = a3;
  sub_2116BFB98();
  v25 = MEMORY[0x24BEE4AF8];
  sub_2116B35C4(&qword_253D8A260, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
  sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
  sub_2116BFD24();
  MEMORY[0x212BDF4DC](0, v16, v13, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v23);
  return swift_release();
}

void sub_2116B8858(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_2116BFA84();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

void sub_2116B88B0(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  id v14;
  unsigned int v15;
  _QWORD *v16;
  void *v17;
  id v18;
  _QWORD v19[2];
  _QWORD aBlock[6];

  v5 = sub_2116BFB8C();
  v19[0] = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2116BFBA4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v12)
  {
    __break(1u);
    goto LABEL_7;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, sel_features);

  if (!v14)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v15 = objc_msgSend(v14, sel_pauseRings);

  if (v15)
  {
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v2;
    v16[3] = a1;
    v16[4] = a2;
    aBlock[4] = sub_2116BB950;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2116B70D0;
    aBlock[3] = &block_descriptor_41;
    v17 = _Block_copy(aBlock);
    v18 = v2;
    sub_2116BB8CC(a1);
    sub_2116BFB98();
    v19[1] = MEMORY[0x24BEE4AF8];
    sub_2116B35C4(&qword_253D8A260, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
    sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
    sub_2116BFD24();
    MEMORY[0x212BDF4DC](0, v11, v7, v17);
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v19[0] + 8))(v7, v5);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release();
  }
}

uint64_t sub_2116B8C74@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  unsigned int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char *v25;
  char isEscapingClosureAtFileLocation;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t result;
  id v32;
  void *v33;
  void (*v34)(char *, char *, uint64_t);
  int v35;
  uint64_t v36;
  char *v37;
  id v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  _QWORD aBlock[6];
  unint64_t v51;

  v3 = sub_2116BFB5C();
  v49 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v48 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D8A1D0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2116BFA78();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v47 = (char *)&v43 - v16;
  v17 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (!v17)
    goto LABEL_14;
  v18 = v17;
  v19 = objc_msgSend(v17, sel_features);

  if (!v19)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_17;
  }
  v20 = objc_msgSend(v19, sel_pauseRings);

  if (!v20)
  {
    v30 = sub_2116BFACC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(a1, 1, 1, v30);
  }
  v44 = v3;
  v46 = a1;
  v51 = 2;
  v21 = *(NSObject **)&v1[OBJC_IVAR___FIPauseRingsCoordinator_internalQueue];
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = &v51;
  *(_QWORD *)(v22 + 24) = v1;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_2116BB084;
  *(_QWORD *)(v23 + 24) = v22;
  v45 = v22;
  aBlock[4] = sub_2116BE508;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B76C0;
  aBlock[3] = &block_descriptor_51;
  v24 = _Block_copy(aBlock);
  v25 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v21, v24);
  _Block_release(v24);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v27 = (id)v51;
  if (v51 < 3)
  {
    v28 = sub_2116BFACC();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v46, 1, 1, v28);
    v29 = v27;
LABEL_12:
    sub_2116BB0B8(v29);
    return swift_release();
  }
  sub_2116BB0D8((id)v51);
  sub_2116BB0D8(v27);
  objc_msgSend(v27, sel_endDateIndex);
  v32 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  if (!v32)
    goto LABEL_16;
  v33 = v32;
  sub_2116BFA3C();

  v34 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v34(v10, v15, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  v36 = v44;
  if (v35 == 1)
  {
LABEL_17:
    sub_2116B3588((uint64_t)v10, &qword_253D8A258);
    goto LABEL_19;
  }
  v37 = v47;
  v34(v47, v10, v11);
  v38 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  v39 = v48;
  sub_2116BFB14();

  sub_2116BFB20();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v39, v36);
  v40 = sub_2116BFACC();
  v41 = *(_QWORD *)(v40 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v7, 1, v40) != 1)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v37, v11);
    sub_2116BB0B8(v27);
    sub_2116BB0B8(v27);
    v42 = v46;
    (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v46, v7, v40);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v41 + 56))(v42, 0, 1, v40);
    v29 = (id)v51;
    goto LABEL_12;
  }
  sub_2116B3588((uint64_t)v7, (uint64_t *)&unk_253D8A1D0);
LABEL_19:
  result = sub_2116BFDB4();
  __break(1u);
  return result;
}

uint64_t sub_2116B920C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v20;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D8A1D0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2116BFACC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - v10;
  v12 = objc_msgSend(v1, sel_resumeDate);
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  v13 = v12;
  sub_2116BFAA8();

  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_2116B3588((uint64_t)v4, (uint64_t *)&unk_253D8A1D0);
    return 0;
  }
  v14(v11, v4, v5);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v15, sel_setDateStyle_, 1);
  objc_msgSend(v15, sel_setTimeStyle_, 0);
  v16 = (void *)sub_2116BFA90();
  v17 = objc_msgSend(v15, sel_stringFromDate_, v16);

  v18 = sub_2116BFBEC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v18;
}

uint64_t sub_2116B9488(unint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  os_log_type_t v13;
  void *v14;
  NSObject *v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v6 = sub_2116BFB8C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2116BFBA4();
  v24 = *(_QWORD *)(v10 - 8);
  v25 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2116BFCAC();
  v14 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v13))
  {
    v23 = v7;
    swift_bridgeObjectRetain_n();
    v15 = v14;
    v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v16 = 134217984;
    if (a1)
    {
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        v17 = sub_2116BFDCC();
        swift_bridgeObjectRelease();
      }
      else
      {
        v17 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = 0;
    }
    aBlock[0] = v17;
    sub_2116BFD00();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21168F000, v15, v13, "[PauseRingsCoordinator] Received refresh query results (%ld count)...", v16, 0xCu);
    MEMORY[0x212BDFE0C](v16, -1, -1);

    v7 = v23;
  }
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a1;
  v18[4] = a2;
  aBlock[4] = sub_2116BDE38;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2116B70D0;
  aBlock[3] = &block_descriptor_95;
  v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v20 = a3;
  v21 = a2;
  sub_2116BFB98();
  v26 = MEMORY[0x24BEE4AF8];
  sub_2116B35C4(&qword_253D8A260, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A268);
  sub_2116BB8DC(&qword_253D8A270, &qword_253D8A268);
  sub_2116BFD24();
  MEMORY[0x212BDF4DC](0, v12, v9, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v25);
  return swift_release();
}

void sub_2116B9788(char a1, void *a2)
{
  os_log_type_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;

  if ((a1 & 1) == 0)
  {
    v3 = sub_2116BFCAC();
    v4 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v3))
    {
      v5 = a2;
      v6 = a2;
      v7 = v4;
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v8 = 138412290;
      if (a2)
      {
        v10 = a2;
        v11 = _swift_stdlib_bridgeErrorToNSError();
        sub_2116BFD00();
      }
      else
      {
        sub_2116BFD00();
        v11 = 0;
      }
      *v9 = v11;

      _os_log_impl(&dword_21168F000, v7, v3, "[PauseRingsCoordinator] Failed to nano sync after updating pause samples: %@", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE040);
      swift_arrayDestroy();
      MEMORY[0x212BDFE0C](v9, -1, -1);
      MEMORY[0x212BDFE0C](v8, -1, -1);

    }
  }
}

uint64_t sub_2116B9930(unint64_t a1)
{
  _QWORD **v1;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_2116BC170(v3);
  v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      v7 = &v3[2 * a1];
      v8 = v7[4];
      memmove(v7 + 4, v7 + 6, 16 * v6);
      v3[2] = v5;
      *v1 = v3;
      return v8;
    }
  }
  result = sub_2116BFDE4();
  __break(1u);
  return result;
}

uint64_t sub_2116B9A0C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v12;

  v1 = a1;
  v12 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_18;
  sub_2116BFD84();
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (i = 0; ; ++i)
      {
        MEMORY[0x212BDF554](i, v1);
        v4 = i + 1;
        if (__OFADD__(i, 1))
          break;
        objc_opt_self();
        if (!swift_dynamicCastObjCClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        sub_2116BFD6C();
        sub_2116BFD90();
        sub_2116BFD9C();
        sub_2116BFD78();
        if (v4 == v2)
          return v12;
      }
      __break(1u);
    }
    else
    {
      v5 = 0;
      v6 = v1 + 32;
      while (1)
      {
        v7 = v5 + 1;
        if (__OFADD__(v5, 1))
          break;
        v8 = *(void **)(v6 + 8 * v5);
        objc_opt_self();
        v9 = swift_dynamicCastObjCClass();
        if (!v9)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        v1 = v9;
        v10 = v8;
        sub_2116BFD6C();
        sub_2116BFD90();
        sub_2116BFD9C();
        sub_2116BFD78();
        ++v5;
        if (v7 == v2)
          return v12;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    sub_2116BFDCC();
    swift_bridgeObjectRelease();
    sub_2116BFD84();
    swift_bridgeObjectRetain();
    v2 = sub_2116BFDCC();
    swift_bridgeObjectRelease();
  }
  return v12;
}

uint64_t sub_2116B9BF0(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  char *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int (*v51)(uint64_t, uint64_t, uint64_t);
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t result;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;

  LODWORD(v64) = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v69 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v66 = (char *)&v58 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v62 = (char *)&v58 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v70 = (char *)&v58 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v61 = (char *)&v58 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v71 = (uint64_t)&v58 - v12;
  v60 = sub_2116BFB50();
  v13 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D8A1D0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_2116BFB5C();
  v67 = *(_QWORD *)(v19 - 8);
  v68 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_2116BFACC();
  v22 = *(_QWORD *)(v59 - 8);
  v23 = MEMORY[0x24BDAC7A8](v59);
  v25 = (char *)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v58 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v58 - v29;
  sub_2116BFAC0();
  v31 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  sub_2116BFB14();

  v32 = v60;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDCF220], v60);
  v63 = v21;
  v33 = v59;
  sub_2116BFB38();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v32);
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v25, v30, v33);
  v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v18, 1, v33);
  v65 = v22;
  if (v34 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, v25, v33);
    sub_2116B3588((uint64_t)v18, (uint64_t *)&unk_253D8A1D0);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v33);
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, v18, v33);
  }
  v64 = v28;
  v35 = (void *)sub_2116BFA90();
  v36 = v63;
  v37 = (void *)sub_2116BFAFC();
  v38 = (id)_HKActivityCacheDateComponentsFromDate();

  v40 = (uint64_t)v69;
  v39 = (uint64_t)v70;
  v41 = (uint64_t)v61;
  if (v38)
  {
    sub_2116BFA3C();

    v42 = sub_2116BFA78();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v41, 0, 1, v42);
  }
  else
  {
    v43 = sub_2116BFA78();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v41, 1, 1, v43);
  }
  sub_2116BAFF4(v41, v71);
  v44 = (void *)sub_2116BFA90();
  v45 = (void *)sub_2116BFAFC();
  v46 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v46)
  {
    v47 = (uint64_t)v62;
    sub_2116BFA3C();

    v48 = sub_2116BFA78();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v47, 0, 1, v48);
  }
  else
  {
    v48 = sub_2116BFA78();
    v47 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v62, 1, 1, v48);
  }
  v49 = (uint64_t)v66;
  sub_2116BAFF4(v47, v39);
  sub_2116BB03C(v71, v49);
  sub_2116BFA78();
  v50 = *(_QWORD *)(v48 - 8);
  v51 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48);
  v52 = 0;
  if (v51(v49, 1, v48) != 1)
  {
    v52 = (void *)sub_2116BFA30();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v48);
  }
  v53 = _HKCacheIndexFromDateComponents();

  sub_2116BB03C(v39, v40);
  if (v51(v40, 1, v48) == 1)
  {
    v54 = 0;
  }
  else
  {
    v54 = (void *)sub_2116BFA30();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v40, v48);
  }
  v55 = _HKCacheIndexFromDateComponents();

  sub_2116B3588(v39, &qword_253D8A258);
  sub_2116B3588(v71, &qword_253D8A258);
  v56 = *(void (**)(char *, uint64_t))(v65 + 8);
  v56(v64, v33);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v36, v68);
  result = ((uint64_t (*)(char *, uint64_t))v56)(v30, v33);
  if (v55 >= v53)
    return v53;
  __break(1u);
  return result;
}

id sub_2116BA1B8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v27 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  v11 = sub_2116BFB5C();
  v29 = *(_QWORD *)(v11 - 8);
  v30 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_2116BFACC();
  v14 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2116BFAC0();
  v17 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  sub_2116BFB14();

  v18 = (void *)sub_2116BFA90();
  v19 = (void *)sub_2116BFAFC();
  v20 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v20)
  {
    sub_2116BFA3C();

    v21 = sub_2116BFA78();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v8, 0, 1, v21);
  }
  else
  {
    v21 = sub_2116BFA78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v8, 1, 1, v21);
  }
  sub_2116BAFF4((uint64_t)v8, (uint64_t)v10);
  sub_2116BB03C((uint64_t)v10, (uint64_t)v5);
  sub_2116BFA78();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v5, 1, v21) != 1)
  {
    v23 = (void *)sub_2116BFA30();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v21);
  }
  v24 = _HKCacheIndexFromDateComponents();

  v25 = objc_msgSend(v1, sel_endDateIndex);
  result = objc_msgSend(v1, sel_startDateIndex);
  if (__OFSUB__(v25, result))
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v1, sel_startDateIndex);
    if (!__OFSUB__(v24, result))
    {
      sub_2116B3588((uint64_t)v10, &qword_253D8A258);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v30);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v28);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2116BA4A4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  id v29;
  void *v30;
  void (*v31)(char *, char *, uint64_t);
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  id v34;
  void *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(char *, uint64_t, uint64_t);
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t *v45;
  uint64_t v46;
  void (*v47)(void);
  char *v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D8A1D0);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v67 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v70 = (char *)&v63 - v4;
  v5 = sub_2116BFACC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v68 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v69 = (char *)&v63 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v72 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v63 - v13;
  v15 = sub_2116BFA78();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v71 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v63 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v73 = (char *)&v63 - v22;
  v23 = sub_2116BFB5C();
  v75 = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v66 = (char *)&v63 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v63 - v26;
  v28 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  v74 = v27;
  sub_2116BFB14();

  objc_msgSend(v0, sel_startDateIndex);
  v29 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  v76 = v23;
  if (!v29)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
    goto LABEL_8;
  }
  v30 = v29;
  v64 = v6;
  v65 = v5;
  sub_2116BFA3C();

  v31 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
  v31(v14, v21, v15);
  v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  v32(v14, 0, 1, v15);
  v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v33(v14, 1, v15) == 1)
  {
LABEL_8:
    (*(void (**)(char *, uint64_t))(v75 + 8))(v74, v76);
    v45 = &qword_253D8A258;
    v46 = (uint64_t)v14;
    goto LABEL_14;
  }
  v31(v73, v14, v15);
  objc_msgSend(v0, sel_endDateIndex);
  v34 = (id)_HKActivityCacheDateComponentsFromCacheIndex();
  if (!v34)
  {
    v36 = v72;
    v32(v72, 1, 1, v15);
    goto LABEL_10;
  }
  v35 = v34;
  sub_2116BFA3C();

  v36 = v72;
  v31(v72, v21, v15);
  v32(v36, 0, 1, v15);
  if (v33(v36, 1, v15) == 1)
  {
LABEL_10:
    (*(void (**)(char *, uint64_t))(v16 + 8))(v73, v15);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v74, v76);
    v45 = &qword_253D8A258;
    v46 = (uint64_t)v36;
    goto LABEL_14;
  }
  v63 = v21;
  v31(v71, v36, v15);
  v37 = v70;
  v38 = v73;
  v39 = v74;
  sub_2116BFB20();
  v40 = v64;
  v41 = v65;
  v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48);
  if (v42(v37, 1, v65) == 1)
  {
    v43 = *(void (**)(char *, uint64_t))(v16 + 8);
    v43(v71, v15);
    v44 = v38;
  }
  else
  {
    v47 = *(void (**)(void))(v40 + 32);
    v48 = v69;
    v47();
    v37 = v67;
    sub_2116BFB20();
    if (v42(v37, 1, v41) != 1)
    {
      ((void (*)(char *, char *, uint64_t))v47)(v68, v37, v41);
      sub_2116BFB44();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254ABDEE8);
      v51 = sub_2116BFB50();
      v52 = *(_QWORD *)(v51 - 8);
      v53 = (*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
      v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = xmmword_2116C2450;
      (*(void (**)(unint64_t, _QWORD, uint64_t))(v52 + 104))(v54 + v53, *MEMORY[0x24BDCF220], v51);
      sub_2116B2C80(v54);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      v55 = v63;
      v56 = v68;
      v57 = v66;
      sub_2116BFAE4();
      swift_bridgeObjectRelease();
      v58 = v76;
      v59 = *(void (**)(char *, uint64_t))(v75 + 8);
      v59(v57, v76);
      v49 = sub_2116BFA48();
      v60 = *(void (**)(char *, uint64_t))(v16 + 8);
      v60(v55, v15);
      v61 = v65;
      v62 = *(void (**)(char *, uint64_t))(v64 + 8);
      v62(v56, v65);
      v62(v69, v61);
      v60(v71, v15);
      v60(v73, v15);
      v59(v39, v58);
      return v49;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v48, v41);
    v43 = *(void (**)(char *, uint64_t))(v16 + 8);
    v43(v71, v15);
    v44 = v73;
  }
  v43(v44, v15);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v39, v76);
  v45 = (uint64_t *)&unk_253D8A1D0;
  v46 = (uint64_t)v37;
LABEL_14:
  sub_2116B3588(v46, v45);
  return 0;
}

unint64_t sub_2116BAAE8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE188);
  v2 = (_QWORD *)sub_2116BFDD8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2116BCC7C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_2116BAC00(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t i;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE180);
    v2 = (_QWORD *)sub_2116BFDD8();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  i = 0;
  if (v5)
    goto LABEL_10;
LABEL_11:
  v11 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v11 >= v27)
    goto LABEL_32;
  v12 = *(_QWORD *)(v28 + 8 * v11);
  v13 = i + 1;
  if (!v12)
  {
    v13 = i + 2;
    if (i + 2 >= v27)
      goto LABEL_32;
    v12 = *(_QWORD *)(v28 + 8 * v13);
    if (!v12)
    {
      v13 = i + 3;
      if (i + 3 >= v27)
        goto LABEL_32;
      v12 = *(_QWORD *)(v28 + 8 * v13);
      if (!v12)
      {
        v13 = i + 4;
        if (i + 4 >= v27)
          goto LABEL_32;
        v12 = *(_QWORD *)(v28 + 8 * v13);
        if (!v12)
        {
          v14 = i + 5;
          if (i + 5 < v27)
          {
            v12 = *(_QWORD *)(v28 + 8 * v14);
            if (v12)
            {
              v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v13 = v14 + 1;
              if (__OFADD__(v14, 1))
                goto LABEL_36;
              if (v13 >= v27)
                break;
              v12 = *(_QWORD *)(v28 + 8 * v13);
              ++v14;
              if (v12)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_2116BE144();
          return;
        }
      }
    }
  }
LABEL_26:
  v5 = (v12 - 1) & v12;
  v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; v10 = v9 | (i << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    v18 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    v19 = v18;
    v20 = sub_2116BCC7C(v17, v16);
    v21 = v20;
    if ((v22 & 1) != 0)
    {
      v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *v7 = v17;
      v7[1] = v16;
      v8 = v2[7];

      *(_QWORD *)(v8 + 8 * v21) = v19;
      if (!v5)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    v23 = (uint64_t *)(v2[6] + 16 * v20);
    *v23 = v17;
    v23[1] = v16;
    *(_QWORD *)(v2[7] + 8 * v20) = v19;
    v24 = v2[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_34;
    v2[2] = v26;
    if (!v5)
      goto LABEL_11;
LABEL_10:
    v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

void __swiftcall FIPauseRingsCoordinator.init()(FIPauseRingsCoordinator *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void FIPauseRingsCoordinator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2116BAF1C(uint64_t a1, void *a2, void *aBlock, void *a4)
{
  void (*v6)(id, uint64_t (*)(), uint64_t, void *);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = *(void (**)(id, uint64_t (*)(), uint64_t, void *))(a1 + 32);
  v7 = _Block_copy(aBlock);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  swift_retain();
  v10 = a2;
  v9 = a4;
  v6(v10, sub_2116BE4F8, v8, a4);
  swift_release();
  swift_release();

}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_2116BAFE4(id a1)
{
  if (a1 != (id)1)

}

uint64_t sub_2116BAFF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2116BB03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2116BB088()
{
  return swift_deallocObject();
}

uint64_t sub_2116BB098()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_2116BB0B8(id a1)
{
  if (a1 != (id)2)
    sub_2116BAFE4(a1);
}

id sub_2116BB0C8(id result)
{
  if (result != (id)2)
    return sub_2116BB0D8(result);
  return result;
}

id sub_2116BB0D8(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_2116BB0E8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2116BB110()
{
  return swift_deallocObject();
}

uint64_t sub_2116BB120()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2116BB158()
{
  return swift_deallocObject();
}

uint64_t sub_2116BB168()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_2116BFACC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + ((v3 + 40) & ~v3), v1);
  return swift_deallocObject();
}

void sub_2116BB1EC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void (*v3)(_QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v23;
  BOOL v24;
  char v25;
  char v26;
  id v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v43;
  char v44;
  char v45;
  _QWORD *v46;
  _QWORD *v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BOOL4 v64;
  char v65;
  char v66;
  void *v67;
  uint64_t v68;
  void *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL4 v82;
  char v83;
  char v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  char *v90;
  void (*v91)(_QWORD, _QWORD);
  unint64_t aBlock;
  uint64_t v93;
  void (*v94)(uint64_t, uint64_t, void *);
  void *v95;
  uint64_t (*v96)(char, void *);
  uint64_t v97;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_2116BFACC() - 8) + 80);
  v2 = *(char **)(v0 + 16);
  v3 = *(void (**)(_QWORD, _QWORD))(v0 + 24);
  v4 = v0 + ((v1 + 40) & ~v1);
  v5 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_state];
  if (!v5)
  {
    v8 = (_QWORD *)sub_2116BCEBC(v4);
    v9 = v8;
    sub_2116B7EB8(v8, 0);
    sub_2116B56D0(v8);
    v10 = v9;
    v11 = sub_2116B9BF0(0);
    v13 = OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals;
    v14 = *(_QWORD *)&v2[OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals];
    v15 = *(_QWORD *)(v14 + 16);
    if (v15)
    {
      v16 = (uint64_t *)(v14 + 40);
      v17 = v15 - 1;
      do
      {
        v19 = *(v16 - 1);
        v18 = *v16;
        v23 = v19 >= v12 || v11 >= v18 || v19 == v18 || v11 == v12;
        v24 = v17-- != 0;
        v25 = v24;
        if (!v23)
          break;
        v16 += 2;
      }
      while ((v25 & 1) != 0);
      v26 = !v23;
    }
    else
    {
      v26 = 0;
    }
    v32 = sub_2116B9BF0(1);
    v34 = *(_QWORD *)&v2[v13];
    v35 = *(_QWORD *)(v34 + 16);
    if (v35)
    {
      v36 = (uint64_t *)(v34 + 40);
      v37 = v35 - 1;
      do
      {
        v39 = *(v36 - 1);
        v38 = *v36;
        v43 = v39 >= v33 || v32 >= v38 || v39 == v38 || v32 == v33;
        v24 = v37-- != 0;
        v44 = v24;
        if (!v43)
          break;
        v36 += 2;
      }
      while ((v44 & 1) != 0);
      v45 = !v43;
    }
    else
    {
      v45 = 0;
    }
    sub_2116B80E0(0, 0, v8, v26, v45);

    v67 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_healthStore];
    v68 = swift_allocObject();
    *(_QWORD *)(v68 + 16) = v2;
    v96 = sub_2116BE180;
    v97 = v68;
    aBlock = MEMORY[0x24BDAC760];
    v93 = 1107296256;
    v94 = sub_2116B8508;
    v95 = &block_descriptor_119;
    v69 = _Block_copy(&aBlock);
    v70 = v2;
    swift_release();
    objc_msgSend(v67, sel_saveObject_withCompletion_, v10, v69);
    _Block_release(v69);

    if (!v3)
      goto LABEL_104;
    goto LABEL_103;
  }
  if (v5 != (void *)1)
  {
    v91 = v3;
    v27 = v5;
    v28 = (void *)sub_2116BD464(v27);
    v29 = (_QWORD *)sub_2116BCEBC(v4);
    v30 = v29;
    aBlock = MEMORY[0x24BEE4AF8];
    if (v28)
    {
      v31 = v28;
      MEMORY[0x212BDF428](v30);
      if (*(_QWORD *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2116BFC58();
      sub_2116BFC70();
      sub_2116BFC4C();
    }
    else
    {
      v46 = v29;
    }
    v47 = v30;
    MEMORY[0x212BDF428]();
    if (*(_QWORD *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2116BFC58();
    sub_2116BFC70();
    sub_2116BFC4C();
    v48 = aBlock;

    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A288);
    v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = xmmword_2116C2440;
    *(_QWORD *)(v49 + 32) = v27;
    aBlock = v49;
    sub_2116BFC4C();
    sub_2116BB0D8(v5);
    sub_2116BB0D8(v5);
    v50 = v47;
    sub_2116B7EB8(v30, v5);
    sub_2116BAFE4(v5);
    sub_2116B56D0(v30);
    sub_2116BB0D8(v5);
    v51 = v50;
    v52 = sub_2116B9BF0(0);
    v54 = OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals;
    v55 = *(_QWORD *)&v2[OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals];
    v56 = *(_QWORD *)(v55 + 16);
    if (v56)
    {
      v57 = (uint64_t *)(v55 + 40);
      v58 = v56 - 1;
      do
      {
        v60 = *(v57 - 1);
        v59 = *v57;
        v64 = v60 >= v53 || v52 >= v59 || v60 == v59 || v52 == v53;
        v24 = v58-- != 0;
        v65 = v24;
        if (!v64)
          break;
        v57 += 2;
      }
      while ((v65 & 1) != 0);
      v66 = !v64;
    }
    else
    {
      v66 = 0;
    }
    v71 = sub_2116B9BF0(1);
    v73 = *(_QWORD *)&v2[v54];
    v74 = *(_QWORD *)(v73 + 16);
    if (v74)
    {
      v75 = (uint64_t *)(v73 + 40);
      v76 = v74 - 1;
      do
      {
        v78 = *(v75 - 1);
        v77 = *v75;
        v82 = v78 >= v72 || v71 >= v77 || v78 == v77 || v71 == v72;
        v24 = v76-- != 0;
        v83 = v24;
        if (!v82)
          break;
        v75 += 2;
      }
      while ((v83 & 1) != 0);
      v84 = !v82;
    }
    else
    {
      v84 = 0;
    }
    sub_2116B80E0(1, v5, v30, v66, v84);

    sub_2116BAFE4(v5);
    v85 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_healthStore];
    if (v48 >> 62)
    {
      sub_2116BE10C(0, &qword_254ABE158);
      swift_bridgeObjectRetain();
      sub_2116BFDC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_2116BFE14();
      sub_2116BE10C(0, &qword_254ABE158);
    }
    swift_bridgeObjectRelease();
    sub_2116BE10C(0, &qword_254ABE158);
    v86 = (void *)sub_2116BFC34();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if (aBlock >> 62)
    {
      sub_2116BFDC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2116BFE14();
    }
    swift_bridgeObjectRelease();
    v87 = (void *)sub_2116BFC34();
    swift_bridgeObjectRelease();
    v88 = swift_allocObject();
    *(_QWORD *)(v88 + 16) = v2;
    v96 = sub_2116BE1B0;
    v97 = v88;
    aBlock = MEMORY[0x24BDAC760];
    v93 = 1107296256;
    v94 = sub_2116B8508;
    v95 = &block_descriptor_125;
    v89 = _Block_copy(&aBlock);
    v90 = v2;
    swift_release();
    objc_msgSend(v85, sel_saveObjects_deleteObjects_associations_completion_, v86, v87, 0, v89);
    _Block_release(v89);

    sub_2116BAFE4(v5);
    v3 = v91;
    if (!v91)
      goto LABEL_104;
LABEL_103:
    v3(1, 0);
LABEL_104:
    sub_2116BAFE4(v5);
    return;
  }
  if (v3)
  {
    sub_2116BDC80();
    v6 = (void *)swift_allocError();
    *v7 = 0;
    v3(0, v6);

  }
}

uint64_t sub_2116BB8CC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2116BB8DC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BDFD94](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2116BB91C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

void sub_2116BB950()
{
  uint64_t v0;
  void (*v1)(uint64_t, void *);
  char *v2;
  void *v3;
  void *v4;
  _BYTE *v5;
  _BYTE *v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v38;
  BOOL v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v53;
  char v54;
  char v55;
  id v56;
  uint64_t aBlock;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, void *);
  void *v60;
  uint64_t (*v61)(char, void *);
  uint64_t v62;

  v2 = *(char **)(v0 + 16);
  v1 = *(void (**)(uint64_t, void *))(v0 + 24);
  v3 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_state];
  if (!v3)
  {
    if (!v1)
      return;
    sub_2116BDC80();
    v4 = (void *)swift_allocError();
    *v6 = 2;
    goto LABEL_7;
  }
  if (v3 == (void *)1)
  {
    if (!v1)
      return;
    sub_2116BDC80();
    v4 = (void *)swift_allocError();
    *v5 = 0;
LABEL_7:
    v1(0, v4);

    return;
  }
  v7 = v3;
  v8 = sub_2116BD464(v7);
  if (v8)
  {
    v9 = (_QWORD *)v8;
    v10 = v7;
    sub_2116B7EB8(v9, v3);
    sub_2116BAFE4(v3);
    v56 = *(id *)&v2[OBJC_IVAR___FIPauseRingsCoordinator_healthStore];
    __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A288);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_2116C2440;
    *(_QWORD *)(v11 + 32) = v9;
    sub_2116BFC4C();
    sub_2116BE10C(0, &qword_254ABE158);
    v12 = v9;
    v13 = (void *)sub_2116BFC34();
    swift_bridgeObjectRelease();
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_2116C2440;
    *(_QWORD *)(v14 + 32) = v10;
    sub_2116BFC4C();
    v15 = v10;
    v16 = (void *)sub_2116BFC34();
    swift_bridgeObjectRelease();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v2;
    v61 = sub_2116BDCF4;
    v62 = v17;
    aBlock = MEMORY[0x24BDAC760];
    v58 = 1107296256;
    v59 = sub_2116B8508;
    v60 = &block_descriptor_70;
    v18 = _Block_copy(&aBlock);
    v19 = v2;
    swift_release();
    objc_msgSend(v56, sel_saveObjects_deleteObjects_associations_completion_, v13, v16, 0, v18);
    _Block_release(v18);

  }
  else
  {
    v20 = v7;
    sub_2116B7EB8(0, v3);
    sub_2116BAFE4(v3);
    v21 = *(void **)&v2[OBJC_IVAR___FIPauseRingsCoordinator_healthStore];
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v2;
    v61 = sub_2116BDCC4;
    v62 = v22;
    aBlock = MEMORY[0x24BDAC760];
    v58 = 1107296256;
    v59 = sub_2116B8508;
    v60 = &block_descriptor_64;
    v23 = _Block_copy(&aBlock);
    v24 = v2;
    swift_release();
    objc_msgSend(v21, sel_deleteObject_options_withCompletion_, v20, 2, v23);
    _Block_release(v23);
  }
  v25 = v7;
  v26 = sub_2116B9BF0(0);
  v28 = OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals;
  v29 = *(_QWORD *)&v2[OBJC_IVAR___FIPauseRingsCoordinator_pauseIntervals];
  v30 = *(_QWORD *)(v29 + 16);
  if (v30)
  {
    v31 = (uint64_t *)(v29 + 40);
    v32 = v30 - 1;
    do
    {
      v34 = *(v31 - 1);
      v33 = *v31;
      v38 = v34 >= v27 || v26 >= v33 || v34 == v33 || v26 == v27;
      v39 = v32-- != 0;
      v40 = v39;
      if (!v38)
        break;
      v31 += 2;
    }
    while ((v40 & 1) != 0);
    v41 = !v38;
  }
  else
  {
    v41 = 0;
  }
  v42 = sub_2116B9BF0(1);
  v44 = *(_QWORD *)&v2[v28];
  v45 = *(_QWORD *)(v44 + 16);
  if (v45)
  {
    v46 = (uint64_t *)(v44 + 40);
    v47 = v45 - 1;
    do
    {
      v49 = *(v46 - 1);
      v48 = *v46;
      v53 = v49 >= v43 || v42 >= v48 || v49 == v48 || v42 == v43;
      v39 = v47-- != 0;
      v54 = v39;
      if (!v53)
        break;
      v46 += 2;
    }
    while ((v54 & 1) != 0);
    v55 = !v53;
  }
  else
  {
    v55 = 0;
  }
  sub_2116B80E0(2, v3, 0, v41, v55);
  sub_2116BAFE4(v3);
  sub_2116B56D0(0);
  if (v1)
    v1(1, 0);
  sub_2116BAFE4(v3);
  sub_2116BAFE4(v3);
}

void sub_2116BBDB8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  void *v3;

  v1 = *(void ***)(v0 + 16);
  v2 = *(void **)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___FIPauseRingsCoordinator_state);
  v3 = *v1;
  *v1 = v2;
  sub_2116BB0D8(v2);
  sub_2116BB0B8(v3);
}

uint64_t sub_2116BBDF0()
{
  return swift_deallocObject();
}

uint64_t sub_2116BBE00(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void (*v7)(id, uint64_t, void *);
  id v8;
  id v9;

  v5 = a3;
  v7 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  if (a3)
  {
    sub_2116BE10C(0, &qword_253D8A280);
    v5 = sub_2116BFC40();
  }
  swift_retain();
  v8 = a2;
  v9 = a4;
  v7(v8, v5, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

_QWORD *sub_2116BBEA0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE160);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2116BCDD4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2116BBFAC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE160);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2116BFDE4();
  __break(1u);
  return result;
}

uint64_t sub_2116BC108(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2116BCDC0(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_2116BC184(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_2116BC170(_QWORD *a1)
{
  return sub_2116BBEA0(0, a1[2], 0, a1);
}

uint64_t sub_2116BC184(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  char v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  unint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *__dst;

  v3 = a1[1];
  result = sub_2116BFDF0();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v83 = 0;
      v84 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v86 = *(_QWORD *)(v84 + 16 * i);
        v87 = v83;
        do
        {
          if (v86 >= *(_QWORD *)(v84 + v87))
            break;
          if (!v84)
            goto LABEL_140;
          v88 = (_QWORD *)(v84 + v87);
          v89 = *(_QWORD *)(v84 + v87 + 24);
          *(_OWORD *)(v84 + v87 + 16) = *(_OWORD *)(v84 + v87);
          *v88 = v86;
          v88[1] = v89;
          v87 -= 16;
        }
        while (v87 != -16);
        v83 += 16;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_145;
  v6 = result;
  v98 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v90 = v12;
      v101 = v9;
      if (v13 >= 2)
      {
        v91 = *v98;
        do
        {
          v92 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v91)
            goto LABEL_144;
          v93 = v90;
          v94 = *(_QWORD *)&v90[16 * v92 + 32];
          v95 = *(_QWORD *)&v90[16 * v13 + 24];
          sub_2116BC850((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(_QWORD *)&v90[16 * v13 + 16]), v91 + 16 * v95, __dst);
          if (v1)
            break;
          if (v95 < v94)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v93 = sub_2116BCC68((uint64_t)v93);
          if (v92 >= *((_QWORD *)v93 + 2))
            goto LABEL_133;
          v96 = &v93[16 * v92 + 32];
          *(_QWORD *)v96 = v94;
          *((_QWORD *)v96 + 1) = v95;
          v97 = *((_QWORD *)v93 + 2);
          if (v13 > v97)
            goto LABEL_134;
          memmove(&v93[16 * v13 + 16], &v93[16 * v13 + 32], 16 * (v97 - v13));
          v90 = v93;
          *((_QWORD *)v93 + 2) = v97 - 1;
          v13 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v101 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v101 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE190);
    v8 = sub_2116BFC64();
    *(_QWORD *)(v8 + 16) = v7;
    v101 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v99 = *a1 - 16;
  v100 = *a1 + 32;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v102 = v6;
  v103 = v3;
  v104 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(_QWORD *)(v11 + 16 * v10);
      v16 = *(_QWORD *)(v11 + 16 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v17 = (uint64_t *)(v100 + 16 * v14);
        v18 = v15;
        while (1)
        {
          v20 = *v17;
          v17 += 2;
          v19 = v20;
          if (v15 < v16 == v20 >= v18)
            break;
          ++v10;
          v18 = v19;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v16)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v21 = (__int128 *)(v99 + 16 * v10);
          v22 = v10;
          v23 = v14;
          v24 = (__int128 *)(v11 + 16 * v14);
          do
          {
            if (v23 != --v22)
            {
              if (!v11)
                goto LABEL_143;
              v25 = *v24;
              *v24 = *v21;
              *v21 = v25;
            }
            ++v23;
            --v21;
            ++v24;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v26 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v26 >= v3)
      v26 = v3;
    if (v26 < v14)
      break;
    if (v10 != v26)
    {
      v27 = v99 + 16 * v10;
      do
      {
        v28 = *(_QWORD *)(v11 + 16 * v10);
        v29 = v14;
        v30 = v27;
        do
        {
          if (v28 >= *(_QWORD *)v30)
            break;
          if (!v11)
            goto LABEL_141;
          v31 = *(_QWORD *)(v30 + 24);
          *(_OWORD *)(v30 + 16) = *(_OWORD *)v30;
          *(_QWORD *)v30 = v28;
          *(_QWORD *)(v30 + 8) = v31;
          v30 -= 16;
          ++v29;
        }
        while (v10 != v29);
        ++v10;
        v27 += 16;
      }
      while (v10 != v26);
      v10 = v26;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_2116BCAC8(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v33 = *((_QWORD *)v12 + 2);
    v32 = *((_QWORD *)v12 + 3);
    v13 = v33 + 1;
    v11 = v104;
    if (v33 >= v32 >> 1)
    {
      v82 = sub_2116BCAC8((char *)(v32 > 1), v33 + 1, 1, v12);
      v11 = v104;
      v12 = v82;
    }
    *((_QWORD *)v12 + 2) = v13;
    v34 = v12 + 32;
    v35 = &v12[16 * v33 + 32];
    *(_QWORD *)v35 = v14;
    *((_QWORD *)v35 + 1) = v10;
    if (v33)
    {
      while (1)
      {
        v36 = v13 - 1;
        if (v13 >= 4)
        {
          v41 = &v34[16 * v13];
          v42 = *((_QWORD *)v41 - 8);
          v43 = *((_QWORD *)v41 - 7);
          v47 = __OFSUB__(v43, v42);
          v44 = v43 - v42;
          if (v47)
            goto LABEL_119;
          v46 = *((_QWORD *)v41 - 6);
          v45 = *((_QWORD *)v41 - 5);
          v47 = __OFSUB__(v45, v46);
          v39 = v45 - v46;
          v40 = v47;
          if (v47)
            goto LABEL_120;
          v48 = v13 - 2;
          v49 = &v34[16 * v13 - 32];
          v51 = *(_QWORD *)v49;
          v50 = *((_QWORD *)v49 + 1);
          v47 = __OFSUB__(v50, v51);
          v52 = v50 - v51;
          if (v47)
            goto LABEL_122;
          v47 = __OFADD__(v39, v52);
          v53 = v39 + v52;
          if (v47)
            goto LABEL_125;
          if (v53 >= v44)
          {
            v71 = &v34[16 * v36];
            v73 = *(_QWORD *)v71;
            v72 = *((_QWORD *)v71 + 1);
            v47 = __OFSUB__(v72, v73);
            v74 = v72 - v73;
            if (v47)
              goto LABEL_129;
            v64 = v39 < v74;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v65 = *((_QWORD *)v12 + 4);
            v66 = *((_QWORD *)v12 + 5);
            v47 = __OFSUB__(v66, v65);
            v58 = v66 - v65;
            v59 = v47;
            goto LABEL_77;
          }
          v38 = *((_QWORD *)v12 + 4);
          v37 = *((_QWORD *)v12 + 5);
          v47 = __OFSUB__(v37, v38);
          v39 = v37 - v38;
          v40 = v47;
        }
        if ((v40 & 1) != 0)
          goto LABEL_121;
        v48 = v13 - 2;
        v54 = &v34[16 * v13 - 32];
        v56 = *(_QWORD *)v54;
        v55 = *((_QWORD *)v54 + 1);
        v57 = __OFSUB__(v55, v56);
        v58 = v55 - v56;
        v59 = v57;
        if (v57)
          goto LABEL_124;
        v60 = &v34[16 * v36];
        v62 = *(_QWORD *)v60;
        v61 = *((_QWORD *)v60 + 1);
        v47 = __OFSUB__(v61, v62);
        v63 = v61 - v62;
        if (v47)
          goto LABEL_127;
        if (__OFADD__(v58, v63))
          goto LABEL_128;
        if (v58 + v63 >= v39)
        {
          v64 = v39 < v63;
LABEL_83:
          if (v64)
            v36 = v48;
          goto LABEL_85;
        }
LABEL_77:
        if ((v59 & 1) != 0)
          goto LABEL_123;
        v67 = &v34[16 * v36];
        v69 = *(_QWORD *)v67;
        v68 = *((_QWORD *)v67 + 1);
        v47 = __OFSUB__(v68, v69);
        v70 = v68 - v69;
        if (v47)
          goto LABEL_126;
        if (v70 < v58)
          goto LABEL_15;
LABEL_85:
        v75 = v36 - 1;
        if (v36 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_142;
        v76 = v12;
        v77 = &v34[16 * v75];
        v78 = *(_QWORD *)v77;
        v79 = &v34[16 * v36];
        v80 = *((_QWORD *)v79 + 1);
        sub_2116BC850((char *)(v11 + 16 * *(_QWORD *)v77), (char *)(v11 + 16 * *(_QWORD *)v79), v11 + 16 * v80, __dst);
        if (v1)
          goto LABEL_93;
        if (v80 < v78)
          goto LABEL_116;
        if (v36 > *((_QWORD *)v76 + 2))
          goto LABEL_117;
        *(_QWORD *)v77 = v78;
        *(_QWORD *)&v34[16 * v75 + 8] = v80;
        v81 = *((_QWORD *)v76 + 2);
        if (v36 >= v81)
          goto LABEL_118;
        v12 = v76;
        v13 = v81 - 1;
        memmove(&v34[16 * v36], v79 + 16, 16 * (v81 - 1 - v36));
        *((_QWORD *)v76 + 2) = v81 - 1;
        v11 = v104;
        if (v81 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v102;
    v3 = v103;
    if (v10 >= v103)
    {
      v9 = v101;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  result = sub_2116BFDA8();
  __break(1u);
  return result;
}

uint64_t sub_2116BC850(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  char *v22;
  char *v23;
  char *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v16 = &v4[16 * v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v17 = (char *)(a3 - 16);
        v18 = v6;
        while (1)
        {
          v19 = v17 + 16;
          v20 = *((_QWORD *)v18 - 2);
          v18 -= 16;
          if (*((_QWORD *)v16 - 2) >= v20)
          {
            v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16)
              *(_OWORD *)v17 = *((_OWORD *)v16 - 1);
            v18 = v6;
            v16 -= 16;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v19 != v6 || v17 >= v6)
              *(_OWORD *)v17 = *(_OWORD *)v18;
            v24 = v18;
            if (v18 <= v7)
              goto LABEL_42;
          }
          v17 -= 16;
          v6 = v18;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(_QWORD *)v6 >= *(_QWORD *)v4)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v23 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_2116BCBC0((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_2116BFDE4();
  __break(1u);
  return result;
}

char *sub_2116BCAC8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE198);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2116BCBC0(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_2116BFDE4();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_2116BCC68(uint64_t a1)
{
  return sub_2116BCAC8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_2116BCC7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2116BFE50();
  sub_2116BFC04();
  v4 = sub_2116BFE68();
  return sub_2116BCCE0(a1, a2, v4);
}

unint64_t sub_2116BCCE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2116BFE08() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2116BFE08() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2116BCDC0(uint64_t a1)
{
  return sub_2116BBFAC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_2116BCDD4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_2116BFDE4();
  __break(1u);
  return result;
}

uint64_t sub_2116BCEBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  void (*v26)(char *, uint64_t);
  void *v27;
  id v28;
  void *v29;
  void (*v30)(char *, uint64_t);
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t result;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;

  v59 = a1;
  v1 = sub_2116BFB5C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2116BFACC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v53 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v51 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v57 = (uint64_t)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v55 = (char *)&v51 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v58 = (char *)&v51 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v51 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v51 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v60 = (uint64_t)&v51 - v24;
  sub_2116BFAC0();
  v25 = (void *)sub_2116BFA90();
  v52 = v6;
  v26 = *(void (**)(char *, uint64_t))(v6 + 8);
  v54 = v5;
  v26(v10, v5);
  v27 = (void *)objc_opt_self();
  v28 = objc_msgSend(v27, sel_hk_gregorianCalendar);
  sub_2116BFB14();

  v29 = (void *)sub_2116BFAFC();
  v30 = *(void (**)(char *, uint64_t))(v2 + 8);
  v56 = v1;
  v30(v4, v1);
  v31 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v31)
  {
    sub_2116BFA3C();

    v32 = sub_2116BFA78();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v23, 0, 1, v32);
  }
  else
  {
    v32 = sub_2116BFA78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v23, 1, 1, v32);
  }
  v33 = v60;
  sub_2116BAFF4((uint64_t)v23, v60);
  sub_2116BB03C(v33, (uint64_t)v20);
  sub_2116BFA78();
  v34 = *(_QWORD *)(v32 - 8);
  v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
  v36 = 0;
  if (v35(v20, 1, v32) != 1)
  {
    v36 = (void *)sub_2116BFA30();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v32);
  }
  v37 = _HKCacheIndexFromDateComponents();

  v38 = (void *)sub_2116BFA90();
  v39 = objc_msgSend(v27, sel_hk_gregorianCalendar);
  sub_2116BFB14();

  v40 = (void *)sub_2116BFAFC();
  v30(v4, v56);
  v41 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v41)
  {
    v42 = (uint64_t)v55;
    sub_2116BFA3C();

    v43 = 0;
    v44 = (uint64_t)v58;
  }
  else
  {
    v43 = 1;
    v44 = (uint64_t)v58;
    v42 = (uint64_t)v55;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v42, v43, 1, v32);
  sub_2116BAFF4(v42, v44);
  v45 = v57;
  sub_2116BB03C(v44, v57);
  if (v35((char *)v45, 1, v32) == 1)
  {
    v46 = 0;
  }
  else
  {
    v46 = (void *)sub_2116BFA30();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v45, v32);
  }
  v47 = _HKCacheIndexFromDateComponents();

  if (v37 >= v47)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v53, v59, v54);
    v61 = 0;
    v62 = 0xE000000000000000;
    sub_2116BFD3C();
    sub_2116BFC10();
    sub_2116B35C4(&qword_254ABDED0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    sub_2116BFDFC();
    sub_2116BFC10();
    swift_bridgeObjectRelease();
    sub_2116BFC10();
    result = sub_2116BFDB4();
    __break(1u);
  }
  else
  {
    v48 = objc_msgSend((id)objc_opt_self(), sel_localDevice);
    v49 = objc_msgSend((id)objc_opt_self(), sel_pauseRingsScheduleWithStartDateIndex_endDateIndex_device_metadata_, v37, v47, v48, 0);

    sub_2116B3588(v44, &qword_253D8A258);
    sub_2116B3588(v60, &qword_253D8A258);
    return (uint64_t)v49;
  }
  return result;
}

uint64_t sub_2116BD464(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t result;
  uint64_t v34;
  void *v35;

  v35 = a1;
  v1 = sub_2116BFB5C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2116BFACC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253D8A258);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v34 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v34 - v16;
  sub_2116BFAC0();
  v18 = (void *)sub_2116BFA90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v19 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  sub_2116BFB14();

  v20 = (void *)sub_2116BFAFC();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v21 = (id)_HKActivityCacheDateComponentsFromDate();

  if (v21)
  {
    sub_2116BFA3C();

    v22 = sub_2116BFA78();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v15, 0, 1, v22);
  }
  else
  {
    v22 = sub_2116BFA78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v15, 1, 1, v22);
  }
  sub_2116BAFF4((uint64_t)v15, (uint64_t)v17);
  sub_2116BB03C((uint64_t)v17, (uint64_t)v12);
  sub_2116BFA78();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v12, 1, v22);
  v25 = 0;
  v26 = v35;
  if (v24 != 1)
  {
    v25 = (void *)sub_2116BFA30();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v22);
  }
  v27 = _HKCacheIndexFromDateComponents();

  if (v27 < (uint64_t)objc_msgSend(v26, sel_startDateIndex))
  {
    result = sub_2116BFDB4();
    __break(1u);
  }
  else
  {
    v28 = objc_msgSend(v26, sel_startDateIndex);
    v29 = objc_msgSend((id)objc_opt_self(), sel_localDevice);
    v30 = objc_msgSend((id)objc_opt_self(), sel_pauseRingsScheduleWithStartDateIndex_endDateIndex_device_metadata_, v28, v27, v29, 0);

    v31 = objc_msgSend(v30, sel_startDateIndex);
    v32 = objc_msgSend(v30, sel_endDateIndex);
    sub_2116B3588((uint64_t)v17, &qword_253D8A258);
    if (v31 == v32)
    {

      return 0;
    }
    return (uint64_t)v30;
  }
  return result;
}

unint64_t sub_2116BD808()
{
  unint64_t result;

  result = qword_254ABE148;
  if (!qword_254ABE148)
  {
    result = MEMORY[0x212BDFD94](&unk_2116C247C, &type metadata for PauseRingsCoordinatorError);
    atomic_store(result, (unint64_t *)&qword_254ABE148);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PauseRingsCoordinatorError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PauseRingsCoordinatorError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_2116BD938 + 4 * byte_2116C2475[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2116BD96C + 4 * byte_2116C2470[v4]))();
}

uint64_t sub_2116BD96C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2116BD974(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2116BD97CLL);
  return result;
}

uint64_t sub_2116BD988(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2116BD990);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2116BD994(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2116BD99C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2116BD9A8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2116BD9B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PauseRingsCoordinatorError()
{
  return &type metadata for PauseRingsCoordinatorError;
}

_QWORD *_s5StateOwCP(_QWORD *a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  LODWORD(v4) = -1;
  if ((unint64_t)*a2 < 0xFFFFFFFF)
    v4 = *a2;
  if (((_DWORD)v4 + 1) <= 1)
    v5 = v3;
  *a1 = v3;
  return a1;
}

void _s5StateOwxx(void **a1)
{
  void *v1;
  int v2;

  v1 = *a1;
  v2 = -1;
  if ((unint64_t)v1 < 0xFFFFFFFF)
    v2 = (int)v1;
  if ((v2 + 1) <= 1)

}

void **_s5StateOwca(void **a1, void **a2)
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  id v9;
  id v10;

  v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v5) = -1;
  else
    v5 = *a1;
  v6 = (_DWORD)v5 + 1;
  v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF)
    v4 = *a2;
  v8 = (_DWORD)v4 + 1;
  if (v6 > 1)
  {
    if (v8 <= 1)
    {
      *a1 = v7;
      v10 = v7;
      return a1;
    }
LABEL_12:
    *a1 = v7;
    return a1;
  }
  if (v8 > 1)
  {

    v7 = *a2;
    goto LABEL_12;
  }
  *a1 = v7;
  v9 = v7;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **_s5StateOwta(void **a1, void **a2)
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;

  v3 = *a1;
  LODWORD(v4) = -1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v5) = -1;
  else
    v5 = *a1;
  v6 = (_DWORD)v5 + 1;
  v7 = *a2;
  if ((unint64_t)*a2 < 0xFFFFFFFF)
    v4 = *a2;
  v8 = (_DWORD)v4 + 1;
  if (v6 > 1)
    goto LABEL_11;
  if (v8 > 1)
  {

LABEL_11:
    *a1 = v7;
    return a1;
  }
  *a1 = v7;

  return a1;
}

uint64_t _s5StateOwet(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) < 2)
    LODWORD(v3) = 0;
  if (v3 >= 2)
    return (v3 - 1);
  else
    return 0;
}

uint64_t _s5StateOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_2116BDBF4(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  if ((v1 + 1) >= 2)
    return v1;
  else
    return 0;
}

_QWORD *sub_2116BDC14(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *result = a2;
  }
  return result;
}

ValueMetadata *_s5StateOMa()
{
  return &_s5StateON;
}

uint64_t type metadata accessor for FIPauseRingsCoordinator(uint64_t a1)
{
  return sub_2116BE10C(a1, &qword_254ABE5D0);
}

uint64_t sub_2116BDC68(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_2116BDC78(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2116B8858(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_2116BDC80()
{
  unint64_t result;

  result = qword_254ABE150;
  if (!qword_254ABE150)
  {
    result = MEMORY[0x212BDFD94](&unk_2116C24E4, &type metadata for PauseRingsCoordinatorError);
    atomic_store(result, (unint64_t *)&qword_254ABE150);
  }
  return result;
}

uint64_t sub_2116BDCC4(char a1, void *a2)
{
  uint64_t v2;

  return sub_2116B8568(a1, a2, *(char **)(v2 + 16), (uint64_t)&unk_24CC4FEF8, (uint64_t)sub_2116BE150, (uint64_t)&block_descriptor_113);
}

uint64_t sub_2116BDCF4(char a1, void *a2)
{
  uint64_t v2;

  return sub_2116B8568(a1, a2, *(char **)(v2 + 16), (uint64_t)&unk_24CC4FD18, (uint64_t)sub_2116BDD28, (uint64_t)&block_descriptor_76);
}

void sub_2116BDD28()
{
  sub_2116BE220("[PauseRingsCoordinator] Failed to add+delete pause sample: %@");
}

void sub_2116BDD34()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD aBlock[6];

  swift_beginAccess();
  v1 = MEMORY[0x212BDFE54](v0 + 16);
  if (v1)
  {
    v2 = (void *)v1;
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD3D80]), sel_initWithHealthStore_, *(_QWORD *)(v1 + OBJC_IVAR___FIPauseRingsCoordinator_healthStore));
    aBlock[4] = sub_2116B9788;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2116B8508;
    aBlock[3] = &block_descriptor_83;
    v4 = _Block_copy(aBlock);
    objc_msgSend(v3, sel_forceNanoSyncWithOptions_completion_, 0, v4);

    _Block_release(v4);
  }
}

uint64_t sub_2116BDE1C(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  return sub_2116B9488(a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_2116BDE30()
{
  return objectdestroy_91Tm();
}

void sub_2116BDE38()
{
  uint64_t v0;

  sub_2116B6838(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_2116BDE60()
{
  return swift_deallocObject();
}

void sub_2116BDE70()
{
  id v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_didUpdatePauseStateNotification);
  objc_msgSend(v1, sel_postNotificationName_object_, v0, 0);

}

uint64_t sub_2116BDEF8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2116BDF24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  unint64_t v5;
  void *v6;
  void *v7;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE170);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2116C2460;
  *(_QWORD *)(inited + 32) = 0x79546E6F69746361;
  *(_QWORD *)(inited + 40) = 0xEA00000000006570;
  *(_QWORD *)(inited + 48) = sub_2116BFC94();
  *(_QWORD *)(inited + 56) = 0xD00000000000001ELL;
  *(_QWORD *)(inited + 64) = 0x80000002116C7A30;
  if (v2)
    sub_2116BA1B8();
  *(_QWORD *)(inited + 72) = sub_2116BFC88();
  strcpy((char *)(inited + 80), "pauseDuration");
  *(_WORD *)(inited + 94) = -4864;
  if (v3)
    sub_2116BA4A4();
  *(_QWORD *)(inited + 96) = sub_2116BFC94();
  *(_QWORD *)(inited + 104) = 0xD000000000000015;
  *(_QWORD *)(inited + 112) = 0x80000002116C7A50;
  *(_QWORD *)(inited + 120) = sub_2116BFC7C();
  *(_QWORD *)(inited + 128) = 0xD000000000000016;
  *(_QWORD *)(inited + 136) = 0x80000002116C7A70;
  *(_QWORD *)(inited + 144) = sub_2116BFC7C();
  v5 = sub_2116BAAE8(inited);
  v6 = (void *)sub_2116BFBE0();
  sub_2116BAC00(v5);
  swift_bridgeObjectRelease();
  sub_2116BE10C(0, &qword_254ABE178);
  v7 = (void *)sub_2116BFBB0();
  swift_bridgeObjectRelease();
  FIActivityAnalyticsSubmissionWithPayload(v6, v7);

}

uint64_t sub_2116BE10C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2116BE144()
{
  return swift_release();
}

void sub_2116BE150()
{
  sub_2116BE220("[PauseRingsCoordinator] Failed to delete pause sample: %@");
}

uint64_t sub_2116BE15C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2116BE180(char a1, void *a2)
{
  uint64_t v2;

  return sub_2116B8568(a1, a2, *(char **)(v2 + 16), (uint64_t)&unk_24CC50038, (uint64_t)sub_2116BE214, (uint64_t)&block_descriptor_137);
}

uint64_t sub_2116BE1B0(char a1, void *a2)
{
  uint64_t v2;

  return sub_2116B8568(a1, a2, *(char **)(v2 + 16), (uint64_t)&unk_24CC4FFE8, (uint64_t)sub_2116BDD28, (uint64_t)&block_descriptor_131);
}

uint64_t objectdestroy_72Tm()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2116BE214()
{
  sub_2116BE220("[PauseRingsCoordinator] Failed to add pause sample: %@");
}

void sub_2116BE220(const char *a1)
{
  uint64_t v1;
  void *v2;
  os_log_type_t v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  v2 = *(void **)(v1 + 24);
  if (*(_BYTE *)(v1 + 16) == 1 && v2 == 0)
  {
    sub_2116B82FC();
  }
  else
  {
    v5 = sub_2116BFCAC();
    v6 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], v5))
    {
      v7 = v2;
      v8 = v2;
      v9 = v6;
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138412290;
      if (v2)
      {
        v12 = v2;
        v13 = _swift_stdlib_bridgeErrorToNSError();
        sub_2116BFD00();
      }
      else
      {
        sub_2116BFD00();
        v13 = 0;
      }
      *v11 = v13;

      _os_log_impl(&dword_21168F000, v9, v5, a1, v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254ABE040);
      swift_arrayDestroy();
      MEMORY[0x212BDFE0C](v11, -1, -1);
      MEMORY[0x212BDFE0C](v10, -1, -1);

    }
    sub_2116B5F3C();
  }
}

uint64_t sub_2116BE3BC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2116BE3E0(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  return sub_2116B62E0(a2, a3, *(void **)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_2116BE3F4()
{
  return objectdestroy_91Tm();
}

uint64_t objectdestroy_91Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_2116BE43C()
{
  uint64_t v0;

  return sub_2116B65E4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

void sub_2116BE448()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(_QWORD *)(v0 + 16);
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_initialPauseStateLoadedNotification);
  objc_msgSend(v3, sel_postNotificationName_object_userInfo_, v2, v1, 0);

}

uint64_t sub_2116BE4D4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2116BE4F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_21168F000, v0, v1, "Error fetching activity summary: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void FIActivitySummaryAnalyticsNumberOfRingsCompletedWithProfile_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21168F000, v0, v1, "Error fetching activity summary: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_21168F000, v0, v1, "Error fetching workouts: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void FIActivitySummaryAnalyticsHasCompletedWorkoutWithProfile_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21168F000, v0, v1, "Error fetching workouts: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void FICanonicalQuantityUnitForIntervalType_cold_1()
{
  __assert_rtn("FICanonicalQuantityUnitForIntervalType", "FIIntervalDefinition.m", 31, "unit != nil");
}

void FIRandomKeyForPrefixWithTableName_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21168F000, a2, OS_LOG_TYPE_DEBUG, "Could not find random key for prefix %@, returning prefix itself", (uint8_t *)&v2, 0xCu);
}

void FIRandomStringWithKeyAndPossibleSuffixesWithTableName_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21168F000, log, OS_LOG_TYPE_ERROR, "Error formatting prefix (%@) with name: %@", (uint8_t *)&v3, 0x16u);
}

void FIDistanceUnitForHKUnit_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21168F000, v0, v1, "[WRKT] Attempting to convert invalid HKUnit to FIDistanceUnit: %@, defaulting to Kilometers.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void FIPace_cold_1()
{
  __assert_rtn("FIPace", "FIPaceUtilities.m", 32, "paceFormat != FIPaceFormatSpeed");
}

uint64_t __getCMCalorieUserInfoClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCMNatalimeterClass_block_invoke_cold_1(v0);
}

uint64_t __getCMNatalimeterClass_block_invoke_cold_1()
{
  abort_report_np();
  return FIIsDeviceSatellitePaired_cold_1();
}

uint64_t FIIsDeviceSatellitePaired_cold_1()
{
  dlerror();
  abort_report_np();
  return __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
}

uint64_t __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNPKExpressGymKitAvailabilityManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getNPKExpressGymKitAvailabilityManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return FIActivityMoveModeWithHealthStore_cold_1(v0);
}

void FIActivityMoveModeWithHealthStore_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21168F000, a2, OS_LOG_TYPE_ERROR, "Error reading activity mode characteristic. error=%@", (uint8_t *)&v2, 0xCu);
}

void FIActivityMoveModeUserDefault_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21168F000, log, OS_LOG_TYPE_ERROR, "No activity mode user default. Defaulting to HKActivityMoveModeActiveEnergy.", v1, 2u);
}

uint64_t sub_2116BFA30()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_2116BFA3C()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_2116BFA48()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_2116BFA54()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_2116BFA60()
{
  return MEMORY[0x24BDCBD90]();
}

uint64_t sub_2116BFA6C()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_2116BFA78()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2116BFA84()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2116BFA90()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2116BFA9C()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_2116BFAA8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2116BFAB4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2116BFAC0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2116BFACC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2116BFAD8()
{
  return MEMORY[0x24BDCF030]();
}

uint64_t sub_2116BFAE4()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_2116BFAF0()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_2116BFAFC()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_2116BFB08()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_2116BFB14()
{
  return MEMORY[0x24BDCF128]();
}

uint64_t sub_2116BFB20()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_2116BFB2C()
{
  return MEMORY[0x24BDCF150]();
}

uint64_t sub_2116BFB38()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2116BFB44()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2116BFB50()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2116BFB5C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2116BFB68()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_2116BFB74()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2116BFB80()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2116BFB8C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2116BFB98()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2116BFBA4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2116BFBB0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2116BFBBC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2116BFBC8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2116BFBD4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2116BFBE0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2116BFBEC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2116BFBF8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2116BFC04()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2116BFC10()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2116BFC1C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2116BFC28()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2116BFC34()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2116BFC40()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2116BFC4C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2116BFC58()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2116BFC64()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2116BFC70()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2116BFC7C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2116BFC88()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_2116BFC94()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2116BFCA0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2116BFCAC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2116BFCB8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2116BFCC4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2116BFCD0()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2116BFCDC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2116BFCE8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2116BFCF4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2116BFD00()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2116BFD0C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2116BFD18()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2116BFD24()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2116BFD30()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2116BFD3C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2116BFD48()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2116BFD54()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2116BFD60()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2116BFD6C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2116BFD78()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2116BFD84()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2116BFD90()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2116BFD9C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2116BFDA8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2116BFDB4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2116BFDC0()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_2116BFDCC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2116BFDD8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2116BFDE4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2116BFDF0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2116BFDFC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2116BFE08()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2116BFE14()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_2116BFE20()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2116BFE2C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2116BFE38()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2116BFE44()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2116BFE50()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2116BFE5C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2116BFE68()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2116BFE74()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

uint64_t HDActivityCacheEntityPredicateForCacheIndex()
{
  return MEMORY[0x24BE40808]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKNSOperatingSystemVersionCompare()
{
  return MEMORY[0x24BDD3260]();
}

uint64_t HKNSOperatingSystemVersionFromString()
{
  return MEMORY[0x24BDD3268]();
}

uint64_t HKNSOperatingSystemVersionsEqual()
{
  return MEMORY[0x24BDD3270]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x24BDD3730]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromHKSPSleepScheduleState()
{
  return MEMORY[0x24BEA9820]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x24BDBD018]();
}

uint64_t _CFPreferencesGetAppIntegerValueWithContainer()
{
  return MEMORY[0x24BDBD038]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x24BDBD050]();
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x24BDD4270]();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return MEMORY[0x24BDD4278]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x24BDD42A8]();
}

uint64_t _HKGenerateDefaultUnitForQuantityType()
{
  return MEMORY[0x24BDD4330]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x24BDD44F0]();
}

uint64_t _HKWorkoutActivityTypeIsValid()
{
  return MEMORY[0x24BDD44F8]();
}

uint64_t _HKWorkoutCanonicalEnergyBurnedUnit()
{
  return MEMORY[0x24BDD4510]();
}

uint64_t _HKWorkoutSessionLocationTypeName()
{
  return MEMORY[0x24BDD4538]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

