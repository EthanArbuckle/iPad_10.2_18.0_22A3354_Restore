@implementation NTPBConfig

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBConfig;
  -[NTPBConfig dealloc](&v3, sel_dealloc);
}

- (BOOL)hasFallbackLanguageTag
{
  return self->_fallbackLanguageTag != 0;
}

- (void)clearLanguageConfigs
{
  -[NSMutableArray removeAllObjects](self->_languageConfigs, "removeAllObjects");
}

- (void)addLanguageConfigs:(id)a3
{
  id v4;
  NSMutableArray *languageConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  languageConfigs = self->_languageConfigs;
  v8 = v4;
  if (!languageConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_languageConfigs;
    self->_languageConfigs = v6;

    v4 = v8;
    languageConfigs = self->_languageConfigs;
  }
  -[NSMutableArray addObject:](languageConfigs, "addObject:", v4);

}

- (unint64_t)languageConfigsCount
{
  return -[NSMutableArray count](self->_languageConfigs, "count");
}

- (id)languageConfigsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_languageConfigs, "objectAtIndex:", a3);
}

+ (Class)languageConfigsType
{
  return (Class)objc_opt_class();
}

- (void)setShortReminderTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_shortReminderTime = a3;
}

- (void)setHasShortReminderTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasShortReminderTime
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (void)setLongReminderTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_longReminderTime = a3;
}

- (void)setHasLongReminderTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasLongReminderTime
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (void)setNewsletterSubscriptionChecked:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x80u;
  self->_newsletterSubscriptionChecked = a3;
}

- (void)setHasNewsletterSubscriptionChecked:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v3;
}

- (BOOL)hasNewsletterSubscriptionChecked
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (void)setBatchedFeedTimeout:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_batchedFeedTimeout = a3;
}

- (void)setHasBatchedFeedTimeout:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasBatchedFeedTimeout
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setInterstitialAdLoadDelay:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_interstitialAdLoadDelay = a3;
}

- (void)setHasInterstitialAdLoadDelay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasInterstitialAdLoadDelay
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (void)setPrerollLoadingTimeout:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_prerollLoadingTimeout = a3;
}

- (void)setHasPrerollLoadingTimeout:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasPrerollLoadingTimeout
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (void)clearEndpointConfigs
{
  -[NSMutableArray removeAllObjects](self->_endpointConfigs, "removeAllObjects");
}

- (void)addEndpointConfigs:(id)a3
{
  id v4;
  NSMutableArray *endpointConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  endpointConfigs = self->_endpointConfigs;
  v8 = v4;
  if (!endpointConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_endpointConfigs;
    self->_endpointConfigs = v6;

    v4 = v8;
    endpointConfigs = self->_endpointConfigs;
  }
  -[NSMutableArray addObject:](endpointConfigs, "addObject:", v4);

}

- (unint64_t)endpointConfigsCount
{
  return -[NSMutableArray count](self->_endpointConfigs, "count");
}

- (id)endpointConfigsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_endpointConfigs, "objectAtIndex:", a3);
}

+ (Class)endpointConfigsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPersonalizationConfig
{
  return self->_personalizationConfig != 0;
}

- (BOOL)hasIadConfig
{
  return self->_iadConfig != 0;
}

- (BOOL)hasPrefetchConfig
{
  return self->_prefetchConfig != 0;
}

- (void)setTileProminenceScoreBalanceValue:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_tileProminenceScoreBalanceValue = a3;
}

- (void)setHasTileProminenceScoreBalanceValue:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTileProminenceScoreBalanceValue
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (void)setMinimumArticleUpdateInterval:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_minimumArticleUpdateInterval = a3;
}

- (void)setHasMinimumArticleUpdateInterval:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasMinimumArticleUpdateInterval
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (void)setInitialArticlesFromNewFavorite:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_initialArticlesFromNewFavorite = a3;
}

- (void)setHasInitialArticlesFromNewFavorite:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasInitialArticlesFromNewFavorite
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (void)setAutoScrollToTopFeedTimeout:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_autoScrollToTopFeedTimeout = a3;
}

- (void)setHasAutoScrollToTopFeedTimeout:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasAutoScrollToTopFeedTimeout
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setTrendingTopicsRefreshRate:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_trendingTopicsRefreshRate = a3;
}

- (void)setHasTrendingTopicsRefreshRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTrendingTopicsRefreshRate
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)setAppConfigRefreshRate:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_appConfigRefreshRate = a3;
}

- (void)setHasAppConfigRefreshRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasAppConfigRefreshRate
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (void)setMinimumDistanceBetweenImageOnTopTiles:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_minimumDistanceBetweenImageOnTopTiles = a3;
}

- (void)setHasMinimumDistanceBetweenImageOnTopTiles:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasMinimumDistanceBetweenImageOnTopTiles
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
}

- (void)setTimeBetweenWidgetInsertions:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_timeBetweenWidgetInsertions = a3;
}

- (void)setHasTimeBetweenWidgetInsertions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTimeBetweenWidgetInsertions
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (void)setTimeBetweenSameWidgetReinsertion:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_timeBetweenSameWidgetReinsertion = a3;
}

- (void)setHasTimeBetweenSameWidgetReinsertion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTimeBetweenSameWidgetReinsertion
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (void)setNumberOfScreenfulsScrolledToBypassWidgetTimeLimit:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit = a3;
}

- (void)setHasNumberOfScreenfulsScrolledToBypassWidgetTimeLimit:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasNumberOfScreenfulsScrolledToBypassWidgetTimeLimit
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
}

- (void)setArticleRapidUpdatesTimeout:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_articleRapidUpdatesTimeout = a3;
}

- (void)setHasArticleRapidUpdatesTimeout:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasArticleRapidUpdatesTimeout
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (void)setSubscriptionsGlobalMeteredCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_subscriptionsGlobalMeteredCount = a3;
}

- (void)setHasSubscriptionsGlobalMeteredCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsGlobalMeteredCount
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (BOOL)hasAnfEmbedConfigurationAsset
{
  return self->_anfEmbedConfigurationAsset != 0;
}

- (void)setSubscriptionsPlacardPublisherFrequencyDays:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_subscriptionsPlacardPublisherFrequencyDays = a3;
}

- (void)setHasSubscriptionsPlacardPublisherFrequencyDays:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsPlacardPublisherFrequencyDays
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (void)setSubscriptionsPlacardGlobalMaxPerDay:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_subscriptionsPlacardGlobalMaxPerDay = a3;
}

- (void)setHasSubscriptionsPlacardGlobalMaxPerDay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsPlacardGlobalMaxPerDay
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setSubscriptionsGracePeriodForTokenVerificationSeconds:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_subscriptionsGracePeriodForTokenVerificationSeconds = a3;
}

- (void)setHasSubscriptionsGracePeriodForTokenVerificationSeconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsGracePeriodForTokenVerificationSeconds
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (void)setNewFavoriteNotificationAlertsFrequency:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_newFavoriteNotificationAlertsFrequency = a3;
}

- (void)setHasNewFavoriteNotificationAlertsFrequency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasNewFavoriteNotificationAlertsFrequency
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (void)setEndOfArticleMinPaidHeadlineRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_endOfArticleMinPaidHeadlineRatio = a3;
}

- (void)setHasEndOfArticleMinPaidHeadlineRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasEndOfArticleMinPaidHeadlineRatio
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (void)setEndOfArticleMaxInaccessiblePaidArticles:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_endOfArticleMaxInaccessiblePaidArticles = a3;
}

- (void)setHasEndOfArticleMaxInaccessiblePaidArticles:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasEndOfArticleMaxInaccessiblePaidArticles
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasWidgetConfig
{
  return self->_widgetConfig != 0;
}

- (void)setUniversalLinksEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x400u;
  self->_universalLinksEnabled = a3;
}

- (void)setHasUniversalLinksEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFBFF | v3;
}

- (BOOL)hasUniversalLinksEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 10) & 1;
}

- (void)setNotificationArticleCacheTimeout:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_notificationArticleCacheTimeout = a3;
}

- (void)setHasNotificationArticleCacheTimeout:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasNotificationArticleCacheTimeout
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (void)setNotificationArticleWithRapidUpdatesCacheTimeout:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_notificationArticleWithRapidUpdatesCacheTimeout = a3;
}

- (void)setHasNotificationArticleWithRapidUpdatesCacheTimeout:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasNotificationArticleWithRapidUpdatesCacheTimeout
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (BOOL)hasForYouNonPersonalizedGroupsOrder
{
  return self->_forYouNonPersonalizedGroupsOrder != 0;
}

- (int64_t)notificationEnabledChannelsRefreshFrequency
{
  if ((*(_QWORD *)&self->_has & 0x400000000) != 0)
    return self->_notificationEnabledChannelsRefreshFrequency;
  else
    return 604800;
}

- (void)setNotificationEnabledChannelsRefreshFrequency:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_notificationEnabledChannelsRefreshFrequency = a3;
}

- (void)setHasNotificationEnabledChannelsRefreshFrequency:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasNotificationEnabledChannelsRefreshFrequency
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (int64_t)savedArticlesMaximumCountWifi
{
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
    return self->_savedArticlesMaximumCountWifi;
  else
    return 100;
}

- (void)setSavedArticlesMaximumCountWifi:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_savedArticlesMaximumCountWifi = a3;
}

- (void)setHasSavedArticlesMaximumCountWifi:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasSavedArticlesMaximumCountWifi
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
}

- (int64_t)savedArticlesMaximumCountCellular
{
  if ((*(_QWORD *)&self->_has & 0x20000000000) != 0)
    return self->_savedArticlesMaximumCountCellular;
  else
    return 10;
}

- (void)setSavedArticlesMaximumCountCellular:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_savedArticlesMaximumCountCellular = a3;
}

- (void)setHasSavedArticlesMaximumCountCellular:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasSavedArticlesMaximumCountCellular
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (int64_t)savedArticlesCutoffTime
{
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
    return self->_savedArticlesCutoffTime;
  else
    return 2592000;
}

- (void)setSavedArticlesCutoffTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_savedArticlesCutoffTime = a3;
}

- (void)setHasSavedArticlesCutoffTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasSavedArticlesCutoffTime
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (int64_t)savedArticlesOpenedCutoffTime
{
  if ((*(_QWORD *)&self->_has & 0x80000000000) != 0)
    return self->_savedArticlesOpenedCutoffTime;
  else
    return 21600;
}

- (void)setSavedArticlesOpenedCutoffTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_savedArticlesOpenedCutoffTime = a3;
}

- (void)setHasSavedArticlesOpenedCutoffTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasSavedArticlesOpenedCutoffTime
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (BOOL)hasAlternativeButlerWidgetConfig
{
  return self->_alternativeButlerWidgetConfig != 0;
}

- (void)setAlternativeButlerWidgetConfigEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 4u;
  self->_alternativeButlerWidgetConfigEnabled = a3;
}

- (void)setHasAlternativeButlerWidgetConfigEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v3;
}

- (BOOL)hasAlternativeButlerWidgetConfigEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (BOOL)hasButlerWidgetConfig
{
  return self->_butlerWidgetConfig != 0;
}

- (BOOL)hasPaidSubscriptionConfig
{
  return self->_paidSubscriptionConfig != 0;
}

- (double)articleDiversitySimilarityExpectationStart
{
  double result;

  result = 0.0;
  if ((*(_QWORD *)&self->_has & 8) != 0)
    return self->_articleDiversitySimilarityExpectationStart;
  return result;
}

- (void)setArticleDiversitySimilarityExpectationStart:(double)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_articleDiversitySimilarityExpectationStart = a3;
}

- (void)setHasArticleDiversitySimilarityExpectationStart:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasArticleDiversitySimilarityExpectationStart
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (double)articleDiversitySimilarityExpectationEnd
{
  if ((*(_QWORD *)&self->_has & 4) != 0)
    return self->_articleDiversitySimilarityExpectationEnd;
  else
    return 0.1;
}

- (void)setArticleDiversitySimilarityExpectationEnd:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_articleDiversitySimilarityExpectationEnd = a3;
}

- (void)setHasArticleDiversitySimilarityExpectationEnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasArticleDiversitySimilarityExpectationEnd
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (int64_t)maxPaidSubscriptionGroupSizeIPad
{
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
    return self->_maxPaidSubscriptionGroupSizeIPad;
  else
    return 5;
}

- (void)setMaxPaidSubscriptionGroupSizeIPad:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_maxPaidSubscriptionGroupSizeIPad = a3;
}

- (void)setHasMaxPaidSubscriptionGroupSizeIPad:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasMaxPaidSubscriptionGroupSizeIPad
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (int64_t)maxPaidSubscriptionGroupSizeIPhone
{
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
    return self->_maxPaidSubscriptionGroupSizeIPhone;
  else
    return 5;
}

- (void)setMaxPaidSubscriptionGroupSizeIPhone:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_maxPaidSubscriptionGroupSizeIPhone = a3;
}

- (void)setHasMaxPaidSubscriptionGroupSizeIPhone:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasMaxPaidSubscriptionGroupSizeIPhone
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (int64_t)maxTimesHeadlineInPaidSubscriptionGroup
{
  if ((*(_QWORD *)&self->_has & 0x200000) != 0)
    return self->_maxTimesHeadlineInPaidSubscriptionGroup;
  else
    return 3;
}

- (void)setMaxTimesHeadlineInPaidSubscriptionGroup:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_maxTimesHeadlineInPaidSubscriptionGroup = a3;
}

- (void)setHasMaxTimesHeadlineInPaidSubscriptionGroup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasMaxTimesHeadlineInPaidSubscriptionGroup
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (double)publisherDiversitySlope
{
  double result;

  result = 0.75;
  if ((*(_QWORD *)&self->_has & 0x4000000000) != 0)
    return self->_publisherDiversitySlope;
  return result;
}

- (void)setPublisherDiversitySlope:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_publisherDiversitySlope = a3;
}

- (void)setHasPublisherDiversitySlope:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasPublisherDiversitySlope
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (double)publisherDiversityYIntercept
{
  double result;

  result = 0.25;
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
    return self->_publisherDiversityYIntercept;
  return result;
}

- (void)setPublisherDiversityYIntercept:(double)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_publisherDiversityYIntercept = a3;
}

- (void)setHasPublisherDiversityYIntercept:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasPublisherDiversityYIntercept
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (int64_t)expiredPaidSubscriptionGroupCutoffTime
{
  if ((*(_QWORD *)&self->_has & 0x4000) != 0)
    return self->_expiredPaidSubscriptionGroupCutoffTime;
  else
    return 864000;
}

- (void)setExpiredPaidSubscriptionGroupCutoffTime:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_expiredPaidSubscriptionGroupCutoffTime = a3;
}

- (void)setHasExpiredPaidSubscriptionGroupCutoffTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasExpiredPaidSubscriptionGroupCutoffTime
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (int64_t)maxExpiredPaidSubscriptionGroupCount
{
  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
    return self->_maxExpiredPaidSubscriptionGroupCount;
  else
    return 3;
}

- (void)setMaxExpiredPaidSubscriptionGroupCount:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_maxExpiredPaidSubscriptionGroupCount = a3;
}

- (void)setHasMaxExpiredPaidSubscriptionGroupCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasMaxExpiredPaidSubscriptionGroupCount
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (BOOL)hasWidgetConfig2
{
  return self->_widgetConfig2 != 0;
}

- (void)setSubscriptionsPlacardPublisherFrequencySeconds:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_subscriptionsPlacardPublisherFrequencySeconds = a3;
}

- (void)setHasSubscriptionsPlacardPublisherFrequencySeconds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSubscriptionsPlacardPublisherFrequencySeconds
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (void)setTreatmentId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_treatmentId = a3;
}

- (void)setHasTreatmentId:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTreatmentId
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (BOOL)hasBinningConfig
{
  return self->_binningConfig != 0;
}

- (BOOL)hasPersonalizationTreatment
{
  return self->_personalizationTreatment != 0;
}

- (int64_t)analyticsEndpointMaxPayloadSize
{
  if ((*(_QWORD *)&self->_has & 1) != 0)
    return self->_analyticsEndpointMaxPayloadSize;
  else
    return 500000;
}

- (void)setAnalyticsEndpointMaxPayloadSize:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_analyticsEndpointMaxPayloadSize = a3;
}

- (void)setHasAnalyticsEndpointMaxPayloadSize:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasAnalyticsEndpointMaxPayloadSize
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)orderFeedEndpointEnabled
{
  return (*((_WORD *)&self->_has + 4) & 0x100) == 0 || self->_orderFeedEndpointEnabled;
}

- (void)setOrderFeedEndpointEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x100u;
  self->_orderFeedEndpointEnabled = a3;
}

- (void)setHasOrderFeedEndpointEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v3;
}

- (BOOL)hasOrderFeedEndpointEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (BOOL)hasPersonalizationBundleIdMappingResourceId
{
  return self->_personalizationBundleIdMappingResourceId != 0;
}

- (BOOL)hasPersonalizationUrlMappingResourceId
{
  return self->_personalizationUrlMappingResourceId != 0;
}

- (BOOL)hasPersonalizationWhitelistResourceId
{
  return self->_personalizationWhitelistResourceId != 0;
}

- (void)setEnabledPrivateDataEncryptionLevel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_enabledPrivateDataEncryptionLevel = a3;
}

- (void)setHasEnabledPrivateDataEncryptionLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasEnabledPrivateDataEncryptionLevel
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (BOOL)hasPersonalizationPublisherFavorabilityScoresResourceId
{
  return self->_personalizationPublisherFavorabilityScoresResourceId != 0;
}

- (BOOL)hasPersonalizationWidgetSectionMappingResourceId
{
  return self->_personalizationWidgetSectionMappingResourceId != 0;
}

- (void)setCorryBarMaxArticleCountForArticleList:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_corryBarMaxArticleCountForArticleList = a3;
}

- (void)setHasCorryBarMaxArticleCountForArticleList:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasCorryBarMaxArticleCountForArticleList
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (void)setCorryBarMaxArticleCountForSingleArticle:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_corryBarMaxArticleCountForSingleArticle = a3;
}

- (void)setHasCorryBarMaxArticleCountForSingleArticle:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasCorryBarMaxArticleCountForSingleArticle
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (void)setCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x10u;
  self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers = a3;
}

- (void)setHasCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v3;
}

- (BOOL)hasCorryBarHideDiscoverMoreInterstitialForNonOnboardedUsers
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)clearExternalAnalyticsConfigs
{
  -[NSMutableArray removeAllObjects](self->_externalAnalyticsConfigs, "removeAllObjects");
}

- (void)addExternalAnalyticsConfig:(id)a3
{
  id v4;
  NSMutableArray *externalAnalyticsConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  externalAnalyticsConfigs = self->_externalAnalyticsConfigs;
  v8 = v4;
  if (!externalAnalyticsConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_externalAnalyticsConfigs;
    self->_externalAnalyticsConfigs = v6;

    v4 = v8;
    externalAnalyticsConfigs = self->_externalAnalyticsConfigs;
  }
  -[NSMutableArray addObject:](externalAnalyticsConfigs, "addObject:", v4);

}

- (unint64_t)externalAnalyticsConfigsCount
{
  return -[NSMutableArray count](self->_externalAnalyticsConfigs, "count");
}

- (id)externalAnalyticsConfigAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_externalAnalyticsConfigs, "objectAtIndex:", a3);
}

+ (Class)externalAnalyticsConfigType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPersonalizationPortraitConfigResourceId
{
  return self->_personalizationPortraitConfigResourceId != 0;
}

- (int)orderFeedEnabledLevelDeprecated
{
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
    return self->_orderFeedEnabledLevelDeprecated;
  else
    return 0;
}

- (void)setOrderFeedEnabledLevelDeprecated:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_orderFeedEnabledLevelDeprecated = a3;
}

- (void)setHasOrderFeedEnabledLevelDeprecated:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasOrderFeedEnabledLevelDeprecated
{
  return *(_QWORD *)&self->_has >> 63;
}

- (BOOL)hasExperimentalizableFieldPostfix
{
  return self->_experimentalizableFieldPostfix != 0;
}

- (void)setMinimumFollowCountToRemovePersonalizePlacardInFollowing:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_minimumFollowCountToRemovePersonalizePlacardInFollowing = a3;
}

- (void)setHasMinimumFollowCountToRemovePersonalizePlacardInFollowing:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasMinimumFollowCountToRemovePersonalizePlacardInFollowing
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (void)setUseSecureConnectionForAssets:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x1000u;
  self->_useSecureConnectionForAssets = a3;
}

- (void)setHasUseSecureConnectionForAssets:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xEFFF | v3;
}

- (BOOL)hasUseSecureConnectionForAssets
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 12) & 1;
}

- (void)setUsUkUseAuWhatsNewFeatures:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x800u;
  self->_usUkUseAuWhatsNewFeatures = a3;
}

- (void)setHasUsUkUseAuWhatsNewFeatures:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xF7FF | v3;
}

- (BOOL)hasUsUkUseAuWhatsNewFeatures
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 11) & 1;
}

- (void)setOrderFeedEnabledLevel:(unsigned int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_orderFeedEnabledLevel = a3;
}

- (void)setHasOrderFeedEnabledLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasOrderFeedEnabledLevel
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (void)setStateRestorationAllowedTimeWindow:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_stateRestorationAllowedTimeWindow = a3;
}

- (void)setHasStateRestorationAllowedTimeWindow:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasStateRestorationAllowedTimeWindow
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (void)setAutoRefreshMinimumInterval:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_autoRefreshMinimumInterval = a3;
}

- (void)setHasAutoRefreshMinimumInterval:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasAutoRefreshMinimumInterval
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (BOOL)terminateAppOnBackgroundAfterJoiningOrLeavingExperiment
{
  return (*((_WORD *)&self->_has + 4) & 0x200) != 0 && self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
}

- (void)setTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x200u;
  self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment = a3;
}

- (void)setHasTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFDFF | v3;
}

- (BOOL)hasTerminateAppOnBackgroundAfterJoiningOrLeavingExperiment
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 9) & 1;
}

- (unint64_t)topStoriesPublishTimeIntervalsCount
{
  return self->_topStoriesPublishTimeIntervals.count;
}

- (int64_t)topStoriesPublishTimeIntervals
{
  return self->_topStoriesPublishTimeIntervals.list;
}

- (void)clearTopStoriesPublishTimeIntervals
{
  PBRepeatedInt64Clear();
}

- (void)addTopStoriesPublishTimeIntervals:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)topStoriesPublishTimeIntervalsAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_topStoriesPublishTimeIntervals;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_topStoriesPublishTimeIntervals = &self->_topStoriesPublishTimeIntervals;
  count = self->_topStoriesPublishTimeIntervals.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_topStoriesPublishTimeIntervals->list[a3];
}

- (void)setTopStoriesPublishTimeIntervals:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (BOOL)articleSearchEnabled
{
  return (*((_WORD *)&self->_has + 4) & 8) == 0 || self->_articleSearchEnabled;
}

- (void)setArticleSearchEnabled:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 8u;
  self->_articleSearchEnabled = a3;
}

- (void)setHasArticleSearchEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v3;
}

- (BOOL)hasArticleSearchEnabled
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setMaximumRatioOfArticlesInForYouGroup:(double)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_maximumRatioOfArticlesInForYouGroup = a3;
}

- (void)setHasMaximumRatioOfArticlesInForYouGroup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasMaximumRatioOfArticlesInForYouGroup
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (void)setMinimumTrendingUnseenRatio:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_minimumTrendingUnseenRatio = a3;
}

- (void)setHasMinimumTrendingUnseenRatio:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasMinimumTrendingUnseenRatio
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (int)trendingStyle
{
  if ((*((_WORD *)&self->_has + 4) & 2) != 0)
    return self->_trendingStyle;
  else
    return 0;
}

- (void)setTrendingStyle:(int)a3
{
  *((_WORD *)&self->_has + 4) |= 2u;
  self->_trendingStyle = a3;
}

- (void)setHasTrendingStyle:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v3;
}

- (BOOL)hasTrendingStyle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setMinimumDurationBetweenForYouGroupsWeekday:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_minimumDurationBetweenForYouGroupsWeekday = a3;
}

- (void)setHasMinimumDurationBetweenForYouGroupsWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasMinimumDurationBetweenForYouGroupsWeekday
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (void)setMinimumDurationBetweenForYouGroupsWeekend:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_minimumDurationBetweenForYouGroupsWeekend = a3;
}

- (void)setHasMinimumDurationBetweenForYouGroupsWeekend:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasMinimumDurationBetweenForYouGroupsWeekend
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (void)setMinimumDurationBetweenTrendingGroupsWeekday:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_minimumDurationBetweenTrendingGroupsWeekday = a3;
}

- (void)setHasMinimumDurationBetweenTrendingGroupsWeekday:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasMinimumDurationBetweenTrendingGroupsWeekday
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (void)setMinimumDurationBetweenTrendingGroupsWeekend:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_minimumDurationBetweenTrendingGroupsWeekend = a3;
}

- (void)setHasMinimumDurationBetweenTrendingGroupsWeekend:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasMinimumDurationBetweenTrendingGroupsWeekend
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (BOOL)diversifyOptionalTopStories
{
  return (*((_WORD *)&self->_has + 4) & 0x40) == 0 || self->_diversifyOptionalTopStories;
}

- (void)setDiversifyOptionalTopStories:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x40u;
  self->_diversifyOptionalTopStories = a3;
}

- (void)setHasDiversifyOptionalTopStories:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v3;
}

- (BOOL)hasDiversifyOptionalTopStories
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (BOOL)hasForYouVideoGroupsConfig
{
  return self->_forYouVideoGroupsConfig != 0;
}

- (BOOL)hasArticleRecirculationConfig
{
  return self->_articleRecirculationConfig != 0;
}

- (void)setOptionalTopStoriesRefreshRate:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_optionalTopStoriesRefreshRate = a3;
}

- (void)setHasOptionalTopStoriesRefreshRate:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasOptionalTopStoriesRefreshRate
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (int64_t)expirePinnedArticlesAfter
{
  if ((*(_QWORD *)&self->_has & 0x2000) != 0)
    return self->_expirePinnedArticlesAfter;
  else
    return 604800;
}

- (void)setExpirePinnedArticlesAfter:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_expirePinnedArticlesAfter = a3;
}

- (void)setHasExpirePinnedArticlesAfter:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasExpirePinnedArticlesAfter
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (void)setUserSegmentationApiModThreshold:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_userSegmentationApiModThreshold = a3;
}

- (void)setHasUserSegmentationApiModThreshold:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasUserSegmentationApiModThreshold
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (void)setUserSegmentationApiModMax:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_userSegmentationApiModMax = a3;
}

