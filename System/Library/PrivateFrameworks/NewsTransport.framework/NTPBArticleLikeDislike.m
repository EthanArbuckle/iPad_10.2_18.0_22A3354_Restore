@implementation NTPBArticleLikeDislike

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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUserAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasArticleSessionId
{
  return self->_articleSessionId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)feedType
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFeedType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4EF18[a3];
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

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (int)likeDislikeLocation
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_likeDislikeLocation;
  else
    return 0;
}

- (void)setLikeDislikeLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_likeDislikeLocation = a3;
}

- (void)setHasLikeDislikeLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLikeDislikeLocation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (int)articleType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasArticleType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD4EFC8[a3];
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

- (void)setCharacterCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_characterCount = a3;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCharacterCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (BOOL)hasSectionHeadlineId
{
  return self->_sectionHeadlineId != 0;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
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
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasGroupType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD4EFF8[a3];
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

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNextArticleAffordanceType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)nextArticleAffordanceTypeAsString:(int)a3
{
  if (a3 < 0x10)
    return off_24CD4F138[a3];
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTopStoryType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)topStoryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4F1B8[a3];
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
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsTopStoryArticle
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setIsSearchResultArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isSearchResultArticle = a3;
}

- (void)setHasIsSearchResultArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsSearchResultArticle
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
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

- (BOOL)hasWidgetEngagement
{
  return self->_widgetEngagement != 0;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
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
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_contentType;
  else
    return 0;
}

- (void)setContentType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasContentType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD4F1D0[a3];
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
  v8.super_class = (Class)NTPBArticleLikeDislike;
  -[NTPBArticleLikeDislike description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBArticleLikeDislike dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  uint64_t feedType;
  __CFString *v11;
  NSString *feedId;
  NSData *feedViewExposureId;
  $969F66802EEB540360E160052BF188A2 has;
  void *v15;
  void *v16;
  uint64_t articleType;
  __CFString *v18;
  NSMutableArray *namedEntities;
  void *v20;
  NSString *language;
  $969F66802EEB540360E160052BF188A2 v22;
  void *v23;
  void *v24;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  $969F66802EEB540360E160052BF188A2 v29;
  void *v30;
  NSString *groupFeedId;
  $969F66802EEB540360E160052BF188A2 v32;
  void *v33;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  $969F66802EEB540360E160052BF188A2 v37;
  void *v38;
  void *v39;
  uint64_t groupType;
  __CFString *v41;
  void *v42;
  void *v43;
  uint64_t nextArticleAffordanceType;
  __CFString *v45;
  void *v46;
  NSString *nextArticleAffordanceTypeFeedId;
  $969F66802EEB540360E160052BF188A2 v48;
  void *v49;
  NSString *nativeCampaignData;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  void *v54;
  void *v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  $969F66802EEB540360E160052BF188A2 v62;
  void *v63;
  void *v64;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  void *v68;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBIssueData *issueData;
  void *v72;
  NTPBIssueExposureData *issueExposureData;
  void *v74;
  uint64_t contentType;
  __CFString *v76;
  void *v77;
  uint64_t topStoryType;
  __CFString *v79;
  NTPBChannelData *channelData;
  void *v81;
  NSMutableArray *topicIds;
  id v83;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("user_action"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  articleSessionId = self->_articleSessionId;
  if (articleSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleSessionId, CFSTR("article_session_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24CD4EF18[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("feed_type"));

  }
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("is_user_subscribed_to_feed"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_24:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_32;
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_likeDislikeLocation);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("like_dislike_location"));

  if ((*(_DWORD *)&self->_has & 0x10) == 0)
    goto LABEL_32;
LABEL_28:
  articleType = self->_articleType;
  if (articleType >= 6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_24CD4EFC8[articleType];
  }
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("article_type"));

LABEL_32:
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v3, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_characterCount);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("character_count"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("publisher_article_version"));

    v22 = self->_has;
  }
  if ((*(_BYTE *)&v22 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("backend_article_version"));

  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId)
    objc_msgSend(v3, "setObject:forKey:", surfacedByChannelId, CFSTR("surfaced_by_channel_id"));
  surfacedBySectionId = self->_surfacedBySectionId;
  if (surfacedBySectionId)
    objc_msgSend(v3, "setObject:forKey:", surfacedBySectionId, CFSTR("surfaced_by_section_id"));
  surfacedByTopicId = self->_surfacedByTopicId;
  if (surfacedByTopicId)
    objc_msgSend(v3, "setObject:forKey:", surfacedByTopicId, CFSTR("surfaced_by_topic_id"));
  sectionHeadlineId = self->_sectionHeadlineId;
  if (sectionHeadlineId)
    objc_msgSend(v3, "setObject:forKey:", sectionHeadlineId, CFSTR("section_headline_id"));
  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDigitalReplicaAd);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("is_digital_replica_ad"));

    v29 = self->_has;
    if ((*(_BYTE *)&v29 & 2) == 0)
    {
LABEL_52:
      if ((*(_DWORD *)&v29 & 0x100000) == 0)
        goto LABEL_54;
      goto LABEL_53;
    }
  }
  else if ((*(_BYTE *)&v29 & 2) == 0)
  {
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("personalization_treatment_id"));

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_53:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isGroupedArticle);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("is_grouped_article"));

  }
LABEL_54:
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v3, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x200) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_24CD4EFF8[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("group_type"));

    v32 = self->_has;
    if ((*(_DWORD *)&v32 & 0x400000) == 0)
    {
LABEL_58:
      if ((*(_DWORD *)&v32 & 0x80000) == 0)
        goto LABEL_60;
      goto LABEL_59;
    }
  }
  else if ((*(_DWORD *)&v32 & 0x400000) == 0)
  {
    goto LABEL_58;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToSourceChannel);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("is_paid_subscriber_to_source_channel"));

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_59:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFreeArticle);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("is_free_article"));

  }
LABEL_60:
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCoverArticle);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("is_cover_article"));

    v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x8000) == 0)
    {
LABEL_68:
      if ((*(_WORD *)&v37 & 0x800) == 0)
        goto LABEL_85;
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v37 & 0x8000) == 0)
  {
    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fromNextArticleAffordanceTap);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("from_next_article_affordance_tap"));

  if ((*(_DWORD *)&self->_has & 0x800) == 0)
    goto LABEL_85;
