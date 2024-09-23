void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id HKMobilityAllWalkingSteadinessNotificationCategories()
{
  void *v0;
  void *v1;
  void *v2;

  HKMobilityWalkingSteadinessInitialNotificationCategories();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HKMobilityWalkingSteadinessRepeatNotificationCategories();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id HKMobilityWalkingSteadinessInitialNotificationCategories()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.VeryLow");
  v1[1] = CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.Low");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id HKMobilityWalkingSteadinessRepeatNotificationCategories()
{
  _QWORD v1[3];

  v1[2] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow");
  v1[1] = CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.Low");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t HKMobilityNotificationCategoryForWalkingSteadinessEventValue(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return *((_QWORD *)&off_1E9C36488 + a1 - 1);
}

uint64_t HKMobilityWalkingSteadinessFeatureStatusManagerClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0134F60);
}

uint64_t HKMobilityWalkingSteadinessFeatureStatusManagerServerInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0138A10);
}

const char *HMMobilityLogCategoryForCategory(unint64_t a1)
{
  if (a1 >= 0xF)
    HMMobilityLogCategoryForCategory_cold_1();
  if (a1 - 1 > 0xD)
    return "default";
  else
    return off_1E9C365A0[a1 - 1];
}

id HMMobilityLogForCategory(unint64_t a1)
{
  if (a1 >= 0xF)
    HMMobilityLogForCategory_cold_1();
  if (HMMobilityLogForCategory_onceToken != -1)
    dispatch_once(&HMMobilityLogForCategory_onceToken, &__block_literal_global);
  return HMMobilityLogForCategory_logObjects[a1];
}

void sub_1D7806774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
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

void sub_1D78069B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D7806B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D7806DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D7806FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t HKMobilityLocalizedNotificationString(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", a1, 0);
}

uint64_t HKMobilityWalkingSteadinessType()
{
  return objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A70]);
}

uint64_t HKMobilityWalkingSteadinessEventType()
{
  return objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4888]);
}

uint64_t HKMobilityWalkingSteadinessDetailRoomURL()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-apple-health://SampleType/HKQuantityTypeIdentifierAppleWalkingSteadiness"));
}

id HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory(void *a1)
{
  id v1;
  const __CFString *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.Low")))
  {
    v2 = CFSTR("WALKING_STEADINESS_NOTIFICATION_BODY_INITIAL_LOW_PREGNANCY");
LABEL_9:
    HKMobilityLocalizedNotificationString((uint64_t)v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.VeryLow")))
  {
    v2 = CFSTR("WALKING_STEADINESS_NOTIFICATION_BODY_INITIAL_VERY_LOW_PREGNANCY");
    goto LABEL_9;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.Low")))
  {
    v2 = CFSTR("WALKING_STEADINESS_NOTIFICATION_BODY_REPEAT_LOW_PREGNANCY");
    goto LABEL_9;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow")))
  {
    v2 = CFSTR("WALKING_STEADINESS_NOTIFICATION_BODY_REPEAT_VERY_LOW_PREGNANCY");
    goto LABEL_9;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_FAULT))
    HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory_cold_1();
  v3 = 0;
LABEL_10:

  return v3;
}

id HKMobilityLocalizedNotificationBodyForCategory(void *a1)
{
  id v1;
  const __CFString *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.Low")))
  {
    v2 = CFSTR("WALKING_STEADINESS_NOTIFICATION_BODY_INITIAL_LOW");
LABEL_9:
    HKMobilityLocalizedNotificationString((uint64_t)v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.VeryLow")))
  {
    v2 = CFSTR("WALKING_STEADINESS_NOTIFICATION_BODY_INITIAL_VERY_LOW");
    goto LABEL_9;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.Low")))
  {
    v2 = CFSTR("WALKING_STEADINESS_NOTIFICATION_BODY_REPEAT_LOW");
    goto LABEL_9;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow")))
  {
    v2 = CFSTR("WALKING_STEADINESS_NOTIFICATION_BODY_REPEAT_VERY_LOW");
    goto LABEL_9;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_FAULT))
    HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory_cold_1();
  v3 = 0;
LABEL_10:

  return v3;
}

__CFString *HKMobilityNotificationIdentifierForCategory(void *a1)
{
  id v1;
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  char v6;

  v1 = a1;
  HKMobilityWalkingSteadinessInitialNotificationCategories();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", v1);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("MobilityAppPlugin.WalkingSteadinessInitial");
  }
  else
  {
    HKMobilityWalkingSteadinessRepeatNotificationCategories();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v1);

    if ((v6 & 1) != 0)
      v4 = CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat");
    else
      v4 = (__CFString *)v1;
  }

  return v4;
}

void HMMobilityLogCategoryForCategory_cold_1()
{
  __assert_rtn("HMMobilityLogCategoryForCategory", "HMMobilityLogging.m", 30, "category < HMMobilityLogCount");
}

void HMMobilityLogForCategory_cold_1()
{
  __assert_rtn("HMMobilityLogForCategory", "HMMobilityLogging.m", 54, "category < HMMobilityLogCount");
}

void HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7804000, v0, v1, "[UNNotificationRequest+HKMobility] Unable to localize notification body prefix for category: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAgeAndMaximumAge()
{
  return MEMORY[0x1E0CB46C8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1E0CB4B08]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1E0CB51B8]();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

