@implementation NTPBPaidSubscriptionResult

- (int)resultType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void)setResultType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasResultType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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

- (int)paidSubscriptionConversionPointType
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_paidSubscriptionConversionPointType;
  else
    return 0;
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD51688[a3];
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

- (int)parentFeedType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD51738[a3];
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
  *(_WORD *)&self->_has |= 0x200u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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

- (BOOL)hasSubscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId != 0;
}

- (void)setSawSubscriptionSheet:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sawSubscriptionSheet = a3;
}

- (void)setHasSawSubscriptionSheet:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSawSubscriptionSheet
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD517E8[a3];
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

- (int)storekitError
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_storekitError;
  else
    return 0;
}

- (void)setStorekitError:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_storekitError = a3;
}

- (void)setHasStorekitError:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasStorekitError
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)storekitErrorAsString:(int)a3
{
  if (a3 < 0xF)
    return off_24CD51928[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsStorekitError:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_INVALID_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_CANCELLED_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_INVALID_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENT_NOT_ALLOWED_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STOREPRODUCT_NOT_AVAILABLE_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOUD_SERVICE_PERMISSION_DENIED_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOUD_SERVICE_NETWORK_CONNECTION_FAILED_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOUD_SERVICE_REVOKED_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIVACY_ACKNOWLEDGEMENT_REQUIRED_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNAUTHORIZED_REQUEST_DATA_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_OFFER_IDENTIFIER_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_OFFER_PRICE_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_SIGNATURE_STOREKIT_ERROR")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MISSING_OFFER_PARAMS_STOREKIT_ERROR")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAmsPurchaseErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_amsPurchaseErrorCode = a3;
}

- (void)setHasAmsPurchaseErrorCode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAmsPurchaseErrorCode
{
  return *(_WORD *)&self->_has & 1;
}

- (void)clearTopicIds
{
  -[NSMutableArray removeAllObjects](self->_topicIds, "removeAllObjects");
}

- (void)addTopicIds:(id)a3
{
  id v4;
  NSMutableArray *topicIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicIds = self->_topicIds;
  v8 = v4;
  if (!topicIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicIds;
    self->_topicIds = v6;

    v4 = v8;
    topicIds = self->_topicIds;
  }
  -[NSMutableArray addObject:](topicIds, "addObject:", v4);

}

- (unint64_t)topicIdsCount
{
  return -[NSMutableArray count](self->_topicIds, "count");
}

- (id)topicIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicIds, "objectAtIndex:", a3);
}

+ (Class)topicIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSurfacedByTopicId
{
  return self->_surfacedByTopicId != 0;
}

- (BOOL)hasSurfacedByChannelId
{
  return self->_surfacedByChannelId != 0;
}

- (int)purchaseType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_purchaseType;
  else
    return 0;
}

- (void)setPurchaseType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_purchaseType = a3;
}

- (void)setHasPurchaseType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPurchaseType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)purchaseTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD519A0[a3];
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
  v8.super_class = (Class)NTPBPaidSubscriptionResult;
  -[NTPBPaidSubscriptionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPaidSubscriptionResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  __int16 has;
  void *v10;
  NSString *iadQtoken;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NSData *subscriptionPurchaseSessionId;
  __int16 v16;
  void *v17;
  uint64_t groupType;
  __CFString *v19;
  uint64_t paidSubscriptionConversionPointType;
  __CFString *v21;
  NSString *purchaseId;
  NSString *groupFeedId;
  NSString *parentFeedId;
  NTPBIssueData *issueData;
  void *v26;
  __int16 v27;
  uint64_t storekitError;
  __CFString *v29;
  uint64_t parentFeedType;
  __CFString *v31;
  void *v32;
  NSMutableArray *topicIds;
  NSString *surfacedByTopicId;
  NSString *surfacedByChannelId;
  uint64_t purchaseType;
  __CFString *v37;
  void *v38;
  id v39;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("result_type"));

  }
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
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_24CD51688[paidSubscriptionConversionPointType];
    }
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("paid_subscription_conversion_point_type"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 0x200) == 0)
        goto LABEL_14;
      goto LABEL_65;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_13;
  }
  parentFeedType = self->_parentFeedType;
  if (parentFeedType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_24CD51738[parentFeedType];
  }
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("parent_feed_type"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_subscriptionOnlyArticlePreview);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("subscription_only_article_preview"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_arrivedFromAd);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("arrived_from_ad"));

  }
