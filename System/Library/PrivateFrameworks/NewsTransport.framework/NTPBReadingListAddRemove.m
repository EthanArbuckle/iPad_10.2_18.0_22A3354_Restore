@implementation NTPBReadingListAddRemove

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (int)addRemoveReadingListLocation
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_addRemoveReadingListLocation;
  else
    return 0;
}

- (void)setAddRemoveReadingListLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_addRemoveReadingListLocation = a3;
}

- (void)setHasAddRemoveReadingListLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAddRemoveReadingListLocation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (int)articleType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasArticleType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD53220[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArticleType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEBVIEW_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLINT_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AD_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL_WEBLINK_ARTICLE_TYPE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCharacterCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_characterCount = a3;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCharacterCount
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)clearNamedEntities
{
  -[NSMutableArray removeAllObjects](self->_namedEntities, "removeAllObjects");
}

- (void)addNamedEntities:(id)a3
{
  id v4;
  NSMutableArray *namedEntities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  namedEntities = self->_namedEntities;
  v8 = v4;
  if (!namedEntities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_namedEntities;
    self->_namedEntities = v6;

    v4 = v8;
    namedEntities = self->_namedEntities;
  }
  -[NSMutableArray addObject:](namedEntities, "addObject:", v4);

}

- (unint64_t)namedEntitiesCount
{
  return -[NSMutableArray count](self->_namedEntities, "count");
}

- (id)namedEntitiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_namedEntities, "objectAtIndex:", a3);
}

+ (Class)namedEntitiesType
{
  return (Class)objc_opt_class();
}

- (void)setPublisherArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasSectionHeadlineId
{
  return self->_sectionHeadlineId != 0;
}

- (int)userAction
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUserAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasSurfacedByChannelId
{
  return self->_surfacedByChannelId != 0;
}

- (BOOL)hasSurfacedBySectionId
{
  return self->_surfacedBySectionId != 0;
}

- (BOOL)hasSurfacedByTopicId
{
  return self->_surfacedByTopicId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setIsDigitalReplicaAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)feedType
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFeedType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD53250[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedType:(id)a3
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

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsFreeArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isFreeArticle = a3;
}

- (void)setHasIsFreeArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsFreeArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
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

- (void)setIsNotificationArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isNotificationArticle = a3;
}

- (void)setHasIsNotificationArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsNotificationArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIsCoverArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isCoverArticle = a3;
}

- (void)setHasIsCoverArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsCoverArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setFromNextArticleAffordanceTap:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_fromNextArticleAffordanceTap = a3;
}

- (void)setHasFromNextArticleAffordanceTap:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasFromNextArticleAffordanceTap
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (int)nextArticleAffordanceType
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_nextArticleAffordanceType;
  else
    return 0;
}

- (void)setNextArticleAffordanceType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_nextArticleAffordanceType = a3;
}

- (void)setHasNextArticleAffordanceType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNextArticleAffordanceType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)nextArticleAffordanceTypeAsString:(int)a3
{
  if (a3 < 0x10)
    return off_24CD53300[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNextArticleAffordanceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISCOVER_MORE_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_SPOTLIGHT_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FROM_PUB_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_EDITORS_PICKS_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOPIC_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAILY_BRIEFINGS_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GREAT_STORIES_YOU_MISSED_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAVED_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_FOR_YOU_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAID_SUBSCRIPTION_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST_AND_GREATEST_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST_NEXT_ARTICLE_AFFORDANCE_TYPE")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasNextArticleAffordanceTypeFeedId
{
  return self->_nextArticleAffordanceTypeFeedId != 0;
}

- (void)setIsGroupedArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isGroupedArticle = a3;
}

- (void)setHasIsGroupedArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsGroupedArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (int)groupType
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasGroupType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD53380[a3];
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

- (void)setIsBreakingNewsArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isBreakingNewsArticle = a3;
}

- (void)setHasIsBreakingNewsArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int)topStoryType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    return self->_topStoryType;
  else
    return 0;
}

- (void)setTopStoryType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_topStoryType = a3;
}

- (void)setHasTopStoryType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTopStoryType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)topStoryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD534C0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTopStoryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TOP_STORY_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANDATORY_TOP_STORY_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OPTIONAL_TOP_STORY_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsTopStoryArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsTopStoryArticle
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsSearchResultArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isSearchResultArticle = a3;
}

- (void)setHasIsSearchResultArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsSearchResultArticle
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsNativeAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasNativeCampaignData
{
  return self->_nativeCampaignData != 0;
}

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
}

- (BOOL)hasPreviousArticleVersion
{
  return self->_previousArticleVersion != 0;
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

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasIadNativeCampaign
{
  return self->_iadNativeCampaign != 0;
}

- (BOOL)hasIadNativeLine
{
  return self->_iadNativeLine != 0;
}

- (BOOL)hasIadNativeAd
{
  return self->_iadNativeAd != 0;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasIadNativeCampaignAd
{
  return self->_iadNativeCampaignAd != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (int)contentType
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_contentType;
  else
    return 0;
}

- (void)setContentType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasContentType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD534D8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEED_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PDF_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_CONTENT_TYPE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasChannelData
{
  return self->_channelData != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBReadingListAddRemove;
  -[NTPBReadingListAddRemove description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBReadingListAddRemove dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleId;
  NSString *referencedArticleId;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has;
  void *v8;
  NSString *language;
  NSMutableArray *namedEntities;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v11;
  void *v12;
  void *v13;
  NSString *sectionHeadlineId;
  void *v15;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sourceChannelId;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v20;
  void *v21;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  void *v25;
  NSString *notificationId;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v27;
  void *v28;
  void *v29;
  uint64_t articleType;
  __CFString *v31;
  void *v32;
  uint64_t feedType;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t nextArticleAffordanceType;
  __CFString *v39;
  void *v40;
  NSString *nextArticleAffordanceTypeFeedId;
  void *v42;
  NSString *groupFeedId;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44;
  void *v45;
  NSString *nativeCampaignData;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v56;
  void *v57;
  void *v58;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  void *v62;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBIssueData *issueData;
  void *v66;
  NTPBIssueExposureData *issueExposureData;
  void *v68;
  uint64_t contentType;
  __CFString *v70;
  uint64_t groupType;
  __CFString *v72;
  NTPBChannelData *channelData;
  void *v74;
  NSMutableArray *topicIds;
  id v76;
  void *v78;
  uint64_t topStoryType;
  __CFString *v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v4, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_addRemoveReadingListLocation);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("add_remove_reading_list_location"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("is_user_subscribed_to_feed"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_52:
  articleType = self->_articleType;
  if (articleType >= 6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_24CD53220[articleType];
  }
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("article_type"));

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_characterCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("character_count"));

  }
LABEL_10:
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v4, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("publisher_article_version"));

    v11 = self->_has;
  }
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("backend_article_version"));

  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if (sectionHeadlineId)
    objc_msgSend(v4, "setObject:forKey:", sectionHeadlineId, CFSTR("section_headline_id"));
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("user_action"));

  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId)
    objc_msgSend(v4, "setObject:forKey:", surfacedByChannelId, CFSTR("surfaced_by_channel_id"));
  surfacedBySectionId = self->_surfacedBySectionId;
  if (surfacedBySectionId)
    objc_msgSend(v4, "setObject:forKey:", surfacedBySectionId, CFSTR("surfaced_by_section_id"));
  surfacedByTopicId = self->_surfacedByTopicId;
  if (surfacedByTopicId)
    objc_msgSend(v4, "setObject:forKey:", surfacedByTopicId, CFSTR("surfaced_by_topic_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDigitalReplicaAd);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("is_digital_replica_ad"));

    v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x200) == 0)
    {
LABEL_32:
      if ((*(_BYTE *)&v20 & 2) == 0)
        goto LABEL_33;
      goto LABEL_67;
    }
  }
  else if ((*(_WORD *)&v20 & 0x200) == 0)
  {
    goto LABEL_32;
  }
  feedType = self->_feedType;
  if (feedType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_24CD53250[feedType];
  }
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("feed_type"));

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 2) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v20 & 0x80000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("personalization_treatment_id"));

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_34:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFreeArticle);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("is_free_article"));

  }
