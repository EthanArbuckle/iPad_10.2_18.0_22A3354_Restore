@implementation NTPBPaywallButtonTap

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
    return off_24CD52050[a3];
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
    return off_24CD52100[a3];
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
    return off_24CD52240[a3];
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

- (BOOL)hasPurchaseId
{
  return self->_purchaseId != 0;
}

- (int)subscriptionButtonTargetType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_subscriptionButtonTargetType;
  else
    return 0;
}

- (void)setSubscriptionButtonTargetType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_subscriptionButtonTargetType = a3;
}

- (void)setHasSubscriptionButtonTargetType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubscriptionButtonTargetType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)subscriptionButtonTargetTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD522F0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSubscriptionButtonTargetType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SUBSCRIPTION_BUTTON_TARGET_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PURCHASE_SHEET_SUBSCRIPTION_BUTTON_TARGET_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANDING_PAGE_SUBSCRIPTION_BUTTON_TARGET_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_SUBSCRIPTION_BUTTON_TARGET_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AMP_PAGE_SUBSCRIPTION_BUTTON_TARGET_TYPE")))
  {
    v4 = 4;
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

- (int)purchaseType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_purchaseType;
  else
    return 0;
}

- (void)setPurchaseType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_purchaseType = a3;
}

- (void)setHasPurchaseType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPurchaseType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)purchaseTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD52318[a3];
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
  v8.super_class = (Class)NTPBPaywallButtonTap;
  -[NTPBPaywallButtonTap description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPaywallButtonTap dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  uint64_t parentFeedType;
  __CFString *v11;
  uint64_t groupType;
  __CFString *v13;
  uint64_t paidSubscriptionConversionPointType;
  __CFString *v15;
  NSString *purchaseId;
  uint64_t subscriptionButtonTargetType;
  __CFString *v18;
  NTPBIssueData *issueData;
  void *v20;
  uint64_t purchaseType;
  __CFString *v22;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  sectionId = self->_sectionId;
  if (sectionId)
    objc_msgSend(v4, "setObject:forKey:", sectionId, CFSTR("section_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v4, "setObject:forKey:", articleId, CFSTR("article_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v4, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24CD52050[parentFeedType];
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("parent_feed_type"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_25;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_24CD52100[groupType];
  }
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("group_type"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_21:
    paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_24CD52240[paidSubscriptionConversionPointType];
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("paid_subscription_conversion_point_type"));

  }
LABEL_25:
  purchaseId = self->_purchaseId;
  if (purchaseId)
    objc_msgSend(v4, "setObject:forKey:", purchaseId, CFSTR("purchase_id"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    subscriptionButtonTargetType = self->_subscriptionButtonTargetType;
    if (subscriptionButtonTargetType >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_subscriptionButtonTargetType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_24CD522F0[subscriptionButtonTargetType];
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("subscription_button_target_type"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("issue_data"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    purchaseType = self->_purchaseType;
    if (purchaseType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_purchaseType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_24CD52318[purchaseType];
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("purchase_type"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaywallButtonTapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sectionId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_13:
  if (self->_purchaseId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char has;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  v8 = -[NSString copyWithZone:](self->_sectionId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_parentFeedType;
    *(_BYTE *)(v5 + 84) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_groupType;
  *(_BYTE *)(v5 + 84) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_paidSubscriptionConversionPointType;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
LABEL_5:
  v15 = -[NSString copyWithZone:](self->_purchaseId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_subscriptionButtonTargetType;
    *(_BYTE *)(v5 + 84) |= 0x10u;
  }
  v17 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v17;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_purchaseType;
    *(_BYTE *)(v5 + 84) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  char has;
  NSString *purchaseId;
  NTPBIssueData *issueData;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_40;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:"))
      goto LABEL_40;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_40;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_40;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 11))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 6))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 10))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_40;
  }
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](purchaseId, "isEqual:"))
      goto LABEL_40;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 0x10) == 0 || self->_subscriptionButtonTargetType != *((_DWORD *)v4 + 20))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 84) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 4))
  {
    if (-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_36;
    }
LABEL_40:
    v12 = 0;
    goto LABEL_41;
  }
LABEL_36:
  v12 = (*((_BYTE *)v4 + 84) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 8) == 0 || self->_purchaseType != *((_DWORD *)v4 + 14))
      goto LABEL_40;
    v12 = 1;
  }
LABEL_41:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v13;
  NSUInteger v14;

  v14 = -[NSString hash](self->_sourceChannelId, "hash");
  v13 = -[NSString hash](self->_sectionId, "hash");
  v3 = -[NSString hash](self->_articleId, "hash");
  v4 = -[NSData hash](self->_articleViewingSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v5 = 2654435761 * self->_parentFeedType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_groupType;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_paidSubscriptionConversionPointType;
    goto LABEL_8;
  }
LABEL_7:
  v7 = 0;
LABEL_8:
  v8 = -[NSString hash](self->_purchaseId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v9 = 2654435761 * self->_subscriptionButtonTargetType;
  else
    v9 = 0;
  v10 = -[NTPBIssueData hash](self->_issueData, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v11 = 2654435761 * self->_purchaseType;
  else
    v11 = 0;
  return v13 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  NTPBIssueData *issueData;
  uint64_t v7;
  int *v8;

  v4 = (int *)a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBPaywallButtonTap setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[NTPBPaywallButtonTap setSectionId:](self, "setSectionId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBPaywallButtonTap setArticleId:](self, "setArticleId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBPaywallButtonTap setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_parentFeedType = v4[11];
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 84);
    if ((v5 & 1) == 0)
    {
LABEL_11:
      if ((v5 & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v4[21] & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_groupType = v4[6];
  *(_BYTE *)&self->_has |= 1u;
  if ((v4[21] & 2) != 0)
  {
LABEL_12:
    self->_paidSubscriptionConversionPointType = v4[10];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_13:
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBPaywallButtonTap setPurchaseId:](self, "setPurchaseId:");
    v4 = v8;
  }
  if ((v4[21] & 0x10) != 0)
  {
    self->_subscriptionButtonTargetType = v4[20];
    *(_BYTE *)&self->_has |= 0x10u;
  }
  issueData = self->_issueData;
  v7 = *((_QWORD *)v4 + 4);
  if (issueData)
  {
    if (!v7)
      goto LABEL_26;
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_26;
    -[NTPBPaywallButtonTap setIssueData:](self, "setIssueData:");
  }
  v4 = v8;
LABEL_26:
  if ((v4[21] & 8) != 0)
  {
    self->_purchaseType = v4[14];
    *(_BYTE *)&self->_has |= 8u;
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

- (NSString)purchaseId
{
  return self->_purchaseId;
}

- (void)setPurchaseId:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseId, a3);
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
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_purchaseId, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
