@implementation HDFeatureAvailabilityManager(HDMenstrualCycles)

+ (id)hdmc_menstrualCyclesAvailabilityManagerWithProfile:()HDMenstrualCycles
{
  uint64_t v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v3 = *MEMORY[0x24BDD2E28];
  v4 = (objc_class *)MEMORY[0x24BE40AE0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x24BDD3AB0], "emptyCountrySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v3, v7, v8);

  v10 = objc_alloc(MEMORY[0x24BE40B60]);
  HDMCLocalFeatureAttributes();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v3, v11, v9);

  objc_msgSend(v12, "synchronizeLocalProperties");
  v13 = objc_alloc(MEMORY[0x24BE40AB8]);
  objc_msgSend(MEMORY[0x24BDD3BC8], "noRequirements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40BA8], "uncheckedAvailability");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BE40AC0]);
  v17 = (void *)objc_msgSend(v13, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v5, v3, v14, 1, 0, v12, v15, v16, *MEMORY[0x24BDD3030]);

  return v17;
}

+ (id)hdmc_heartRateInputAvailabilityManagerWithProfile:()HDMenstrualCycles
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[5];
  uint64_t v59;
  void *v60;
  _QWORD v61[2];
  void *v62;
  _QWORD v63[2];
  _QWORD v64[4];

  v64[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (id)*MEMORY[0x24BDD2E38];
  objc_msgSend(MEMORY[0x24BDD3AB0], "localAvailabilityForMenstrualCyclesHeartRateInput");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE40AE0]);
  objc_msgSend(v3, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v5;
  v8 = objc_msgSend(v6, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v4, v5, v7);

  v9 = objc_alloc(MEMORY[0x24BE40B60]);
  HDMCHeartRateInputLocalFeatureAttributes();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)v8;
  v11 = (void *)objc_msgSend(v9, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v4, v10, v8);

  v49 = v11;
  objc_msgSend(v11, "synchronizeLocalProperties");
  v12 = objc_alloc(MEMORY[0x24BE40B50]);
  objc_msgSend(v3, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v12, "initWithDaemon:featureIdentifier:", v13, v4);

  v63[0] = *MEMORY[0x24BDD2C78];
  objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v15;
  v63[1] = *MEMORY[0x24BDD2C70];
  objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v16;
  objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v4, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v3;
  objc_msgSend(v3, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "behavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v21, "isAppleWatch");

  v22 = (_QWORD *)MEMORY[0x24BDD3030];
  if ((_DWORD)v16)
  {
    v23 = v49;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40CE8]), "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v49, v3, 0, *MEMORY[0x24BDD3030]);
    v59 = *MEMORY[0x24BDD2CA8];
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v47;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v46;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v4, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v45;
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v44;
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v4, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v48;
    objc_msgSend(v48, "hk_dictionaryByAddingEntriesFromDictionary:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v22;
  }
  else
  {
    v30 = objc_alloc(MEMORY[0x24BE40AE0]);
    objc_msgSend(v3, "daemon");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v30, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v4, v52, v31);

    v56[0] = *MEMORY[0x24BDD2C28];
    objc_msgSend(MEMORY[0x24BDD3BD0], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v4);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v47;
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", *MEMORY[0x24BDD2E28]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v45;
    v56[1] = *MEMORY[0x24BDD2C50];
    objc_msgSend(MEMORY[0x24BDD3BD0], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v44;
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsNotPresentForFeatureWithIdentifier:", v4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v25;
    v56[2] = *MEMORY[0x24BDD2CA8];
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v26;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v4);
    v41 = objc_claimAutoreleasedReturnValue();
    v53[1] = v41;
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v32;
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v4, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
    v35 = v19;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "hk_dictionaryByAddingEntriesFromDictionary:", v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v35;
    v29 = (_QWORD *)MEMORY[0x24BDD3030];

    v27 = (void *)v41;
    v24 = (void *)v42;
    v23 = v49;
  }

  v37 = objc_alloc(MEMORY[0x24BE40AB8]);
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BC8]), "initWithRequirementsByContext:", v28);
  v39 = (void *)objc_msgSend(v37, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v19, v4, v38, 1, 0, v23, v24, v50, *v29);

  return v39;
}

