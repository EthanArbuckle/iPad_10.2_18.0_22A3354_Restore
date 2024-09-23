@implementation NTPBGroupViewExposure

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (void)clearGroupedArticleIds
{
  -[NSMutableArray removeAllObjects](self->_groupedArticleIds, "removeAllObjects");
}

- (void)addGroupedArticleIds:(id)a3
{
  id v4;
  NSMutableArray *groupedArticleIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  groupedArticleIds = self->_groupedArticleIds;
  v8 = v4;
  if (!groupedArticleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_groupedArticleIds;
    self->_groupedArticleIds = v6;

    v4 = v8;
    groupedArticleIds = self->_groupedArticleIds;
  }
  -[NSMutableArray addObject:](groupedArticleIds, "addObject:", v4);

}

- (unint64_t)groupedArticleIdsCount
{
  return -[NSMutableArray count](self->_groupedArticleIds, "count");
}

- (id)groupedArticleIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_groupedArticleIds, "objectAtIndex:", a3);
}

+ (Class)groupedArticleIdsType
{
  return (Class)objc_opt_class();
}

- (void)setGroupDisplayRankInForYou:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_groupDisplayRankInForYou = a3;
}

- (void)setHasGroupDisplayRankInForYou:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGroupDisplayRankInForYou
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGroupArticleCountInForYou:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_groupArticleCountInForYou = a3;
}

- (void)setHasGroupArticleCountInForYou:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGroupArticleCountInForYou
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD519C0[a3];
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

- (void)setIsSubscribedToGroupFeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isSubscribedToGroupFeed = a3;
}

- (void)setHasIsSubscribedToGroupFeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsSubscribedToGroupFeed
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setTopStoryMandatoryArticleCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_topStoryMandatoryArticleCount = a3;
}

- (void)setHasTopStoryMandatoryArticleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTopStoryMandatoryArticleCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTopStoryOptionalArticleCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_topStoryOptionalArticleCount = a3;
}

- (void)setHasTopStoryOptionalArticleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTopStoryOptionalArticleCount
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (int)groupPresentationReason
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_groupPresentationReason;
  else
    return 0;
}

- (void)setGroupPresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_groupPresentationReason = a3;
}

- (void)setHasGroupPresentationReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasGroupPresentationReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)groupPresentationReasonAsString:(int)a3
{
  if (a3 < 0xB)
    return off_24CD51B00[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGroupPresentationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAFARI_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSTALLED_APPS_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_READING_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANY_ARTICLES_FETCHED_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUB_TOPIC_OF_FAVORITE_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANNEL_FROM_SAFARI_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANNEL_FROM_APP_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INSTRUCTIONAL_FALLBACK_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNIVERSAL_GROUP_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GROUPABLE_GROUP_PRESENTATION_REASON")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)groupFormationReason
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_groupFormationReason;
  else
    return 0;
}

- (void)setGroupFormationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_groupFormationReason = a3;
}

- (void)setHasGroupFormationReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGroupFormationReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)groupFormationReasonAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD51B58[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGroupFormationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_GROUP_FORMATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO_SUBSCRIBED_FEED_GROUP_FORMATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_SUBSCRIBED_GROUP_FORMATION_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_SUBSCRIBED_RELATED_GROUP_FORMATION_REASON")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)feedAutoSubscribeType
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_feedAutoSubscribeType;
  else
    return 0;
}

- (void)setFeedAutoSubscribeType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_feedAutoSubscribeType = a3;
}

- (void)setHasFeedAutoSubscribeType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFeedAutoSubscribeType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)feedAutoSubscribeTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD51B78[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedAutoSubscribeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_FEED_AUTO_SUBSCRIBE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL_GENERATED_FEED_AUTO_SUBSCRIBE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL_GENERATED_FEED_AUTO_SUBSCRIBE_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setReachedEndOfGroup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_reachedEndOfGroup = a3;
}

- (void)setHasReachedEndOfGroup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasReachedEndOfGroup
{
  return *(_WORD *)&self->_has >> 15;
}

- (int)curatedContentType
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_curatedContentType;
  else
    return 0;
}

- (void)setCuratedContentType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_curatedContentType = a3;
}

- (void)setHasCuratedContentType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCuratedContentType
{
  return *(_WORD *)&self->_has & 1;
}

- (id)curatedContentTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD51B90[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCuratedContentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CURATED_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANAGED_TOPIC_CURATED_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GEM_TOPIC_CURATED_CONTENT_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (int)groupDisplayMode
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_groupDisplayMode;
  else
    return 0;
}

- (void)setGroupDisplayMode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_groupDisplayMode = a3;
}

- (void)setHasGroupDisplayMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGroupDisplayMode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)groupLocation
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_groupLocation;
  else
    return 0;
}

