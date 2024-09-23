@implementation NTPBPDFPageView

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBPDFPageView;
  -[NTPBPDFPageView dealloc](&v3, sel_dealloc);
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (unint64_t)pageIndicesCount
{
  return self->_pageIndices.count;
}

- (int)pageIndices
{
  return self->_pageIndices.list;
}

- (void)clearPageIndices
{
  PBRepeatedInt32Clear();
}

- (void)addPageIndices:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)pageIndicesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_pageIndices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_pageIndices = &self->_pageIndices;
  count = self->_pageIndices.count;
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
  return p_pageIndices->list[a3];
}

- (void)setPageIndices:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setPageCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_pageCount = a3;
}

- (void)setHasPageCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPageCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsFreeIssue:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isFreeIssue = a3;
}

- (void)setHasIsFreeIssue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsFreeIssue
{
  return (*(_WORD *)&self->_has >> 6) & 1;
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
    return off_24CD4D970[a3];
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

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
    return off_24CD4DA20[a3];
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

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (void)setViewFromNotificationDirectOpen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_viewFromNotificationDirectOpen = a3;
}

- (void)setHasViewFromNotificationDirectOpen:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasViewFromNotificationDirectOpen
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
}

- (BOOL)hasChannelData
{
  return self->_channelData != 0;
}

- (int)paidSubscriberToFeedType
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_paidSubscriberToFeedType;
  else
    return 0;
}

- (void)setPaidSubscriberToFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_paidSubscriberToFeedType = a3;
}

- (void)setHasPaidSubscriberToFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPaidSubscriberToFeedType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)paidSubscriberToFeedTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD4DB60[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPaidSubscriberToFeedType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PAID_SUBSCRIBER_TO_FEED_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_PAID_SUBSCRIBER_TO_FEED_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STORE_PAID_SUBSCRIBER_TO_FEED_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WEBSITE_PAID_SUBSCRIBER_TO_FEED_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

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
    return off_24CD4DB80[a3];
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

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
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
  v8.super_class = (Class)NTPBPDFPageView;
  -[NTPBPDFPageView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPDFPageView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBIssueData *issueData;
  void *v5;
  NTPBIssueExposureData *issueExposureData;
  void *v7;
  NTPBIssueViewData *issueViewData;
  void *v9;
  void *v10;
  __int16 has;
  void *v12;
  void *v13;
  uint64_t parentFeedType;
  __CFString *v15;
  NSString *parentFeedId;
  NSString *sourceChannelId;
  __int16 v18;
  void *v19;
  void *v20;
  uint64_t groupType;
  __CFString *v22;
  NSString *campaignId;
  void *v24;
  NSString *notificationId;
  NTPBChannelData *channelData;
  void *v27;
  __int16 v28;
  uint64_t paidSubscriberToFeedType;
  __CFString *v30;
  uint64_t paidSubscriptionConversionPointType;
  __CFString *v32;
  NSString *language;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  id v36;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("issue_exposure_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("issue_view_data"));

  }
  PBRepeatedInt32NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("page_indices"));

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_pageCount);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("page_count"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_17;
      goto LABEL_13;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFreeIssue);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("is_free_issue"));

  if ((*(_WORD *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_13:
  parentFeedType = self->_parentFeedType;
  if (parentFeedType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_24CD4D970[parentFeedType];
  }
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("parent_feed_type"));

LABEL_17:
  parentFeedId = self->_parentFeedId;
  if (parentFeedId)
    objc_msgSend(v3, "setObject:forKey:", parentFeedId, CFSTR("parent_feed_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  v18 = (__int16)self->_has;
  if ((v18 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("ad_supported_channel"));

    v18 = (__int16)self->_has;
    if ((v18 & 0x80) == 0)
    {
LABEL_23:
      if ((v18 & 1) == 0)
        goto LABEL_31;
      goto LABEL_27;
    }
  }
  else if ((v18 & 0x80) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToSourceChannel);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("is_paid_subscriber_to_source_channel"));

  if ((*(_WORD *)&self->_has & 1) == 0)
    goto LABEL_31;
LABEL_27:
  groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_24CD4DA20[groupType];
  }
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("group_type"));

LABEL_31:
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_viewFromNotificationDirectOpen);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("view_from_notification_direct_open"));

  }
  notificationId = self->_notificationId;
  if (notificationId)
    objc_msgSend(v3, "setObject:forKey:", notificationId, CFSTR("notification_id"));
  channelData = self->_channelData;
  if (channelData)
  {
    -[NTPBChannelData dictionaryRepresentation](channelData, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("channel_data"));

  }
  v28 = (__int16)self->_has;
  if ((v28 & 4) != 0)
  {
    paidSubscriberToFeedType = self->_paidSubscriberToFeedType;
    if (paidSubscriberToFeedType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriberToFeedType);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_24CD4DB60[paidSubscriberToFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("paid_subscriber_to_feed_type"));

    v28 = (__int16)self->_has;
  }
  if ((v28 & 8) != 0)
  {
    paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointType);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_24CD4DB80[paidSubscriptionConversionPointType];
    }
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("paid_subscription_conversion_point_type"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication)
    objc_msgSend(v3, "setObject:forKey:", referringSourceApplication, CFSTR("referring_source_application"));
  referringUrl = self->_referringUrl;
  if (referringUrl)
    objc_msgSend(v3, "setObject:forKey:", referringUrl, CFSTR("referring_url"));
  v36 = v3;

  return v36;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPDFPageViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  __int16 has;
  __int16 v7;
  __int16 v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  if (self->_issueExposureData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  if (self->_issueViewData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  if (self->_pageIndices.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v9;
      ++v5;
    }
    while (v5 < self->_pageIndices.count);
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  v4 = v9;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
LABEL_14:
  if (self->_parentFeedId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v9;
    v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_20:
      if ((v7 & 1) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteBOOLField();
  v4 = v9;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_21:
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
LABEL_22:
  if (self->_campaignId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v9;
  }
  if (self->_notificationId)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_channelData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v9;
  }
  v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v9;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_referringSourceApplication)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }
  if (self->_referringUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  __int16 has;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  PBRepeatedInt32Copy();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_pageCount;
    *(_WORD *)(v5 + 156) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 153) = self->_isFreeIssue;
  *(_WORD *)(v5 + 156) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 120) = self->_parentFeedType;
    *(_WORD *)(v5 + 156) |= 0x10u;
  }
