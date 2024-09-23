void sub_1CC2A01C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_0_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

void sub_1CC2A3288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
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

id _SampleClassificationFromRow(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  HDSQLiteColumnWithNameAsUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1D17A8510](a1, CFSTR("classification"));
  HDSQLiteColumnWithNameAsDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v8 = v7;
  HDSQLiteColumnWithNameAsString();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v4 && v6 && v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0D2FC08]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v6, v8);
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithSampleUUID:classification:sampleDateInterval:sampleTimeZone:", v4, v5, v12, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 100, CFSTR("Unexpectedly found missing values: sampleUUID(%@) date(%@) timeZoneString(%@)"), v4, v6, v9);
    v14 = 0;
  }

  return v14;
}

id HDHRSampleClassificationEntityPropertiesForModel()
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("sample_uuid");
  v1[1] = CFSTR("classification");
  v1[2] = CFSTR("sample_start_date");
  v1[3] = CFSTR("sample_duration");
  v1[4] = CFSTR("sample_time_zone");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1CC2A3B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _LocalWatchDeviceSupportsCountryCode(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOSVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v1;
  NRRawVersionFromString();
  v5 = HKAtrialFibrillationDetectionSupportedStateForGeolocatedCountryCodeAndWatchOSVersion();

  return (v5 < 5) & (3u >> v5);
}

uint64_t _PairedWatchDeviceSupportsCountryCode(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51778]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v3;
    NRRawVersionFromString();
    v6 = HKAtrialFibrillationDetectionSupportedStateForGeolocatedCountryCodeAndWatchOSVersion();

    if (v6 <= 4)
      v7 = (3u >> v6) & 1;
    else
      v7 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB52F0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      _PairedWatchDeviceSupportsCountryCode_cold_1(v8);
    v7 = 0;
  }

  return v7;
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_7(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_10(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_13(uint64_t a1, void *a2)
{
  return a2;
}

void sub_1CC2A6868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id HRHeartHealthDaemonBundle()
{
  if (HRHeartHealthDaemonBundle_onceToken != -1)
    dispatch_once(&HRHeartHealthDaemonBundle_onceToken, &__block_literal_global_1);
  return (id)HRHeartHealthDaemonBundle_bundle;
}

id HRLocalizedStringWithKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  HRHeartHealthDaemonBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E87F0B08, CFSTR("Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id HRLogSensitiveClassName()
{
  objc_class *v0;
  void *v1;
  void *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSensitiveLogItems");

  if (v3)
  {
    v4 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", &stru_1E87F0B08);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

id OUTLINED_FUNCTION_3_1(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return objc_opt_class();
}

void sub_1CC2AA170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1CC2AA4B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id HKHRElectrocardiogramRecordingV1AllowedCountrySet()
{
  void *v0;
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  HKElectrocardiogramSupportedCountries();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleWatch");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isRunningSeedBuild");

    v20 = 0;
    v21 = 0;
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "currentOSVersionStruct");
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
    }

    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v0;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((unint64_t)HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion() <= 1)
            objc_msgSend(v1, "addObject:", v13, (_QWORD)v16);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_msgSend(v0, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "addObjectsFromArray:", v7);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6538]), "initWithSupportedCountryCodes:contentVersion:provenance:", v1, 1, 3);

  return v14;
}

uint64_t HKHRElectrocardiogramRecordingV1LocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("1"), *MEMORY[0x1E0CB4D40], *MEMORY[0x1E0CB4D38]);
}

uint64_t HKHRElectrocardiogramRecordingV2LocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("2"), CFSTR("(01)00190199649286"), CFSTR("(01)00190199649293"));
}

HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *HKHRElectrocardiogramRecordingV2FeatureAvailabilityProvider(void *a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider *v24;
  void *v25;
  void *v26;
  HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider *v27;
  HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  HDHRElectrocardiogramV2DeviceSupportedStateProvider *v33;
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v34;
  void *v35;
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v36;
  uint64_t v38;
  id v39;

  v10 = a1;
  v11 = a2;
  v39 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (id)*MEMORY[0x1E0CB5018];
  if (!v11)
  {
    v15 = objc_alloc(MEMORY[0x1E0D294C8]);
    objc_msgSend(MEMORY[0x1E0CB6538], "localAvailabilityForHKFeatureIdentifierElectrocardiogramRecordingV2");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v14, v16, v17);

    v19 = objc_alloc(MEMORY[0x1E0D29538]);
    objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("2"), CFSTR("(01)00190199649286"), CFSTR("(01)00190199649293"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v19, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v14, v20, v18);

  }
  if (objc_msgSend(v10, "profileType") == 1)
    objc_msgSend(v11, "synchronizeLocalProperties");
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isAppleWatch");

  if ((v22 & 1) != 0)
    v23 = 0;
  else
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("68AB2987-CE75-463C-9EAF-9861B292F01E"));
  v24 = [HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider alloc];
  objc_msgSend(v10, "daemon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "nanoRegistryDeviceCapabilityProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HDHRElectrocardiogramRecordingV2PairedFeatureAttributesProvider initWithPairedFeatureAttributesProvider:pairedDeviceCapabilityProvider:](v24, "initWithPairedFeatureAttributesProvider:pairedDeviceCapabilityProvider:", v11, v26);

  v28 = v27;
  if (!v12)
  {
    if (a6)
    {
      v29 = objc_alloc(MEMORY[0x1E0D294C8]);
      objc_msgSend(MEMORY[0x1E0CB6538], "localAvailabilityForHKFeatureIdentifierElectrocardiogramRecordingV2");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "daemon");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v29, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v14, v30, v31);

    }
    else
    {
      v32 = objc_alloc(MEMORY[0x1E0D295C8]);
      v12 = (id)objc_msgSend(v32, "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v11, v10, v23, *MEMORY[0x1E0CB52F0]);
    }
  }
  v33 = objc_alloc_init(HDHRElectrocardiogramV2DeviceSupportedStateProvider);
  v34 = [HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager alloc];
  objc_msgSend(MEMORY[0x1E0D2FC00], "requirementSetV2");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v38) = a6;
  v36 = -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager initWithProfile:featureIdentifier:onboardingVersion:pairedFeatureAttributesProvider:disableAndExpiryProvider:regionAvailabilityProvider:deviceSupportedProvider:availabilityRequirementSet:cacheDefaults:isStandalone:](v34, "initWithProfile:featureIdentifier:onboardingVersion:pairedFeatureAttributesProvider:disableAndExpiryProvider:regionAvailabilityProvider:deviceSupportedProvider:availabilityRequirementSet:cacheDefaults:isStandalone:", v10, v14, 4, v28, v39, v12, v33, v35, v13, v38);

  return v36;
}

HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *HKHRElectrocardiogramRecordingV1FeatureAvailabilityProvider(void *a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  HDHRElectrocardiogramV1DeviceSupportedStateProvider *v32;
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager *v38;
  id v39;
  id v40;
  HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider *v41;

  v11 = a1;
  v12 = a2;
  v40 = a3;
  v41 = a4;
  v39 = a5;
  v13 = (id)*MEMORY[0x1E0CB5010];
  if (!v12)
  {
    v14 = objc_alloc(MEMORY[0x1E0D294C8]);
    HKHRElectrocardiogramRecordingV1AllowedCountrySet();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "daemon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v13, v15, v16);

    v18 = objc_alloc(MEMORY[0x1E0D29538]);
    objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("1"), *MEMORY[0x1E0CB4D40], *MEMORY[0x1E0CB4D38]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v18, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v13, v19, v17);

  }
  if (objc_msgSend(v11, "profileType") == 1)
    objc_msgSend(v12, "synchronizeLocalProperties");
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isAppleWatch");

  v22 = a6;
  if ((v21 & 1) != 0)
    v23 = 0;
  else
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("68AB2987-CE75-463C-9EAF-9861B292F01E"));
  v24 = v13;
  objc_msgSend(v11, "daemon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "nanoRegistryDeviceCapabilityProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider initWithPairedFeatureAttributesProvider:pairedDeviceCapabilityProvider:]([HDHRElectrocardiogramRecordingV1PairedFeatureAttributesProvider alloc], "initWithPairedFeatureAttributesProvider:pairedDeviceCapabilityProvider:", v12, v26);
  if (!v41)
  {
    if (v22)
    {
      v28 = objc_alloc(MEMORY[0x1E0D294C8]);
      HKHRElectrocardiogramRecordingV1AllowedCountrySet();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "daemon");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider *)objc_msgSend(v28, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v24, v29, v30);

    }
    else
    {
      v31 = objc_alloc(MEMORY[0x1E0D295C8]);
      v29 = (void *)objc_msgSend(v31, "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v12, v11, v23, *MEMORY[0x1E0CB52F0]);
      v41 = -[HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider initWithRegionAvailabilityProvider:pairedDeviceCapabilityProvider:]([HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider alloc], "initWithRegionAvailabilityProvider:pairedDeviceCapabilityProvider:", v29, v26);
    }

  }
  v32 = objc_alloc_init(HDHRElectrocardiogramV1DeviceSupportedStateProvider);
  v33 = [HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager alloc];
  objc_msgSend(MEMORY[0x1E0CB66F0], "noRequirements");
  v34 = (void *)v23;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = v22;
  v38 = -[HDHRElectrocardiogramRecordingCommonFeatureAvailabilityManager initWithProfile:featureIdentifier:onboardingVersion:pairedFeatureAttributesProvider:disableAndExpiryProvider:regionAvailabilityProvider:deviceSupportedProvider:availabilityRequirementSet:cacheDefaults:isStandalone:](v33, "initWithProfile:featureIdentifier:onboardingVersion:pairedFeatureAttributesProvider:disableAndExpiryProvider:regionAvailabilityProvider:deviceSupportedProvider:availabilityRequirementSet:cacheDefaults:isStandalone:", v11, v24, 3, v27, v40, v41, v32, v35, v39, v37);

  return v38;
}

id HKHRCachedActiveECGAlgorithmVersionInUserDefaults(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0CB4D30]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && objc_msgSend(v1, "integerValue") >= 1)
  {
    v3 = objc_msgSend(v2, "integerValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0CB6658], "algorithmVersionForOnboardingVersion:", v3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4
      && objc_msgSend(v4, "integerValue") >= 1
      && (v6 = objc_msgSend(v5, "integerValue"), v6 < *MEMORY[0x1E0CB70A8]))
    {
      objc_msgSend(v5, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t HKHRCountForSampleWithTypeSinceDate(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v13;

  v6 = (void *)MEMORY[0x1E0D29578];
  v7 = a2;
  v8 = a1;
  HDSampleEntityPredicateForStartDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v10 = objc_msgSend(v6, "countOfSamplesWithType:profile:matchingPredicate:withError:", v7, v8, v9, &v13);

  v11 = v13;
  if (v11)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();
  }

  return v10;
}

id HKHRAtrialFibrillationEventMinutesBetweenLastSampleAndDate(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v18;

  v5 = a2;
  v6 = (void *)MEMORY[0x1E0CB6978];
  v7 = a1;
  objc_msgSend(v6, "atrialFibrillationEventType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0D29578], "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v8, v7, 0, 0, 0, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v18;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v12);
    v14 = (uint64_t)v13 / 60;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v10;
    if (v16)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    v15 = 0;
  }

  return v15;
}

uint64_t HKHRElectrocardiogramAnalyticsBucketForSampleCount(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 1;
  v2 = 6;
  if ((unint64_t)a1 < 6)
    v2 = 3;
  if ((unint64_t)a1 >= 3)
    v1 = v2;
  if (a1 >= 1)
    return v1;
  else
    return 0;
}

void *HKHRAtrialFibrillationEventAnalyticsMinutesBucket(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "integerValue") >= 181)
      v3 = &unk_1E87FED50;
    else
      v3 = &unk_1E87FED38;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