+ (id)hdmc_wristTemperatureInputAvailabilityManagerWithProfile:()HDMenstrualCycles
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  uint64_t v69;
  _QWORD v70[3];
  _QWORD v71[2];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[5];
  uint64_t v75;
  void *v76;
  void *v77;
  _QWORD v78[3];
  _QWORD v79[2];
  void *v80;
  _QWORD v81[4];
  _QWORD v82[6];

  v82[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (id)*MEMORY[0x24BDD2E40];
  v5 = HKLocalDeviceHardwareSupportsWristTemperatureMeasurements();
  objc_msgSend(MEMORY[0x24BDD3AB0], "localAvailabilityForMenstrualCyclesWristTemperatureInput");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BE40AE0]);
  v67 = v3;
  objc_msgSend(v3, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)v6;
  v9 = objc_msgSend(v7, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v4, v6, v8);

  v10 = objc_alloc(MEMORY[0x24BE40B60]);
  HDMCWristTemperatureInputLocalFeatureAttributes();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)v9;
  v12 = (void *)objc_msgSend(v10, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v4, v11, v9);

  v63 = v12;
  objc_msgSend(v12, "synchronizeLocalProperties");
  v13 = objc_alloc(MEMORY[0x24BE40B50]);
  objc_msgSend(v3, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v13, "initWithDaemon:featureIdentifier:", v14, v4);

  v81[0] = *MEMORY[0x24BDD2C78];
  objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v4);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v60;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v58;
  v81[1] = *MEMORY[0x24BDD2C70];
  objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v56;
  objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceAndPhoneForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v4, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v16;
  v81[2] = *MEMORY[0x24BDD2C90];
  objc_msgSend(MEMORY[0x24BDD3BD0], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v17;
  v18 = *MEMORY[0x24BDD2F80];
  objc_msgSend(MEMORY[0x24BDD3BD0], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x24BDD2F80]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v19;
  v54 = v5;
  objc_msgSend(MEMORY[0x24BDD3BD0], "capabilityIsSupportedOnAnyWatch:supportedOnLocalDevice:", 0, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v21;
  v81[3] = *MEMORY[0x24BDD2C88];
  v52 = v18;
  objc_msgSend(MEMORY[0x24BDD3BD0], "defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:isAgeGatedUserDefaultsKey:", v4, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v67;
  objc_msgSend(v67, "daemon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "behavior");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v26, "isAppleWatch");

  v27 = (_QWORD *)MEMORY[0x24BDD3030];
  if ((_DWORD)v23)
  {
    v28 = v63;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40CE8]), "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v63, v67, 0, *MEMORY[0x24BDD3030]);
    v75 = *MEMORY[0x24BDD2CA8];
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v30;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v4);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v61;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v4, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v74[2] = v59;
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v4);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v74[3] = v57;
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v4, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v74[4] = v55;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v53;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v62;
    objc_msgSend(v62, "hk_dictionaryByAddingEntriesFromDictionary:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
  }
  else
  {
    v49 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("CBC78224-8F5E-4D43-8666-69ADBE2A6277"));
    v35 = objc_alloc(MEMORY[0x24BE40AE0]);
    objc_msgSend(v67, "daemon");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v35, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v4, v66, v36);

    v72[0] = *MEMORY[0x24BDD2C28];
    objc_msgSend(MEMORY[0x24BDD3BD0], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v4);
    v51 = objc_claimAutoreleasedReturnValue();
    v71[0] = v51;
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", *MEMORY[0x24BDD2E28]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v61;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v59;
    v72[1] = *MEMORY[0x24BDD2C38];
    objc_msgSend(MEMORY[0x24BDD3BD0], "defaultHelpTileRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:isAgeGatedUserDefaultsKey:", v4, v52);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v57;
    objc_msgSend(MEMORY[0x24BDD3BD0], "capabilityIsSupportedOnAnyWatch:supportedOnLocalDevice:", v49, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v55;
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v4, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v70[2] = v53;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v31;
    v72[2] = *MEMORY[0x24BDD2C50];
    objc_msgSend(MEMORY[0x24BDD3BD0], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v4);
    v48 = objc_claimAutoreleasedReturnValue();
    v69 = v48;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v47;
    v72[3] = *MEMORY[0x24BDD2CA8];
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v37;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v38;
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v68[2] = v39;
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v4, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v68[3] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v68, 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = v41;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "hk_dictionaryByAddingEntriesFromDictionary:", v42);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)v50;
    v34 = (void *)v49;

    v27 = (_QWORD *)MEMORY[0x24BDD3030];
    v24 = v67;

    v30 = (void *)v51;
    v32 = (void *)v48;
    v28 = v63;
  }

  v43 = objc_alloc(MEMORY[0x24BE40AB8]);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3BC8]), "initWithRequirementsByContext:", v33);
  v45 = (void *)objc_msgSend(v43, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:pairedFeatureAttributesProvider:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v24, v4, v44, 1, v34, v28, v29, v64, *v27);

  return v45;
}

+ (id)hdmc_deviationsAvailabilityManagerWithProfile:()HDMenstrualCycles
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  void *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[4];
  _QWORD v39[6];

  v39[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = *MEMORY[0x24BDD2E30];
    v28 = objc_alloc(MEMORY[0x24BDD3BC8]);
    v38[0] = *MEMORY[0x24BDD2C28];
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", *MEMORY[0x24BDD2E28]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v33;
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v32;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v30;
    v38[1] = *MEMORY[0x24BDD2CA8];
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v27;
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v26;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v10;
    v38[2] = *MEMORY[0x24BDD2C78];
    objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v12;
    v38[3] = *MEMORY[0x24BDD2C50];
    objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v13;
    objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "initWithRequirementsByContext:", v16);

    objc_msgSend(MEMORY[0x24BDD3AB0], "localAvailabilityForMenstrualCyclesDeviationDetection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BE40AE0]);
    objc_msgSend(v3, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v8, v17, v19);

    v21 = objc_alloc(MEMORY[0x24BE40B50]);
    objc_msgSend(v3, "daemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithDaemon:featureIdentifier:", v22, v8);

    v24 = objc_alloc(MEMORY[0x24BE40AB8]);
    v7 = (void *)objc_msgSend(v24, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v3, v8, v29, 1, 0, v20, v23, *MEMORY[0x24BDD3030]);

  }
  return v7;
}

@end