- (void)setGroupLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_groupLocation = a3;
}

- (void)setHasGroupLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGroupLocation
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)groupLocationAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD51BA8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGroupLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_GROUP_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_GROUP_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_FEED_GROUP_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EOA_GROUP_LOCATION")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)groupLocationFeedType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_groupLocationFeedType;
  else
    return 0;
}

- (void)setGroupLocationFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_groupLocationFeedType = a3;
}

- (void)setHasGroupLocationFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGroupLocationFeedType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)groupLocationFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD51BC8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGroupLocationFeedType:(id)a3
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

- (BOOL)hasGroupExposedInLocationId
{
  return self->_groupExposedInLocationId != 0;
}

- (BOOL)hasGroupExposedInSourceChannelId
{
  return self->_groupExposedInSourceChannelId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (void)setScreenfulsFromTop:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_screenfulsFromTop = a3;
}

- (void)setHasScreenfulsFromTop:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScreenfulsFromTop
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearGroupedIssueIds
{
  -[NSMutableArray removeAllObjects](self->_groupedIssueIds, "removeAllObjects");
}

- (void)addGroupedIssueIds:(id)a3
{
  id v4;
  NSMutableArray *groupedIssueIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  groupedIssueIds = self->_groupedIssueIds;
  v8 = v4;
  if (!groupedIssueIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_groupedIssueIds;
    self->_groupedIssueIds = v6;

    v4 = v8;
    groupedIssueIds = self->_groupedIssueIds;
  }
  -[NSMutableArray addObject:](groupedIssueIds, "addObject:", v4);

}

- (unint64_t)groupedIssueIdsCount
{
  return -[NSMutableArray count](self->_groupedIssueIds, "count");
}

- (id)groupedIssueIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_groupedIssueIds, "objectAtIndex:", a3);
}

+ (Class)groupedIssueIdsType
{
  return (Class)objc_opt_class();
}

- (void)setIsIssueContext:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isIssueContext = a3;
}

- (void)setHasIsIssueContext:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsIssueContext
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)clearSectionIds
{
  -[NSMutableArray removeAllObjects](self->_sectionIds, "removeAllObjects");
}

- (void)addSectionIds:(id)a3
{
  id v4;
  NSMutableArray *sectionIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sectionIds = self->_sectionIds;
  v8 = v4;
  if (!sectionIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_sectionIds;
    self->_sectionIds = v6;

    v4 = v8;
    sectionIds = self->_sectionIds;
  }
  -[NSMutableArray addObject:](sectionIds, "addObject:", v4);

}

- (unint64_t)sectionIdsCount
{
  return -[NSMutableArray count](self->_sectionIds, "count");
}

- (id)sectionIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sectionIds, "objectAtIndex:", a3);
}

+ (Class)sectionIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCuratedSubtype
{
  return self->_curatedSubtype != 0;
}

- (BOOL)hasCuratedBatchId
{
  return self->_curatedBatchId != 0;
}

- (void)clearLayoutIds
{
  -[NSMutableArray removeAllObjects](self->_layoutIds, "removeAllObjects");
}

- (void)addLayoutIds:(id)a3
{
  id v4;
  NSMutableArray *layoutIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  layoutIds = self->_layoutIds;
  v8 = v4;
  if (!layoutIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_layoutIds;
    self->_layoutIds = v6;

    v4 = v8;
    layoutIds = self->_layoutIds;
  }
  -[NSMutableArray addObject:](layoutIds, "addObject:", v4);

}

- (unint64_t)layoutIdsCount
{
  return -[NSMutableArray count](self->_layoutIds, "count");
}

- (id)layoutIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_layoutIds, "objectAtIndex:", a3);
}

+ (Class)layoutIdsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)NTPBGroupViewExposure;
  -[NTPBGroupViewExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBGroupViewExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *groupFeedId;
  NSMutableArray *groupedArticleIds;
  __int16 has;
  void *v8;
  NSData *feedViewExposureId;
  __int16 v10;
  void *v11;
  void *v12;
  uint64_t groupType;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t groupPresentationReason;
  __CFString *v18;
  uint64_t groupFormationReason;
  __CFString *v20;
  uint64_t feedAutoSubscribeType;
  __CFString *v22;
  void *v23;
  uint64_t curatedContentType;
  __CFString *v25;
  NSData *groupViewExposureId;
  __int16 v27;
  void *v28;
  uint64_t groupLocation;
  __CFString *v30;
  uint64_t groupLocationFeedType;
  __CFString *v32;
  NSString *groupExposedInLocationId;
  NSString *groupExposedInSourceChannelId;
  NSData *articleViewingSessionId;
  void *v36;
  NSMutableArray *groupedIssueIds;
  void *v38;
  NSMutableArray *sectionIds;
  NSString *curatedSubtype;
  NSString *curatedBatchId;
  NSMutableArray *layoutIds;
  id v43;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v3, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  groupedArticleIds = self->_groupedArticleIds;
  if (groupedArticleIds)
    objc_msgSend(v4, "setObject:forKey:", groupedArticleIds, CFSTR("grouped_article_ids"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_groupDisplayRankInForYou);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("group_display_rank_in_for_you"));

    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x200) == 0)
        goto LABEL_8;
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_groupArticleCountInForYou);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("group_article_count_in_for_you"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_22:
  groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24CD519C0[groupType];
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("group_type"));

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSubscribedToGroupFeed);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("is_subscribed_to_group_feed"));

  }
