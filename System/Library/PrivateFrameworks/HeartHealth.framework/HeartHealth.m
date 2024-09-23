uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t HKHRCardioFitnessFeatureStatusManagerServerInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0138168);
}

uint64_t HKHRCardioFitnessFeatureStatusManagerClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F01316C8);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1D7782D7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t HKHRCardioFitnessShouldSkipHardwareCheck()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall");
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("HKHRCardioFitnessShouldSkipHardwareCheck"));

    return v2;
  }
  return result;
}

id HKHRIrregularRhythmNotificationsRequirementsWithFeatureIdentifier(void *a1)
{
  objc_class *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
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
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[8];
  _QWORD v72[6];
  _QWORD v73[12];
  _QWORD v74[8];
  _QWORD v75[6];
  _QWORD v76[8];
  _QWORD v77[11];
  _QWORD v78[13];

  v78[11] = *MEMORY[0x1E0C80C00];
  v1 = (objc_class *)MEMORY[0x1E0CB66F0];
  v2 = a1;
  v50 = [v1 alloc];
  v77[0] = *MEMORY[0x1E0CB4E70];
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v70;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v69;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v68;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v76[3] = v67;
  objc_msgSend(MEMORY[0x1E0CB66F8], "seedIsNotExpiredForFeatureWithIdentifier:", v2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v76[4] = v66;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v76[5] = v65;
  v3 = *MEMORY[0x1E0CB51F8];
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v76[6] = v64;
  v4 = *MEMORY[0x1E0CB4FF8];
  objc_msgSend(MEMORY[0x1E0CB66F8], "mutuallyExclusiveFeatureIsOffWithIdentifier:", *MEMORY[0x1E0CB4FF8]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v76[7] = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v62;
  v77[1] = *MEMORY[0x1E0CB4E80];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v61;
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v60;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v59;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v58;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v75[4] = v57;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", v3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v75[5] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v55;
  v77[2] = *MEMORY[0x1E0CB4E78];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v54;
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v53;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v52;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v49;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v74[4] = v48;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", v3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v74[5] = v47;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v74[6] = v46;
  objc_msgSend(MEMORY[0x1E0CB66F8], "mutuallyExclusiveFeatureIsOffWithIdentifier:", v4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v74[7] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v44;
  v77[3] = *MEMORY[0x1E0CB4E88];
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v43;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v42;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v41;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v40;
  objc_msgSend(MEMORY[0x1E0CB66F8], "seedIsNotExpiredForFeatureWithIdentifier:", v2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = v39;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v73[5] = v38;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v73[6] = v37;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v2, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73[7] = v36;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", v3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v73[8] = v35;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73[9] = v34;
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v73[10] = v33;
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsNotPresentForMutuallyExclusiveFeatureWithIdentifier:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v73[11] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v31;
  v77[4] = *MEMORY[0x1E0CB4EA8];
  objc_msgSend(MEMORY[0x1E0CB66F8], "healthAppIsNotHidden");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v30;
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v29;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v28;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v27;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v26;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v24;
  v77[5] = *MEMORY[0x1E0CB4EA0];
  objc_msgSend(MEMORY[0x1E0CB66F8], "seedIsNotExpiredForFeatureWithIdentifier:", v2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v23;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v22;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v21;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v20;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v2, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v19;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v18;
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v17;
  objc_msgSend(MEMORY[0x1E0CB66F8], "mutuallyExclusiveFeatureIsOffWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v78[5] = v6;
  v77[6] = *MEMORY[0x1E0CB4EB8];
  _TipsAppVisibilityRequirementsForFeatureIdentifier(v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v78[6] = v7;
  v77[7] = *MEMORY[0x1E0CB4EB0];
  _TipsAppVisibilityRequirementsForFeatureIdentifier(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsNotPresentForFeatureWithIdentifier:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[7] = v10;
  v77[8] = *MEMORY[0x1E0CB4E60];
  _UsageRequirementsForFeatureIdentifier(v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_filter:", &__block_literal_global_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v78[8] = v12;
  v77[9] = CFSTR("UsagePendingOnboarding");
  _UsageRequirementsPendingOnboardingForFeatureIdentifier(v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v78[9] = v13;
  v77[10] = *MEMORY[0x1E0CB4ED0];
  _UsageRequirementsForFeatureIdentifier(v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v78[10] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v50, "initWithRequirementsByContext:", v15);

  return v51;
}

id _UsageRequirementsForFeatureIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  _UsageRequirementsPendingOnboardingForFeatureIdentifier(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id _UsageRequirementsPendingOnboardingForFeatureIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[14];

  v18[13] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB66F8];
  v2 = a1;
  objc_msgSend(v1, "healthAppIsNotHidden");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v16;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB66F8], "watchAppIsInstalledForBundleIdentifier:", CFSTR("com.apple.HeartRate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v3;
  objc_msgSend(MEMORY[0x1E0CB66F8], "seedIsNotExpiredForFeatureWithIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v4;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18[8] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "heartRateIsEnabledInPrivacy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v9;
  objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v10;
  objc_msgSend(MEMORY[0x1E0CB66F8], "mutuallyExclusiveFeatureIsOffWithIdentifier:", *MEMORY[0x1E0CB4FF8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[12] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id _TipsAppVisibilityRequirementsForFeatureIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB66F8];
  v2 = a1;
  objc_msgSend(v1, "profileIsNotFamilySetupPairingProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB66F8], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB66F8], "seedIsNotExpiredForFeatureWithIdentifier:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v2, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x1E0CB51F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1D7783F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t HKHRAFibBurdenControlClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0132E40);
}

id HKHRAFibBurdenControlServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0137E00);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_remote_injectBurdenValues_completion_, 0, 0);
  return v0;
}

uint64_t HKHRCardioFitnessStoreClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F012F1F0);
}

uint64_t HKHRCardioFitnessStoreServerInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0137ED0);
}

uint64_t HKHRBloodPressureDetailRoomBaseLink()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "_hk_urlForBloodPressureType");
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id HKHRHeartHealthBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)HKHRHeartHealthBundle___ClassBundle;
  if (!HKHRHeartHealthBundle___ClassBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)HKHRHeartHealthBundle___ClassBundle;
    HKHRHeartHealthBundle___ClassBundle = v1;

    v0 = (void *)HKHRHeartHealthBundle___ClassBundle;
  }
  return v0;
}

id HKHeartRateLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E9C26A20, CFSTR("HeartRateSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id HKHRAFibHistoryLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  HKHRHeartHealthBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E9C26A20, CFSTR("HeartRateSettings-AFibBurden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t HKHeartbeatSeriesFeatureStatusManagerClientInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0133630);
}

uint64_t HKHeartbeatSeriesFeatureStatusManagerServerInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0137FC0);
}

uint64_t HKHRAFibBurdenLocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:watchDeviceIdentifier:phoneDeviceIdentifier:", CFSTR("1"), CFSTR("(01)00194252456804"), CFSTR("(01)00194252456798"));
}

uint64_t HKHRAFibBurdenOnboardingDeepLink()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-apple-health://Heart.healthplugin/AFibBurdenOnboarding"));
}

uint64_t HKHRAFibBurdenDetailRoomBaseLink()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-apple-health://Heart.healthplugin/AFibBurdenDetailRoom"));
}

double HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay()
{
  double v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = 1800.0;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v0 = (double)objc_msgSend(v3, "integerForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay"));

    }
  }
  return v0;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  if (!objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
    return 4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    return 4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire"));

  return v3;
}

id HKHRAFibBurdenAnalysisPercentageOverride()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "objectForKey:", CFSTR("HKHRAFibBurdenAnalysisPercentageOverride")),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        v1,
        v0,
        v1))
  {
    v2 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", CFSTR("HKHRAFibBurdenAnalysisPercentageOverride")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "objectForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride")),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        v1,
        v0,
        v1))
  {
    v2 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id _ParseArrayOfValuesFromStringWithExpectedCount(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  HKHRAFibBurdenAnalysisResult *v18;
  HKHRAFibBurdenAnalysisResult *v19;
  HKHRAFibBurdenAnalysisResult *v20;
  id v21;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("["))
    && objc_msgSend(v3, "hasSuffix:", CFSTR("]")))
  {
    v23 = v3;
    objc_msgSend(v3, "substringWithRange:", 1, objc_msgSend(v3, "length") - 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(obj);
          objc_msgSend(v6, "numberFromString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            v14 = objc_msgSend(v12, "integerValue");
            v15 = v14 < 3;
            v16 = 100;
            if (v14 < 100)
              v16 = v14;
            if (v16 <= 2)
              v17 = 2;
            else
              v17 = v16;
            v18 = [HKHRAFibBurdenAnalysisResult alloc];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v17 / 100.0);
            v19 = (HKHRAFibBurdenAnalysisResult *)objc_claimAutoreleasedReturnValue();
            v20 = -[HKHRAFibBurdenAnalysisResult initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:](v18, "initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:", v19, v15, 0);
            objc_msgSend(v7, "addObject:", v20);

          }
          else
          {
            v19 = -[HKHRAFibBurdenAnalysisResult initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:]([HKHRAFibBurdenAnalysisResult alloc], "initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:", 0, 0, 2);
            objc_msgSend(v7, "addObject:", v19);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v7, "count") == a2)
      v21 = v7;
    else
      v21 = 0;

    v3 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id _RetrieveAndParseArrayOfResultsForKeyWithExpectedCount(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKey:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _ParseArrayOfValuesFromStringWithExpectedCount(v7, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

HKHRAFibBurdenDayOfWeekHistogram *HKHRAFibBurdenDayOfWeekHistogramOverride()
{
  void *v0;
  HKHRAFibBurdenDayOfWeekHistogram *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKHRAFibBurdenDayOfWeekHistogram *v9;

  _RetrieveAndParseArrayOfResultsForKeyWithExpectedCount(CFSTR("HKHRAFibBurdenDayOfWeekHistogramOverride"), 7);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = [HKHRAFibBurdenDayOfWeekHistogram alloc];
    objc_msgSend(v0, "objectAtIndexedSubscript:", 6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKHRAFibBurdenDayOfWeekHistogram initWithSundayBurden:mondayBurden:tuesdayBurden:wednesdayBurden:thursdayBurden:fridayBurden:saturdayBurden:](v1, "initWithSundayBurden:mondayBurden:tuesdayBurden:wednesdayBurden:thursdayBurden:fridayBurden:saturdayBurden:", v2, v3, v4, v5, v6, v7, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

HKHRAFibBurdenTimeOfDayHistogram *HKHRAFibBurdenTimeOfDayHistogramOverride()
{
  void *v0;
  HKHRAFibBurdenTimeOfDayHistogram *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKHRAFibBurdenTimeOfDayHistogram *v8;

  _RetrieveAndParseArrayOfResultsForKeyWithExpectedCount(CFSTR("HKHRAFibBurdenTimeOfDayHistogramOverride"), 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = [HKHRAFibBurdenTimeOfDayHistogram alloc];
    objc_msgSend(v0, "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectAtIndexedSubscript:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKHRAFibBurdenTimeOfDayHistogram initWithMidnightToFourAMBurden:fourAMtoEightAMBurden:eightAMToNoonBurden:noonToFourPMBurden:fourPMToEightPMBurden:eightPMToMidnightBurden:](v1, "initWithMidnightToFourAMBurden:fourAMtoEightAMBurden:eightAMToNoonBurden:noonToFourPMBurden:fourPMToEightPMBurden:eightPMToMidnightBurden:", v2, v3, v4, v5, v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id HKHRAFibBurdenDefaultsOverrideKeys()
{
  _QWORD v1[11];

  v1[10] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingWeekday");
  v1[1] = CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingHour");
  v1[2] = CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingMinute");
  v1[3] = CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingSecond");
  v1[4] = CFSTR("HKHRAFibBurdenSevenDayAnalysisMaximumXPCDelay");
  v1[5] = CFSTR("HKHRAFibBurdenSevenDayAnalysisNotificationEndWeekdayToFire");
  v1[6] = CFSTR("HKHRAFibBurdenAnalysisPercentageOverride");
  v1[7] = CFSTR("HKHRAFibBurdenSevenDayAnalysisUnavailabilityReasonOverride");
  v1[8] = CFSTR("HKHRAFibBurdenDayOfWeekHistogramOverride");
  v1[9] = CFSTR("HKHRAFibBurdenTimeOfDayHistogramOverride");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

const __CFString *NSStringFromHKHRAnalyticsAgeBin(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E9C25E98[a1 - 1];
}

uint64_t HKHRAnalyticsAgeBinFromAgeInYears(void *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend(a1, "integerValue");
  v3 = 1;
  v4 = 2;
  v5 = 3;
  if (v2 >= 0x41)
    v5 = 4;
  if (v2 >= 0x37)
    v4 = v5;
  if (v2 >= 0x28)
    v3 = v4;
  if ((uint64_t)v2 < 22)
    v3 = 0;
  if (a1)
    return v3;
  else
    return 0;
}

id HKHRPrettyPrintedAFibBurdenSevenDayAnalysisBreadcrumbs(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("======== Seven Day Analysis Steps ========\n"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CB0]), "initWithColumnTitles:", 0);
  v5 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  v47[0] = CFSTR("Alarm Fired");
  objc_msgSend(v2, "alarmFiredDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v2, "alarmFiredDate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v1);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("(null)");
  }
  v47[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v9);

  if (v7)
  {

  }
  v46[0] = CFSTR("XPC Activity Fired");
  objc_msgSend(v2, "xpcActivityFiredDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v2, "xpcActivityFiredDate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v1);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("(null)");
  }
  v46[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v12);

  if (v10)
  {

  }
  v45[0] = CFSTR("Maintenance Operation Run");
  objc_msgSend(v2, "maintenanceOperationRunDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v2, "maintenanceOperationRunDate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v1);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("(null)");
  }
  v45[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v15);

  if (v13)
  {

  }
  v44[0] = CFSTR("Analysis Started");
  objc_msgSend(v2, "analysisStartedDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v2, "analysisStartedDate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v1);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("(null)");
  }
  v44[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v18);

  if (v16)
  {

  }
  v43[0] = CFSTR("Tachograms Classified");
  objc_msgSend(v2, "tachogramsClassifiedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v2, "tachogramsClassifiedDate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v1);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("(null)");
  }
  v43[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v21);

  if (v19)
  {

  }
  v42[0] = CFSTR("Analysis Ended");
  objc_msgSend(v2, "analysisEndedDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v2, "analysisEndedDate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v1);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("(null)");
  }
  v42[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v24);

  if (v22)
  {

  }
  v41[0] = CFSTR("Analysis Retry Later Requested");
  objc_msgSend(v2, "analysisRetryLaterRequestedDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v2, "analysisRetryLaterRequestedDate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v1);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = CFSTR("(null)");
  }
  v41[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendRow:", v27);

  if (v25)
  {

  }
  objc_msgSend(v4, "formattedTable");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v28);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n======== Seven Day Analysis Results ========\n"));
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CB0]), "initWithColumnTitles:", 0);
  v40[0] = CFSTR("Last Analysis Result Date");
  objc_msgSend(v2, "lastAnalysisResultDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v2, "lastAnalysisResultDate");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v26);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = CFSTR("(null)");
  }
  v40[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendRow:", v32);

  if (v30)
  {

  }
  objc_msgSend(v2, "lastAnalysisResultContext", CFSTR("Last Analysis Result Context"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(v2, "lastAnalysisResultContext");
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = CFSTR("(null)");
  }
  v39[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendRow:", v35);

  if (v33)
  objc_msgSend(v29, "formattedTable");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v36);

  v37 = (void *)objc_msgSend(v3, "copy");
  return v37;
}

uint64_t HKHRAFibBurdenPreviousWeekDayIndexRange(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = a1;
  v5 = objc_msgSend(v4, "hk_dayIndexWithCalendar:", v3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v6, "setWeekday:", 2);
  objc_msgSend(v3, "nextDateAfterDate:matchingComponents:options:", v4, v6, 260);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "hk_dayIndexWithCalendar:", v3);
  if (v8 + 7 <= v5)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v3, "nextDateAfterDate:matchingComponents:options:", v7, v6, 260);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v3);
    v7 = v9;
  }

  return v10;
}

