@implementation HKHRCardioFitnessNotificationSettingsFactory

- (HKHRCardioFitnessNotificationSettingsFactory)initWithFeatureStatus:(id)a3
{
  id v4;
  HKHRCardioFitnessNotificationSettingsFactory *v5;
  HKHRCardioFitnessNotificationSettingsFactory *v6;
  HKHRCardioFitnessNotificationSettingsFactory *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRCardioFitnessNotificationSettingsFactory;
  v5 = -[HKHRCardioFitnessNotificationSettingsFactory init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HKHRCardioFitnessNotificationSettingsFactory setFeatureStatus:](v5, "setFeatureStatus:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)_bridgeOnboardingFooterForEvaluation:(id)a3 :(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  if (!objc_msgSend(v5, "areAllRequirementsSatisfied"))
  {
    objc_msgSend(v5, "highestPriorityUnsatisfiedRequirement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F38])
      || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F30]))
    {
      -[HKHRCardioFitnessNotificationSettingsFactory _pairedDeviceRegionGatedFooter](self, "_pairedDeviceRegionGatedFooter");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F70]))
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_FAULT))
        -[HKHRCardioFitnessNotificationSettingsFactory _bridgeOnboardingFooterForEvaluation::].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_10:
    -[HKHRCardioFitnessNotificationSettingsFactory _genericBridgeSettingFooter](self, "_genericBridgeSettingFooter");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "areAllRequirementsSatisfied") & 1) != 0)
    goto LABEL_10;
  -[HKHRCardioFitnessNotificationSettingsFactory _pregnancyBridgeSettingFooter](self, "_pregnancyBridgeSettingFooter");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v16 = (void *)v8;

  return v16;
}

- (id)_bridgeNotificationsFooterForEvaluation:(id)a3 :(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  if (objc_msgSend(v5, "areAllRequirementsSatisfied"))
  {
    -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E68]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "areAllRequirementsSatisfied") & 1) == 0)
    {
      -[HKHRCardioFitnessNotificationSettingsFactory _pregnancyBridgeSettingFooter](self, "_pregnancyBridgeSettingFooter");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(v5, "highestPriorityUnsatisfiedRequirement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F38])
      || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F30]))
    {
      -[HKHRCardioFitnessNotificationSettingsFactory _pairedDeviceRegionGatedFooter](self, "_pairedDeviceRegionGatedFooter");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F18]))
    {
      -[HKHRCardioFitnessNotificationSettingsFactory _ageNotSetBridgeSettingFooter](self, "_ageNotSetBridgeSettingFooter");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F80]))
    {
      -[HKHRCardioFitnessNotificationSettingsFactory _ageGatedBridgeSettingFooter](self, "_ageGatedBridgeSettingFooter");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F70]))
    {
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4FD0]))
      {
        -[HKHRCardioFitnessNotificationSettingsFactory _wristDetectOffBridgeSettingFooter](self, "_wristDetectOffBridgeSettingFooter");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB52E8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_FAULT))
        -[HKHRCardioFitnessNotificationSettingsFactory _bridgeOnboardingFooterForEvaluation::].cold.1((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  -[HKHRCardioFitnessNotificationSettingsFactory _genericBridgeSettingFooter](self, "_genericBridgeSettingFooter");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v9 = (void *)v8;

  return v9;
}

- (id)bridgeSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HKHRCardioFitnessBridgeSettings *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CardioFitnessBridgeSettingsVisibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "areAllRequirementsSatisfied") & 1) != 0)
  {
    -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CardioFitnessBridgeOnboardingVisibility"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "areAllRequirementsSatisfied");

    -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CardioFitnessBridgeOnboardingEnablement"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "areAllRequirementsSatisfied");
      -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHRCardioFitnessNotificationSettingsFactory _bridgeOnboardingFooterForEvaluation::](self, "_bridgeOnboardingFooterForEvaluation::", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[HKHRCardioFitnessBridgeSettings initWithSettingVisible:settingEnabled:showOnboarding:footer:]([HKHRCardioFitnessBridgeSettings alloc], "initWithSettingVisible:settingEnabled:showOnboarding:footer:", 1, v11, 1, v13);
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CardioFitnessBridgeNotificationsEnablement"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CardioFitnessBridgeNotificationsFooter"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v10, "areAllRequirementsSatisfied");
      -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHRCardioFitnessNotificationSettingsFactory _bridgeNotificationsFooterForEvaluation::](self, "_bridgeNotificationsFooterForEvaluation::", v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = -[HKHRCardioFitnessBridgeSettings initWithSettingVisible:settingEnabled:showOnboarding:footer:]([HKHRCardioFitnessBridgeSettings alloc], "initWithSettingVisible:settingEnabled:showOnboarding:footer:", 1, v17, 0, v19);
    }

  }
  else
  {
    +[HKHRCardioFitnessBridgeSettings hiddenSettings](HKHRCardioFitnessBridgeSettings, "hiddenSettings");
    v14 = (HKHRCardioFitnessBridgeSettings *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)watchSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HKHRCardioFitnessWatchSettings *v11;

  -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CardioFitnessNanoSettingsVisibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "areAllRequirementsSatisfied") & 1) != 0)
  {
    -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CardioFitnessNanoSettingsEnablement"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "areAllRequirementsSatisfied");
    -[HKHRCardioFitnessNotificationSettingsFactory _statusTextForWatchWithEnabledState:](self, "_statusTextForWatchWithEnabledState:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHRCardioFitnessNotificationSettingsFactory _watchFooterForEvaluation::](self, "_watchFooterForEvaluation::", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[HKHRCardioFitnessWatchSettings initWithSettingVisible:settingEnabled:statusText:footer:]([HKHRCardioFitnessWatchSettings alloc], "initWithSettingVisible:settingEnabled:statusText:footer:", 1, v7, v8, v10);
  }
  else
  {
    +[HKHRCardioFitnessWatchSettings hiddenSettings](HKHRCardioFitnessWatchSettings, "hiddenSettings");
    v11 = (HKHRCardioFitnessWatchSettings *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_watchFooterForEvaluation:(id)a3 :(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  if (!objc_msgSend(v5, "areAllRequirementsSatisfied"))
  {
    objc_msgSend(v5, "highestPriorityUnsatisfiedRequirement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F80]))
    {
      -[HKHRCardioFitnessNotificationSettingsFactory _ageGatedWatchSettingFooter](self, "_ageGatedWatchSettingFooter");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4F18]))
    {
      -[HKHRCardioFitnessNotificationSettingsFactory _ageNotSetWatchSettingFooter](self, "_ageNotSetWatchSettingFooter");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_FAULT))
      -[HKHRCardioFitnessNotificationSettingsFactory _bridgeOnboardingFooterForEvaluation::].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
LABEL_10:
    -[HKHRCardioFitnessNotificationSettingsFactory _genericWatchSettingFooter](self, "_genericWatchSettingFooter");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4E68]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "areAllRequirementsSatisfied") & 1) != 0)
    goto LABEL_10;
  -[HKHRCardioFitnessNotificationSettingsFactory _pregnancyWatchSettingFooter](self, "_pregnancyWatchSettingFooter");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v16 = (void *)v8;

  return v16;
}

