void sub_1B77D59C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B77D6A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
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

void sub_1B77DA588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
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

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t HKMedicationScheduleFrequencyTypeForScheduleType(unint64_t a1)
{
  if (a1 > 8)
    return 4;
  else
    return qword_1B77F1968[a1];
}

void sub_1B77DF664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

__CFString *HKStringFromReminderWeekdayOptions(uint64_t a1)
{
  char v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (!a1)
  {
    v6 = CFSTR("None");
    return v6;
  }
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((v1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("Monday"));
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0)
        goto LABEL_5;
      goto LABEL_15;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("Tuesday"));
  if ((v1 & 4) == 0)
  {
LABEL_5:
    if ((v1 & 8) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v3, "addObject:", CFSTR("Wednesday"));
  if ((v1 & 8) == 0)
  {
LABEL_6:
    if ((v1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v3, "addObject:", CFSTR("Thursday"));
  if ((v1 & 0x10) == 0)
  {
LABEL_7:
    if ((v1 & 0x20) == 0)
      goto LABEL_8;
LABEL_18:
    objc_msgSend(v3, "addObject:", CFSTR("Saturday"));
    if ((v1 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  objc_msgSend(v3, "addObject:", CFSTR("Friday"));
  if ((v1 & 0x20) != 0)
    goto LABEL_18;
LABEL_8:
  if ((v1 & 0x40) != 0)
LABEL_9:
    objc_msgSend(v3, "addObject:", CFSTR("Sunday"));
LABEL_10:
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

__n128 HKiOSVersionFromWatchOSVersion@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;

  *(_QWORD *)a2 = *(_QWORD *)a1 + 7;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 HKWatchOSVersionFromiOSVersion@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;

  *(_QWORD *)a2 = *(_QWORD *)a1 - 7;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

__n128 HKMedicationFirstSupportedOSVersionForDeviceType@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  __n128 result;

  switch(a1)
  {
    case 0:
      v2 = &HKMedicationFirstSupportedOSVersionOniOS;
      goto LABEL_6;
    case 1:
      v2 = &HKMedicationFirstSupportedOSVersionOnWatchOS;
      goto LABEL_6;
    case 2:
      v2 = &HKMedicationFirstSupportedOSVersionOniPadOS;
      goto LABEL_6;
    case 3:
      v2 = &HKMedicationFirstSupportedOSVersionOnVisionOS;
LABEL_6:
      result = (__n128)*v2;
      *(_OWORD *)a2 = *v2;
      *(_QWORD *)(a2 + 16) = *((_QWORD *)v2 + 2);
      break;
    default:
      return result;
  }
  return result;
}

__CFString *HKStringFromDrugInteractionLifestyleFactor(unint64_t a1)
{
  if (a1 < 4)
    return off_1E6CD5818[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id HKConceptIdentifierForDrugInteractionLifestyleFactor(uint64_t a1)
{
  uint64_t v1;

  if ((unint64_t)(a1 - 1) >= 3)
    v1 = 0;
  else
    v1 = 703 - a1;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", v1);
}

void *HKDrugInteractionLifestyleFactorForHKConceptIdentifier(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "rawIdentifier") == 702)
  {
    v2 = &unk_1E6CE02D8;
  }
  else if (objc_msgSend(v1, "rawIdentifier") == 701)
  {
    v2 = &unk_1E6CE02F0;
  }
  else if (objc_msgSend(v1, "rawIdentifier") == 700)
  {
    v2 = &unk_1E6CE0308;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *HKStringFromMedicationScheduleType(unint64_t a1)
{
  if (a1 < 9)
    return off_1E6CD5838[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown scheduleType (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void *HKAllMedicationScheduleTypes()
{
  return &unk_1E6CE0488;
}

__CFString *HKStringFromMedicationProductType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 6)
    return off_1E6CD5880[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKStringFromDrugInteractionType(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("Multiple Medications");
  if (a1 == 2)
  {
    v1 = CFSTR("Medication + Lifestyle Factor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HKStringFromDrugInteractionSeverityLevel(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 4)
    return off_1E6CD58B0[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKStringFromMedicationListOnboardingStepType(unint64_t a1)
{
  if (a1 < 0xE)
    return off_1E6CD58D0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKStringFromHKMedicationListOnboardingAlgorithmType(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("OCR");
  if (a1 == 1)
  {
    v1 = CFSTR("NDC");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HKStringFromMedicationListOnboardingProvenanceType(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("FromSummary");
  if (a1 == 1)
  {
    v1 = CFSTR("FromMedsTrackingRoom");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HKStringFromMedicationListOnboardingActionType(unint64_t a1)
{
  if (a1 < 0xD)
    return off_1E6CD5940[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKStringFromMedicationListOnboardingDetailsEntryType(unint64_t a1)
{
  if (a1 < 5)
    return off_1E6CD59A8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKStringFromMedicationRoomProvenance(unint64_t a1)
{
  if (a1 < 9)
    return off_1E6CD59D0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKStringFromMedicationRoomType(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("DataTypeRoom");
  if (a1 == 2)
  {
    v1 = CFSTR("CategoryRoom");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *HKStringFromMedicationRoomAnalyticsAction(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 0x1D)
    return off_1E6CD5A18[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HKStringFromMedicationLoggingContext(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 0xA)
    return off_1E6CD5B00[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id HKMedicationAnalyticsWeeksBetweenDates(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a1;
  objc_msgSend(v6, "startOfDayForDate:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startOfDayForDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "day");
  if (v10 >= 0)
    v11 = v10;
  else
    v11 = -v10;
  v12 = (((unsigned __int16)(v11 - ((9363 * (unsigned __int16)v11) >> 16)) >> 1)
       + ((9363 * (unsigned __int16)v11) >> 16)) >> 2;
  v13 = v11 >= 0x2BC;
  v14 = 10 * (v11 / 0x46);
  if (v13)
    v15 = v14;
  else
    v15 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t HKMedicationsRoomDeepLink()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-apple-health://MedicationsHealthAppPlugin.healthplugin"));
}

id OUTLINED_FUNCTION_0_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id HKMedicationsSharedAnalyticsQueue()
{
  if (HKMedicationsSharedAnalyticsQueue_onceToken != -1)
    dispatch_once(&HKMedicationsSharedAnalyticsQueue_onceToken, &__block_literal_global_4);
  return (id)HKMedicationsSharedAnalyticsQueue_analyticsQueue;
}

id HKMedicationsBucketedDecadeForAge(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  v2 = a1;
  objc_msgSend(v1, "numberWithInteger:", 18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKAnalyticsDecadeBucketedAgeForAgeWithBoundsAndBucketRange();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t HKMedicationScheduleCompatibilityVersionFuture()
{
  return 2;
}

uint64_t HKMedicationScheduleCompatibilityRangeToString(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Minimum:%ld, Origin:%ld, Current Device: %ld]"), a1, a2, 1);
}

uint64_t HKMedicationScheduleCompatibilityVersionForOSVersion(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v11 = v2;
  v12 = v3;
  switch(a2)
  {
    case 0:
      v4 = *a1;
      goto LABEL_4;
    case 1:
      memset(v10, 0, sizeof(v10));
      v8 = *(_OWORD *)a1;
      v9 = a1[2];
      HKiOSVersionFromWatchOSVersion((uint64_t)&v8, (uint64_t)v10);
      v4 = v10[0];
LABEL_4:
      if ((unint64_t)(v4 - 16) < 3)
        return qword_1B77F1A30[v4 - 16];
      v7 = &HKMedicationFirstSupportedOSVersionOniOS;
      goto LABEL_18;
    case 2:
      v4 = *a1;
      if (*a1 == 17)
        return 0;
      if (v4 == 18)
        return 1;
      v7 = &HKMedicationFirstSupportedOSVersionOniPadOS;
LABEL_18:
      if (v4 < *(_QWORD *)v7)
        return -1;
      else
        return 1;
    case 3:
      v6 = -1;
      if (*a1 >= (uint64_t)HKMedicationFirstSupportedOSVersionOnVisionOS)
        v6 = 1;
      if (*a1 == 2)
        return 1;
      else
        return v6;
    default:
      return -1;
  }
}

uint64_t HKMedicationScheduleCompatibilityVersionForiPhoneOSVersion(_QWORD *a1)
{
  unint64_t v1;

  v1 = *a1 - 16;
  if (v1 < 3)
    return qword_1B77F1A30[v1];
  if (*a1 < (uint64_t)HKMedicationFirstSupportedOSVersionOniOS)
    return -1;
  return 1;
}

uint64_t HKMedicationScheduleCompatibilityVersionForiPadOSVersion(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if (*a1 == 17)
    return 0;
  if (v1 == 18)
    return 1;
  if (v1 < (uint64_t)HKMedicationFirstSupportedOSVersionOniPadOS)
    return -1;
  return 1;
}

uint64_t HKMedicationScheduleCompatibilityVersionForVisionOSVersion(_QWORD *a1)
{
  uint64_t v1;

  v1 = -1;
  if (*a1 >= (uint64_t)HKMedicationFirstSupportedOSVersionOnVisionOS)
    v1 = 1;
  if (*a1 == 2)
    return 1;
  else
    return v1;
}

uint64_t HKMedicationScheduleCompatibilityVersionForMedicationScheduleType(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((unint64_t)(a1 - 5) > 3)
  {
    v3 = 0;
    v2 = 1;
  }
  else
  {
    v2 = qword_1B77F1A48[a1 - 5];
    v3 = v2;
  }
  if (a2)
    return v2;
  else
    return v3;
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

uint64_t HKAnalyticsDecadeBucketedAgeForAgeWithBoundsAndBucketRange()
{
  return MEMORY[0x1E0CB46B8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1E0CB4B08]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1E0CB51B8]();
}

uint64_t HKLogHealthOntology()
{
  return MEMORY[0x1E0CB52D0]();
}

uint64_t HKLogMedication()
{
  return MEMORY[0x1E0CB5308]();
}

uint64_t HKNSOperatingSystemVersionFromString()
{
  return MEMORY[0x1E0CB5638]();
}

uint64_t HKNSOperatingSystemVersionString()
{
  return MEMORY[0x1E0CB5648]();
}

uint64_t HKNSOperatingSystemVersionsEqual()
{
  return MEMORY[0x1E0CB5658]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1E0CB5E90]();
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x1E0CB5FC0]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x1E0CB6050]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1E0CB7190]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1E0CB71A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

