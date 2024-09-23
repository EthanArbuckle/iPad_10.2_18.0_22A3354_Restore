void sub_10000362C(id a1)
{
  byte_100011150 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit"), "UTF8String"), 1) != 0;
}

void sub_1000036F0(id a1)
{
  byte_100011151 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearField.framework/NearField"), "UTF8String"), 1) != 0;
}

void sub_1000037B4(id a1)
{
  byte_100011152 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory"), "UTF8String"), 1) != 0;
}

void sub_100003878(id a1)
{
  byte_100011153 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit"), "UTF8String"), 1) != 0;
}

void sub_100003C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003CC0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003CD0(uint64_t a1)
{

}

intptr_t sub_100003CD8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "device"));
  v5 = objc_loadWeakRetained(v2);
  if (objc_msgSend(v5, "isMagSafe"))
    v6 = 135;
  else
    v6 = 13;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromHIDReport:", v6));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000040F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000411C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000412C(uint64_t a1)
{

}

intptr_t sub_100004134(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hidDevice"));
  v5 = objc_loadWeakRetained(v2);
  if (objc_msgSend(v5, "isMagSafe"))
    v6 = 135;
  else
    v6 = 13;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromHIDReport:", v6));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id stringOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

id numberOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

void sub_100005364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005384(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005394(uint64_t a1)
{

}

void sub_10000539C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemVersion"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100006628(id a1)
{
  id v1;

  v1 = (id)MGCopyAnswer(CFSTR("ReleaseType"), 0);
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("Beta")))
    byte_100011178 = 1;

}

void sub_1000066B4(id a1)
{
  byte_100011179 = os_variant_has_internal_content("com.apple.DiagnosticsService.SystemReport");
}

id objc_msgSend_ECID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ECID");
}

id objc_msgSend_UDID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UDID");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__setupTelephonyClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupTelephonyClient");
}

id objc_msgSend_activationConfigurationInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationConfigurationInformation");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_batterySerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batterySerialNumber");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_carrierBundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierBundleVersion");
}

id objc_msgSend_carrierName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierName");
}

id objc_msgSend_carrierName2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierName2");
}

id objc_msgSend_carrierNameForSimCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierNameForSimCard:");
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chipID");
}

id objc_msgSend_component(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "component");
}

id objc_msgSend_componentIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentIdentity");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleValue:key:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleVersion:error:");
}

id objc_msgSend_coreRepairClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreRepairClass:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cpuArchitecture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cpuArchitecture");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentStandbyTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStandbyTime");
}

id objc_msgSend_currentUsageTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUsageTime");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceColor");
}

id objc_msgSend_deviceMatchingAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMatchingAccessories:");
}

id objc_msgSend_deviceModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceModel");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_deviceVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceVersion");
}

id objc_msgSend_deviceWithSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithSerialNumber:");
}

id objc_msgSend_diagnosticsBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsBuild");
}

id objc_msgSend_diagnosticsVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsVersion");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_formatterWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatterWithType:");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_hidDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidDevice");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_information(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "information");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isBetaBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBetaBuild");
}

id objc_msgSend_isBiometricKitFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBiometricKitFrameworkAvailable");
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCheckerBoardActive");
}

id objc_msgSend_isCoreRepairFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCoreRepairFrameworkAvailable");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGreenTeaDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGreenTeaDevice");
}

id objc_msgSend_isInBoxUpdateEligibleMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInBoxUpdateEligibleMode");
}

id objc_msgSend_isInBoxUpdateMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInBoxUpdateMode:");
}

id objc_msgSend_isInDiagnosticsMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInDiagnosticsMode");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isMagSafe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMagSafe");
}

id objc_msgSend_isNearFieldAccessoryFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearFieldAccessoryFrameworkAvailable");
}

id objc_msgSend_isNearFieldFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearFieldFrameworkAvailable");
}

id objc_msgSend_isPasscodeLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeLocked");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_isPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPresent");
}

id objc_msgSend_isProdDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProdDevice");
}

id objc_msgSend_isServicePart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServicePart");
}

id objc_msgSend_isServicePartWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServicePartWithError:");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languageCode");
}

id objc_msgSend_lastEraseDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastEraseDate");
}

id objc_msgSend_lastRestoreDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRestoreDate");
}

id objc_msgSend_lastUpdateDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastUpdateDate");
}

id objc_msgSend_latestUserLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestUserLog");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTime");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTimeZone");
}

id objc_msgSend_localeCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeCode");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_marketingProductNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "marketingProductNumber");
}

id objc_msgSend_marketingVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "marketingVersion");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_populateAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateAttributes:");
}

id objc_msgSend_productVersionExtra(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productVersionExtra");
}

id objc_msgSend_psDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "psDevice");
}

id objc_msgSend_regulatoryModelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regulatoryModelNumber");
}

id objc_msgSend_restoreDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreDate");
}

id objc_msgSend_rootCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootCreationDate");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_setComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponent:");
}

id objc_msgSend_setHidDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidDevice:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSubscriptionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubscriptionInfo:");
}

id objc_msgSend_setTelephonyClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTelephonyClient:");
}

id objc_msgSend_setupAssistantCompletionDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAssistantCompletionDate");
}

id objc_msgSend_setupCompletedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCompletedDate");
}

id objc_msgSend_setupWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupWithContext:");
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFormatter");
}

id objc_msgSend_sikPublicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sikPublicKey");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotID");
}

id objc_msgSend_storeDemoModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeDemoModeEnabled");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromHIDReport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromHIDReport:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscriptionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionInfo");
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptions");
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionsInUse");
}

id objc_msgSend_supplementalBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplementalBuildVersion");
}

id objc_msgSend_supportsInductiveCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsInductiveCharging");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemUptime");
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemVersion");
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telephonyClient");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_updateDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDate");
}