uint64_t HKHRAFibBurdenNotificationsEnabledWithFeatureStatus(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = a1;
  objc_msgSend(v1, "onboardingRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "onboardingRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HKHRAFibBurdenNotificationsEnabledWithFeatureSettings(v5);

  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      HKHRAFibBurdenNotificationsEnabledWithFeatureStatus_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

    v6 = 1;
  }

  return v6;
}

uint64_t HKHRAFibBurdenNotificationsEnabledWithFeatureSettings(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "numberForKey:", CFSTR("WeeklyNotificationEnabled"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingWeekday()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingWeekdayWithDefaults(v0);

  return v1;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingWeekdayWithDefaults(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
    && (objc_msgSend(v1, "objectForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingWeekday")),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    v3 = objc_msgSend(v1, "integerForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingWeekday"));
  }
  else
  {
    v3 = 2;
  }

  return v3;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingHour()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingHourWithDefaults(v0);

  return v1;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingHourWithDefaults(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall")
    && (objc_msgSend(v1, "objectForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingHour")),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    v3 = objc_msgSend(v1, "integerForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingHour"));
  }
  else
  {
    v3 = 8;
  }

  return v3;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingMinute()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingMinuteWithDefaults(v0);

  return v1;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingMinuteWithDefaults(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingMinute"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_msgSend(v1, "integerForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingMinute"));
  }
  else
  {
    v3 = arc4random_uniform(0x3Cu);
    objc_msgSend(v1, "setInteger:forKey:", v3, CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingMinute"));
  }

  return v3;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingSecond()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingSecondWithDefaults(v0);

  return v1;
}

