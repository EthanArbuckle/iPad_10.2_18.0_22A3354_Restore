@implementation HUHomeFeatureOnboarder

- (HUHomeFeatureOnboarder)initWithFeatures:(id)a3 home:(id)a4 devices:(id)a5 usageOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HUHomeFeatureOnboarder *v16;

  objc_storeStrong((id *)&self->_devices, a5);
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HUHomeFeatureOnboarder initWithGroupedFeatures:home:usageOptions:](self, "initWithGroupedFeatures:home:usageOptions:", v15, v13, v12);
  return v16;
}

- (HUHomeFeatureOnboarder)initWithFeatures:(id)a3 home:(id)a4 usageOptions:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  HUHomeFeatureOnboarder *v12;

  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "arrayWithObject:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HUHomeFeatureOnboarder initWithGroupedFeatures:home:usageOptions:](self, "initWithGroupedFeatures:home:usageOptions:", v11, v10, v9);

  return v12;
}

- (HUHomeFeatureOnboarder)initWithGroupedFeatures:(id)a3 home:(id)a4 usageOptions:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUHomeFeatureOnboarder *v12;
  objc_super v14;

  objc_storeStrong((id *)&self->_home, a4);
  v9 = a4;
  v10 = a5;
  v11 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUHomeFeatureOnboarder;
  v12 = -[HUFeatureOnboarder initWithGroupedFeatures:usageOptions:](&v14, sel_initWithGroupedFeatures_usageOptions_, v11, v10);

  return v12;
}

- (id)_subclass_buildAllFlowGroupsFromFeatureGroups:(id)a3 usageOptions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;

  v7 = a4;
  v8 = a3;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeFeatureOnboarder.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("featureGroups.count != 0"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__HUHomeFeatureOnboarder__subclass_buildAllFlowGroupsFromFeatureGroups_usageOptions___block_invoke;
  v16[3] = &unk_1E6F56B48;
  v19 = a2;
  v16[4] = self;
  v17 = v7;
  v10 = v9;
  v18 = v10;
  v11 = v7;
  objc_msgSend(v8, "na_each:", v16);

  v12 = v18;
  v13 = v10;

  return v13;
}

void __85__HUHomeFeatureOnboarder__subclass_buildAllFlowGroupsFromFeatureGroups_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v8 = a2;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HUHomeFeatureOnboarder.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentFeatureGroup.count != 0"));

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__HUHomeFeatureOnboarder__subclass_buildAllFlowGroupsFromFeatureGroups_usageOptions___block_invoke_2;
  v9[3] = &unk_1E6F56B20;
  v3 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  v10 = v4;
  v11 = v5;
  objc_msgSend(v8, "na_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

HUHomeHubMigrationOnboardingFlow *__85__HUHomeFeatureOnboarder__subclass_buildAllFlowGroupsFromFeatureGroups_usageOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HUSwitchHomesWelcomeOnboardingFlow *v4;
  void *v5;
  uint64_t v6;
  HUHomeHubMigrationOnboardingFlow *v7;
  __objc2_class *v8;
  HUHomeHubMigrationOnboardingFlow *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  switch(objc_msgSend(v3, "unsignedIntegerValue"))
  {
    case 0:
      v4 = [HUSwitchHomesWelcomeOnboardingFlow alloc];
      objc_msgSend(*(id *)(a1 + 32), "home");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[HUSwitchHomesWelcomeOnboardingFlow initWithHome:](v4, "initWithHome:", v5);
      goto LABEL_17;
    case 1:
      v8 = HULanguageSetupOnboardingFlow;
      goto LABEL_16;
    case 2:
      v8 = HUVoiceProfileOnboardingFlow;
      goto LABEL_16;
    case 3:
      v8 = HUPersonalRequestsOnboardingFlow;
      goto LABEL_16;
    case 4:
      v8 = HUAnnounceOnboardingFlow;
      goto LABEL_16;
    case 5:
      v8 = HUHomeTheaterOnboardingFlow;
      goto LABEL_16;
    case 6:
      v8 = HUTVViewingProfilesOnboardingFlow;
      goto LABEL_16;
    case 7:
      v8 = HUNaturalLightingOnboardingFlow;
      goto LABEL_16;
    case 8:
      v8 = HUCameraRecordingOnboardingFlow;
      goto LABEL_16;
    case 9:
      v8 = HUAccessoryFirmwareUpdateOnboardingFlow;
      goto LABEL_16;
    case 10:
      v8 = HULocationServicesOnboardingFlow;
      goto LABEL_16;
    case 11:
      v9 = [HUHomeHubMigrationOnboardingFlow alloc];
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "home");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "devices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[HUHomeHubMigrationOnboardingFlow initWithUsageOptions:home:devices:](v9, "initWithUsageOptions:home:devices:", v10, v5, v11);

      break;
    case 12:
      v8 = HUUtilityOnboardingFlow;
LABEL_16:
      v12 = [v8 alloc];
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "home");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v12, "initWithUsageOptions:home:", v13, v5);
LABEL_17:
      v7 = (HUHomeHubMigrationOnboardingFlow *)v6;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HUHomeFeatureOnboarder.m"), 194, CFSTR("Couldn't find a feature flow for %@"), v3);
      v7 = 0;
      break;
  }

  return v7;
}