const __CFString *NSStringFromHKElectPrivaterocardiogramSymptom(uint64_t a1)
{
  uint64_t v1;
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  if (a1 > 63)
  {
    v3 = CFSTR("ShortnessOfBreath");
    v4 = CFSTR("SkippedHeartbeat");
    if (a1 != 512)
      v4 = 0;
    if (a1 != 256)
      v3 = v4;
    v5 = CFSTR("Other");
    v6 = CFSTR("RapidPoundingOrFlutteringHeartbeat");
    if (a1 != 128)
      v6 = 0;
    if (a1 != 64)
      v5 = v6;
    if (a1 <= 255)
      return v5;
    else
      return v3;
  }
  else
  {
    v1 = a1 - 1;
    result = 0;
    switch(v1)
    {
      case 0:
        result = CFSTR("NoSymptoms");
        break;
      case 1:
        result = CFSTR("ChestTightnessOrPain");
        break;
      case 2:
      case 4:
      case 5:
      case 6:
        return result;
      case 3:
        result = CFSTR("Dizziness");
        break;
      case 7:
        result = CFSTR("Fatigue");
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1CC2AD2F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1CC2B4B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HDHRIrregularRhythmNotificationsV2LocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("2"), CFSTR("(01)00194252456774"), CFSTR("(01)00194252456781"));
}

id HDHRIrregularRhythmNotificationsV2PairedFeaturePropertiesSyncManager(void *a1)
{
  uint64_t v1;
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v1 = *MEMORY[0x1E0CB5048];
  v2 = (objc_class *)MEMORY[0x1E0D294C8];
  v3 = a1;
  v4 = [v2 alloc];
  objc_msgSend(MEMORY[0x1E0CB6538], "localAvailabilityForIrregularRhythmNotificationsV2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v1, v5, v3);

  v7 = objc_alloc(MEMORY[0x1E0D29538]);
  objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("2"), CFSTR("(01)00194252456774"), CFSTR("(01)00194252456781"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v1, v8, v6);

  return v9;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
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

void sub_1CC2B9D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2BAF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return objc_opt_class();
}

id HDHRBackgroundHeartRateContextPredicate(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "metadataManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CB7298];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E87FF080, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateWithMetadataKey:allowedValues:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HDHRAnalyticsCountOfSamples(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;

  v2 = a2;
  HDAnalyticsCountOfSamples();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      HDHRAnalyticsCountOfSamples_cold_1((uint64_t)v2, (uint64_t)v4, v6);

    v5 = &unk_1E87FF098;
  }

  return v5;
}

void sub_1CC2BE370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HDStringFromHeartRateWidgetDataManagerReloadReason(unint64_t a1)
{
  if (a1 < 3)
    return off_1E87F0200[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1CC2C2CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2C2E34(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _heartbeatSeriesDataForPulseTimes(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 16 * objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "doubleValue", (_QWORD)v9);
        HKHeartbeatSeriesAppendDatum();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v2;
}

void ___aFibHeartbeatSeriesData_block_invoke()
{
  uint64_t v0;
  void *v1;

  _heartbeatSeriesDataForPulseTimes(&unk_1E8800180);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_aFibHeartbeatSeriesData___aFibHeartbeatSeriesData;
  _aFibHeartbeatSeriesData___aFibHeartbeatSeriesData = v0;

}

void ___nonAFibHeartbeatSeriesData_block_invoke()
{
  uint64_t v0;
  void *v1;

  _heartbeatSeriesDataForPulseTimes(&unk_1E8800198);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_nonAFibHeartbeatSeriesData___nonAFibHeartbeatSeriesData;
  _nonAFibHeartbeatSeriesData___nonAFibHeartbeatSeriesData = v0;

}

void sub_1CC2C6500(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
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

void sub_1CC2C6A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_5_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;

  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, v4, 0xCu);
}

id OUTLINED_FUNCTION_8_1(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_10_0(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_11_0(id a1, float a2)
{
  id *v2;
  float *v3;

  *v3 = a2;
  *v2 = a1;
  return a1;
}

void sub_1CC2C8A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2CB5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

uint64_t _HDDropHeartCLogTables(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v5, "executeSQLStatements:error:", &unk_1E8800228, a4);

  return a4 ^ 1;
}

void sub_1CC2CC938(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CC2CCB2C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CC2CE4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1CC2CE680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CC2D1FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2D231C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2D2544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2D3584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2D3BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2D47D8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_4_3(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_6_2()
{
  id *v0;

  return objc_loadWeakRetained(v0);
}

void sub_1CC2D58AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 200), 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
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

void sub_1CC2D6374(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2D6C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  uint64_t v52;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v52 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2D711C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CC2D7500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 200), 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_5_3(uint64_t a1, void *a2)
{
  return a2;
}

id OUTLINED_FUNCTION_6_3(id a1, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return a1;
}

void OUTLINED_FUNCTION_8_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0x16u);
}

void sub_1CC2D7C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2D7EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HDMigrateHeartRateNotificationsUserDefaultsIfNecessary(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "integerForKey:", CFSTR("MigrationVersion"));
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = v3;
    objc_msgSend(v4, "numberWithInteger:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = &unk_1E87FF908;
    _os_log_impl(&dword_1CC29C000, v5, OS_LOG_TYPE_DEFAULT, "[Migration] Migrating if necessary from version %{public}@ to %{public}@", (uint8_t *)&v12, 0x16u);

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (!v2)
  {
    v8 = v1;
    if ((objc_msgSend(v8, "BOOLForKey:", *MEMORY[0x1E0CB76D8]) & 1) != 0
      || objc_msgSend(v8, "BOOLForKey:", *MEMORY[0x1E0CB76E8]))
    {
      HKHRSubmitNotificationsEnabledSignal();
    }
    objc_msgSend(v8, "setInteger:forKey:", 1, CFSTR("MigrationVersion"));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("MigrationVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "unionSet:", v9);
  }
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

void sub_1CC2DAD14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2DB2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 200), 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1CC2DC1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CC2DC8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 200), 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  _Unwind_Resume(a1);
}

void _PairedWatchDeviceSupportsCountryCode_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_9();
  v4 = OUTLINED_FUNCTION_7(v3);
  OUTLINED_FUNCTION_4(&dword_1CC29C000, v5, v6, "[%{public}@] Watch version is nil", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8();
}

void HDHRAnalyticsCountOfSamples_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "Could not get count of samples of type %{public}@ with error: %{public}@", (uint8_t *)&v3, 0x16u);
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

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1E0D27C80]();
}