LABEL_35:
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v4, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v4, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v4, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNotificationArticle);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("is_notification_article"));

  }
  notificationId = self->_notificationId;
  if (notificationId)
    objc_msgSend(v4, "setObject:forKey:", notificationId, CFSTR("notification_id"));
  v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToSourceChannel);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("is_paid_subscriber_to_source_channel"));

    v27 = self->_has;
    if ((*(_DWORD *)&v27 & 0x20000) == 0)
    {
LABEL_47:
      if ((*(_WORD *)&v27 & 0x8000) == 0)
        goto LABEL_48;
      goto LABEL_59;
    }
  }
  else if ((*(_DWORD *)&v27 & 0x20000) == 0)
  {
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCoverArticle);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("is_cover_article"));

  v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x8000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v27 & 0x800) == 0)
      goto LABEL_71;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fromNextArticleAffordanceTap);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("from_next_article_affordance_tap"));

  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    goto LABEL_71;
LABEL_60:
  nextArticleAffordanceType = self->_nextArticleAffordanceType;
  if (nextArticleAffordanceType >= 0x10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_nextArticleAffordanceType);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = off_24CD53300[nextArticleAffordanceType];
  }
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("next_article_affordance_type"));

LABEL_71:
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if (nextArticleAffordanceTypeFeedId)
    objc_msgSend(v4, "setObject:forKey:", nextArticleAffordanceTypeFeedId, CFSTR("next_article_affordance_type_feed_id"));
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isGroupedArticle);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("is_grouped_article"));

  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v4, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x400) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = off_24CD53380[groupType];
    }
    objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("group_type"));

    v44 = self->_has;
    if ((*(_DWORD *)&v44 & 0x10000) == 0)
    {
LABEL_79:
      if ((*(_WORD *)&v44 & 0x2000) == 0)
        goto LABEL_80;
      goto LABEL_134;
    }
  }
  else if ((*(_DWORD *)&v44 & 0x10000) == 0)
  {
    goto LABEL_79;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBreakingNewsArticle);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("is_breaking_news_article"));

  v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x2000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v44 & 0x2000000) == 0)
      goto LABEL_81;
    goto LABEL_138;
  }
LABEL_134:
  topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_topStoryType);
    v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v80 = off_24CD534C0[topStoryType];
  }
  objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("top_story_type"));

  v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x2000000) == 0)
  {
LABEL_81:
    if ((*(_DWORD *)&v44 & 0x1000000) == 0)
      goto LABEL_82;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isTopStoryArticle);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v81, CFSTR("is_top_story_article"));

  v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x1000000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v44 & 0x200000) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSearchResultArticle);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("is_search_result_article"));

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_83:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNativeAd);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("is_native_ad"));

  }
LABEL_84:
  nativeCampaignData = self->_nativeCampaignData;
  if (nativeCampaignData)
    objc_msgSend(v4, "setObject:forKey:", nativeCampaignData, CFSTR("native_campaign_data"));
  previousArticleId = self->_previousArticleId;
  if (previousArticleId)
    objc_msgSend(v4, "setObject:forKey:", previousArticleId, CFSTR("previous_article_id"));
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion)
    objc_msgSend(v4, "setObject:forKey:", previousArticleVersion, CFSTR("previous_article_version"));
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v50 = self->_fractionalCohortMemberships;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v84 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "dictionaryRepresentation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v55);

        }
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
      }
      while (v52);
    }

    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("fractional_cohort_membership"));
  }
  v56 = self->_has;
  if ((*(_BYTE *)&v56 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("publisher_article_version_int64"));

    v56 = self->_has;
  }
  if ((*(_BYTE *)&v56 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("backend_article_version_int64"));

  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if (iadNativeCampaign)
    objc_msgSend(v4, "setObject:forKey:", iadNativeCampaign, CFSTR("iad_native_campaign"));
  iadNativeLine = self->_iadNativeLine;
  if (iadNativeLine)
    objc_msgSend(v4, "setObject:forKey:", iadNativeLine, CFSTR("iad_native_line"));
  iadNativeAd = self->_iadNativeAd;
  if (iadNativeAd)
    objc_msgSend(v4, "setObject:forKey:", iadNativeAd, CFSTR("iad_native_ad"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("previous_article_publisher_article_version"));

  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd)
    objc_msgSend(v4, "setObject:forKey:", iadNativeCampaignAd, CFSTR("iad_native_campaign_ad"));
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v68, CFSTR("issue_exposure_data"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    contentType = self->_contentType;
    if (contentType >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_contentType);
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = off_24CD534D8[contentType];
    }
    objc_msgSend(v4, "setObject:forKey:", v70, CFSTR("content_type"));

  }
  channelData = self->_channelData;
  if (channelData)
  {
    -[NTPBChannelData dictionaryRepresentation](channelData, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("channel_data"));

  }
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v4, "setObject:forKey:", topicIds, CFSTR("topic_ids"));
  v76 = v4;

  return v76;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBReadingListAddRemoveReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v11;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v12;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v13;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_referencedArticleId)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_115;
    }
  }
  else if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_115:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:
  if (self->_language)
    PBDataWriterWriteStringField();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = self->_namedEntities;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v8);
  }

  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = self->_has;
  }
  if ((*(_BYTE *)&v11 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x200) == 0)
    {
LABEL_37:
      if ((*(_BYTE *)&v12 & 2) == 0)
        goto LABEL_38;
      goto LABEL_119;
    }
  }
  else if ((*(_WORD *)&v12 & 0x200) == 0)
  {
    goto LABEL_37;
  }
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 2) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v12 & 0x80000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_119:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
LABEL_39:
    PBDataWriterWriteBOOLField();
