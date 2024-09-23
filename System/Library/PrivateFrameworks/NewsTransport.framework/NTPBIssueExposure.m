@implementation NTPBIssueExposure

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (BOOL)hasChannelData
{
  return self->_channelData != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)parentFeedType
{
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4F510[a3];
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
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD4F5C0[a3];
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

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (void)setDisplayRank:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_displayRank = a3;
}

- (void)setHasDisplayRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasDisplayRank
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)clearFractionalCohortMemberships
{
  -[NSMutableArray removeAllObjects](self->_fractionalCohortMemberships, "removeAllObjects");
}

- (void)addFractionalCohortMembership:(id)a3
{
  id v4;
  NSMutableArray *fractionalCohortMemberships;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  v8 = v4;
  if (!fractionalCohortMemberships)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_fractionalCohortMemberships;
    self->_fractionalCohortMemberships = v6;

    v4 = v8;
    fractionalCohortMemberships = self->_fractionalCohortMemberships;
  }
  -[NSMutableArray addObject:](fractionalCohortMemberships, "addObject:", v4);

}

- (unint64_t)fractionalCohortMembershipsCount
{
  return -[NSMutableArray count](self->_fractionalCohortMemberships, "count");
}

- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_fractionalCohortMemberships, "objectAtIndex:", a3);
}

+ (Class)fractionalCohortMembershipType
{
  return (Class)objc_opt_class();
}

- (void)setPersonalizationScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_personalizationScore = a3;
}

- (void)setHasPersonalizationScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPersonalizationScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFeatureCtr:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_featureCtr = a3;
}

- (void)setHasFeatureCtr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFeatureCtr
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPaidNonpaidSubscriptionCtr:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_paidNonpaidSubscriptionCtr = a3;
}

- (void)setHasPaidNonpaidSubscriptionCtr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPaidNonpaidSubscriptionCtr
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAutoSubscribeCtr:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_autoSubscribeCtr = a3;
}

- (void)setHasAutoSubscribeCtr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAutoSubscribeCtr
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setComputedGlobalScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_computedGlobalScoreCoefficient = a3;
}

- (void)setHasComputedGlobalScoreCoefficient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasComputedGlobalScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setGlobalScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_globalScore = a3;
}

- (void)setHasGlobalScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGlobalScore
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setUserFeedbackScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userFeedbackScore = a3;
}

- (void)setHasUserFeedbackScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserFeedbackScore
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAgedUserFeedbackScore:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_agedUserFeedbackScore = a3;
}

- (void)setHasAgedUserFeedbackScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAgedUserFeedbackScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAgedPersonalizationScore:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_agedPersonalizationScore = a3;
}

- (void)setHasAgedPersonalizationScore:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAgedPersonalizationScore
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDiversifiedPersonalizationScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_diversifiedPersonalizationScore = a3;
}

- (void)setHasDiversifiedPersonalizationScore:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDiversifiedPersonalizationScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSubscribedChannelCtr:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_subscribedChannelCtr = a3;
}

- (void)setHasSubscribedChannelCtr:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubscribedChannelCtr
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
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
  v8.super_class = (Class)NTPBIssueExposure;
  -[NTPBIssueExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBIssueExposure dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NTPBChannelData *channelData;
  void *v9;
  NSString *sourceChannelId;
  __int16 has;
  uint64_t parentFeedType;
  __CFString *v13;
  uint64_t groupType;
  __CFString *v15;
  NSString *parentFeedId;
  __int16 v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  __int16 v25;
  void *v26;
  NSString *language;
  NSString *surfacedByChannelId;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
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
  channelData = self->_channelData;
  if (channelData)
  {
    -[NTPBChannelData dictionaryRepresentation](channelData, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("channel_data"));

  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_24CD4F510[parentFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("parent_feed_type"));

    has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_24CD4F5C0[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("group_type"));

  }
  parentFeedId = self->_parentFeedId;
  if (parentFeedId)
    objc_msgSend(v3, "setObject:forKey:", parentFeedId, CFSTR("parent_feed_id"));
  v17 = (__int16)self->_has;
  if ((v17 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      goto LABEL_23;
LABEL_51:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("ad_supported_channel"));

    if ((*(_WORD *)&self->_has & 0x8000) == 0)
      goto LABEL_24;
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_displayRank);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("display_rank"));

  v17 = (__int16)self->_has;
  if ((v17 & 0x4000) != 0)
    goto LABEL_51;