LABEL_77:
  nextArticleAffordanceType = self->_nextArticleAffordanceType;
  if (nextArticleAffordanceType >= 0x10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_nextArticleAffordanceType);
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = off_24CD4F138[nextArticleAffordanceType];
  }
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("next_article_affordance_type"));

LABEL_85:
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if (nextArticleAffordanceTypeFeedId)
    objc_msgSend(v3, "setObject:forKey:", nextArticleAffordanceTypeFeedId, CFSTR("next_article_affordance_type_feed_id"));
  v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBreakingNewsArticle);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("is_breaking_news_article"));

    v48 = self->_has;
    if ((*(_WORD *)&v48 & 0x2000) == 0)
    {
LABEL_89:
      if ((*(_DWORD *)&v48 & 0x1000000) == 0)
        goto LABEL_90;
      goto LABEL_145;
    }
  }
  else if ((*(_WORD *)&v48 & 0x2000) == 0)
  {
    goto LABEL_89;
  }
  topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_topStoryType);
    v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v79 = off_24CD4F1B8[topStoryType];
  }
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("top_story_type"));

  v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x1000000) == 0)
  {
LABEL_90:
    if ((*(_DWORD *)&v48 & 0x800000) == 0)
      goto LABEL_91;
    goto LABEL_146;
  }
LABEL_145:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isTopStoryArticle);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("is_top_story_article"));

  v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x800000) == 0)
  {
LABEL_91:
    if ((*(_DWORD *)&v48 & 0x200000) == 0)
      goto LABEL_93;
    goto LABEL_92;
  }
LABEL_146:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSearchResultArticle);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v86, CFSTR("is_search_result_article"));

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_92:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNativeAd);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("is_native_ad"));

  }
LABEL_93:
  nativeCampaignData = self->_nativeCampaignData;
  if (nativeCampaignData)
    objc_msgSend(v3, "setObject:forKey:", nativeCampaignData, CFSTR("native_campaign_data"));
  previousArticleId = self->_previousArticleId;
  if (previousArticleId)
    objc_msgSend(v3, "setObject:forKey:", previousArticleId, CFSTR("previous_article_id"));
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion)
    objc_msgSend(v3, "setObject:forKey:", previousArticleVersion, CFSTR("previous_article_version"));
  widgetEngagement = self->_widgetEngagement;
  if (widgetEngagement)
  {
    -[NTPBWidgetEngagement dictionaryRepresentation](widgetEngagement, "dictionaryRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("widget_engagement"));

  }
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v56 = self->_fractionalCohortMemberships;
    v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v88 != v59)
            objc_enumerationMutation(v56);
          objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "dictionaryRepresentation");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v61);

        }
        v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
      }
      while (v58);
    }

    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("fractional_cohort_membership"));
  }
  v62 = self->_has;
  if ((*(_BYTE *)&v62 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("publisher_article_version_int64"));

    v62 = self->_has;
  }
  if ((*(_BYTE *)&v62 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("backend_article_version_int64"));

  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if (iadNativeCampaign)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaign, CFSTR("iad_native_campaign"));
  iadNativeLine = self->_iadNativeLine;
  if (iadNativeLine)
    objc_msgSend(v3, "setObject:forKey:", iadNativeLine, CFSTR("iad_native_line"));
  iadNativeAd = self->_iadNativeAd;
  if (iadNativeAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeAd, CFSTR("iad_native_ad"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("previous_article_publisher_article_version"));

  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaignAd, CFSTR("iad_native_campaign_ad"));
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("issue_exposure_data"));

  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    contentType = self->_contentType;
    if (contentType >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_contentType);
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_24CD4F1D0[contentType];
    }
    objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("content_type"));

  }
  channelData = self->_channelData;
  if (channelData)
  {
    -[NTPBChannelData dictionaryRepresentation](channelData, "dictionaryRepresentation");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("channel_data"));

  }
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v3, "setObject:forKey:", topicIds, CFSTR("topic_ids"));
  v83 = v3;

  return v83;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleLikeDislikeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $969F66802EEB540360E160052BF188A2 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $969F66802EEB540360E160052BF188A2 v11;
  $969F66802EEB540360E160052BF188A2 v12;
  $969F66802EEB540360E160052BF188A2 v13;
  $969F66802EEB540360E160052BF188A2 v14;
  $969F66802EEB540360E160052BF188A2 v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  $969F66802EEB540360E160052BF188A2 v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_referencedArticleId)
    PBDataWriterWriteStringField();
  if (self->_articleSessionId)
    PBDataWriterWriteDataField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedId)
    PBDataWriterWriteStringField();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
LABEL_22:
    PBDataWriterWriteInt32Field();
LABEL_23:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = self->_namedEntities;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_language)
    PBDataWriterWriteStringField();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = self->_has;
  }
  if ((*(_BYTE *)&v11 & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
    if ((*(_BYTE *)&v12 & 2) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v12 & 0x100000) == 0)
        goto LABEL_50;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&v12 & 2) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
LABEL_49:
    PBDataWriterWriteBOOLField();
LABEL_50:
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
    {
LABEL_54:
      if ((*(_DWORD *)&v13 & 0x80000) == 0)
        goto LABEL_56;
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
    goto LABEL_54;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
LABEL_55:
    PBDataWriterWriteBOOLField();
LABEL_56:
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x8000) == 0)
    {
LABEL_64:
      if ((*(_WORD *)&v14 & 0x800) == 0)
        goto LABEL_66;
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
    goto LABEL_64;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
LABEL_65:
    PBDataWriterWriteInt32Field();
LABEL_66:
  if (self->_nextArticleAffordanceTypeFeedId)
    PBDataWriterWriteStringField();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x2000) == 0)
    {
LABEL_70:
      if ((*(_DWORD *)&v15 & 0x1000000) == 0)
        goto LABEL_71;
      goto LABEL_135;
    }
  }
  else if ((*(_WORD *)&v15 & 0x2000) == 0)
  {
    goto LABEL_70;
  }
  PBDataWriterWriteInt32Field();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