LABEL_16:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken)
    objc_msgSend(v3, "setObject:forKey:", iadQtoken, CFSTR("iad_qtoken"));
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if (subscriptionPurchaseSessionId)
    objc_msgSend(v3, "setObject:forKey:", subscriptionPurchaseSessionId, CFSTR("subscription_purchase_session_id"));
  v16 = (__int16)self->_has;
  if ((v16 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sawSubscriptionSheet);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("saw_subscription_sheet"));

    v16 = (__int16)self->_has;
  }
  if ((v16 & 2) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_24CD517E8[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("group_type"));

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
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("issue_data"));

  }
  v27 = (__int16)self->_has;
  if ((v27 & 0x40) != 0)
  {
    storekitError = self->_storekitError;
    if (storekitError >= 0xF)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_storekitError);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_24CD51928[storekitError];
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("storekit_error"));

    v27 = (__int16)self->_has;
  }
  if ((v27 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_amsPurchaseErrorCode);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("ams_purchase_error_code"));

  }
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v3, "setObject:forKey:", topicIds, CFSTR("topic_ids"));
  surfacedByTopicId = self->_surfacedByTopicId;
  if (surfacedByTopicId)
    objc_msgSend(v3, "setObject:forKey:", surfacedByTopicId, CFSTR("surfaced_by_topic_id"));
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId)
    objc_msgSend(v3, "setObject:forKey:", surfacedByChannelId, CFSTR("surfaced_by_channel_id"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    purchaseType = self->_purchaseType;
    if (purchaseType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_purchaseType);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = off_24CD519A0[purchaseType];
    }
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("purchase_type"));

  }
  v39 = v3;

  return v39;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaidSubscriptionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  __int16 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if (self->_sectionId)
    PBDataWriterWriteStringField();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 0x200) == 0)
        goto LABEL_14;
      goto LABEL_58;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_15:
    PBDataWriterWriteBOOLField();
LABEL_16:
  if (self->_iadQtoken)
    PBDataWriterWriteStringField();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if (self->_subscriptionPurchaseSessionId)
    PBDataWriterWriteDataField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (__int16)self->_has;
  }
  if ((v6 & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_purchaseId)
    PBDataWriterWriteStringField();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  if (self->_parentFeedId)
    PBDataWriterWriteStringField();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = (__int16)self->_has;
  }
  if ((v7 & 1) != 0)
    PBDataWriterWriteInt32Field();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_topicIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int16 has;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  __int16 v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_resultType;
    *(_WORD *)(v5 + 188) |= 0x20u;
  }
  v7 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v7;

  v9 = -[NSString copyWithZone:](self->_sectionId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v9;

  v11 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v11;

  v13 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v13;

  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_paidSubscriptionConversionPointType;
    *(_WORD *)(v6 + 188) |= 4u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_28;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 104) = self->_parentFeedType;
  *(_WORD *)(v6 + 188) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_28:
  *(_BYTE *)(v6 + 186) = self->_subscriptionOnlyArticlePreview;
  *(_WORD *)(v6 + 188) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_7:
    *(_BYTE *)(v6 + 184) = self->_arrivedFromAd;
    *(_WORD *)(v6 + 188) |= 0x80u;
  }
