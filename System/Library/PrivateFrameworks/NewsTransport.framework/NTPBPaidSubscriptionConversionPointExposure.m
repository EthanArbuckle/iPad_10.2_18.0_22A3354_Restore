@implementation NTPBPaidSubscriptionConversionPointExposure

- (int)paidSubscriptionConversionPointType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_paidSubscriptionConversionPointType;
  else
    return 0;
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD51C78[a3];
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

- (int)userAction
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasUserAction
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)paidSubscriptionConversionPointExposureLocation
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_paidSubscriptionConversionPointExposureLocation;
  else
    return 0;
}

- (void)setPaidSubscriptionConversionPointExposureLocation:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_paidSubscriptionConversionPointExposureLocation = a3;
}

- (void)setHasPaidSubscriptionConversionPointExposureLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointExposureLocation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)paidSubscriptionConversionPointExposureLocationAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD51D28[a3];
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

- (int)paidSubscriptionConversionPointExposurePresentationReason
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_paidSubscriptionConversionPointExposurePresentationReason;
  else
    return 0;
}

- (void)setPaidSubscriptionConversionPointExposurePresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_paidSubscriptionConversionPointExposurePresentationReason = a3;
}

- (void)setHasPaidSubscriptionConversionPointExposurePresentationReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointExposurePresentationReason
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD51D40[a3];
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
  *(_WORD *)&self->_has |= 0x100u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setArrivedFromAd:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_arrivedFromAd = a3;
}

- (void)setHasArrivedFromAd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasArrivedFromAd
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasIadQtoken
{
  return self->_iadQtoken != 0;
}

- (BOOL)hasSubscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasGroupType
{
  return *(_WORD *)&self->_has & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD51DF0[a3];
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

- (BOOL)hasPurchaseId
{
  return self->_purchaseId != 0;
}

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (int)purchaseType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_purchaseType;
  else
    return 0;
}

- (void)setPurchaseType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_purchaseType = a3;
}

