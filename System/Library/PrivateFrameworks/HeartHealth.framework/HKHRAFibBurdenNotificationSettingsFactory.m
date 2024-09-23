@implementation HKHRAFibBurdenNotificationSettingsFactory

- (HKHRAFibBurdenNotificationSettingsFactory)initWithFeatureStatus:(id)a3
{
  id v4;
  HKHRAFibBurdenNotificationSettingsFactory *v5;
  HKHRAFibBurdenNotificationSettingsFactory *v6;
  HKHRAFibBurdenNotificationSettingsFactory *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenNotificationSettingsFactory;
  v5 = -[HKHRAFibBurdenNotificationSettingsFactory init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HKHRAFibBurdenNotificationSettingsFactory setFeatureStatus:](v5, "setFeatureStatus:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)bridgeSettings
{
  _BOOL8 v3;
  void *v4;
  HKHRAFibBurdenBridgeSettings *v5;
  void *v6;
  HKHRAFibBurdenBridgeSettings *v7;
  uint64_t v8;
  HKHRAFibBurdenBridgeSettings *v9;
  int v10;
  int v11;
  char v12;
  BOOL v13;
  char v14;
  char v15;
  char v16;
  char v17;
  int v18;
  char v19;
  char v20;
  NSObject *v21;
  HKHRAFibBurdenBridgeSettings *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  HKHRAFibBurdenBridgeSettings *v26;

  v3 = -[HKHRAFibBurdenNotificationSettingsFactory _isOnboarded](self, "_isOnboarded");
  -[HKHRAFibBurdenNotificationSettingsFactory _evaluationForIsOnboarded:](self, "_evaluationForIsOnboarded:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HKHRAFibBurdenNotificationSettingsFactory _isFeatureOnboardedAndAvailableWithIsOnboarded:requirementsEvaluation:](self, "_isFeatureOnboardedAndAvailableWithIsOnboarded:requirementsEvaluation:", v3, v4))
  {
    v10 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F68]);
    v11 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F80]);
    v12 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F20]);
    if (v10)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (v13 || (v12 & 1) == 0)
      goto LABEL_31;
    v14 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F70]);
    v15 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F50]);
    v16 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FC0]);
    v17 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FD0]);
    v18 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F38]);
    v19 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F30]);
    v20 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F78]);
    if (v18 && (v19 & 1) != 0)
    {
      if ((v15 & 1) != 0)
      {
        if ((v16 & 1) != 0)
        {
          if ((v14 & 1) != 0)
          {
            if ((v17 & 1) != 0)
            {
              if ((v20 & 1) != 0)
              {
                if (v3)
                {
                  _HKInitializeLogging();
                  HKHRAFibBurdenLogForCategory(2);
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
                    -[HKHRAFibBurdenNotificationSettingsFactory bridgeSettings].cold.1();
                }
                else
                {
                  if (objc_msgSend(v4, "areAllRequirementsSatisfied"))
                  {
                    v26 = [HKHRAFibBurdenBridgeSettings alloc];
                    -[HKHRAFibBurdenNotificationSettingsFactory _genericBridgeSettingFooter](self, "_genericBridgeSettingFooter");
                    v6 = (void *)objc_claimAutoreleasedReturnValue();
                    v7 = v26;
                    v8 = 1;
                    goto LABEL_3;
                  }
                  _HKInitializeLogging();
                  HKHRAFibBurdenLogForCategory(2);
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
                    -[HKHRAFibBurdenNotificationSettingsFactory bridgeSettings].cold.2();
                }

LABEL_31:
                +[HKHRAFibBurdenBridgeSettings hiddenSettings](HKHRAFibBurdenBridgeSettings, "hiddenSettings");
                v9 = (HKHRAFibBurdenBridgeSettings *)objc_claimAutoreleasedReturnValue();
                goto LABEL_32;
              }
              v22 = [HKHRAFibBurdenBridgeSettings alloc];
              v23 = v3 ^ 1;
              -[HKHRAFibBurdenNotificationSettingsFactory _irnEnabledBridgeSettingFooter](self, "_irnEnabledBridgeSettingFooter");
              v24 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v22 = [HKHRAFibBurdenBridgeSettings alloc];
              v23 = v3 ^ 1;
              -[HKHRAFibBurdenNotificationSettingsFactory _wristDetectDisabledBridgeSettingFooter](self, "_wristDetectDisabledBridgeSettingFooter");
              v24 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v22 = [HKHRAFibBurdenBridgeSettings alloc];
            v23 = v3 ^ 1;
            -[HKHRAFibBurdenNotificationSettingsFactory _genericBridgeSettingFooter](self, "_genericBridgeSettingFooter");
            v24 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v22 = [HKHRAFibBurdenBridgeSettings alloc];
          v23 = v3 ^ 1;
          -[HKHRAFibBurdenNotificationSettingsFactory _seedExpiryBridgeSettingFooter](self, "_seedExpiryBridgeSettingFooter");
          v24 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v22 = [HKHRAFibBurdenBridgeSettings alloc];
        v23 = v3 ^ 1;
        -[HKHRAFibBurdenNotificationSettingsFactory _remoteDisabledBridgeSettingFooter](self, "_remoteDisabledBridgeSettingFooter");
        v24 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v22 = [HKHRAFibBurdenBridgeSettings alloc];
      v23 = v3 ^ 1;
      -[HKHRAFibBurdenNotificationSettingsFactory _deviceRegionGatedBridgeSettingFooter](self, "_deviceRegionGatedBridgeSettingFooter");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v24;
    v9 = -[HKHRAFibBurdenBridgeSettings initWithSettingVisible:settingEnabled:showOnboarding:footer:](v22, "initWithSettingVisible:settingEnabled:showOnboarding:footer:", 1, 0, v23, v24);

    goto LABEL_32;
  }
  v5 = [HKHRAFibBurdenBridgeSettings alloc];
  -[HKHRAFibBurdenNotificationSettingsFactory _genericBridgeSettingFooter](self, "_genericBridgeSettingFooter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = 0;
LABEL_3:
  v9 = -[HKHRAFibBurdenBridgeSettings initWithSettingVisible:settingEnabled:showOnboarding:footer:](v7, "initWithSettingVisible:settingEnabled:showOnboarding:footer:", 1, 1, v8, v6);

LABEL_32:
  return v9;
}

- (id)_genericBridgeSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRAFibBurdenFooter *v6;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenFooterDescriptionWithLink](_HKHeartSettingsUtilities, "aFibBurdenFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities aFibBurdenFooterLinkTitle](_HKHeartSettingsUtilities, "aFibBurdenFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities aFibBurdenDefaultLinkURL](_HKHeartSettingsUtilities, "aFibBurdenDefaultLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_wristDetectDisabledBridgeSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRAFibBurdenFooter *v6;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenWristDetectFooterDescriptionWithLink](_HKHeartSettingsUtilities, "aFibBurdenWristDetectFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities aFibBurdenWristDetectFooterLinkTitle](_HKHeartSettingsUtilities, "aFibBurdenWristDetectFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities aFibBurdenWristDetectFooterLinkURL](_HKHeartSettingsUtilities, "aFibBurdenWristDetectFooterLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_deviceRegionGatedBridgeSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRAFibBurdenFooter *v6;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenRegionNotSupportedFooterDescriptionWithLink](_HKHeartSettingsUtilities, "aFibBurdenRegionNotSupportedFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities remoteDisabledLinkTitle](_HKHeartSettingsUtilities, "remoteDisabledLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities remoteDisabledLinkURL](_HKHeartSettingsUtilities, "remoteDisabledLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_irnEnabledBridgeSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRAFibBurdenFooter *v6;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenIRNEnabledFooterDescriptionWithLink](_HKHeartSettingsUtilities, "aFibBurdenIRNEnabledFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities aFibBurdenFooterLinkTitle](_HKHeartSettingsUtilities, "aFibBurdenFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities aFibBurdenDefaultLinkURL](_HKHeartSettingsUtilities, "aFibBurdenDefaultLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_remoteDisabledBridgeSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRAFibBurdenFooter *v6;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenRemoteDisabledFooterDescriptionWithLink](_HKHeartSettingsUtilities, "aFibBurdenRemoteDisabledFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities remoteDisabledLinkTitle](_HKHeartSettingsUtilities, "remoteDisabledLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities remoteDisabledLinkURL](_HKHeartSettingsUtilities, "remoteDisabledLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)_seedExpiryBridgeSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  void *v4;
  void *v5;
  HKHRAFibBurdenFooter *v6;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenSeedExpiryFooterDescriptionWithLink](_HKHeartSettingsUtilities, "aFibBurdenSeedExpiryFooterDescriptionWithLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities seedExpiredLinkTitle](_HKHeartSettingsUtilities, "seedExpiredLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities seedExpiredLinkURL](_HKHeartSettingsUtilities, "seedExpiredLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, v4, v5);

  return v6;
}

- (id)watchSettings
{
  _BOOL8 v3;
  void *v4;
  int v5;
  HKHRAFibBurdenWatchSettings *v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  char v11;
  char v12;
  char v13;
  char v14;
  int v15;
  char v16;
  NSObject *v17;
  HKHRAFibBurdenWatchSettings *v18;
  void *v19;
  void *v20;
  HKHRAFibBurdenWatchSettings *v21;
  uint64_t v22;
  void *v23;

  v3 = -[HKHRAFibBurdenNotificationSettingsFactory _isOnboarded](self, "_isOnboarded");
  -[HKHRAFibBurdenNotificationSettingsFactory _evaluationForIsOnboarded:](self, "_evaluationForIsOnboarded:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKHRAFibBurdenNotificationSettingsFactory _isFeatureOnboardedAndAvailableWithIsOnboarded:requirementsEvaluation:](self, "_isFeatureOnboardedAndAvailableWithIsOnboarded:requirementsEvaluation:", v3, v4))
  {
    v5 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F58]);
    v6 = [HKHRAFibBurdenWatchSettings alloc];
    if (v5)
      +[_HKHeartSettingsUtilities detailStatusOnText](_HKHeartSettingsUtilities, "detailStatusOnText");
    else
      +[_HKHeartSettingsUtilities detailStatusOffText](_HKHeartSettingsUtilities, "detailStatusOffText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHRAFibBurdenNotificationSettingsFactory _genericWatchSettingFooter](self, "_genericWatchSettingFooter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HKHRAFibBurdenWatchSettings initWithSettingVisible:settingEnabled:statusText:footer:](v6, "initWithSettingVisible:settingEnabled:statusText:footer:", 1, 1, v19, v20);

    goto LABEL_22;
  }
  v7 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F68]);
  v8 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F70]);
  v9 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F80]);
  v10 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F20]);
  v11 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FD0]);
  if (v3 & v7 & v8 & v9 & v10 && (v11 & 1) != 0)
  {
    v12 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F78]);
    v13 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F50]);
    v14 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4FC0]);
    v15 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F38]);
    v16 = objc_msgSend(v4, "isRequirementSatisfiedWithIdentifier:", *MEMORY[0x1E0CB4F30]);
    if (v15 && (v16 & 1) != 0)
    {
      if ((v13 & 1) != 0)
      {
        if ((v14 & 1) != 0)
        {
          if ((v12 & 1) != 0)
          {
            _HKInitializeLogging();
            HKHRAFibBurdenLogForCategory(2);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
              -[HKHRAFibBurdenNotificationSettingsFactory watchSettings].cold.1();

            goto LABEL_14;
          }
          v21 = [HKHRAFibBurdenWatchSettings alloc];
          +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText](_HKHeartSettingsUtilities, "aFibBurdenUnavailableDetailText");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHRAFibBurdenNotificationSettingsFactory _irnEnabledWatchSettingFooter](self, "_irnEnabledWatchSettingFooter");
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = [HKHRAFibBurdenWatchSettings alloc];
          +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText](_HKHeartSettingsUtilities, "aFibBurdenUnavailableDetailText");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHRAFibBurdenNotificationSettingsFactory _seedExpiryWatchSettingFooter](self, "_seedExpiryWatchSettingFooter");
          v22 = objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v21 = [HKHRAFibBurdenWatchSettings alloc];
        +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText](_HKHeartSettingsUtilities, "aFibBurdenUnavailableDetailText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKHRAFibBurdenNotificationSettingsFactory _remoteDisabledWatchSettingFooter](self, "_remoteDisabledWatchSettingFooter");
        v22 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v21 = [HKHRAFibBurdenWatchSettings alloc];
      +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText](_HKHeartSettingsUtilities, "aFibBurdenUnavailableDetailText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHRAFibBurdenNotificationSettingsFactory _deviceRegionGatedWatchSettingFooter](self, "_deviceRegionGatedWatchSettingFooter");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;
    v18 = -[HKHRAFibBurdenWatchSettings initWithSettingVisible:settingEnabled:statusText:footer:](v21, "initWithSettingVisible:settingEnabled:statusText:footer:", 1, 0, v19, v22);

LABEL_22:
    goto LABEL_23;
  }