uint64_t HKHRAFibBurdenSevenDayAnalysisDetermineStartingSecondWithDefaults(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingSecond"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = objc_msgSend(v1, "integerForKey:", CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingSecond"));
  }
  else
  {
    v3 = arc4random_uniform(0x3Cu);
    objc_msgSend(v1, "setInteger:forKey:", v3, CFSTR("HKHRAFibBurdenSevenDayAnalysisStartingSecond"));
  }

  return v3;
}

id HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponents()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponentsWithDefaults(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id HKHRAFibBurdenSevenDayAnalysisDetermineAlarmDateComponentsWithDefaults(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  v1 = (objc_class *)MEMORY[0x1E0C99D78];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "setWeekday:", HKHRAFibBurdenSevenDayAnalysisDetermineStartingWeekdayWithDefaults(v2));
  objc_msgSend(v3, "setHour:", HKHRAFibBurdenSevenDayAnalysisDetermineStartingHourWithDefaults(v2));
  objc_msgSend(v3, "setMinute:", HKHRAFibBurdenSevenDayAnalysisDetermineStartingMinuteWithDefaults(v2));
  v4 = HKHRAFibBurdenSevenDayAnalysisDetermineStartingSecondWithDefaults(v2);

  objc_msgSend(v3, "setSecond:", v4);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCalendar:", v5);

  return v3;
}

id HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  HKHRAFibBurdenLocalFeatureAttributes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v21[0] = *MEMORY[0x1E0CB7320];
  objc_msgSend(v4, "updateVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  v21[1] = *MEMORY[0x1E0CB5478];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "featureVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithDictionary:", v10);

  if (v3)
  {
    objc_msgSend(v3, "name");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB55E0]);
  }
  else
  {
    _HKInitializeLogging();
    HKHRAFibBurdenLogForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  if (a2)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CB5598]);

  return v11;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1D778BE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D778BFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D778C21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D778C5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void HKHRSubmitNotificationsEnabledSignal()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  BiomeLibrary();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "Discoverability");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "Signals");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01FF0]), "initWithContentIdentifier:context:osBuild:userInfo:", CFSTR("com.apple.health.HeartRate.notifications.enabled"), 0, 0, 0);
  objc_msgSend(v2, "sendEvent:", v3);

}

__CFString *HKHRAFibBurdenAnalyticsPropertyValueForVersion(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    v1 = CFSTR("1.0");
  else
    v1 = (__CFString *)(id)*MEMORY[0x1E0CB4750];
  return v1;
}

id HKHRAFibBurdenDetermineIsFocusModeOn()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0D027B8], "userFocusComputedMode");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "publisherFromStartTime:", 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "last");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke;
  v7[3] = &unk_1E9C26258;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __HKHRAFibBurdenDetermineIsFocusModeOn_block_invoke_192;
  v6[3] = &unk_1E9C26280;
  v6[4] = &v8;
  v3 = (id)objc_msgSend(v2, "sinkWithCompletion:receiveInput:", v7, v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void sub_1D778D078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *HKHRAFibBurdenLogCategoryForCategory(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return "default";
  else
    return off_1E9C262E8[a1 - 1];
}

id HKHRAFibBurdenLogForCategory(uint64_t a1)
{
  void *v2;
  char v3;
  id *v4;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showSensitiveLogItems");

  if ((v3 & 1) != 0)
  {
    v4 = (id *)MEMORY[0x1E0CB52E8];
  }
  else
  {
    if (HKHRAFibBurdenLogForCategory_onceToken != -1)
      dispatch_once(&HKHRAFibBurdenLogForCategory_onceToken, &__block_literal_global_3);
    v4 = (id *)((char *)&HKHRAFibBurdenLogForCategory_logObjects + 8 * a1);
  }
  return *v4;
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

void sub_1D7790B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D7791C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D7792564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_7(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x2Au);
}

__CFString *NSStringFromHKHeartbeatSeriesFeature(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if ((unint64_t)(a1 - 1) >= 4)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("HKHeartbeatSeriesFeature: %@"), v3);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = off_1E9C267A8[a1 - 1];
  }
  return v1;
}