LABEL_71:
    if ((*(_DWORD *)&v15 & 0x800000) == 0)
      goto LABEL_72;
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteBOOLField();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x800000) == 0)
  {
LABEL_72:
    if ((*(_DWORD *)&v15 & 0x200000) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_136:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
LABEL_73:
    PBDataWriterWriteBOOLField();
LABEL_74:
  if (self->_nativeCampaignData)
    PBDataWriterWriteStringField();
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  if (self->_widgetEngagement)
    PBDataWriterWriteSubmessage();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = self->_fractionalCohortMemberships;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v32;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v32 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v18);
  }

  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v21 = self->_has;
  }
  if ((*(_BYTE *)&v21 & 1) != 0)
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
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_channelData)
    PBDataWriterWriteSubmessage();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = self->_topicIds;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteStringField();
        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v24);
  }

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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  $969F66802EEB540360E160052BF188A2 has;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  $969F66802EEB540360E160052BF188A2 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  $969F66802EEB540360E160052BF188A2 v39;
  uint64_t v40;
  void *v41;
  $969F66802EEB540360E160052BF188A2 v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  $969F66802EEB540360E160052BF188A2 v49;
  uint64_t v50;
  void *v51;
  $969F66802EEB540360E160052BF188A2 v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  $969F66802EEB540360E160052BF188A2 v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  NSMutableArray *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 360) = self->_userAction;
    *(_DWORD *)(v5 + 388) |= 0x4000u;
  }
  v7 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  v9 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 296);
  *(_QWORD *)(v6 + 296) = v9;

  v11 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  v13 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v13;

  v15 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 312);
  *(_QWORD *)(v6 + 312) = v15;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_DWORD *)(v6 + 128) = self->_feedType;
    *(_DWORD *)(v6 + 388) |= 0x100u;
  }
  v17 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v17;

  v19 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v19;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    *(_BYTE *)(v6 + 386) = self->_isUserSubscribedToFeed;
    *(_DWORD *)(v6 + 388) |= 0x2000000u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 232) = self->_likeDislikeLocation;
  *(_DWORD *)(v6 + 388) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 56) = self->_articleType;
    *(_DWORD *)(v6 + 388) |= 0x10u;
  }
LABEL_9:
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v22 = self->_namedEntities;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v100;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v100 != v25)
          objc_enumerationMutation(v22);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v26), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNamedEntities:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
    }
    while (v24);
  }

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_characterCount;
    *(_DWORD *)(v6 + 388) |= 0x40u;
  }
  v28 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v28;

  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 288) = self->_publisherArticleVersion;
    *(_DWORD *)(v6 + 388) |= 0x1000u;
    v30 = self->_has;
  }
  if ((*(_BYTE *)&v30 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_backendArticleVersion;
    *(_DWORD *)(v6 + 388) |= 0x20u;
  }
  v31 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = v31;

  v33 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v34 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = v33;

  v35 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v36 = *(void **)(v6 + 336);
  *(_QWORD *)(v6 + 336) = v35;

  v37 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v38 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v37;

  v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x40000) != 0)
  {
    *(_BYTE *)(v6 + 379) = self->_isDigitalReplicaAd;
    *(_DWORD *)(v6 + 388) |= 0x40000u;
    v39 = self->_has;
    if ((*(_BYTE *)&v39 & 2) == 0)
    {
LABEL_24:
      if ((*(_DWORD *)&v39 & 0x100000) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&v39 & 2) == 0)
  {
    goto LABEL_24;
  }
  *(_QWORD *)(v6 + 16) = self->_personalizationTreatmentId;
  *(_DWORD *)(v6 + 388) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_25:
    *(_BYTE *)(v6 + 381) = self->_isGroupedArticle;
    *(_DWORD *)(v6 + 388) |= 0x100000u;
  }
LABEL_26:
  v40 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v41 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v40;

  v42 = self->_has;
  if ((*(_WORD *)&v42 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_groupType;
    *(_DWORD *)(v6 + 388) |= 0x200u;
    v42 = self->_has;
    if ((*(_DWORD *)&v42 & 0x400000) == 0)
    {
LABEL_28:
      if ((*(_DWORD *)&v42 & 0x80000) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&v42 & 0x400000) == 0)
  {
    goto LABEL_28;
  }
  *(_BYTE *)(v6 + 383) = self->_isPaidSubscriberToSourceChannel;
  *(_DWORD *)(v6 + 388) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_29:
    *(_BYTE *)(v6 + 380) = self->_isFreeArticle;
    *(_DWORD *)(v6 + 388) |= 0x80000u;
  }
LABEL_30:
  v43 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v44 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v43;

  v45 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v46 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v45;

  v47 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v48 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v47;

  v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x20000) != 0)
  {
    *(_BYTE *)(v6 + 378) = self->_isCoverArticle;
    *(_DWORD *)(v6 + 388) |= 0x20000u;
    v49 = self->_has;
    if ((*(_WORD *)&v49 & 0x8000) == 0)
    {
LABEL_32:
      if ((*(_WORD *)&v49 & 0x800) == 0)
        goto LABEL_34;
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&v49 & 0x8000) == 0)
  {
    goto LABEL_32;
  }
  *(_BYTE *)(v6 + 376) = self->_fromNextArticleAffordanceTap;
  *(_DWORD *)(v6 + 388) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_33:
    *(_DWORD *)(v6 + 256) = self->_nextArticleAffordanceType;
    *(_DWORD *)(v6 + 388) |= 0x800u;
  }
LABEL_34:
  v50 = -[NSString copyWithZone:](self->_nextArticleAffordanceTypeFeedId, "copyWithZone:", a3);
  v51 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v50;

  v52 = self->_has;
  if ((*(_DWORD *)&v52 & 0x10000) != 0)
  {
    *(_BYTE *)(v6 + 377) = self->_isBreakingNewsArticle;
    *(_DWORD *)(v6 + 388) |= 0x10000u;
    v52 = self->_has;
    if ((*(_WORD *)&v52 & 0x2000) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v52 & 0x1000000) == 0)
        goto LABEL_37;
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v52 & 0x2000) == 0)
  {
    goto LABEL_36;
  }
  *(_DWORD *)(v6 + 344) = self->_topStoryType;
  *(_DWORD *)(v6 + 388) |= 0x2000u;
  v52 = self->_has;
  if ((*(_DWORD *)&v52 & 0x1000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v52 & 0x800000) == 0)
      goto LABEL_38;
    goto LABEL_78;
  }