LABEL_8:
  v16 = -[NSString copyWithZone:](self->_iadQtoken, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v16;

  v18 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v18;

  v20 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v20;

  v22 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v22;

  v24 = -[NSData copyWithZone:](self->_subscriptionPurchaseSessionId, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v24;

  v26 = (__int16)self->_has;
  if ((v26 & 0x100) != 0)
  {
    *(_BYTE *)(v6 + 185) = self->_sawSubscriptionSheet;
    *(_WORD *)(v6 + 188) |= 0x100u;
    v26 = (__int16)self->_has;
  }
  if ((v26 & 2) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_groupType;
    *(_WORD *)(v6 + 188) |= 2u;
  }
  v27 = -[NSString copyWithZone:](self->_purchaseId, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v27;

  v29 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v29;

  v31 = -[NSString copyWithZone:](self->_parentFeedId, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v31;

  v33 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v34 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v33;

  v35 = (__int16)self->_has;
  if ((v35 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_storekitError;
    *(_WORD *)(v6 + 188) |= 0x40u;
    v35 = (__int16)self->_has;
  }
  if ((v35 & 1) != 0)
  {
    *(_DWORD *)(v6 + 8) = self->_amsPurchaseErrorCode;
    *(_WORD *)(v6 + 188) |= 1u;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v36 = self->_topicIds;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v48 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v47);
        objc_msgSend((id)v6, "addTopicIds:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v38);
  }

  v42 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v42;

  v44 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v45 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v44;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 120) = self->_purchaseType;
    *(_WORD *)(v6 + 188) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  __int16 has;
  __int16 v11;
  NSString *iadQtoken;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NSData *subscriptionPurchaseSessionId;
  __int16 v17;
  __int16 v18;
  NSString *purchaseId;
  NSString *groupFeedId;
  NSString *parentFeedId;
  NTPBIssueData *issueData;
  __int16 v23;
  __int16 v24;
  NSMutableArray *topicIds;
  NSString *surfacedByTopicId;
  NSString *surfacedByChannelId;
  __int16 v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_93;
  v5 = *((_WORD *)v4 + 94);
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    if ((v5 & 0x20) == 0 || self->_resultType != *((_DWORD *)v4 + 31))
      goto LABEL_93;
  }
  else if ((v5 & 0x20) != 0)
  {
    goto LABEL_93;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 17)
    && !-[NSString isEqual:](sourceChannelId, "isEqual:"))
  {
    goto LABEL_93;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:"))
      goto LABEL_93;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_93;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_93;
  }
  has = (__int16)self->_has;
  v11 = *((_WORD *)v4 + 94);
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 22))
      goto LABEL_93;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 26))
      goto LABEL_93;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x200) == 0)
      goto LABEL_93;
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((_BYTE *)v4 + 186))
        goto LABEL_93;
    }
    else if (*((_BYTE *)v4 + 186))
    {
      goto LABEL_93;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    goto LABEL_93;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0)
      goto LABEL_93;
    if (self->_arrivedFromAd)
    {
      if (!*((_BYTE *)v4 + 184))
        goto LABEL_93;
    }
    else if (*((_BYTE *)v4 + 184))
    {
      goto LABEL_93;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  iadQtoken = self->_iadQtoken;
  if ((unint64_t)iadQtoken | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](iadQtoken, "isEqual:"))
    goto LABEL_93;
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_93;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_93;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_93;
  }
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:"))
      goto LABEL_93;
  }
  v17 = (__int16)self->_has;
  v18 = *((_WORD *)v4 + 94);
  if ((v17 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x100) != 0)
    {
      if (self->_sawSubscriptionSheet)
      {
        if (!*((_BYTE *)v4 + 185))
          goto LABEL_93;
        goto LABEL_59;
      }
      if (!*((_BYTE *)v4 + 185))
        goto LABEL_59;
    }
LABEL_93:
    v29 = 0;
    goto LABEL_94;
  }
  if ((*((_WORD *)v4 + 94) & 0x100) != 0)
    goto LABEL_93;
LABEL_59:
  if ((v17 & 2) != 0)
  {
    if ((v18 & 2) == 0 || self->_groupType != *((_DWORD *)v4 + 16))
      goto LABEL_93;
  }
  else if ((v18 & 2) != 0)
  {
    goto LABEL_93;
  }
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((_QWORD *)v4 + 14)
    && !-[NSString isEqual:](purchaseId, "isEqual:"))
  {
    goto LABEL_93;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_93;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](parentFeedId, "isEqual:"))
      goto LABEL_93;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 10))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_93;
  }
  v23 = (__int16)self->_has;
  v24 = *((_WORD *)v4 + 94);
  if ((v23 & 0x40) != 0)
  {
    if ((v24 & 0x40) == 0 || self->_storekitError != *((_DWORD *)v4 + 36))
      goto LABEL_93;
  }
  else if ((v24 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if ((v23 & 1) != 0)
  {
    if ((v24 & 1) == 0 || self->_amsPurchaseErrorCode != *((_DWORD *)v4 + 2))
      goto LABEL_93;
  }
  else if ((v24 & 1) != 0)
  {
    goto LABEL_93;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 22)
    && !-[NSMutableArray isEqual:](topicIds, "isEqual:"))
  {
    goto LABEL_93;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_93;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
      goto LABEL_93;
  }
  v28 = *((_WORD *)v4 + 94);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v28 & 0x10) == 0 || self->_purchaseType != *((_DWORD *)v4 + 30))
      goto LABEL_93;
    v29 = 1;
  }
  else
  {
    v29 = (v28 & 0x10) == 0;
  }