- (void)setHasUserSegmentationApiModMax:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasUserSegmentationApiModMax
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (void)setPrivateDataMigrationCleanupLevel:(unsigned int)a3
{
  *((_WORD *)&self->_has + 4) |= 1u;
  self->_privateDataMigrationCleanupLevel = a3;
}

- (void)setHasPrivateDataMigrationCleanupLevel:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (BOOL)hasPrivateDataMigrationCleanupLevel
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (BOOL)hasArticleRecirculationComponentPlacementConfig
{
  return self->_articleRecirculationComponentPlacementConfig != 0;
}

- (int64_t)widgetEventImmediateUploadPopulationFloor
{
  if ((*(_QWORD *)&self->_has & 0x1000000000000000) != 0)
    return self->_widgetEventImmediateUploadPopulationFloor;
  else
    return 0;
}

- (void)setWidgetEventImmediateUploadPopulationFloor:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_widgetEventImmediateUploadPopulationFloor = a3;
}

- (void)setHasWidgetEventImmediateUploadPopulationFloor:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetEventImmediateUploadPopulationFloor
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (int64_t)widgetEventImmediateUploadPopulationCeiling
{
  if ((*(_QWORD *)&self->_has & 0x800000000000000) != 0)
    return self->_widgetEventImmediateUploadPopulationCeiling;
  else
    return 1;
}

- (void)setWidgetEventImmediateUploadPopulationCeiling:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_widgetEventImmediateUploadPopulationCeiling = a3;
}

- (void)setHasWidgetEventImmediateUploadPopulationCeiling:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetEventImmediateUploadPopulationCeiling
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (int64_t)widgetEventImmediateUploadModuloForHashing
{
  if ((*(_QWORD *)&self->_has & 0x400000000000000) != 0)
    return self->_widgetEventImmediateUploadModuloForHashing;
  else
    return 1000;
}

- (void)setWidgetEventImmediateUploadModuloForHashing:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_widgetEventImmediateUploadModuloForHashing = a3;
}

- (void)setHasWidgetEventImmediateUploadModuloForHashing:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetEventImmediateUploadModuloForHashing
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
}

- (int64_t)articleRecirculationPopularFeedQueryTimeRange
{
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
    return self->_articleRecirculationPopularFeedQueryTimeRange;
  else
    return 86400;
}

- (void)setArticleRecirculationPopularFeedQueryTimeRange:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_articleRecirculationPopularFeedQueryTimeRange = a3;
}

- (void)setHasArticleRecirculationPopularFeedQueryTimeRange:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasArticleRecirculationPopularFeedQueryTimeRange
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (BOOL)disableThumbnailsForArticleRecirculation
{
  return (*((_WORD *)&self->_has + 4) & 0x20) != 0 && self->_disableThumbnailsForArticleRecirculation;
}

- (void)setDisableThumbnailsForArticleRecirculation:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x20u;
  self->_disableThumbnailsForArticleRecirculation = a3;
}

- (void)setHasDisableThumbnailsForArticleRecirculation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v3;
}

- (BOOL)hasDisableThumbnailsForArticleRecirculation
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (BOOL)hasUserSegmentationApiConfiguration
{
  return self->_userSegmentationApiConfiguration != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBConfig;
  -[NTPBConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *fallbackLanguageTag;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t has;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NTPBPersonalizationConfig *personalizationConfig;
  void *v24;
  NTPBIAdConfig *iadConfig;
  void *v26;
  NTPBPrefetchConfig *prefetchConfig;
  void *v28;
  $351BB551948112059CB39AA772662B50 *p_has;
  uint64_t v30;
  void *v31;
  NSString *anfEmbedConfigurationAsset;
  $351BB551948112059CB39AA772662B50 *v33;
  uint64_t v34;
  void *v35;
  NTPBWidgetConfig *widgetConfig;
  void *v37;
  $351BB551948112059CB39AA772662B50 *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSString *forYouNonPersonalizedGroupsOrder;
  $351BB551948112059CB39AA772662B50 *v44;
  uint64_t v45;
  void *v46;
  NTPBWidgetConfig *alternativeButlerWidgetConfig;
  void *v48;
  void *v49;
  NTPBWidgetConfig *butlerWidgetConfig;
  void *v51;
  NTPBPaidSubscriptionConfig *paidSubscriptionConfig;
  void *v53;
  $351BB551948112059CB39AA772662B50 *v54;
  uint64_t v55;
  void *v56;
  NTPBWidgetConfig *widgetConfig2;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  NTPBBinningConfig *binningConfig;
  void *v63;
  NTPBPersonalizationTreatment *personalizationTreatment;
  void *v65;
  void *v66;
  void *v67;
  NSString *personalizationBundleIdMappingResourceId;
  NSString *personalizationUrlMappingResourceId;
  NSString *personalizationWhitelistResourceId;
  void *v71;
  NSString *personalizationPublisherFavorabilityScoresResourceId;
  NSString *personalizationWidgetSectionMappingResourceId;
  uint64_t v74;
  void *v75;
  __int16 v76;
  void *v77;
  void *v78;
  void *v79;
  NSMutableArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t k;
  void *v85;
  NSString *personalizationPortraitConfigResourceId;
  void *v87;
  NSString *experimentalizableFieldPostfix;
  uint64_t v89;
  void *v90;
  __int16 v91;
  void *v92;
  void *v93;
  $351BB551948112059CB39AA772662B50 *v94;
  __int16 v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  NTPBVideoGroupsConfig *forYouVideoGroupsConfig;
  void *v138;
  NSString *articleRecirculationConfig;
  uint64_t v140;
  void *v141;
  __int16 v142;
  void *v143;
  NSString *articleRecirculationComponentPlacementConfig;
  uint64_t v145;
  void *v146;
  __int16 v147;
  void *v148;
  NTPBUserSegmentationApiConfiguration *userSegmentationApiConfiguration;
  void *v150;
  id v151;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fallbackLanguageTag = self->_fallbackLanguageTag;
  if (fallbackLanguageTag)
    objc_msgSend(v3, "setObject:forKey:", fallbackLanguageTag, CFSTR("fallback_language_tag"));
  if (-[NSMutableArray count](self->_languageConfigs, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_languageConfigs, "count"));
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v7 = self->_languageConfigs;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v173, v179, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v174;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v174 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * i), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v173, v179, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("language_configs"));
  }
  has = (uint64_t)self->_has;
  if ((has & 0x100000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_shortReminderTime);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("short_reminder_time"));

    has = (uint64_t)self->_has;
  }
  if ((has & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_longReminderTime);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v97, CFSTR("long_reminder_time"));

    has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_16:
      if ((has & 0x100) == 0)
        goto LABEL_17;
      goto LABEL_152;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_newsletterSubscriptionChecked);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v98, CFSTR("newsletter_subscription_checked"));

  has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_17:
    if ((has & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_153;
  }
LABEL_152:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_batchedFeedTimeout);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v99, CFSTR("batched_feed_timeout"));

  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_18:
    if ((has & 0x2000000000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_153:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_interstitialAdLoadDelay);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v100, CFSTR("interstitial_ad_load_delay"));

  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_prerollLoadingTimeout);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("preroll_loading_timeout"));

  }
LABEL_20:
  if (-[NSMutableArray count](self->_endpointConfigs, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_endpointConfigs, "count"));
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v17 = self->_endpointConfigs;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v169, v178, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v170;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v170 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * j), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v169, v178, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("endpoint_configs"));
  }
  personalizationConfig = self->_personalizationConfig;
  if (personalizationConfig)
  {
    -[NTPBPersonalizationConfig dictionaryRepresentation](personalizationConfig, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("personalization_config"));

  }
  iadConfig = self->_iadConfig;
  if (iadConfig)
  {
    -[NTPBIAdConfig dictionaryRepresentation](iadConfig, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("iad_config"));

  }
  prefetchConfig = self->_prefetchConfig;
  if (prefetchConfig)
  {
    -[NTPBPrefetchConfig dictionaryRepresentation](prefetchConfig, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("prefetch_config"));

  }
  p_has = &self->_has;
  v30 = (uint64_t)self->_has;
  if ((v30 & 0x8000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tileProminenceScoreBalanceValue);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v101, CFSTR("tile_prominence_score_balance_value"));

    v30 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x800000) == 0)
    {
LABEL_37:
      if ((v30 & 0x8000) == 0)
        goto LABEL_38;
      goto LABEL_157;
    }
  }
  else if ((v30 & 0x800000) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumArticleUpdateInterval);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v102, CFSTR("minimum_article_update_interval"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 0x8000) == 0)
  {
LABEL_38:
    if ((v30 & 0x80) == 0)
      goto LABEL_39;
    goto LABEL_158;
  }
LABEL_157:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_initialArticlesFromNewFavorite);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v103, CFSTR("initial_articles_from_new_favorite"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 0x80) == 0)
  {
LABEL_39:
    if ((v30 & 0x80000000000000) == 0)
      goto LABEL_40;
    goto LABEL_159;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_autoScrollToTopFeedTimeout);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v104, CFSTR("auto_scroll_to_top_feed_timeout"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 0x80000000000000) == 0)
  {
LABEL_40:
    if ((v30 & 2) == 0)
      goto LABEL_41;
    goto LABEL_160;
  }
LABEL_159:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_trendingTopicsRefreshRate);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v105, CFSTR("trending_topics_refresh_rate"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 2) == 0)
  {
LABEL_41:
    if ((v30 & 0x1000000) == 0)
      goto LABEL_42;
    goto LABEL_161;
  }
LABEL_160:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appConfigRefreshRate);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v106, CFSTR("app_config_refresh_rate"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 0x1000000) == 0)
  {
LABEL_42:
    if ((v30 & 0x20000000000000) == 0)
      goto LABEL_43;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumDistanceBetweenImageOnTopTiles);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v107, CFSTR("minimum_distance_between_image_on_top_tiles"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 0x20000000000000) == 0)
  {
LABEL_43:
    if ((v30 & 0x10000000000000) == 0)
      goto LABEL_44;
    goto LABEL_163;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timeBetweenWidgetInsertions);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v108, CFSTR("time_between_widget_insertions"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 0x10000000000000) == 0)
  {
LABEL_44:
    if ((v30 & 0x800000000) == 0)
      goto LABEL_45;
    goto LABEL_164;
  }
LABEL_163:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timeBetweenSameWidgetReinsertion);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v109, CFSTR("time_between_same_widget_reinsertion"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 0x800000000) == 0)
  {
LABEL_45:
    if ((v30 & 0x10) == 0)
      goto LABEL_46;
    goto LABEL_165;
  }
LABEL_164:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v110, CFSTR("number_of_screenfuls_scrolled_to_bypass_widget_timeLimit"));

  v30 = (uint64_t)self->_has;
  if ((v30 & 0x10) == 0)
  {
LABEL_46:
    if ((v30 & 0x400000000000) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
LABEL_165:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_articleRapidUpdatesTimeout);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v111, CFSTR("article_rapid_updates_timeout"));

  if ((*(_QWORD *)&self->_has & 0x400000000000) != 0)
  {
LABEL_47:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_subscriptionsGlobalMeteredCount);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("subscriptions_global_metered_count"));

  }
LABEL_48:
  anfEmbedConfigurationAsset = self->_anfEmbedConfigurationAsset;
  if (anfEmbedConfigurationAsset)
    objc_msgSend(v4, "setObject:forKey:", anfEmbedConfigurationAsset, CFSTR("anf_embed_configuration_asset"));
  v33 = &self->_has;
  v34 = (uint64_t)self->_has;
  if ((v34 & 0x2000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_subscriptionsPlacardPublisherFrequencyDays);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v112, CFSTR("subscriptions_placard_publisher_frequency_days"));

    v34 = *(_QWORD *)v33;
    if ((*(_QWORD *)v33 & 0x1000000000000) == 0)
    {
LABEL_52:
      if ((v34 & 0x800000000000) == 0)
        goto LABEL_53;
      goto LABEL_169;
    }
  }
  else if ((v34 & 0x1000000000000) == 0)
  {
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_subscriptionsPlacardGlobalMaxPerDay);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v113, CFSTR("subscriptions_placard_global_max_per_day"));

  v34 = (uint64_t)self->_has;
  if ((v34 & 0x800000000000) == 0)
  {
LABEL_53:
    if ((v34 & 0x80000000) == 0)
      goto LABEL_54;
    goto LABEL_170;
  }
LABEL_169:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_subscriptionsGracePeriodForTokenVerificationSeconds);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v114, CFSTR("subscriptions_grace_period_for_token_verification_seconds"));

  v34 = (uint64_t)self->_has;
  if ((v34 & 0x80000000) == 0)
  {
LABEL_54:
    if ((v34 & 0x1000) == 0)
      goto LABEL_55;
    goto LABEL_171;
  }
LABEL_170:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_newFavoriteNotificationAlertsFrequency);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v115, CFSTR("new_favorite_notification_alerts_frequency"));

  v34 = (uint64_t)self->_has;
  if ((v34 & 0x1000) == 0)
  {
LABEL_55:
    if ((v34 & 0x800) == 0)
      goto LABEL_57;
    goto LABEL_56;
  }
LABEL_171:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_endOfArticleMinPaidHeadlineRatio);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v116, CFSTR("end_of_article_min_paid_headline_ratio"));

  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_56:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_endOfArticleMaxInaccessiblePaidArticles);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("end_of_article_max_inaccessible_paid_articles"));

  }
LABEL_57:
  widgetConfig = self->_widgetConfig;
  if (widgetConfig)
  {
    -[NTPBWidgetConfig dictionaryRepresentation](widgetConfig, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("widget_config"));

  }
  v38 = &self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_universalLinksEnabled);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("universal_links_enabled"));

  }
  v40 = *(_QWORD *)v38;
  if ((*(_QWORD *)v38 & 0x100000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_notificationArticleCacheTimeout);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("notification_article_cache_timeout"));

    v40 = (uint64_t)self->_has;
  }
  if ((v40 & 0x200000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_notificationArticleWithRapidUpdatesCacheTimeout);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("notification_article_with_rapid_updates_cache_timeout"));

  }
  forYouNonPersonalizedGroupsOrder = self->_forYouNonPersonalizedGroupsOrder;
  if (forYouNonPersonalizedGroupsOrder)
    objc_msgSend(v4, "setObject:forKey:", forYouNonPersonalizedGroupsOrder, CFSTR("for_you_non_personalized_groups_order"));
  v44 = &self->_has;
  v45 = (uint64_t)self->_has;
  if ((v45 & 0x400000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_notificationEnabledChannelsRefreshFrequency);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v117, CFSTR("notification_enabled_channels_refresh_frequency"));

    v45 = *(_QWORD *)v44;
    if ((*(_QWORD *)v44 & 0x40000000000) == 0)
    {
LABEL_69:
      if ((v45 & 0x20000000000) == 0)
        goto LABEL_70;
      goto LABEL_175;
    }
  }
  else if ((v45 & 0x40000000000) == 0)
  {
    goto LABEL_69;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_savedArticlesMaximumCountWifi);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v118, CFSTR("saved_articles_maximum_count_wifi"));

  v45 = (uint64_t)self->_has;
  if ((v45 & 0x20000000000) == 0)
  {
LABEL_70:
    if ((v45 & 0x10000000000) == 0)
      goto LABEL_71;
    goto LABEL_176;
  }
LABEL_175:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_savedArticlesMaximumCountCellular);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v119, CFSTR("saved_articles_maximum_count_cellular"));

  v45 = (uint64_t)self->_has;
  if ((v45 & 0x10000000000) == 0)
  {
LABEL_71:
    if ((v45 & 0x80000000000) == 0)
      goto LABEL_73;
    goto LABEL_72;
  }
LABEL_176:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_savedArticlesCutoffTime);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v120, CFSTR("saved_articles_cutoff_time"));

  if ((*(_QWORD *)&self->_has & 0x80000000000) != 0)
  {
LABEL_72:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_savedArticlesOpenedCutoffTime);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("saved_articles_opened_cutoff_time"));

  }
LABEL_73:
  alternativeButlerWidgetConfig = self->_alternativeButlerWidgetConfig;
  if (alternativeButlerWidgetConfig)
  {
    -[NTPBWidgetConfig dictionaryRepresentation](alternativeButlerWidgetConfig, "dictionaryRepresentation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("alternative_butler_widget_config"));

  }
  if ((*((_WORD *)&self->_has + 4) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_alternativeButlerWidgetConfigEnabled);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("alternative_butler_widget_config_enabled"));

  }
  butlerWidgetConfig = self->_butlerWidgetConfig;
  if (butlerWidgetConfig)
  {
    -[NTPBWidgetConfig dictionaryRepresentation](butlerWidgetConfig, "dictionaryRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("butler_widget_config"));

  }
  paidSubscriptionConfig = self->_paidSubscriptionConfig;
  if (paidSubscriptionConfig)
  {
    -[NTPBPaidSubscriptionConfig dictionaryRepresentation](paidSubscriptionConfig, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("paid_subscription_config"));

  }
  v54 = &self->_has;
  v55 = (uint64_t)self->_has;
  if ((v55 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_articleDiversitySimilarityExpectationStart);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v121, CFSTR("article_diversity_similarity_expectation_start"));

    v55 = *(_QWORD *)v54;
    if ((*(_QWORD *)v54 & 4) == 0)
    {
LABEL_83:
      if ((v55 & 0x80000) == 0)
        goto LABEL_84;
      goto LABEL_180;
    }
  }
  else if ((v55 & 4) == 0)
  {
    goto LABEL_83;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_articleDiversitySimilarityExpectationEnd);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v122, CFSTR("article_diversity_similarity_expectation_end"));

  v55 = (uint64_t)self->_has;
  if ((v55 & 0x80000) == 0)
  {
LABEL_84:
    if ((v55 & 0x100000) == 0)
      goto LABEL_85;
    goto LABEL_181;
  }
LABEL_180:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maxPaidSubscriptionGroupSizeIPad);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v123, CFSTR("max_paid_subscription_group_size_iPad"));

  v55 = (uint64_t)self->_has;
  if ((v55 & 0x100000) == 0)
  {
LABEL_85:
    if ((v55 & 0x200000) == 0)
      goto LABEL_86;
    goto LABEL_182;
  }
LABEL_181:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maxPaidSubscriptionGroupSizeIPhone);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v124, CFSTR("max_paid_subscription_group_size_iPhone"));

  v55 = (uint64_t)self->_has;
  if ((v55 & 0x200000) == 0)
  {
LABEL_86:
    if ((v55 & 0x4000000000) == 0)
      goto LABEL_87;
    goto LABEL_183;
  }
LABEL_182:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maxTimesHeadlineInPaidSubscriptionGroup);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v125, CFSTR("max_times_headline_in_paid_subscription_group"));

  v55 = (uint64_t)self->_has;
  if ((v55 & 0x4000000000) == 0)
  {
LABEL_87:
    if ((v55 & 0x8000000000) == 0)
      goto LABEL_88;
    goto LABEL_184;
  }
LABEL_183:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_publisherDiversitySlope);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v126, CFSTR("publisher_diversity_slope"));

  v55 = (uint64_t)self->_has;
  if ((v55 & 0x8000000000) == 0)
  {
LABEL_88:
    if ((v55 & 0x4000) == 0)
      goto LABEL_89;
    goto LABEL_185;
  }
LABEL_184:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_publisherDiversityYIntercept);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v127, CFSTR("publisher_diversity_y_intercept"));

  v55 = (uint64_t)self->_has;
  if ((v55 & 0x4000) == 0)
  {
LABEL_89:
    if ((v55 & 0x40000) == 0)
      goto LABEL_91;
    goto LABEL_90;
  }
LABEL_185:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_expiredPaidSubscriptionGroupCutoffTime);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v128, CFSTR("expired_paid_subscription_group_cutoff_time"));

  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_90:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_maxExpiredPaidSubscriptionGroupCount);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("max_expired_paid_subscription_group_count"));

  }
LABEL_91:
  widgetConfig2 = self->_widgetConfig2;
  if (widgetConfig2)
  {
    -[NTPBWidgetConfig dictionaryRepresentation](widgetConfig2, "dictionaryRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("widget_config_2"));

  }
  v59 = (uint64_t)self->_has;
  if ((v59 & 0x4000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_subscriptionsPlacardPublisherFrequencySeconds);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("subscriptions_placard_publisher_frequency_seconds"));

    v59 = (uint64_t)self->_has;
  }
  if ((v59 & 0x40000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_treatmentId);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v61, CFSTR("treatment_id"));

  }
  binningConfig = self->_binningConfig;
  if (binningConfig)
  {
    -[NTPBBinningConfig dictionaryRepresentation](binningConfig, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("binning_config"));

  }
  personalizationTreatment = self->_personalizationTreatment;
  if (personalizationTreatment)
  {
    -[NTPBPersonalizationTreatment dictionaryRepresentation](personalizationTreatment, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("personalization_treatment"));

  }
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_analyticsEndpointMaxPayloadSize);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("analytics_endpoint_max_payload_size"));

  }
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_orderFeedEndpointEnabled);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("order_feed_endpoint_enabled"));

  }
  personalizationBundleIdMappingResourceId = self->_personalizationBundleIdMappingResourceId;
  if (personalizationBundleIdMappingResourceId)
    objc_msgSend(v4, "setObject:forKey:", personalizationBundleIdMappingResourceId, CFSTR("personalization_bundle_id_mapping_resource_id"));
  personalizationUrlMappingResourceId = self->_personalizationUrlMappingResourceId;
  if (personalizationUrlMappingResourceId)
    objc_msgSend(v4, "setObject:forKey:", personalizationUrlMappingResourceId, CFSTR("personalization_url_mapping_resource_id"));
  personalizationWhitelistResourceId = self->_personalizationWhitelistResourceId;
  if (personalizationWhitelistResourceId)
    objc_msgSend(v4, "setObject:forKey:", personalizationWhitelistResourceId, CFSTR("personalization_whitelist_resource_id"));
  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enabledPrivateDataEncryptionLevel);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("enabled_private_data_encryption_level"));

  }
  personalizationPublisherFavorabilityScoresResourceId = self->_personalizationPublisherFavorabilityScoresResourceId;
  if (personalizationPublisherFavorabilityScoresResourceId)
    objc_msgSend(v4, "setObject:forKey:", personalizationPublisherFavorabilityScoresResourceId, CFSTR("personalization_publisher_favorability_scores_resource_id"));
  personalizationWidgetSectionMappingResourceId = self->_personalizationWidgetSectionMappingResourceId;
  if (personalizationWidgetSectionMappingResourceId)
    objc_msgSend(v4, "setObject:forKey:", personalizationWidgetSectionMappingResourceId, CFSTR("personalization_widget_section_mapping_resource_id"));
  v74 = (uint64_t)self->_has;
  if ((v74 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_corryBarMaxArticleCountForArticleList);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("corry_bar_max_article_count_for_article_list"));

    v74 = (uint64_t)self->_has;
  }
  v76 = *((_WORD *)&self->_has + 4);
  if ((v74 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_corryBarMaxArticleCountForSingleArticle);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("corry_bar_max_article_count_for_single_article"));

    v76 = *((_WORD *)&self->_has + 4);
  }
  if ((v76 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("corry_bar_hide_discover_more_interstitial_for_non_onboarded_users"));

  }
  if (-[NSMutableArray count](self->_externalAnalyticsConfigs, "count"))
  {
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_externalAnalyticsConfigs, "count"));
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v80 = self->_externalAnalyticsConfigs;
    v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v165, v177, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v166;
      do
      {
        for (k = 0; k != v82; ++k)
        {
          if (*(_QWORD *)v166 != v83)
            objc_enumerationMutation(v80);
          objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v165);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "addObject:", v85);

        }
        v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v165, v177, 16);
      }
      while (v82);
    }

    objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("external_analytics_config"));
  }
  personalizationPortraitConfigResourceId = self->_personalizationPortraitConfigResourceId;
  if (personalizationPortraitConfigResourceId)
    objc_msgSend(v4, "setObject:forKey:", personalizationPortraitConfigResourceId, CFSTR("personalization_portrait_config_resource_id"));
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_orderFeedEnabledLevelDeprecated);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("order_feed_enabled_level_deprecated"));

  }
  experimentalizableFieldPostfix = self->_experimentalizableFieldPostfix;
  if (experimentalizableFieldPostfix)
    objc_msgSend(v4, "setObject:forKey:", experimentalizableFieldPostfix, CFSTR("experimentalizable_field_postfix"));
  v89 = (uint64_t)self->_has;
  if ((v89 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumFollowCountToRemovePersonalizePlacardInFollowing);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v90, CFSTR("minimum_follow_count_to_remove_personalize_placard_in_following"));

    v89 = (uint64_t)self->_has;
  }
  v91 = *((_WORD *)&self->_has + 4);
  if ((v91 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_useSecureConnectionForAssets);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v129, CFSTR("use_secure_connection_for_assets"));

    v89 = (uint64_t)self->_has;
    v91 = *((_WORD *)&self->_has + 4);
    if ((v91 & 0x800) == 0)
    {
LABEL_142:
      if ((v89 & 0x4000000000000000) == 0)
        goto LABEL_143;
      goto LABEL_189;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x800) == 0)
  {
    goto LABEL_142;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_usUkUseAuWhatsNewFeatures, (_QWORD)v165);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v130, CFSTR("us_uk_use_au_whats_new_features"));

  v89 = (uint64_t)self->_has;
  v91 = *((_WORD *)&self->_has + 4);
  if ((v89 & 0x4000000000000000) == 0)
  {
LABEL_143:
    if ((v89 & 0x200000000000) == 0)
      goto LABEL_144;
    goto LABEL_190;
  }
LABEL_189:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_orderFeedEnabledLevel, (_QWORD)v165);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v131, CFSTR("order_feed_enabled_level"));

  v89 = (uint64_t)self->_has;
  v91 = *((_WORD *)&self->_has + 4);
  if ((v89 & 0x200000000000) == 0)
  {
LABEL_144:
    if ((v89 & 0x40) == 0)
      goto LABEL_145;
    goto LABEL_191;
  }
LABEL_190:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_stateRestorationAllowedTimeWindow, (_QWORD)v165);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v132, CFSTR("state_restoration_allowed_time_window"));

  v91 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x40) == 0)
  {
LABEL_145:
    if ((v91 & 0x200) == 0)
      goto LABEL_147;
    goto LABEL_146;
  }
LABEL_191:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_autoRefreshMinimumInterval, (_QWORD)v165);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v133, CFSTR("auto_refresh_minimum_interval"));

  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
LABEL_146:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment, (_QWORD)v165);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v92, CFSTR("terminate_app_on_background_after_joining_or_leaving_experiment"));

  }