LABEL_23:
  if ((v17 & 0x8000) == 0)
    goto LABEL_24;
LABEL_52:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToSourceChannel);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("is_paid_subscriber_to_source_channel"));

LABEL_24:
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v19 = self->_fractionalCohortMemberships;
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "dictionaryRepresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("fractional_cohort_membership"));
  }
  v25 = (__int16)self->_has;
  if ((v25 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_personalizationScore);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("personalization_score"));

    v25 = (__int16)self->_has;
    if ((v25 & 0x20) == 0)
    {
LABEL_35:
      if ((v25 & 0x80) == 0)
        goto LABEL_36;
      goto LABEL_55;
    }
  }
  else if ((v25 & 0x20) == 0)
  {
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_featureCtr);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("feature_ctr"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x80) == 0)
  {
LABEL_36:
    if ((v25 & 4) == 0)
      goto LABEL_37;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_paidNonpaidSubscriptionCtr);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("paid_nonpaid_subscription_ctr"));

  v25 = (__int16)self->_has;
  if ((v25 & 4) == 0)
  {
LABEL_37:
    if ((v25 & 8) == 0)
      goto LABEL_38;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_autoSubscribeCtr);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("auto_subscribe_ctr"));

  v25 = (__int16)self->_has;
  if ((v25 & 8) == 0)
  {
LABEL_38:
    if ((v25 & 0x40) == 0)
      goto LABEL_39;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_computedGlobalScoreCoefficient);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("computed_global_score_coefficient"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x40) == 0)
  {
LABEL_39:
    if ((v25 & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_globalScore);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("global_score"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x400) == 0)
  {
LABEL_40:
    if ((v25 & 2) == 0)
      goto LABEL_41;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_userFeedbackScore);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("user_feedback_score"));

  v25 = (__int16)self->_has;
  if ((v25 & 2) == 0)
  {
LABEL_41:
    if ((v25 & 1) == 0)
      goto LABEL_42;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_agedUserFeedbackScore);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("aged_user_feedback_score"));

  v25 = (__int16)self->_has;
  if ((v25 & 1) == 0)
  {
LABEL_42:
    if ((v25 & 0x10) == 0)
      goto LABEL_43;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_agedPersonalizationScore);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("aged_personalization_score"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x10) == 0)
  {
LABEL_43:
    if ((v25 & 0x200) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_diversifiedPersonalizationScore);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("diversified_personalization_score"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_44:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_subscribedChannelCtr);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("subscribed_channel_ctr"));

  }
LABEL_45:
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId)
    objc_msgSend(v3, "setObject:forKey:", surfacedByChannelId, CFSTR("surfaced_by_channel_id"));
  v29 = v3;

  return v29;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int16 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueExposureData)
    PBDataWriterWriteSubmessage();
  if (self->_channelData)
    PBDataWriterWriteSubmessage();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_parentFeedId)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      goto LABEL_17;
LABEL_43:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_44;
  }
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0)
    goto LABEL_43;
LABEL_17:
  if ((v6 & 0x8000) == 0)
    goto LABEL_18;
LABEL_44:
  PBDataWriterWriteBOOLField();