uint64_t HDAddStateHandler()
{
  return MEMORY[0x1E0D291D8]();
}

uint64_t HDAnalyticsBucketedNumberOfStandAndIdleHours()
{
  return MEMORY[0x1E0D291E0]();
}

uint64_t HDAnalyticsCountOfSamples()
{
  return MEMORY[0x1E0D291E8]();
}

uint64_t HDDataEntityPredicateForDataUUID()
{
  return MEMORY[0x1E0D29240]();
}

uint64_t HDDataEntityPredicateForDataUUIDs()
{
  return MEMORY[0x1E0D29248]();
}

uint64_t HDDataEntityPredicateForRowID()
{
  return MEMORY[0x1E0D29250]();
}

uint64_t HDDataEntityPredicateForSourceEntity()
{
  return MEMORY[0x1E0D29258]();
}

uint64_t HDDemoData_timeFromDateComponents()
{
  return MEMORY[0x1E0D29268]();
}

uint64_t HDDispatchQueueName()
{
  return MEMORY[0x1E0D29270]();
}

uint64_t HDQueryServerSampleTypeObservationAssertionName()
{
  return MEMORY[0x1E0D29320]();
}

uint64_t HDSQLiteBindDateToProperty()
{
  return MEMORY[0x1E0D29640]();
}

