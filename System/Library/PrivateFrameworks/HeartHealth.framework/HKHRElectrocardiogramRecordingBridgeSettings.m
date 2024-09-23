@implementation HKHRElectrocardiogramRecordingBridgeSettings

- (HKHRElectrocardiogramRecordingBridgeSettings)initWithFeatureStatus:(id)a3 isAppInstalled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HKHRElectrocardiogramRecordingBridgeSettings *v7;
  HKHRElectrocardiogramRecordingBridgeSettings *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  HKHRElectrocardiogramRecordingFooter *footer;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHRElectrocardiogramRecordingBridgeSettings;
  v7 = -[HKHRElectrocardiogramRecordingBridgeSettings init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = -[HKHRElectrocardiogramRecordingBridgeSettings _isSettingsVisibleWithFeatureStatus:](v7, "_isSettingsVisibleWithFeatureStatus:", v6);
    v8->_settingVisible = v9;
    if (v9)
      v10 = !-[HKHRElectrocardiogramRecordingBridgeSettings _featureOnboardedWithFeatureStatus:](v8, "_featureOnboardedWithFeatureStatus:", v6);
    else
      LOBYTE(v10) = 0;
    v8->_showOnboarding = v10;
    v8->_userInteractionEnabled = -[HKHRElectrocardiogramRecordingBridgeSettings _userInteractionEnabledWithFeatureStatus:](v8, "_userInteractionEnabledWithFeatureStatus:", v6);
    -[HKHRElectrocardiogramRecordingBridgeSettings _footerWithFeatureStatus:isAppInstalled:](v8, "_footerWithFeatureStatus:isAppInstalled:", v6, v4);
    v11 = objc_claimAutoreleasedReturnValue();
    footer = v8->_footer;
    v8->_footer = (HKHRElectrocardiogramRecordingFooter *)v11;

  }
  return v8;
}

- (BOOL)_userInteractionEnabledWithFeatureStatus:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4EA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_settingVisible)
    v6 = objc_msgSend(v4, "areAllRequirementsSatisfied");
  else
    v6 = 0;

  return v6;
}

- (BOOL)_featureOnboardedWithFeatureStatus:(id)a3
{
  return objc_msgSend(a3, "isOnboardingRecordPresent");
}

- (id)_footerWithFeatureStatus:(id)a3 isAppInstalled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  HKHRElectrocardiogramRecordingFooter *v14;
  void *v15;
  int v16;
  void *v17;
  __CFString *v18;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4ED0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_settingVisible)
  {
    objc_msgSend(v7, "unsatisfiedRequirementIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0CB4F50]);

    if (v10)
    {
      HKHeartRateLocalizedString(CFSTR("FEATURE_DISABLED_REMOTELY_CINNAMON"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_HKHeartSettingsUtilities remoteDisabledLinkTitle](_HKHeartSettingsUtilities, "remoteDisabledLinkTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)*MEMORY[0x1E0CB4D48];
    }
    else
    {
      objc_msgSend(v8, "unsatisfiedRequirementIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0CB4FC0]);

      if (!v16)
      {
        if (-[HKHRElectrocardiogramRecordingBridgeSettings _featureOnboardedWithFeatureStatus:](self, "_featureOnboardedWithFeatureStatus:", v6))
        {
          if (v4)
            v18 = CFSTR("ELECTROCARDIOGRAM_FOOTER_ONBOARDING_COMPLETED");
          else
            v18 = CFSTR("ELECTROCARDIOGRAM_FOOTER_ONBOARDING_COMPLETED_APP_NOT_INSTALLED");
        }
        else
        {
          v18 = CFSTR("ELECTROCARDIOGRAM_FOOTER");
        }
        HKHeartRateLocalizedString(v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 0;
        v17 = 0;
        goto LABEL_14;
      }
      HKHeartRateLocalizedString(CFSTR("FEATURE_SEED_EXPIRED_CINNAMON"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_HKHeartSettingsUtilities seedExpiredLinkTitle](_HKHeartSettingsUtilities, "seedExpiredLinkTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[_HKHeartSettingsUtilities seedExpiredLinkURL](_HKHeartSettingsUtilities, "seedExpiredLinkURL");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v13;
LABEL_14:
    v14 = -[HKHRElectrocardiogramRecordingFooter initWithText:link:url:]([HKHRElectrocardiogramRecordingFooter alloc], "initWithText:link:url:", v11, v12, v17);

    goto LABEL_15;
  }
  v14 = -[HKHRElectrocardiogramRecordingFooter initWithText:link:url:]([HKHRElectrocardiogramRecordingFooter alloc], "initWithText:link:url:", 0, 0, 0);
LABEL_15:

  return v14;
}

- (BOOL)_isSettingsVisibleWithFeatureStatus:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB4EA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "areAllRequirementsSatisfied");

  return v4;
}

- (BOOL)settingVisible
{
  return self->_settingVisible;
}

- (BOOL)showOnboarding
{
  return self->_showOnboarding;
}

- (BOOL)userInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (HKHRElectrocardiogramRecordingFooter)footer
{
  return self->_footer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
}

@end