LABEL_94:

  return v29;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t v32;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v32 = 2654435761 * self->_resultType;
  else
    v32 = 0;
  v31 = -[NSString hash](self->_sourceChannelId, "hash");
  v30 = -[NSString hash](self->_sectionId, "hash");
  v29 = -[NSString hash](self->_articleId, "hash");
  v28 = -[NSData hash](self->_articleViewingSessionId, "hash");
  has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v27 = 2654435761 * self->_paidSubscriptionConversionPointType;
    if ((has & 8) != 0)
    {
LABEL_6:
      v26 = 2654435761 * self->_parentFeedType;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_7;
LABEL_11:
      v25 = 0;
      if ((has & 0x80) != 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else
  {
    v27 = 0;
    if ((has & 8) != 0)
      goto LABEL_6;
  }
  v26 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_11;
LABEL_7:
  v25 = 2654435761 * self->_subscriptionOnlyArticlePreview;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v24 = 2654435761 * self->_arrivedFromAd;
    goto LABEL_13;
  }
LABEL_12:
  v24 = 0;
LABEL_13:
  v23 = -[NSString hash](self->_iadQtoken, "hash");
  v22 = -[NSString hash](self->_campaignId, "hash");
  v21 = -[NSString hash](self->_campaignType, "hash");
  v20 = -[NSString hash](self->_creativeId, "hash");
  v19 = -[NSData hash](self->_subscriptionPurchaseSessionId, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x100) != 0)
  {
    v18 = 2654435761 * self->_sawSubscriptionSheet;
    if ((v4 & 2) != 0)
      goto LABEL_15;
  }
  else
  {
    v18 = 0;
    if ((v4 & 2) != 0)
    {
LABEL_15:
      v17 = 2654435761 * self->_groupType;
      goto LABEL_18;
    }
  }
  v17 = 0;