LABEL_40:
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_notificationId)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x20000) == 0)
    {
LABEL_52:
      if ((*(_WORD *)&v13 & 0x8000) == 0)
        goto LABEL_53;
      goto LABEL_123;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteBOOLField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v13 & 0x800) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_123:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
LABEL_54:
    PBDataWriterWriteInt32Field();
LABEL_55:
  if (self->_nextArticleAffordanceTypeFeedId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
    {
LABEL_63:
      if ((*(_WORD *)&v14 & 0x2000) == 0)
        goto LABEL_64;
      goto LABEL_127;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
    goto LABEL_63;
  }
  PBDataWriterWriteBOOLField();
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0)
      goto LABEL_65;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt32Field();
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      goto LABEL_66;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteBOOLField();
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v14 & 0x200000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_129:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
LABEL_67:
    PBDataWriterWriteBOOLField();
LABEL_68:
  if (self->_nativeCampaignData)
    PBDataWriterWriteStringField();
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_fractionalCohortMemberships;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v17);
  }

  v20 = self->_has;
  if ((*(_BYTE *)&v20 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v20 = self->_has;
  }
  if ((*(_BYTE *)&v20 & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_iadNativeCampaign)
    PBDataWriterWriteStringField();
  if (self->_iadNativeLine)
    PBDataWriterWriteStringField();
  if (self->_iadNativeAd)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_iadNativeCampaignAd)
    PBDataWriterWriteStringField();
  if (self->_groupViewExposureId)
    PBDataWriterWriteDataField();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueExposureData)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_channelData)
    PBDataWriterWriteSubmessage();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = self->_topicIds;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        PBDataWriterWriteStringField();
        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v23);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v19;
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
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  NSMutableArray *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v8;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_addRemoveReadingListLocation;
    *(_DWORD *)(v5 + 344) |= 0x10u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x4000000) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_65;
    }
  }
  else if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 343) = self->_isUserSubscribedToFeed;
  *(_DWORD *)(v5 + 344) |= 0x4000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_65:
  *(_DWORD *)(v5 + 56) = self->_articleType;
  *(_DWORD *)(v5 + 344) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 88) = self->_characterCount;
    *(_DWORD *)(v5 + 344) |= 0x80u;
  }
LABEL_6:
  v11 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v11;

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v13 = self->_namedEntities;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v90;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v90 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addNamedEntities:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    }
    while (v15);
  }

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_publisherArticleVersion;
    *(_DWORD *)(v5 + 344) |= 0x1000u;
    v19 = self->_has;
  }
  if ((*(_BYTE *)&v19 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_backendArticleVersion;
    *(_DWORD *)(v5 + 344) |= 0x40u;
  }
  v20 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v20;

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 328) = self->_userAction;
    *(_DWORD *)(v5 + 344) |= 0x4000u;
  }
  v22 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v22;

  v24 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v24;

  v26 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v26;

  v28 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v28;

  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x40000) != 0)
  {
    *(_BYTE *)(v5 + 335) = self->_isDigitalReplicaAd;
    *(_DWORD *)(v5 + 344) |= 0x40000u;
    v30 = self->_has;
    if ((*(_WORD *)&v30 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v30 & 2) == 0)
        goto LABEL_22;
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&v30 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  *(_DWORD *)(v5 + 104) = self->_feedType;
  *(_DWORD *)(v5 + 344) |= 0x200u;
  v30 = self->_has;
  if ((*(_BYTE *)&v30 & 2) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v30 & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_69:
  *(_QWORD *)(v5 + 16) = self->_personalizationTreatmentId;
  *(_DWORD *)(v5 + 344) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_23:
    *(_BYTE *)(v5 + 336) = self->_isFreeArticle;
    *(_DWORD *)(v5 + 344) |= 0x80000u;
  }
LABEL_24:
  v31 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v31;

  v33 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v33;

  v35 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v35;

  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 339) = self->_isNotificationArticle;
    *(_DWORD *)(v5 + 344) |= 0x400000u;
  }
  v37 = -[NSString copyWithZone:](self->_notificationId, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v37;

  v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x800000) != 0)
  {
    *(_BYTE *)(v5 + 340) = self->_isPaidSubscriberToSourceChannel;
    *(_DWORD *)(v5 + 344) |= 0x800000u;
    v39 = self->_has;
    if ((*(_DWORD *)&v39 & 0x20000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v39 & 0x8000) == 0)
        goto LABEL_29;
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v39 & 0x20000) == 0)
  {
    goto LABEL_28;
  }
  *(_BYTE *)(v5 + 334) = self->_isCoverArticle;
  *(_DWORD *)(v5 + 344) |= 0x20000u;
  v39 = self->_has;
  if ((*(_WORD *)&v39 & 0x8000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v39 & 0x800) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_73:
  *(_BYTE *)(v5 + 332) = self->_fromNextArticleAffordanceTap;
  *(_DWORD *)(v5 + 344) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_30:
    *(_DWORD *)(v5 + 216) = self->_nextArticleAffordanceType;
    *(_DWORD *)(v5 + 344) |= 0x800u;
  }