LABEL_14:
  +[HKHRAFibBurdenWatchSettings hiddenSettings](HKHRAFibBurdenWatchSettings, "hiddenSettings");
  v18 = (HKHRAFibBurdenWatchSettings *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v18;
}

- (id)_genericWatchSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  HKHRAFibBurdenFooter *v4;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenFooterDescription](_HKHeartSettingsUtilities, "aFibBurdenFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_deviceRegionGatedWatchSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  HKHRAFibBurdenFooter *v4;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenRegionNotSupportedFooterDescription](_HKHeartSettingsUtilities, "aFibBurdenRegionNotSupportedFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_irnEnabledWatchSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  HKHRAFibBurdenFooter *v4;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenIRNEnabledFooterDescriptionWatch](_HKHeartSettingsUtilities, "aFibBurdenIRNEnabledFooterDescriptionWatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_remoteDisabledWatchSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  HKHRAFibBurdenFooter *v4;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenRemoteDisabledFooterDescriptionWatch](_HKHeartSettingsUtilities, "aFibBurdenRemoteDisabledFooterDescriptionWatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (id)_seedExpiryWatchSettingFooter
{
  HKHRAFibBurdenFooter *v2;
  void *v3;
  HKHRAFibBurdenFooter *v4;

  v2 = [HKHRAFibBurdenFooter alloc];
  +[_HKHeartSettingsUtilities aFibBurdenSeedExpiryFooterDescriptionWatch](_HKHeartSettingsUtilities, "aFibBurdenSeedExpiryFooterDescriptionWatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKHRAFibBurdenFooter initWithText:link:url:](v2, "initWithText:link:url:", v3, 0, 0);

  return v4;
}

- (BOOL)_isOnboarded
{
  void *v3;
  BOOL v4;

  if (!-[HKFeatureStatus isOnboardingRecordPresent](self->_featureStatus, "isOnboardingRecordPresent"))
    return 0;
  -[HKFeatureStatus onboardingRecord](self->_featureStatus, "onboardingRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "onboardingState") != 1;

  return v4;
}

- (id)_evaluationForIsOnboarded:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;

  v3 = a3;
  -[HKFeatureStatus requirementsEvaluationByContext](self->_featureStatus, "requirementsEvaluationByContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (_QWORD *)MEMORY[0x1E0CB4ED0];
  if (!v3)
    v6 = (_QWORD *)MEMORY[0x1E0CB4E88];
  objc_msgSend(v4, "objectForKeyedSubscript:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isFeatureOnboardedAndAvailableWithIsOnboarded:(BOOL)a3 requirementsEvaluation:(id)a4
{
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(a4, "unsatisfiedRequirementIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v8[0] = *MEMORY[0x1E0CB4F58];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
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

- (void)bridgeSettings
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3_0();
  v1 = OUTLINED_FUNCTION_2_0(v0);
  OUTLINED_FUNCTION_0_3(&dword_1D7781000, v2, v3, "[%@]: Requested settings for an un-handled pre-onboarding state", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_2();
}

- (void)watchSettings
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3_0();
  v1 = OUTLINED_FUNCTION_2_0(v0);
  OUTLINED_FUNCTION_0_3(&dword_1D7781000, v2, v3, "[%@]: Requested watch settings for an un-handled notification state", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_2();
}

@end