LABEL_18:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_fractionalCohortMemberships;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    v12 = (__int16)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_27:
      if ((v12 & 0x80) == 0)
        goto LABEL_28;
      goto LABEL_47;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteDoubleField();
  v12 = (__int16)self->_has;
  if ((v12 & 0x80) == 0)
  {
LABEL_28:
    if ((v12 & 4) == 0)
      goto LABEL_29;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  v12 = (__int16)self->_has;
  if ((v12 & 4) == 0)
  {
LABEL_29:
    if ((v12 & 8) == 0)
      goto LABEL_30;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  v12 = (__int16)self->_has;
  if ((v12 & 8) == 0)
  {
LABEL_30:
    if ((v12 & 0x40) == 0)
      goto LABEL_31;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  v12 = (__int16)self->_has;
  if ((v12 & 0x40) == 0)
  {
LABEL_31:
    if ((v12 & 0x400) == 0)
      goto LABEL_32;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
LABEL_32:
    if ((v12 & 2) == 0)
      goto LABEL_33;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  v12 = (__int16)self->_has;
  if ((v12 & 2) == 0)
  {
LABEL_33:
    if ((v12 & 1) == 0)
      goto LABEL_34;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteDoubleField();
  v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
LABEL_34:
    if ((v12 & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteDoubleField();
  v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
LABEL_35:
    if ((v12 & 0x200) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_36:
    PBDataWriterWriteDoubleField();
LABEL_37:
  if (self->_language)
    PBDataWriterWriteStringField();
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();

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
  uint64_t v12;
  void *v13;
  __int16 has;
  uint64_t v15;
  void *v16;
  __int16 v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int16 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v6;

  v8 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v8;

  v10 = -[NTPBChannelData copyWithZone:](self->_channelData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  v12 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v12;

  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 160) = self->_parentFeedType;
    *(_WORD *)(v5 + 188) |= 0x2000u;
    has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_groupType;
    *(_WORD *)(v5 + 188) |= 0x1000u;
  }
  v15 = -[NSString copyWithZone:](self->_parentFeedId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x4000) == 0)
      goto LABEL_7;
LABEL_29:
    *(_BYTE *)(v5 + 184) = self->_adSupportedChannel;
    *(_WORD *)(v5 + 188) |= 0x4000u;
    if ((*(_WORD *)&self->_has & 0x8000) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
  *(_DWORD *)(v5 + 104) = self->_displayRank;
  *(_WORD *)(v5 + 188) |= 0x800u;
  v17 = (__int16)self->_has;
  if ((v17 & 0x4000) != 0)
    goto LABEL_29;
LABEL_7:
  if ((v17 & 0x8000) == 0)
    goto LABEL_8;
LABEL_30:
  *(_BYTE *)(v5 + 185) = self->_isPaidSubscriberToSourceChannel;
  *(_WORD *)(v5 + 188) |= 0x8000u;
LABEL_8:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = self->_fractionalCohortMemberships;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v30);
        objc_msgSend((id)v5, "addFractionalCohortMembership:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v20);
  }

  v24 = (__int16)self->_has;
  if ((v24 & 0x100) != 0)
  {
    *(double *)(v5 + 72) = self->_personalizationScore;
    *(_WORD *)(v5 + 188) |= 0x100u;
    v24 = (__int16)self->_has;
    if ((v24 & 0x20) == 0)
    {
LABEL_17:
      if ((v24 & 0x80) == 0)
        goto LABEL_18;
      goto LABEL_33;
    }
  }
  else if ((v24 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  *(double *)(v5 + 48) = self->_featureCtr;
  *(_WORD *)(v5 + 188) |= 0x20u;
  v24 = (__int16)self->_has;
  if ((v24 & 0x80) == 0)
  {
LABEL_18:
    if ((v24 & 4) == 0)
      goto LABEL_19;
    goto LABEL_34;
  }
LABEL_33:
  *(double *)(v5 + 64) = self->_paidNonpaidSubscriptionCtr;
  *(_WORD *)(v5 + 188) |= 0x80u;
  v24 = (__int16)self->_has;
  if ((v24 & 4) == 0)
  {
LABEL_19:
    if ((v24 & 8) == 0)
      goto LABEL_20;
    goto LABEL_35;
  }
LABEL_34:
  *(double *)(v5 + 24) = self->_autoSubscribeCtr;
  *(_WORD *)(v5 + 188) |= 4u;
  v24 = (__int16)self->_has;
  if ((v24 & 8) == 0)
  {
LABEL_20:
    if ((v24 & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_36;
  }
LABEL_35:
  *(double *)(v5 + 32) = self->_computedGlobalScoreCoefficient;
  *(_WORD *)(v5 + 188) |= 8u;
  v24 = (__int16)self->_has;
  if ((v24 & 0x40) == 0)
  {
LABEL_21:
    if ((v24 & 0x400) == 0)
      goto LABEL_22;
    goto LABEL_37;
  }
LABEL_36:
  *(double *)(v5 + 56) = self->_globalScore;
  *(_WORD *)(v5 + 188) |= 0x40u;
  v24 = (__int16)self->_has;
  if ((v24 & 0x400) == 0)
  {
LABEL_22:
    if ((v24 & 2) == 0)
      goto LABEL_23;
    goto LABEL_38;
  }
LABEL_37:
  *(double *)(v5 + 88) = self->_userFeedbackScore;
  *(_WORD *)(v5 + 188) |= 0x400u;
  v24 = (__int16)self->_has;
  if ((v24 & 2) == 0)
  {
LABEL_23:
    if ((v24 & 1) == 0)
      goto LABEL_24;
    goto LABEL_39;
  }
LABEL_38:
  *(double *)(v5 + 16) = self->_agedUserFeedbackScore;
  *(_WORD *)(v5 + 188) |= 2u;
  v24 = (__int16)self->_has;
  if ((v24 & 1) == 0)
  {
LABEL_24:
    if ((v24 & 0x10) == 0)
      goto LABEL_25;
LABEL_40:
    *(double *)(v5 + 40) = self->_diversifiedPersonalizationScore;
    *(_WORD *)(v5 + 188) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_39:
  *(double *)(v5 + 8) = self->_agedPersonalizationScore;
  *(_WORD *)(v5 + 188) |= 1u;
  v24 = (__int16)self->_has;
  if ((v24 & 0x10) != 0)
    goto LABEL_40;
LABEL_25:
  if ((v24 & 0x200) != 0)
  {
LABEL_26:
    *(double *)(v5 + 80) = self->_subscribedChannelCtr;
    *(_WORD *)(v5 + 188) |= 0x200u;
  }
LABEL_27:
  v25 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3, (_QWORD)v30);
  v26 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v25;

  v27 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v27;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBChannelData *channelData;
  NSString *sourceChannelId;
  __int16 has;
  NSString *parentFeedId;
  NSMutableArray *fractionalCohortMemberships;
  __int16 v12;
  NSString *language;
  NSString *surfacedByChannelId;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_106;
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 16))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_106;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 17))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_106;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((_QWORD *)v4 + 12))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:"))
      goto LABEL_106;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_106;
  }
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x2000) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 40))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x2000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x1000) == 0 || self->_groupType != *((_DWORD *)v4 + 30))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x1000) != 0)
  {
    goto LABEL_106;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](parentFeedId, "isEqual:"))
      goto LABEL_106;
    has = (__int16)self->_has;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x800) == 0 || self->_displayRank != *((_DWORD *)v4 + 26))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x800) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x4000) == 0)
      goto LABEL_106;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 184))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 184))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x4000) != 0)
  {
    goto LABEL_106;
  }
  if (has < 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x8000) == 0)
      goto LABEL_106;
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((_BYTE *)v4 + 185))
        goto LABEL_106;
    }
    else if (*((_BYTE *)v4 + 185))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x8000) != 0)
  {
    goto LABEL_106;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if (!((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 14)))
    goto LABEL_41;
  if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
  {
LABEL_106:
    v15 = 0;
    goto LABEL_107;
  }
  has = (__int16)self->_has;
LABEL_41:
  v12 = *((_WORD *)v4 + 94);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x100) == 0 || self->_personalizationScore != *((double *)v4 + 9))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x100) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_featureCtr != *((double *)v4 + 6))
      goto LABEL_106;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_paidNonpaidSubscriptionCtr != *((double *)v4 + 8))
      goto LABEL_106;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_autoSubscribeCtr != *((double *)v4 + 3))
      goto LABEL_106;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_computedGlobalScoreCoefficient != *((double *)v4 + 4))
      goto LABEL_106;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_globalScore != *((double *)v4 + 7))
      goto LABEL_106;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x400) == 0 || self->_userFeedbackScore != *((double *)v4 + 11))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x400) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_agedUserFeedbackScore != *((double *)v4 + 2))
      goto LABEL_106;
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_agedPersonalizationScore != *((double *)v4 + 1))
      goto LABEL_106;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_diversifiedPersonalizationScore != *((double *)v4 + 5))
      goto LABEL_106;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x200) == 0 || self->_subscribedChannelCtr != *((double *)v4 + 10))
      goto LABEL_106;
  }
  else if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    goto LABEL_106;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 18) && !-[NSString isEqual:](language, "isEqual:"))
    goto LABEL_106;
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 22))
    v15 = -[NSString isEqual:](surfacedByChannelId, "isEqual:");
  else
    v15 = 1;