LABEL_31:
  v40 = -[NSString copyWithZone:](self->_nextArticleAffordanceTypeFeedId, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v40;

  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 337) = self->_isGroupedArticle;
    *(_DWORD *)(v5 + 344) |= 0x100000u;
  }
  v42 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v42;

  v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_groupType;
    *(_DWORD *)(v5 + 344) |= 0x400u;
    v44 = self->_has;
    if ((*(_DWORD *)&v44 & 0x10000) == 0)
    {
LABEL_35:
      if ((*(_WORD *)&v44 & 0x2000) == 0)
        goto LABEL_36;
      goto LABEL_77;
    }
  }
  else if ((*(_DWORD *)&v44 & 0x10000) == 0)
  {
    goto LABEL_35;
  }
  *(_BYTE *)(v5 + 333) = self->_isBreakingNewsArticle;
  *(_DWORD *)(v5 + 344) |= 0x10000u;
  v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x2000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v44 & 0x2000000) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 312) = self->_topStoryType;
  *(_DWORD *)(v5 + 344) |= 0x2000u;
  v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x2000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v44 & 0x1000000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  *(_BYTE *)(v5 + 342) = self->_isTopStoryArticle;
  *(_DWORD *)(v5 + 344) |= 0x2000000u;
  v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x1000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v44 & 0x200000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_79:
  *(_BYTE *)(v5 + 341) = self->_isSearchResultArticle;
  *(_DWORD *)(v5 + 344) |= 0x1000000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_39:
    *(_BYTE *)(v5 + 338) = self->_isNativeAd;
    *(_DWORD *)(v5 + 344) |= 0x200000u;
  }
LABEL_40:
  v45 = -[NSString copyWithZone:](self->_nativeCampaignData, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v45;

  v47 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v47;

  v49 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v49;

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v51 = self->_fractionalCohortMemberships;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v86;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v86 != v54)
          objc_enumerationMutation(v51);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * v55), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addFractionalCohortMembership:", v56);

        ++v55;
      }
      while (v53 != v55);
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    }
    while (v53);
  }

  v57 = self->_has;
  if ((*(_BYTE *)&v57 & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_publisherArticleVersionInt64;
    *(_DWORD *)(v5 + 344) |= 8u;
    v57 = self->_has;
  }
  if ((*(_BYTE *)&v57 & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_backendArticleVersionInt64;
    *(_DWORD *)(v5 + 344) |= 1u;
  }
  v58 = -[NSString copyWithZone:](self->_iadNativeCampaign, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v58;

  v60 = -[NSString copyWithZone:](self->_iadNativeLine, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v60;

  v62 = -[NSString copyWithZone:](self->_iadNativeAd, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v62;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v5 + 344) |= 4u;
  }
  v64 = -[NSString copyWithZone:](self->_iadNativeCampaignAd, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v64;

  v66 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v66;

  v68 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v68;

  v70 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v71 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v70;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_contentType;
    *(_DWORD *)(v5 + 344) |= 0x100u;
  }
  v72 = -[NTPBChannelData copyWithZone:](self->_channelData, "copyWithZone:", a3);
  v73 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v72;

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v74 = self->_topicIds;
  v75 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v82;
    do
    {
      v78 = 0;
      do
      {
        if (*(_QWORD *)v82 != v77)
          objc_enumerationMutation(v74);
        v79 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * v78), "copyWithZone:", a3, (_QWORD)v81);
        objc_msgSend((id)v5, "addTopicIds:", v79);

        ++v78;
      }
      while (v76 != v78);
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    }
    while (v76);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSString *referencedArticleId;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has;
  int v8;
  NSString *language;
  NSMutableArray *namedEntities;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v11;
  int v12;
  NSString *sectionHeadlineId;
  int v14;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sourceChannelId;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v19;
  int v20;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v24;
  int v25;
  NSString *notificationId;
  int v27;
  NSString *nextArticleAffordanceTypeFeedId;
  int v29;
  NSString *groupFeedId;
  int v31;
  NSString *nativeCampaignData;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NSMutableArray *fractionalCohortMemberships;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v36;
  int v37;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  int v41;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  int v46;
  NTPBChannelData *channelData;
  NSMutableArray *topicIds;
  char v49;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_233;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_233;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_233;
  }
  has = self->_has;
  v8 = *((_DWORD *)v4 + 86);
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_addRemoveReadingListLocation != *((_DWORD *)v4 + 10))
      goto LABEL_233;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0)
      goto LABEL_233;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 343))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 343))
    {
      goto LABEL_233;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_articleType != *((_DWORD *)v4 + 14))
      goto LABEL_233;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_characterCount != *((_DWORD *)v4 + 22))
      goto LABEL_233;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_233;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 24) && !-[NSString isEqual:](language, "isEqual:"))
    goto LABEL_233;
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_233;
  }
  v11 = self->_has;
  v12 = *((_DWORD *)v4 + 86);
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 64))
      goto LABEL_233;
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 15))
      goto LABEL_233;
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_233;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_233;
    v11 = self->_has;
  }
  v14 = *((_DWORD *)v4 + 86);
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0 || self->_userAction != *((_DWORD *)v4 + 82))
      goto LABEL_233;
  }
  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_233;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 36)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_233;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_233;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_233;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_233;
  }
  v19 = self->_has;
  v20 = *((_DWORD *)v4 + 86);
  if ((*(_DWORD *)&v19 & 0x40000) != 0)
  {
    if ((v20 & 0x40000) == 0)
      goto LABEL_233;
    if (self->_isDigitalReplicaAd)
    {
      if (!*((_BYTE *)v4 + 335))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 335))
    {
      goto LABEL_233;
    }
  }
  else if ((v20 & 0x40000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v19 & 0x200) != 0)
  {
    if ((v20 & 0x200) == 0 || self->_feedType != *((_DWORD *)v4 + 26))
      goto LABEL_233;
  }
  else if ((v20 & 0x200) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&v19 & 2) != 0)
  {
    if ((v20 & 2) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 2))
      goto LABEL_233;
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v19 & 0x80000) != 0)
  {
    if ((v20 & 0x80000) == 0)
      goto LABEL_233;
    if (self->_isFreeArticle)
    {
      if (!*((_BYTE *)v4 + 336))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 336))
    {
      goto LABEL_233;
    }
  }
  else if ((v20 & 0x80000) != 0)
  {
    goto LABEL_233;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](campaignId, "isEqual:"))
    goto LABEL_233;
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_233;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_233;
  }
  v24 = self->_has;
  v25 = *((_DWORD *)v4 + 86);
  if ((*(_DWORD *)&v24 & 0x400000) != 0)
  {
    if ((v25 & 0x400000) == 0)
      goto LABEL_233;
    if (self->_isNotificationArticle)
    {
      if (!*((_BYTE *)v4 + 339))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 339))
    {
      goto LABEL_233;
    }
  }
  else if ((v25 & 0x400000) != 0)
  {
    goto LABEL_233;
  }
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](notificationId, "isEqual:"))
      goto LABEL_233;
    v24 = self->_has;
  }
  v27 = *((_DWORD *)v4 + 86);
  if ((*(_DWORD *)&v24 & 0x800000) != 0)
  {
    if ((v27 & 0x800000) == 0)
      goto LABEL_233;
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((_BYTE *)v4 + 340))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 340))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x800000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x20000) != 0)
  {
    if ((v27 & 0x20000) == 0)
      goto LABEL_233;
    if (self->_isCoverArticle)
    {
      if (!*((_BYTE *)v4 + 334))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 334))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x20000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v24 & 0x8000) != 0)
  {
    if ((v27 & 0x8000) == 0)
      goto LABEL_233;
    if (self->_fromNextArticleAffordanceTap)
    {
      if (!*((_BYTE *)v4 + 332))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 332))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x8000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v24 & 0x800) != 0)
  {
    if ((v27 & 0x800) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 54))
      goto LABEL_233;
  }
  else if ((v27 & 0x800) != 0)
  {
    goto LABEL_233;
  }
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if ((unint64_t)nextArticleAffordanceTypeFeedId | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](nextArticleAffordanceTypeFeedId, "isEqual:"))
      goto LABEL_233;
    v24 = self->_has;
  }
  v29 = *((_DWORD *)v4 + 86);
  if ((*(_DWORD *)&v24 & 0x100000) != 0)
  {
    if ((v29 & 0x100000) == 0)
      goto LABEL_233;
    if (self->_isGroupedArticle)
    {
      if (!*((_BYTE *)v4 + 337))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 337))
    {
      goto LABEL_233;
    }
  }
  else if ((v29 & 0x100000) != 0)
  {
    goto LABEL_233;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_233;
    v24 = self->_has;
  }
  v31 = *((_DWORD *)v4 + 86);
  if ((*(_WORD *)&v24 & 0x400) != 0)
  {
    if ((v31 & 0x400) == 0 || self->_groupType != *((_DWORD *)v4 + 32))
      goto LABEL_233;
  }
  else if ((v31 & 0x400) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    if ((v31 & 0x10000) == 0)
      goto LABEL_233;
    if (self->_isBreakingNewsArticle)
    {
      if (!*((_BYTE *)v4 + 333))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 333))
    {
      goto LABEL_233;
    }
  }
  else if ((v31 & 0x10000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v24 & 0x2000) != 0)
  {
    if ((v31 & 0x2000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 78))
      goto LABEL_233;
  }
  else if ((v31 & 0x2000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x2000000) != 0)
  {
    if ((v31 & 0x2000000) == 0)
      goto LABEL_233;
    if (self->_isTopStoryArticle)
    {
      if (!*((_BYTE *)v4 + 342))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 342))
    {
      goto LABEL_233;
    }
  }
  else if ((v31 & 0x2000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x1000000) != 0)
  {
    if ((v31 & 0x1000000) == 0)
      goto LABEL_233;
    if (self->_isSearchResultArticle)
    {
      if (!*((_BYTE *)v4 + 341))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 341))
    {
      goto LABEL_233;
    }
  }
  else if ((v31 & 0x1000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x200000) != 0)
  {
    if ((v31 & 0x200000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((_BYTE *)v4 + 338))
          goto LABEL_233;
        goto LABEL_187;
      }
      if (!*((_BYTE *)v4 + 338))
        goto LABEL_187;
    }