- (void)setHasPurchaseType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPurchaseType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)purchaseTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD51F30[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPurchaseType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PURCHASE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AL_A_CARTE_PURCHASE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUNDLE_PURCHASE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("S_BUNDLE_PURCHASE_TYPE")))
  {
    v4 = 3;
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
  v8.super_class = (Class)NTPBPaidSubscriptionConversionPointExposure;
  -[NTPBPaidSubscriptionConversionPointExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPaidSubscriptionConversionPointExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  uint64_t paidSubscriptionConversionPointType;
  __CFString *v6;
  void *v7;
  NSString *sourceChannelId;
  __int16 v9;
  uint64_t paidSubscriptionConversionPointExposureLocation;
  __CFString *v11;
  void *v12;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  __int16 v16;
  void *v17;
  NSString *iadQtoken;
  NSData *subscriptionPurchaseSessionId;
  NSData *feedViewExposureId;
  uint64_t groupType;
  __CFString *v22;
  uint64_t parentFeedType;
  __CFString *v24;
  NSString *purchaseId;
  NSString *groupFeedId;
  NSString *parentFeedId;
  NTPBIssueData *issueData;
  void *v29;
  uint64_t purchaseType;
  __CFString *v31;
  void *v32;
  id v33;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_24CD51C78[paidSubscriptionConversionPointType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("paid_subscription_conversion_point_type"));

    has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("user_action"));

  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  v9 = (__int16)self->_has;
  if ((v9 & 2) != 0)
  {
    paidSubscriptionConversionPointExposureLocation = self->_paidSubscriptionConversionPointExposureLocation;
    if (paidSubscriptionConversionPointExposureLocation >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointExposureLocation);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24CD51D28[paidSubscriptionConversionPointExposureLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("paid_subscription_conversion_point_exposure_location"));

    v9 = (__int16)self->_has;
  }
  if ((v9 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_paidSubscriptionConversionPointExposurePresentationReason);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("paid_subscription_conversion_point_exposure_presentation_reason"));

  }
  sectionId = self->_sectionId;
  if (sectionId)
    objc_msgSend(v3, "setObject:forKey:", sectionId, CFSTR("section_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  v16 = (__int16)self->_has;
  if ((v16 & 0x10) != 0)
  {
    parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_24CD51D40[parentFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("parent_feed_type"));

    v16 = (__int16)self->_has;
    if ((v16 & 0x100) == 0)
    {
LABEL_25:
      if ((v16 & 0x80) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_subscriptionOnlyArticlePreview);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("subscription_only_article_preview"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_arrivedFromAd);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("arrived_from_ad"));

  }
LABEL_27:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken)
    objc_msgSend(v3, "setObject:forKey:", iadQtoken, CFSTR("iad_qtoken"));
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if (subscriptionPurchaseSessionId)
    objc_msgSend(v3, "setObject:forKey:", subscriptionPurchaseSessionId, CFSTR("subscription_purchase_session_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_24CD51DF0[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("group_type"));

  }
  purchaseId = self->_purchaseId;
  if (purchaseId)
    objc_msgSend(v3, "setObject:forKey:", purchaseId, CFSTR("purchase_id"));
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v3, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  parentFeedId = self->_parentFeedId;
  if (parentFeedId)
    objc_msgSend(v3, "setObject:forKey:", parentFeedId, CFSTR("parent_feed_id"));
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("issue_data"));

  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    purchaseType = self->_purchaseType;
    if (purchaseType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_purchaseType);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_24CD51F30[purchaseType];
    }
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("purchase_type"));

  }
  v33 = v3;

  return v33;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaidSubscriptionConversionPointExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (__int16)self->_has;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_sectionId)
    PBDataWriterWriteStringField();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (__int16)self->_has;
    if ((v6 & 0x100) == 0)
    {
LABEL_19:
      if ((v6 & 0x80) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_20:
    PBDataWriterWriteBOOLField();
LABEL_21:
  if (self->_iadQtoken)
    PBDataWriterWriteStringField();
  if (self->_subscriptionPurchaseSessionId)
    PBDataWriterWriteDataField();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_purchaseId)
    PBDataWriterWriteStringField();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  if (self->_parentFeedId)
    PBDataWriterWriteStringField();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_paidSubscriptionConversionPointType;
    *(_WORD *)(v5 + 144) |= 8u;
    has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_userAction;
    *(_WORD *)(v5 + 144) |= 0x40u;
  }
  v8 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 2) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_paidSubscriptionConversionPointExposureLocation;
    *(_WORD *)(v6 + 144) |= 2u;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 4) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_paidSubscriptionConversionPointExposurePresentationReason;
    *(_WORD *)(v6 + 144) |= 4u;
  }
  v11 = -[NSString copyWithZone:](self->_sectionId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v11;

  v13 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v13;

  v15 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_parentFeedType;
    *(_WORD *)(v6 + 144) |= 0x10u;
    v17 = (__int16)self->_has;
    if ((v17 & 0x100) == 0)
    {
LABEL_11:
      if ((v17 & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_11;
  }
  *(_BYTE *)(v6 + 141) = self->_subscriptionOnlyArticlePreview;
  *(_WORD *)(v6 + 144) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_12:
    *(_BYTE *)(v6 + 140) = self->_arrivedFromAd;
    *(_WORD *)(v6 + 144) |= 0x80u;
  }
LABEL_13:
  v18 = -[NSString copyWithZone:](self->_iadQtoken, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v18;

  v20 = -[NSData copyWithZone:](self->_subscriptionPurchaseSessionId, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v20;

  v22 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v22;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_groupType;
    *(_WORD *)(v6 + 144) |= 1u;
  }
  v24 = -[NSString copyWithZone:](self->_purchaseId, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v24;

  v26 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v26;

  v28 = -[NSString copyWithZone:](self->_parentFeedId, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v28;

  v30 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v30;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_purchaseType;
    *(_WORD *)(v6 + 144) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *sourceChannelId;
  __int16 v8;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  __int16 v12;
  __int16 v13;
  NSString *iadQtoken;
  NSData *subscriptionPurchaseSessionId;
  NSData *feedViewExposureId;
  __int16 v17;
  NSString *purchaseId;
  NSString *groupFeedId;
  NSString *parentFeedId;
  NTPBIssueData *issueData;
  __int16 v22;
  BOOL v23;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_76;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 72);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 18))
      goto LABEL_76;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_userAction != *((_DWORD *)v4 + 34))
      goto LABEL_76;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_76;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_76;
    has = (__int16)self->_has;
  }
  v8 = *((_WORD *)v4 + 72);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_paidSubscriptionConversionPointExposureLocation != *((_DWORD *)v4 + 16))
      goto LABEL_76;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_paidSubscriptionConversionPointExposurePresentationReason != *((_DWORD *)v4 + 17))
      goto LABEL_76;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_76;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((_QWORD *)v4 + 14) && !-[NSString isEqual:](sectionId, "isEqual:"))
    goto LABEL_76;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_76;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_76;
  }
  v12 = (__int16)self->_has;
  v13 = *((_WORD *)v4 + 72);
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 22))
      goto LABEL_76;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x100) == 0)
      goto LABEL_76;
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((_BYTE *)v4 + 141))
        goto LABEL_76;
    }
    else if (*((_BYTE *)v4 + 141))
    {
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x100) != 0)
  {
    goto LABEL_76;
  }
  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) != 0)
    {
      if (self->_arrivedFromAd)
      {
        if (!*((_BYTE *)v4 + 140))
          goto LABEL_76;
        goto LABEL_52;
      }
      if (!*((_BYTE *)v4 + 140))
        goto LABEL_52;
    }
