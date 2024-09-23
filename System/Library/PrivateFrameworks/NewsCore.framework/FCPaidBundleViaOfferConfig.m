@implementation FCPaidBundleViaOfferConfig

- (FCPaidBundleViaOfferConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCPaidBundleViaOfferConfig *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *localNotificationTitle;
  uint64_t v12;
  NSString *localNotificationSubtitle;
  uint64_t v14;
  NSString *localNotificationBody;
  uint64_t v16;
  NSString *localNotificationURL;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *vendorAdHocOfferIds;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)FCPaidBundleViaOfferConfig;
  v5 = -[FCPaidBundleViaOfferConfig init](&v28, sel_init);
  if (v5)
  {
    v6 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("iconBadgeQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    if (v6)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_iconBadgeQuiescenceInterval = v7;
    v5->_iconBadgeMaxNumberOfPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("iconBadgeMaxNumberOfPresentations"), 0);
    v8 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("localNotificationQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    if (v8)
      v9 = v8;
    else
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_localNotificationQuiescenceInterval = v9;
    v5->_localNotificationMaxNumberOfPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("localNotificationMaxNumberOfPresentations"), 0);
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("localNotificationTitle"), 0);
    v10 = objc_claimAutoreleasedReturnValue();
    localNotificationTitle = v5->_localNotificationTitle;
    v5->_localNotificationTitle = (NSString *)v10;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("localNotificationSubtitle"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
    localNotificationSubtitle = v5->_localNotificationSubtitle;
    v5->_localNotificationSubtitle = (NSString *)v12;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("localNotificationBody"), 0);
    v14 = objc_claimAutoreleasedReturnValue();
    localNotificationBody = v5->_localNotificationBody;
    v5->_localNotificationBody = (NSString *)v14;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("localNotificationURL"), 0);
    v16 = objc_claimAutoreleasedReturnValue();
    localNotificationURL = v5->_localNotificationURL;
    v5->_localNotificationURL = (NSString *)v16;

    v18 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("localNotificationDelay"), 0x7FFFFFFFFFFFFFFFLL);
    if (v18)
      v19 = v18;
    else
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_localNotificationDelay = v19;
    v20 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("upsellQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    if (v20)
      v21 = v20;
    else
      v21 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_upsellQuiescenceInterval = v21;
    v5->_upsellMaxNumberOfPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("upsellMaxNumberOfPresentations"), 0);
    v29[0] = CFSTR("1Party_HW_News_Offer_1");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("vendorAdHocOfferIds"), v22);
    v23 = objc_claimAutoreleasedReturnValue();
    vendorAdHocOfferIds = v5->_vendorAdHocOfferIds;
    v5->_vendorAdHocOfferIds = (NSArray *)v23;

    v25 = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("upsellBestOfferRefreshQuiescenceInterval"), 86400);
    if (v25)
      v26 = v25;
    else
      v26 = 86400;
    v5->_upsellBestOfferRefreshQuiescenceInterval = v26;
    v5->_paywallsEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v4, CFSTR("paywallsEnabledLevel"), 0xFFFFFFFFLL);
    v5->_subscriptionsDeeplinkEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v4, CFSTR("subscriptionsDeeplinkEnabledLevel"), 0xFFFFFFFFLL);
    v5->_mastheadBannerEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v4, CFSTR("mastheadBannerEnabledLevel"), 0xFFFFFFFFLL);
    v5->_iconBadgeEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v4, CFSTR("iconBadgeEnabledLevel"), 0);
    v5->_iconBadgeMercuryEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v4, CFSTR("iconBadgeMercuryEnabledLevel"), 0xFFFFFFFFLL);
    v5->_localNotificationEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v4, CFSTR("localNotificationEnabledLevel"), 0);
    v5->_upsellEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v4, CFSTR("upsellEnabledLevel2"), 0xFFFFFFFFLL);
    v5->_appLaunchUpsellEnabled = +[FCFeatureEnablementChecker enabledInConfig:forKey:withDefaultLevel:](FCFeatureEnablementChecker, "enabledInConfig:forKey:withDefaultLevel:", v4, CFSTR("appLaunchUpsellEnabledLevel"), 0xFFFFFFFFLL);
  }

  return v5;
}