LABEL_233:
    v49 = 0;
    goto LABEL_234;
  }
  if ((v31 & 0x200000) != 0)
    goto LABEL_233;
LABEL_187:
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((_QWORD *)v4 + 26)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_233;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_233;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_233;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
      goto LABEL_233;
  }
  v36 = self->_has;
  v37 = *((_DWORD *)v4 + 86);
  if ((*(_BYTE *)&v36 & 8) != 0)
  {
    if ((v37 & 8) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 4))
      goto LABEL_233;
  }
  else if ((v37 & 8) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&v36 & 1) != 0)
  {
    if ((v37 & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_233;
  }
  else if ((v37 & 1) != 0)
  {
    goto LABEL_233;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((_QWORD *)v4 + 19)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_233;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:"))
      goto LABEL_233;
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:"))
      goto LABEL_233;
  }
  v41 = *((_DWORD *)v4 + 86);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v41 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 3))
      goto LABEL_233;
  }
  else if ((v41 & 4) != 0)
  {
    goto LABEL_233;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((_QWORD *)v4 + 20)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_233;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_233;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 22))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_233;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 23))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_233;
  }
  v46 = *((_DWORD *)v4 + 86);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    if ((v46 & 0x100) == 0 || self->_contentType != *((_DWORD *)v4 + 23))
      goto LABEL_233;
  }
  else if ((v46 & 0x100) != 0)
  {
    goto LABEL_233;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((_QWORD *)v4 + 10) && !-[NTPBChannelData isEqual:](channelData, "isEqual:"))
    goto LABEL_233;
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 40))
    v49 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  else
    v49 = 1;
LABEL_234:

  return v49;
}

- (unint64_t)hash
{
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v4;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v5;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v6;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v7;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSUInteger v32;
  uint64_t v33;
  NSUInteger v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  uint64_t v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  uint64_t v52;
  NSUInteger v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSUInteger v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSUInteger v62;
  NSUInteger v63;

  v63 = -[NSString hash](self->_articleId, "hash");
  v62 = -[NSString hash](self->_referencedArticleId, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    v61 = 2654435761 * self->_addRemoveReadingListLocation;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
LABEL_3:
      v60 = 2654435761 * self->_isUserSubscribedToFeed;
      if ((*(_BYTE *)&has & 0x20) != 0)
        goto LABEL_4;
LABEL_8:
      v59 = 0;
      if ((*(_BYTE *)&has & 0x80) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v61 = 0;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
      goto LABEL_3;
  }
  v60 = 0;
  if ((*(_BYTE *)&has & 0x20) == 0)
    goto LABEL_8;
LABEL_4:
  v59 = 2654435761 * self->_articleType;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_5:
    v58 = 2654435761 * self->_characterCount;
    goto LABEL_10;
  }
LABEL_9:
  v58 = 0;
LABEL_10:
  v57 = -[NSString hash](self->_language, "hash");
  v56 = -[NSMutableArray hash](self->_namedEntities, "hash");
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
    v55 = 2654435761 * self->_publisherArticleVersion;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_12;
  }
  else
  {
    v55 = 0;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
    {
LABEL_12:
      v54 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_15;
    }
  }
  v54 = 0;