LABEL_147:
  PBRepeatedInt64NSArray();
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v93, CFSTR("top_stories_publish_time_intervals"));

  v94 = &self->_has;
  v95 = *((_WORD *)&self->_has + 4);
  if ((v95 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_articleSearchEnabled);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v134, CFSTR("article_search_enabled"));

    v96 = *(_QWORD *)v94;
    v95 = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)v94 & 0x400000) == 0)
      goto LABEL_195;
    goto LABEL_194;
  }
  v96 = *(_QWORD *)v94;
  if ((*(_QWORD *)v94 & 0x400000) != 0)
  {
LABEL_194:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maximumRatioOfArticlesInForYouGroup, (_QWORD)v165);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v135, CFSTR("maximum_ratio_of_articles_in_for_you_group"));

    v96 = (uint64_t)self->_has;
    v95 = *((_WORD *)&self->_has + 4);
  }
LABEL_195:
  if ((v96 & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_minimumTrendingUnseenRatio);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v153, CFSTR("minimum_trending_unseen_ratio"));

    v96 = (uint64_t)self->_has;
    v95 = *((_WORD *)&self->_has + 4);
    if ((v95 & 2) == 0)
    {
LABEL_197:
      if ((v96 & 0x2000000) == 0)
        goto LABEL_198;
      goto LABEL_228;
    }
  }
  else if ((v95 & 2) == 0)
  {
    goto LABEL_197;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_trendingStyle, (_QWORD)v165);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v154, CFSTR("trending_style"));

  v96 = (uint64_t)self->_has;
  v95 = *((_WORD *)&self->_has + 4);
  if ((v96 & 0x2000000) == 0)
  {
LABEL_198:
    if ((v96 & 0x4000000) == 0)
      goto LABEL_199;
    goto LABEL_229;
  }
LABEL_228:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumDurationBetweenForYouGroupsWeekday, (_QWORD)v165);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v155, CFSTR("minimum_duration_between_for_you_groups_weekday"));

  v96 = (uint64_t)self->_has;
  v95 = *((_WORD *)&self->_has + 4);
  if ((v96 & 0x4000000) == 0)
  {
LABEL_199:
    if ((v96 & 0x8000000) == 0)
      goto LABEL_200;
    goto LABEL_230;
  }
LABEL_229:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumDurationBetweenForYouGroupsWeekend, (_QWORD)v165);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v156, CFSTR("minimum_duration_between_for_you_groups_weekend"));

  v96 = (uint64_t)self->_has;
  v95 = *((_WORD *)&self->_has + 4);
  if ((v96 & 0x8000000) == 0)
  {
LABEL_200:
    if ((v96 & 0x10000000) == 0)
      goto LABEL_201;
    goto LABEL_231;
  }
LABEL_230:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumDurationBetweenTrendingGroupsWeekday, (_QWORD)v165);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v157, CFSTR("minimum_duration_between_trending_groups_weekday"));

  v95 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_201:
    if ((v95 & 0x40) == 0)
      goto LABEL_203;
    goto LABEL_202;
  }
LABEL_231:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumDurationBetweenTrendingGroupsWeekend, (_QWORD)v165);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v158, CFSTR("minimum_duration_between_trending_groups_weekend"));

  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
  {
LABEL_202:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_diversifyOptionalTopStories, (_QWORD)v165);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v136, CFSTR("diversify_optional_top_stories"));

  }
LABEL_203:
  forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  if (forYouVideoGroupsConfig)
  {
    -[NTPBVideoGroupsConfig dictionaryRepresentation](forYouVideoGroupsConfig, "dictionaryRepresentation");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v138, CFSTR("for_you_video_groups_config"));

  }
  articleRecirculationConfig = self->_articleRecirculationConfig;
  if (articleRecirculationConfig)
    objc_msgSend(v4, "setObject:forKey:", articleRecirculationConfig, CFSTR("article_recirculation_config"));
  v140 = (uint64_t)self->_has;
  if ((v140 & 0x1000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_optionalTopStoriesRefreshRate);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v141, CFSTR("optional_top_stories_refresh_rate"));

    v140 = (uint64_t)self->_has;
  }
  v142 = *((_WORD *)&self->_has + 4);
  if ((v140 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_expirePinnedArticlesAfter);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v159, CFSTR("expire_pinned_articles_after"));

    v140 = (uint64_t)self->_has;
    v142 = *((_WORD *)&self->_has + 4);
    if ((v140 & 0x200000000000000) == 0)
    {
LABEL_211:
      if ((v140 & 0x100000000000000) == 0)
        goto LABEL_212;
      goto LABEL_235;
    }
  }
  else if ((v140 & 0x200000000000000) == 0)
  {
    goto LABEL_211;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_userSegmentationApiModThreshold, (_QWORD)v165);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v160, CFSTR("userSegmentationApiModThreshold"));

  v142 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x100000000000000) == 0)
  {
LABEL_212:
    if ((v142 & 1) == 0)
      goto LABEL_214;
    goto LABEL_213;
  }
LABEL_235:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_userSegmentationApiModMax, (_QWORD)v165);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v161, CFSTR("userSegmentationApiModMax"));

  if ((*((_WORD *)&self->_has + 4) & 1) != 0)
  {
LABEL_213:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_privateDataMigrationCleanupLevel, (_QWORD)v165);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v143, CFSTR("private_data_migration_cleanup_level"));

  }
LABEL_214:
  articleRecirculationComponentPlacementConfig = self->_articleRecirculationComponentPlacementConfig;
  if (articleRecirculationComponentPlacementConfig)
    objc_msgSend(v4, "setObject:forKey:", articleRecirculationComponentPlacementConfig, CFSTR("article_recirculation_component_placement_config"));
  v145 = (uint64_t)self->_has;
  if ((v145 & 0x1000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetEventImmediateUploadPopulationFloor);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v146, CFSTR("widget_event_immediate_upload_population_floor"));

    v145 = (uint64_t)self->_has;
  }
  v147 = *((_WORD *)&self->_has + 4);
  if ((v145 & 0x800000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetEventImmediateUploadPopulationCeiling);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v162, CFSTR("widget_event_immediate_upload_population_ceiling"));

    v145 = (uint64_t)self->_has;
    v147 = *((_WORD *)&self->_has + 4);
    if ((v145 & 0x400000000000000) == 0)
    {
LABEL_220:
      if ((v145 & 0x20) == 0)
        goto LABEL_221;
      goto LABEL_239;
    }
  }
  else if ((v145 & 0x400000000000000) == 0)
  {
    goto LABEL_220;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetEventImmediateUploadModuloForHashing, (_QWORD)v165);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v163, CFSTR("widget_event_immediate_upload_modulo_for_hashing"));

  v147 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x20) == 0)
  {
LABEL_221:
    if ((v147 & 0x20) == 0)
      goto LABEL_223;
    goto LABEL_222;
  }
LABEL_239:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_articleRecirculationPopularFeedQueryTimeRange, (_QWORD)v165);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v164, CFSTR("article_recirculation_popular_feed_query_time_range"));

  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
  {
LABEL_222:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_disableThumbnailsForArticleRecirculation, (_QWORD)v165);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v148, CFSTR("disable_thumbnails_for_article_recirculation"));

  }
LABEL_223:
  userSegmentationApiConfiguration = self->_userSegmentationApiConfiguration;
  if (userSegmentationApiConfiguration)
  {
    -[NTPBUserSegmentationApiConfiguration dictionaryRepresentation](userSegmentationApiConfiguration, "dictionaryRepresentation");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v150, CFSTR("user_segmentation_api_configuration"));

  }
  v151 = v4;

  return v151;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  $351BB551948112059CB39AA772662B50 *p_has;
  uint64_t v17;
  $351BB551948112059CB39AA772662B50 *v18;
  uint64_t v19;
  $351BB551948112059CB39AA772662B50 *v20;
  uint64_t v21;
  $351BB551948112059CB39AA772662B50 *v22;
  uint64_t v23;
  $351BB551948112059CB39AA772662B50 *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int16 v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  __int16 v35;
  unint64_t v36;
  $351BB551948112059CB39AA772662B50 *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_fallbackLanguageTag)
    PBDataWriterWriteStringField();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = self->_languageConfigs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v7);
  }

  has = (uint64_t)self->_has;
  if ((has & 0x100000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (uint64_t)self->_has;
  }
  if ((has & 0x20000) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_14:
      if ((has & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_149;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteBOOLField();
  has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteDoubleField();
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_16:
    if ((has & 0x2000000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_150:
  PBDataWriterWriteDoubleField();
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
LABEL_17:
    PBDataWriterWriteDoubleField();
LABEL_18:
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v11 = self->_endpointConfigs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v13);
  }

  if (self->_personalizationConfig)
    PBDataWriterWriteSubmessage();
  if (self->_iadConfig)
    PBDataWriterWriteSubmessage();
  if (self->_prefetchConfig)
    PBDataWriterWriteSubmessage();
  p_has = &self->_has;
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x8000000000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v17 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x800000) == 0)
    {
LABEL_33:
      if ((v17 & 0x8000) == 0)
        goto LABEL_34;
      goto LABEL_154;
    }
  }
  else if ((v17 & 0x800000) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x8000) == 0)
  {
LABEL_34:
    if ((v17 & 0x80) == 0)
      goto LABEL_35;
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x80) == 0)
  {
LABEL_35:
    if ((v17 & 0x80000000000000) == 0)
      goto LABEL_36;
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x80000000000000) == 0)
  {
LABEL_36:
    if ((v17 & 2) == 0)
      goto LABEL_37;
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_37:
    if ((v17 & 0x1000000) == 0)
      goto LABEL_38;
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x1000000) == 0)
  {
LABEL_38:
    if ((v17 & 0x20000000000000) == 0)
      goto LABEL_39;
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x20000000000000) == 0)
  {
LABEL_39:
    if ((v17 & 0x10000000000000) == 0)
      goto LABEL_40;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x10000000000000) == 0)
  {
LABEL_40:
    if ((v17 & 0x800000000) == 0)
      goto LABEL_41;
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x800000000) == 0)
  {
LABEL_41:
    if ((v17 & 0x10) == 0)
      goto LABEL_42;
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt64Field();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x10) == 0)
  {
LABEL_42:
    if ((v17 & 0x400000000000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_162:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x400000000000) != 0)
LABEL_43:
    PBDataWriterWriteInt64Field();
LABEL_44:
  if (self->_anfEmbedConfigurationAsset)
    PBDataWriterWriteStringField();
  v18 = &self->_has;
  v19 = (uint64_t)self->_has;
  if ((v19 & 0x2000000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v19 = *(_QWORD *)v18;
    if ((*(_QWORD *)v18 & 0x1000000000000) == 0)
    {
LABEL_48:
      if ((v19 & 0x800000000000) == 0)
        goto LABEL_49;
      goto LABEL_166;
    }
  }
  else if ((v19 & 0x1000000000000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteInt64Field();
  v19 = (uint64_t)self->_has;
  if ((v19 & 0x800000000000) == 0)
  {
LABEL_49:
    if ((v19 & 0x80000000) == 0)
      goto LABEL_50;
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteInt64Field();
  v19 = (uint64_t)self->_has;
  if ((v19 & 0x80000000) == 0)
  {
LABEL_50:
    if ((v19 & 0x1000) == 0)
      goto LABEL_51;
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteInt64Field();
  v19 = (uint64_t)self->_has;
  if ((v19 & 0x1000) == 0)
  {
LABEL_51:
    if ((v19 & 0x800) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_168:
  PBDataWriterWriteDoubleField();
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
LABEL_52:
    PBDataWriterWriteInt64Field();
LABEL_53:
  if (self->_widgetConfig)
    PBDataWriterWriteSubmessage();
  v20 = &self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
    PBDataWriterWriteBOOLField();
  v21 = *(_QWORD *)v20;
  if ((*(_QWORD *)v20 & 0x100000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v21 = (uint64_t)self->_has;
  }
  if ((v21 & 0x200000000) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_forYouNonPersonalizedGroupsOrder)
    PBDataWriterWriteStringField();
  v22 = &self->_has;
  v23 = (uint64_t)self->_has;
  if ((v23 & 0x400000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v23 = *(_QWORD *)v22;
    if ((*(_QWORD *)v22 & 0x40000000000) == 0)
    {
LABEL_65:
      if ((v23 & 0x20000000000) == 0)
        goto LABEL_66;
      goto LABEL_172;
    }
  }
  else if ((v23 & 0x40000000000) == 0)
  {
    goto LABEL_65;
  }
  PBDataWriterWriteInt64Field();
  v23 = (uint64_t)self->_has;
  if ((v23 & 0x20000000000) == 0)
  {
LABEL_66:
    if ((v23 & 0x10000000000) == 0)
      goto LABEL_67;
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteInt64Field();
  v23 = (uint64_t)self->_has;
  if ((v23 & 0x10000000000) == 0)
  {
LABEL_67:
    if ((v23 & 0x80000000000) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_173:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x80000000000) != 0)
LABEL_68:
    PBDataWriterWriteInt64Field();
LABEL_69:
  if (self->_alternativeButlerWidgetConfig)
    PBDataWriterWriteSubmessage();
  if ((*((_WORD *)&self->_has + 4) & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_butlerWidgetConfig)
    PBDataWriterWriteSubmessage();
  if (self->_paidSubscriptionConfig)
    PBDataWriterWriteSubmessage();
  v24 = &self->_has;
  v25 = (uint64_t)self->_has;
  if ((v25 & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    v25 = *(_QWORD *)v24;
    if ((*(_QWORD *)v24 & 4) == 0)
    {
LABEL_79:
      if ((v25 & 0x80000) == 0)
        goto LABEL_80;
      goto LABEL_177;
    }
  }
  else if ((v25 & 4) == 0)
  {
    goto LABEL_79;
  }
  PBDataWriterWriteDoubleField();
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x80000) == 0)
  {
LABEL_80:
    if ((v25 & 0x100000) == 0)
      goto LABEL_81;
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteInt64Field();
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x100000) == 0)
  {
LABEL_81:
    if ((v25 & 0x200000) == 0)
      goto LABEL_82;
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteInt64Field();
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x200000) == 0)
  {
LABEL_82:
    if ((v25 & 0x4000000000) == 0)
      goto LABEL_83;
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteInt64Field();
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x4000000000) == 0)
  {
LABEL_83:
    if ((v25 & 0x8000000000) == 0)
      goto LABEL_84;
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteDoubleField();
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x8000000000) == 0)
  {
LABEL_84:
    if ((v25 & 0x4000) == 0)
      goto LABEL_85;
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteDoubleField();
  v25 = (uint64_t)self->_has;
  if ((v25 & 0x4000) == 0)
  {
LABEL_85:
    if ((v25 & 0x40000) == 0)
      goto LABEL_87;
    goto LABEL_86;
  }
LABEL_182:
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
LABEL_86:
    PBDataWriterWriteInt64Field();
LABEL_87:
  if (self->_widgetConfig2)
    PBDataWriterWriteSubmessage();
  v26 = (uint64_t)self->_has;
  if ((v26 & 0x4000000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v26 = (uint64_t)self->_has;
  }
  if ((v26 & 0x40000000000000) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_binningConfig)
    PBDataWriterWriteSubmessage();
  if (self->_personalizationTreatment)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_personalizationBundleIdMappingResourceId)
    PBDataWriterWriteStringField();
  if (self->_personalizationUrlMappingResourceId)
    PBDataWriterWriteStringField();
  if (self->_personalizationWhitelistResourceId)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_personalizationPublisherFavorabilityScoresResourceId)
    PBDataWriterWriteStringField();
  if (self->_personalizationWidgetSectionMappingResourceId)
    PBDataWriterWriteStringField();
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x200) != 0)
  {
    PBDataWriterWriteInt64Field();
    v27 = (uint64_t)self->_has;
  }
  v28 = *((_WORD *)&self->_has + 4);
  if ((v27 & 0x400) != 0)
  {
    PBDataWriterWriteInt64Field();
    v28 = *((_WORD *)&self->_has + 4);
  }
  if ((v28 & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = self->_externalAnalyticsConfigs;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(v29);
        PBDataWriterWriteSubmessage();
      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v31);
  }

  if (self->_personalizationPortraitConfigResourceId)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_experimentalizableFieldPostfix)
    PBDataWriterWriteStringField();
  v34 = (uint64_t)self->_has;
  if ((v34 & 0x20000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v34 = (uint64_t)self->_has;
  }
  v35 = *((_WORD *)&self->_has + 4);
  if ((v35 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v34 = (uint64_t)self->_has;
    v35 = *((_WORD *)&self->_has + 4);
    if ((v35 & 0x800) == 0)
    {
LABEL_136:
      if ((v34 & 0x4000000000000000) == 0)
        goto LABEL_137;
      goto LABEL_186;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x800) == 0)
  {
    goto LABEL_136;
  }
  PBDataWriterWriteBOOLField();
  v34 = (uint64_t)self->_has;
  v35 = *((_WORD *)&self->_has + 4);
  if ((v34 & 0x4000000000000000) == 0)
  {
LABEL_137:
    if ((v34 & 0x200000000000) == 0)
      goto LABEL_138;
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteUint32Field();
  v34 = (uint64_t)self->_has;
  v35 = *((_WORD *)&self->_has + 4);
  if ((v34 & 0x200000000000) == 0)
  {
LABEL_138:
    if ((v34 & 0x40) == 0)
      goto LABEL_139;
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteInt64Field();
  v35 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x40) == 0)
  {
LABEL_139:
    if ((v35 & 0x200) == 0)
      goto LABEL_141;
    goto LABEL_140;
  }
LABEL_188:
  PBDataWriterWriteInt64Field();
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
LABEL_140:
    PBDataWriterWriteBOOLField();
LABEL_141:
  if (self->_topStoriesPublishTimeIntervals.count)
  {
    v36 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v36;
    }
    while (v36 < self->_topStoriesPublishTimeIntervals.count);
  }
  v37 = &self->_has;
  v38 = *((_WORD *)&self->_has + 4);
  if ((v38 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v39 = *(_QWORD *)v37;
    v38 = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)v37 & 0x400000) == 0)
      goto LABEL_192;
    goto LABEL_191;
  }
  v39 = *(_QWORD *)v37;
  if ((*(_QWORD *)v37 & 0x400000) != 0)
  {
LABEL_191:
    PBDataWriterWriteDoubleField();
    v39 = (uint64_t)self->_has;
    v38 = *((_WORD *)&self->_has + 4);
  }
LABEL_192:
  if ((v39 & 0x40000000) != 0)
  {
    PBDataWriterWriteDoubleField();
    v39 = (uint64_t)self->_has;
    v38 = *((_WORD *)&self->_has + 4);
    if ((v38 & 2) == 0)
    {
LABEL_194:
      if ((v39 & 0x2000000) == 0)
        goto LABEL_195;
      goto LABEL_225;
    }
  }
  else if ((v38 & 2) == 0)
  {
    goto LABEL_194;
  }
  PBDataWriterWriteInt32Field();
  v39 = (uint64_t)self->_has;
  v38 = *((_WORD *)&self->_has + 4);
  if ((v39 & 0x2000000) == 0)
  {
LABEL_195:
    if ((v39 & 0x4000000) == 0)
      goto LABEL_196;
    goto LABEL_226;
  }
LABEL_225:
  PBDataWriterWriteInt64Field();
  v39 = (uint64_t)self->_has;
  v38 = *((_WORD *)&self->_has + 4);
  if ((v39 & 0x4000000) == 0)
  {
LABEL_196:
    if ((v39 & 0x8000000) == 0)
      goto LABEL_197;
    goto LABEL_227;
  }
LABEL_226:
  PBDataWriterWriteInt64Field();
  v39 = (uint64_t)self->_has;
  v38 = *((_WORD *)&self->_has + 4);
  if ((v39 & 0x8000000) == 0)
  {
LABEL_197:
    if ((v39 & 0x10000000) == 0)
      goto LABEL_198;
    goto LABEL_228;
  }
LABEL_227:
  PBDataWriterWriteInt64Field();
  v38 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_198:
    if ((v38 & 0x40) == 0)
      goto LABEL_200;
    goto LABEL_199;
  }
LABEL_228:
  PBDataWriterWriteInt64Field();
  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
LABEL_199:
    PBDataWriterWriteBOOLField();
LABEL_200:
  if (self->_forYouVideoGroupsConfig)
    PBDataWriterWriteSubmessage();
  if (self->_articleRecirculationConfig)
    PBDataWriterWriteStringField();
  v40 = (uint64_t)self->_has;
  if ((v40 & 0x1000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v40 = (uint64_t)self->_has;
  }
  v41 = *((_WORD *)&self->_has + 4);
  if ((v40 & 0x2000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v40 = (uint64_t)self->_has;
    v41 = *((_WORD *)&self->_has + 4);
    if ((v40 & 0x200000000000000) == 0)
    {
LABEL_208:
      if ((v40 & 0x100000000000000) == 0)
        goto LABEL_209;
      goto LABEL_232;
    }
  }
  else if ((v40 & 0x200000000000000) == 0)
  {
    goto LABEL_208;
  }
  PBDataWriterWriteInt64Field();
  v41 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x100000000000000) == 0)
  {
LABEL_209:
    if ((v41 & 1) == 0)
      goto LABEL_211;
    goto LABEL_210;
  }
LABEL_232:
  PBDataWriterWriteInt64Field();
  if ((*((_WORD *)&self->_has + 4) & 1) != 0)
LABEL_210:
    PBDataWriterWriteUint32Field();
LABEL_211:
  if (self->_articleRecirculationComponentPlacementConfig)
    PBDataWriterWriteStringField();
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x1000000000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v42 = (uint64_t)self->_has;
  }
  v43 = *((_WORD *)&self->_has + 4);
  if ((v42 & 0x800000000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v42 = (uint64_t)self->_has;
    v43 = *((_WORD *)&self->_has + 4);
    if ((v42 & 0x400000000000000) == 0)
    {
LABEL_217:
      if ((v42 & 0x20) == 0)
        goto LABEL_218;
      goto LABEL_236;
    }
  }
  else if ((v42 & 0x400000000000000) == 0)
  {
    goto LABEL_217;
  }
  PBDataWriterWriteInt64Field();
  v43 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x20) == 0)
  {
LABEL_218:
    if ((v43 & 0x20) == 0)
      goto LABEL_220;
    goto LABEL_219;
  }
LABEL_236:
  PBDataWriterWriteInt64Field();
  if ((*((_WORD *)&self->_has + 4) & 0x20) != 0)
LABEL_219:
    PBDataWriterWriteBOOLField();
LABEL_220:
  if (self->_userSegmentationApiConfiguration)
    PBDataWriterWriteSubmessage();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t has;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  $351BB551948112059CB39AA772662B50 *p_has;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  $351BB551948112059CB39AA772662B50 *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  $351BB551948112059CB39AA772662B50 *v38;
  uint64_t v39;
  id v40;
  void *v41;
  $351BB551948112059CB39AA772662B50 *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  __int16 v66;
  NSMutableArray *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t k;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  __int16 v78;
  $351BB551948112059CB39AA772662B50 *v79;
  __int16 v80;
  uint64_t v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  __int16 v91;
  id v92;
  void *v93;
  id v94;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_fallbackLanguageTag, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 600);
  *(_QWORD *)(v5 + 600) = v6;

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v8 = self->_languageConfigs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v104, v110, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v105 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLanguageConfigs:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v104, v110, 16);
    }
    while (v10);
  }

  has = (uint64_t)self->_has;
  if ((has & 0x100000000000) != 0)
  {
    *(_QWORD *)(v5 + 384) = self->_shortReminderTime;
    *(_QWORD *)(v5 + 772) |= 0x100000000000uLL;
    has = (uint64_t)self->_has;
  }
  if ((has & 0x20000) != 0)
  {
    *(_QWORD *)(v5 + 168) = self->_longReminderTime;
    *(_QWORD *)(v5 + 772) |= 0x20000uLL;
    has = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_12:
      if ((has & 0x100) == 0)
        goto LABEL_13;
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
  {
    goto LABEL_12;
  }
  *(_BYTE *)(v5 + 765) = self->_newsletterSubscriptionChecked;
  *(_WORD *)(v5 + 780) |= 0x80u;
  has = (uint64_t)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x10000) == 0)
      goto LABEL_14;
    goto LABEL_107;
  }
LABEL_106:
  *(double *)(v5 + 96) = self->_batchedFeedTimeout;
  *(_QWORD *)(v5 + 772) |= 0x100uLL;
  has = (uint64_t)self->_has;
  if ((has & 0x10000) == 0)
  {
LABEL_14:
    if ((has & 0x2000000000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_107:
  *(double *)(v5 + 160) = self->_interstitialAdLoadDelay;
  *(_QWORD *)(v5 + 772) |= 0x10000uLL;
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
  {
LABEL_15:
    *(double *)(v5 + 328) = self->_prerollLoadingTimeout;
    *(_QWORD *)(v5 + 772) |= 0x2000000000uLL;
  }
LABEL_16:
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v15 = self->_endpointConfigs;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v101 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addEndpointConfigs:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
    }
    while (v17);
  }

  v21 = -[NTPBPersonalizationConfig copyWithZone:](self->_personalizationConfig, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 664);
  *(_QWORD *)(v5 + 664) = v21;

  v23 = -[NTPBIAdConfig copyWithZone:](self->_iadConfig, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 624);
  *(_QWORD *)(v5 + 624) = v23;

  v25 = -[NTPBPrefetchConfig copyWithZone:](self->_prefetchConfig, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 720);
  *(_QWORD *)(v5 + 720) = v25;

  p_has = &self->_has;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x8000000000000) != 0)
  {
    *(double *)(v5 + 440) = self->_tileProminenceScoreBalanceValue;
    *(_QWORD *)(v5 + 772) |= 0x8000000000000uLL;
    v28 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x800000) == 0)
    {
LABEL_25:
      if ((v28 & 0x8000) == 0)
        goto LABEL_26;
      goto LABEL_111;
    }
  }
  else if ((v28 & 0x800000) == 0)
  {
    goto LABEL_25;
  }
  *(_QWORD *)(v5 + 216) = self->_minimumArticleUpdateInterval;
  *(_QWORD *)(v5 + 772) |= 0x800000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x8000) == 0)
  {
LABEL_26:
    if ((v28 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_112;
  }
LABEL_111:
  *(_QWORD *)(v5 + 152) = self->_initialArticlesFromNewFavorite;
  *(_QWORD *)(v5 + 772) |= 0x8000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x80) == 0)
  {
LABEL_27:
    if ((v28 & 0x80000000000000) == 0)
      goto LABEL_28;
    goto LABEL_113;
  }
LABEL_112:
  *(_QWORD *)(v5 + 88) = self->_autoScrollToTopFeedTimeout;
  *(_QWORD *)(v5 + 772) |= 0x80uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x80000000000000) == 0)
  {
LABEL_28:
    if ((v28 & 2) == 0)
      goto LABEL_29;
    goto LABEL_114;
  }