LABEL_77:
  *(_BYTE *)(v6 + 385) = self->_isTopStoryArticle;
  *(_DWORD *)(v6 + 388) |= 0x1000000u;
  v52 = self->_has;
  if ((*(_DWORD *)&v52 & 0x800000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v52 & 0x200000) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_78:
  *(_BYTE *)(v6 + 384) = self->_isSearchResultArticle;
  *(_DWORD *)(v6 + 388) |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_39:
    *(_BYTE *)(v6 + 382) = self->_isNativeAd;
    *(_DWORD *)(v6 + 388) |= 0x200000u;
  }
LABEL_40:
  v53 = -[NSString copyWithZone:](self->_nativeCampaignData, "copyWithZone:", a3);
  v54 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v53;

  v55 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v56 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v55;

  v57 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v58 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v57;

  v59 = -[NTPBWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v60 = *(void **)(v6 + 368);
  *(_QWORD *)(v6 + 368) = v59;

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v61 = self->_fractionalCohortMemberships;
  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v96;
    do
    {
      v65 = 0;
      do
      {
        if (*(_QWORD *)v96 != v64)
          objc_enumerationMutation(v61);
        v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * v65), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFractionalCohortMembership:", v66);

        ++v65;
      }
      while (v63 != v65);
      v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
    }
    while (v63);
  }

  v67 = self->_has;
  if ((*(_BYTE *)&v67 & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_publisherArticleVersionInt64;
    *(_DWORD *)(v6 + 388) |= 8u;
    v67 = self->_has;
  }
  if ((*(_BYTE *)&v67 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_backendArticleVersionInt64;
    *(_DWORD *)(v6 + 388) |= 1u;
  }
  v68 = -[NSString copyWithZone:](self->_iadNativeCampaign, "copyWithZone:", a3);
  v69 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v68;

  v70 = -[NSString copyWithZone:](self->_iadNativeLine, "copyWithZone:", a3);
  v71 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v70;

  v72 = -[NSString copyWithZone:](self->_iadNativeAd, "copyWithZone:", a3);
  v73 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v72;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v6 + 388) |= 4u;
  }
  v74 = -[NSString copyWithZone:](self->_iadNativeCampaignAd, "copyWithZone:", a3);
  v75 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v74;

  v76 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v77 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v76;

  v78 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v79 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v78;

  v80 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v81 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v80;

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 108) = self->_contentType;
    *(_DWORD *)(v6 + 388) |= 0x80u;
  }
  v82 = -[NTPBChannelData copyWithZone:](self->_channelData, "copyWithZone:", a3);
  v83 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v82;

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v84 = self->_topicIds;
  v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v92;
    do
    {
      v88 = 0;
      do
      {
        if (*(_QWORD *)v92 != v87)
          objc_enumerationMutation(v84);
        v89 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v88), "copyWithZone:", a3, (_QWORD)v91);
        objc_msgSend((id)v6, "addTopicIds:", v89);

        ++v88;
      }
      while (v86 != v88);
      v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v84, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
    }
    while (v86);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSString *articleId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  int v11;
  NSString *feedId;
  NSData *feedViewExposureId;
  $969F66802EEB540360E160052BF188A2 has;
  int v15;
  NSMutableArray *namedEntities;
  int v17;
  NSString *language;
  int v19;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  $969F66802EEB540360E160052BF188A2 v24;
  int v25;
  NSString *groupFeedId;
  int v27;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  $969F66802EEB540360E160052BF188A2 v31;
  int v32;
  NSString *nextArticleAffordanceTypeFeedId;
  int v34;
  NSString *nativeCampaignData;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  NSMutableArray *fractionalCohortMemberships;
  $969F66802EEB540360E160052BF188A2 v40;
  int v41;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  int v45;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  int v50;
  NTPBChannelData *channelData;
  NSMutableArray *topicIds;
  char v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_233;
  v5 = *((_DWORD *)v4 + 97);
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v5 & 0x4000) == 0 || self->_userAction != *((_DWORD *)v4 + 90))
      goto LABEL_233;
  }
  else if ((v5 & 0x4000) != 0)
  {
    goto LABEL_233;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_233;
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_233;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:"))
      goto LABEL_233;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_233;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 39))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_233;
  }
  v11 = *((_DWORD *)v4 + 97);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_feedType != *((_DWORD *)v4 + 32))
      goto LABEL_233;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_233;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 15) && !-[NSString isEqual:](feedId, "isEqual:"))
    goto LABEL_233;
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_233;
  }
  has = self->_has;
  v15 = *((_DWORD *)v4 + 97);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0)
      goto LABEL_233;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 386))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 386))
    {
      goto LABEL_233;
    }
  }
  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v15 & 0x400) == 0 || self->_likeDislikeLocation != *((_DWORD *)v4 + 58))
      goto LABEL_233;
  }
  else if ((v15 & 0x400) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_articleType != *((_DWORD *)v4 + 14))
      goto LABEL_233;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_233;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_233;
    has = self->_has;
  }
  v17 = *((_DWORD *)v4 + 97);
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_characterCount != *((_DWORD *)v4 + 26))
      goto LABEL_233;
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_233;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_233;
    has = self->_has;
  }
  v19 = *((_DWORD *)v4 + 97);
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v19 & 0x1000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 72))
      goto LABEL_233;
  }
  else if ((v19 & 0x1000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 18))
      goto LABEL_233;
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_233;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 40)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_233;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 41))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_233;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_233;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_233;
  }
  v24 = self->_has;
  v25 = *((_DWORD *)v4 + 97);
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    if ((v25 & 0x40000) == 0)
      goto LABEL_233;
    if (self->_isDigitalReplicaAd)
    {
      if (!*((_BYTE *)v4 + 379))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 379))
    {
      goto LABEL_233;
    }
  }
  else if ((v25 & 0x40000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 2))
      goto LABEL_233;
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x100000) != 0)
  {
    if ((v25 & 0x100000) == 0)
      goto LABEL_233;
    if (self->_isGroupedArticle)
    {
      if (!*((_BYTE *)v4 + 381))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 381))
    {
      goto LABEL_233;
    }
  }
  else if ((v25 & 0x100000) != 0)
  {
    goto LABEL_233;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_233;
    v24 = self->_has;
  }
  v27 = *((_DWORD *)v4 + 97);
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
    if ((v27 & 0x200) == 0 || self->_groupType != *((_DWORD *)v4 + 40))
      goto LABEL_233;
  }
  else if ((v27 & 0x200) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x400000) != 0)
  {
    if ((v27 & 0x400000) == 0)
      goto LABEL_233;
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((_BYTE *)v4 + 383))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 383))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x400000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x80000) != 0)
  {
    if ((v27 & 0x80000) == 0)
      goto LABEL_233;
    if (self->_isFreeArticle)
    {
      if (!*((_BYTE *)v4 + 380))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 380))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x80000) != 0)
  {
    goto LABEL_233;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 10)
    && !-[NSString isEqual:](campaignId, "isEqual:"))
  {
    goto LABEL_233;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_233;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_233;
  }
  v31 = self->_has;
  v32 = *((_DWORD *)v4 + 97);
  if ((*(_DWORD *)&v31 & 0x20000) != 0)
  {
    if ((v32 & 0x20000) == 0)
      goto LABEL_233;
    if (self->_isCoverArticle)
    {
      if (!*((_BYTE *)v4 + 378))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 378))
    {
      goto LABEL_233;
    }
  }
  else if ((v32 & 0x20000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v31 & 0x8000) != 0)
  {
    if ((v32 & 0x8000) == 0)
      goto LABEL_233;
    if (self->_fromNextArticleAffordanceTap)
    {
      if (!*((_BYTE *)v4 + 376))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 376))
    {
      goto LABEL_233;
    }
  }
  else if ((v32 & 0x8000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
    if ((v32 & 0x800) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 64))
      goto LABEL_233;
  }
  else if ((v32 & 0x800) != 0)
  {
    goto LABEL_233;
  }
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if ((unint64_t)nextArticleAffordanceTypeFeedId | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](nextArticleAffordanceTypeFeedId, "isEqual:"))
      goto LABEL_233;
    v31 = self->_has;
  }
  v34 = *((_DWORD *)v4 + 97);
  if ((*(_DWORD *)&v31 & 0x10000) != 0)
  {
    if ((v34 & 0x10000) == 0)
      goto LABEL_233;
    if (self->_isBreakingNewsArticle)
    {
      if (!*((_BYTE *)v4 + 377))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 377))
    {
      goto LABEL_233;
    }
  }
  else if ((v34 & 0x10000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v31 & 0x2000) != 0)
  {
    if ((v34 & 0x2000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 86))
      goto LABEL_233;
  }
  else if ((v34 & 0x2000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v31 & 0x1000000) != 0)
  {
    if ((v34 & 0x1000000) == 0)
      goto LABEL_233;
    if (self->_isTopStoryArticle)
    {
      if (!*((_BYTE *)v4 + 385))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 385))
    {
      goto LABEL_233;
    }
  }
  else if ((v34 & 0x1000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v31 & 0x800000) != 0)
  {
    if ((v34 & 0x800000) == 0)
      goto LABEL_233;
    if (self->_isSearchResultArticle)
    {
      if (!*((_BYTE *)v4 + 384))
        goto LABEL_233;
    }
    else if (*((_BYTE *)v4 + 384))
    {
      goto LABEL_233;
    }
  }
  else if ((v34 & 0x800000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v31 & 0x200000) != 0)
  {
    if ((v34 & 0x200000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((_BYTE *)v4 + 382))
          goto LABEL_233;
        goto LABEL_185;
      }
      if (!*((_BYTE *)v4 + 382))
        goto LABEL_185;
    }