LABEL_15:
  v53 = -[NSString hash](self->_sectionHeadlineId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v52 = 2654435761 * self->_userAction;
  else
    v52 = 0;
  v51 = -[NSString hash](self->_surfacedByChannelId, "hash");
  v50 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v49 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v48 = -[NSString hash](self->_sourceChannelId, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    v47 = 2654435761 * self->_isDigitalReplicaAd;
    if ((*(_WORD *)&v5 & 0x200) != 0)
    {
LABEL_20:
      v46 = 2654435761 * self->_feedType;
      if ((*(_BYTE *)&v5 & 2) != 0)
        goto LABEL_21;
LABEL_25:
      v45 = 0;
      if ((*(_DWORD *)&v5 & 0x80000) != 0)
        goto LABEL_22;
      goto LABEL_26;
    }
  }
  else
  {
    v47 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0)
      goto LABEL_20;
  }
  v46 = 0;
  if ((*(_BYTE *)&v5 & 2) == 0)
    goto LABEL_25;
LABEL_21:
  v45 = 2654435761 * self->_personalizationTreatmentId;
  if ((*(_DWORD *)&v5 & 0x80000) != 0)
  {
LABEL_22:
    v44 = 2654435761 * self->_isFreeArticle;
    goto LABEL_27;
  }
LABEL_26:
  v44 = 0;
LABEL_27:
  v43 = -[NSString hash](self->_campaignId, "hash");
  v42 = -[NSString hash](self->_campaignType, "hash");
  v41 = -[NSString hash](self->_creativeId, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    v40 = 2654435761 * self->_isNotificationArticle;
  else
    v40 = 0;
  v39 = -[NSString hash](self->_notificationId, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    v38 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
    if ((*(_DWORD *)&v6 & 0x20000) != 0)
    {
LABEL_32:
      v37 = 2654435761 * self->_isCoverArticle;
      if ((*(_WORD *)&v6 & 0x8000) != 0)
        goto LABEL_33;
LABEL_37:
      v36 = 0;
      if ((*(_WORD *)&v6 & 0x800) != 0)
        goto LABEL_34;
      goto LABEL_38;
    }
  }
  else
  {
    v38 = 0;
    if ((*(_DWORD *)&v6 & 0x20000) != 0)
      goto LABEL_32;
  }
  v37 = 0;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
    goto LABEL_37;
LABEL_33:
  v36 = 2654435761 * self->_fromNextArticleAffordanceTap;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_34:
    v35 = 2654435761 * self->_nextArticleAffordanceType;
    goto LABEL_39;
  }
LABEL_38:
  v35 = 0;
LABEL_39:
  v34 = -[NSString hash](self->_nextArticleAffordanceTypeFeedId, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    v33 = 2654435761 * self->_isGroupedArticle;
  else
    v33 = 0;
  v32 = -[NSString hash](self->_groupFeedId, "hash");
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    v31 = 2654435761 * self->_groupType;
    if ((*(_DWORD *)&v7 & 0x10000) != 0)
    {
LABEL_44:
      v30 = 2654435761 * self->_isBreakingNewsArticle;
      if ((*(_WORD *)&v7 & 0x2000) != 0)
        goto LABEL_45;
      goto LABEL_51;
    }
  }
  else
  {
    v31 = 0;
    if ((*(_DWORD *)&v7 & 0x10000) != 0)
      goto LABEL_44;
  }
  v30 = 0;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
LABEL_45:
    v29 = 2654435761 * self->_topStoryType;
    if ((*(_DWORD *)&v7 & 0x2000000) != 0)
      goto LABEL_46;
    goto LABEL_52;
  }
LABEL_51:
  v29 = 0;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
LABEL_46:
    v28 = 2654435761 * self->_isTopStoryArticle;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0)
      goto LABEL_47;
LABEL_53:
    v27 = 0;
    if ((*(_DWORD *)&v7 & 0x200000) != 0)
      goto LABEL_48;
    goto LABEL_54;
  }
LABEL_52:
  v28 = 0;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
    goto LABEL_53;
LABEL_47:
  v27 = 2654435761 * self->_isSearchResultArticle;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
LABEL_48:
    v26 = 2654435761 * self->_isNativeAd;
    goto LABEL_55;
  }
LABEL_54:
  v26 = 0;
LABEL_55:
  v25 = -[NSString hash](self->_nativeCampaignData, "hash");
  v24 = -[NSString hash](self->_previousArticleId, "hash");
  v23 = -[NSString hash](self->_previousArticleVersion, "hash");
  v22 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 8) != 0)
  {
    v21 = 2654435761 * self->_publisherArticleVersionInt64;
    if ((*(_BYTE *)&v8 & 1) != 0)
      goto LABEL_57;
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&v8 & 1) != 0)
    {
LABEL_57:
      v20 = 2654435761 * self->_backendArticleVersionInt64;
      goto LABEL_60;
    }
  }
  v20 = 0;