LABEL_113:
  *(_QWORD *)(v5 + 472) = self->_trendingTopicsRefreshRate;
  *(_QWORD *)(v5 + 772) |= 0x80000000000000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 2) == 0)
  {
LABEL_29:
    if ((v28 & 0x1000000) == 0)
      goto LABEL_30;
    goto LABEL_115;
  }
LABEL_114:
  *(_QWORD *)(v5 + 40) = self->_appConfigRefreshRate;
  *(_QWORD *)(v5 + 772) |= 2uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x1000000) == 0)
  {
LABEL_30:
    if ((v28 & 0x20000000000000) == 0)
      goto LABEL_31;
    goto LABEL_116;
  }
LABEL_115:
  *(_QWORD *)(v5 + 224) = self->_minimumDistanceBetweenImageOnTopTiles;
  *(_QWORD *)(v5 + 772) |= 0x1000000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x20000000000000) == 0)
  {
LABEL_31:
    if ((v28 & 0x10000000000000) == 0)
      goto LABEL_32;
    goto LABEL_117;
  }
LABEL_116:
  *(_QWORD *)(v5 + 456) = self->_timeBetweenWidgetInsertions;
  *(_QWORD *)(v5 + 772) |= 0x20000000000000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x10000000000000) == 0)
  {
LABEL_32:
    if ((v28 & 0x800000000) == 0)
      goto LABEL_33;
    goto LABEL_118;
  }
LABEL_117:
  *(_QWORD *)(v5 + 448) = self->_timeBetweenSameWidgetReinsertion;
  *(_QWORD *)(v5 + 772) |= 0x10000000000000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x800000000) == 0)
  {
LABEL_33:
    if ((v28 & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_119;
  }
LABEL_118:
  *(_QWORD *)(v5 + 312) = self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit;
  *(_QWORD *)(v5 + 772) |= 0x800000000uLL;
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x10) == 0)
  {
LABEL_34:
    if ((v28 & 0x400000000000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_119:
  *(_QWORD *)(v5 + 64) = self->_articleRapidUpdatesTimeout;
  *(_QWORD *)(v5 + 772) |= 0x10uLL;
  if ((*(_QWORD *)&self->_has & 0x400000000000) != 0)
  {
LABEL_35:
    *(_QWORD *)(v5 + 400) = self->_subscriptionsGlobalMeteredCount;
    *(_QWORD *)(v5 + 772) |= 0x400000000000uLL;
  }
LABEL_36:
  v29 = -[NSString copyWithZone:](self->_anfEmbedConfigurationAsset, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 528);
  *(_QWORD *)(v5 + 528) = v29;

  v31 = &self->_has;
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x2000000000000) != 0)
  {
    *(_QWORD *)(v5 + 424) = self->_subscriptionsPlacardPublisherFrequencyDays;
    *(_QWORD *)(v5 + 772) |= 0x2000000000000uLL;
    v32 = *(_QWORD *)v31;
    if ((*(_QWORD *)v31 & 0x1000000000000) == 0)
    {
LABEL_38:
      if ((v32 & 0x800000000000) == 0)
        goto LABEL_39;
      goto LABEL_123;
    }
  }
  else if ((v32 & 0x1000000000000) == 0)
  {
    goto LABEL_38;
  }
  *(_QWORD *)(v5 + 416) = self->_subscriptionsPlacardGlobalMaxPerDay;
  *(_QWORD *)(v5 + 772) |= 0x1000000000000uLL;
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x800000000000) == 0)
  {
LABEL_39:
    if ((v32 & 0x80000000) == 0)
      goto LABEL_40;
    goto LABEL_124;
  }
LABEL_123:
  *(_QWORD *)(v5 + 408) = self->_subscriptionsGracePeriodForTokenVerificationSeconds;
  *(_QWORD *)(v5 + 772) |= 0x800000000000uLL;
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x80000000) == 0)
  {
LABEL_40:
    if ((v32 & 0x1000) == 0)
      goto LABEL_41;
    goto LABEL_125;
  }
LABEL_124:
  *(_QWORD *)(v5 + 280) = self->_newFavoriteNotificationAlertsFrequency;
  *(_QWORD *)(v5 + 772) |= 0x80000000uLL;
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x1000) == 0)
  {
LABEL_41:
    if ((v32 & 0x800) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_125:
  *(double *)(v5 + 128) = self->_endOfArticleMinPaidHeadlineRatio;
  *(_QWORD *)(v5 + 772) |= 0x1000uLL;
  if ((*(_QWORD *)&self->_has & 0x800) != 0)
  {
LABEL_42:
    *(_QWORD *)(v5 + 120) = self->_endOfArticleMaxInaccessiblePaidArticles;
    *(_QWORD *)(v5 + 772) |= 0x800uLL;
  }
LABEL_43:
  v33 = -[NTPBWidgetConfig copyWithZone:](self->_widgetConfig, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 744);
  *(_QWORD *)(v5 + 744) = v33;

  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 768) = self->_universalLinksEnabled;
    *(_WORD *)(v5 + 780) |= 0x400u;
  }
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x100000000) != 0)
  {
    *(_QWORD *)(v5 + 288) = self->_notificationArticleCacheTimeout;
    *(_QWORD *)(v5 + 772) |= 0x100000000uLL;
    v35 = (uint64_t)self->_has;
  }
  if ((v35 & 0x200000000) != 0)
  {
    *(_QWORD *)(v5 + 296) = self->_notificationArticleWithRapidUpdatesCacheTimeout;
    *(_QWORD *)(v5 + 772) |= 0x200000000uLL;
  }
  v36 = -[NSString copyWithZone:](self->_forYouNonPersonalizedGroupsOrder, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 608);
  *(_QWORD *)(v5 + 608) = v36;

  v38 = &self->_has;
  v39 = (uint64_t)self->_has;
  if ((v39 & 0x400000000) != 0)
  {
    *(_QWORD *)(v5 + 304) = self->_notificationEnabledChannelsRefreshFrequency;
    *(_QWORD *)(v5 + 772) |= 0x400000000uLL;
    v39 = *(_QWORD *)v38;
    if ((*(_QWORD *)v38 & 0x40000000000) == 0)
    {
LABEL_51:
      if ((v39 & 0x20000000000) == 0)
        goto LABEL_52;
      goto LABEL_129;
    }
  }
  else if ((v39 & 0x40000000000) == 0)
  {
    goto LABEL_51;
  }
  *(_QWORD *)(v5 + 368) = self->_savedArticlesMaximumCountWifi;
  *(_QWORD *)(v5 + 772) |= 0x40000000000uLL;
  v39 = (uint64_t)self->_has;
  if ((v39 & 0x20000000000) == 0)
  {
LABEL_52:
    if ((v39 & 0x10000000000) == 0)
      goto LABEL_53;
    goto LABEL_130;
  }
LABEL_129:
  *(_QWORD *)(v5 + 360) = self->_savedArticlesMaximumCountCellular;
  *(_QWORD *)(v5 + 772) |= 0x20000000000uLL;
  v39 = (uint64_t)self->_has;
  if ((v39 & 0x10000000000) == 0)
  {
LABEL_53:
    if ((v39 & 0x80000000000) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_130:
  *(_QWORD *)(v5 + 352) = self->_savedArticlesCutoffTime;
  *(_QWORD *)(v5 + 772) |= 0x10000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000000000) != 0)
  {
LABEL_54:
    *(_QWORD *)(v5 + 376) = self->_savedArticlesOpenedCutoffTime;
    *(_QWORD *)(v5 + 772) |= 0x80000000000uLL;
  }
LABEL_55:
  v40 = -[NTPBWidgetConfig copyWithZone:](self->_alternativeButlerWidgetConfig, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 520);
  *(_QWORD *)(v5 + 520) = v40;

  v42 = &self->_has;
  if ((*((_WORD *)&self->_has + 4) & 4) != 0)
  {
    *(_BYTE *)(v5 + 760) = self->_alternativeButlerWidgetConfigEnabled;
    *(_WORD *)(v5 + 780) |= 4u;
  }
  v43 = -[NTPBWidgetConfig copyWithZone:](self->_butlerWidgetConfig, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 560);
  *(_QWORD *)(v5 + 560) = v43;

  v45 = -[NTPBPaidSubscriptionConfig copyWithZone:](self->_paidSubscriptionConfig, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 648);
  *(_QWORD *)(v5 + 648) = v45;

  v47 = *(_QWORD *)v42;
  if ((*(_QWORD *)v42 & 8) != 0)
  {
    *(double *)(v5 + 56) = self->_articleDiversitySimilarityExpectationStart;
    *(_QWORD *)(v5 + 772) |= 8uLL;
    v47 = (uint64_t)self->_has;
    if ((v47 & 4) == 0)
    {
LABEL_59:
      if ((v47 & 0x80000) == 0)
        goto LABEL_60;
      goto LABEL_134;
    }
  }
  else if ((v47 & 4) == 0)
  {
    goto LABEL_59;
  }
  *(double *)(v5 + 48) = self->_articleDiversitySimilarityExpectationEnd;
  *(_QWORD *)(v5 + 772) |= 4uLL;
  v47 = (uint64_t)self->_has;
  if ((v47 & 0x80000) == 0)
  {
LABEL_60:
    if ((v47 & 0x100000) == 0)
      goto LABEL_61;
    goto LABEL_135;
  }
LABEL_134:
  *(_QWORD *)(v5 + 184) = self->_maxPaidSubscriptionGroupSizeIPad;
  *(_QWORD *)(v5 + 772) |= 0x80000uLL;
  v47 = (uint64_t)self->_has;
  if ((v47 & 0x100000) == 0)
  {
LABEL_61:
    if ((v47 & 0x200000) == 0)
      goto LABEL_62;
    goto LABEL_136;
  }
LABEL_135:
  *(_QWORD *)(v5 + 192) = self->_maxPaidSubscriptionGroupSizeIPhone;
  *(_QWORD *)(v5 + 772) |= 0x100000uLL;
  v47 = (uint64_t)self->_has;
  if ((v47 & 0x200000) == 0)
  {
LABEL_62:
    if ((v47 & 0x4000000000) == 0)
      goto LABEL_63;
    goto LABEL_137;
  }
LABEL_136:
  *(_QWORD *)(v5 + 200) = self->_maxTimesHeadlineInPaidSubscriptionGroup;
  *(_QWORD *)(v5 + 772) |= 0x200000uLL;
  v47 = (uint64_t)self->_has;
  if ((v47 & 0x4000000000) == 0)
  {
LABEL_63:
    if ((v47 & 0x8000000000) == 0)
      goto LABEL_64;
    goto LABEL_138;
  }
LABEL_137:
  *(double *)(v5 + 336) = self->_publisherDiversitySlope;
  *(_QWORD *)(v5 + 772) |= 0x4000000000uLL;
  v47 = (uint64_t)self->_has;
  if ((v47 & 0x8000000000) == 0)
  {
LABEL_64:
    if ((v47 & 0x4000) == 0)
      goto LABEL_65;
    goto LABEL_139;
  }
LABEL_138:
  *(double *)(v5 + 344) = self->_publisherDiversityYIntercept;
  *(_QWORD *)(v5 + 772) |= 0x8000000000uLL;
  v47 = (uint64_t)self->_has;
  if ((v47 & 0x4000) == 0)
  {
LABEL_65:
    if ((v47 & 0x40000) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_139:
  *(_QWORD *)(v5 + 144) = self->_expiredPaidSubscriptionGroupCutoffTime;
  *(_QWORD *)(v5 + 772) |= 0x4000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
  {
LABEL_66:
    *(_QWORD *)(v5 + 176) = self->_maxExpiredPaidSubscriptionGroupCount;
    *(_QWORD *)(v5 + 772) |= 0x40000uLL;
  }
LABEL_67:
  v48 = -[NTPBWidgetConfig copyWithZone:](self->_widgetConfig2, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 752);
  *(_QWORD *)(v5 + 752) = v48;

  v50 = (uint64_t)self->_has;
  if ((v50 & 0x4000000000000) != 0)
  {
    *(_QWORD *)(v5 + 432) = self->_subscriptionsPlacardPublisherFrequencySeconds;
    *(_QWORD *)(v5 + 772) |= 0x4000000000000uLL;
    v50 = (uint64_t)self->_has;
  }
  if ((v50 & 0x40000000000000) != 0)
  {
    *(_QWORD *)(v5 + 464) = self->_treatmentId;
    *(_QWORD *)(v5 + 772) |= 0x40000000000000uLL;
  }
  v51 = -[NTPBBinningConfig copyWithZone:](self->_binningConfig, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 552);
  *(_QWORD *)(v5 + 552) = v51;

  v53 = -[NTPBPersonalizationTreatment copyWithZone:](self->_personalizationTreatment, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 688);
  *(_QWORD *)(v5 + 688) = v53;

  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_analyticsEndpointMaxPayloadSize;
    *(_QWORD *)(v5 + 772) |= 1uLL;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 766) = self->_orderFeedEndpointEnabled;
    *(_WORD *)(v5 + 780) |= 0x100u;
  }
  v55 = -[NSString copyWithZone:](self->_personalizationBundleIdMappingResourceId, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 656);
  *(_QWORD *)(v5 + 656) = v55;

  v57 = -[NSString copyWithZone:](self->_personalizationUrlMappingResourceId, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 696);
  *(_QWORD *)(v5 + 696) = v57;

  v59 = -[NSString copyWithZone:](self->_personalizationWhitelistResourceId, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 704);
  *(_QWORD *)(v5 + 704) = v59;

  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
  {
    *(_DWORD *)(v5 + 568) = self->_enabledPrivateDataEncryptionLevel;
    *(_QWORD *)(v5 + 772) |= 0x2000000000000000uLL;
  }
  v61 = -[NSString copyWithZone:](self->_personalizationPublisherFavorabilityScoresResourceId, "copyWithZone:", a3);
  v62 = *(void **)(v5 + 680);
  *(_QWORD *)(v5 + 680) = v61;

  v63 = -[NSString copyWithZone:](self->_personalizationWidgetSectionMappingResourceId, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 712);
  *(_QWORD *)(v5 + 712) = v63;

  v65 = (uint64_t)self->_has;
  if ((v65 & 0x200) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_corryBarMaxArticleCountForArticleList;
    *(_QWORD *)(v5 + 772) |= 0x200uLL;
    v65 = (uint64_t)self->_has;
  }
  v66 = *((_WORD *)&self->_has + 4);
  if ((v65 & 0x400) != 0)
  {
    *(_QWORD *)(v5 + 112) = self->_corryBarMaxArticleCountForSingleArticle;
    *(_QWORD *)(v5 + 772) |= 0x400uLL;
    v66 = *((_WORD *)&self->_has + 4);
  }
  if ((v66 & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 762) = self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
    *(_WORD *)(v5 + 780) |= 0x10u;
  }
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v67 = self->_externalAnalyticsConfigs;
  v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v69; ++k)
      {
        if (*(_QWORD *)v97 != v70)
          objc_enumerationMutation(v67);
        v72 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v96);
        objc_msgSend((id)v5, "addExternalAnalyticsConfig:", v72);

      }
      v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
    }
    while (v69);
  }

  v73 = -[NSString copyWithZone:](self->_personalizationPortraitConfigResourceId, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 672);
  *(_QWORD *)(v5 + 672) = v73;

  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
  {
    *(_DWORD *)(v5 + 644) = self->_orderFeedEnabledLevelDeprecated;
    *(_QWORD *)(v5 + 772) |= 0x8000000000000000;
  }
  v75 = -[NSString copyWithZone:](self->_experimentalizableFieldPostfix, "copyWithZone:", a3, (_QWORD)v96);
  v76 = *(void **)(v5 + 584);
  *(_QWORD *)(v5 + 584) = v75;

  v77 = (uint64_t)self->_has;
  if ((v77 & 0x20000000) != 0)
  {
    *(_QWORD *)(v5 + 264) = self->_minimumFollowCountToRemovePersonalizePlacardInFollowing;
    *(_QWORD *)(v5 + 772) |= 0x20000000uLL;
    v77 = (uint64_t)self->_has;
  }
  v78 = *((_WORD *)&self->_has + 4);
  if ((v78 & 0x1000) != 0)
  {
    *(_BYTE *)(v5 + 770) = self->_useSecureConnectionForAssets;
    *(_WORD *)(v5 + 780) |= 0x1000u;
    v77 = (uint64_t)self->_has;
    v78 = *((_WORD *)&self->_has + 4);
    if ((v78 & 0x800) == 0)
    {
LABEL_96:
      if ((v77 & 0x4000000000000000) == 0)
        goto LABEL_97;
      goto LABEL_143;
    }
  }
  else if ((*((_WORD *)&self->_has + 4) & 0x800) == 0)
  {
    goto LABEL_96;
  }
  *(_BYTE *)(v5 + 769) = self->_usUkUseAuWhatsNewFeatures;
  *(_WORD *)(v5 + 780) |= 0x800u;
  v77 = (uint64_t)self->_has;
  v78 = *((_WORD *)&self->_has + 4);
  if ((v77 & 0x4000000000000000) == 0)
  {
LABEL_97:
    if ((v77 & 0x200000000000) == 0)
      goto LABEL_98;
    goto LABEL_144;
  }
LABEL_143:
  *(_DWORD *)(v5 + 640) = self->_orderFeedEnabledLevel;
  *(_QWORD *)(v5 + 772) |= 0x4000000000000000uLL;
  v77 = (uint64_t)self->_has;
  v78 = *((_WORD *)&self->_has + 4);
  if ((v77 & 0x200000000000) == 0)
  {
LABEL_98:
    if ((v77 & 0x40) == 0)
      goto LABEL_99;
    goto LABEL_145;
  }
LABEL_144:
  *(_QWORD *)(v5 + 392) = self->_stateRestorationAllowedTimeWindow;
  *(_QWORD *)(v5 + 772) |= 0x200000000000uLL;
  v78 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x40) == 0)
  {
LABEL_99:
    if ((v78 & 0x200) == 0)
      goto LABEL_101;
    goto LABEL_100;
  }
LABEL_145:
  *(_QWORD *)(v5 + 80) = self->_autoRefreshMinimumInterval;
  *(_QWORD *)(v5 + 772) |= 0x40uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
LABEL_100:
    *(_BYTE *)(v5 + 767) = self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
    *(_WORD *)(v5 + 780) |= 0x200u;
  }
LABEL_101:
  PBRepeatedInt64Copy();
  v79 = &self->_has;
  v80 = *((_WORD *)&self->_has + 4);
  if ((v80 & 8) != 0)
  {
    *(_BYTE *)(v5 + 761) = self->_articleSearchEnabled;
    *(_WORD *)(v5 + 780) |= 8u;
    v81 = *(_QWORD *)v79;
    v80 = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)v79 & 0x400000) == 0)
      goto LABEL_149;
    goto LABEL_148;
  }
  v81 = *(_QWORD *)v79;
  if ((*(_QWORD *)v79 & 0x400000) != 0)
  {
LABEL_148:
    *(double *)(v5 + 208) = self->_maximumRatioOfArticlesInForYouGroup;
    *(_QWORD *)(v5 + 772) |= 0x400000uLL;
    v81 = (uint64_t)self->_has;
    v80 = *((_WORD *)&self->_has + 4);
  }
LABEL_149:
  if ((v81 & 0x40000000) != 0)
  {
    *(double *)(v5 + 272) = self->_minimumTrendingUnseenRatio;
    *(_QWORD *)(v5 + 772) |= 0x40000000uLL;
    v81 = (uint64_t)self->_has;
    v80 = *((_WORD *)&self->_has + 4);
    if ((v80 & 2) == 0)
    {
LABEL_151:
      if ((v81 & 0x2000000) == 0)
        goto LABEL_152;
      goto LABEL_174;
    }
  }
  else if ((v80 & 2) == 0)
  {
    goto LABEL_151;
  }
  *(_DWORD *)(v5 + 732) = self->_trendingStyle;
  *(_WORD *)(v5 + 780) |= 2u;
  v81 = (uint64_t)self->_has;
  v80 = *((_WORD *)&self->_has + 4);
  if ((v81 & 0x2000000) == 0)
  {
LABEL_152:
    if ((v81 & 0x4000000) == 0)
      goto LABEL_153;
    goto LABEL_175;
  }
LABEL_174:
  *(_QWORD *)(v5 + 232) = self->_minimumDurationBetweenForYouGroupsWeekday;
  *(_QWORD *)(v5 + 772) |= 0x2000000uLL;
  v81 = (uint64_t)self->_has;
  v80 = *((_WORD *)&self->_has + 4);
  if ((v81 & 0x4000000) == 0)
  {
LABEL_153:
    if ((v81 & 0x8000000) == 0)
      goto LABEL_154;
    goto LABEL_176;
  }
LABEL_175:
  *(_QWORD *)(v5 + 240) = self->_minimumDurationBetweenForYouGroupsWeekend;
  *(_QWORD *)(v5 + 772) |= 0x4000000uLL;
  v81 = (uint64_t)self->_has;
  v80 = *((_WORD *)&self->_has + 4);
  if ((v81 & 0x8000000) == 0)
  {
LABEL_154:
    if ((v81 & 0x10000000) == 0)
      goto LABEL_155;
    goto LABEL_177;
  }
LABEL_176:
  *(_QWORD *)(v5 + 248) = self->_minimumDurationBetweenTrendingGroupsWeekday;
  *(_QWORD *)(v5 + 772) |= 0x8000000uLL;
  v80 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x10000000) == 0)
  {
LABEL_155:
    if ((v80 & 0x40) == 0)
      goto LABEL_157;
    goto LABEL_156;
  }
LABEL_177:
  *(_QWORD *)(v5 + 256) = self->_minimumDurationBetweenTrendingGroupsWeekend;
  *(_QWORD *)(v5 + 772) |= 0x10000000uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
  {
LABEL_156:
    *(_BYTE *)(v5 + 764) = self->_diversifyOptionalTopStories;
    *(_WORD *)(v5 + 780) |= 0x40u;
  }
LABEL_157:
  v82 = -[NTPBVideoGroupsConfig copyWithZone:](self->_forYouVideoGroupsConfig, "copyWithZone:", a3);
  v83 = *(void **)(v5 + 616);
  *(_QWORD *)(v5 + 616) = v82;

  v84 = -[NSString copyWithZone:](self->_articleRecirculationConfig, "copyWithZone:", a3);
  v85 = *(void **)(v5 + 544);
  *(_QWORD *)(v5 + 544) = v84;

  v86 = (uint64_t)self->_has;
  if ((v86 & 0x1000000000) != 0)
  {
    *(_QWORD *)(v5 + 320) = self->_optionalTopStoriesRefreshRate;
    *(_QWORD *)(v5 + 772) |= 0x1000000000uLL;
    v86 = (uint64_t)self->_has;
  }
  v87 = *((_WORD *)&self->_has + 4);
  if ((v86 & 0x2000) != 0)
  {
    *(_QWORD *)(v5 + 136) = self->_expirePinnedArticlesAfter;
    *(_QWORD *)(v5 + 772) |= 0x2000uLL;
    v86 = (uint64_t)self->_has;
    v87 = *((_WORD *)&self->_has + 4);
    if ((v86 & 0x200000000000000) == 0)
    {
LABEL_161:
      if ((v86 & 0x100000000000000) == 0)
        goto LABEL_162;
      goto LABEL_181;
    }
  }
  else if ((v86 & 0x200000000000000) == 0)
  {
    goto LABEL_161;
  }
  *(_QWORD *)(v5 + 488) = self->_userSegmentationApiModThreshold;
  *(_QWORD *)(v5 + 772) |= 0x200000000000000uLL;
  v87 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x100000000000000) == 0)
  {
LABEL_162:
    if ((v87 & 1) == 0)
      goto LABEL_164;
    goto LABEL_163;
  }
LABEL_181:
  *(_QWORD *)(v5 + 480) = self->_userSegmentationApiModMax;
  *(_QWORD *)(v5 + 772) |= 0x100000000000000uLL;
  if ((*((_WORD *)&self->_has + 4) & 1) != 0)
  {
LABEL_163:
    *(_DWORD *)(v5 + 728) = self->_privateDataMigrationCleanupLevel;
    *(_WORD *)(v5 + 780) |= 1u;
  }
LABEL_164:
  v88 = -[NSString copyWithZone:](self->_articleRecirculationComponentPlacementConfig, "copyWithZone:", a3);
  v89 = *(void **)(v5 + 536);
  *(_QWORD *)(v5 + 536) = v88;

  v90 = (uint64_t)self->_has;
  if ((v90 & 0x1000000000000000) != 0)
  {
    *(_QWORD *)(v5 + 512) = self->_widgetEventImmediateUploadPopulationFloor;
    *(_QWORD *)(v5 + 772) |= 0x1000000000000000uLL;
    v90 = (uint64_t)self->_has;
  }
  v91 = *((_WORD *)&self->_has + 4);
  if ((v90 & 0x800000000000000) != 0)
  {
    *(_QWORD *)(v5 + 504) = self->_widgetEventImmediateUploadPopulationCeiling;
    *(_QWORD *)(v5 + 772) |= 0x800000000000000uLL;
    v90 = (uint64_t)self->_has;
    v91 = *((_WORD *)&self->_has + 4);
    if ((v90 & 0x400000000000000) == 0)
    {
LABEL_168:
      if ((v90 & 0x20) == 0)
        goto LABEL_169;
LABEL_185:
      *(_QWORD *)(v5 + 72) = self->_articleRecirculationPopularFeedQueryTimeRange;
      *(_QWORD *)(v5 + 772) |= 0x20uLL;
      if ((*((_WORD *)&self->_has + 4) & 0x20) == 0)
        goto LABEL_171;
      goto LABEL_170;
    }
  }
  else if ((v90 & 0x400000000000000) == 0)
  {
    goto LABEL_168;
  }
  *(_QWORD *)(v5 + 496) = self->_widgetEventImmediateUploadModuloForHashing;
  *(_QWORD *)(v5 + 772) |= 0x400000000000000uLL;
  v91 = *((_WORD *)&self->_has + 4);
  if ((*(_QWORD *)&self->_has & 0x20) != 0)
    goto LABEL_185;
LABEL_169:
  if ((v91 & 0x20) != 0)
  {
LABEL_170:
    *(_BYTE *)(v5 + 763) = self->_disableThumbnailsForArticleRecirculation;
    *(_WORD *)(v5 + 780) |= 0x20u;
  }