LABEL_5:
  v13 = -[NSString copyWithZone:](self->_parentFeedId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v13;

  v15 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 152) = self->_adSupportedChannel;
    *(_WORD *)(v5 + 156) |= 0x20u;
    v17 = (__int16)self->_has;
    if ((v17 & 0x80) == 0)
    {
LABEL_7:
      if ((v17 & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((v17 & 0x80) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 154) = self->_isPaidSubscriberToSourceChannel;
  *(_WORD *)(v5 + 156) |= 0x80u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 48) = self->_groupType;
    *(_WORD *)(v5 + 156) |= 1u;
  }
LABEL_9:
  v18 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 155) = self->_viewFromNotificationDirectOpen;
    *(_WORD *)(v5 + 156) |= 0x100u;
  }
  v20 = -[NSString copyWithZone:](self->_notificationId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v20;

  v22 = -[NTPBChannelData copyWithZone:](self->_channelData, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v22;

  v24 = (__int16)self->_has;
  if ((v24 & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_paidSubscriberToFeedType;
    *(_WORD *)(v5 + 156) |= 4u;
    v24 = (__int16)self->_has;
  }
  if ((v24 & 8) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_paidSubscriptionConversionPointType;
    *(_WORD *)(v5 + 156) |= 8u;
  }
  v25 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v25;

  v27 = -[NSString copyWithZone:](self->_referringSourceApplication, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v27;

  v29 = -[NSString copyWithZone:](self->_referringUrl, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v29;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBIssueViewData *issueViewData;
  __int16 has;
  __int16 v9;
  NSString *parentFeedId;
  NSString *sourceChannelId;
  __int16 v12;
  __int16 v13;
  NSString *campaignId;
  NSString *notificationId;
  NTPBChannelData *channelData;
  __int16 v17;
  __int16 v18;
  NSString *language;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  char v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_83;
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 7))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_83;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 8))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_83;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 9))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_83;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_83;
  has = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 78);
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_pageCount != *((_DWORD *)v4 + 24))
      goto LABEL_83;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0)
      goto LABEL_83;
    if (self->_isFreeIssue)
    {
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_83;
    }
    else if (*((_BYTE *)v4 + 153))
    {
      goto LABEL_83;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 30))
      goto LABEL_83;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((_QWORD *)v4 + 14)
    && !-[NSString isEqual:](parentFeedId, "isEqual:"))
  {
    goto LABEL_83;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_83;
  }
  v12 = (__int16)self->_has;
  v13 = *((_WORD *)v4 + 78);
  if ((v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0)
      goto LABEL_83;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_83;
    }
    else if (*((_BYTE *)v4 + 152))
    {
      goto LABEL_83;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0)
      goto LABEL_83;
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((_BYTE *)v4 + 154))
        goto LABEL_83;
    }
    else if (*((_BYTE *)v4 + 154))
    {
      goto LABEL_83;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if ((v12 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 12))
      goto LABEL_83;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_83;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_83;
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 78) & 0x100) != 0)
    {
      if (self->_viewFromNotificationDirectOpen)
      {
        if (!*((_BYTE *)v4 + 155))
          goto LABEL_83;
        goto LABEL_63;
      }
      if (!*((_BYTE *)v4 + 155))
        goto LABEL_63;
    }
