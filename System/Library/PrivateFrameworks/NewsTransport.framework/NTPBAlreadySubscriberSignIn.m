@implementation NTPBAlreadySubscriberSignIn

- (void)setSuccessfulNewsTokenVerification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_successfulNewsTokenVerification = a3;
}

- (void)setHasSuccessfulNewsTokenVerification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSuccessfulNewsTokenVerification
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)paidSubscriptionConversionPointType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_paidSubscriptionConversionPointType;
  else
    return 0;
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD50020[a3];
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

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
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
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD500D0[a3];
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
  *(_BYTE *)&self->_has |= 0x10u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setArrivedFromAd:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_arrivedFromAd = a3;
}

- (void)setHasArrivedFromAd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasArrivedFromAd
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasIadQtoken
{
  return self->_iadQtoken != 0;
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
    return off_24CD50180[a3];
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

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBAlreadySubscriberSignIn;
  -[NTPBAlreadySubscriberSignIn description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAlreadySubscriberSignIn dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t paidSubscriptionConversionPointType;
  __CFString *v7;
  NSString *errorMessage;
  NSString *errorCode;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  char v14;
  void *v15;
  NSString *iadQtoken;
  NSData *subscriptionPurchaseSessionId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  uint64_t groupType;
  __CFString *v22;
  uint64_t parentFeedType;
  __CFString *v24;
  NTPBIssueData *issueData;
  void *v26;
  NSMutableArray *topicIds;
  NSString *surfacedByTopicId;
  NSString *surfacedByChannelId;
  id v30;
  void *v32;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_successfulNewsTokenVerification);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("successful_news_token_verification"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24CD50020[paidSubscriptionConversionPointType];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("paid_subscription_conversion_point_type"));

  }
  errorMessage = self->_errorMessage;
  if (errorMessage)
    objc_msgSend(v3, "setObject:forKey:", errorMessage, CFSTR("error_message"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v3, "setObject:forKey:", errorCode, CFSTR("error_code"));
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
  v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_24CD500D0[parentFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("parent_feed_type"));

    v14 = (char)self->_has;
    if ((v14 & 0x10) == 0)
    {
LABEL_22:
      if ((v14 & 8) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_subscriptionOnlyArticlePreview);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("subscription_only_article_preview"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_arrivedFromAd);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("arrived_from_ad"));

  }