LABEL_10:
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  v10 = (__int16)self->_has;
  if ((v10 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_topStoryMandatoryArticleCount);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("top_story_mandatory_article_count"));

    v10 = (__int16)self->_has;
    if ((v10 & 0x1000) == 0)
    {
LABEL_14:
      if ((v10 & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_topStoryOptionalArticleCount);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("top_story_optional_article_count"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_15:
    if ((v10 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_26:
  groupPresentationReason = self->_groupPresentationReason;
  if (groupPresentationReason >= 0xB)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupPresentationReason);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_24CD51B00[groupPresentationReason];
  }
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("group_presentation_reason"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_16:
    if ((v10 & 2) == 0)
      goto LABEL_17;
    goto LABEL_37;
  }
LABEL_33:
  groupFormationReason = self->_groupFormationReason;
  if (groupFormationReason >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupFormationReason);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_24CD51B58[groupFormationReason];
  }
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("group_formation_reason"));

  v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_17:
    if ((v10 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_37:
  feedAutoSubscribeType = self->_feedAutoSubscribeType;
  if (feedAutoSubscribeType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedAutoSubscribeType);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_24CD51B78[feedAutoSubscribeType];
  }
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("feed_auto_subscribe_type"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x8000) == 0)
  {
LABEL_18:
    if ((v10 & 1) == 0)
      goto LABEL_46;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_reachedEndOfGroup);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("reached_end_of_group"));

  if ((*(_WORD *)&self->_has & 1) == 0)
    goto LABEL_46;
LABEL_42:
  curatedContentType = self->_curatedContentType;
  if (curatedContentType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_curatedContentType);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_24CD51B90[curatedContentType];
  }
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("curated_content_type"));

LABEL_46:
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  v27 = (__int16)self->_has;
  if ((v27 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_groupDisplayMode);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("group_display_mode"));

    v27 = (__int16)self->_has;
    if ((v27 & 0x40) == 0)
    {
LABEL_50:
      if ((v27 & 0x80) == 0)
        goto LABEL_61;
      goto LABEL_57;
    }
  }
  else if ((v27 & 0x40) == 0)
  {
    goto LABEL_50;
  }
  groupLocation = self->_groupLocation;
  if (groupLocation >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupLocation);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_24CD51BA8[groupLocation];
  }
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("group_location"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_57:
    groupLocationFeedType = self->_groupLocationFeedType;
    if (groupLocationFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupLocationFeedType);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_24CD51BC8[groupLocationFeedType];
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("group_location_feed_type"));

  }
LABEL_61:
  groupExposedInLocationId = self->_groupExposedInLocationId;
  if (groupExposedInLocationId)
    objc_msgSend(v4, "setObject:forKey:", groupExposedInLocationId, CFSTR("group_exposed_in_location_id"));
  groupExposedInSourceChannelId = self->_groupExposedInSourceChannelId;
  if (groupExposedInSourceChannelId)
    objc_msgSend(v4, "setObject:forKey:", groupExposedInSourceChannelId, CFSTR("group_exposed_in_source_channel_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v4, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_screenfulsFromTop);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("screenfuls_from_top"));

  }
  groupedIssueIds = self->_groupedIssueIds;
  if (groupedIssueIds)
    objc_msgSend(v4, "setObject:forKey:", groupedIssueIds, CFSTR("grouped_issue_ids"));
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isIssueContext);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("is_issue_context"));

  }
  sectionIds = self->_sectionIds;
  if (sectionIds)
    objc_msgSend(v4, "setObject:forKey:", sectionIds, CFSTR("section_ids"));
  curatedSubtype = self->_curatedSubtype;
  if (curatedSubtype)
    objc_msgSend(v4, "setObject:forKey:", curatedSubtype, CFSTR("curated_subtype"));
  curatedBatchId = self->_curatedBatchId;
  if (curatedBatchId)
    objc_msgSend(v4, "setObject:forKey:", curatedBatchId, CFSTR("curated_batch_id"));
  layoutIds = self->_layoutIds;
  if (layoutIds)
    objc_msgSend(v4, "setObject:forKey:", layoutIds, CFSTR("layout_ids"));
  v43 = v4;

  return v43;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBGroupViewExposureReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 has;
  __int16 v11;
  __int16 v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = self->_groupedArticleIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v7);
  }

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 0x200) == 0)
        goto LABEL_13;
      goto LABEL_69;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