LABEL_107:

  return v15;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double personalizationScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double featureCtr;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double paidNonpaidSubscriptionCtr;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double autoSubscribeCtr;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double computedGlobalScoreCoefficient;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double globalScore;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double userFeedbackScore;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double agedUserFeedbackScore;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  double agedPersonalizationScore;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  double diversifiedPersonalizationScore;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  double subscribedChannelCtr;
  double v56;
  long double v57;
  double v58;
  unint64_t v59;
  NSUInteger v60;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSUInteger v69;
  uint64_t v70;
  uint64_t v71;
  NSUInteger v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;

  v75 = -[NTPBIssueData hash](self->_issueData, "hash");
  v74 = -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  v73 = -[NTPBChannelData hash](self->_channelData, "hash");
  v72 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v71 = 2654435761 * self->_parentFeedType;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_3;
  }
  else
  {
    v71 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      v70 = 2654435761 * self->_groupType;
      goto LABEL_6;
    }
  }
  v70 = 0;
LABEL_6:
  v69 = -[NSString hash](self->_parentFeedId, "hash");
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    v68 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
      goto LABEL_8;
LABEL_11:
    v67 = 0;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  v68 = 2654435761 * self->_displayRank;
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
    goto LABEL_11;
LABEL_8:
  v67 = 2654435761 * self->_adSupportedChannel;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_9:
    v66 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
    goto LABEL_13;
  }