- (id)getPostProcessingFlowsForResults:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HUOwnerMustUpgradeOnboardingFlow *v13;
  void *v14;
  HUOwnerMustUpgradeOnboardingFlow *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  HUUpgradeMultiUserDevicesOnboardingFlow *v22;
  void *v23;
  HUUpgradeMultiUserDevicesOnboardingFlow *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  HUHomeFeatureOnboarder *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  HUHomeAssistantDevicesUnsupportedLanguageFlow *v32;
  void *v33;
  HUHomeAssistantDevicesUnsupportedLanguageFlow *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  int v39;
  HUHomeFeatureOnboarder *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUHomeFeatureOnboarder home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[HUHomeFeatureOnboardingUtilities home:checkForOwnerUpgradeRequirementsFromResults:](HUHomeFeatureOnboardingUtilities, "home:checkForOwnerUpgradeRequirementsFromResults:", v6, v5);

  if (HFForceOwnerMustUpgradeOnboarding())
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412802;
      v40 = self;
      v41 = 2112;
      v42 = v9;
      v43 = 2048;
      v44 = v7;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Forcing Owner Upgrade requirements %lu", (uint8_t *)&v39, 0x20u);

    }
    v7 = 3;
  }
  else if (!v7)
  {
    v12 = 0;
    goto LABEL_9;
  }
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412802;
    v40 = self;
    v41 = 2112;
    v42 = v11;
    v43 = 2048;
    v44 = v7;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Owner Upgrade requirements %lu", (uint8_t *)&v39, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [HUOwnerMustUpgradeOnboardingFlow alloc];
  -[HUHomeFeatureOnboarder home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HUOwnerMustUpgradeOnboardingFlow initWithUpgradeRequirements:home:](v13, "initWithUpgradeRequirements:home:", v7, v14);
  objc_msgSend(v12, "na_safeAddObject:", v15);

LABEL_9:
  -[HUHomeFeatureOnboarder home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[HUHomeFeatureOnboardingUtilities home:checkForMultiUserDeviceUpgradeRequirements:](HUHomeFeatureOnboardingUtilities, "home:checkForMultiUserDeviceUpgradeRequirements:", v16, v5);

  if (HKForceDevicesNeedUpgrade())
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412802;
      v40 = self;
      v41 = 2112;
      v42 = v19;
      v43 = 2048;
      v44 = v17;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Forcing Multi User Device Upgrade requirements %lu", (uint8_t *)&v39, 0x20u);

    }
    v17 = 3;
  }
  else if (!v17)
  {
    goto LABEL_19;
  }
  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138412802;
    v40 = self;
    v41 = 2112;
    v42 = v21;
    v43 = 2048;
    v44 = v17;
    _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Upgrade Multi User Devices requirements %lu", (uint8_t *)&v39, 0x20u);

  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = [HUUpgradeMultiUserDevicesOnboardingFlow alloc];
  -[HUHomeFeatureOnboarder home](self, "home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HUUpgradeMultiUserDevicesOnboardingFlow initWithUpgradeRequirements:home:](v22, "initWithUpgradeRequirements:home:", v17, v23);
  objc_msgSend(v12, "na_safeAddObject:", v24);

LABEL_19:
  +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if (!+[HUHomeFeatureOnboardingUtilities hasUserSaidYesToVoiceIdentificationInResults:](HUHomeFeatureOnboardingUtilities, "hasUserSaidYesToVoiceIdentificationInResults:", v5))goto LABEL_30;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HUHomeFeatureOnboarder home](self, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUHomeFeatureOnboardingUtilities analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:home:](HUHomeFeatureOnboardingUtilities, "analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:home:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("languageMismatch"));
    v28 = (HUHomeFeatureOnboarder *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[HUHomeFeatureOnboarder count](v28, "count");
      v39 = 138412802;
      v40 = self;
      v41 = 2112;
      v42 = v30;
      v43 = 2048;
      v44 = v31;
      _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@ Found %lu HomePods with unsupported languages", (uint8_t *)&v39, 0x20u);

    }
    if (-[HUHomeFeatureOnboarder count](v28, "count"))
    {
      v32 = [HUHomeAssistantDevicesUnsupportedLanguageFlow alloc];
      -[HUHomeFeatureOnboarder home](self, "home");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[HUHomeAssistantDevicesUnsupportedLanguageFlow initWithHomeAssistantDevicesHavingLanguageMismatch:home:](v32, "initWithHomeAssistantDevicesHavingLanguageMismatch:home:", v28, v33);
      objc_msgSend(v12, "na_safeAddObject:", v34);

    }
  }
  else
  {
    HFLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    NSStringFromSelector(a2);
    v28 = (HUHomeFeatureOnboarder *)objc_claimAutoreleasedReturnValue();
    v39 = 138412290;
    v40 = v28;
    _os_log_error_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", (uint8_t *)&v39, 0xCu);
  }

LABEL_29:
LABEL_30:
  HFLogForCategory();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v12, "count");
    v39 = 138413058;
    v40 = self;
    v41 = 2112;
    v42 = v36;
    v43 = 2048;
    v44 = v37;
    v45 = 2112;
    v46 = v12;
    _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@ postProcessingFlowGroup has %lu flows: %@", (uint8_t *)&v39, 0x2Au);

  }
  return v12;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