LABEL_24:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken)
    objc_msgSend(v3, "setObject:forKey:", iadQtoken, CFSTR("iad_qtoken"));
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
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_24CD50180[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("group_type"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("issue_data"));

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
  v30 = v3;

  return v30;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAlreadySubscriberSignInReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_errorMessage)
    PBDataWriterWriteStringField();
  if (self->_errorCode)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if (self->_sectionId)
    PBDataWriterWriteStringField();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_19:
      if ((v6 & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_20:
    PBDataWriterWriteBOOLField();
LABEL_21:
  if (self->_iadQtoken)
    PBDataWriterWriteStringField();
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
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_topicIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();

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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 146) = self->_successfulNewsTokenVerification;
    *(_BYTE *)(v5 + 148) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_paidSubscriptionConversionPointType;
    *(_BYTE *)(v5 + 148) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_errorMessage, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_errorCode, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v10;

  v12 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v12;

  v14 = -[NSString copyWithZone:](self->_sectionId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v14;

  v16 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v16;

  v18 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v18;

  v20 = (char)self->_has;
  if ((v20 & 4) != 0)
  {
    *(_DWORD *)(v6 + 92) = self->_parentFeedType;
    *(_BYTE *)(v6 + 148) |= 4u;
    v20 = (char)self->_has;
    if ((v20 & 0x10) == 0)
    {
LABEL_7:
      if ((v20 & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v6 + 145) = self->_subscriptionOnlyArticlePreview;
  *(_BYTE *)(v6 + 148) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 144) = self->_arrivedFromAd;
    *(_BYTE *)(v6 + 148) |= 8u;
  }
LABEL_9:
  v21 = -[NSString copyWithZone:](self->_iadQtoken, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v21;

  v23 = -[NSData copyWithZone:](self->_subscriptionPurchaseSessionId, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v23;

  v25 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v25;

  v27 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v27;

  v29 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v29;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_groupType;
    *(_BYTE *)(v6 + 148) |= 1u;
  }
  v31 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v31;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v33 = self->_topicIds;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v44);
        objc_msgSend((id)v6, "addTopicIds:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v35);
  }

  v39 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v40 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v39;

  v41 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v42 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v41;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *errorMessage;
  NSString *errorCode;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  NSString *iadQtoken;
  NSData *subscriptionPurchaseSessionId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NTPBIssueData *issueData;
  NSMutableArray *topicIds;
  NSString *surfacedByTopicId;
  NSString *surfacedByChannelId;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_71;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x20) == 0)
      goto LABEL_71;
    if (self->_successfulNewsTokenVerification)
    {
      if (!*((_BYTE *)v4 + 146))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 146))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_BYTE *)v4 + 148) & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 2) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 22))
      goto LABEL_71;
  }
  else if ((*((_BYTE *)v4 + 148) & 2) != 0)
  {
    goto LABEL_71;
  }
  errorMessage = self->_errorMessage;
  if ((unint64_t)errorMessage | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](errorMessage, "isEqual:"))
  {
    goto LABEL_71;
  }
  errorCode = self->_errorCode;
  if ((unint64_t)errorCode | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](errorCode, "isEqual:"))
      goto LABEL_71;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_71;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:"))
      goto LABEL_71;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_71;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_71;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 4) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 23))
      goto LABEL_71;
  }
  else if ((*((_BYTE *)v4 + 148) & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 0x10) == 0)
      goto LABEL_71;
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((_BYTE *)v4 + 145))
        goto LABEL_71;
    }
    else if (*((_BYTE *)v4 + 145))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_BYTE *)v4 + 148) & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 8) != 0)
    {
      if (self->_arrivedFromAd)
      {
        if (!*((_BYTE *)v4 + 144))
          goto LABEL_71;
        goto LABEL_48;
      }
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_48;
    }
LABEL_71:
    v20 = 0;
    goto LABEL_72;
  }
  if ((*((_BYTE *)v4 + 148) & 8) != 0)
    goto LABEL_71;
LABEL_48:
  iadQtoken = self->_iadQtoken;
  if ((unint64_t)iadQtoken | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](iadQtoken, "isEqual:"))
    goto LABEL_71;
  subscriptionPurchaseSessionId = self->_subscriptionPurchaseSessionId;
  if ((unint64_t)subscriptionPurchaseSessionId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](subscriptionPurchaseSessionId, "isEqual:"))
      goto LABEL_71;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_71;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_71;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_71;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 16))
      goto LABEL_71;
  }
  else if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    goto LABEL_71;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 10) && !-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    goto LABEL_71;
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](topicIds, "isEqual:"))
      goto LABEL_71;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_71;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 15))
    v20 = -[NSString isEqual:](surfacedByChannelId, "isEqual:");
  else
    v20 = 1;
LABEL_72:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v24 = 2654435761 * self->_successfulNewsTokenVerification;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v24 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v23 = 2654435761 * self->_paidSubscriptionConversionPointType;
      goto LABEL_6;
    }
  }
  v23 = 0;