LABEL_233:
    v53 = 0;
    goto LABEL_234;
  }
  if ((v34 & 0x200000) != 0)
    goto LABEL_233;
LABEL_185:
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((_QWORD *)v4 + 31)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_233;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_233;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_233;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((_QWORD *)v4 + 46))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
      goto LABEL_233;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
      goto LABEL_233;
  }
  v40 = self->_has;
  v41 = *((_DWORD *)v4 + 97);
  if ((*(_BYTE *)&v40 & 8) != 0)
  {
    if ((v41 & 8) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 4))
      goto LABEL_233;
  }
  else if ((v41 & 8) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_BYTE *)&v40 & 1) != 0)
  {
    if ((v41 & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_233;
  }
  else if ((v41 & 1) != 0)
  {
    goto LABEL_233;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((_QWORD *)v4 + 23)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_233;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:"))
      goto LABEL_233;
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:"))
      goto LABEL_233;
  }
  v45 = *((_DWORD *)v4 + 97);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v45 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 3))
      goto LABEL_233;
  }
  else if ((v45 & 4) != 0)
  {
    goto LABEL_233;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((_QWORD *)v4 + 24)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_233;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 21))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_233;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 26))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_233;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 27))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_233;
  }
  v50 = *((_DWORD *)v4 + 97);
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v50 & 0x80) == 0 || self->_contentType != *((_DWORD *)v4 + 27))
      goto LABEL_233;
  }
  else if ((v50 & 0x80) != 0)
  {
    goto LABEL_233;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((_QWORD *)v4 + 12) && !-[NTPBChannelData isEqual:](channelData, "isEqual:"))
    goto LABEL_233;
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 44))
    v53 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  else
    v53 = 1;
LABEL_234:

  return v53;
}