LABEL_76:
    v23 = 0;
    goto LABEL_77;
  }
  if ((v13 & 0x80) != 0)
    goto LABEL_76;
LABEL_52:
  iadQtoken = self->_iadQtoken;
  if ((unint64_t)iadQtoken | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](iadQtoken, "isEqual:"))
    goto LABEL_76;
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:"))
      goto LABEL_76;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_76;
  }
  v17 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v17 & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 10))
      goto LABEL_76;
  }
  else if ((v17 & 1) != 0)
  {
    goto LABEL_76;
  }
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((_QWORD *)v4 + 12)
    && !-[NSString isEqual:](purchaseId, "isEqual:"))
  {
    goto LABEL_76;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_76;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](parentFeedId, "isEqual:"))
      goto LABEL_76;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 7))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_76;
  }
  v22 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v22 & 0x20) == 0 || self->_purchaseType != *((_DWORD *)v4 + 26))
      goto LABEL_76;
    v23 = 1;
  }
  else
  {
    v23 = (v22 & 0x20) == 0;
  }
LABEL_77:

  return v23;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  __int16 v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v26 = 2654435761 * self->_paidSubscriptionConversionPointType;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  else
  {
    v26 = 0;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v25 = 2654435761 * self->_userAction;
      goto LABEL_6;
    }
  }
  v25 = 0;
LABEL_6:
  v24 = -[NSString hash](self->_sourceChannelId, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 2) != 0)
  {
    v23 = 2654435761 * self->_paidSubscriptionConversionPointExposureLocation;
    if ((v4 & 4) != 0)
      goto LABEL_8;
  }
  else
  {
    v23 = 0;
    if ((v4 & 4) != 0)
    {
LABEL_8:
      v22 = 2654435761 * self->_paidSubscriptionConversionPointExposurePresentationReason;
      goto LABEL_11;
    }
  }
  v22 = 0;
LABEL_11:
  v21 = -[NSString hash](self->_sectionId, "hash");
  v20 = -[NSString hash](self->_articleId, "hash");
  v19 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
    v18 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_13;