uint64_t HDSQLiteBindDoubleToProperty()
{
  return MEMORY[0x1E0D29648]();
}

uint64_t HDSQLiteBindInt64ToProperty()
{
  return MEMORY[0x1E0D29660]();
}

uint64_t HDSQLiteBindStringToProperty()
{
  return MEMORY[0x1E0D29680]();
}

uint64_t HDSQLiteBindUUIDToProperty()
{
  return MEMORY[0x1E0D29698]();
}

uint64_t HDSQLiteColumnWithNameAsDate()
{
  return MEMORY[0x1E0D29728]();
}

uint64_t HDSQLiteColumnWithNameAsDouble()
{
  return MEMORY[0x1E0D29730]();
}

uint64_t HDSQLiteColumnWithNameAsInteger()
{
  return MEMORY[0x1E0D29740]();
}

uint64_t HDSQLiteColumnWithNameAsString()
{
  return MEMORY[0x1E0D29770]();
}

uint64_t HDSQLiteColumnWithNameAsUUID()
{
  return MEMORY[0x1E0D29780]();
}

uint64_t HDSampleEntityClassForDataType()
{
  return MEMORY[0x1E0D29328]();
}

uint64_t HDSampleEntityPredicateForDataType()
{
  return MEMORY[0x1E0D29330]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x1E0D29340]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x1E0D29350]();
}

uint64_t HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAge()
{
  return MEMORY[0x1E0CB46C0]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x1E0CB4748]();
}

uint64_t HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString()
{
  return MEMORY[0x1E0CB4768]();
}

uint64_t HKAtrialFibrillationDetectionSupportedCountries()
{
  return MEMORY[0x1E0CB47A8]();
}

uint64_t HKAtrialFibrillationDetectionSupportedStateForGeolocatedCountryCodeAndWatchOSVersion()
{
  return MEMORY[0x1E0CB47B0]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1E0CB4B08]();
}

uint64_t HKDataCollectionTypeToString()
{
  return MEMORY[0x1E0CB4B38]();
}

uint64_t HKDispatchQueueName()
{
  return MEMORY[0x1E0CB4CF0]();
}

uint64_t HKElectrocardiogramSupportedCountries()
{
  return MEMORY[0x1E0CB4D50]();
}

uint64_t HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion()
{
  return MEMORY[0x1E0CB4D58]();
}

uint64_t HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion()
{
  return MEMORY[0x1E0CB4D60]();
}

uint64_t HKFeatureAvailabilityOnboardingIneligibilityReasonsForRescindedStatus()
{
  return MEMORY[0x1E0CB4EF0]();
}

uint64_t HKFeatureUpdateVersionFromMajorVersionAndBuildVersion()
{
  return MEMORY[0x1E0CB50E0]();
}

uint64_t HKHRAFibBurdenAnalysisPercentageOverride()
{
  return MEMORY[0x1E0D2FA20]();
}

uint64_t HKHRAFibBurdenAnalyticsPropertyValueForVersion()
{
  return MEMORY[0x1E0D2FA40]();
}

uint64_t HKHRAFibBurdenControlClientInterface()
{
  return MEMORY[0x1E0D2FA48]();
}

uint64_t HKHRAFibBurdenControlServerInterface()
{
  return MEMORY[0x1E0D2FA58]();
}

uint64_t HKHRAFibBurdenDayOfWeekHistogramOverride()
{
  return MEMORY[0x1E0D2FA60]();
}

uint64_t HKHRAFibBurdenDetermineIsFocusModeOn()
{
  return MEMORY[0x1E0D2FA70]();
}

uint64_t HKHRAFibBurdenLocalFeatureAttributes()
{
  return MEMORY[0x1E0D2FA90]();
}

uint64_t HKHRAFibBurdenLogForCategory()
{
  return MEMORY[0x1E0D2FA98]();
}

