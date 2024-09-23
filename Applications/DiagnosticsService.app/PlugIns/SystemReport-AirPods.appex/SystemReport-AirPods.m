void sub_100003AB4(id a1)
{
  byte_100015370 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit"), "UTF8String"), 1) != 0;
}

void sub_100003B78(id a1)
{
  byte_100015371 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearField.framework/NearField"), "UTF8String"), 1) != 0;
}

void sub_100003C3C(id a1)
{
  byte_100015372 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory"), "UTF8String"), 1) != 0;
}

void sub_100003D00(id a1)
{
  byte_100015373 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit"), "UTF8String"), 1) != 0;
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

void sub_100005AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005B14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005B24(uint64_t a1)
{

}

void sub_100005B2C(uint64_t a1)
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

void sub_100006DB8(id a1)
{
  id v1;

  v1 = (id)MGCopyAnswer(CFSTR("ReleaseType"), 0);
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("Beta")))
    byte_100015398 = 1;

}

void sub_100006E44(id a1)
{
  byte_100015399 = os_variant_has_internal_content("com.apple.DiagnosticsService.SystemReport");
}

void sub_100008E9C(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(*(id *)(a1 + 32), "setBtManager:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "btManager"));
  v4 = objc_msgSend(v3, "available");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "bluetoothManagerDidBecomeAvailable");
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "btManagerAvailableSemaphore"));
    dispatch_semaphore_signal(v9);

  }
  else
  {
    v6 = DiagnosticLogHandleForCategory(6, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth manager is not available on init. Waiting for availability before retrieving devices.", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "bluetoothManagerDidBecomeAvailable", BluetoothAvailabilityChangedNotification, 0);

  }
}

void sub_100009A6C(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)BCBatteryDeviceController);
  v2 = (void *)qword_1000153B0;
  qword_1000153B0 = (uint64_t)v1;

}

void sub_10000A2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v25 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A2DC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000A2EC(uint64_t a1)
{

}

void sub_10000A2F4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bluetoothUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "formatterWithType:", 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastMeasurementTimestampLeft"));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v10));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v11, CFSTR("lastMeasurementTimestampLeft"));

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastMeasurementTimestampRight"));
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v12));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v13, CFSTR("lastMeasurementTimestampRight"));

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "version"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v14, CFSTR("version"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daysSinceLastMeasurementLeft"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v15, CFSTR("daysSinceLastCalLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daysSinceLastMeasurementRight"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v16, CFSTR("daysSinceLastCalRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daysSinceLastHarmonicMeasurementLeft"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v17, CFSTR("daysSinceLastHarmonicLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daysSinceLastHarmonicMeasurementRight"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v18, CFSTR("daysSinceLastHarmonicRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "errMicStatusLeft"), CFSTR("errMicStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "errMicStatusRight"), CFSTR("errMicStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "generalSystemStatusLeft"), CFSTR("generalSystemStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "generalSystemStatusRight"), CFSTR("generalSystemStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "frontVentStatusLeft"), CFSTR("frontVentStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "frontVentStatusRight"), CFSTR("frontVentStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "latestMeasurementResultLeft"), CFSTR("latestMeasurementResultLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "latestMeasurementResultRight"), CFSTR("latestMeasurementResultRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "rearVentStatusLeft"), CFSTR("rearVentStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "rearVentStatusRight"), CFSTR("rearVentStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "refMicStatusLeft"), CFSTR("refMicStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "refMicStatusRight"), CFSTR("refMicStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "speakerStatusLeft"), CFSTR("speakerStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "speakerStatusRight"), CFSTR("speakerStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "vceMicStatusLeft"), CFSTR("vceMicStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "vceMicStatusRight"), CFSTR("vceMicStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

    }
  }

}

void sub_10000A7D0(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a2;
  if (v4)
  {
    v5 = DiagnosticLogHandleForCategory(1, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to activate HMServiceClient with error: %@", (uint8_t *)&v8, 0xCu);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

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

id objc_msgSend__isBeatsDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isBeatsDevice:");
}

id objc_msgSend__setupTelephonyClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupTelephonyClient");
}

id objc_msgSend_aacpInfoFromAccessoryInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aacpInfoFromAccessoryInfo:");
}

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryInfo");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activationConfigurationInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationConfigurationInformation");
}

id objc_msgSend_activeHearingProtectionAvailableForAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeHearingProtectionAvailableForAddress:");
}

id objc_msgSend_activeHearingProtectionEnabledForAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeHearingProtectionEnabledForAddress:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEnumValueIfNotZero_forKey_toDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEnumValueIfNotZero:forKey:toDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectIfNotNil_forKey_toDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectIfNotNil:forKey:toDictionary:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_audioOutputForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioOutputForDevice:");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bluetoothManagerDidBecomeAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManagerDidBecomeAvailable");
}

id objc_msgSend_bluetoothUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothUUID");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_btManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btManager");
}

id objc_msgSend_btManagerAvailableSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btManagerAvailableSemaphore");
}

id objc_msgSend_budSide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "budSide:");
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

id objc_msgSend_caseInfoFromAccessoryInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInfoFromAccessoryInfo:");
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

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connected");
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedDevices");
}

