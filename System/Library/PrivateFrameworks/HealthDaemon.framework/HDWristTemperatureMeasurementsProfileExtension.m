@implementation HDWristTemperatureMeasurementsProfileExtension

- (HDWristTemperatureMeasurementsProfileExtension)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  HKLogInfrastructure();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self)
  {
    v7 = (void *)*MEMORY[0x1E0CB50B0];
    v8 = v5;
    v9 = v7;
    v10 = v4;
    objc_msgSend(v10, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isCompanionCapable");

    self = -[HDWristTemperatureMeasurementsProfileExtension initWithProfile:featureIdentifier:isBackgroundDeliveryEnabled:loggingCategory:](self, "initWithProfile:featureIdentifier:isBackgroundDeliveryEnabled:loggingCategory:", v10, v9, v13, v8);
  }

  return self;
}

- (HDWristTemperatureMeasurementsProfileExtension)initWithProfile:(id)a3 featureIdentifier:(id)a4 isBackgroundDeliveryEnabled:(BOOL)a5 loggingCategory:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  HDWristTemperatureMeasurementsProfileExtension *v13;
  HDWristTemperatureMeasurementsProfileExtension *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HDLocalCountrySetAvailabilityProvider *v18;
  void *v19;
  uint64_t v20;
  HDPairedFeaturePropertiesSyncManager *v21;
  void *v22;
  HDPairedFeaturePropertiesSyncManager *v23;
  HDOTAFeatureDisableAndExpiryProvider *v24;
  void *v25;
  objc_class *v26;
  id v27;
  id v28;
  uint64_t v29;
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
  uint64_t v40;
  HDFeatureAvailabilityManager *featureAvailabilityManager;
  HDBackgroundFeatureDeliveryManager *v42;
  HDBackgroundFeatureDeliveryManager *featureDeliveryManager;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
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
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  HDOTAFeatureDisableAndExpiryProvider *v69;
  void *v70;
  void *v71;
  void *v72;
  HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider *v73;
  void *v74;
  void *v75;
  void *v76;
  HDFeatureAvailabilityManager *v77;
  HDPairedFeaturePropertiesSyncManager *v78;
  void *v79;
  void *v80;
  _BOOL4 v81;
  id v82;
  HDWristTemperatureMeasurementsProfileExtension *v83;
  id v84;
  id v85;
  objc_super v86;
  uint64_t v87;
  _QWORD v88[10];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[3];
  _QWORD v92[4];
  _QWORD v93[2];
  _QWORD v94[2];
  void *v95;
  _QWORD v96[8];
  _QWORD v97[10];

  v7 = a5;
  v97[8] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v86.receiver = self;
  v86.super_class = (Class)HDWristTemperatureMeasurementsProfileExtension;
  v13 = -[HDWristTemperatureMeasurementsProfileExtension init](&v86, sel_init);
  v14 = v13;
  if (v13)
  {
    v83 = v13;
    objc_storeStrong((id *)&v13->_featureIdentifier, a4);
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v7;
    if ((objc_msgSend(v15, "isAppleWatch") & 1) != 0)
      v16 = 0;
    else
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("CBC78224-8F5E-4D43-8666-69ADBE2A6277"));

    objc_msgSend(MEMORY[0x1E0CB6538], "localAvailabilityForWristTemperatureMeasurements");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = [HDLocalCountrySetAvailabilityProvider alloc];
    objc_msgSend(v10, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)v17;
    v20 = -[HDLocalCountrySetAvailabilityProvider initWithFeatureIdentifier:defaultCountrySet:healthDaemon:](v18, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v11, v17, v19);

    v21 = [HDPairedFeaturePropertiesSyncManager alloc];
    objc_msgSend(MEMORY[0x1E0CB66B0], "featureAttributesDerivedFromOSBuildAndFeatureVersion:", CFSTR("1"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)v20;
    v23 = -[HDPairedFeaturePropertiesSyncManager initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:](v21, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v11, v22, v20);

    -[HDPairedFeaturePropertiesSyncManager synchronizeLocalProperties](v23, "synchronizeLocalProperties");
    v78 = v23;
    v73 = -[HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:]([HDWatchAndCompanionCountrySetIntersectionAvailabilityProvider alloc], "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v23, v10, v16, v12);
    v24 = [HDOTAFeatureDisableAndExpiryProvider alloc];
    objc_msgSend(v10, "daemon");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = -[HDOTAFeatureDisableAndExpiryProvider initWithDaemon:featureIdentifier:](v24, "initWithDaemon:featureIdentifier:", v25, v11);

    v77 = [HDFeatureAvailabilityManager alloc];
    v26 = (objc_class *)MEMORY[0x1E0CB66F0];
    v84 = v11;
    v27 = v11;
    v28 = v16;
    v64 = [v26 alloc];
    v96[0] = *MEMORY[0x1E0CB4E40];
    objc_msgSend(MEMORY[0x1E0CB66F8], "defaultOnboardingEligibilityRequirementsForFeatureIdentifier:", v27);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v76;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v75;
    v96[1] = *MEMORY[0x1E0CB4E48];
    objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v27, HKLocalDeviceHardwareSupportsWristTemperatureMeasurements());
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v94[0] = v74;
    objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v27);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v71;
    v96[2] = *MEMORY[0x1E0CB4E50];
    v29 = *MEMORY[0x1E0CB5210];
    objc_msgSend(MEMORY[0x1E0CB66F8], "defaultHelpTileRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:isAgeGatedUserDefaultsKey:", v27, *MEMORY[0x1E0CB5210]);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v70;
    objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnAnyWatch:supportedOnLocalDevice:", v28, HKLocalDeviceHardwareSupportsWristTemperatureMeasurements());
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v97[2] = v67;
    v96[3] = *MEMORY[0x1E0CB4EA8];
    objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", v27);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v66;
    objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v27, HKLocalDeviceHardwareSupportsWristTemperatureMeasurements());
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v63;
    objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", v29);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v62;
    objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v92[3] = v61;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 4);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v97[3] = v60;
    v96[4] = *MEMORY[0x1E0CB4EA0];
    objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v27);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v59;
    objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v27);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v58;
    objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v27, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v97[4] = v56;
    v96[5] = *MEMORY[0x1E0CB4EB8];
    objc_msgSend(MEMORY[0x1E0CB66F8], "defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:isAgeGatedUserDefaultsKey:", v27, v29);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v55;
    objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnAnyWatch:supportedOnLocalDevice:", v28, HKLocalDeviceHardwareSupportsWristTemperatureMeasurements());
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v97[5] = v53;
    v96[6] = *MEMORY[0x1E0CB4EB0];
    objc_msgSend(MEMORY[0x1E0CB66F8], "defaultTipsAppVisibilityRequirementsForBackgroundDeliveredFeatureWithFeatureIdentifier:isAgeGatedUserDefaultsKey:", v27, v29);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v52;
    v47 = v28;
    objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnAnyWatch:supportedOnLocalDevice:", v28, HKLocalDeviceHardwareSupportsWristTemperatureMeasurements());
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v89[1] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v97[6] = v50;
    v96[7] = *MEMORY[0x1E0CB4ED0];
    objc_msgSend(MEMORY[0x1E0CB66F8], "profileIsNotFamilySetupPairingProfile");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v49;
    objc_msgSend(MEMORY[0x1E0CB66F8], "onboardingRecordIsPresentForFeatureWithIdentifier:", v27);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v48;
    objc_msgSend(MEMORY[0x1E0CB66F8], "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v27, HKLocalDeviceHardwareSupportsWristTemperatureMeasurements());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v88[2] = v46;
    objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsNotRemotelyDisabledWithIdentifier:", v27);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v88[3] = v45;
    objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4] = v30;
    objc_msgSend(MEMORY[0x1E0CB66F8], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v27, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v88[5] = v31;
    objc_msgSend(MEMORY[0x1E0CB66F8], "notAgeGatedForUserDefaultsKey:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v88[6] = v32;
    v82 = v12;
    v33 = (void *)MEMORY[0x1E0CB66F8];
    v87 = *MEMORY[0x1E0CB50A0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
    v85 = v10;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "onboardingRecordsArePresentForPrerequisiteFeaturesWithIdentifiers:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v88[7] = v35;
    objc_msgSend(MEMORY[0x1E0CB66F8], "featureIsOnWithIdentifier:isOnIfSettingIsAbsent:", v27, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v88[8] = v36;
    objc_msgSend(MEMORY[0x1E0CB66F8], "wristDetectionIsEnabledForActiveWatch");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v88[9] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 10);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v97[7] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v64, "initWithRequirementsByContext:", v39);

    v12 = v82;
    v10 = v85;

    v40 = -[HDFeatureAvailabilityManager initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:](v77, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v85, v27, v65, 1, v47, v73, v69, v82);
    v14 = v83;
    featureAvailabilityManager = v83->_featureAvailabilityManager;
    v83->_featureAvailabilityManager = (HDFeatureAvailabilityManager *)v40;

    if (v81)
    {
      v42 = -[HDBackgroundFeatureDeliveryManager initWithProfile:featureAvailabilityExtension:loggingCategory:]([HDBackgroundFeatureDeliveryManager alloc], "initWithProfile:featureAvailabilityExtension:loggingCategory:", v85, v83->_featureAvailabilityManager, v82);
      featureDeliveryManager = v83->_featureDeliveryManager;
      v83->_featureDeliveryManager = v42;

    }
    v11 = v84;
  }

  return v14;
}

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  HDFeatureAvailabilityManager *v4;

  if (objc_msgSend(a3, "isEqualToString:", self->_featureIdentifier))
    v4 = self->_featureAvailabilityManager;
  else
    v4 = 0;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_featureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

@end