LABEL_171:
  v92 = -[NTPBUserSegmentationApiConfiguration copyWithZone:](self->_userSegmentationApiConfiguration, "copyWithZone:", a3);
  v93 = *(void **)(v5 + 736);
  *(_QWORD *)(v5 + 736) = v92;

  v94 = (id)v5;
  return v94;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *fallbackLanguageTag;
  NSMutableArray *languageConfigs;
  uint64_t has;
  uint64_t v8;
  __int16 v9;
  NSMutableArray *endpointConfigs;
  NTPBPersonalizationConfig *personalizationConfig;
  NTPBIAdConfig *iadConfig;
  NTPBPrefetchConfig *prefetchConfig;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  NSString *anfEmbedConfigurationAsset;
  uint64_t v18;
  NTPBWidgetConfig *widgetConfig;
  uint64_t v20;
  NSString *forYouNonPersonalizedGroupsOrder;
  uint64_t v22;
  NTPBWidgetConfig *alternativeButlerWidgetConfig;
  __int16 v24;
  NTPBWidgetConfig *butlerWidgetConfig;
  NTPBPaidSubscriptionConfig *paidSubscriptionConfig;
  uint64_t v27;
  uint64_t v28;
  NTPBWidgetConfig *widgetConfig2;
  uint64_t v30;
  NTPBBinningConfig *binningConfig;
  NTPBPersonalizationTreatment *personalizationTreatment;
  uint64_t v33;
  NSString *personalizationBundleIdMappingResourceId;
  NSString *personalizationUrlMappingResourceId;
  NSString *personalizationWhitelistResourceId;
  uint64_t v37;
  NSString *personalizationPublisherFavorabilityScoresResourceId;
  NSString *personalizationWidgetSectionMappingResourceId;
  uint64_t v40;
  uint64_t v41;
  __int16 v42;
  NSMutableArray *externalAnalyticsConfigs;
  NSString *personalizationPortraitConfigResourceId;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  NSString *experimentalizableFieldPostfix;
  uint64_t v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  NTPBVideoGroupsConfig *forYouVideoGroupsConfig;
  NSString *articleRecirculationConfig;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  NSString *articleRecirculationComponentPlacementConfig;
  uint64_t v61;
  __int16 v62;
  char v63;
  NTPBUserSegmentationApiConfiguration *userSegmentationApiConfiguration;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_478;
  fallbackLanguageTag = self->_fallbackLanguageTag;
  if ((unint64_t)fallbackLanguageTag | *((_QWORD *)v4 + 75))
  {
    if (!-[NSString isEqual:](fallbackLanguageTag, "isEqual:"))
      goto LABEL_478;
  }
  languageConfigs = self->_languageConfigs;
  if ((unint64_t)languageConfigs | *((_QWORD *)v4 + 79))
  {
    if (!-[NSMutableArray isEqual:](languageConfigs, "isEqual:"))
      goto LABEL_478;
  }
  has = (uint64_t)self->_has;
  v8 = *(_QWORD *)(v4 + 772);
  v9 = *((_WORD *)v4 + 390);
  if ((has & 0x100000000000) != 0)
  {
    if ((v8 & 0x100000000000) == 0 || self->_shortReminderTime != *((_QWORD *)v4 + 48))
      goto LABEL_478;
  }
  else if ((v8 & 0x100000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_longReminderTime != *((_QWORD *)v4 + 21))
      goto LABEL_478;
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_478;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0)
      goto LABEL_478;
    if (self->_newsletterSubscriptionChecked)
    {
      if (!v4[765])
        goto LABEL_478;
    }
    else if (v4[765])
    {
      goto LABEL_478;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_478;
  }
  if ((has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_batchedFeedTimeout != *((double *)v4 + 12))
      goto LABEL_478;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_478;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_interstitialAdLoadDelay != *((double *)v4 + 20))
      goto LABEL_478;
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_478;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v8 & 0x2000000000) == 0 || self->_prerollLoadingTimeout != *((double *)v4 + 41))
      goto LABEL_478;
  }
  else if ((v8 & 0x2000000000) != 0)
  {
    goto LABEL_478;
  }
  endpointConfigs = self->_endpointConfigs;
  if ((unint64_t)endpointConfigs | *((_QWORD *)v4 + 72)
    && !-[NSMutableArray isEqual:](endpointConfigs, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationConfig = self->_personalizationConfig;
  if ((unint64_t)personalizationConfig | *((_QWORD *)v4 + 83))
  {
    if (!-[NTPBPersonalizationConfig isEqual:](personalizationConfig, "isEqual:"))
      goto LABEL_478;
  }
  iadConfig = self->_iadConfig;
  if ((unint64_t)iadConfig | *((_QWORD *)v4 + 78))
  {
    if (!-[NTPBIAdConfig isEqual:](iadConfig, "isEqual:"))
      goto LABEL_478;
  }
  prefetchConfig = self->_prefetchConfig;
  if ((unint64_t)prefetchConfig | *((_QWORD *)v4 + 90))
  {
    if (!-[NTPBPrefetchConfig isEqual:](prefetchConfig, "isEqual:"))
      goto LABEL_478;
  }
  v14 = (uint64_t)self->_has;
  v15 = *((_WORD *)&self->_has + 4);
  v16 = *(_QWORD *)(v4 + 772);
  if ((v14 & 0x8000000000000) != 0)
  {
    if ((v16 & 0x8000000000000) == 0 || self->_tileProminenceScoreBalanceValue != *((double *)v4 + 55))
      goto LABEL_478;
  }
  else if ((v16 & 0x8000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x800000) != 0)
  {
    if ((v16 & 0x800000) == 0 || self->_minimumArticleUpdateInterval != *((_QWORD *)v4 + 27))
      goto LABEL_478;
  }
  else if ((v16 & 0x800000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x8000) != 0)
  {
    if ((v16 & 0x8000) == 0 || self->_initialArticlesFromNewFavorite != *((_QWORD *)v4 + 19))
      goto LABEL_478;
  }
  else if ((v16 & 0x8000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0 || self->_autoScrollToTopFeedTimeout != *((_QWORD *)v4 + 11))
      goto LABEL_478;
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x80000000000000) != 0)
  {
    if ((v16 & 0x80000000000000) == 0 || self->_trendingTopicsRefreshRate != *((_QWORD *)v4 + 59))
      goto LABEL_478;
  }
  else if ((v16 & 0x80000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_appConfigRefreshRate != *((_QWORD *)v4 + 5))
      goto LABEL_478;
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x1000000) != 0)
  {
    if ((v16 & 0x1000000) == 0 || self->_minimumDistanceBetweenImageOnTopTiles != *((_QWORD *)v4 + 28))
      goto LABEL_478;
  }
  else if ((v16 & 0x1000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x20000000000000) != 0)
  {
    if ((v16 & 0x20000000000000) == 0 || self->_timeBetweenWidgetInsertions != *((_QWORD *)v4 + 57))
      goto LABEL_478;
  }
  else if ((v16 & 0x20000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x10000000000000) != 0)
  {
    if ((v16 & 0x10000000000000) == 0 || self->_timeBetweenSameWidgetReinsertion != *((_QWORD *)v4 + 56))
      goto LABEL_478;
  }
  else if ((v16 & 0x10000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x800000000) != 0)
  {
    if ((v16 & 0x800000000) == 0 || self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit != *((_QWORD *)v4 + 39))
      goto LABEL_478;
  }
  else if ((v16 & 0x800000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_articleRapidUpdatesTimeout != *((_QWORD *)v4 + 8))
      goto LABEL_478;
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x400000000000) != 0)
  {
    if ((v16 & 0x400000000000) == 0 || self->_subscriptionsGlobalMeteredCount != *((_QWORD *)v4 + 50))
      goto LABEL_478;
  }
  else if ((v16 & 0x400000000000) != 0)
  {
    goto LABEL_478;
  }
  anfEmbedConfigurationAsset = self->_anfEmbedConfigurationAsset;
  if ((unint64_t)anfEmbedConfigurationAsset | *((_QWORD *)v4 + 66))
  {
    if (!-[NSString isEqual:](anfEmbedConfigurationAsset, "isEqual:"))
      goto LABEL_478;
    v14 = (uint64_t)self->_has;
    v15 = *((_WORD *)&self->_has + 4);
  }
  v18 = *(_QWORD *)(v4 + 772);
  if ((v14 & 0x2000000000000) != 0)
  {
    if ((v18 & 0x2000000000000) == 0 || self->_subscriptionsPlacardPublisherFrequencyDays != *((_QWORD *)v4 + 53))
      goto LABEL_478;
  }
  else if ((v18 & 0x2000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x1000000000000) != 0)
  {
    if ((v18 & 0x1000000000000) == 0 || self->_subscriptionsPlacardGlobalMaxPerDay != *((_QWORD *)v4 + 52))
      goto LABEL_478;
  }
  else if ((v18 & 0x1000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x800000000000) != 0)
  {
    if ((v18 & 0x800000000000) == 0
      || self->_subscriptionsGracePeriodForTokenVerificationSeconds != *((_QWORD *)v4 + 51))
    {
      goto LABEL_478;
    }
  }
  else if ((v18 & 0x800000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x80000000) != 0)
  {
    if ((v18 & 0x80000000) == 0 || self->_newFavoriteNotificationAlertsFrequency != *((_QWORD *)v4 + 35))
      goto LABEL_478;
  }
  else if ((v18 & 0x80000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x1000) != 0)
  {
    if ((v18 & 0x1000) == 0 || self->_endOfArticleMinPaidHeadlineRatio != *((double *)v4 + 16))
      goto LABEL_478;
  }
  else if ((v18 & 0x1000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x800) != 0)
  {
    if ((v18 & 0x800) == 0 || self->_endOfArticleMaxInaccessiblePaidArticles != *((_QWORD *)v4 + 15))
      goto LABEL_478;
  }
  else if ((v18 & 0x800) != 0)
  {
    goto LABEL_478;
  }
  widgetConfig = self->_widgetConfig;
  if ((unint64_t)widgetConfig | *((_QWORD *)v4 + 93))
  {
    if (!-[NTPBWidgetConfig isEqual:](widgetConfig, "isEqual:"))
      goto LABEL_478;
    v14 = (uint64_t)self->_has;
    v15 = *((_WORD *)&self->_has + 4);
  }
  v20 = *(_QWORD *)(v4 + 772);
  if ((v15 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x400) == 0)
      goto LABEL_478;
    if (self->_universalLinksEnabled)
    {
      if (!v4[768])
        goto LABEL_478;
    }
    else if (v4[768])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x400) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x100000000) != 0)
  {
    if ((v20 & 0x100000000) == 0 || self->_notificationArticleCacheTimeout != *((_QWORD *)v4 + 36))
      goto LABEL_478;
  }
  else if ((v20 & 0x100000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x200000000) != 0)
  {
    if ((v20 & 0x200000000) == 0 || self->_notificationArticleWithRapidUpdatesCacheTimeout != *((_QWORD *)v4 + 37))
      goto LABEL_478;
  }
  else if ((v20 & 0x200000000) != 0)
  {
    goto LABEL_478;
  }
  forYouNonPersonalizedGroupsOrder = self->_forYouNonPersonalizedGroupsOrder;
  if ((unint64_t)forYouNonPersonalizedGroupsOrder | *((_QWORD *)v4 + 76))
  {
    if (!-[NSString isEqual:](forYouNonPersonalizedGroupsOrder, "isEqual:"))
      goto LABEL_478;
    v14 = (uint64_t)self->_has;
    v15 = *((_WORD *)&self->_has + 4);
  }
  v22 = *(_QWORD *)(v4 + 772);
  if ((v14 & 0x400000000) != 0)
  {
    if ((v22 & 0x400000000) == 0 || self->_notificationEnabledChannelsRefreshFrequency != *((_QWORD *)v4 + 38))
      goto LABEL_478;
  }
  else if ((v22 & 0x400000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x40000000000) != 0)
  {
    if ((v22 & 0x40000000000) == 0 || self->_savedArticlesMaximumCountWifi != *((_QWORD *)v4 + 46))
      goto LABEL_478;
  }
  else if ((v22 & 0x40000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x20000000000) != 0)
  {
    if ((v22 & 0x20000000000) == 0 || self->_savedArticlesMaximumCountCellular != *((_QWORD *)v4 + 45))
      goto LABEL_478;
  }
  else if ((v22 & 0x20000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x10000000000) != 0)
  {
    if ((v22 & 0x10000000000) == 0 || self->_savedArticlesCutoffTime != *((_QWORD *)v4 + 44))
      goto LABEL_478;
  }
  else if ((v22 & 0x10000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v14 & 0x80000000000) != 0)
  {
    if ((v22 & 0x80000000000) == 0 || self->_savedArticlesOpenedCutoffTime != *((_QWORD *)v4 + 47))
      goto LABEL_478;
  }
  else if ((v22 & 0x80000000000) != 0)
  {
    goto LABEL_478;
  }
  alternativeButlerWidgetConfig = self->_alternativeButlerWidgetConfig;
  if ((unint64_t)alternativeButlerWidgetConfig | *((_QWORD *)v4 + 65))
  {
    if (!-[NTPBWidgetConfig isEqual:](alternativeButlerWidgetConfig, "isEqual:"))
      goto LABEL_478;
    v15 = *((_WORD *)&self->_has + 4);
  }
  v24 = *((_WORD *)v4 + 390);
  if ((v15 & 4) != 0)
  {
    if ((v24 & 4) == 0)
      goto LABEL_478;
    if (self->_alternativeButlerWidgetConfigEnabled)
    {
      if (!v4[760])
        goto LABEL_478;
    }
    else if (v4[760])
    {
      goto LABEL_478;
    }
  }
  else if ((v24 & 4) != 0)
  {
    goto LABEL_478;
  }
  butlerWidgetConfig = self->_butlerWidgetConfig;
  if ((unint64_t)butlerWidgetConfig | *((_QWORD *)v4 + 70)
    && !-[NTPBWidgetConfig isEqual:](butlerWidgetConfig, "isEqual:"))
  {
    goto LABEL_478;
  }
  paidSubscriptionConfig = self->_paidSubscriptionConfig;
  if ((unint64_t)paidSubscriptionConfig | *((_QWORD *)v4 + 81))
  {
    if (!-[NTPBPaidSubscriptionConfig isEqual:](paidSubscriptionConfig, "isEqual:"))
      goto LABEL_478;
  }
  v27 = (uint64_t)self->_has;
  v28 = *(_QWORD *)(v4 + 772);
  if ((v27 & 8) != 0)
  {
    if ((v28 & 8) == 0 || self->_articleDiversitySimilarityExpectationStart != *((double *)v4 + 7))
      goto LABEL_478;
  }
  else if ((v28 & 8) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 4) != 0)
  {
    if ((v28 & 4) == 0 || self->_articleDiversitySimilarityExpectationEnd != *((double *)v4 + 6))
      goto LABEL_478;
  }
  else if ((v28 & 4) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x80000) != 0)
  {
    if ((v28 & 0x80000) == 0 || self->_maxPaidSubscriptionGroupSizeIPad != *((_QWORD *)v4 + 23))
      goto LABEL_478;
  }
  else if ((v28 & 0x80000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x100000) != 0)
  {
    if ((v28 & 0x100000) == 0 || self->_maxPaidSubscriptionGroupSizeIPhone != *((_QWORD *)v4 + 24))
      goto LABEL_478;
  }
  else if ((v28 & 0x100000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x200000) != 0)
  {
    if ((v28 & 0x200000) == 0 || self->_maxTimesHeadlineInPaidSubscriptionGroup != *((_QWORD *)v4 + 25))
      goto LABEL_478;
  }
  else if ((v28 & 0x200000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x4000000000) != 0)
  {
    if ((v28 & 0x4000000000) == 0 || self->_publisherDiversitySlope != *((double *)v4 + 42))
      goto LABEL_478;
  }
  else if ((v28 & 0x4000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x8000000000) != 0)
  {
    if ((v28 & 0x8000000000) == 0 || self->_publisherDiversityYIntercept != *((double *)v4 + 43))
      goto LABEL_478;
  }
  else if ((v28 & 0x8000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x4000) != 0)
  {
    if ((v28 & 0x4000) == 0 || self->_expiredPaidSubscriptionGroupCutoffTime != *((_QWORD *)v4 + 18))
      goto LABEL_478;
  }
  else if ((v28 & 0x4000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x40000) != 0)
  {
    if ((v28 & 0x40000) == 0 || self->_maxExpiredPaidSubscriptionGroupCount != *((_QWORD *)v4 + 22))
      goto LABEL_478;
  }
  else if ((v28 & 0x40000) != 0)
  {
    goto LABEL_478;
  }
  widgetConfig2 = self->_widgetConfig2;
  if ((unint64_t)widgetConfig2 | *((_QWORD *)v4 + 94))
  {
    if (!-[NTPBWidgetConfig isEqual:](widgetConfig2, "isEqual:"))
      goto LABEL_478;
    v27 = (uint64_t)self->_has;
  }
  v30 = *(_QWORD *)(v4 + 772);
  if ((v27 & 0x4000000000000) != 0)
  {
    if ((v30 & 0x4000000000000) == 0 || self->_subscriptionsPlacardPublisherFrequencySeconds != *((_QWORD *)v4 + 54))
      goto LABEL_478;
  }
  else if ((v30 & 0x4000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v27 & 0x40000000000000) != 0)
  {
    if ((v30 & 0x40000000000000) == 0 || self->_treatmentId != *((_QWORD *)v4 + 58))
      goto LABEL_478;
  }
  else if ((v30 & 0x40000000000000) != 0)
  {
    goto LABEL_478;
  }
  binningConfig = self->_binningConfig;
  if ((unint64_t)binningConfig | *((_QWORD *)v4 + 69)
    && !-[NTPBBinningConfig isEqual:](binningConfig, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationTreatment = self->_personalizationTreatment;
  if ((unint64_t)personalizationTreatment | *((_QWORD *)v4 + 86))
  {
    if (!-[NTPBPersonalizationTreatment isEqual:](personalizationTreatment, "isEqual:"))
      goto LABEL_478;
  }
  v33 = *(_QWORD *)(v4 + 772);
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
    if ((v33 & 1) == 0 || self->_analyticsEndpointMaxPayloadSize != *((_QWORD *)v4 + 4))
      goto LABEL_478;
  }
  else if ((v33 & 1) != 0)
  {
    goto LABEL_478;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x100) == 0)
      goto LABEL_478;
    if (self->_orderFeedEndpointEnabled)
    {
      if (!v4[766])
        goto LABEL_478;
    }
    else if (v4[766])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x100) != 0)
  {
    goto LABEL_478;
  }
  personalizationBundleIdMappingResourceId = self->_personalizationBundleIdMappingResourceId;
  if ((unint64_t)personalizationBundleIdMappingResourceId | *((_QWORD *)v4 + 82)
    && !-[NSString isEqual:](personalizationBundleIdMappingResourceId, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationUrlMappingResourceId = self->_personalizationUrlMappingResourceId;
  if ((unint64_t)personalizationUrlMappingResourceId | *((_QWORD *)v4 + 87))
  {
    if (!-[NSString isEqual:](personalizationUrlMappingResourceId, "isEqual:"))
      goto LABEL_478;
  }
  personalizationWhitelistResourceId = self->_personalizationWhitelistResourceId;
  if ((unint64_t)personalizationWhitelistResourceId | *((_QWORD *)v4 + 88))
  {
    if (!-[NSString isEqual:](personalizationWhitelistResourceId, "isEqual:"))
      goto LABEL_478;
  }
  v37 = *(_QWORD *)(v4 + 772);
  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
  {
    if ((v37 & 0x2000000000000000) == 0 || self->_enabledPrivateDataEncryptionLevel != *((_DWORD *)v4 + 142))
      goto LABEL_478;
  }
  else if ((v37 & 0x2000000000000000) != 0)
  {
    goto LABEL_478;
  }
  personalizationPublisherFavorabilityScoresResourceId = self->_personalizationPublisherFavorabilityScoresResourceId;
  if ((unint64_t)personalizationPublisherFavorabilityScoresResourceId | *((_QWORD *)v4 + 85)
    && !-[NSString isEqual:](personalizationPublisherFavorabilityScoresResourceId, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationWidgetSectionMappingResourceId = self->_personalizationWidgetSectionMappingResourceId;
  if ((unint64_t)personalizationWidgetSectionMappingResourceId | *((_QWORD *)v4 + 89))
  {
    if (!-[NSString isEqual:](personalizationWidgetSectionMappingResourceId, "isEqual:"))
      goto LABEL_478;
  }
  v40 = (uint64_t)self->_has;
  v41 = *(_QWORD *)(v4 + 772);
  v42 = *((_WORD *)v4 + 390);
  if ((v40 & 0x200) != 0)
  {
    if ((v41 & 0x200) == 0 || self->_corryBarMaxArticleCountForArticleList != *((_QWORD *)v4 + 13))
      goto LABEL_478;
  }
  else if ((v41 & 0x200) != 0)
  {
    goto LABEL_478;
  }
  if ((v40 & 0x400) != 0)
  {
    if ((v41 & 0x400) == 0 || self->_corryBarMaxArticleCountForSingleArticle != *((_QWORD *)v4 + 14))
      goto LABEL_478;
  }
  else if ((v41 & 0x400) != 0)
  {
    goto LABEL_478;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
  {
    if ((v42 & 0x10) == 0)
      goto LABEL_478;
    if (self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers)
    {
      if (!v4[762])
        goto LABEL_478;
    }
    else if (v4[762])
    {
      goto LABEL_478;
    }
  }
  else if ((v42 & 0x10) != 0)
  {
    goto LABEL_478;
  }
  externalAnalyticsConfigs = self->_externalAnalyticsConfigs;
  if ((unint64_t)externalAnalyticsConfigs | *((_QWORD *)v4 + 74)
    && !-[NSMutableArray isEqual:](externalAnalyticsConfigs, "isEqual:"))
  {
    goto LABEL_478;
  }
  personalizationPortraitConfigResourceId = self->_personalizationPortraitConfigResourceId;
  if ((unint64_t)personalizationPortraitConfigResourceId | *((_QWORD *)v4 + 84))
  {
    if (!-[NSString isEqual:](personalizationPortraitConfigResourceId, "isEqual:"))
      goto LABEL_478;
  }
  v45 = (uint64_t)self->_has;
  v46 = *((_WORD *)&self->_has + 4);
  v47 = *(_QWORD *)(v4 + 772);
  if (v45 < 0)
  {
    if ((v47 & 0x8000000000000000) == 0 || self->_orderFeedEnabledLevelDeprecated != *((_DWORD *)v4 + 161))
      goto LABEL_478;
  }
  else if (v47 < 0)
  {
    goto LABEL_478;
  }
  experimentalizableFieldPostfix = self->_experimentalizableFieldPostfix;
  if ((unint64_t)experimentalizableFieldPostfix | *((_QWORD *)v4 + 73))
  {
    if (!-[NSString isEqual:](experimentalizableFieldPostfix, "isEqual:"))
      goto LABEL_478;
    v45 = (uint64_t)self->_has;
    v46 = *((_WORD *)&self->_has + 4);
  }
  v49 = *(_QWORD *)(v4 + 772);
  if ((v45 & 0x20000000) != 0)
  {
    if ((v49 & 0x20000000) == 0
      || self->_minimumFollowCountToRemovePersonalizePlacardInFollowing != *((_QWORD *)v4 + 33))
    {
      goto LABEL_478;
    }
  }
  else if ((v49 & 0x20000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v46 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x1000) == 0)
      goto LABEL_478;
    if (self->_useSecureConnectionForAssets)
    {
      if (!v4[770])
        goto LABEL_478;
    }
    else if (v4[770])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x1000) != 0)
  {
    goto LABEL_478;
  }
  if ((v46 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x800) == 0)
      goto LABEL_478;
    if (self->_usUkUseAuWhatsNewFeatures)
    {
      if (!v4[769])
        goto LABEL_478;
    }
    else if (v4[769])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x800) != 0)
  {
    goto LABEL_478;
  }
  if ((v45 & 0x4000000000000000) != 0)
  {
    if ((v49 & 0x4000000000000000) == 0 || self->_orderFeedEnabledLevel != *((_DWORD *)v4 + 160))
      goto LABEL_478;
  }
  else if ((v49 & 0x4000000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v45 & 0x200000000000) != 0)
  {
    if ((v49 & 0x200000000000) == 0 || self->_stateRestorationAllowedTimeWindow != *((_QWORD *)v4 + 49))
      goto LABEL_478;
  }
  else if ((v49 & 0x200000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v45 & 0x40) != 0)
  {
    if ((v49 & 0x40) == 0 || self->_autoRefreshMinimumInterval != *((_QWORD *)v4 + 10))
      goto LABEL_478;
  }
  else if ((v49 & 0x40) != 0)
  {
    goto LABEL_478;
  }
  if ((v46 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 390) & 0x200) == 0)
      goto LABEL_478;
    if (self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment)
    {
      if (!v4[767])
        goto LABEL_478;
    }
    else if (v4[767])
    {
      goto LABEL_478;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x200) != 0)
  {
    goto LABEL_478;
  }
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_478;
  v50 = (uint64_t)self->_has;
  v51 = *((_WORD *)&self->_has + 4);
  v52 = *(_QWORD *)(v4 + 772);
  v53 = *((_WORD *)v4 + 390);
  if ((v51 & 8) != 0)
  {
    if ((v53 & 8) == 0)
      goto LABEL_478;
    if (self->_articleSearchEnabled)
    {
      if (!v4[761])
        goto LABEL_478;
    }
    else if (v4[761])
    {
      goto LABEL_478;
    }
  }
  else if ((v53 & 8) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x400000) != 0)
  {
    if ((v52 & 0x400000) == 0 || self->_maximumRatioOfArticlesInForYouGroup != *((double *)v4 + 26))
      goto LABEL_478;
  }
  else if ((v52 & 0x400000) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x40000000) != 0)
  {
    if ((v52 & 0x40000000) == 0 || self->_minimumTrendingUnseenRatio != *((double *)v4 + 34))
      goto LABEL_478;
  }
  else if ((v52 & 0x40000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v51 & 2) != 0)
  {
    if ((v53 & 2) == 0 || self->_trendingStyle != *((_DWORD *)v4 + 183))
      goto LABEL_478;
  }
  else if ((v53 & 2) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x2000000) != 0)
  {
    if ((v52 & 0x2000000) == 0 || self->_minimumDurationBetweenForYouGroupsWeekday != *((_QWORD *)v4 + 29))
      goto LABEL_478;
  }
  else if ((v52 & 0x2000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x4000000) != 0)
  {
    if ((v52 & 0x4000000) == 0 || self->_minimumDurationBetweenForYouGroupsWeekend != *((_QWORD *)v4 + 30))
      goto LABEL_478;
  }
  else if ((v52 & 0x4000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x8000000) != 0)
  {
    if ((v52 & 0x8000000) == 0 || self->_minimumDurationBetweenTrendingGroupsWeekday != *((_QWORD *)v4 + 31))
      goto LABEL_478;
  }
  else if ((v52 & 0x8000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v50 & 0x10000000) != 0)
  {
    if ((v52 & 0x10000000) == 0 || self->_minimumDurationBetweenTrendingGroupsWeekend != *((_QWORD *)v4 + 32))
      goto LABEL_478;
  }
  else if ((v52 & 0x10000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v51 & 0x40) != 0)
  {
    if ((v53 & 0x40) == 0)
      goto LABEL_478;
    if (self->_diversifyOptionalTopStories)
    {
      if (!v4[764])
        goto LABEL_478;
    }
    else if (v4[764])
    {
      goto LABEL_478;
    }
  }
  else if ((v53 & 0x40) != 0)
  {
    goto LABEL_478;
  }
  forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  if ((unint64_t)forYouVideoGroupsConfig | *((_QWORD *)v4 + 77)
    && !-[NTPBVideoGroupsConfig isEqual:](forYouVideoGroupsConfig, "isEqual:"))
  {
    goto LABEL_478;
  }
  articleRecirculationConfig = self->_articleRecirculationConfig;
  if ((unint64_t)articleRecirculationConfig | *((_QWORD *)v4 + 68))
  {
    if (!-[NSString isEqual:](articleRecirculationConfig, "isEqual:"))
      goto LABEL_478;
  }
  v56 = (uint64_t)self->_has;
  v57 = *((_WORD *)&self->_has + 4);
  v58 = *(_QWORD *)(v4 + 772);
  v59 = *((_WORD *)v4 + 390);
  if ((v56 & 0x1000000000) != 0)
  {
    if ((v58 & 0x1000000000) == 0 || self->_optionalTopStoriesRefreshRate != *((_QWORD *)v4 + 40))
      goto LABEL_478;
  }
  else if ((v58 & 0x1000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x2000) != 0)
  {
    if ((v58 & 0x2000) == 0 || self->_expirePinnedArticlesAfter != *((_QWORD *)v4 + 17))
      goto LABEL_478;
  }
  else if ((v58 & 0x2000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x200000000000000) != 0)
  {
    if ((v58 & 0x200000000000000) == 0 || self->_userSegmentationApiModThreshold != *((_QWORD *)v4 + 61))
      goto LABEL_478;
  }
  else if ((v58 & 0x200000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x100000000000000) != 0)
  {
    if ((v58 & 0x100000000000000) == 0 || self->_userSegmentationApiModMax != *((_QWORD *)v4 + 60))
      goto LABEL_478;
  }
  else if ((v58 & 0x100000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v57 & 1) != 0)
  {
    if ((v59 & 1) == 0 || self->_privateDataMigrationCleanupLevel != *((_DWORD *)v4 + 182))
      goto LABEL_478;
  }
  else if ((v59 & 1) != 0)
  {
    goto LABEL_478;
  }
  articleRecirculationComponentPlacementConfig = self->_articleRecirculationComponentPlacementConfig;
  if ((unint64_t)articleRecirculationComponentPlacementConfig | *((_QWORD *)v4 + 67))
  {
    if (!-[NSString isEqual:](articleRecirculationComponentPlacementConfig, "isEqual:"))
      goto LABEL_478;
    v56 = (uint64_t)self->_has;
    v57 = *((_WORD *)&self->_has + 4);
  }
  v61 = *(_QWORD *)(v4 + 772);
  v62 = *((_WORD *)v4 + 390);
  if ((v56 & 0x1000000000000000) != 0)
  {
    if ((v61 & 0x1000000000000000) == 0 || self->_widgetEventImmediateUploadPopulationFloor != *((_QWORD *)v4 + 64))
      goto LABEL_478;
  }
  else if ((v61 & 0x1000000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x800000000000000) != 0)
  {
    if ((v61 & 0x800000000000000) == 0 || self->_widgetEventImmediateUploadPopulationCeiling != *((_QWORD *)v4 + 63))
      goto LABEL_478;
  }
  else if ((v61 & 0x800000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x400000000000000) != 0)
  {
    if ((v61 & 0x400000000000000) == 0 || self->_widgetEventImmediateUploadModuloForHashing != *((_QWORD *)v4 + 62))
      goto LABEL_478;
  }
  else if ((v61 & 0x400000000000000) != 0)
  {
    goto LABEL_478;
  }
  if ((v56 & 0x20) != 0)
  {
    if ((v61 & 0x20) == 0 || self->_articleRecirculationPopularFeedQueryTimeRange != *((_QWORD *)v4 + 9))
      goto LABEL_478;
  }
  else if ((v61 & 0x20) != 0)
  {
    goto LABEL_478;
  }
  if ((v57 & 0x20) != 0)
  {
    if ((v62 & 0x20) != 0)
    {
      if (self->_disableThumbnailsForArticleRecirculation)
      {
        if (v4[763])
          goto LABEL_481;
      }
      else if (!v4[763])
      {
        goto LABEL_481;
      }
    }
LABEL_478:
    v63 = 0;
    goto LABEL_479;
  }
  if ((v62 & 0x20) != 0)
    goto LABEL_478;