id objc_msgSend_connectingDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectingDevices");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
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

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
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

id objc_msgSend_daysSinceLastHarmonicMeasurementLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceLastHarmonicMeasurementLeft");
}

id objc_msgSend_daysSinceLastHarmonicMeasurementRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceLastHarmonicMeasurementRight");
}

id objc_msgSend_daysSinceLastMeasurementLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceLastMeasurementLeft");
}

id objc_msgSend_daysSinceLastMeasurementRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceLastMeasurementRight");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
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

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_deviceVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceVersion");
}

id objc_msgSend_devicesWithDiscoveryFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicesWithDiscoveryFlags:error:");
}

id objc_msgSend_diagnosticsBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsBuild");
}

id objc_msgSend_diagnosticsVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsVersion");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_errMicStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errMicStatusLeft");
}

id objc_msgSend_errMicStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errMicStatusRight");
}

id objc_msgSend_formatterWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatterWithType:");
}

id objc_msgSend_frontVentStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontVentStatusLeft");
}

id objc_msgSend_frontVentStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontVentStatusRight");
}

id objc_msgSend_gapaFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gapaFlags");
}

id objc_msgSend_generalSystemStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generalSystemStatusLeft");
}

id objc_msgSend_generalSystemStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generalSystemStatusRight");
}

id objc_msgSend_generationStringForProductId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generationStringForProductId:");
}

id objc_msgSend_getAACPCapabilityBit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAACPCapabilityBit:");
}

id objc_msgSend_getAdaptiveVolumeMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAdaptiveVolumeMode");
}

id objc_msgSend_getAdaptiveVolumeSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAdaptiveVolumeSupport");
}

id objc_msgSend_getAutoEQStateForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAutoEQStateForDevice:");
}

id objc_msgSend_getBatteryInfoForAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBatteryInfoForAddress:");
}

id objc_msgSend_getCBDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCBDevices");
}

id objc_msgSend_getConversationDetectMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConversationDetectMode");
}

id objc_msgSend_getConversationDetectSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConversationDetectSupport");
}

id objc_msgSend_getPairedAppleAudioDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairedAppleAudioDevices");
}

id objc_msgSend_getSpatialAudioPlatformSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSpatialAudioPlatformSupport");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_gyroInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gyroInformation");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_inEarDetectEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEarDetectEnabled");
}

id objc_msgSend_inEarStatusForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEarStatusForDevice:");
}

id objc_msgSend_inEarStatusPrimary_secondary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEarStatusPrimary:secondary:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
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

id objc_msgSend_isAppleAudioDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleAudioDevice");
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

id objc_msgSend_isGenuineAirPods(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGenuineAirPods");
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

id objc_msgSend_isTemporaryPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTemporaryPaired");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languageCode");
}

id objc_msgSend_lastEraseDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastEraseDate");
}

id objc_msgSend_lastMeasurementTimestampLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastMeasurementTimestampLeft");
}

id objc_msgSend_lastMeasurementTimestampRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastMeasurementTimestampRight");
}

id objc_msgSend_lastRestoreDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRestoreDate");
}

id objc_msgSend_lastUpdateDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastUpdateDate");
}

id objc_msgSend_latestMeasurementResultLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestMeasurementResultLeft");
}

id objc_msgSend_latestMeasurementResultRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestMeasurementResultRight");
}

id objc_msgSend_latestUserLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestUserLog");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningMode");
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

id objc_msgSend_microphoneCalibrationResultForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "microphoneCalibrationResultForDevice:");
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

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedDevices");
}

id objc_msgSend_parts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parts");
}

id objc_msgSend_percentCharge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentCharge");
}

id objc_msgSend_populateAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateAttributes:");
}

id objc_msgSend_primaryBudSide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryBudSide:");
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productId");
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productName");
}

id objc_msgSend_productVersionExtra(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productVersionExtra");
}

id objc_msgSend_rearVentStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rearVentStatusLeft");
}

id objc_msgSend_rearVentStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rearVentStatusRight");
}

id objc_msgSend_refMicStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refMicStatusLeft");
}

id objc_msgSend_refMicStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refMicStatusRight");
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

id objc_msgSend_serialNumberFromAacpInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumberFromAacpInfo:");
}

id objc_msgSend_setBtManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBtManager:");
}

id objc_msgSend_setComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponent:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDeviceDiagnosticRecordFoundHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDiagnosticRecordFoundHandler:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
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

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sikPublicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sikPublicKey");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotID");
}

id objc_msgSend_spatialAudioEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialAudioEnabled");
}

id objc_msgSend_spatialAudioSupportedForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialAudioSupportedForDevice:");
}

id objc_msgSend_speakerStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakerStatusLeft");
}

id objc_msgSend_speakerStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakerStatusRight");
}

id objc_msgSend_storeDemoModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeDemoModeEnabled");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForInEarStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForInEarStatus:");
}

id objc_msgSend_stringForListeningMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForListeningMode:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
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

id objc_msgSend_vceMicStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vceMicStatusLeft");
}

id objc_msgSend_vceMicStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vceMicStatusRight");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}
