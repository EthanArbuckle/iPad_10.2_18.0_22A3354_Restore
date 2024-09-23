@implementation ATXModeConfigurationMetric

- (ATXModeConfigurationMetric)init
{
  ATXModeConfigurationMetric *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXModeConfigurationMetric;
  result = -[_ATXCoreAnalyticsMetric init](&v3, sel_init);
  if (result)
    result->_numCustomHomeScreens = 0;
  return result;
}

- (id)metricName
{
  return CFSTR("com.apple.ModeConfiguration.DailyModeConfiguration");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[35];
  _QWORD v55[37];

  v55[35] = *MEMORY[0x1E0C80C00];
  v54[0] = CFSTR("modeIdentifier");
  -[ATXModeConfigurationMetric modeIdentifier](self, "modeIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    -[ATXModeConfigurationMetric modeIdentifier](self, "modeIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v3;
  }
  v24 = (void *)v3;
  v55[0] = v3;
  v54[1] = CFSTR("modeSemanticType");
  -[ATXModeConfigurationMetric modeSemanticType](self, "modeSemanticType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v4;
  v55[1] = v4;
  v54[2] = CFSTR("hasSmartTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasSmartTrigger](self, "hasSmartTrigger"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v51;
  v54[3] = CFSTR("hasAreaTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasAreaTrigger](self, "hasAreaTrigger"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v50;
  v54[4] = CFSTR("hasTimeTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasTimeTrigger](self, "hasTimeTrigger"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v49;
  v54[5] = CFSTR("hasAppTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasAppTrigger](self, "hasAppTrigger"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v48;
  v54[6] = CFSTR("hasScreenActivityTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasScreenActivityTrigger](self, "hasScreenActivityTrigger"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v47;
  v54[7] = CFSTR("hasWorkoutTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasWorkoutTrigger](self, "hasWorkoutTrigger"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v46;
  v54[8] = CFSTR("hasSleepTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasSleepTrigger](self, "hasSleepTrigger"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v45;
  v54[9] = CFSTR("hasDrivingTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasDrivingTrigger](self, "hasDrivingTrigger"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v55[9] = v44;
  v54[10] = CFSTR("numAllowedApps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAllowedApps](self, "numAllowedApps")));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v43;
  v54[11] = CFSTR("numAllowedContacts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAllowedContacts](self, "numAllowedContacts")));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v55[11] = v42;
  v54[12] = CFSTR("isAutomaticallyGenerated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[12] = v41;
  v54[13] = CFSTR("doesImpactAvailability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric doesImpactAvailability](self, "doesImpactAvailability"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[13] = v40;
  v54[14] = CFSTR("hasCustomHomeScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasCustomHomeScreen](self, "hasCustomHomeScreen"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[14] = v39;
  v54[15] = CFSTR("numCustomHomeScreens");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric numCustomHomeScreens](self, "numCustomHomeScreens"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[15] = v38;
  v54[16] = CFSTR("hasCustomHomeScreenUsedInOtherModes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric hasCustomHomeScreenUsedInOtherModes](self, "hasCustomHomeScreenUsedInOtherModes"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[16] = v37;
  v54[17] = CFSTR("numLockScreenPosters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numLockScreenPosters](self, "numLockScreenPosters")));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[17] = v36;
  v54[18] = CFSTR("numDeniedApps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numDeniedApps](self, "numDeniedApps")));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[18] = v35;
  v54[19] = CFSTR("numDeniedContacts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numDeniedContacts](self, "numDeniedContacts")));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[19] = v34;
  v54[20] = CFSTR("appConfigurationType");
  -[ATXModeConfigurationMetric appConfigurationType](self, "appConfigurationType");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v6;
  v55[20] = v6;
  v54[21] = CFSTR("contactConfigurationType");
  -[ATXModeConfigurationMetric contactConfigurationType](self, "contactConfigurationType");
  v8 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v33 = v7;
  v21 = (void *)v8;
  v55[21] = v8;
  v54[22] = CFSTR("numAcceptedSuggestedHomePages");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAcceptedSuggestedHomePages](self, "numAcceptedSuggestedHomePages")));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v55[22] = v31;
  v54[23] = CFSTR("numAcceptedSuggestedLockScreens");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAcceptedSuggestedLockScreens](self, "numAcceptedSuggestedLockScreens")));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[23] = v30;
  v54[24] = CFSTR("numAcceptedSuggestedApps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAcceptedSuggestedApps](self, "numAcceptedSuggestedApps")));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v55[24] = v29;
  v54[25] = CFSTR("numAcceptedSuggestedContacts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAcceptedSuggestedContacts](self, "numAcceptedSuggestedContacts")));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v55[25] = v28;
  v54[26] = CFSTR("didRemoveSuggestedPage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric didRemoveSuggestedPage](self, "didRemoveSuggestedPage"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[26] = v27;
  v54[27] = CFSTR("numAppConfigurations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationMetric cappedForPrivacyWithValue:](self, "cappedForPrivacyWithValue:", -[ATXModeConfigurationMetric numAppConfigurations](self, "numAppConfigurations")));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55[27] = v26;
  v54[28] = CFSTR("isSharingAcrossDevices");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric isSharingAcrossDevices](self, "isSharingAcrossDevices"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[28] = v25;
  v54[29] = CFSTR("treatmentId");
  -[ATXModeConfigurationMetric treatmentId](self, "treatmentId");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v55[29] = v9;
  v54[30] = CFSTR("experimentId");
  -[ATXModeConfigurationMetric experimentId](self, "experimentId", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[30] = v12;
  v54[31] = CFSTR("deploymentId");
  -[ATXModeConfigurationMetric deploymentId](self, "deploymentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55[31] = v14;
  v54[32] = CFSTR("isSleepMigrated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric isSleepMigrated](self, "isSleepMigrated"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55[32] = v15;
  v54[33] = CFSTR("wasQuickStartPlatterShown");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric wasQuickStartPlatterShown](self, "wasQuickStartPlatterShown"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v55[33] = v16;
  v54[34] = CFSTR("wasColoringBookSeen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXModeConfigurationMetric wasColoringBookSeen](self, "wasColoringBookSeen"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55[34] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 35);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  if (!v11)

  if (!v10)
  if (!v32)

  if (!v33)
  if (!v5)

  if (v53)
  return v18;
}

- (id)description
{
  _BOOL4 v3;
  unint64_t v4;
  _BOOL4 v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _BOOL4 v18;
  unint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  unint64_t v25;
  unint64_t v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;

  v37 = (void *)MEMORY[0x1E0CB3940];
  -[ATXModeConfigurationMetric modeIdentifier](self, "modeIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeConfigurationMetric modeSemanticType](self, "modeSemanticType");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[ATXModeConfigurationMetric hasSmartTrigger](self, "hasSmartTrigger");
  v33 = -[ATXModeConfigurationMetric hasAreaTrigger](self, "hasAreaTrigger");
  v32 = -[ATXModeConfigurationMetric hasTimeTrigger](self, "hasTimeTrigger");
  v31 = -[ATXModeConfigurationMetric hasAppTrigger](self, "hasAppTrigger");
  v30 = -[ATXModeConfigurationMetric hasScreenActivityTrigger](self, "hasScreenActivityTrigger");
  v29 = -[ATXModeConfigurationMetric hasWorkoutTrigger](self, "hasWorkoutTrigger");
  v28 = -[ATXModeConfigurationMetric hasSleepTrigger](self, "hasSleepTrigger");
  v27 = -[ATXModeConfigurationMetric hasDrivingTrigger](self, "hasDrivingTrigger");
  v26 = -[ATXModeConfigurationMetric numAllowedApps](self, "numAllowedApps");
  v25 = -[ATXModeConfigurationMetric numAllowedContacts](self, "numAllowedContacts");
  v24 = -[ATXModeConfigurationMetric isAutomaticallyGenerated](self, "isAutomaticallyGenerated");
  v23 = -[ATXModeConfigurationMetric doesImpactAvailability](self, "doesImpactAvailability");
  v20 = -[ATXModeConfigurationMetric hasCustomHomeScreen](self, "hasCustomHomeScreen");
  v19 = -[ATXModeConfigurationMetric numCustomHomeScreens](self, "numCustomHomeScreens");
  v18 = -[ATXModeConfigurationMetric hasCustomHomeScreenUsedInOtherModes](self, "hasCustomHomeScreenUsedInOtherModes");
  v17 = -[ATXModeConfigurationMetric numDeniedApps](self, "numDeniedApps");
  v16 = -[ATXModeConfigurationMetric numDeniedContacts](self, "numDeniedContacts");
  -[ATXModeConfigurationMetric appConfigurationType](self, "appConfigurationType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeConfigurationMetric contactConfigurationType](self, "contactConfigurationType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXModeConfigurationMetric numAcceptedSuggestedHomePages](self, "numAcceptedSuggestedHomePages");
  v14 = -[ATXModeConfigurationMetric numAcceptedSuggestedLockScreens](self, "numAcceptedSuggestedLockScreens");
  v13 = -[ATXModeConfigurationMetric numAcceptedSuggestedApps](self, "numAcceptedSuggestedApps");
  v12 = -[ATXModeConfigurationMetric numAcceptedSuggestedContacts](self, "numAcceptedSuggestedContacts");
  v3 = -[ATXModeConfigurationMetric didRemoveSuggestedPage](self, "didRemoveSuggestedPage");
  v4 = -[ATXModeConfigurationMetric numAppConfigurations](self, "numAppConfigurations");
  v5 = -[ATXModeConfigurationMetric isSharingAcrossDevices](self, "isSharingAcrossDevices");
  v6 = -[ATXModeConfigurationMetric numLockScreenPosters](self, "numLockScreenPosters");
  -[ATXModeConfigurationMetric treatmentId](self, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeConfigurationMetric experimentId](self, "experimentId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeConfigurationMetric deploymentId](self, "deploymentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringWithFormat:", CFSTR("ATXModeConfigurationMetric modeIdentifier:%@\nmodeSemanticType:%@\nhasSmartTrigger:%d\nhasAreaTrigger:%d\nhasTimeTrigger:%d\nhasAppTrigger:%d\nhasScreenActivityTrigger:%d\nhasWorkoutTrigger:%d\nhasSleepTrigger:%d\nhasDrivingTrigger:%d\nnumAllowedApps:%lu\nnumAllowedContacts:%lu\nisAutomaticallyGenerated:%d\ndoesImpactAvailability:%d\nhasCustomHomeScreen:%d\nnumCustomHomeScreens:%lu\nhasCustomHomeScreenUsedInOtherModes:%d\nnumDeniedApps:%lu\nnumDeniedContacts:%lu\nappConfigurationType:%@\ncontactConfigurationType:%@\nnumAcceptedSuggestedHomePages:%lu\nnumAcceptedSuggestedLockScreens:%lu\nnumAcceptedSuggestedApps:%lu\nnumAcceptedSuggestedContacts:%lu\ndidRemoveSuggestedPage:%d\nnumAppConfigurations:%lu\nisSharingAcrossDevices:%d\nnumLockScreenPosters:%lu\ntreatmentId:%@\nexperimentId:%@\ndeploymentId:%@\nisSleepMigrated:%d\nwasQuickStartPlatterShown:%d\nwasColoringBookSeen:%d\n"), v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v20, v19,
    v18,
    v17,
    v16,
    v22,
    v21,
    v15,
    v14,
    v13,
    v12,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    -[ATXModeConfigurationMetric isSleepMigrated](self, "isSleepMigrated"),
    -[ATXModeConfigurationMetric wasQuickStartPlatterShown](self, "wasQuickStartPlatterShown"),
    -[ATXModeConfigurationMetric wasColoringBookSeen](self, "wasColoringBookSeen"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)cappedForPrivacyWithValue:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x14)
    return 20;
  else
    return a3;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modeIdentifier, a3);
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
  objc_storeStrong((id *)&self->_modeSemanticType, a3);
}

- (BOOL)hasSmartTrigger
{
  return self->_hasSmartTrigger;
}

- (void)setHasSmartTrigger:(BOOL)a3
{
  self->_hasSmartTrigger = a3;
}

- (BOOL)hasAreaTrigger
{
  return self->_hasAreaTrigger;
}

- (void)setHasAreaTrigger:(BOOL)a3
{
  self->_hasAreaTrigger = a3;
}

- (BOOL)hasTimeTrigger
{
  return self->_hasTimeTrigger;
}

- (void)setHasTimeTrigger:(BOOL)a3
{
  self->_hasTimeTrigger = a3;
}

- (BOOL)hasAppTrigger
{
  return self->_hasAppTrigger;
}

- (void)setHasAppTrigger:(BOOL)a3
{
  self->_hasAppTrigger = a3;
}

- (BOOL)hasScreenActivityTrigger
{
  return self->_hasScreenActivityTrigger;
}

- (void)setHasScreenActivityTrigger:(BOOL)a3
{
  self->_hasScreenActivityTrigger = a3;
}

- (BOOL)hasWorkoutTrigger
{
  return self->_hasWorkoutTrigger;
}

- (void)setHasWorkoutTrigger:(BOOL)a3
{
  self->_hasWorkoutTrigger = a3;
}

- (BOOL)hasSleepTrigger
{
  return self->_hasSleepTrigger;
}

- (void)setHasSleepTrigger:(BOOL)a3
{
  self->_hasSleepTrigger = a3;
}

- (BOOL)hasDrivingTrigger
{
  return self->_hasDrivingTrigger;
}

- (void)setHasDrivingTrigger:(BOOL)a3
{
  self->_hasDrivingTrigger = a3;
}

- (unint64_t)numAllowedApps
{
  return self->_numAllowedApps;
}

- (void)setNumAllowedApps:(unint64_t)a3
{
  self->_numAllowedApps = a3;
}

- (unint64_t)numAllowedContacts
{
  return self->_numAllowedContacts;
}

- (void)setNumAllowedContacts:(unint64_t)a3
{
  self->_numAllowedContacts = a3;
}

- (unint64_t)numDeniedApps
{
  return self->_numDeniedApps;
}

- (void)setNumDeniedApps:(unint64_t)a3
{
  self->_numDeniedApps = a3;
}

- (unint64_t)numDeniedContacts
{
  return self->_numDeniedContacts;
}

- (void)setNumDeniedContacts:(unint64_t)a3
{
  self->_numDeniedContacts = a3;
}

- (BOOL)isAutomaticallyGenerated
{
  return self->_isAutomaticallyGenerated;
}

- (void)setIsAutomaticallyGenerated:(BOOL)a3
{
  self->_isAutomaticallyGenerated = a3;
}

- (BOOL)doesImpactAvailability
{
  return self->_doesImpactAvailability;
}

- (void)setDoesImpactAvailability:(BOOL)a3
{
  self->_doesImpactAvailability = a3;
}

- (BOOL)hasCustomHomeScreen
{
  return self->_hasCustomHomeScreen;
}

- (void)setHasCustomHomeScreen:(BOOL)a3
{
  self->_hasCustomHomeScreen = a3;
}

- (unint64_t)numCustomHomeScreens
{
  return self->_numCustomHomeScreens;
}

- (void)setNumCustomHomeScreens:(unint64_t)a3
{
  self->_numCustomHomeScreens = a3;
}

- (BOOL)hasCustomHomeScreenUsedInOtherModes
{
  return self->_hasCustomHomeScreenUsedInOtherModes;
}

- (void)setHasCustomHomeScreenUsedInOtherModes:(BOOL)a3
{
  self->_hasCustomHomeScreenUsedInOtherModes = a3;
}

- (unint64_t)numLockScreenPosters
{
  return self->_numLockScreenPosters;
}

- (void)setNumLockScreenPosters:(unint64_t)a3
{
  self->_numLockScreenPosters = a3;
}

- (NSString)appConfigurationType
{
  return self->_appConfigurationType;
}

- (void)setAppConfigurationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)contactConfigurationType
{
  return self->_contactConfigurationType;
}

- (void)setContactConfigurationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)numAcceptedSuggestedHomePages
{
  return self->_numAcceptedSuggestedHomePages;
}

- (void)setNumAcceptedSuggestedHomePages:(unint64_t)a3
{
  self->_numAcceptedSuggestedHomePages = a3;
}

- (unint64_t)numAcceptedSuggestedLockScreens
{
  return self->_numAcceptedSuggestedLockScreens;
}

- (void)setNumAcceptedSuggestedLockScreens:(unint64_t)a3
{
  self->_numAcceptedSuggestedLockScreens = a3;
}

- (unint64_t)numAcceptedSuggestedApps
{
  return self->_numAcceptedSuggestedApps;
}

- (void)setNumAcceptedSuggestedApps:(unint64_t)a3
{
  self->_numAcceptedSuggestedApps = a3;
}

- (unint64_t)numAcceptedSuggestedContacts
{
  return self->_numAcceptedSuggestedContacts;
}

- (void)setNumAcceptedSuggestedContacts:(unint64_t)a3
{
  self->_numAcceptedSuggestedContacts = a3;
}

- (BOOL)didRemoveSuggestedPage
{
  return self->_didRemoveSuggestedPage;
}

- (void)setDidRemoveSuggestedPage:(BOOL)a3
{
  self->_didRemoveSuggestedPage = a3;
}

- (BOOL)isSleepMigrated
{
  return self->_isSleepMigrated;
}

- (void)setIsSleepMigrated:(BOOL)a3
{
  self->_isSleepMigrated = a3;
}

- (unint64_t)numAppConfigurations
{
  return self->_numAppConfigurations;
}

- (void)setNumAppConfigurations:(unint64_t)a3
{
  self->_numAppConfigurations = a3;
}

- (BOOL)isSharingAcrossDevices
{
  return self->_isSharingAcrossDevices;
}

- (void)setIsSharingAcrossDevices:(BOOL)a3
{
  self->_isSharingAcrossDevices = a3;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSNumber)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentId, a3);
}

- (BOOL)wasQuickStartPlatterShown
{
  return self->_wasQuickStartPlatterShown;
}

- (void)setWasQuickStartPlatterShown:(BOOL)a3
{
  self->_wasQuickStartPlatterShown = a3;
}

- (BOOL)wasColoringBookSeen
{
  return self->_wasColoringBookSeen;
}

- (void)setWasColoringBookSeen:(BOOL)a3
{
  self->_wasColoringBookSeen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_contactConfigurationType, 0);
  objc_storeStrong((id *)&self->_appConfigurationType, 0);
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end