LABEL_481:
  userSegmentationApiConfiguration = self->_userSegmentationApiConfiguration;
  if ((unint64_t)userSegmentationApiConfiguration | *((_QWORD *)v4 + 92))
    v63 = -[NTPBUserSegmentationApiConfiguration isEqual:](userSegmentationApiConfiguration, "isEqual:");
  else
    v63 = 1;
LABEL_479:

  return v63;
}

- (unint64_t)hash
{
  uint64_t has;
  __int16 v4;
  double batchedFeedTimeout;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double interstitialAdLoadDelay;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double prerollLoadingTimeout;
  double v17;
  long double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  double tileProminenceScoreBalanceValue;
  double v23;
  long double v24;
  double v25;
  uint64_t v26;
  double endOfArticleMinPaidHeadlineRatio;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  double articleDiversitySimilarityExpectationStart;
  double v37;
  long double v38;
  double v39;
  unint64_t v40;
  double articleDiversitySimilarityExpectationEnd;
  double v42;
  long double v43;
  double v44;
  double publisherDiversitySlope;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  unint64_t v50;
  double publisherDiversityYIntercept;
  double v52;
  long double v53;
  double v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int16 v60;
  double maximumRatioOfArticlesInForYouGroup;
  double v62;
  long double v63;
  double v64;
  unint64_t v65;
  unint64_t v66;
  double minimumTrendingUnseenRatio;
  double v68;
  long double v69;
  double v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSUInteger v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSUInteger v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSUInteger v106;
  uint64_t v107;
  NSUInteger v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSUInteger v113;
  NSUInteger v114;
  uint64_t v115;
  NSUInteger v116;
  NSUInteger v117;
  NSUInteger v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  NSUInteger v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  NSUInteger v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  unint64_t v167;
  uint64_t v168;
  unint64_t v169;
  unint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  NSUInteger v176;

  v176 = -[NSString hash](self->_fallbackLanguageTag, "hash");
  v175 = -[NSMutableArray hash](self->_languageConfigs, "hash");
  has = (uint64_t)self->_has;
  v4 = *((_WORD *)&self->_has + 4);
  if ((has & 0x100000000000) != 0)
  {
    v174 = 2654435761 * self->_shortReminderTime;
    if ((has & 0x20000) != 0)
    {
LABEL_3:
      v173 = 2654435761 * self->_longReminderTime;
      if ((v4 & 0x80) != 0)
        goto LABEL_4;
LABEL_11:
      v172 = 0;
      if ((has & 0x100) != 0)
        goto LABEL_5;
LABEL_12:
      v9 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v174 = 0;
    if ((has & 0x20000) != 0)
      goto LABEL_3;
  }
  v173 = 0;
  if ((v4 & 0x80) == 0)
    goto LABEL_11;
LABEL_4:
  v172 = 2654435761 * self->_newsletterSubscriptionChecked;
  if ((has & 0x100) == 0)
    goto LABEL_12;
LABEL_5:
  batchedFeedTimeout = self->_batchedFeedTimeout;
  v6 = -batchedFeedTimeout;
  if (batchedFeedTimeout >= 0.0)
    v6 = self->_batchedFeedTimeout;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_15:
  if ((has & 0x10000) != 0)
  {
    interstitialAdLoadDelay = self->_interstitialAdLoadDelay;
    v12 = -interstitialAdLoadDelay;
    if (interstitialAdLoadDelay >= 0.0)
      v12 = self->_interstitialAdLoadDelay;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v170 = v10;
  if ((has & 0x2000000000) != 0)
  {
    prerollLoadingTimeout = self->_prerollLoadingTimeout;
    v17 = -prerollLoadingTimeout;
    if (prerollLoadingTimeout >= 0.0)
      v17 = self->_prerollLoadingTimeout;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  v169 = v15;
  v168 = -[NSMutableArray hash](self->_endpointConfigs, "hash");
  v167 = -[NTPBPersonalizationConfig hash](self->_personalizationConfig, "hash");
  v166 = -[NTPBIAdConfig hash](self->_iadConfig, "hash");
  v165 = -[NTPBPrefetchConfig hash](self->_prefetchConfig, "hash");
  v20 = (uint64_t)self->_has;
  if ((v20 & 0x8000000000000) != 0)
  {
    tileProminenceScoreBalanceValue = self->_tileProminenceScoreBalanceValue;
    v23 = -tileProminenceScoreBalanceValue;
    if (tileProminenceScoreBalanceValue >= 0.0)
      v23 = self->_tileProminenceScoreBalanceValue;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  if ((v20 & 0x800000) != 0)
  {
    v163 = 2654435761 * self->_minimumArticleUpdateInterval;
    if ((v20 & 0x8000) != 0)
    {
LABEL_41:
      v162 = 2654435761 * self->_initialArticlesFromNewFavorite;
      if ((v20 & 0x80) != 0)
        goto LABEL_42;
      goto LABEL_52;
    }
  }
  else
  {
    v163 = 0;
    if ((v20 & 0x8000) != 0)
      goto LABEL_41;
  }
  v162 = 0;
  if ((v20 & 0x80) != 0)
  {
LABEL_42:
    v161 = 2654435761 * self->_autoScrollToTopFeedTimeout;
    if ((v20 & 0x80000000000000) != 0)
      goto LABEL_43;
    goto LABEL_53;
  }
LABEL_52:
  v161 = 0;
  if ((v20 & 0x80000000000000) != 0)
  {
LABEL_43:
    v160 = 2654435761 * self->_trendingTopicsRefreshRate;
    if ((v20 & 2) != 0)
      goto LABEL_44;
    goto LABEL_54;
  }
LABEL_53:
  v160 = 0;
  if ((v20 & 2) != 0)
  {
LABEL_44:
    v159 = 2654435761 * self->_appConfigRefreshRate;
    if ((v20 & 0x1000000) != 0)
      goto LABEL_45;
    goto LABEL_55;
  }
LABEL_54:
  v159 = 0;
  if ((v20 & 0x1000000) != 0)
  {
LABEL_45:
    v158 = 2654435761 * self->_minimumDistanceBetweenImageOnTopTiles;
    if ((v20 & 0x20000000000000) != 0)
      goto LABEL_46;
    goto LABEL_56;
  }
LABEL_55:
  v158 = 0;
  if ((v20 & 0x20000000000000) != 0)
  {
LABEL_46:
    v157 = 2654435761 * self->_timeBetweenWidgetInsertions;
    if ((v20 & 0x10000000000000) != 0)
      goto LABEL_47;
    goto LABEL_57;
  }
LABEL_56:
  v157 = 0;
  if ((v20 & 0x10000000000000) != 0)
  {
LABEL_47:
    v156 = 2654435761 * self->_timeBetweenSameWidgetReinsertion;
    if ((v20 & 0x800000000) != 0)
      goto LABEL_48;
LABEL_58:
    v155 = 0;
    if ((v20 & 0x10) != 0)
      goto LABEL_49;
    goto LABEL_59;
  }
LABEL_57:
  v156 = 0;
  if ((v20 & 0x800000000) == 0)
    goto LABEL_58;
LABEL_48:
  v155 = 2654435761 * self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit;
  if ((v20 & 0x10) != 0)
  {
LABEL_49:
    v154 = 2654435761 * self->_articleRapidUpdatesTimeout;
    goto LABEL_60;
  }
LABEL_59:
  v154 = 0;
LABEL_60:
  v164 = v21;
  if ((v20 & 0x400000000000) != 0)
    v153 = 2654435761 * self->_subscriptionsGlobalMeteredCount;
  else
    v153 = 0;
  v152 = -[NSString hash](self->_anfEmbedConfigurationAsset, "hash");
  v26 = (uint64_t)self->_has;
  if ((v26 & 0x2000000000000) != 0)
  {
    v151 = 2654435761 * self->_subscriptionsPlacardPublisherFrequencyDays;
    if ((v26 & 0x1000000000000) != 0)
    {
LABEL_65:
      v150 = 2654435761 * self->_subscriptionsPlacardGlobalMaxPerDay;
      if ((v26 & 0x800000000000) != 0)
        goto LABEL_66;
      goto LABEL_74;
    }
  }
  else
  {
    v151 = 0;
    if ((v26 & 0x1000000000000) != 0)
      goto LABEL_65;
  }
  v150 = 0;
  if ((v26 & 0x800000000000) != 0)
  {
LABEL_66:
    v149 = 2654435761 * self->_subscriptionsGracePeriodForTokenVerificationSeconds;
    if ((v26 & 0x80000000) != 0)
      goto LABEL_67;
LABEL_75:
    v148 = 0;
    if ((v26 & 0x1000) != 0)
      goto LABEL_68;
LABEL_76:
    v31 = 0;
    goto LABEL_79;
  }
LABEL_74:
  v149 = 0;
  if ((v26 & 0x80000000) == 0)
    goto LABEL_75;
LABEL_67:
  v148 = 2654435761 * self->_newFavoriteNotificationAlertsFrequency;
  if ((v26 & 0x1000) == 0)
    goto LABEL_76;
LABEL_68:
  endOfArticleMinPaidHeadlineRatio = self->_endOfArticleMinPaidHeadlineRatio;
  v28 = -endOfArticleMinPaidHeadlineRatio;
  if (endOfArticleMinPaidHeadlineRatio >= 0.0)
    v28 = self->_endOfArticleMinPaidHeadlineRatio;
  v29 = floor(v28 + 0.5);
  v30 = (v28 - v29) * 1.84467441e19;
  v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0)
      v31 += (unint64_t)v30;
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
LABEL_79:
  v147 = v31;
  if ((v26 & 0x800) != 0)
    v146 = 2654435761 * self->_endOfArticleMaxInaccessiblePaidArticles;
  else
    v146 = 0;
  v145 = -[NTPBWidgetConfig hash](self->_widgetConfig, "hash");
  v32 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x400) == 0)
  {
    v144 = 0;
    if ((v32 & 0x100000000) != 0)
      goto LABEL_84;
LABEL_87:
    v143 = 0;
    if ((v32 & 0x200000000) != 0)
      goto LABEL_85;
    goto LABEL_88;
  }
  v144 = 2654435761 * self->_universalLinksEnabled;
  if ((v32 & 0x100000000) == 0)
    goto LABEL_87;
LABEL_84:
  v143 = 2654435761 * self->_notificationArticleCacheTimeout;
  if ((v32 & 0x200000000) != 0)
  {
LABEL_85:
    v142 = 2654435761 * self->_notificationArticleWithRapidUpdatesCacheTimeout;
    goto LABEL_89;
  }
LABEL_88:
  v142 = 0;
LABEL_89:
  v141 = -[NSString hash](self->_forYouNonPersonalizedGroupsOrder, "hash");
  v33 = (uint64_t)self->_has;
  if ((v33 & 0x400000000) != 0)
  {
    v140 = 2654435761 * self->_notificationEnabledChannelsRefreshFrequency;
    if ((v33 & 0x40000000000) != 0)
    {
LABEL_91:
      v139 = 2654435761 * self->_savedArticlesMaximumCountWifi;
      if ((v33 & 0x20000000000) != 0)
        goto LABEL_92;
      goto LABEL_97;
    }
  }
  else
  {
    v140 = 0;
    if ((v33 & 0x40000000000) != 0)
      goto LABEL_91;
  }
  v139 = 0;
  if ((v33 & 0x20000000000) != 0)
  {
LABEL_92:
    v138 = 2654435761 * self->_savedArticlesMaximumCountCellular;
    if ((v33 & 0x10000000000) != 0)
      goto LABEL_93;
LABEL_98:
    v137 = 0;
    if ((v33 & 0x80000000000) != 0)
      goto LABEL_94;
    goto LABEL_99;
  }
LABEL_97:
  v138 = 0;
  if ((v33 & 0x10000000000) == 0)
    goto LABEL_98;
LABEL_93:
  v137 = 2654435761 * self->_savedArticlesCutoffTime;
  if ((v33 & 0x80000000000) != 0)
  {
LABEL_94:
    v136 = 2654435761 * self->_savedArticlesOpenedCutoffTime;
    goto LABEL_100;
  }
LABEL_99:
  v136 = 0;
LABEL_100:
  v135 = -[NTPBWidgetConfig hash](self->_alternativeButlerWidgetConfig, "hash");
  if ((*((_WORD *)&self->_has + 4) & 4) != 0)
    v134 = 2654435761 * self->_alternativeButlerWidgetConfigEnabled;
  else
    v134 = 0;
  v133 = -[NTPBWidgetConfig hash](self->_butlerWidgetConfig, "hash");
  v132 = -[NTPBPaidSubscriptionConfig hash](self->_paidSubscriptionConfig, "hash");
  v34 = (uint64_t)self->_has;
  if ((v34 & 8) != 0)
  {
    articleDiversitySimilarityExpectationStart = self->_articleDiversitySimilarityExpectationStart;
    v37 = -articleDiversitySimilarityExpectationStart;
    if (articleDiversitySimilarityExpectationStart >= 0.0)
      v37 = self->_articleDiversitySimilarityExpectationStart;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  if ((v34 & 4) != 0)
  {
    articleDiversitySimilarityExpectationEnd = self->_articleDiversitySimilarityExpectationEnd;
    v42 = -articleDiversitySimilarityExpectationEnd;
    if (articleDiversitySimilarityExpectationEnd >= 0.0)
      v42 = self->_articleDiversitySimilarityExpectationEnd;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  if ((v34 & 0x80000) != 0)
  {
    v131 = 2654435761 * self->_maxPaidSubscriptionGroupSizeIPad;
    if ((v34 & 0x100000) != 0)
    {
LABEL_121:
      v130 = 2654435761 * self->_maxPaidSubscriptionGroupSizeIPhone;
      if ((v34 & 0x200000) != 0)
        goto LABEL_122;
LABEL_129:
      v129 = 0;
      if ((v34 & 0x4000000000) != 0)
        goto LABEL_123;
LABEL_130:
      v49 = 0;
      goto LABEL_133;
    }
  }
  else
  {
    v131 = 0;
    if ((v34 & 0x100000) != 0)
      goto LABEL_121;
  }
  v130 = 0;
  if ((v34 & 0x200000) == 0)
    goto LABEL_129;
LABEL_122:
  v129 = 2654435761 * self->_maxTimesHeadlineInPaidSubscriptionGroup;
  if ((v34 & 0x4000000000) == 0)
    goto LABEL_130;
LABEL_123:
  publisherDiversitySlope = self->_publisherDiversitySlope;
  v46 = -publisherDiversitySlope;
  if (publisherDiversitySlope >= 0.0)
    v46 = self->_publisherDiversitySlope;
  v47 = floor(v46 + 0.5);
  v48 = (v46 - v47) * 1.84467441e19;
  v49 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
  if (v48 >= 0.0)
  {
    if (v48 > 0.0)
      v49 += (unint64_t)v48;
  }
  else
  {
    v49 -= (unint64_t)fabs(v48);
  }
LABEL_133:
  if ((v34 & 0x8000000000) != 0)
  {
    publisherDiversityYIntercept = self->_publisherDiversityYIntercept;
    v52 = -publisherDiversityYIntercept;
    if (publisherDiversityYIntercept >= 0.0)
      v52 = self->_publisherDiversityYIntercept;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0)
        v50 += (unint64_t)v54;
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    v50 = 0;
  }
  if ((v34 & 0x4000) != 0)
    v127 = 2654435761 * self->_expiredPaidSubscriptionGroupCutoffTime;
  else
    v127 = 0;
  v128 = v50;
  if ((v34 & 0x40000) != 0)
    v126 = 2654435761 * self->_maxExpiredPaidSubscriptionGroupCount;
  else
    v126 = 0;
  v125 = -[NTPBWidgetConfig hash](self->_widgetConfig2, "hash");
  v55 = (uint64_t)self->_has;
  if ((v55 & 0x4000000000000) != 0)
  {
    v124 = 2654435761 * self->_subscriptionsPlacardPublisherFrequencySeconds;
    if ((v55 & 0x40000000000000) != 0)
      goto LABEL_149;
  }
  else
  {
    v124 = 0;
    if ((v55 & 0x40000000000000) != 0)
    {
LABEL_149:
      v123 = 2654435761 * self->_treatmentId;
      goto LABEL_152;
    }
  }
  v123 = 0;
LABEL_152:
  v122 = -[NTPBBinningConfig hash](self->_binningConfig, "hash");
  v121 = -[NTPBPersonalizationTreatment hash](self->_personalizationTreatment, "hash");
  if ((*(_QWORD *)&self->_has & 1) != 0)
  {
    v120 = 2654435761 * self->_analyticsEndpointMaxPayloadSize;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
      goto LABEL_154;
  }
  else
  {
    v120 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
    {
LABEL_154:
      v119 = 2654435761 * self->_orderFeedEndpointEnabled;
      goto LABEL_157;
    }
  }
  v119 = 0;
LABEL_157:
  v118 = -[NSString hash](self->_personalizationBundleIdMappingResourceId, "hash");
  v117 = -[NSString hash](self->_personalizationUrlMappingResourceId, "hash");
  v116 = -[NSString hash](self->_personalizationWhitelistResourceId, "hash");
  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
    v115 = 2654435761 * self->_enabledPrivateDataEncryptionLevel;
  else
    v115 = 0;
  v114 = -[NSString hash](self->_personalizationPublisherFavorabilityScoresResourceId, "hash");
  v113 = -[NSString hash](self->_personalizationWidgetSectionMappingResourceId, "hash");
  v56 = *((_WORD *)&self->_has + 4);
  v57 = (uint64_t)self->_has;
  if ((v57 & 0x200) == 0)
  {
    v112 = 0;
    if ((v57 & 0x400) != 0)
      goto LABEL_162;
LABEL_165:
    v111 = 0;
    if ((v56 & 0x10) != 0)
      goto LABEL_163;
    goto LABEL_166;
  }
  v112 = 2654435761 * self->_corryBarMaxArticleCountForArticleList;
  if ((v57 & 0x400) == 0)
    goto LABEL_165;
LABEL_162:
  v111 = 2654435761 * self->_corryBarMaxArticleCountForSingleArticle;
  if ((v56 & 0x10) != 0)
  {
LABEL_163:
    v110 = 2654435761 * self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
    goto LABEL_167;
  }
LABEL_166:
  v110 = 0;
LABEL_167:
  v109 = -[NSMutableArray hash](self->_externalAnalyticsConfigs, "hash");
  v108 = -[NSString hash](self->_personalizationPortraitConfigResourceId, "hash");
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
    v107 = 2654435761 * self->_orderFeedEnabledLevelDeprecated;
  else
    v107 = 0;
  v106 = -[NSString hash](self->_experimentalizableFieldPostfix, "hash");
  v58 = (uint64_t)self->_has;
  if ((v58 & 0x20000000) != 0)
  {
    v105 = 2654435761 * self->_minimumFollowCountToRemovePersonalizePlacardInFollowing;
    if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
    {
LABEL_172:
      v104 = 2654435761 * self->_useSecureConnectionForAssets;
      if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
        goto LABEL_173;
      goto LABEL_179;
    }
  }
  else
  {
    v105 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
      goto LABEL_172;
  }
  v104 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
LABEL_173:
    v103 = 2654435761 * self->_usUkUseAuWhatsNewFeatures;
    if ((v58 & 0x4000000000000000) != 0)
      goto LABEL_174;
    goto LABEL_180;
  }
LABEL_179:
  v103 = 0;
  if ((v58 & 0x4000000000000000) != 0)
  {
LABEL_174:
    v102 = 2654435761 * self->_orderFeedEnabledLevel;
    if ((v58 & 0x200000000000) != 0)
      goto LABEL_175;
LABEL_181:
    v101 = 0;
    if ((v58 & 0x40) != 0)
      goto LABEL_176;
    goto LABEL_182;
  }
LABEL_180:
  v102 = 0;
  if ((v58 & 0x200000000000) == 0)
    goto LABEL_181;
LABEL_175:
  v101 = 2654435761 * self->_stateRestorationAllowedTimeWindow;
  if ((v58 & 0x40) != 0)
  {
LABEL_176:
    v100 = 2654435761 * self->_autoRefreshMinimumInterval;
    goto LABEL_183;
  }
LABEL_182:
  v100 = 0;
LABEL_183:
  v171 = v9;
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
    v99 = 2654435761 * self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment;
  else
    v99 = 0;
  v98 = PBRepeatedInt64Hash();
  v59 = (uint64_t)self->_has;
  v60 = *((_WORD *)&self->_has + 4);
  if ((v60 & 8) != 0)
  {
    v97 = 2654435761 * self->_articleSearchEnabled;
    if ((v59 & 0x400000) != 0)
      goto LABEL_188;
LABEL_193:
    v65 = 0;
    goto LABEL_196;
  }
  v97 = 0;
  if ((v59 & 0x400000) == 0)
    goto LABEL_193;
LABEL_188:
  maximumRatioOfArticlesInForYouGroup = self->_maximumRatioOfArticlesInForYouGroup;
  v62 = -maximumRatioOfArticlesInForYouGroup;
  if (maximumRatioOfArticlesInForYouGroup >= 0.0)
    v62 = self->_maximumRatioOfArticlesInForYouGroup;
  v63 = floor(v62 + 0.5);
  v64 = (v62 - v63) * 1.84467441e19;
  v65 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
  if (v64 >= 0.0)
  {
    if (v64 > 0.0)
      v65 += (unint64_t)v64;
  }
  else
  {
    v65 -= (unint64_t)fabs(v64);
  }
LABEL_196:
  if ((v59 & 0x40000000) != 0)
  {
    minimumTrendingUnseenRatio = self->_minimumTrendingUnseenRatio;
    v68 = -minimumTrendingUnseenRatio;
    if (minimumTrendingUnseenRatio >= 0.0)
      v68 = self->_minimumTrendingUnseenRatio;
    v69 = floor(v68 + 0.5);
    v70 = (v68 - v69) * 1.84467441e19;
    v66 = 2654435761u * (unint64_t)fmod(v69, 1.84467441e19);
    if (v70 >= 0.0)
    {
      if (v70 > 0.0)
        v66 += (unint64_t)v70;
    }
    else
    {
      v66 -= (unint64_t)fabs(v70);
    }
  }
  else
  {
    v66 = 0;
  }
  if ((v60 & 2) != 0)
  {
    v95 = 2654435761 * self->_trendingStyle;
    if ((v59 & 0x2000000) != 0)
    {
LABEL_206:
      v94 = 2654435761 * self->_minimumDurationBetweenForYouGroupsWeekday;
      if ((v59 & 0x4000000) != 0)
        goto LABEL_207;
      goto LABEL_212;
    }
  }
  else
  {
    v95 = 0;
    if ((v59 & 0x2000000) != 0)
      goto LABEL_206;
  }
  v94 = 0;
  if ((v59 & 0x4000000) != 0)
  {
LABEL_207:
    v93 = 2654435761 * self->_minimumDurationBetweenForYouGroupsWeekend;
    if ((v59 & 0x8000000) != 0)
      goto LABEL_208;
LABEL_213:
    v92 = 0;
    if ((v59 & 0x10000000) != 0)
      goto LABEL_209;
    goto LABEL_214;
  }
LABEL_212:
  v93 = 0;
  if ((v59 & 0x8000000) == 0)
    goto LABEL_213;
LABEL_208:
  v92 = 2654435761 * self->_minimumDurationBetweenTrendingGroupsWeekday;
  if ((v59 & 0x10000000) != 0)
  {
LABEL_209:
    v91 = 2654435761 * self->_minimumDurationBetweenTrendingGroupsWeekend;
    goto LABEL_215;
  }
LABEL_214:
  v91 = 0;
LABEL_215:
  v96 = v66;
  if ((v60 & 0x40) != 0)
    v90 = 2654435761 * self->_diversifyOptionalTopStories;
  else
    v90 = 0;
  v89 = -[NTPBVideoGroupsConfig hash](self->_forYouVideoGroupsConfig, "hash");
  v88 = -[NSString hash](self->_articleRecirculationConfig, "hash");
  v71 = (uint64_t)self->_has;
  if ((v71 & 0x1000000000) != 0)
  {
    v87 = 2654435761 * self->_optionalTopStoriesRefreshRate;
    if ((v71 & 0x2000) != 0)
      goto LABEL_220;
  }
  else
  {
    v87 = 0;
    if ((v71 & 0x2000) != 0)
    {
LABEL_220:
      v85 = 2654435761 * self->_expirePinnedArticlesAfter;
      goto LABEL_223;
    }
  }
  v85 = 0;
LABEL_223:
  v72 = *((_WORD *)&self->_has + 4);
  if ((v71 & 0x200000000000000) == 0)
  {
    v73 = 0;
    if ((v71 & 0x100000000000000) != 0)
      goto LABEL_225;
LABEL_228:
    v74 = 0;
    if ((v72 & 1) != 0)
      goto LABEL_226;
    goto LABEL_229;
  }
  v73 = 2654435761 * self->_userSegmentationApiModThreshold;
  if ((v71 & 0x100000000000000) == 0)
    goto LABEL_228;
LABEL_225:
  v74 = 2654435761 * self->_userSegmentationApiModMax;
  if ((v72 & 1) != 0)
  {
LABEL_226:
    v75 = 2654435761 * self->_privateDataMigrationCleanupLevel;
    goto LABEL_230;
  }
LABEL_229:
  v75 = 0;
LABEL_230:
  v76 = -[NSString hash](self->_articleRecirculationComponentPlacementConfig, "hash", v85);
  v77 = (uint64_t)self->_has;
  if ((v77 & 0x1000000000000000) != 0)
  {
    v78 = 2654435761 * self->_widgetEventImmediateUploadPopulationFloor;
    if ((v77 & 0x800000000000000) != 0)
      goto LABEL_232;
  }
  else
  {
    v78 = 0;
    if ((v77 & 0x800000000000000) != 0)
    {
LABEL_232:
      v79 = 2654435761 * self->_widgetEventImmediateUploadPopulationCeiling;
      goto LABEL_235;
    }
  }
  v79 = 0;
LABEL_235:
  v80 = *((_WORD *)&self->_has + 4);
  if ((v77 & 0x400000000000000) == 0)
  {
    v81 = 0;
    if ((v77 & 0x20) != 0)
      goto LABEL_237;
LABEL_240:
    v82 = 0;
    if ((v80 & 0x20) != 0)
      goto LABEL_238;
LABEL_241:
    v83 = 0;
    return v175 ^ v176 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v35 ^ v40 ^ v131 ^ v130 ^ v129 ^ v49 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v65 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v73 ^ v74 ^ v75 ^ v76 ^ v78 ^ v79 ^ v81 ^ v82 ^ v83 ^ -[NTPBUserSegmentationApiConfiguration hash](self->_userSegmentationApiConfiguration, "hash");
  }
  v81 = 2654435761 * self->_widgetEventImmediateUploadModuloForHashing;
  if ((v77 & 0x20) == 0)
    goto LABEL_240;
LABEL_237:
  v82 = 2654435761 * self->_articleRecirculationPopularFeedQueryTimeRange;
  if ((v80 & 0x20) == 0)
    goto LABEL_241;
LABEL_238:
  v83 = 2654435761 * self->_disableThumbnailsForArticleRecirculation;
  return v175 ^ v176 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v35 ^ v40 ^ v131 ^ v130 ^ v129 ^ v49 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v65 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v73 ^ v74 ^ v75 ^ v76 ^ v78 ^ v79 ^ v81 ^ v82 ^ v83 ^ -[NTPBUserSegmentationApiConfiguration hash](self->_userSegmentationApiConfiguration, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NTPBPersonalizationConfig *personalizationConfig;
  uint64_t v17;
  NTPBIAdConfig *iadConfig;
  uint64_t v19;
  NTPBPrefetchConfig *prefetchConfig;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  NTPBWidgetConfig *widgetConfig;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  NTPBWidgetConfig *alternativeButlerWidgetConfig;
  uint64_t v32;
  NTPBWidgetConfig *butlerWidgetConfig;
  uint64_t v34;
  NTPBPaidSubscriptionConfig *paidSubscriptionConfig;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  NTPBWidgetConfig *widgetConfig2;
  uint64_t v40;
  uint64_t v41;
  NTPBBinningConfig *binningConfig;
  uint64_t v43;
  NTPBPersonalizationTreatment *personalizationTreatment;
  uint64_t v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  uint64_t *v58;
  __int16 v59;
  uint64_t v60;
  NTPBVideoGroupsConfig *forYouVideoGroupsConfig;
  uint64_t v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  NTPBUserSegmentationApiConfiguration *userSegmentationApiConfiguration;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 75))
    -[NTPBConfig setFallbackLanguageTag:](self, "setFallbackLanguageTag:");
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v5 = *((id *)v4 + 79);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v78 != v8)
          objc_enumerationMutation(v5);
        -[NTPBConfig addLanguageConfigs:](self, "addLanguageConfigs:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    }
    while (v7);
  }

  v10 = *(_QWORD *)(v4 + 772);
  if ((v10 & 0x100000000000) != 0)
  {
    self->_shortReminderTime = *((_QWORD *)v4 + 48);
    *(_QWORD *)&self->_has |= 0x100000000000uLL;
    v10 = *(_QWORD *)(v4 + 772);
  }
  if ((v10 & 0x20000) != 0)
  {
    self->_longReminderTime = *((_QWORD *)v4 + 21);
    *(_QWORD *)&self->_has |= 0x20000uLL;
    v10 = *(_QWORD *)(v4 + 772);
    if ((*((_WORD *)v4 + 390) & 0x80) == 0)
    {
LABEL_14:
      if ((v10 & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_30;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x80) == 0)
  {
    goto LABEL_14;
  }
  self->_newsletterSubscriptionChecked = v4[765];
  *((_WORD *)&self->_has + 4) |= 0x80u;
  v10 = *(_QWORD *)(v4 + 772);
  if ((v10 & 0x100) == 0)
  {
LABEL_15:
    if ((v10 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_30:
  self->_batchedFeedTimeout = *((double *)v4 + 12);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v10 = *(_QWORD *)(v4 + 772);
  if ((v10 & 0x10000) == 0)
  {
LABEL_16:
    if ((v10 & 0x2000000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_31:
  self->_interstitialAdLoadDelay = *((double *)v4 + 20);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  if ((*(_QWORD *)(v4 + 772) & 0x2000000000) != 0)
  {
LABEL_17:
    self->_prerollLoadingTimeout = *((double *)v4 + 41);
    *(_QWORD *)&self->_has |= 0x2000000000uLL;
  }
LABEL_18:
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v11 = *((id *)v4 + 72);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v74 != v14)
          objc_enumerationMutation(v11);
        -[NTPBConfig addEndpointConfigs:](self, "addEndpointConfigs:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v13);
  }

  personalizationConfig = self->_personalizationConfig;
  v17 = *((_QWORD *)v4 + 83);
  if (personalizationConfig)
  {
    if (v17)
      -[NTPBPersonalizationConfig mergeFrom:](personalizationConfig, "mergeFrom:");
  }
  else if (v17)
  {
    -[NTPBConfig setPersonalizationConfig:](self, "setPersonalizationConfig:");
  }
  iadConfig = self->_iadConfig;
  v19 = *((_QWORD *)v4 + 78);
  if (iadConfig)
  {
    if (v19)
      -[NTPBIAdConfig mergeFrom:](iadConfig, "mergeFrom:");
  }
  else if (v19)
  {
    -[NTPBConfig setIadConfig:](self, "setIadConfig:");
  }
  prefetchConfig = self->_prefetchConfig;
  v21 = *((_QWORD *)v4 + 90);
  if (prefetchConfig)
  {
    if (v21)
      -[NTPBPrefetchConfig mergeFrom:](prefetchConfig, "mergeFrom:");
  }
  else if (v21)
  {
    -[NTPBConfig setPrefetchConfig:](self, "setPrefetchConfig:");
  }
  v22 = (uint64_t *)(v4 + 772);
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x8000000000000) != 0)
  {
    self->_tileProminenceScoreBalanceValue = *((double *)v4 + 55);
    *(_QWORD *)&self->_has |= 0x8000000000000uLL;
    v23 = *v22;
    if ((*v22 & 0x800000) == 0)
    {
LABEL_47:
      if ((v23 & 0x8000) == 0)
        goto LABEL_48;
      goto LABEL_72;
    }
  }
  else if ((v23 & 0x800000) == 0)
  {
    goto LABEL_47;
  }
  self->_minimumArticleUpdateInterval = *((_QWORD *)v4 + 27);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x8000) == 0)
  {
LABEL_48:
    if ((v23 & 0x80) == 0)
      goto LABEL_49;
    goto LABEL_73;
  }
LABEL_72:
  self->_initialArticlesFromNewFavorite = *((_QWORD *)v4 + 19);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x80) == 0)
  {
LABEL_49:
    if ((v23 & 0x80000000000000) == 0)
      goto LABEL_50;
    goto LABEL_74;
  }
LABEL_73:
  self->_autoScrollToTopFeedTimeout = *((_QWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x80000000000000) == 0)
  {
LABEL_50:
    if ((v23 & 2) == 0)
      goto LABEL_51;
    goto LABEL_75;
  }
LABEL_74:
  self->_trendingTopicsRefreshRate = *((_QWORD *)v4 + 59);
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 2) == 0)
  {
LABEL_51:
    if ((v23 & 0x1000000) == 0)
      goto LABEL_52;
    goto LABEL_76;
  }