LABEL_18:
  v16 = -[NSString hash](self->_purchaseId, "hash");
  v5 = -[NSString hash](self->_groupFeedId, "hash");
  v6 = -[NSString hash](self->_parentFeedId, "hash");
  v7 = -[NTPBIssueData hash](self->_issueData, "hash");
  v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    v9 = 2654435761 * self->_storekitError;
    if ((v8 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
    v9 = 0;
    if ((v8 & 1) != 0)
    {
LABEL_20:
      v10 = 2654435761 * self->_amsPurchaseErrorCode;
      goto LABEL_23;
    }
  }
  v10 = 0;
LABEL_23:
  v11 = -[NSMutableArray hash](self->_topicIds, "hash");
  v12 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v13 = -[NSString hash](self->_surfacedByChannelId, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v14 = 2654435761 * self->_purchaseType;
  else
    v14 = 0;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  __int16 v6;
  __int16 v7;
  NTPBIssueData *issueData;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[47] & 0x20) != 0)
  {
    self->_resultType = v4[31];
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 17))
    -[NTPBPaidSubscriptionResult setSourceChannelId:](self, "setSourceChannelId:");
  if (*((_QWORD *)v5 + 16))
    -[NTPBPaidSubscriptionResult setSectionId:](self, "setSectionId:");
  if (*((_QWORD *)v5 + 2))
    -[NTPBPaidSubscriptionResult setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 3))
    -[NTPBPaidSubscriptionResult setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  v6 = *((_WORD *)v5 + 94);
  if ((v6 & 4) != 0)
  {
    self->_paidSubscriptionConversionPointType = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 4u;
    v6 = *((_WORD *)v5 + 94);
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 0x200) == 0)
        goto LABEL_14;
      goto LABEL_41;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_parentFeedType = *((_DWORD *)v5 + 26);
  *(_WORD *)&self->_has |= 8u;
  v6 = *((_WORD *)v5 + 94);
  if ((v6 & 0x200) == 0)
  {
LABEL_14:
    if ((v6 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_41:
  self->_subscriptionOnlyArticlePreview = *((_BYTE *)v5 + 186);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v5 + 94) & 0x80) != 0)
  {
LABEL_15:
    self->_arrivedFromAd = *((_BYTE *)v5 + 184);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_16:
  if (*((_QWORD *)v5 + 9))
    -[NTPBPaidSubscriptionResult setIadQtoken:](self, "setIadQtoken:");
  if (*((_QWORD *)v5 + 4))
    -[NTPBPaidSubscriptionResult setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v5 + 5))
    -[NTPBPaidSubscriptionResult setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v5 + 6))
    -[NTPBPaidSubscriptionResult setCreativeId:](self, "setCreativeId:");
  if (*((_QWORD *)v5 + 19))
    -[NTPBPaidSubscriptionResult setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
  v7 = *((_WORD *)v5 + 94);
  if ((v7 & 0x100) != 0)
  {
    self->_sawSubscriptionSheet = *((_BYTE *)v5 + 185);
    *(_WORD *)&self->_has |= 0x100u;
    v7 = *((_WORD *)v5 + 94);
  }
  if ((v7 & 2) != 0)
  {
    self->_groupType = *((_DWORD *)v5 + 16);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 14))
    -[NTPBPaidSubscriptionResult setPurchaseId:](self, "setPurchaseId:");
  if (*((_QWORD *)v5 + 7))
    -[NTPBPaidSubscriptionResult setGroupFeedId:](self, "setGroupFeedId:");
  if (*((_QWORD *)v5 + 12))
    -[NTPBPaidSubscriptionResult setParentFeedId:](self, "setParentFeedId:");
  issueData = self->_issueData;
  v9 = *((_QWORD *)v5 + 10);
  if (issueData)
  {
    if (v9)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v9)
  {
    -[NTPBPaidSubscriptionResult setIssueData:](self, "setIssueData:");
  }
  v10 = *((_WORD *)v5 + 94);
  if ((v10 & 0x40) != 0)
  {
    self->_storekitError = *((_DWORD *)v5 + 36);
    *(_WORD *)&self->_has |= 0x40u;
    v10 = *((_WORD *)v5 + 94);
  }
  if ((v10 & 1) != 0)
  {
    self->_amsPurchaseErrorCode = *((_DWORD *)v5 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v5 + 22);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[NTPBPaidSubscriptionResult addTopicIds:](self, "addTopicIds:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v5 + 21))
    -[NTPBPaidSubscriptionResult setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 20))
    -[NTPBPaidSubscriptionResult setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if ((*((_WORD *)v5 + 94) & 0x10) != 0)
  {
    self->_purchaseType = *((_DWORD *)v5 + 30);
    *(_WORD *)&self->_has |= 0x10u;
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

- (NSData)subscriptionPurchaseSessionId
{
  return self->_subscriptionPurchaseSessionId;
}

- (void)setSubscriptionPurchaseSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionPurchaseSessionId, a3);
}

- (BOOL)sawSubscriptionSheet
{
  return self->_sawSubscriptionSheet;
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

- (int)amsPurchaseErrorCode
{
  return self->_amsPurchaseErrorCode;
}

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
  objc_storeStrong((id *)&self->_topicIds, a3);
}

- (NSString)surfacedByTopicId
{
  return self->_surfacedByTopicId;
}

- (void)setSurfacedByTopicId:(id)a3
{
  objc_storeStrong((id *)&self->_surfacedByTopicId, a3);
}

- (NSString)surfacedByChannelId
{
  return self->_surfacedByChannelId;
}

- (void)setSurfacedByChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_surfacedByChannelId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_subscriptionPurchaseSessionId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_purchaseId, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