LABEL_83:
    v22 = 0;
    goto LABEL_84;
  }
  if ((*((_WORD *)v4 + 78) & 0x100) != 0)
    goto LABEL_83;
LABEL_63:
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](notificationId, "isEqual:"))
  {
    goto LABEL_83;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((_QWORD *)v4 + 5))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:"))
      goto LABEL_83;
  }
  v17 = (__int16)self->_has;
  v18 = *((_WORD *)v4 + 78);
  if ((v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_paidSubscriberToFeedType != *((_DWORD *)v4 + 25))
      goto LABEL_83;
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((v17 & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 26))
      goto LABEL_83;
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_83;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 10) && !-[NSString isEqual:](language, "isEqual:"))
    goto LABEL_83;
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](referringSourceApplication, "isEqual:"))
      goto LABEL_83;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((_QWORD *)v4 + 17))
    v22 = -[NSString isEqual:](referringUrl, "isEqual:");
  else
    v22 = 1;
LABEL_84:

  return v22;
}

- (unint64_t)hash
{
  __int16 has;
  NSUInteger v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;

  v27 = -[NTPBIssueData hash](self->_issueData, "hash");
  v26 = -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  v25 = -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  v24 = PBRepeatedInt32Hash();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
    v23 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
LABEL_6:
    v22 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v23 = 2654435761 * self->_pageCount;
  if ((has & 0x40) == 0)
    goto LABEL_6;
LABEL_3:
  v22 = 2654435761 * self->_isFreeIssue;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v21 = 2654435761 * self->_parentFeedType;
    goto LABEL_8;
  }
LABEL_7:
  v21 = 0;
LABEL_8:
  v20 = -[NSString hash](self->_parentFeedId, "hash");
  v4 = -[NSString hash](self->_sourceChannelId, "hash");
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
    v6 = 0;
    if ((v5 & 0x80) != 0)
      goto LABEL_10;
LABEL_13:
    v7 = 0;
    if ((v5 & 1) != 0)
      goto LABEL_11;
    goto LABEL_14;
  }
  v6 = 2654435761 * self->_adSupportedChannel;
  if ((v5 & 0x80) == 0)
    goto LABEL_13;
LABEL_10:
  v7 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
  if ((v5 & 1) != 0)
  {
LABEL_11:
    v8 = 2654435761 * self->_groupType;
    goto LABEL_15;
  }
LABEL_14:
  v8 = 0;