void sub_1D77937A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D7793DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_4(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

id OUTLINED_FUNCTION_3_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

uint64_t _HKHRIsIrregularRhythmNotificationsRowHiddenInBridgeWithFeatureStatus(void *a1)
{
  id v1;
  int v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "isOnboardingRecordPresent");
  v3 = (_QWORD *)MEMORY[0x1E0CB4EA8];
  if (!v2)
    v3 = (_QWORD *)MEMORY[0x1E0CB4E80];
  objc_msgSend(v1, "objectForKeyedSubscript:", *v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "areAllRequirementsSatisfied") ^ 1;
  return v5;
}

uint64_t _HKHRIsUserInteractionEnabledForIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus(void *a1)
{
  id v1;
  int v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "isOnboardingRecordPresent");
  v3 = (_QWORD *)MEMORY[0x1E0CB4EA0];
  if (!v2)
    v3 = (_QWORD *)MEMORY[0x1E0CB4E78];
  objc_msgSend(v1, "objectForKeyedSubscript:", *v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "areAllRequirementsSatisfied");
  return v5;
}

uint64_t _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  id v12;

  v1 = a1;
  if (objc_msgSend(v1, "isOnboardingRecordPresent"))
  {
    objc_msgSend(v1, "onboardingRecord");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "featureSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0CB50C8];
    v12 = 0;
    objc_msgSend(v3, "numberForKey:error:", v4, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;

    if (v5)
    {
      objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4EA0]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "areAllRequirementsSatisfied");

      if (v8)
      {
        v9 = objc_msgSend(v5, "BOOLValue");
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus_cold_1((uint64_t)v6, v10);
    }
    v9 = 0;
    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

id _HKHRIrregularRhythmNotificationsHeaderWithFeatureStatus(void *a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4FD0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    HKHeartRateLocalizedString(CFSTR("FEATURES_DISABLED_WRIST_DETECTION_MESSAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id _HKHRIrregularRhythmNotificationsBridgeFooterWithFeatureStatus(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isOnboardingRecordPresent");
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4F50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4FC0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4F38]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4F30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = v3 ^ 1;
  if (((v3 ^ 1) & 1) != 0 || (v7 & 1) != 0)
  {
    if (((v12 | v5) & 1) != 0)
    {
      if (((v12 | v9 & v11) & 1) != 0)
      {
        v14 = (_QWORD *)MEMORY[0x1E0CB4EA0];
        if (!v3)
          v14 = (_QWORD *)MEMORY[0x1E0CB4E78];
        objc_msgSend(v1, "objectForKeyedSubscript:", *v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "unsatisfiedRequirementIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4F78]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "BOOLValue");

        if (v17 != 1 || (v19 & 1) != 0)
        {
          +[HKHRIrregularRhythmNotificationsBridgeFooter standardFooter](HKHRIrregularRhythmNotificationsBridgeFooter, "standardFooter");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[HKHRIrregularRhythmNotificationsBridgeFooter footerWhenAFibHistoryIsEnabled](HKHRIrregularRhythmNotificationsBridgeFooter, "footerWhenAFibHistoryIsEnabled");
          v13 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        +[HKHRIrregularRhythmNotificationsBridgeFooter footerWhenUnavailableInOnboardedCountry](HKHRIrregularRhythmNotificationsBridgeFooter, "footerWhenUnavailableInOnboardedCountry");
        v13 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[HKHRIrregularRhythmNotificationsBridgeFooter footerWhenRemotelyDisabled](HKHRIrregularRhythmNotificationsBridgeFooter, "footerWhenRemotelyDisabled");
      v13 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[HKHRIrregularRhythmNotificationsBridgeFooter footerWhenSeedHasExpired](HKHRIrregularRhythmNotificationsBridgeFooter, "footerWhenSeedHasExpired");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v13;

  return v20;
}

HKHRIrregularRhythmNotificationsBridgeSettings *HKHRIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HKHRIrregularRhythmNotificationsBridgeSettings *v8;

  v1 = a1;
  v2 = _HKHRIsIrregularRhythmNotificationsRowHiddenInBridgeWithFeatureStatus(v1);
  v3 = _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus(v1);
  v4 = objc_msgSend(v1, "isOnboardingRecordPresent") ^ 1;
  v5 = _HKHRIsUserInteractionEnabledForIrregularRhythmNotificationsBridgeSettingsWithFeatureStatus(v1);
  _HKHRIrregularRhythmNotificationsHeaderWithFeatureStatus(v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKHRIrregularRhythmNotificationsBridgeFooterWithFeatureStatus(v1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKHRIrregularRhythmNotificationsBridgeSettings initWithSettingHidden:notificationsOn:shouldLinkToOnboarding:userInteractionEnabled:headerText:footer:]([HKHRIrregularRhythmNotificationsBridgeSettings alloc], "initWithSettingHidden:notificationsOn:shouldLinkToOnboarding:userInteractionEnabled:headerText:footer:", v2, v3, v4, v5, v6, v7);
  return v8;
}

id HKHRCardioFitnessAllowedCountrySet()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingString:", CFSTR("/System/Library/Health/AvailableRegions"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:isDirectory:", v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "URLByAppendingPathComponent:", *MEMORY[0x1E0CB5000]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6538], "countrySetWithPlistURL:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t HKHRCardioFitnessShouldSkipLocationCheck()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall");
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("HKHRCardioFitnessShouldSkipLocationCheck"));

    return v2;
  }
  return result;
}

uint64_t HKHRCardioFitnessEventOnboardingDeepLink()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-apple-health://Heart.healthplugin/CardioFitnessEventOnboarding"));
}