LABEL_14:
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (__int16)self->_has;
    if ((v11 & 0x1000) == 0)
    {
LABEL_19:
      if ((v11 & 0x100) == 0)
        goto LABEL_20;
      goto LABEL_73;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_20:
    if ((v11 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  v11 = (__int16)self->_has;
  if ((v11 & 0x20) == 0)
  {
LABEL_21:
    if ((v11 & 2) == 0)
      goto LABEL_22;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  v11 = (__int16)self->_has;
  if ((v11 & 2) == 0)
  {
LABEL_22:
    if ((v11 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  v11 = (__int16)self->_has;
  if ((v11 & 0x8000) == 0)
  {
LABEL_23:
    if ((v11 & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_24:
    PBDataWriterWriteInt32Field();
LABEL_25:
  if (self->_groupViewExposureId)
    PBDataWriterWriteDataField();
  v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = (__int16)self->_has;
    if ((v12 & 0x40) == 0)
    {
LABEL_29:
      if ((v12 & 0x80) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v12 & 0x40) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_30:
    PBDataWriterWriteInt32Field();
LABEL_31:
  if (self->_groupExposedInLocationId)
    PBDataWriterWriteStringField();
  if (self->_groupExposedInSourceChannelId)
    PBDataWriterWriteStringField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteInt32Field();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = self->_groupedIssueIds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField();
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v15);
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    PBDataWriterWriteBOOLField();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = self->_sectionIds;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteStringField();
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v20);
  }

  if (self->_curatedSubtype)
    PBDataWriterWriteStringField();
  if (self->_curatedBatchId)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self->_layoutIds;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v29;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteStringField();
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    }
    while (v25);
  }

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
  __int16 has;
  uint64_t v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v8 = self->_groupedArticleIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v63 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addGroupedArticleIds:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v10);
  }

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_groupDisplayRankInForYou;
    *(_WORD *)(v5 + 180) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 0x200) == 0)
        goto LABEL_11;
      goto LABEL_53;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 56) = self->_groupArticleCountInForYou;
  *(_WORD *)(v5 + 180) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x4000) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_53:
  *(_DWORD *)(v5 + 112) = self->_groupType;
  *(_WORD *)(v5 + 180) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_12:
    *(_BYTE *)(v5 + 177) = self->_isSubscribedToGroupFeed;
    *(_WORD *)(v5 + 180) |= 0x4000u;
  }