LABEL_15:
  v9 = -[NSString hash](self->_campaignId, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v10 = 2654435761 * self->_viewFromNotificationDirectOpen;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_notificationId, "hash");
  v12 = -[NTPBChannelData hash](self->_channelData, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    v14 = 2654435761 * self->_paidSubscriberToFeedType;
    if ((v13 & 8) != 0)
      goto LABEL_20;
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  v14 = 0;
  if ((v13 & 8) == 0)
    goto LABEL_22;
LABEL_20:
  v15 = 2654435761 * self->_paidSubscriptionConversionPointType;
LABEL_23:
  v16 = v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v17 = v12 ^ v14 ^ v15 ^ -[NSString hash](self->_language, "hash");
  v18 = v16 ^ v17 ^ -[NSString hash](self->_referringSourceApplication, "hash");
  return v18 ^ -[NSString hash](self->_referringUrl, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NTPBIssueData *issueData;
  uint64_t v6;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v8;
  NTPBIssueViewData *issueViewData;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _QWORD *v14;
  __int16 v15;
  __int16 v16;
  NTPBChannelData *channelData;
  uint64_t v18;
  __int16 v19;
  _QWORD *v20;

  v4 = a3;
  issueData = self->_issueData;
  v6 = v4[7];
  v20 = v4;
  if (issueData)
  {
    if (!v6)
      goto LABEL_7;
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NTPBPDFPageView setIssueData:](self, "setIssueData:");
  }
  v4 = v20;
LABEL_7:
  issueExposureData = self->_issueExposureData;
  v8 = v4[8];
  if (issueExposureData)
  {
    if (!v8)
      goto LABEL_13;
    -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[NTPBPDFPageView setIssueExposureData:](self, "setIssueExposureData:");
  }
  v4 = v20;
LABEL_13:
  issueViewData = self->_issueViewData;
  v10 = v4[9];
  if (issueViewData)
  {
    if (!v10)
      goto LABEL_19;
    -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[NTPBPDFPageView setIssueViewData:](self, "setIssueViewData:");
  }
  v4 = v20;
LABEL_19:
  v11 = objc_msgSend(v4, "pageIndicesCount");
  if (v11)
  {
    v12 = v11;
    for (i = 0; i != v12; ++i)
      -[NTPBPDFPageView addPageIndices:](self, "addPageIndices:", objc_msgSend(v20, "pageIndicesAtIndex:", i));
  }
  v14 = v20;
  v15 = *((_WORD *)v20 + 78);
  if ((v15 & 2) != 0)
  {
    self->_pageCount = *((_DWORD *)v20 + 24);
    *(_WORD *)&self->_has |= 2u;
    v15 = *((_WORD *)v20 + 78);
    if ((v15 & 0x40) == 0)
    {
LABEL_24:
      if ((v15 & 0x10) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((v15 & 0x40) == 0)
  {
    goto LABEL_24;
  }
  self->_isFreeIssue = *((_BYTE *)v20 + 153);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v20 + 78) & 0x10) != 0)
  {
LABEL_25:
    self->_parentFeedType = *((_DWORD *)v20 + 30);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_26:
  if (v20[14])
  {
    -[NTPBPDFPageView setParentFeedId:](self, "setParentFeedId:");
    v14 = v20;
  }
  if (v14[18])
  {
    -[NTPBPDFPageView setSourceChannelId:](self, "setSourceChannelId:");
    v14 = v20;
  }
  v16 = *((_WORD *)v14 + 78);
  if ((v16 & 0x20) != 0)
  {
    self->_adSupportedChannel = *((_BYTE *)v14 + 152);
    *(_WORD *)&self->_has |= 0x20u;
    v16 = *((_WORD *)v14 + 78);
    if ((v16 & 0x80) == 0)
    {
LABEL_32:
      if ((v16 & 1) == 0)
        goto LABEL_34;
      goto LABEL_33;
    }
  }
  else if ((v16 & 0x80) == 0)
  {
    goto LABEL_32;
  }
  self->_isPaidSubscriberToSourceChannel = *((_BYTE *)v14 + 154);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v14 + 78) & 1) != 0)
  {
LABEL_33:
    self->_groupType = *((_DWORD *)v14 + 12);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_34:
  if (v14[4])
  {
    -[NTPBPDFPageView setCampaignId:](self, "setCampaignId:");
    v14 = v20;
  }
  if ((*((_WORD *)v14 + 78) & 0x100) != 0)
  {
    self->_viewFromNotificationDirectOpen = *((_BYTE *)v14 + 155);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (v14[11])
  {
    -[NTPBPDFPageView setNotificationId:](self, "setNotificationId:");
    v14 = v20;
  }
  channelData = self->_channelData;
  v18 = v14[5];
  if (channelData)
  {
    if (!v18)
      goto LABEL_52;
    -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_52;
    -[NTPBPDFPageView setChannelData:](self, "setChannelData:");
  }
  v14 = v20;
LABEL_52:
  v19 = *((_WORD *)v14 + 78);
  if ((v19 & 4) != 0)
  {
    self->_paidSubscriberToFeedType = *((_DWORD *)v14 + 25);
    *(_WORD *)&self->_has |= 4u;
    v19 = *((_WORD *)v14 + 78);
  }
  if ((v19 & 8) != 0)
  {
    self->_paidSubscriptionConversionPointType = *((_DWORD *)v14 + 26);
    *(_WORD *)&self->_has |= 8u;
  }
  if (v14[10])
  {
    -[NTPBPDFPageView setLanguage:](self, "setLanguage:");
    v14 = v20;
  }
  if (v14[16])
  {
    -[NTPBPDFPageView setReferringSourceApplication:](self, "setReferringSourceApplication:");
    v14 = v20;
  }
  if (v14[17])
  {
    -[NTPBPDFPageView setReferringUrl:](self, "setReferringUrl:");
    v14 = v20;
  }

}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (NTPBIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
  objc_storeStrong((id *)&self->_issueExposureData, a3);
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewData, a3);
}

- (int)pageCount
{
  return self->_pageCount;
}

- (BOOL)isFreeIssue
{
  return self->_isFreeIssue;
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_parentFeedId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_campaignId, a3);
}

- (BOOL)viewFromNotificationDirectOpen
{
  return self->_viewFromNotificationDirectOpen;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (void)setNotificationId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationId, a3);
}

- (NTPBChannelData)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
{
  objc_storeStrong((id *)&self->_channelData, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSString)referringSourceApplication
{
  return self->_referringSourceApplication;
}

- (void)setReferringSourceApplication:(id)a3
{
  objc_storeStrong((id *)&self->_referringSourceApplication, a3);
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
  objc_storeStrong((id *)&self->_referringUrl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end
