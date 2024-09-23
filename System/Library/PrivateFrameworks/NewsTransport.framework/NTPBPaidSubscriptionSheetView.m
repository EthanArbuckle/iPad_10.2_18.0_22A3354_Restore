@implementation NTPBPaidSubscriptionSheetView

- (int)userAction
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserAction
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)paidSubscriptionSheetViewPresentationReason
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_paidSubscriptionSheetViewPresentationReason;
  else
    return 0;
}

- (void)setPaidSubscriptionSheetViewPresentationReason:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_paidSubscriptionSheetViewPresentationReason = a3;
}

- (void)setHasPaidSubscriptionSheetViewPresentationReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPaidSubscriptionSheetViewPresentationReason
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)paidSubscriptionConversionPointExposureLocation
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_paidSubscriptionConversionPointExposureLocation;
  else
    return 0;
}

- (void)setPaidSubscriptionConversionPointExposureLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_paidSubscriptionConversionPointExposureLocation = a3;
}

- (void)setHasPaidSubscriptionConversionPointExposureLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointExposureLocation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)paidSubscriptionConversionPointExposureLocationAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD52F68[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPaidSubscriptionConversionPointExposureLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PAID_SUBSCRIPTION_CONVERSION_POINT_EXPOSURE_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_EXPOSURE_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_EXPOSURE_LOCATION")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasSectionId
{
  return self->_sectionId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (int)parentFeedType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD52F80[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParentFeedType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_FEED_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOR_YOU_FEED_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITES_FEED_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANNEL_FEED_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECTION_FEED_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOPIC_FEED_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_FEED_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_PUB_ARTICLES_FEED_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READING_HISTORY_FEED_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READING_LIST_FEED_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDED_FEED_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_FEED_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIST_FEED_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEBUG_FEED_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_FEED_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_FEED_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYMBOL_FEED_TYPE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAGAZINE_FEED_TYPE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_FEED_TYPE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MY_MAGAZINES_FEED_TYPE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ARTICLE_FEED_TYPE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_FEED_TYPE")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setArrivedFromAd:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_arrivedFromAd = a3;
}

- (void)setHasArrivedFromAd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasArrivedFromAd
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasIadQtoken
{
  return self->_iadQtoken != 0;
}

- (int)paidSubscriptionConversionPointType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_paidSubscriptionConversionPointType;
  else
    return 0;
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD53030[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPaidSubscriptionConversionPointType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_IN_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIBER_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_FEED_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_ARTICLE_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_EXPIRATION_RENEWAL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_ARTICLE_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERSTITIAL_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANDING_PAGE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAGAZINE_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_TOC_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_OFFERS_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSubscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId != 0;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (BOOL)hasCampaignType
{
  return self->_campaignType != 0;
}

- (BOOL)hasCreativeId
{
  return self->_creativeId != 0;
}

- (int)groupType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroupType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD530E0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGroupType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOPIC_ARTICLES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORS_PICKS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FROM_TOPIC_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANNEL_ARTICLES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAILY_BRIEFINGS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GREAT_STORIES_YOU_MISSED_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAVED_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FOR_YOU_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAID_SUBSCRIPTION_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST_AND_GREATEST_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTED_TOPICS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_STORIES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_VIDEOS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_VIDEOS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYMBOL_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECIRCULATION_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FROM_PUB_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MY_MAGAZINES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_ISSUE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_ARTICLE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_ISSUE_ARTICLE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDED_ISSUES_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEW_ISSUE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_LIST_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ORDERED_ARTICLE_LIST_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BEST_OF_BUNDLE_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWSPAPER_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_NEWS_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_UP_NEXT_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_FOR_YOU_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_RECENTLY_PLAYED_GROUP_TYPE")) & 1) != 0)
  {
    v4 = 38;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_DAILY_BRIEFING_GROUP_TYPE")))
  {
    v4 = 39;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)NTPBPaidSubscriptionSheetView;
  -[NTPBPaidSubscriptionSheetView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPaidSubscriptionSheetView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t paidSubscriptionConversionPointExposureLocation;
  __CFString *v8;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  char v13;
  void *v14;
  NSString *iadQtoken;
  uint64_t paidSubscriptionConversionPointType;
  __CFString *v17;
  uint64_t parentFeedType;
  __CFString *v19;
  NSData *subscriptionPurchaseSessionId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  uint64_t groupType;
  __CFString *v25;
  void *v26;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_action"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_11;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_paidSubscriptionSheetViewPresentationReason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("paid_subscription_sheet_view_presentation_reason"));

  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_7:
  paidSubscriptionConversionPointExposureLocation = self->_paidSubscriptionConversionPointExposureLocation;
  if (paidSubscriptionConversionPointExposureLocation >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointExposureLocation);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_24CD52F68[paidSubscriptionConversionPointExposureLocation];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("paid_subscription_conversion_point_exposure_location"));

LABEL_11:
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  sectionId = self->_sectionId;
  if (sectionId)
    objc_msgSend(v3, "setObject:forKey:", sectionId, CFSTR("section_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  v13 = (char)self->_has;
  if ((v13 & 0x10) != 0)
  {
    parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_24CD52F80[parentFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("parent_feed_type"));

    v13 = (char)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_21:
      if ((v13 & 0x40) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_subscriptionOnlyArticlePreview);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("subscription_only_article_preview"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_arrivedFromAd);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("arrived_from_ad"));

  }
LABEL_23:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken)
    objc_msgSend(v3, "setObject:forKey:", iadQtoken, CFSTR("iad_qtoken"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_24CD53030[paidSubscriptionConversionPointType];
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("paid_subscription_conversion_point_type"));

  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if (subscriptionPurchaseSessionId)
    objc_msgSend(v3, "setObject:forKey:", subscriptionPurchaseSessionId, CFSTR("subscription_purchase_session_id"));
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_24CD530E0[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("group_type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaidSubscriptionSheetViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if (self->_sectionId)
    PBDataWriterWriteStringField();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (char)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_15:
      if ((v5 & 0x40) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_16:
    PBDataWriterWriteBOOLField();
LABEL_17:
  if (self->_iadQtoken)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_subscriptionPurchaseSessionId)
    PBDataWriterWriteDataField();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_userAction;
    *(_BYTE *)(v5 + 112) |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_paidSubscriptionSheetViewPresentationReason;
  *(_BYTE *)(v5 + 112) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 64) = self->_paidSubscriptionConversionPointExposureLocation;
    *(_BYTE *)(v5 + 112) |= 2u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v8;

  v10 = -[NSString copyWithZone:](self->_sectionId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v10;

  v12 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v12;

  v14 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v14;

  v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 76) = self->_parentFeedType;
    *(_BYTE *)(v6 + 112) |= 0x10u;
    v16 = (char)self->_has;
    if ((v16 & 0x80) == 0)
    {
LABEL_7:
      if ((v16 & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v6 + 109) = self->_subscriptionOnlyArticlePreview;
  *(_BYTE *)(v6 + 112) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 108) = self->_arrivedFromAd;
    *(_BYTE *)(v6 + 112) |= 0x40u;
  }
LABEL_9:
  v17 = -[NSString copyWithZone:](self->_iadQtoken, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v17;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_paidSubscriptionConversionPointType;
    *(_BYTE *)(v6 + 112) |= 4u;
  }
  v19 = -[NSData copyWithZone:](self->_subscriptionPurchaseSessionId, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v19;

  v21 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v21;

  v23 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v23;

  v25 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v25;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_groupType;
    *(_BYTE *)(v6 + 112) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  char has;
  NSString *iadQtoken;
  NSData *subscriptionPurchaseSessionId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_67;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 0x20) == 0 || self->_userAction != *((_DWORD *)v4 + 26))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 112) & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 8) == 0 || self->_paidSubscriptionSheetViewPresentationReason != *((_DWORD *)v4 + 18))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 112) & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 2) == 0
      || self->_paidSubscriptionConversionPointExposureLocation != *((_DWORD *)v4 + 16))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 2) != 0)
  {
    goto LABEL_67;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](sourceChannelId, "isEqual:"))
  {
    goto LABEL_67;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:"))
      goto LABEL_67;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_67;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_67;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 0x10) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 19))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 112) & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 0x80) == 0)
      goto LABEL_67;
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_67;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 0x80) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 0x40) == 0)
      goto LABEL_67;
    if (self->_arrivedFromAd)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_67;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_67;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 0x40) != 0)
  {
    goto LABEL_67;
  }
  iadQtoken = self->_iadQtoken;
  if (!((unint64_t)iadQtoken | *((_QWORD *)v4 + 7)))
    goto LABEL_49;
  if (!-[NSString isEqual:](iadQtoken, "isEqual:"))
  {
LABEL_67:
    v15 = 0;
    goto LABEL_68;
  }
  has = (char)self->_has;
