@implementation FCSmarterMessagingConfig

- (NSArray)segmentSetIdsAllowlist
{
  return self->_segmentSetIdsAllowlist;
}

- (NSArray)placementsBlocklist
{
  return self->_placementsBlocklist;
}

- (int64_t)mediumChurnPropensitySegmentSetId
{
  return self->_mediumChurnPropensitySegmentSetId;
}

- (int64_t)lowChurnPropensitySegmentSetId
{
  return self->_lowChurnPropensitySegmentSetId;
}

- (int64_t)highChurnPropensitySegmentSetId
{
  return self->_highChurnPropensitySegmentSetId;
}

- (NSDictionary)engagementUpsellConfig
{
  return self->_engagementUpsellConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puzzleHubInfoBubbleTipIconUrl, 0);
  objc_storeStrong((id *)&self->_puzzleHubInfoBubbleTipBody, 0);
  objc_storeStrong((id *)&self->_puzzleHubInfoBubbleTipTitle, 0);
  objc_storeStrong((id *)&self->_engagementUpsellConfig, 0);
  objc_storeStrong((id *)&self->_placementsBlocklist, 0);
  objc_storeStrong((id *)&self->_segmentSetIdsAllowlist, 0);
}

- (FCSmarterMessagingConfig)initWithDictionary:(id)a3
{
  id v4;
  FCSmarterMessagingConfig *v5;
  uint64_t v6;
  NSArray *segmentSetIdsAllowlist;
  uint64_t v8;
  NSArray *placementsBlocklist;
  uint64_t v10;
  NSDictionary *engagementUpsellConfig;
  uint64_t v12;
  NSString *puzzleHubInfoBubbleTipBody;
  uint64_t v14;
  NSString *puzzleHubInfoBubbleTipTitle;
  uint64_t v16;
  NSString *puzzleHubInfoBubbleTipIconUrl;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FCSmarterMessagingConfig;
  v5 = -[FCSmarterMessagingConfig init](&v19, sel_init);
  if (v5)
  {
    v5->_lowChurnPropensitySegmentSetId = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("lowChurnPropensitySegmentSetId"), 0);
    v5->_mediumChurnPropensitySegmentSetId = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("mediumChurnPropensitySegmentSetId"), 0);
    v5->_highChurnPropensitySegmentSetId = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("highChurnPropensitySegmentSetId"), 0);
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("segmentSetIdsAllowlist"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
    segmentSetIdsAllowlist = v5->_segmentSetIdsAllowlist;
    v5->_segmentSetIdsAllowlist = (NSArray *)v6;

    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("placementsBlocklist"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    placementsBlocklist = v5->_placementsBlocklist;
    v5->_placementsBlocklist = (NSArray *)v8;

    v5->_todayFeedMastheadBannerEnabledForSubscribers = FCAppConfigurationBoolValue(v4, (uint64_t)CFSTR("todayFeedMastheadBannerEnabledForSubscribers"), 0);
    FCAppConfigurationDictionaryValueWithDefaultValue(v4, (uint64_t)CFSTR("engagementUpsellConfig2"), 0);
    v10 = objc_claimAutoreleasedReturnValue();
    engagementUpsellConfig = v5->_engagementUpsellConfig;
    v5->_engagementUpsellConfig = (NSDictionary *)v10;

    v5->_maxEnableNotificationBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxEnableNotificationBubbleTipPresentations"), 0);
    v5->_notificationBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("notificationBubbleTipPresentationsQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_maxSportsOnboardingBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxSportsOnboardingBubbleTipPresentations"), 0);
    v5->_sportsBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("sportsBubbleTipPresentationsQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_maxSportsScoresBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxSportsScoresBubbleTipPresentations"), 0);
    v5->_sportsScoresBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("sportsScoresBubbleTipPresentationsQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_maxShortcutsBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxShortcutsBubbleTipPresentations"), 0);
    v5->_shortcutsBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("shortcutsBubbleTipPresentationsQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    v5->_maxPuzzleHubInfoBubbleTipPresentations = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("maxPuzzleHubInfoBubbleTipPresentations"), 0);
    v5->_puzzleHubInfoBubbleTipPresentationsQuiescenceInterval = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("puzzleHubInfoBubbleTipPresentationsQuiescenceInterval"), 0x7FFFFFFFFFFFFFFFLL);
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("puzzleHubInfoBubbleTipBody"), 0);
    v12 = objc_claimAutoreleasedReturnValue();
    puzzleHubInfoBubbleTipBody = v5->_puzzleHubInfoBubbleTipBody;
    v5->_puzzleHubInfoBubbleTipBody = (NSString *)v12;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("puzzleHubInfoBubbleTipTitle"), 0);
    v14 = objc_claimAutoreleasedReturnValue();
    puzzleHubInfoBubbleTipTitle = v5->_puzzleHubInfoBubbleTipTitle;
    v5->_puzzleHubInfoBubbleTipTitle = (NSString *)v14;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("puzzleHubInfoBubbleTipIconUrl"), 0);
    v16 = objc_claimAutoreleasedReturnValue();
    puzzleHubInfoBubbleTipIconUrl = v5->_puzzleHubInfoBubbleTipIconUrl;
    v5->_puzzleHubInfoBubbleTipIconUrl = (NSString *)v16;

  }
  return v5;
}

- (BOOL)todayFeedMastheadBannerEnabledForSubscribers
{
  return self->_todayFeedMastheadBannerEnabledForSubscribers;
}

- (int64_t)maxEnableNotificationBubbleTipPresentations
{
  return self->_maxEnableNotificationBubbleTipPresentations;
}

- (int64_t)notificationBubbleTipPresentationsQuiescenceInterval
{
  return self->_notificationBubbleTipPresentationsQuiescenceInterval;
}

- (int64_t)maxSportsOnboardingBubbleTipPresentations
{
  return self->_maxSportsOnboardingBubbleTipPresentations;
}

- (int64_t)sportsBubbleTipPresentationsQuiescenceInterval
{
  return self->_sportsBubbleTipPresentationsQuiescenceInterval;
}

- (int64_t)maxSportsScoresBubbleTipPresentations
{
  return self->_maxSportsScoresBubbleTipPresentations;
}

- (int64_t)sportsScoresBubbleTipPresentationsQuiescenceInterval
{
  return self->_sportsScoresBubbleTipPresentationsQuiescenceInterval;
}

- (int64_t)maxShortcutsBubbleTipPresentations
{
  return self->_maxShortcutsBubbleTipPresentations;
}

- (int64_t)shortcutsBubbleTipPresentationsQuiescenceInterval
{
  return self->_shortcutsBubbleTipPresentationsQuiescenceInterval;
}

- (int64_t)maxPuzzleHubInfoBubbleTipPresentations
{
  return self->_maxPuzzleHubInfoBubbleTipPresentations;
}

- (int64_t)puzzleHubInfoBubbleTipPresentationsQuiescenceInterval
{
  return self->_puzzleHubInfoBubbleTipPresentationsQuiescenceInterval;
}

- (NSString)puzzleHubInfoBubbleTipTitle
{
  return self->_puzzleHubInfoBubbleTipTitle;
}

- (void)setPuzzleHubInfoBubbleTipTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)puzzleHubInfoBubbleTipBody
{
  return self->_puzzleHubInfoBubbleTipBody;
}

- (void)setPuzzleHubInfoBubbleTipBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)puzzleHubInfoBubbleTipIconUrl
{
  return self->_puzzleHubInfoBubbleTipIconUrl;
}

- (void)setPuzzleHubInfoBubbleTipIconUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

@end