LABEL_75:
  self->_appConfigRefreshRate = *((_QWORD *)v4 + 5);
  *(_QWORD *)&self->_has |= 2uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x1000000) == 0)
  {
LABEL_52:
    if ((v23 & 0x20000000000000) == 0)
      goto LABEL_53;
    goto LABEL_77;
  }
LABEL_76:
  self->_minimumDistanceBetweenImageOnTopTiles = *((_QWORD *)v4 + 28);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x20000000000000) == 0)
  {
LABEL_53:
    if ((v23 & 0x10000000000000) == 0)
      goto LABEL_54;
    goto LABEL_78;
  }
LABEL_77:
  self->_timeBetweenWidgetInsertions = *((_QWORD *)v4 + 57);
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x10000000000000) == 0)
  {
LABEL_54:
    if ((v23 & 0x800000000) == 0)
      goto LABEL_55;
    goto LABEL_79;
  }
LABEL_78:
  self->_timeBetweenSameWidgetReinsertion = *((_QWORD *)v4 + 56);
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x800000000) == 0)
  {
LABEL_55:
    if ((v23 & 0x10) == 0)
      goto LABEL_56;
    goto LABEL_80;
  }
LABEL_79:
  self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit = *((_QWORD *)v4 + 39);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v23 = *(_QWORD *)(v4 + 772);
  if ((v23 & 0x10) == 0)
  {
LABEL_56:
    if ((v23 & 0x400000000000) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_80:
  self->_articleRapidUpdatesTimeout = *((_QWORD *)v4 + 8);
  *(_QWORD *)&self->_has |= 0x10uLL;
  if ((*(_QWORD *)(v4 + 772) & 0x400000000000) != 0)
  {
LABEL_57:
    self->_subscriptionsGlobalMeteredCount = *((_QWORD *)v4 + 50);
    *(_QWORD *)&self->_has |= 0x400000000000uLL;
  }
LABEL_58:
  if (*((_QWORD *)v4 + 66))
    -[NTPBConfig setAnfEmbedConfigurationAsset:](self, "setAnfEmbedConfigurationAsset:");
  v24 = (uint64_t *)(v4 + 772);
  v25 = *(_QWORD *)(v4 + 772);
  if ((v25 & 0x2000000000000) != 0)
  {
    self->_subscriptionsPlacardPublisherFrequencyDays = *((_QWORD *)v4 + 53);
    *(_QWORD *)&self->_has |= 0x2000000000000uLL;
    v25 = *v24;
    if ((*v24 & 0x1000000000000) == 0)
    {
LABEL_62:
      if ((v25 & 0x800000000000) == 0)
        goto LABEL_63;
      goto LABEL_84;
    }
  }
  else if ((v25 & 0x1000000000000) == 0)
  {
    goto LABEL_62;
  }
  self->_subscriptionsPlacardGlobalMaxPerDay = *((_QWORD *)v4 + 52);
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v25 = *(_QWORD *)(v4 + 772);
  if ((v25 & 0x800000000000) == 0)
  {
LABEL_63:
    if ((v25 & 0x80000000) == 0)
      goto LABEL_64;
    goto LABEL_85;
  }
LABEL_84:
  self->_subscriptionsGracePeriodForTokenVerificationSeconds = *((_QWORD *)v4 + 51);
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  v25 = *(_QWORD *)(v4 + 772);
  if ((v25 & 0x80000000) == 0)
  {
LABEL_64:
    if ((v25 & 0x1000) == 0)
      goto LABEL_65;
    goto LABEL_86;
  }
LABEL_85:
  self->_newFavoriteNotificationAlertsFrequency = *((_QWORD *)v4 + 35);
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  v25 = *(_QWORD *)(v4 + 772);
  if ((v25 & 0x1000) == 0)
  {
LABEL_65:
    if ((v25 & 0x800) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_86:
  self->_endOfArticleMinPaidHeadlineRatio = *((double *)v4 + 16);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  if ((*(_QWORD *)(v4 + 772) & 0x800) != 0)
  {
LABEL_66:
    self->_endOfArticleMaxInaccessiblePaidArticles = *((_QWORD *)v4 + 15);
    *(_QWORD *)&self->_has |= 0x800uLL;
  }
LABEL_67:
  widgetConfig = self->_widgetConfig;
  v27 = *((_QWORD *)v4 + 93);
  if (widgetConfig)
  {
    if (v27)
      -[NTPBWidgetConfig mergeFrom:](widgetConfig, "mergeFrom:");
  }
  else if (v27)
  {
    -[NTPBConfig setWidgetConfig:](self, "setWidgetConfig:");
  }
  if ((*((_WORD *)v4 + 390) & 0x400) != 0)
  {
    self->_universalLinksEnabled = v4[768];
    *((_WORD *)&self->_has + 4) |= 0x400u;
  }
  v28 = *(_QWORD *)(v4 + 772);
  if ((v28 & 0x100000000) != 0)
  {
    self->_notificationArticleCacheTimeout = *((_QWORD *)v4 + 36);
    *(_QWORD *)&self->_has |= 0x100000000uLL;
    v28 = *(_QWORD *)(v4 + 772);
  }
  if ((v28 & 0x200000000) != 0)
  {
    self->_notificationArticleWithRapidUpdatesCacheTimeout = *((_QWORD *)v4 + 37);
    *(_QWORD *)&self->_has |= 0x200000000uLL;
  }
  if (*((_QWORD *)v4 + 76))
    -[NTPBConfig setForYouNonPersonalizedGroupsOrder:](self, "setForYouNonPersonalizedGroupsOrder:");
  v29 = (uint64_t *)(v4 + 772);
  v30 = *(_QWORD *)(v4 + 772);
  if ((v30 & 0x400000000) != 0)
  {
    self->_notificationEnabledChannelsRefreshFrequency = *((_QWORD *)v4 + 38);
    *(_QWORD *)&self->_has |= 0x400000000uLL;
    v30 = *v29;
    if ((*v29 & 0x40000000000) == 0)
    {
LABEL_100:
      if ((v30 & 0x20000000000) == 0)
        goto LABEL_101;
      goto LABEL_109;
    }
  }
  else if ((v30 & 0x40000000000) == 0)
  {
    goto LABEL_100;
  }
  self->_savedArticlesMaximumCountWifi = *((_QWORD *)v4 + 46);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  v30 = *(_QWORD *)(v4 + 772);
  if ((v30 & 0x20000000000) == 0)
  {
LABEL_101:
    if ((v30 & 0x10000000000) == 0)
      goto LABEL_102;
    goto LABEL_110;
  }
LABEL_109:
  self->_savedArticlesMaximumCountCellular = *((_QWORD *)v4 + 45);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  v30 = *(_QWORD *)(v4 + 772);
  if ((v30 & 0x10000000000) == 0)
  {
LABEL_102:
    if ((v30 & 0x80000000000) == 0)
      goto LABEL_104;
    goto LABEL_103;
  }
LABEL_110:
  self->_savedArticlesCutoffTime = *((_QWORD *)v4 + 44);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  if ((*(_QWORD *)(v4 + 772) & 0x80000000000) != 0)
  {
LABEL_103:
    self->_savedArticlesOpenedCutoffTime = *((_QWORD *)v4 + 47);
    *(_QWORD *)&self->_has |= 0x80000000000uLL;
  }
LABEL_104:
  alternativeButlerWidgetConfig = self->_alternativeButlerWidgetConfig;
  v32 = *((_QWORD *)v4 + 65);
  if (alternativeButlerWidgetConfig)
  {
    if (v32)
      -[NTPBWidgetConfig mergeFrom:](alternativeButlerWidgetConfig, "mergeFrom:");
  }
  else if (v32)
  {
    -[NTPBConfig setAlternativeButlerWidgetConfig:](self, "setAlternativeButlerWidgetConfig:");
  }
  if ((*((_WORD *)v4 + 390) & 4) != 0)
  {
    self->_alternativeButlerWidgetConfigEnabled = v4[760];
    *((_WORD *)&self->_has + 4) |= 4u;
  }
  butlerWidgetConfig = self->_butlerWidgetConfig;
  v34 = *((_QWORD *)v4 + 70);
  if (butlerWidgetConfig)
  {
    if (v34)
      -[NTPBWidgetConfig mergeFrom:](butlerWidgetConfig, "mergeFrom:");
  }
  else if (v34)
  {
    -[NTPBConfig setButlerWidgetConfig:](self, "setButlerWidgetConfig:");
  }
  paidSubscriptionConfig = self->_paidSubscriptionConfig;
  v36 = *((_QWORD *)v4 + 81);
  if (paidSubscriptionConfig)
  {
    if (v36)
      -[NTPBPaidSubscriptionConfig mergeFrom:](paidSubscriptionConfig, "mergeFrom:");
  }
  else if (v36)
  {
    -[NTPBConfig setPaidSubscriptionConfig:](self, "setPaidSubscriptionConfig:");
  }
  v37 = (uint64_t *)(v4 + 772);
  v38 = *(_QWORD *)(v4 + 772);
  if ((v38 & 8) != 0)
  {
    self->_articleDiversitySimilarityExpectationStart = *((double *)v4 + 7);
    *(_QWORD *)&self->_has |= 8uLL;
    v38 = *v37;
    if ((*v37 & 4) == 0)
    {
LABEL_128:
      if ((v38 & 0x80000) == 0)
        goto LABEL_129;
      goto LABEL_141;
    }
  }
  else if ((v38 & 4) == 0)
  {
    goto LABEL_128;
  }
  self->_articleDiversitySimilarityExpectationEnd = *((double *)v4 + 6);
  *(_QWORD *)&self->_has |= 4uLL;
  v38 = *(_QWORD *)(v4 + 772);
  if ((v38 & 0x80000) == 0)
  {
LABEL_129:
    if ((v38 & 0x100000) == 0)
      goto LABEL_130;
    goto LABEL_142;
  }
LABEL_141:
  self->_maxPaidSubscriptionGroupSizeIPad = *((_QWORD *)v4 + 23);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v38 = *(_QWORD *)(v4 + 772);
  if ((v38 & 0x100000) == 0)
  {
LABEL_130:
    if ((v38 & 0x200000) == 0)
      goto LABEL_131;
    goto LABEL_143;
  }
LABEL_142:
  self->_maxPaidSubscriptionGroupSizeIPhone = *((_QWORD *)v4 + 24);
  *(_QWORD *)&self->_has |= 0x100000uLL;
  v38 = *(_QWORD *)(v4 + 772);
  if ((v38 & 0x200000) == 0)
  {
LABEL_131:
    if ((v38 & 0x4000000000) == 0)
      goto LABEL_132;
    goto LABEL_144;
  }
LABEL_143:
  self->_maxTimesHeadlineInPaidSubscriptionGroup = *((_QWORD *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  v38 = *(_QWORD *)(v4 + 772);
  if ((v38 & 0x4000000000) == 0)
  {
LABEL_132:
    if ((v38 & 0x8000000000) == 0)
      goto LABEL_133;
    goto LABEL_145;
  }
LABEL_144:
  self->_publisherDiversitySlope = *((double *)v4 + 42);
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  v38 = *(_QWORD *)(v4 + 772);
  if ((v38 & 0x8000000000) == 0)
  {
LABEL_133:
    if ((v38 & 0x4000) == 0)
      goto LABEL_134;
    goto LABEL_146;
  }
LABEL_145:
  self->_publisherDiversityYIntercept = *((double *)v4 + 43);
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  v38 = *(_QWORD *)(v4 + 772);
  if ((v38 & 0x4000) == 0)
  {
LABEL_134:
    if ((v38 & 0x40000) == 0)
      goto LABEL_136;
    goto LABEL_135;
  }
LABEL_146:
  self->_expiredPaidSubscriptionGroupCutoffTime = *((_QWORD *)v4 + 18);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  if ((*(_QWORD *)(v4 + 772) & 0x40000) != 0)
  {
LABEL_135:
    self->_maxExpiredPaidSubscriptionGroupCount = *((_QWORD *)v4 + 22);
    *(_QWORD *)&self->_has |= 0x40000uLL;
  }
LABEL_136:
  widgetConfig2 = self->_widgetConfig2;
  v40 = *((_QWORD *)v4 + 94);
  if (widgetConfig2)
  {
    if (v40)
      -[NTPBWidgetConfig mergeFrom:](widgetConfig2, "mergeFrom:");
  }
  else if (v40)
  {
    -[NTPBConfig setWidgetConfig2:](self, "setWidgetConfig2:");
  }
  v41 = *(_QWORD *)(v4 + 772);
  if ((v41 & 0x4000000000000) != 0)
  {
    self->_subscriptionsPlacardPublisherFrequencySeconds = *((_QWORD *)v4 + 54);
    *(_QWORD *)&self->_has |= 0x4000000000000uLL;
    v41 = *(_QWORD *)(v4 + 772);
  }
  if ((v41 & 0x40000000000000) != 0)
  {
    self->_treatmentId = *((_QWORD *)v4 + 58);
    *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  }
  binningConfig = self->_binningConfig;
  v43 = *((_QWORD *)v4 + 69);
  if (binningConfig)
  {
    if (v43)
      -[NTPBBinningConfig mergeFrom:](binningConfig, "mergeFrom:");
  }
  else if (v43)
  {
    -[NTPBConfig setBinningConfig:](self, "setBinningConfig:");
  }
  personalizationTreatment = self->_personalizationTreatment;
  v45 = *((_QWORD *)v4 + 86);
  if (personalizationTreatment)
  {
    if (v45)
      -[NTPBPersonalizationTreatment mergeFrom:](personalizationTreatment, "mergeFrom:");
  }
  else if (v45)
  {
    -[NTPBConfig setPersonalizationTreatment:](self, "setPersonalizationTreatment:");
  }
  if ((*(_QWORD *)(v4 + 772) & 1) != 0)
  {
    self->_analyticsEndpointMaxPayloadSize = *((_QWORD *)v4 + 4);
    *(_QWORD *)&self->_has |= 1uLL;
  }
  if ((*((_WORD *)v4 + 390) & 0x100) != 0)
  {
    self->_orderFeedEndpointEnabled = v4[766];
    *((_WORD *)&self->_has + 4) |= 0x100u;
  }
  if (*((_QWORD *)v4 + 82))
    -[NTPBConfig setPersonalizationBundleIdMappingResourceId:](self, "setPersonalizationBundleIdMappingResourceId:");
  if (*((_QWORD *)v4 + 87))
    -[NTPBConfig setPersonalizationUrlMappingResourceId:](self, "setPersonalizationUrlMappingResourceId:");
  if (*((_QWORD *)v4 + 88))
    -[NTPBConfig setPersonalizationWhitelistResourceId:](self, "setPersonalizationWhitelistResourceId:");
  if ((*(_QWORD *)(v4 + 772) & 0x2000000000000000) != 0)
  {
    self->_enabledPrivateDataEncryptionLevel = *((_DWORD *)v4 + 142);
    *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  }
  if (*((_QWORD *)v4 + 85))
    -[NTPBConfig setPersonalizationPublisherFavorabilityScoresResourceId:](self, "setPersonalizationPublisherFavorabilityScoresResourceId:");
  if (*((_QWORD *)v4 + 89))
    -[NTPBConfig setPersonalizationWidgetSectionMappingResourceId:](self, "setPersonalizationWidgetSectionMappingResourceId:");
  v46 = *(_QWORD *)(v4 + 772);
  if ((v46 & 0x200) != 0)
  {
    self->_corryBarMaxArticleCountForArticleList = *((_QWORD *)v4 + 13);
    *(_QWORD *)&self->_has |= 0x200uLL;
    v46 = *(_QWORD *)(v4 + 772);
  }
  v47 = *((_WORD *)v4 + 390);
  if ((v46 & 0x400) != 0)
  {
    self->_corryBarMaxArticleCountForSingleArticle = *((_QWORD *)v4 + 14);
    *(_QWORD *)&self->_has |= 0x400uLL;
    v47 = *((_WORD *)v4 + 390);
  }
  if ((v47 & 0x10) != 0)
  {
    self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers = v4[762];
    *((_WORD *)&self->_has + 4) |= 0x10u;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v48 = *((id *)v4 + 74);
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v70 != v51)
          objc_enumerationMutation(v48);
        -[NTPBConfig addExternalAnalyticsConfig:](self, "addExternalAnalyticsConfig:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k), (_QWORD)v69);
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v50);
  }

  if (*((_QWORD *)v4 + 84))
    -[NTPBConfig setPersonalizationPortraitConfigResourceId:](self, "setPersonalizationPortraitConfigResourceId:");
  if ((*(_QWORD *)(v4 + 772) & 0x8000000000000000) != 0)
  {
    self->_orderFeedEnabledLevelDeprecated = *((_DWORD *)v4 + 161);
    *(_QWORD *)&self->_has |= 0x8000000000000000;
  }
  if (*((_QWORD *)v4 + 73))
    -[NTPBConfig setExperimentalizableFieldPostfix:](self, "setExperimentalizableFieldPostfix:");
  v53 = *(_QWORD *)(v4 + 772);
  if ((v53 & 0x20000000) != 0)
  {
    self->_minimumFollowCountToRemovePersonalizePlacardInFollowing = *((_QWORD *)v4 + 33);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
    v53 = *(_QWORD *)(v4 + 772);
  }
  v54 = *((_WORD *)v4 + 390);
  if ((v54 & 0x1000) != 0)
  {
    self->_useSecureConnectionForAssets = v4[770];
    *((_WORD *)&self->_has + 4) |= 0x1000u;
    v53 = *(_QWORD *)(v4 + 772);
    v54 = *((_WORD *)v4 + 390);
    if ((v54 & 0x800) == 0)
    {
LABEL_203:
      if ((v53 & 0x4000000000000000) == 0)
        goto LABEL_204;
      goto LABEL_216;
    }
  }
  else if ((*((_WORD *)v4 + 390) & 0x800) == 0)
  {
    goto LABEL_203;
  }
  self->_usUkUseAuWhatsNewFeatures = v4[769];
  *((_WORD *)&self->_has + 4) |= 0x800u;
  v53 = *(_QWORD *)(v4 + 772);
  v54 = *((_WORD *)v4 + 390);
  if ((v53 & 0x4000000000000000) == 0)
  {
LABEL_204:
    if ((v53 & 0x200000000000) == 0)
      goto LABEL_205;
    goto LABEL_217;
  }
LABEL_216:
  self->_orderFeedEnabledLevel = *((_DWORD *)v4 + 160);
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  v53 = *(_QWORD *)(v4 + 772);
  v54 = *((_WORD *)v4 + 390);
  if ((v53 & 0x200000000000) == 0)
  {
LABEL_205:
    if ((v53 & 0x40) == 0)
      goto LABEL_206;
    goto LABEL_218;
  }
LABEL_217:
  self->_stateRestorationAllowedTimeWindow = *((_QWORD *)v4 + 49);
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  v54 = *((_WORD *)v4 + 390);
  if ((*(_QWORD *)(v4 + 772) & 0x40) == 0)
  {
LABEL_206:
    if ((v54 & 0x200) == 0)
      goto LABEL_208;
    goto LABEL_207;
  }
LABEL_218:
  self->_autoRefreshMinimumInterval = *((_QWORD *)v4 + 10);
  *(_QWORD *)&self->_has |= 0x40uLL;
  if ((*((_WORD *)v4 + 390) & 0x200) != 0)
  {
LABEL_207:
    self->_terminateAppOnBackgroundAfterJoiningOrLeavingExperiment = v4[767];
    *((_WORD *)&self->_has + 4) |= 0x200u;
  }
LABEL_208:
  v55 = objc_msgSend(v4, "topStoriesPublishTimeIntervalsCount", (_QWORD)v69);
  if (v55)
  {
    v56 = v55;
    for (m = 0; m != v56; ++m)
      -[NTPBConfig addTopStoriesPublishTimeIntervals:](self, "addTopStoriesPublishTimeIntervals:", objc_msgSend(v4, "topStoriesPublishTimeIntervalsAtIndex:", m));
  }
  v58 = (uint64_t *)(v4 + 772);
  v59 = *((_WORD *)v4 + 390);
  if ((v59 & 8) != 0)
  {
    self->_articleSearchEnabled = v4[761];
    *((_WORD *)&self->_has + 4) |= 8u;
    v60 = *v58;
    v59 = *((_WORD *)v4 + 390);
    if ((*v58 & 0x400000) == 0)
      goto LABEL_222;
    goto LABEL_221;
  }
  v60 = *v58;
  if ((*v58 & 0x400000) != 0)
  {
LABEL_221:
    self->_maximumRatioOfArticlesInForYouGroup = *((double *)v4 + 26);
    *(_QWORD *)&self->_has |= 0x400000uLL;
    v60 = *(_QWORD *)(v4 + 772);
    v59 = *((_WORD *)v4 + 390);
  }
LABEL_222:
  if ((v60 & 0x40000000) != 0)
  {
    self->_minimumTrendingUnseenRatio = *((double *)v4 + 34);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
    v60 = *(_QWORD *)(v4 + 772);
    v59 = *((_WORD *)v4 + 390);
    if ((v59 & 2) == 0)
    {
LABEL_224:
      if ((v60 & 0x2000000) == 0)
        goto LABEL_225;
      goto LABEL_235;
    }
  }
  else if ((v59 & 2) == 0)
  {
    goto LABEL_224;
  }
  self->_trendingStyle = *((_DWORD *)v4 + 183);
  *((_WORD *)&self->_has + 4) |= 2u;
  v60 = *(_QWORD *)(v4 + 772);
  v59 = *((_WORD *)v4 + 390);
  if ((v60 & 0x2000000) == 0)
  {
LABEL_225:
    if ((v60 & 0x4000000) == 0)
      goto LABEL_226;
    goto LABEL_236;
  }
LABEL_235:
  self->_minimumDurationBetweenForYouGroupsWeekday = *((_QWORD *)v4 + 29);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v60 = *(_QWORD *)(v4 + 772);
  v59 = *((_WORD *)v4 + 390);
  if ((v60 & 0x4000000) == 0)
  {
LABEL_226:
    if ((v60 & 0x8000000) == 0)
      goto LABEL_227;
    goto LABEL_237;
  }
LABEL_236:
  self->_minimumDurationBetweenForYouGroupsWeekend = *((_QWORD *)v4 + 30);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v60 = *(_QWORD *)(v4 + 772);
  v59 = *((_WORD *)v4 + 390);
  if ((v60 & 0x8000000) == 0)
  {
LABEL_227:
    if ((v60 & 0x10000000) == 0)
      goto LABEL_228;
    goto LABEL_238;
  }
LABEL_237:
  self->_minimumDurationBetweenTrendingGroupsWeekday = *((_QWORD *)v4 + 31);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v59 = *((_WORD *)v4 + 390);
  if ((*(_QWORD *)(v4 + 772) & 0x10000000) == 0)
  {
LABEL_228:
    if ((v59 & 0x40) == 0)
      goto LABEL_230;
    goto LABEL_229;
  }
LABEL_238:
  self->_minimumDurationBetweenTrendingGroupsWeekend = *((_QWORD *)v4 + 32);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  if ((*((_WORD *)v4 + 390) & 0x40) != 0)
  {
LABEL_229:
    self->_diversifyOptionalTopStories = v4[764];
    *((_WORD *)&self->_has + 4) |= 0x40u;
  }
LABEL_230:
  forYouVideoGroupsConfig = self->_forYouVideoGroupsConfig;
  v62 = *((_QWORD *)v4 + 77);
  if (forYouVideoGroupsConfig)
  {
    if (v62)
      -[NTPBVideoGroupsConfig mergeFrom:](forYouVideoGroupsConfig, "mergeFrom:");
  }
  else if (v62)
  {
    -[NTPBConfig setForYouVideoGroupsConfig:](self, "setForYouVideoGroupsConfig:");
  }
  if (*((_QWORD *)v4 + 68))
    -[NTPBConfig setArticleRecirculationConfig:](self, "setArticleRecirculationConfig:");
  v63 = *(_QWORD *)(v4 + 772);
  if ((v63 & 0x1000000000) != 0)
  {
    self->_optionalTopStoriesRefreshRate = *((_QWORD *)v4 + 40);
    *(_QWORD *)&self->_has |= 0x1000000000uLL;
    v63 = *(_QWORD *)(v4 + 772);
  }
  v64 = *((_WORD *)v4 + 390);
  if ((v63 & 0x2000) != 0)
  {
    self->_expirePinnedArticlesAfter = *((_QWORD *)v4 + 17);
    *(_QWORD *)&self->_has |= 0x2000uLL;
    v63 = *(_QWORD *)(v4 + 772);
    v64 = *((_WORD *)v4 + 390);
    if ((v63 & 0x200000000000000) == 0)
    {
LABEL_248:
      if ((v63 & 0x100000000000000) == 0)
        goto LABEL_249;
      goto LABEL_265;
    }
  }
  else if ((v63 & 0x200000000000000) == 0)
  {
    goto LABEL_248;
  }
  self->_userSegmentationApiModThreshold = *((_QWORD *)v4 + 61);
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  v64 = *((_WORD *)v4 + 390);
  if ((*(_QWORD *)(v4 + 772) & 0x100000000000000) == 0)
  {
LABEL_249:
    if ((v64 & 1) == 0)
      goto LABEL_251;
    goto LABEL_250;
  }
LABEL_265:
  self->_userSegmentationApiModMax = *((_QWORD *)v4 + 60);
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  if ((*((_WORD *)v4 + 390) & 1) != 0)
  {
LABEL_250:
    self->_privateDataMigrationCleanupLevel = *((_DWORD *)v4 + 182);
    *((_WORD *)&self->_has + 4) |= 1u;
  }
LABEL_251:
  if (*((_QWORD *)v4 + 67))
    -[NTPBConfig setArticleRecirculationComponentPlacementConfig:](self, "setArticleRecirculationComponentPlacementConfig:");
  v65 = *(_QWORD *)(v4 + 772);
  if ((v65 & 0x1000000000000000) != 0)
  {
    self->_widgetEventImmediateUploadPopulationFloor = *((_QWORD *)v4 + 64);
    *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
    v65 = *(_QWORD *)(v4 + 772);
  }
  v66 = *((_WORD *)v4 + 390);
  if ((v65 & 0x800000000000000) != 0)
  {
    self->_widgetEventImmediateUploadPopulationCeiling = *((_QWORD *)v4 + 63);
    *(_QWORD *)&self->_has |= 0x800000000000000uLL;
    v65 = *(_QWORD *)(v4 + 772);
    v66 = *((_WORD *)v4 + 390);
    if ((v65 & 0x400000000000000) == 0)
    {
LABEL_257:
      if ((v65 & 0x20) == 0)
        goto LABEL_258;
      goto LABEL_269;
    }
  }
  else if ((v65 & 0x400000000000000) == 0)
  {
    goto LABEL_257;
  }
  self->_widgetEventImmediateUploadModuloForHashing = *((_QWORD *)v4 + 62);
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  v66 = *((_WORD *)v4 + 390);
  if ((*(_QWORD *)(v4 + 772) & 0x20) == 0)
  {
LABEL_258:
    if ((v66 & 0x20) == 0)
      goto LABEL_260;
    goto LABEL_259;
  }
LABEL_269:
  self->_articleRecirculationPopularFeedQueryTimeRange = *((_QWORD *)v4 + 9);
  *(_QWORD *)&self->_has |= 0x20uLL;
  if ((*((_WORD *)v4 + 390) & 0x20) != 0)
  {
LABEL_259:
    self->_disableThumbnailsForArticleRecirculation = v4[763];
    *((_WORD *)&self->_has + 4) |= 0x20u;
  }
LABEL_260:
  userSegmentationApiConfiguration = self->_userSegmentationApiConfiguration;
  v68 = *((_QWORD *)v4 + 92);
  if (userSegmentationApiConfiguration)
  {
    if (v68)
      -[NTPBUserSegmentationApiConfiguration mergeFrom:](userSegmentationApiConfiguration, "mergeFrom:");
  }
  else if (v68)
  {
    -[NTPBConfig setUserSegmentationApiConfiguration:](self, "setUserSegmentationApiConfiguration:");
  }

}

- (NSString)fallbackLanguageTag
{
  return self->_fallbackLanguageTag;
}

- (void)setFallbackLanguageTag:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackLanguageTag, a3);
}

- (NSMutableArray)languageConfigs
{
  return self->_languageConfigs;
}

- (void)setLanguageConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_languageConfigs, a3);
}