- (BOOL)upsellEnabled
{
  return self->_upsellEnabled;
}

- (BOOL)subscriptionsDeeplinkEnabled
{
  return self->_subscriptionsDeeplinkEnabled;
}

- (BOOL)paywallsEnabled
{
  return self->_paywallsEnabled;
}

- (BOOL)mastheadBannerEnabled
{
  return self->_mastheadBannerEnabled;
}

- (BOOL)localNotificationEnabled
{
  return self->_localNotificationEnabled;
}

- (BOOL)iconBadgeMercuryEnabled
{
  return self->_iconBadgeMercuryEnabled;
}

- (BOOL)iconBadgeEnabled
{
  return self->_iconBadgeEnabled;
}

- (BOOL)appLaunchUpsellEnabled
{
  return self->_appLaunchUpsellEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorAdHocOfferIds, 0);
  objc_storeStrong((id *)&self->_localNotificationURL, 0);
  objc_storeStrong((id *)&self->_localNotificationBody, 0);
  objc_storeStrong((id *)&self->_localNotificationSubtitle, 0);
  objc_storeStrong((id *)&self->_localNotificationTitle, 0);
}

- (int64_t)iconBadgeQuiescenceInterval
{
  return self->_iconBadgeQuiescenceInterval;
}

- (void)setIconBadgeQuiescenceInterval:(int64_t)a3
{
  self->_iconBadgeQuiescenceInterval = a3;
}

- (int64_t)iconBadgeMaxNumberOfPresentations
{
  return self->_iconBadgeMaxNumberOfPresentations;
}

- (void)setIconBadgeMaxNumberOfPresentations:(int64_t)a3
{
  self->_iconBadgeMaxNumberOfPresentations = a3;
}

- (int64_t)localNotificationQuiescenceInterval
{
  return self->_localNotificationQuiescenceInterval;
}

- (void)setLocalNotificationQuiescenceInterval:(int64_t)a3
{
  self->_localNotificationQuiescenceInterval = a3;
}

- (int64_t)localNotificationMaxNumberOfPresentations
{
  return self->_localNotificationMaxNumberOfPresentations;
}

- (void)setLocalNotificationMaxNumberOfPresentations:(int64_t)a3
{
  self->_localNotificationMaxNumberOfPresentations = a3;
}

- (NSString)localNotificationTitle
{
  return self->_localNotificationTitle;
}

- (void)setLocalNotificationTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localNotificationSubtitle
{
  return self->_localNotificationSubtitle;
}

- (void)setLocalNotificationSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)localNotificationBody
{
  return self->_localNotificationBody;
}

- (void)setLocalNotificationBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)localNotificationURL
{
  return self->_localNotificationURL;
}

- (void)setLocalNotificationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)localNotificationDelay
{
  return self->_localNotificationDelay;
}

- (void)setLocalNotificationDelay:(int64_t)a3
{
  self->_localNotificationDelay = a3;
}

- (int64_t)upsellQuiescenceInterval
{
  return self->_upsellQuiescenceInterval;
}

- (void)setUpsellQuiescenceInterval:(int64_t)a3
{
  self->_upsellQuiescenceInterval = a3;
}

- (int64_t)upsellMaxNumberOfPresentations
{
  return self->_upsellMaxNumberOfPresentations;
}

- (void)setUpsellMaxNumberOfPresentations:(int64_t)a3
{
  self->_upsellMaxNumberOfPresentations = a3;
}

- (NSArray)vendorAdHocOfferIds
{
  return self->_vendorAdHocOfferIds;
}

- (void)setVendorAdHocOfferIds:(id)a3
{
  objc_storeStrong((id *)&self->_vendorAdHocOfferIds, a3);
}

- (int64_t)upsellBestOfferRefreshQuiescenceInterval
{
  return self->_upsellBestOfferRefreshQuiescenceInterval;
}

@end