- (unint64_t)hash
{
  $969F66802EEB540360E160052BF188A2 *p_has;
  $969F66802EEB540360E160052BF188A2 has;
  $969F66802EEB540360E160052BF188A2 v5;
  $969F66802EEB540360E160052BF188A2 v6;
  $969F66802EEB540360E160052BF188A2 v7;
  $969F66802EEB540360E160052BF188A2 v8;
  $969F66802EEB540360E160052BF188A2 v9;
  $969F66802EEB540360E160052BF188A2 v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  NSUInteger v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  uint64_t v53;
  uint64_t v54;
  NSUInteger v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSUInteger v62;
  uint64_t v63;
  NSUInteger v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  NSUInteger v68;
  uint64_t v69;

  p_has = &self->_has;
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v69 = 2654435761 * self->_userAction;
  else
    v69 = 0;
  v68 = -[NSString hash](self->_articleId, "hash");
  v67 = -[NSString hash](self->_referencedArticleId, "hash");
  v66 = -[NSData hash](self->_articleSessionId, "hash");
  v65 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v64 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*((_BYTE *)p_has + 1) & 1) != 0)
    v63 = 2654435761 * self->_feedType;
  else
    v63 = 0;
  v62 = -[NSString hash](self->_feedId, "hash");
  v61 = -[NSData hash](self->_feedViewExposureId, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    v60 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_9;
LABEL_12:
    v59 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_13;
  }
  v60 = 2654435761 * self->_isUserSubscribedToFeed;
  if ((*(_WORD *)&has & 0x400) == 0)
    goto LABEL_12;
LABEL_9:
  v59 = 2654435761 * self->_likeDislikeLocation;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_10:
    v58 = 2654435761 * self->_articleType;
    goto LABEL_14;
  }
LABEL_13:
  v58 = 0;
LABEL_14:
  v57 = -[NSMutableArray hash](self->_namedEntities, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v56 = 2654435761 * self->_characterCount;
  else
    v56 = 0;
  v55 = -[NSString hash](self->_language, "hash");
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
    v54 = 2654435761 * self->_publisherArticleVersion;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
      goto LABEL_19;
  }
  else
  {
    v54 = 0;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
    {
LABEL_19:
      v53 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_22;
    }
  }
  v53 = 0;
LABEL_22:
  v52 = -[NSString hash](self->_surfacedByChannelId, "hash");
  v51 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v50 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v49 = -[NSString hash](self->_sectionHeadlineId, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
    v48 = 0;
    if ((*(_BYTE *)&v6 & 2) != 0)
      goto LABEL_24;
LABEL_27:
    v47 = 0;
    if ((*(_DWORD *)&v6 & 0x100000) != 0)
      goto LABEL_25;
    goto LABEL_28;
  }
  v48 = 2654435761 * self->_isDigitalReplicaAd;
  if ((*(_BYTE *)&v6 & 2) == 0)
    goto LABEL_27;
LABEL_24:
  v47 = 2654435761 * self->_personalizationTreatmentId;
  if ((*(_DWORD *)&v6 & 0x100000) != 0)
  {
LABEL_25:
    v46 = 2654435761 * self->_isGroupedArticle;
    goto LABEL_29;
  }
LABEL_28:
  v46 = 0;
LABEL_29:
  v45 = -[NSString hash](self->_groupFeedId, "hash");
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
    v44 = 0;
    if ((*(_DWORD *)&v7 & 0x400000) != 0)
      goto LABEL_31;
LABEL_34:
    v43 = 0;
    if ((*(_DWORD *)&v7 & 0x80000) != 0)
      goto LABEL_32;
    goto LABEL_35;
  }
  v44 = 2654435761 * self->_groupType;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
    goto LABEL_34;
LABEL_31:
  v43 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
LABEL_32:
    v42 = 2654435761 * self->_isFreeArticle;
    goto LABEL_36;
  }
LABEL_35:
  v42 = 0;
LABEL_36:
  v41 = -[NSString hash](self->_campaignId, "hash");
  v40 = -[NSString hash](self->_campaignType, "hash");
  v39 = -[NSString hash](self->_creativeId, "hash");
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
    v38 = 0;
    if ((*(_WORD *)&v8 & 0x8000) != 0)
      goto LABEL_38;
LABEL_41:
    v37 = 0;
    if ((*(_WORD *)&v8 & 0x800) != 0)
      goto LABEL_39;
    goto LABEL_42;
  }
  v38 = 2654435761 * self->_isCoverArticle;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
    goto LABEL_41;
LABEL_38:
  v37 = 2654435761 * self->_fromNextArticleAffordanceTap;
  if ((*(_WORD *)&v8 & 0x800) != 0)
  {
LABEL_39:
    v36 = 2654435761 * self->_nextArticleAffordanceType;
    goto LABEL_43;
  }
LABEL_42:
  v36 = 0;
LABEL_43:
  v35 = -[NSString hash](self->_nextArticleAffordanceTypeFeedId, "hash");
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) != 0)
  {
    v34 = 2654435761 * self->_isBreakingNewsArticle;
    if ((*(_WORD *)&v9 & 0x2000) != 0)
    {
LABEL_45:
      v33 = 2654435761 * self->_topStoryType;
      if ((*(_DWORD *)&v9 & 0x1000000) != 0)
        goto LABEL_46;
      goto LABEL_51;
    }
  }
  else
  {
    v34 = 0;
    if ((*(_WORD *)&v9 & 0x2000) != 0)
      goto LABEL_45;
  }
  v33 = 0;
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
LABEL_46:
    v32 = 2654435761 * self->_isTopStoryArticle;
    if ((*(_DWORD *)&v9 & 0x800000) != 0)
      goto LABEL_47;
LABEL_52:
    v31 = 0;
    if ((*(_DWORD *)&v9 & 0x200000) != 0)
      goto LABEL_48;
    goto LABEL_53;
  }
LABEL_51:
  v32 = 0;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
    goto LABEL_52;
LABEL_47:
  v31 = 2654435761 * self->_isSearchResultArticle;
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
LABEL_48:
    v30 = 2654435761 * self->_isNativeAd;
    goto LABEL_54;
  }
LABEL_53:
  v30 = 0;