LABEL_6:
  v22 = -[NSString hash](self->_errorMessage, "hash");
  v21 = -[NSString hash](self->_errorCode, "hash");
  v20 = -[NSString hash](self->_sourceChannelId, "hash");
  v19 = -[NSString hash](self->_sectionId, "hash");
  v18 = -[NSString hash](self->_articleId, "hash");
  v16 = -[NSData hash](self->_articleViewingSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_8;
LABEL_11:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  v3 = 2654435761 * self->_parentFeedType;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_8:
  v4 = 2654435761 * self->_subscriptionOnlyArticlePreview;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_9:
    v5 = 2654435761 * self->_arrivedFromAd;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
LABEL_13:
  v6 = -[NSString hash](self->_iadQtoken, "hash", v16);
  v7 = -[NSData hash](self->_subscriptionPurchaseSessionId, "hash");
  v8 = -[NSString hash](self->_campaignId, "hash");
  v9 = -[NSString hash](self->_campaignType, "hash");
  v10 = -[NSString hash](self->_creativeId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_groupType;
  else
    v11 = 0;
  v12 = v9 ^ v10 ^ v11 ^ -[NTPBIssueData hash](self->_issueData, "hash");
  v13 = v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v12 ^ -[NSMutableArray hash](self->_topicIds, "hash");
  v14 = -[NSString hash](self->_surfacedByTopicId, "hash");
  return v13 ^ v14 ^ -[NSString hash](self->_surfacedByChannelId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  char v7;
  NTPBIssueData *issueData;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 148);
  if ((v6 & 0x20) != 0)
  {
    self->_successfulNewsTokenVerification = *((_BYTE *)v4 + 146);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 148);
  }
  if ((v6 & 2) != 0)
  {
    self->_paidSubscriptionConversionPointType = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 7))
    -[NTPBAlreadySubscriberSignIn setErrorMessage:](self, "setErrorMessage:");
  if (*((_QWORD *)v5 + 6))
    -[NTPBAlreadySubscriberSignIn setErrorCode:](self, "setErrorCode:");
  if (*((_QWORD *)v5 + 13))
    -[NTPBAlreadySubscriberSignIn setSourceChannelId:](self, "setSourceChannelId:");
  if (*((_QWORD *)v5 + 12))
    -[NTPBAlreadySubscriberSignIn setSectionId:](self, "setSectionId:");
  if (*((_QWORD *)v5 + 1))
    -[NTPBAlreadySubscriberSignIn setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 2))
    -[NTPBAlreadySubscriberSignIn setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  v7 = *((_BYTE *)v5 + 148);
  if ((v7 & 4) != 0)
  {
    self->_parentFeedType = *((_DWORD *)v5 + 23);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v5 + 148);
    if ((v7 & 0x10) == 0)
    {
LABEL_19:
      if ((v7 & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v5 + 148) & 0x10) == 0)
  {
    goto LABEL_19;
  }
  self->_subscriptionOnlyArticlePreview = *((_BYTE *)v5 + 145);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v5 + 148) & 8) != 0)
  {
LABEL_20:
    self->_arrivedFromAd = *((_BYTE *)v5 + 144);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_21:
  if (*((_QWORD *)v5 + 9))
    -[NTPBAlreadySubscriberSignIn setIadQtoken:](self, "setIadQtoken:");
  if (*((_QWORD *)v5 + 14))
    -[NTPBAlreadySubscriberSignIn setSubscriptionPurchaseSessionId:](self, "setSubscriptionPurchaseSessionId:");
  if (*((_QWORD *)v5 + 3))
    -[NTPBAlreadySubscriberSignIn setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v5 + 4))
    -[NTPBAlreadySubscriberSignIn setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v5 + 5))
    -[NTPBAlreadySubscriberSignIn setCreativeId:](self, "setCreativeId:");
  if ((*((_BYTE *)v5 + 148) & 1) != 0)
  {
    self->_groupType = *((_DWORD *)v5 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }
  issueData = self->_issueData;
  v9 = *((_QWORD *)v5 + 10);
  if (issueData)
  {
    if (v9)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v9)
  {
    -[NTPBAlreadySubscriberSignIn setIssueData:](self, "setIssueData:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v5 + 17);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[NTPBAlreadySubscriberSignIn addTopicIds:](self, "addTopicIds:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v5 + 16))
    -[NTPBAlreadySubscriberSignIn setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 15))
    -[NTPBAlreadySubscriberSignIn setSurfacedByChannelId:](self, "setSurfacedByChannelId:");

}

- (BOOL)successfulNewsTokenVerification
{
  return self->_successfulNewsTokenVerification;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
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

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
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
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