LABEL_12:
  v66 = 0;
LABEL_13:
  v65 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    personalizationScore = self->_personalizationScore;
    v6 = -personalizationScore;
    if (personalizationScore >= 0.0)
      v6 = self->_personalizationScore;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 0x20) != 0)
  {
    featureCtr = self->_featureCtr;
    v11 = -featureCtr;
    if (featureCtr >= 0.0)
      v11 = self->_featureCtr;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x80) != 0)
  {
    paidNonpaidSubscriptionCtr = self->_paidNonpaidSubscriptionCtr;
    v16 = -paidNonpaidSubscriptionCtr;
    if (paidNonpaidSubscriptionCtr >= 0.0)
      v16 = self->_paidNonpaidSubscriptionCtr;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v64 = v4;
  if ((has & 4) != 0)
  {
    autoSubscribeCtr = self->_autoSubscribeCtr;
    v21 = -autoSubscribeCtr;
    if (autoSubscribeCtr >= 0.0)
      v21 = self->_autoSubscribeCtr;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v63 = v9;
  if ((has & 8) != 0)
  {
    computedGlobalScoreCoefficient = self->_computedGlobalScoreCoefficient;
    v26 = -computedGlobalScoreCoefficient;
    if (computedGlobalScoreCoefficient >= 0.0)
      v26 = self->_computedGlobalScoreCoefficient;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  v62 = v14;
  if ((has & 0x40) != 0)
  {
    globalScore = self->_globalScore;
    v31 = -globalScore;
    if (globalScore >= 0.0)
      v31 = self->_globalScore;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((has & 0x400) != 0)
  {
    userFeedbackScore = self->_userFeedbackScore;
    v36 = -userFeedbackScore;
    if (userFeedbackScore >= 0.0)
      v36 = self->_userFeedbackScore;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  if ((has & 2) != 0)
  {
    agedUserFeedbackScore = self->_agedUserFeedbackScore;
    v41 = -agedUserFeedbackScore;
    if (agedUserFeedbackScore >= 0.0)
      v41 = self->_agedUserFeedbackScore;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  if ((has & 1) != 0)
  {
    agedPersonalizationScore = self->_agedPersonalizationScore;
    v46 = -agedPersonalizationScore;
    if (agedPersonalizationScore >= 0.0)
      v46 = self->_agedPersonalizationScore;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  if ((has & 0x10) != 0)
  {
    diversifiedPersonalizationScore = self->_diversifiedPersonalizationScore;
    v51 = -diversifiedPersonalizationScore;
    if (diversifiedPersonalizationScore >= 0.0)
      v51 = self->_diversifiedPersonalizationScore;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  if ((has & 0x200) != 0)
  {
    subscribedChannelCtr = self->_subscribedChannelCtr;
    v56 = -subscribedChannelCtr;
    if (subscribedChannelCtr >= 0.0)
      v56 = self->_subscribedChannelCtr;
    v57 = floor(v56 + 0.5);
    v58 = (v56 - v57) * 1.84467441e19;
    v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0)
        v54 += (unint64_t)v58;
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    v54 = 0;
  }
  v59 = v62 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v49 ^ v54;
  v60 = v59 ^ -[NSString hash](self->_language, "hash", v62);
  return v74 ^ v75 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v60 ^ -[NSString hash](self->_surfacedByChannelId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NTPBIssueData *issueData;
  uint64_t v6;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v8;
  NTPBChannelData *channelData;
  uint64_t v10;
  __int16 v11;
  __int16 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int16 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  issueData = self->_issueData;
  v6 = *((_QWORD *)v4 + 16);
  if (issueData)
  {
    if (v6)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBIssueExposure setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v8 = *((_QWORD *)v4 + 17);
  if (issueExposureData)
  {
    if (v8)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBIssueExposure setIssueExposureData:](self, "setIssueExposureData:");
  }
  channelData = self->_channelData;
  v10 = *((_QWORD *)v4 + 12);
  if (channelData)
  {
    if (v10)
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else if (v10)
  {
    -[NTPBIssueExposure setChannelData:](self, "setChannelData:");
  }
  if (*((_QWORD *)v4 + 21))
    -[NTPBIssueExposure setSourceChannelId:](self, "setSourceChannelId:");
  v11 = *((_WORD *)v4 + 94);
  if ((v11 & 0x2000) != 0)
  {
    self->_parentFeedType = *((_DWORD *)v4 + 40);
    *(_WORD *)&self->_has |= 0x2000u;
    v11 = *((_WORD *)v4 + 94);
  }
  if ((v11 & 0x1000) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  if (*((_QWORD *)v4 + 19))
    -[NTPBIssueExposure setParentFeedId:](self, "setParentFeedId:");
  v12 = *((_WORD *)v4 + 94);
  if ((v12 & 0x800) == 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x4000) == 0)
      goto LABEL_26;
LABEL_52:
    self->_adSupportedChannel = *((_BYTE *)v4 + 184);
    *(_WORD *)&self->_has |= 0x4000u;
    if ((*((_WORD *)v4 + 94) & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
  self->_displayRank = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x800u;
  v12 = *((_WORD *)v4 + 94);
  if ((v12 & 0x4000) != 0)
    goto LABEL_52;
LABEL_26:
  if ((v12 & 0x8000) == 0)
    goto LABEL_27;
LABEL_53:
  self->_isPaidSubscriberToSourceChannel = *((_BYTE *)v4 + 185);
  *(_WORD *)&self->_has |= 0x8000u;
LABEL_27:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = *((id *)v4 + 14);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[NTPBIssueExposure addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x100) != 0)
  {
    self->_personalizationScore = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    v18 = *((_WORD *)v4 + 94);
    if ((v18 & 0x20) == 0)
    {
LABEL_36:
      if ((v18 & 0x80) == 0)
        goto LABEL_37;
      goto LABEL_56;
    }
  }
  else if ((v18 & 0x20) == 0)
  {
    goto LABEL_36;
  }
  self->_featureCtr = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x80) == 0)
  {
LABEL_37:
    if ((v18 & 4) == 0)
      goto LABEL_38;
    goto LABEL_57;
  }
LABEL_56:
  self->_paidNonpaidSubscriptionCtr = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 4) == 0)
  {
LABEL_38:
    if ((v18 & 8) == 0)
      goto LABEL_39;
    goto LABEL_58;
  }
LABEL_57:
  self->_autoSubscribeCtr = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 8) == 0)
  {
LABEL_39:
    if ((v18 & 0x40) == 0)
      goto LABEL_40;
    goto LABEL_59;
  }
LABEL_58:
  self->_computedGlobalScoreCoefficient = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x40) == 0)
  {
LABEL_40:
    if ((v18 & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_60;
  }
LABEL_59:
  self->_globalScore = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x400) == 0)
  {
LABEL_41:
    if ((v18 & 2) == 0)
      goto LABEL_42;
    goto LABEL_61;
  }
LABEL_60:
  self->_userFeedbackScore = *((double *)v4 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 2) == 0)
  {
LABEL_42:
    if ((v18 & 1) == 0)
      goto LABEL_43;
    goto LABEL_62;
  }
LABEL_61:
  self->_agedUserFeedbackScore = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 1) == 0)
  {
LABEL_43:
    if ((v18 & 0x10) == 0)
      goto LABEL_44;
    goto LABEL_63;
  }