LABEL_49:
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 4) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 17))
      goto LABEL_67;
  }
  else if ((*((_BYTE *)v4 + 112) & 4) != 0)
  {
    goto LABEL_67;
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((_QWORD *)v4 + 12)
    && !-[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:"))
  {
    goto LABEL_67;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_67;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_67;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_67;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 112) & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 12))
      goto LABEL_67;
    v15 = 1;
  }
  else
  {
    v15 = (*((_BYTE *)v4 + 112) & 1) == 0;
  }
LABEL_68:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v3 = 2654435761 * self->_userAction;
  else
    v3 = 0;
  v26 = v3;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v4 = 2654435761 * self->_paidSubscriptionSheetViewPresentationReason;
  else
    v4 = 0;
  v25 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v20 = 2654435761 * self->_paidSubscriptionConversionPointExposureLocation;
  else
    v20 = 0;
  v5 = -[NSString hash](self->_sourceChannelId, "hash");
  v6 = -[NSString hash](self->_sectionId, "hash");
  v24 = -[NSString hash](self->_articleId, "hash");
  v7 = -[NSData hash](self->_articleViewingSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v8 = 2654435761 * self->_parentFeedType;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_12;
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
LABEL_12:
      v9 = 2654435761 * self->_subscriptionOnlyArticlePreview;
      goto LABEL_15;
    }
  }
  v9 = 0;