LABEL_16:
    v17 = 0;
    if ((v5 & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_17;
  }
  v18 = 2654435761 * self->_parentFeedType;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_16;
LABEL_13:
  v17 = 2654435761 * self->_subscriptionOnlyArticlePreview;
  if ((v5 & 0x80) != 0)
  {
LABEL_14:
    v16 = 2654435761 * self->_arrivedFromAd;
    goto LABEL_18;
  }
LABEL_17:
  v16 = 0;
LABEL_18:
  v6 = -[NSString hash](self->_iadQtoken, "hash");
  v7 = -[NSData hash](self->_subscriptionPurchaseSessionId, "hash");
  v8 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_groupType;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_purchaseId, "hash");
  v11 = -[NSString hash](self->_groupFeedId, "hash");
  v12 = -[NSString hash](self->_parentFeedId, "hash");
  v13 = -[NTPBIssueData hash](self->_issueData, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v14 = 2654435761 * self->_purchaseType;
  else
    v14 = 0;
  return v25 ^ v26 ^ v23 ^ v22 ^ v24 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  NTPBIssueData *issueData;
  uint64_t v10;
  int *v11;

  v4 = (int *)a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 72);
  if ((v6 & 8) != 0)
  {
    self->_paidSubscriptionConversionPointType = v4[18];
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 72);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_userAction = v4[34];
    *(_WORD *)&self->_has |= 0x40u;
  }
  v11 = v4;
  if (*((_QWORD *)v4 + 15))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setSourceChannelId:](self, "setSourceChannelId:");
    v5 = v11;
  }
  v7 = *((_WORD *)v5 + 72);
  if ((v7 & 2) != 0)
  {
    self->_paidSubscriptionConversionPointExposureLocation = v5[16];
    *(_WORD *)&self->_has |= 2u;
    v7 = *((_WORD *)v5 + 72);
  }
  if ((v7 & 4) != 0)
  {
    self->_paidSubscriptionConversionPointExposurePresentationReason = v5[17];
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 14))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setSectionId:](self, "setSectionId:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 1))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setArticleId:](self, "setArticleId:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 2))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v5 = v11;
  }
  v8 = *((_WORD *)v5 + 72);
  if ((v8 & 0x10) != 0)
  {
    self->_parentFeedType = v5[22];
    *(_WORD *)&self->_has |= 0x10u;
    v8 = *((_WORD *)v5 + 72);
    if ((v8 & 0x100) == 0)
    {
LABEL_19:
      if ((v8 & 0x80) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((v5[36] & 0x100) == 0)
  {
    goto LABEL_19;
  }
  self->_subscriptionOnlyArticlePreview = *((_BYTE *)v5 + 141);
  *(_WORD *)&self->_has |= 0x100u;
  if ((v5[36] & 0x80) != 0)
  {
LABEL_20:
    self->_arrivedFromAd = *((_BYTE *)v5 + 140);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_21:
  if (*((_QWORD *)v5 + 6))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setIadQtoken:](self, "setIadQtoken:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 16))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 3))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v5 = v11;
  }
  if ((v5[36] & 1) != 0)
  {
    self->_groupType = v5[10];
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 12))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setPurchaseId:](self, "setPurchaseId:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setGroupFeedId:](self, "setGroupFeedId:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 10))
  {
    -[NTPBPaidSubscriptionConversionPointExposure setParentFeedId:](self, "setParentFeedId:");
    v5 = v11;
  }
  issueData = self->_issueData;
  v10 = *((_QWORD *)v5 + 7);
  if (issueData)
  {
    if (!v10)
      goto LABEL_44;
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_44;
    -[NTPBPaidSubscriptionConversionPointExposure setIssueData:](self, "setIssueData:");
  }
  v5 = v11;
LABEL_44:
  if ((v5[36] & 0x20) != 0)
  {
    self->_purchaseType = v5[26];
    *(_WORD *)&self->_has |= 0x20u;
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

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (NSString)purchaseId
{
  return self->_purchaseId;
}

- (void)setPurchaseId:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseId, a3);
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_groupFeedId, a3);
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_parentFeedId, a3);
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionPurchaseSessionId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_purchaseId, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