LABEL_13:
  v15 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_topStoryMandatoryArticleCount;
    *(_WORD *)(v5 + 180) |= 0x800u;
    v17 = (__int16)self->_has;
    if ((v17 & 0x1000) == 0)
    {
LABEL_15:
      if ((v17 & 0x100) == 0)
        goto LABEL_16;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v5 + 172) = self->_topStoryOptionalArticleCount;
  *(_WORD *)(v5 + 180) |= 0x1000u;
  v17 = (__int16)self->_has;
  if ((v17 & 0x100) == 0)
  {
LABEL_16:
    if ((v17 & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 108) = self->_groupPresentationReason;
  *(_WORD *)(v5 + 180) |= 0x100u;
  v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_17:
    if ((v17 & 2) == 0)
      goto LABEL_18;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 96) = self->_groupFormationReason;
  *(_WORD *)(v5 + 180) |= 0x20u;
  v17 = (__int16)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_18:
    if ((v17 & 0x8000) == 0)
      goto LABEL_19;
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 40) = self->_feedAutoSubscribeType;
  *(_WORD *)(v5 + 180) |= 2u;
  v17 = (__int16)self->_has;
  if ((v17 & 0x8000) == 0)
  {
LABEL_19:
    if ((v17 & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_60:
  *(_BYTE *)(v5 + 178) = self->_reachedEndOfGroup;
  *(_WORD *)(v5 + 180) |= 0x8000u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_20:
    *(_DWORD *)(v5 + 24) = self->_curatedContentType;
    *(_WORD *)(v5 + 180) |= 1u;
  }
LABEL_21:
  v18 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v18;

  v20 = (__int16)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_groupDisplayMode;
    *(_WORD *)(v5 + 180) |= 8u;
    v20 = (__int16)self->_has;
    if ((v20 & 0x40) == 0)
    {
LABEL_23:
      if ((v20 & 0x80) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((v20 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  *(_DWORD *)(v5 + 100) = self->_groupLocation;
  *(_WORD *)(v5 + 180) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_24:
    *(_DWORD *)(v5 + 104) = self->_groupLocationFeedType;
    *(_WORD *)(v5 + 180) |= 0x80u;
  }
LABEL_25:
  v21 = -[NSString copyWithZone:](self->_groupExposedInLocationId, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v21;

  v23 = -[NSString copyWithZone:](self->_groupExposedInSourceChannelId, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v23;

  v25 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v25;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_screenfulsFromTop;
    *(_WORD *)(v5 + 180) |= 0x400u;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v27 = self->_groupedIssueIds;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v59 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addGroupedIssueIds:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v29);
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    *(_BYTE *)(v5 + 176) = self->_isIssueContext;
    *(_WORD *)(v5 + 180) |= 0x2000u;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v33 = self->_sectionIds;
  v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v55 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSectionIds:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v35);
  }

  v39 = -[NSString copyWithZone:](self->_curatedSubtype, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v39;

  v41 = -[NSString copyWithZone:](self->_curatedBatchId, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v41;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v43 = self->_layoutIds;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v51;
    do
    {
      for (m = 0; m != v45; ++m)
      {
        if (*(_QWORD *)v51 != v46)
          objc_enumerationMutation(v43);
        v48 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v50);
        objc_msgSend((id)v5, "addLayoutIds:", v48);

      }
      v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v45);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *groupFeedId;
  NSMutableArray *groupedArticleIds;
  __int16 has;
  __int16 v8;
  NSData *feedViewExposureId;
  __int16 v10;
  NSData *groupViewExposureId;
  __int16 v12;
  NSString *groupExposedInLocationId;
  NSString *groupExposedInSourceChannelId;
  NSData *articleViewingSessionId;
  __int16 v16;
  NSMutableArray *groupedIssueIds;
  NSMutableArray *sectionIds;
  NSString *curatedSubtype;
  NSString *curatedBatchId;
  NSMutableArray *layoutIds;
  char v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_118;
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_118;
  }
  groupedArticleIds = self->_groupedArticleIds;
  if ((unint64_t)groupedArticleIds | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](groupedArticleIds, "isEqual:"))
      goto LABEL_118;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 90);
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_groupDisplayRankInForYou != *((_DWORD *)v4 + 16))
      goto LABEL_118;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_groupArticleCountInForYou != *((_DWORD *)v4 + 14))
      goto LABEL_118;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x200) == 0 || self->_groupType != *((_DWORD *)v4 + 28))
      goto LABEL_118;
  }
  else if ((*((_WORD *)v4 + 90) & 0x200) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x4000) == 0)
      goto LABEL_118;
    if (self->_isSubscribedToGroupFeed)
    {
      if (!*((_BYTE *)v4 + 177))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 177))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x4000) != 0)
  {
    goto LABEL_118;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_118;
    has = (__int16)self->_has;
  }
  v10 = *((_WORD *)v4 + 90);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x800) == 0 || self->_topStoryMandatoryArticleCount != *((_DWORD *)v4 + 42))
      goto LABEL_118;
  }
  else if ((*((_WORD *)v4 + 90) & 0x800) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x1000) == 0 || self->_topStoryOptionalArticleCount != *((_DWORD *)v4 + 43))
      goto LABEL_118;
  }
  else if ((*((_WORD *)v4 + 90) & 0x1000) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x100) == 0 || self->_groupPresentationReason != *((_DWORD *)v4 + 27))
      goto LABEL_118;
  }
  else if ((*((_WORD *)v4 + 90) & 0x100) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_groupFormationReason != *((_DWORD *)v4 + 24))
      goto LABEL_118;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_feedAutoSubscribeType != *((_DWORD *)v4 + 10))
      goto LABEL_118;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_118;
  }
  if (has < 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x8000) == 0)
      goto LABEL_118;
    if (self->_reachedEndOfGroup)
    {
      if (!*((_BYTE *)v4 + 178))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 178))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x8000) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_curatedContentType != *((_DWORD *)v4 + 6))
      goto LABEL_118;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_118;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_118;
    has = (__int16)self->_has;
  }
  v12 = *((_WORD *)v4 + 90);
  if ((has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_groupDisplayMode != *((_DWORD *)v4 + 15))
      goto LABEL_118;
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_groupLocation != *((_DWORD *)v4 + 25))
      goto LABEL_118;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_groupLocationFeedType != *((_DWORD *)v4 + 26))
      goto LABEL_118;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_118;
  }
  groupExposedInLocationId = self->_groupExposedInLocationId;
  if ((unint64_t)groupExposedInLocationId | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](groupExposedInLocationId, "isEqual:"))
  {
    goto LABEL_118;
  }
  groupExposedInSourceChannelId = self->_groupExposedInSourceChannelId;
  if ((unint64_t)groupExposedInSourceChannelId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](groupExposedInSourceChannelId, "isEqual:"))
      goto LABEL_118;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_118;
  }
  v16 = (__int16)self->_has;
  if ((v16 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x400) == 0 || self->_screenfulsFromTop != *((_DWORD *)v4 + 38))
      goto LABEL_118;
  }
  else if ((*((_WORD *)v4 + 90) & 0x400) != 0)
  {
    goto LABEL_118;
  }
  groupedIssueIds = self->_groupedIssueIds;
  if ((unint64_t)groupedIssueIds | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](groupedIssueIds, "isEqual:"))
      goto LABEL_118;
    v16 = (__int16)self->_has;
  }
  if ((v16 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x2000) != 0)
    {
      if (self->_isIssueContext)
      {
        if (!*((_BYTE *)v4 + 176))
          goto LABEL_118;
        goto LABEL_110;
      }
      if (!*((_BYTE *)v4 + 176))
        goto LABEL_110;
    }