LABEL_54:
  v29 = -[NSString hash](self->_nativeCampaignData, "hash");
  v28 = -[NSString hash](self->_previousArticleId, "hash");
  v27 = -[NSString hash](self->_previousArticleVersion, "hash");
  v26 = -[NTPBWidgetEngagement hash](self->_widgetEngagement, "hash");
  v25 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    v24 = 2654435761 * self->_publisherArticleVersionInt64;
    if ((*(_BYTE *)&v10 & 1) != 0)
      goto LABEL_56;
  }
  else
  {
    v24 = 0;
    if ((*(_BYTE *)&v10 & 1) != 0)
    {
LABEL_56:
      v11 = -[NSString hash](self->_iadNativeCampaign, "hash", 2654435761 * self->_backendArticleVersionInt64);
      goto LABEL_59;
    }
  }
  v11 = -[NSString hash](self->_iadNativeCampaign, "hash", 0);
LABEL_59:
  v12 = v11;
  v13 = -[NSString hash](self->_iadNativeLine, "hash");
  v14 = -[NSString hash](self->_iadNativeAd, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  else
    v15 = 0;
  v16 = -[NSString hash](self->_iadNativeCampaignAd, "hash");
  v17 = -[NSData hash](self->_groupViewExposureId, "hash");
  v18 = -[NTPBIssueData hash](self->_issueData, "hash");
  v19 = -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v20 = 2654435761 * self->_contentType;
  else
    v20 = 0;
  v21 = v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NTPBChannelData hash](self->_channelData, "hash");
  return v68 ^ v69 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v12 ^ v21 ^ -[NSMutableArray hash](self->_topicIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  int v24;
  NTPBIssueData *issueData;
  uint64_t v26;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v28;
  NTPBChannelData *channelData;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 389) & 0x40) != 0)
  {
    self->_userAction = v4[90];
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((_QWORD *)v4 + 5))
    -[NTPBArticleLikeDislike setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 37))
    -[NTPBArticleLikeDislike setReferencedArticleId:](self, "setReferencedArticleId:");
  if (*((_QWORD *)v5 + 6))
    -[NTPBArticleLikeDislike setArticleSessionId:](self, "setArticleSessionId:");
  if (*((_QWORD *)v5 + 8))
    -[NTPBArticleLikeDislike setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  if (*((_QWORD *)v5 + 39))
    -[NTPBArticleLikeDislike setSourceChannelId:](self, "setSourceChannelId:");
  if ((*((_BYTE *)v5 + 389) & 1) != 0)
  {
    self->_feedType = *((_DWORD *)v5 + 32);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v5 + 15))
    -[NTPBArticleLikeDislike setFeedId:](self, "setFeedId:");
  if (*((_QWORD *)v5 + 17))
    -[NTPBArticleLikeDislike setFeedViewExposureId:](self, "setFeedViewExposureId:");
  v6 = *((_DWORD *)v5 + 97);
  if ((v6 & 0x2000000) != 0)
  {
    self->_isUserSubscribedToFeed = *((_BYTE *)v5 + 386);
    *(_DWORD *)&self->_has |= 0x2000000u;
    v6 = *((_DWORD *)v5 + 97);
    if ((v6 & 0x400) == 0)
    {
LABEL_21:
      if ((v6 & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((v6 & 0x400) == 0)
  {
    goto LABEL_21;
  }
  self->_likeDislikeLocation = *((_DWORD *)v5 + 58);
  *(_DWORD *)&self->_has |= 0x400u;
  if ((*((_DWORD *)v5 + 97) & 0x10) != 0)
  {
LABEL_22:
    self->_articleType = *((_DWORD *)v5 + 14);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_23:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = *((id *)v5 + 30);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        -[NTPBArticleLikeDislike addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v5 + 388) & 0x40) != 0)
  {
    self->_characterCount = *((_DWORD *)v5 + 26);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v5 + 28))
    -[NTPBArticleLikeDislike setLanguage:](self, "setLanguage:");
  v12 = *((_DWORD *)v5 + 97);
  if ((v12 & 0x1000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 72);
    *(_DWORD *)&self->_has |= 0x1000u;
    v12 = *((_DWORD *)v5 + 97);
  }
  if ((v12 & 0x20) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v5 + 40))
    -[NTPBArticleLikeDislike setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v5 + 41))
    -[NTPBArticleLikeDislike setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v5 + 42))
    -[NTPBArticleLikeDislike setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 38))
    -[NTPBArticleLikeDislike setSectionHeadlineId:](self, "setSectionHeadlineId:");
  v13 = *((_DWORD *)v5 + 97);
  if ((v13 & 0x40000) != 0)
  {
    self->_isDigitalReplicaAd = *((_BYTE *)v5 + 379);
    *(_DWORD *)&self->_has |= 0x40000u;
    v13 = *((_DWORD *)v5 + 97);
    if ((v13 & 2) == 0)
    {
LABEL_48:
      if ((v13 & 0x100000) == 0)
        goto LABEL_50;
      goto LABEL_49;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_48;
  }
  self->_personalizationTreatmentId = *((_QWORD *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v5 + 97) & 0x100000) != 0)
  {
LABEL_49:
    self->_isGroupedArticle = *((_BYTE *)v5 + 381);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_50:
  if (*((_QWORD *)v5 + 19))
    -[NTPBArticleLikeDislike setGroupFeedId:](self, "setGroupFeedId:");
  v14 = *((_DWORD *)v5 + 97);
  if ((v14 & 0x200) != 0)
  {
    self->_groupType = *((_DWORD *)v5 + 40);
    *(_DWORD *)&self->_has |= 0x200u;
    v14 = *((_DWORD *)v5 + 97);
    if ((v14 & 0x400000) == 0)
    {
LABEL_54:
      if ((v14 & 0x80000) == 0)
        goto LABEL_56;
      goto LABEL_55;
    }
  }
  else if ((v14 & 0x400000) == 0)
  {
    goto LABEL_54;
  }
  self->_isPaidSubscriberToSourceChannel = *((_BYTE *)v5 + 383);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v5 + 97) & 0x80000) != 0)
  {
LABEL_55:
    self->_isFreeArticle = *((_BYTE *)v5 + 380);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_56:
  if (*((_QWORD *)v5 + 10))
    -[NTPBArticleLikeDislike setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v5 + 11))
    -[NTPBArticleLikeDislike setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v5 + 14))
    -[NTPBArticleLikeDislike setCreativeId:](self, "setCreativeId:");
  v15 = *((_DWORD *)v5 + 97);
  if ((v15 & 0x20000) != 0)
  {
    self->_isCoverArticle = *((_BYTE *)v5 + 378);
    *(_DWORD *)&self->_has |= 0x20000u;
    v15 = *((_DWORD *)v5 + 97);
    if ((v15 & 0x8000) == 0)
    {
LABEL_64:
      if ((v15 & 0x800) == 0)
        goto LABEL_66;
      goto LABEL_65;
    }
  }
  else if ((v15 & 0x8000) == 0)
  {
    goto LABEL_64;
  }
  self->_fromNextArticleAffordanceTap = *((_BYTE *)v5 + 376);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v5 + 97) & 0x800) != 0)
  {
LABEL_65:
    self->_nextArticleAffordanceType = *((_DWORD *)v5 + 64);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_66:
  if (*((_QWORD *)v5 + 33))
    -[NTPBArticleLikeDislike setNextArticleAffordanceTypeFeedId:](self, "setNextArticleAffordanceTypeFeedId:");
  v16 = *((_DWORD *)v5 + 97);
  if ((v16 & 0x10000) != 0)
  {
    self->_isBreakingNewsArticle = *((_BYTE *)v5 + 377);
    *(_DWORD *)&self->_has |= 0x10000u;
    v16 = *((_DWORD *)v5 + 97);
    if ((v16 & 0x2000) == 0)
    {
LABEL_70:
      if ((v16 & 0x1000000) == 0)
        goto LABEL_71;
      goto LABEL_97;
    }
  }
  else if ((v16 & 0x2000) == 0)
  {
    goto LABEL_70;
  }
  self->_topStoryType = *((_DWORD *)v5 + 86);
  *(_DWORD *)&self->_has |= 0x2000u;
  v16 = *((_DWORD *)v5 + 97);
  if ((v16 & 0x1000000) == 0)
  {
LABEL_71:
    if ((v16 & 0x800000) == 0)
      goto LABEL_72;
    goto LABEL_98;
  }
LABEL_97:
  self->_isTopStoryArticle = *((_BYTE *)v5 + 385);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v16 = *((_DWORD *)v5 + 97);
  if ((v16 & 0x800000) == 0)
  {
LABEL_72:
    if ((v16 & 0x200000) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_98:
  self->_isSearchResultArticle = *((_BYTE *)v5 + 384);
  *(_DWORD *)&self->_has |= 0x800000u;
  if ((*((_DWORD *)v5 + 97) & 0x200000) != 0)
  {
LABEL_73:
    self->_isNativeAd = *((_BYTE *)v5 + 382);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_74:
  if (*((_QWORD *)v5 + 31))
    -[NTPBArticleLikeDislike setNativeCampaignData:](self, "setNativeCampaignData:");
  if (*((_QWORD *)v5 + 34))
    -[NTPBArticleLikeDislike setPreviousArticleId:](self, "setPreviousArticleId:");
  if (*((_QWORD *)v5 + 35))
    -[NTPBArticleLikeDislike setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  widgetEngagement = self->_widgetEngagement;
  v18 = *((_QWORD *)v5 + 46);
  if (widgetEngagement)
  {
    if (v18)
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v18)
  {
    -[NTPBArticleLikeDislike setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v19 = *((id *)v5 + 18);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        -[NTPBArticleLikeDislike addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v21);
  }

  v24 = *((_DWORD *)v5 + 97);
  if ((v24 & 8) != 0)
  {
    self->_publisherArticleVersionInt64 = *((_QWORD *)v5 + 4);
    *(_DWORD *)&self->_has |= 8u;
    v24 = *((_DWORD *)v5 + 97);
  }
  if ((v24 & 1) != 0)
  {
    self->_backendArticleVersionInt64 = *((_QWORD *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 23))
    -[NTPBArticleLikeDislike setIadNativeCampaign:](self, "setIadNativeCampaign:");
  if (*((_QWORD *)v5 + 25))
    -[NTPBArticleLikeDislike setIadNativeLine:](self, "setIadNativeLine:");
  if (*((_QWORD *)v5 + 22))
    -[NTPBArticleLikeDislike setIadNativeAd:](self, "setIadNativeAd:");
  if ((*((_BYTE *)v5 + 388) & 4) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v5 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 24))
    -[NTPBArticleLikeDislike setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  if (*((_QWORD *)v5 + 21))
    -[NTPBArticleLikeDislike setGroupViewExposureId:](self, "setGroupViewExposureId:");
  issueData = self->_issueData;
  v26 = *((_QWORD *)v5 + 26);
  if (issueData)
  {
    if (v26)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v26)
  {
    -[NTPBArticleLikeDislike setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v28 = *((_QWORD *)v5 + 27);
  if (issueExposureData)
  {
    if (v28)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v28)
  {
    -[NTPBArticleLikeDislike setIssueExposureData:](self, "setIssueExposureData:");
  }
  if ((*((_BYTE *)v5 + 388) & 0x80) != 0)
  {
    self->_contentType = *((_DWORD *)v5 + 27);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  channelData = self->_channelData;
  v30 = *((_QWORD *)v5 + 12);
  if (channelData)
  {
    if (v30)
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else if (v30)
  {
    -[NTPBArticleLikeDislike setChannelData:](self, "setChannelData:");
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = *((id *)v5 + 44);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(v31);
        -[NTPBArticleLikeDislike addTopicIds:](self, "addTopicIds:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k), (_QWORD)v36);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v33);
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

- (NSData)articleSessionId
{
  return self->_articleSessionId;
}

- (void)setArticleSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleSessionId, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_feedId, a3);
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSMutableArray)namedEntities
{
  return self->_namedEntities;
}

- (void)setNamedEntities:(id)a3
{
  objc_storeStrong((id *)&self->_namedEntities, a3);
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

- (int)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int)backendArticleVersion
{
  return self->_backendArticleVersion;
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

- (NSString)sectionHeadlineId
{
  return self->_sectionHeadlineId;
}

- (void)setSectionHeadlineId:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeadlineId, a3);
}

- (BOOL)isDigitalReplicaAd
{
  return self->_isDigitalReplicaAd;
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
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

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
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

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEngagement, a3);
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
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
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
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