- (int64_t)shortReminderTime
{
  return self->_shortReminderTime;
}

- (int64_t)longReminderTime
{
  return self->_longReminderTime;
}

- (BOOL)newsletterSubscriptionChecked
{
  return self->_newsletterSubscriptionChecked;
}

- (double)batchedFeedTimeout
{
  return self->_batchedFeedTimeout;
}

- (double)interstitialAdLoadDelay
{
  return self->_interstitialAdLoadDelay;
}

- (double)prerollLoadingTimeout
{
  return self->_prerollLoadingTimeout;
}

- (NSMutableArray)endpointConfigs
{
  return self->_endpointConfigs;
}

- (void)setEndpointConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConfigs, a3);
}

- (NTPBPersonalizationConfig)personalizationConfig
{
  return self->_personalizationConfig;
}

- (void)setPersonalizationConfig:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationConfig, a3);
}

- (NTPBIAdConfig)iadConfig
{
  return self->_iadConfig;
}

- (void)setIadConfig:(id)a3
{
  objc_storeStrong((id *)&self->_iadConfig, a3);
}

- (NTPBPrefetchConfig)prefetchConfig
{
  return self->_prefetchConfig;
}

- (void)setPrefetchConfig:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchConfig, a3);
}

- (double)tileProminenceScoreBalanceValue
{
  return self->_tileProminenceScoreBalanceValue;
}

- (int64_t)minimumArticleUpdateInterval
{
  return self->_minimumArticleUpdateInterval;
}

- (int64_t)initialArticlesFromNewFavorite
{
  return self->_initialArticlesFromNewFavorite;
}

- (int64_t)autoScrollToTopFeedTimeout
{
  return self->_autoScrollToTopFeedTimeout;
}

- (int64_t)trendingTopicsRefreshRate
{
  return self->_trendingTopicsRefreshRate;
}

- (int64_t)appConfigRefreshRate
{
  return self->_appConfigRefreshRate;
}

- (int64_t)minimumDistanceBetweenImageOnTopTiles
{
  return self->_minimumDistanceBetweenImageOnTopTiles;
}

- (int64_t)timeBetweenWidgetInsertions
{
  return self->_timeBetweenWidgetInsertions;
}

- (int64_t)timeBetweenSameWidgetReinsertion
{
  return self->_timeBetweenSameWidgetReinsertion;
}

- (int64_t)numberOfScreenfulsScrolledToBypassWidgetTimeLimit
{
  return self->_numberOfScreenfulsScrolledToBypassWidgetTimeLimit;
}

- (int64_t)articleRapidUpdatesTimeout
{
  return self->_articleRapidUpdatesTimeout;
}

- (int64_t)subscriptionsGlobalMeteredCount
{
  return self->_subscriptionsGlobalMeteredCount;
}

- (NSString)anfEmbedConfigurationAsset
{
  return self->_anfEmbedConfigurationAsset;
}

- (void)setAnfEmbedConfigurationAsset:(id)a3
{
  objc_storeStrong((id *)&self->_anfEmbedConfigurationAsset, a3);
}

- (int64_t)subscriptionsPlacardPublisherFrequencyDays
{
  return self->_subscriptionsPlacardPublisherFrequencyDays;
}

- (int64_t)subscriptionsPlacardGlobalMaxPerDay
{
  return self->_subscriptionsPlacardGlobalMaxPerDay;
}

- (int64_t)subscriptionsGracePeriodForTokenVerificationSeconds
{
  return self->_subscriptionsGracePeriodForTokenVerificationSeconds;
}

- (int64_t)newFavoriteNotificationAlertsFrequency
{
  return self->_newFavoriteNotificationAlertsFrequency;
}

- (double)endOfArticleMinPaidHeadlineRatio
{
  return self->_endOfArticleMinPaidHeadlineRatio;
}

- (int64_t)endOfArticleMaxInaccessiblePaidArticles
{
  return self->_endOfArticleMaxInaccessiblePaidArticles;
}

- (NTPBWidgetConfig)widgetConfig
{
  return self->_widgetConfig;
}

- (void)setWidgetConfig:(id)a3
{
  objc_storeStrong((id *)&self->_widgetConfig, a3);
}

- (BOOL)universalLinksEnabled
{
  return self->_universalLinksEnabled;
}

- (int64_t)notificationArticleCacheTimeout
{
  return self->_notificationArticleCacheTimeout;
}

- (int64_t)notificationArticleWithRapidUpdatesCacheTimeout
{
  return self->_notificationArticleWithRapidUpdatesCacheTimeout;
}

- (NSString)forYouNonPersonalizedGroupsOrder
{
  return self->_forYouNonPersonalizedGroupsOrder;
}

- (void)setForYouNonPersonalizedGroupsOrder:(id)a3
{
  objc_storeStrong((id *)&self->_forYouNonPersonalizedGroupsOrder, a3);
}

- (NTPBWidgetConfig)alternativeButlerWidgetConfig
{
  return self->_alternativeButlerWidgetConfig;
}

- (void)setAlternativeButlerWidgetConfig:(id)a3
{
  objc_storeStrong((id *)&self->_alternativeButlerWidgetConfig, a3);
}

- (BOOL)alternativeButlerWidgetConfigEnabled
{
  return self->_alternativeButlerWidgetConfigEnabled;
}

- (NTPBWidgetConfig)butlerWidgetConfig
{
  return self->_butlerWidgetConfig;
}

- (void)setButlerWidgetConfig:(id)a3
{
  objc_storeStrong((id *)&self->_butlerWidgetConfig, a3);
}

- (NTPBPaidSubscriptionConfig)paidSubscriptionConfig
{
  return self->_paidSubscriptionConfig;
}

- (void)setPaidSubscriptionConfig:(id)a3
{
  objc_storeStrong((id *)&self->_paidSubscriptionConfig, a3);
}

- (NTPBWidgetConfig)widgetConfig2
{
  return self->_widgetConfig2;
}

- (void)setWidgetConfig2:(id)a3
{
  objc_storeStrong((id *)&self->_widgetConfig2, a3);
}

- (int64_t)subscriptionsPlacardPublisherFrequencySeconds
{
  return self->_subscriptionsPlacardPublisherFrequencySeconds;
}

- (int64_t)treatmentId
{
  return self->_treatmentId;
}

- (NTPBBinningConfig)binningConfig
{
  return self->_binningConfig;
}

- (void)setBinningConfig:(id)a3
{
  objc_storeStrong((id *)&self->_binningConfig, a3);
}

- (NTPBPersonalizationTreatment)personalizationTreatment
{
  return self->_personalizationTreatment;
}

- (void)setPersonalizationTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationTreatment, a3);
}

- (NSString)personalizationBundleIdMappingResourceId
{
  return self->_personalizationBundleIdMappingResourceId;
}

- (void)setPersonalizationBundleIdMappingResourceId:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationBundleIdMappingResourceId, a3);
}

- (NSString)personalizationUrlMappingResourceId
{
  return self->_personalizationUrlMappingResourceId;
}

- (void)setPersonalizationUrlMappingResourceId:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationUrlMappingResourceId, a3);
}

- (NSString)personalizationWhitelistResourceId
{
  return self->_personalizationWhitelistResourceId;
}

- (void)setPersonalizationWhitelistResourceId:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationWhitelistResourceId, a3);
}

- (unsigned)enabledPrivateDataEncryptionLevel
{
  return self->_enabledPrivateDataEncryptionLevel;
}

- (NSString)personalizationPublisherFavorabilityScoresResourceId
{
  return self->_personalizationPublisherFavorabilityScoresResourceId;
}

- (void)setPersonalizationPublisherFavorabilityScoresResourceId:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationPublisherFavorabilityScoresResourceId, a3);
}

- (NSString)personalizationWidgetSectionMappingResourceId
{
  return self->_personalizationWidgetSectionMappingResourceId;
}

- (void)setPersonalizationWidgetSectionMappingResourceId:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationWidgetSectionMappingResourceId, a3);
}

- (int64_t)corryBarMaxArticleCountForArticleList
{
  return self->_corryBarMaxArticleCountForArticleList;
}

- (int64_t)corryBarMaxArticleCountForSingleArticle
{
  return self->_corryBarMaxArticleCountForSingleArticle;
}

- (BOOL)corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers
{
  return self->_corryBarHideDiscoverMoreInterstitialForNonOnboardedUsers;
}

- (NSMutableArray)externalAnalyticsConfigs
{
  return self->_externalAnalyticsConfigs;
}

- (void)setExternalAnalyticsConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_externalAnalyticsConfigs, a3);
}

- (NSString)personalizationPortraitConfigResourceId
{
  return self->_personalizationPortraitConfigResourceId;
}

- (void)setPersonalizationPortraitConfigResourceId:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationPortraitConfigResourceId, a3);
}

- (NSString)experimentalizableFieldPostfix
{
  return self->_experimentalizableFieldPostfix;
}

- (void)setExperimentalizableFieldPostfix:(id)a3
{
  objc_storeStrong((id *)&self->_experimentalizableFieldPostfix, a3);
}

- (int64_t)minimumFollowCountToRemovePersonalizePlacardInFollowing
{
  return self->_minimumFollowCountToRemovePersonalizePlacardInFollowing;
}

- (BOOL)useSecureConnectionForAssets
{
  return self->_useSecureConnectionForAssets;
}

- (BOOL)usUkUseAuWhatsNewFeatures
{
  return self->_usUkUseAuWhatsNewFeatures;
}

- (unsigned)orderFeedEnabledLevel
{
  return self->_orderFeedEnabledLevel;
}

- (int64_t)stateRestorationAllowedTimeWindow
{
  return self->_stateRestorationAllowedTimeWindow;
}

- (int64_t)autoRefreshMinimumInterval
{
  return self->_autoRefreshMinimumInterval;
}

- (double)maximumRatioOfArticlesInForYouGroup
{
  return self->_maximumRatioOfArticlesInForYouGroup;
}

- (double)minimumTrendingUnseenRatio
{
  return self->_minimumTrendingUnseenRatio;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekday
{
  return self->_minimumDurationBetweenForYouGroupsWeekday;
}

- (int64_t)minimumDurationBetweenForYouGroupsWeekend
{
  return self->_minimumDurationBetweenForYouGroupsWeekend;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekday
{
  return self->_minimumDurationBetweenTrendingGroupsWeekday;
}

- (int64_t)minimumDurationBetweenTrendingGroupsWeekend
{
  return self->_minimumDurationBetweenTrendingGroupsWeekend;
}

- (NTPBVideoGroupsConfig)forYouVideoGroupsConfig
{
  return self->_forYouVideoGroupsConfig;
}

- (void)setForYouVideoGroupsConfig:(id)a3
{
  objc_storeStrong((id *)&self->_forYouVideoGroupsConfig, a3);
}

- (NSString)articleRecirculationConfig
{
  return self->_articleRecirculationConfig;
}

- (void)setArticleRecirculationConfig:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecirculationConfig, a3);
}

- (int64_t)optionalTopStoriesRefreshRate
{
  return self->_optionalTopStoriesRefreshRate;
}

- (int64_t)userSegmentationApiModThreshold
{
  return self->_userSegmentationApiModThreshold;
}

- (int64_t)userSegmentationApiModMax
{
  return self->_userSegmentationApiModMax;
}

- (unsigned)privateDataMigrationCleanupLevel
{
  return self->_privateDataMigrationCleanupLevel;
}

- (NSString)articleRecirculationComponentPlacementConfig
{
  return self->_articleRecirculationComponentPlacementConfig;
}

- (void)setArticleRecirculationComponentPlacementConfig:(id)a3
{
  objc_storeStrong((id *)&self->_articleRecirculationComponentPlacementConfig, a3);
}

- (NTPBUserSegmentationApiConfiguration)userSegmentationApiConfiguration
{
  return self->_userSegmentationApiConfiguration;
}

- (void)setUserSegmentationApiConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_userSegmentationApiConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetConfig2, 0);
  objc_storeStrong((id *)&self->_widgetConfig, 0);
  objc_storeStrong((id *)&self->_userSegmentationApiConfiguration, 0);
  objc_storeStrong((id *)&self->_prefetchConfig, 0);
  objc_storeStrong((id *)&self->_personalizationWidgetSectionMappingResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationWhitelistResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationUrlMappingResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);
  objc_storeStrong((id *)&self->_personalizationPublisherFavorabilityScoresResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationPortraitConfigResourceId, 0);
  objc_storeStrong((id *)&self->_personalizationConfig, 0);
  objc_storeStrong((id *)&self->_personalizationBundleIdMappingResourceId, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionConfig, 0);
  objc_storeStrong((id *)&self->_languageConfigs, 0);
  objc_storeStrong((id *)&self->_iadConfig, 0);
  objc_storeStrong((id *)&self->_forYouVideoGroupsConfig, 0);
  objc_storeStrong((id *)&self->_forYouNonPersonalizedGroupsOrder, 0);
  objc_storeStrong((id *)&self->_fallbackLanguageTag, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsConfigs, 0);
  objc_storeStrong((id *)&self->_experimentalizableFieldPostfix, 0);
  objc_storeStrong((id *)&self->_endpointConfigs, 0);
  objc_storeStrong((id *)&self->_butlerWidgetConfig, 0);
  objc_storeStrong((id *)&self->_binningConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationConfig, 0);
  objc_storeStrong((id *)&self->_articleRecirculationComponentPlacementConfig, 0);
  objc_storeStrong((id *)&self->_anfEmbedConfigurationAsset, 0);
  objc_storeStrong((id *)&self->_alternativeButlerWidgetConfig, 0);
}

@end