LABEL_118:
    v22 = 0;
    goto LABEL_119;
  }
  if ((*((_WORD *)v4 + 90) & 0x2000) != 0)
    goto LABEL_118;
LABEL_110:
  sectionIds = self->_sectionIds;
  if ((unint64_t)sectionIds | *((_QWORD *)v4 + 20)
    && !-[NSMutableArray isEqual:](sectionIds, "isEqual:"))
  {
    goto LABEL_118;
  }
  curatedSubtype = self->_curatedSubtype;
  if ((unint64_t)curatedSubtype | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](curatedSubtype, "isEqual:"))
      goto LABEL_118;
  }
  curatedBatchId = self->_curatedBatchId;
  if ((unint64_t)curatedBatchId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](curatedBatchId, "isEqual:"))
      goto LABEL_118;
  }
  layoutIds = self->_layoutIds;
  if ((unint64_t)layoutIds | *((_QWORD *)v4 + 18))
    v22 = -[NSMutableArray isEqual:](layoutIds, "isEqual:");
  else
    v22 = 1;
LABEL_119:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  __int16 has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSUInteger v46;

  v46 = -[NSString hash](self->_groupFeedId, "hash");
  v3 = -[NSMutableArray hash](self->_groupedArticleIds, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
    v5 = 0;
    if ((has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v5 = 2654435761 * self->_groupDisplayRankInForYou;
  if ((has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_groupArticleCountInForYou;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_groupType;
    goto LABEL_8;
  }
LABEL_7:
  v7 = 0;
LABEL_8:
  v45 = v3;
  v43 = v6;
  v44 = v5;
  v42 = v7;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
    v34 = 2654435761 * self->_isSubscribedToGroupFeed;
  else
    v34 = 0;
  v8 = -[NSData hash](self->_feedViewExposureId, "hash");
  v9 = (__int16)self->_has;
  if ((v9 & 0x800) != 0)
  {
    v10 = 2654435761 * self->_topStoryMandatoryArticleCount;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_13:
      v11 = 2654435761 * self->_topStoryOptionalArticleCount;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_14;
      goto LABEL_20;
    }
  }
  else
  {
    v10 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_13;
  }
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    v12 = 2654435761 * self->_groupPresentationReason;
    if ((v9 & 0x20) != 0)
      goto LABEL_15;
    goto LABEL_21;
  }
LABEL_20:
  v12 = 0;
  if ((v9 & 0x20) != 0)
  {
LABEL_15:
    v13 = 2654435761 * self->_groupFormationReason;
    if ((v9 & 2) != 0)
      goto LABEL_16;
LABEL_22:
    v14 = 0;
    if ((*(_WORD *)&self->_has & 0x8000) != 0)
      goto LABEL_17;
    goto LABEL_23;
  }
LABEL_21:
  v13 = 0;
  if ((v9 & 2) == 0)
    goto LABEL_22;
LABEL_16:
  v14 = 2654435761 * self->_feedAutoSubscribeType;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    v15 = 2654435761 * self->_reachedEndOfGroup;
    goto LABEL_24;
  }
LABEL_23:
  v15 = 0;
LABEL_24:
  v40 = v10;
  v41 = v8;
  v38 = v12;
  v39 = v11;
  v36 = v14;
  v37 = v13;
  v35 = v15;
  if ((v9 & 1) != 0)
    v33 = 2654435761 * self->_curatedContentType;
  else
    v33 = 0;
  v16 = -[NSData hash](self->_groupViewExposureId, "hash");
  v17 = (__int16)self->_has;
  if ((v17 & 8) != 0)
  {
    v18 = 2654435761 * self->_groupDisplayMode;
    if ((v17 & 0x40) != 0)
      goto LABEL_29;
  }
  else
  {
    v18 = 0;
    if ((v17 & 0x40) != 0)
    {
LABEL_29:
      v19 = 2654435761 * self->_groupLocation;
      goto LABEL_32;
    }
  }
  v19 = 0;
LABEL_32:
  v20 = v16;
  if ((v17 & 0x80) != 0)
    v32 = 2654435761 * self->_groupLocationFeedType;
  else
    v32 = 0;
  v21 = -[NSString hash](self->_groupExposedInLocationId, "hash");
  v22 = -[NSString hash](self->_groupExposedInSourceChannelId, "hash");
  v23 = -[NSData hash](self->_articleViewingSessionId, "hash");
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v24 = 2654435761 * self->_screenfulsFromTop;
  else
    v24 = 0;
  v25 = -[NSMutableArray hash](self->_groupedIssueIds, "hash");
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
    v26 = 2654435761 * self->_isIssueContext;
  else
    v26 = 0;
  v27 = v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v34 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v33 ^ v20 ^ v18 ^ v19 ^ v32 ^ v21 ^ v22 ^ v23;
  v28 = v24 ^ v25 ^ v26 ^ -[NSMutableArray hash](self->_sectionIds, "hash");
  v29 = v27 ^ v28 ^ -[NSString hash](self->_curatedSubtype, "hash");
  v30 = -[NSString hash](self->_curatedBatchId, "hash");
  return v29 ^ v30 ^ -[NSMutableArray hash](self->_layoutIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 11))
    -[NTPBGroupViewExposure setGroupFeedId:](self, "setGroupFeedId:");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = *((id *)v4 + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        -[NTPBGroupViewExposure addGroupedArticleIds:](self, "addGroupedArticleIds:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 90);
  if ((v10 & 0x10) != 0)
  {
    self->_groupDisplayRankInForYou = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x10u;
    v10 = *((_WORD *)v4 + 90);
    if ((v10 & 4) == 0)
    {
LABEL_12:
      if ((v10 & 0x200) == 0)
        goto LABEL_13;
      goto LABEL_69;
    }
  }
  else if ((v10 & 4) == 0)
  {
    goto LABEL_12;
  }
  self->_groupArticleCountInForYou = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 4u;
  v10 = *((_WORD *)v4 + 90);
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_69:
  self->_groupType = *((_DWORD *)v4 + 28);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 90) & 0x4000) != 0)
  {
LABEL_14:
    self->_isSubscribedToGroupFeed = *((_BYTE *)v4 + 177);
    *(_WORD *)&self->_has |= 0x4000u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 6))
    -[NTPBGroupViewExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
  v11 = *((_WORD *)v4 + 90);
  if ((v11 & 0x800) != 0)
  {
    self->_topStoryMandatoryArticleCount = *((_DWORD *)v4 + 42);
    *(_WORD *)&self->_has |= 0x800u;
    v11 = *((_WORD *)v4 + 90);
    if ((v11 & 0x1000) == 0)
    {
LABEL_19:
      if ((v11 & 0x100) == 0)
        goto LABEL_20;
      goto LABEL_73;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x1000) == 0)
  {
    goto LABEL_19;
  }
  self->_topStoryOptionalArticleCount = *((_DWORD *)v4 + 43);
  *(_WORD *)&self->_has |= 0x1000u;
  v11 = *((_WORD *)v4 + 90);
  if ((v11 & 0x100) == 0)
  {
LABEL_20:
    if ((v11 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_74;
  }
LABEL_73:
  self->_groupPresentationReason = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_has |= 0x100u;
  v11 = *((_WORD *)v4 + 90);
  if ((v11 & 0x20) == 0)
  {
LABEL_21:
    if ((v11 & 2) == 0)
      goto LABEL_22;
    goto LABEL_75;
  }
LABEL_74:
  self->_groupFormationReason = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x20u;
  v11 = *((_WORD *)v4 + 90);
  if ((v11 & 2) == 0)
  {
LABEL_22:
    if ((v11 & 0x8000) == 0)
      goto LABEL_23;
    goto LABEL_76;
  }
LABEL_75:
  self->_feedAutoSubscribeType = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 2u;
  v11 = *((_WORD *)v4 + 90);
  if ((v11 & 0x8000) == 0)
  {
LABEL_23:
    if ((v11 & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_76:
  self->_reachedEndOfGroup = *((_BYTE *)v4 + 178);
  *(_WORD *)&self->_has |= 0x8000u;
  if ((*((_WORD *)v4 + 90) & 1) != 0)
  {
LABEL_24:
    self->_curatedContentType = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_25:
  if (*((_QWORD *)v4 + 15))
    -[NTPBGroupViewExposure setGroupViewExposureId:](self, "setGroupViewExposureId:");
  v12 = *((_WORD *)v4 + 90);
  if ((v12 & 8) != 0)
  {
    self->_groupDisplayMode = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 8u;
    v12 = *((_WORD *)v4 + 90);
    if ((v12 & 0x40) == 0)
    {
LABEL_29:
      if ((v12 & 0x80) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((v12 & 0x40) == 0)
  {
    goto LABEL_29;
  }
  self->_groupLocation = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 90) & 0x80) != 0)
  {
LABEL_30:
    self->_groupLocationFeedType = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_31:
  if (*((_QWORD *)v4 + 9))
    -[NTPBGroupViewExposure setGroupExposedInLocationId:](self, "setGroupExposedInLocationId:");
  if (*((_QWORD *)v4 + 10))
    -[NTPBGroupViewExposure setGroupExposedInSourceChannelId:](self, "setGroupExposedInSourceChannelId:");
  if (*((_QWORD *)v4 + 1))
    -[NTPBGroupViewExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  if ((*((_WORD *)v4 + 90) & 0x400) != 0)
  {
    self->_screenfulsFromTop = *((_DWORD *)v4 + 38);
    *(_WORD *)&self->_has |= 0x400u;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = *((id *)v4 + 17);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        -[NTPBGroupViewExposure addGroupedIssueIds:](self, "addGroupedIssueIds:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v15);
  }

  if ((*((_WORD *)v4 + 90) & 0x2000) != 0)
  {
    self->_isIssueContext = *((_BYTE *)v4 + 176);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = *((id *)v4 + 20);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        -[NTPBGroupViewExposure addSectionIds:](self, "addSectionIds:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v20);
  }

  if (*((_QWORD *)v4 + 4))
    -[NTPBGroupViewExposure setCuratedSubtype:](self, "setCuratedSubtype:");
  if (*((_QWORD *)v4 + 2))
    -[NTPBGroupViewExposure setCuratedBatchId:](self, "setCuratedBatchId:");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = *((id *)v4 + 18);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v29;
    do
    {
      for (m = 0; m != v25; ++m)
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v23);
        -[NTPBGroupViewExposure addLayoutIds:](self, "addLayoutIds:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * m), (_QWORD)v28);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    }
    while (v25);
  }

}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_groupFeedId, a3);
}

- (NSMutableArray)groupedArticleIds
{
  return self->_groupedArticleIds;
}

- (void)setGroupedArticleIds:(id)a3
{
  objc_storeStrong((id *)&self->_groupedArticleIds, a3);
}

- (int)groupDisplayRankInForYou
{
  return self->_groupDisplayRankInForYou;
}

- (int)groupArticleCountInForYou
{
  return self->_groupArticleCountInForYou;
}

- (BOOL)isSubscribedToGroupFeed
{
  return self->_isSubscribedToGroupFeed;
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (int)topStoryMandatoryArticleCount
{
  return self->_topStoryMandatoryArticleCount;
}

- (int)topStoryOptionalArticleCount
{
  return self->_topStoryOptionalArticleCount;
}

- (BOOL)reachedEndOfGroup
{
  return self->_reachedEndOfGroup;
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
}

- (NSString)groupExposedInLocationId
{
  return self->_groupExposedInLocationId;
}

- (void)setGroupExposedInLocationId:(id)a3
{
  objc_storeStrong((id *)&self->_groupExposedInLocationId, a3);
}

- (NSString)groupExposedInSourceChannelId
{
  return self->_groupExposedInSourceChannelId;
}

- (void)setGroupExposedInSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_groupExposedInSourceChannelId, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (int)screenfulsFromTop
{
  return self->_screenfulsFromTop;
}

- (NSMutableArray)groupedIssueIds
{
  return self->_groupedIssueIds;
}

- (void)setGroupedIssueIds:(id)a3
{
  objc_storeStrong((id *)&self->_groupedIssueIds, a3);
}

- (BOOL)isIssueContext
{
  return self->_isIssueContext;
}

- (NSMutableArray)sectionIds
{
  return self->_sectionIds;
}

- (void)setSectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIds, a3);
}

- (NSString)curatedSubtype
{
  return self->_curatedSubtype;
}

- (void)setCuratedSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_curatedSubtype, a3);
}

- (NSString)curatedBatchId
{
  return self->_curatedBatchId;
}

- (void)setCuratedBatchId:(id)a3
{
  objc_storeStrong((id *)&self->_curatedBatchId, a3);
}

- (NSMutableArray)layoutIds
{
  return self->_layoutIds;
}

- (void)setLayoutIds:(id)a3
{
  objc_storeStrong((id *)&self->_layoutIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIds, 0);
  objc_storeStrong((id *)&self->_layoutIds, 0);
  objc_storeStrong((id *)&self->_groupedIssueIds, 0);
  objc_storeStrong((id *)&self->_groupedArticleIds, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_groupExposedInSourceChannelId, 0);
  objc_storeStrong((id *)&self->_groupExposedInLocationId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_curatedSubtype, 0);
  objc_storeStrong((id *)&self->_curatedBatchId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
}

@end