LABEL_62:
  self->_agedPersonalizationScore = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x10) == 0)
  {
LABEL_44:
    if ((v18 & 0x200) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_63:
  self->_diversifiedPersonalizationScore = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
LABEL_45:
    self->_subscribedChannelCtr = *((double *)v4 + 10);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_46:
  if (*((_QWORD *)v4 + 18))
    -[NTPBIssueExposure setLanguage:](self, "setLanguage:");
  if (*((_QWORD *)v4 + 22))
    -[NTPBIssueExposure setSurfacedByChannelId:](self, "setSurfacedByChannelId:");

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

- (NTPBChannelData)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
{
  objc_storeStrong((id *)&self->_channelData, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_parentFeedId, a3);
}

- (int)displayRank
{
  return self->_displayRank;
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, a3);
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (double)featureCtr
{
  return self->_featureCtr;
}

- (double)paidNonpaidSubscriptionCtr
{
  return self->_paidNonpaidSubscriptionCtr;
}

- (double)autoSubscribeCtr
{
  return self->_autoSubscribeCtr;
}

- (double)computedGlobalScoreCoefficient
{
  return self->_computedGlobalScoreCoefficient;
}

- (double)globalScore
{
  return self->_globalScore;
}

- (double)userFeedbackScore
{
  return self->_userFeedbackScore;
}

- (double)agedUserFeedbackScore
{
  return self->_agedUserFeedbackScore;
}

- (double)agedPersonalizationScore
{
  return self->_agedPersonalizationScore;
}

- (double)diversifiedPersonalizationScore
{
  return self->_diversifiedPersonalizationScore;
}

- (double)subscribedChannelCtr
{
  return self->_subscribedChannelCtr;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
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
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
}

@end