LABEL_15:
  v22 = v8;
  v23 = v7;
  v21 = v9;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v10 = -[NSString hash](self->_iadQtoken, "hash", 2654435761 * self->_arrivedFromAd);
  else
    v10 = -[NSString hash](self->_iadQtoken, "hash", 0);
  v11 = v10;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v12 = 2654435761 * self->_paidSubscriptionConversionPointType;
  else
    v12 = 0;
  v13 = -[NSData hash](self->_subscriptionPurchaseSessionId, "hash");
  v14 = -[NSString hash](self->_campaignId, "hash");
  v15 = -[NSString hash](self->_campaignType, "hash");
  v16 = -[NSString hash](self->_creativeId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v17 = 2654435761 * self->_groupType;
  else
    v17 = 0;
  return v25 ^ v26 ^ v20 ^ v5 ^ v6 ^ v24 ^ v23 ^ v22 ^ v21 ^ v19 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 112);
  if ((v5 & 0x20) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 26);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 112);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_paidSubscriptionSheetViewPresentationReason = *((_DWORD *)v4 + 18);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 112) & 2) != 0)
  {
LABEL_4:
    self->_paidSubscriptionConversionPointExposureLocation = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v7 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[NTPBPaidSubscriptionSheetView setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[NTPBPaidSubscriptionSheetView setSectionId:](self, "setSectionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBPaidSubscriptionSheetView setArticleId:](self, "setArticleId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBPaidSubscriptionSheetView setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 112);
  if ((v6 & 0x10) != 0)
  {
    self->_parentFeedType = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 112);
    if ((v6 & 0x80) == 0)
    {
LABEL_15:
      if ((v6 & 0x40) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 112) & 0x80) == 0)
  {
    goto LABEL_15;
  }
  self->_subscriptionOnlyArticlePreview = *((_BYTE *)v4 + 109);
  *(_BYTE *)&self->_has |= 0x80u;
  if ((*((_BYTE *)v4 + 112) & 0x40) != 0)
  {
LABEL_16:
    self->_arrivedFromAd = *((_BYTE *)v4 + 108);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_17:
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBPaidSubscriptionSheetView setIadQtoken:](self, "setIadQtoken:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 112) & 4) != 0)
  {
    self->_paidSubscriptionConversionPointType = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[NTPBPaidSubscriptionSheetView setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBPaidSubscriptionSheetView setCampaignId:](self, "setCampaignId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBPaidSubscriptionSheetView setCampaignType:](self, "setCampaignType:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBPaidSubscriptionSheetView setCreativeId:](self, "setCreativeId:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 112) & 1) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)sectionId
{
  return self->_sectionId;
}

- (void)setSectionId:(id)a3
{
  objc_storeStrong((id *)&self->_sectionId, a3);
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (BOOL)subscriptionOnlyArticlePreview
{
  return self->_subscriptionOnlyArticlePreview;
}

- (BOOL)arrivedFromAd
{
  return self->_arrivedFromAd;
}

- (NSString)iadQtoken
{
  return self->_iadQtoken;
}

- (void)setIadQtoken:(id)a3
{
  objc_storeStrong((id *)&self->_iadQtoken, a3);
}

- (NSData)subscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId;
}

- (void)setSubscriptionPurchaseSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionPurchaseSessionId, a3);
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_campaignId, a3);
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
  objc_storeStrong((id *)&self->_campaignType, a3);
}

- (NSString)creativeId
{
  return self->_creativeId;
}

- (void)setCreativeId:(id)a3
{
  objc_storeStrong((id *)&self->_creativeId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionPurchaseSessionId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