- (id)_statusTextForWatchWithEnabledState:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  if (a3)
  {
    -[HKHRCardioFitnessNotificationSettingsFactory featureStatus](self, "featureStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requirementsEvaluationByContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F58]);

    if (v6)
      +[_HKHeartSettingsUtilities detailStatusOnText](_HKHeartSettingsUtilities, "detailStatusOnText");
    else
      +[_HKHeartSettingsUtilities detailStatusOffText](_HKHeartSettingsUtilities, "detailStatusOffText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_HKHeartSettingsUtilities cardioFitnessUnavailableDetailText](_HKHeartSettingsUtilities, "cardioFitnessUnavailableDetailText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_genericBridgeSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRCardioFitnessFooter *v6;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessFooterDescriptionWithLink](_HKHeartSettingsUtilities, "cardioFitnessFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities cardioFitnessFooterLinkTitle](_HKHeartSettingsUtilities, "cardioFitnessFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities cardioFitnessFooterLinkURL](_HKHeartSettingsUtilities, "cardioFitnessFooterLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_wristDetectOffBridgeSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRCardioFitnessFooter *v6;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessWristDetectFooterDescriptionWithLink](_HKHeartSettingsUtilities, "cardioFitnessWristDetectFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities cardioFitnessWristDetectFooterLinkTitle](_HKHeartSettingsUtilities, "cardioFitnessWristDetectFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities cardioFitnessWristDetectFooterLinkURL](_HKHeartSettingsUtilities, "cardioFitnessWristDetectFooterLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_ageGatedBridgeSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  HKHRCardioFitnessFooter *v4;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessAgeRestrictedFooterDescription](_HKHeartSettingsUtilities, "cardioFitnessAgeRestrictedFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_ageNotSetBridgeSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRCardioFitnessFooter *v6;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessAgeDeletedFooterDescriptionWithLink](_HKHeartSettingsUtilities, "cardioFitnessAgeDeletedFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities cardioFitnessAgeDeletedFooterLinkTitle](_HKHeartSettingsUtilities, "cardioFitnessAgeDeletedFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities cardioFitnessAgeDeletedFooterLinkURL](_HKHeartSettingsUtilities, "cardioFitnessAgeDeletedFooterLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_pairedDeviceRegionGatedFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  HKHRCardioFitnessFooter *v4;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessPairedDeviceRegionGatedFooterDescription](_HKHeartSettingsUtilities, "cardioFitnessPairedDeviceRegionGatedFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_pregnancyBridgeSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRCardioFitnessFooter *v6;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessPregnantFooterDescriptionWithLink](_HKHeartSettingsUtilities, "cardioFitnessPregnantFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities cardioFitnessFooterLinkTitle](_HKHeartSettingsUtilities, "cardioFitnessFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities cardioFitnessFooterLinkURL](_HKHeartSettingsUtilities, "cardioFitnessFooterLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_genericWatchSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  HKHRCardioFitnessFooter *v4;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessFooterDescription](_HKHeartSettingsUtilities, "cardioFitnessFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_ageGatedWatchSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  HKHRCardioFitnessFooter *v4;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessAgeRestrictedFooterDescription](_HKHeartSettingsUtilities, "cardioFitnessAgeRestrictedFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_ageNotSetWatchSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  HKHRCardioFitnessFooter *v4;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessAgeDeletedFooterDescriptionWithLink](_HKHeartSettingsUtilities, "cardioFitnessAgeDeletedFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_pregnancyWatchSettingFooter
{
  HKHRCardioFitnessFooter *v2;
  void *v3;
  HKHRCardioFitnessFooter *v4;

  v2 = [HKHRCardioFitnessFooter alloc];
  +[_HKHeartSettingsUtilities cardioFitnessPregnantFooterDescription](_HKHeartSettingsUtilities, "cardioFitnessPregnantFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRCardioFitnessFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (HKFeatureStatus)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(id)a3
{
  objc_storeStrong((id *)&self->_featureStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureStatus, 0);
}

- (void)_bridgeOnboardingFooterForEvaluation:(uint64_t)a3 :(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D7781000, a2, a3, "[%{public}@] Received unknown requirement for Cardio Fitness onboarding footer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