LABEL_60:
  v9 = -[NSString hash](self->_iadNativeCampaign, "hash");
  v10 = -[NSString hash](self->_iadNativeLine, "hash");
  v11 = -[NSString hash](self->_iadNativeAd, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v12 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_iadNativeCampaignAd, "hash");
  v14 = -[NSData hash](self->_groupViewExposureId, "hash");
  v15 = -[NTPBIssueData hash](self->_issueData, "hash");
  v16 = -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v17 = 2654435761 * self->_contentType;
  else
    v17 = 0;
  v18 = v62 ^ v63 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NTPBChannelData hash](self->_channelData, "hash");
  return v18 ^ -[NSMutableArray hash](self->_topicIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  int v12;
  int v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  int v20;
  NTPBIssueData *issueData;
  uint64_t v22;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v24;
  NTPBChannelData *channelData;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
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
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[NTPBReadingListAddRemove setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v4 + 33))
    -[NTPBReadingListAddRemove setReferencedArticleId:](self, "setReferencedArticleId:");
  v5 = *((_DWORD *)v4 + 86);
  if ((v5 & 0x10) != 0)
  {
    self->_addRemoveReadingListLocation = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x10u;
    v5 = *((_DWORD *)v4 + 86);
    if ((v5 & 0x4000000) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_102;
    }
  }
  else if ((v5 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  self->_isUserSubscribedToFeed = *((_BYTE *)v4 + 343);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v5 = *((_DWORD *)v4 + 86);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_102:
  self->_articleType = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 86) & 0x80) != 0)
  {
LABEL_9:
    self->_characterCount = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_10:
  if (*((_QWORD *)v4 + 24))
    -[NTPBReadingListAddRemove setLanguage:](self, "setLanguage:");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = *((id *)v4 + 25);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v6);
        -[NTPBReadingListAddRemove addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v8);
  }

  v11 = *((_DWORD *)v4 + 86);
  if ((v11 & 0x1000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v4 + 64);
    *(_DWORD *)&self->_has |= 0x1000u;
    v11 = *((_DWORD *)v4 + 86);
  }
  if ((v11 & 0x40) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 34))
    -[NTPBReadingListAddRemove setSectionHeadlineId:](self, "setSectionHeadlineId:");
  if ((*((_BYTE *)v4 + 345) & 0x40) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 82);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((_QWORD *)v4 + 36))
    -[NTPBReadingListAddRemove setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v4 + 37))
    -[NTPBReadingListAddRemove setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v4 + 38))
    -[NTPBReadingListAddRemove setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v4 + 35))
    -[NTPBReadingListAddRemove setSourceChannelId:](self, "setSourceChannelId:");
  v12 = *((_DWORD *)v4 + 86);
  if ((v12 & 0x40000) != 0)
  {
    self->_isDigitalReplicaAd = *((_BYTE *)v4 + 335);
    *(_DWORD *)&self->_has |= 0x40000u;
    v12 = *((_DWORD *)v4 + 86);
    if ((v12 & 0x200) == 0)
    {
LABEL_37:
      if ((v12 & 2) == 0)
        goto LABEL_38;
      goto LABEL_106;
    }
  }
  else if ((v12 & 0x200) == 0)
  {
    goto LABEL_37;
  }
  self->_feedType = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x200u;
  v12 = *((_DWORD *)v4 + 86);
  if ((v12 & 2) == 0)
  {
LABEL_38:
    if ((v12 & 0x80000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_106:
  self->_personalizationTreatmentId = *((_QWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 86) & 0x80000) != 0)
  {
LABEL_39:
    self->_isFreeArticle = *((_BYTE *)v4 + 336);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_40:
  if (*((_QWORD *)v4 + 8))
    -[NTPBReadingListAddRemove setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v4 + 9))
    -[NTPBReadingListAddRemove setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v4 + 12))
    -[NTPBReadingListAddRemove setCreativeId:](self, "setCreativeId:");
  if ((*((_BYTE *)v4 + 346) & 0x40) != 0)
  {
    self->_isNotificationArticle = *((_BYTE *)v4 + 339);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
  if (*((_QWORD *)v4 + 29))
    -[NTPBReadingListAddRemove setNotificationId:](self, "setNotificationId:");
  v13 = *((_DWORD *)v4 + 86);
  if ((v13 & 0x800000) != 0)
  {
    self->_isPaidSubscriberToSourceChannel = *((_BYTE *)v4 + 340);
    *(_DWORD *)&self->_has |= 0x800000u;
    v13 = *((_DWORD *)v4 + 86);
    if ((v13 & 0x20000) == 0)
    {
LABEL_52:
      if ((v13 & 0x8000) == 0)
        goto LABEL_53;
      goto LABEL_110;
    }
  }
  else if ((v13 & 0x20000) == 0)
  {
    goto LABEL_52;
  }
  self->_isCoverArticle = *((_BYTE *)v4 + 334);
  *(_DWORD *)&self->_has |= 0x20000u;
  v13 = *((_DWORD *)v4 + 86);
  if ((v13 & 0x8000) == 0)
  {
LABEL_53:
    if ((v13 & 0x800) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_110:
  self->_fromNextArticleAffordanceTap = *((_BYTE *)v4 + 332);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v4 + 86) & 0x800) != 0)
  {
LABEL_54:
    self->_nextArticleAffordanceType = *((_DWORD *)v4 + 54);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_55:
  if (*((_QWORD *)v4 + 28))
    -[NTPBReadingListAddRemove setNextArticleAffordanceTypeFeedId:](self, "setNextArticleAffordanceTypeFeedId:");
  if ((*((_BYTE *)v4 + 346) & 0x10) != 0)
  {
    self->_isGroupedArticle = *((_BYTE *)v4 + 337);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
  if (*((_QWORD *)v4 + 15))
    -[NTPBReadingListAddRemove setGroupFeedId:](self, "setGroupFeedId:");
  v14 = *((_DWORD *)v4 + 86);
  if ((v14 & 0x400) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_has |= 0x400u;
    v14 = *((_DWORD *)v4 + 86);
    if ((v14 & 0x10000) == 0)
    {
LABEL_63:
      if ((v14 & 0x2000) == 0)
        goto LABEL_64;
      goto LABEL_114;
    }
  }
  else if ((v14 & 0x10000) == 0)
  {
    goto LABEL_63;
  }
  self->_isBreakingNewsArticle = *((_BYTE *)v4 + 333);
  *(_DWORD *)&self->_has |= 0x10000u;
  v14 = *((_DWORD *)v4 + 86);
  if ((v14 & 0x2000) == 0)
  {
LABEL_64:
    if ((v14 & 0x2000000) == 0)
      goto LABEL_65;
    goto LABEL_115;
  }
LABEL_114:
  self->_topStoryType = *((_DWORD *)v4 + 78);
  *(_DWORD *)&self->_has |= 0x2000u;
  v14 = *((_DWORD *)v4 + 86);
  if ((v14 & 0x2000000) == 0)
  {
LABEL_65:
    if ((v14 & 0x1000000) == 0)
      goto LABEL_66;
    goto LABEL_116;
  }
LABEL_115:
  self->_isTopStoryArticle = *((_BYTE *)v4 + 342);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v14 = *((_DWORD *)v4 + 86);
  if ((v14 & 0x1000000) == 0)
  {
LABEL_66:
    if ((v14 & 0x200000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_116:
  self->_isSearchResultArticle = *((_BYTE *)v4 + 341);
  *(_DWORD *)&self->_has |= 0x1000000u;
  if ((*((_DWORD *)v4 + 86) & 0x200000) != 0)
  {
LABEL_67:
    self->_isNativeAd = *((_BYTE *)v4 + 338);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_68:
  if (*((_QWORD *)v4 + 26))
    -[NTPBReadingListAddRemove setNativeCampaignData:](self, "setNativeCampaignData:");
  if (*((_QWORD *)v4 + 30))
    -[NTPBReadingListAddRemove setPreviousArticleId:](self, "setPreviousArticleId:");
  if (*((_QWORD *)v4 + 31))
    -[NTPBReadingListAddRemove setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v15 = *((id *)v4 + 14);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v15);
        -[NTPBReadingListAddRemove addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v17);
  }

  v20 = *((_DWORD *)v4 + 86);
  if ((v20 & 8) != 0)
  {
    self->_publisherArticleVersionInt64 = *((_QWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
    v20 = *((_DWORD *)v4 + 86);
  }
  if ((v20 & 1) != 0)
  {
    self->_backendArticleVersionInt64 = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 19))
    -[NTPBReadingListAddRemove setIadNativeCampaign:](self, "setIadNativeCampaign:");
  if (*((_QWORD *)v4 + 21))
    -[NTPBReadingListAddRemove setIadNativeLine:](self, "setIadNativeLine:");
  if (*((_QWORD *)v4 + 18))
    -[NTPBReadingListAddRemove setIadNativeAd:](self, "setIadNativeAd:");
  if ((*((_BYTE *)v4 + 344) & 4) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 20))
    -[NTPBReadingListAddRemove setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  if (*((_QWORD *)v4 + 17))
    -[NTPBReadingListAddRemove setGroupViewExposureId:](self, "setGroupViewExposureId:");
  issueData = self->_issueData;
  v22 = *((_QWORD *)v4 + 22);
  if (issueData)
  {
    if (v22)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v22)
  {
    -[NTPBReadingListAddRemove setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v24 = *((_QWORD *)v4 + 23);
  if (issueExposureData)
  {
    if (v24)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v24)
  {
    -[NTPBReadingListAddRemove setIssueExposureData:](self, "setIssueExposureData:");
  }
  if ((*((_BYTE *)v4 + 345) & 1) != 0)
  {
    self->_contentType = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  channelData = self->_channelData;
  v26 = *((_QWORD *)v4 + 10);
  if (channelData)
  {
    if (v26)
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else if (v26)
  {
    -[NTPBReadingListAddRemove setChannelData:](self, "setChannelData:");
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = *((id *)v4 + 40);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        -[NTPBReadingListAddRemove addTopicIds:](self, "addTopicIds:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k), (_QWORD)v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v29);
  }

}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSString)referencedArticleId
{
  return self->_referencedArticleId;
}

- (void)setReferencedArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_referencedArticleId, a3);
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (int)characterCount
{
  return self->_characterCount;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSMutableArray)namedEntities
{
  return self->_namedEntities;
}

- (void)setNamedEntities:(id)a3
{
  objc_storeStrong((id *)&self->_namedEntities, a3);
}

- (int)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (NSString)sectionHeadlineId
{
  return self->_sectionHeadlineId;
}

- (void)setSectionHeadlineId:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeadlineId, a3);
}

- (NSString)surfacedByChannelId
{
  return self->_surfacedByChannelId;
}

- (void)setSurfacedByChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_surfacedByChannelId, a3);
}

- (NSString)surfacedBySectionId
{
  return self->_surfacedBySectionId;
}

- (void)setSurfacedBySectionId:(id)a3
{
  objc_storeStrong((id *)&self->_surfacedBySectionId, a3);
}

- (NSString)surfacedByTopicId
{
  return self->_surfacedByTopicId;
}

- (void)setSurfacedByTopicId:(id)a3
{
  objc_storeStrong((id *)&self->_surfacedByTopicId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (BOOL)isDigitalReplicaAd
{
  return self->_isDigitalReplicaAd;
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (BOOL)isFreeArticle
{
  return self->_isFreeArticle;
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

- (BOOL)isNotificationArticle
{
  return self->_isNotificationArticle;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (void)setNotificationId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationId, a3);
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (BOOL)isCoverArticle
{
  return self->_isCoverArticle;
}

- (BOOL)fromNextArticleAffordanceTap
{
  return self->_fromNextArticleAffordanceTap;
}

- (NSString)nextArticleAffordanceTypeFeedId
{
  return self->_nextArticleAffordanceTypeFeedId;
}

- (void)setNextArticleAffordanceTypeFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_nextArticleAffordanceTypeFeedId, a3);
}

- (BOOL)isGroupedArticle
{
  return self->_isGroupedArticle;
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_groupFeedId, a3);
}

- (BOOL)isBreakingNewsArticle
{
  return self->_isBreakingNewsArticle;
}

- (BOOL)isTopStoryArticle
{
  return self->_isTopStoryArticle;
}

- (BOOL)isSearchResultArticle
{
  return self->_isSearchResultArticle;
}

- (BOOL)isNativeAd
{
  return self->_isNativeAd;
}

- (NSString)nativeCampaignData
{
  return self->_nativeCampaignData;
}

- (void)setNativeCampaignData:(id)a3
{
  objc_storeStrong((id *)&self->_nativeCampaignData, a3);
}

- (NSString)previousArticleId
{
  return self->_previousArticleId;
}

- (void)setPreviousArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_previousArticleId, a3);
}

- (NSString)previousArticleVersion
{
  return self->_previousArticleVersion;
}

- (void)setPreviousArticleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_previousArticleVersion, a3);
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, a3);
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
}

- (NSString)iadNativeCampaign
{
  return self->_iadNativeCampaign;
}

- (void)setIadNativeCampaign:(id)a3
{
  objc_storeStrong((id *)&self->_iadNativeCampaign, a3);
}

- (NSString)iadNativeLine
{
  return self->_iadNativeLine;
}

- (void)setIadNativeLine:(id)a3
{
  objc_storeStrong((id *)&self->_iadNativeLine, a3);
}

- (NSString)iadNativeAd
{
  return self->_iadNativeAd;
}

- (void)setIadNativeAd:(id)a3
{
  objc_storeStrong((id *)&self->_iadNativeAd, a3);
}

- (int64_t)previousArticlePublisherArticleVersion
{
  return self->_previousArticlePublisherArticleVersion;
}

- (NSString)iadNativeCampaignAd
{
  return self->_iadNativeCampaignAd;
}

- (void)setIadNativeCampaignAd:(id)a3
{
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, a3);
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
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

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
  objc_storeStrong((id *)&self->_topicIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_nextArticleAffordanceTypeFeedId, 0);
  objc_storeStrong((id *)&self->_nativeCampaignData, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadNativeLine, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaign, 0);
  objc_storeStrong((id *)&self->_iadNativeAd, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