uint64_t HKHRAFibBurdenNotificationsEnabledWithFeatureStatus()
{
  return MEMORY[0x1E0D2FAA0]();
}

uint64_t HKHRAFibBurdenPreviousWeekDayIndexRange()
{
  return MEMORY[0x1E0D2FAA8]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponents()
{
  return MEMORY[0x1E0D2FAB8]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponentsWithDefaults()
{
  return MEMORY[0x1E0D2FAC0]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay()
{
  return MEMORY[0x1E0D2FAC8]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped()
{
  return MEMORY[0x1E0D2FAD0]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire()
{
  return MEMORY[0x1E0D2FAD8]();
}

uint64_t HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride()
{
  return MEMORY[0x1E0D2FAE0]();
}

uint64_t HKHRAFibBurdenTimeOfDayHistogramOverride()
{
  return MEMORY[0x1E0D2FAE8]();
}

uint64_t HKHRAnalyticsAgeBinFromAgeInYears()
{
  return MEMORY[0x1E0D2FAF0]();
}

uint64_t HKHRCardioFitnessAllowedCountrySet()
{
  return MEMORY[0x1E0D2FAF8]();
}

uint64_t HKHRCardioFitnessFeatureStatusManagerClientInterface()
{
  return MEMORY[0x1E0D2FB08]();
}

uint64_t HKHRCardioFitnessFeatureStatusManagerServerInterface()
{
  return MEMORY[0x1E0D2FB10]();
}

uint64_t HKHRCardioFitnessLocalFeatureAttributes()
{
  return MEMORY[0x1E0D2FB18]();
}

uint64_t HKHRCardioFitnessStoreClientInterface()
{
  return MEMORY[0x1E0D2FB20]();
}

uint64_t HKHRCardioFitnessStoreServerInterface()
{
  return MEMORY[0x1E0D2FB28]();
}

uint64_t HKHRIrregularRhythmNotificationsRequirementsWithFeatureIdentifier()
{
  return MEMORY[0x1E0D2FB38]();
}

uint64_t HKHRSubmitNotificationsEnabledSignal()
{
  return MEMORY[0x1E0D2FB40]();
}

uint64_t HKHeartbeatSeriesAppendDatum()
{
  return MEMORY[0x1E0CB51A8]();
}

uint64_t HKHeartbeatSeriesFeatureStatusManagerClientInterface()
{
  return MEMORY[0x1E0D2FB58]();
}

uint64_t HKHeartbeatSeriesFeatureStatusManagerServerInterface()
{
  return MEMORY[0x1E0D2FB60]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1E0CB51B8]();
}

uint64_t HKIsHeartRateEnabled()
{
  return MEMORY[0x1E0CB5228]();
}

uint64_t HKLogAnalytics()
{
  return MEMORY[0x1E0CB5270]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x1E0CB52F8]();
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

uint64_t HKUDIDeviceIdentifierFromDeviceIdentifierAndBatchNumber()
{
  return MEMORY[0x1E0CB6068]();
}

uint64_t NRRawVersionFromString()
{
  return MEMORY[0x1E0D51808]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x1E0CB6210]();
}

uint64_t NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState()
{
  return MEMORY[0x1E0CB6218]();
}

uint64_t NSStringFromHKFeatureAvailabilityRescindedStatus()
{
  return MEMORY[0x1E0CB6220]();
}

uint64_t NSStringFromHKHRAnalyticsAgeBin()
{
  return MEMORY[0x1E0D2FB70]();
}

uint64_t NSStringFromHKHeartbeatSeriesFeature()
{
  return MEMORY[0x1E0D2FB78]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _HDSQLiteValueForDate()
{
  return MEMORY[0x1E0D29938]();
}

uint64_t _HKCreateURLForSampleType()
{
  return MEMORY[0x1E0CB7140]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1E0CB7190]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1E0CB71A0]();
}

uint64_t _HKLogSignpostIDGenerate()
{
  return MEMORY[0x1E0CB71B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