uint64_t HKHRCardioFitnessDetailRoomBaseLink()
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-apple-health://Heart.healthplugin/CardioFitnessDetailRoom"));
}

const __CFString *HKHRCardioFitnessChartContextQueryName()
{
  return CFSTR("chartContext");
}

uint64_t HKHRCardioFitnessLocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:", CFSTR("1"));
}

void HKHRAFibBurdenNotificationsEnabledWithFeatureStatus_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D7781000, a1, a3, "[HKHRAFibBurdenNotificationsEnabled] No feature settings present in onboarding record.", a5, a6, a7, a8, 0);
}

void HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D7781000, a1, a3, "[HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped()] Attempted to pull local time zone, but instead got nil, not adding to metadata.", a5, a6, a7, a8, 0);
}

void _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "BOOL _HKHRAreIrregularRhythmNotificationsOnWithFeatureStatus(HKFeatureStatus * _Nonnull __strong)";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1D7781000, a2, OS_LOG_TYPE_ERROR, "[%{public}s]: Prompted for IRN's 'enabled' state, but setting is missing or invalid; reporting 'off': %{public}@",
    (uint8_t *)&v2,
    0x16u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1E0D27C80]();
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

uint64_t HKIsHeartRateEnabled()
{
  return MEMORY[0x1E0CB5228]();
}

uint64_t HKObjectForNanoPreferencesUserDefaultsKey()
{
  return MEMORY[0x1E0CB56C0]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1E0CB5E90]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

