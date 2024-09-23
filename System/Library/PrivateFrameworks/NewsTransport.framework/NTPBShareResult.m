@implementation NTPBShareResult

- (int)resultType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void)setResultType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasResultType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasContentType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD502C0[a3];
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

- (BOOL)hasContentId
{
  return self->_contentId != 0;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFeedType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD502E8[a3];
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
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (int)shareMethod
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_shareMethod;
  else
    return 0;
}

- (void)setShareMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_shareMethod = a3;
}

- (void)setHasShareMethod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasShareMethod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)shareLocation
{
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    return self->_shareLocation;
  else
    return 0;
}

- (void)setShareLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_shareLocation = a3;
}

- (void)setHasShareLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasShareLocation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCharacterCount
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
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
  *(_DWORD *)&self->_has |= 0x800u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasArticleType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD50398[a3];
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

- (BOOL)hasIosActivityType
{
  return self->_iosActivityType != 0;
}

- (void)setIsDigitalReplicaAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasExternalWeblinkUrl
{
  return self->_externalWeblinkUrl != 0;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsGroupedArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isGroupedArticle = a3;
}

- (void)setHasIsGroupedArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsGroupedArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasGroupType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD503C8[a3];
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
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setIsFreeArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isFreeArticle = a3;
}

- (void)setHasIsFreeArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsFreeArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIsNotificationArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isNotificationArticle = a3;
}

- (void)setHasIsNotificationArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsNotificationArticle
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
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
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isCoverArticle = a3;
}

- (void)setHasIsCoverArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsCoverArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setFromNextArticleAffordanceTap:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_fromNextArticleAffordanceTap = a3;
}

- (void)setHasFromNextArticleAffordanceTap:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasFromNextArticleAffordanceTap
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int)nextArticleAffordanceType
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_nextArticleAffordanceType;
  else
    return 0;
}

- (void)setNextArticleAffordanceType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_nextArticleAffordanceType = a3;
}

- (void)setHasNextArticleAffordanceType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNextArticleAffordanceType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)nextArticleAffordanceTypeAsString:(int)a3
{
  if (a3 < 0x10)
    return off_24CD50508[a3];
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
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isBreakingNewsArticle = a3;
}

- (void)setHasIsBreakingNewsArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)topStoryType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_topStoryType;
  else
    return 0;
}

- (void)setTopStoryType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_topStoryType = a3;
}

- (void)setHasTopStoryType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTopStoryType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)topStoryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD50588[a3];
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
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsTopStoryArticle
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsSearchResult:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isSearchResult = a3;
}

- (void)setHasIsSearchResult:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsSearchResult
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsNativeAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
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
  v8.super_class = (Class)NTPBShareResult;
  -[NTPBShareResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBShareResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has;
  void *v5;
  uint64_t contentType;
  __CFString *v7;
  NSString *contentId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  uint64_t feedType;
  __CFString *v13;
  NSString *feedId;
  NSData *feedViewExposureId;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v16;
  void *v17;
  NSString *language;
  NSMutableArray *namedEntities;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v20;
  void *v21;
  void *v22;
  NSString *sourceChannelId;
  uint64_t articleType;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  NSString *iosActivityType;
  void *v34;
  NSString *externalWeblinkUrl;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v36;
  void *v37;
  void *v38;
  NSString *groupFeedId;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v40;
  void *v41;
  NSString *notificationId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v46;
  uint64_t groupType;
  __CFString *v48;
  void *v49;
  void *v50;
  uint64_t nextArticleAffordanceType;
  __CFString *v52;
  void *v53;
  void *v54;
  NSString *nextArticleAffordanceTypeFeedId;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v56;
  void *v57;
  NSString *nativeCampaignData;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  void *v62;
  void *v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v70;
  void *v71;
  void *v72;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  void *v76;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBIssueData *issueData;
  void *v80;
  NTPBIssueExposureData *issueExposureData;
  void *v82;
  NTPBChannelData *channelData;
  void *v84;
  NSMutableArray *topicIds;
  id v86;
  void *v88;
  uint64_t topStoryType;
  __CFString *v90;
  void *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("result_type"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    contentType = self->_contentType;
    if (contentType >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_contentType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24CD502C0[contentType];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("content_type"));

  }
  contentId = self->_contentId;
  if (contentId)
    objc_msgSend(v3, "setObject:forKey:", contentId, CFSTR("content_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  articleSessionId = self->_articleSessionId;
  if (articleSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleSessionId, CFSTR("article_session_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_24CD502E8[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("feed_type"));

  }
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x8000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("is_user_subscribed_to_feed"));

    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v16 & 0x2000) == 0)
        goto LABEL_28;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_shareMethod);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("share_method"));

  v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v16 & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_shareLocation);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("share_location"));

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_characterCount);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("character_count"));

  }
LABEL_30:
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v3, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("publisher_article_version"));

    v20 = self->_has;
  }
  if ((*(_BYTE *)&v20 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("backend_article_version"));

  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_24CD50398[articleType];
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("article_type"));

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
  iosActivityType = self->_iosActivityType;
  if (iosActivityType)
    objc_msgSend(v3, "setObject:forKey:", iosActivityType, CFSTR("ios_activity_type"));
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDigitalReplicaAd);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("is_digital_replica_ad"));

  }
  externalWeblinkUrl = self->_externalWeblinkUrl;
  if (externalWeblinkUrl)
    objc_msgSend(v3, "setObject:forKey:", externalWeblinkUrl, CFSTR("external_weblink_url"));
  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("personalization_treatment_id"));

    v36 = self->_has;
  }
  if ((*(_DWORD *)&v36 & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isGroupedArticle);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("is_grouped_article"));

  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v3, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  v40 = self->_has;
  if ((*(_WORD *)&v40 & 0x200) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = off_24CD503C8[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("group_type"));

    v40 = self->_has;
    if ((*(_DWORD *)&v40 & 0x1000000) == 0)
    {
LABEL_71:
      if ((*(_DWORD *)&v40 & 0x100000) == 0)
        goto LABEL_72;
      goto LABEL_95;
    }
  }
  else if ((*(_DWORD *)&v40 & 0x1000000) == 0)
  {
    goto LABEL_71;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToSourceChannel);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("is_paid_subscriber_to_source_channel"));

  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x100000) == 0)
  {
LABEL_72:
    if ((*(_DWORD *)&v40 & 0x800000) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_95:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFreeArticle);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("is_free_article"));

  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_73:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNotificationArticle);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("is_notification_article"));

  }
LABEL_74:
  notificationId = self->_notificationId;
  if (notificationId)
    objc_msgSend(v3, "setObject:forKey:", notificationId, CFSTR("notification_id"));
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  v46 = self->_has;
  if ((*(_DWORD *)&v46 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCoverArticle);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("is_cover_article"));

    v46 = self->_has;
    if ((*(_DWORD *)&v46 & 0x10000) == 0)
    {
LABEL_84:
      if ((*(_WORD *)&v46 & 0x400) == 0)
        goto LABEL_99;
      goto LABEL_90;
    }
  }
  else if ((*(_DWORD *)&v46 & 0x10000) == 0)
  {
    goto LABEL_84;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fromNextArticleAffordanceTap);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("from_next_article_affordance_tap"));

  if ((*(_DWORD *)&self->_has & 0x400) == 0)
    goto LABEL_99;
LABEL_90:
  nextArticleAffordanceType = self->_nextArticleAffordanceType;
  if (nextArticleAffordanceType >= 0x10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_nextArticleAffordanceType);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = off_24CD50508[nextArticleAffordanceType];
  }
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("next_article_affordance_type"));

LABEL_99:
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if (nextArticleAffordanceTypeFeedId)
    objc_msgSend(v3, "setObject:forKey:", nextArticleAffordanceTypeFeedId, CFSTR("next_article_affordance_type_feed_id"));
  v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBreakingNewsArticle);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v88, CFSTR("is_breaking_news_article"));

    v56 = self->_has;
    if ((*(_WORD *)&v56 & 0x8000) == 0)
    {
LABEL_103:
      if ((*(_DWORD *)&v56 & 0x4000000) == 0)
        goto LABEL_104;
      goto LABEL_154;
    }
  }
  else if ((*(_WORD *)&v56 & 0x8000) == 0)
  {
    goto LABEL_103;
  }
  topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_topStoryType);
    v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v90 = off_24CD50588[topStoryType];
  }
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("top_story_type"));

  v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x4000000) == 0)
  {
LABEL_104:
    if ((*(_DWORD *)&v56 & 0x2000000) == 0)
      goto LABEL_105;
    goto LABEL_155;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isTopStoryArticle);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("is_top_story_article"));

  v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x2000000) == 0)
  {
LABEL_105:
    if ((*(_DWORD *)&v56 & 0x400000) == 0)
      goto LABEL_107;
    goto LABEL_106;
  }
LABEL_155:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSearchResult);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("is_search_result"));

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_106:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNativeAd);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("is_native_ad"));

  }
LABEL_107:
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
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("widget_engagement"));

  }
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v64 = self->_fractionalCohortMemberships;
    v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v94 != v67)
            objc_enumerationMutation(v64);
          objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "dictionaryRepresentation");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "addObject:", v69);

        }
        v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
      }
      while (v66);
    }

    objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("fractional_cohort_membership"));
  }
  v70 = self->_has;
  if ((*(_BYTE *)&v70 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("publisher_article_version_int64"));

    v70 = self->_has;
  }
  if ((*(_BYTE *)&v70 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("backend_article_version_int64"));

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
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("previous_article_publisher_article_version"));

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
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("issue_exposure_data"));

  }
  channelData = self->_channelData;
  if (channelData)
  {
    -[NTPBChannelData dictionaryRepresentation](channelData, "dictionaryRepresentation");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v84, CFSTR("channel_data"));

  }
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v3, "setObject:forKey:", topicIds, CFSTR("topic_ids"));
  v86 = v3;

  return v86;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBShareResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v12;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v13;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v14;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v15;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_contentId)
    PBDataWriterWriteStringField();
  if (self->_referencedArticleId)
    PBDataWriterWriteStringField();
  if (self->_articleSessionId)
    PBDataWriterWriteDataField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedId)
    PBDataWriterWriteStringField();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x4000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x2000) == 0)
        goto LABEL_22;
      goto LABEL_133;
    }
  }
  else if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_133:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
LABEL_23:
    PBDataWriterWriteInt32Field();
LABEL_24:
  if (self->_language)
    PBDataWriterWriteStringField();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = self->_namedEntities;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }

  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = self->_has;
  }
  if ((*(_BYTE *)&v12 & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  if (self->_iosActivityType)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_externalWeblinkUrl)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x200000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x1000000) == 0)
    {
LABEL_63:
      if ((*(_DWORD *)&v14 & 0x100000) == 0)
        goto LABEL_64;
      goto LABEL_137;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
    goto LABEL_63;
  }
  PBDataWriterWriteBOOLField();
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_137:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
LABEL_65:
    PBDataWriterWriteBOOLField();
LABEL_66:
  if (self->_notificationId)
    PBDataWriterWriteStringField();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x10000) == 0)
    {
LABEL_76:
      if ((*(_WORD *)&v15 & 0x400) == 0)
        goto LABEL_78;
      goto LABEL_77;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
    goto LABEL_76;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_77:
    PBDataWriterWriteInt32Field();
LABEL_78:
  if (self->_nextArticleAffordanceTypeFeedId)
    PBDataWriterWriteStringField();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x8000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v16 & 0x4000000) == 0)
        goto LABEL_83;
      goto LABEL_144;
    }
  }
  else if ((*(_WORD *)&v16 & 0x8000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteInt32Field();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x4000000) == 0)
  {
LABEL_83:
    if ((*(_DWORD *)&v16 & 0x2000000) == 0)
      goto LABEL_84;
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x2000000) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v16 & 0x400000) == 0)
      goto LABEL_86;
    goto LABEL_85;
  }
LABEL_145:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
LABEL_85:
    PBDataWriterWriteBOOLField();
LABEL_86:
  if (self->_nativeCampaignData)
    PBDataWriterWriteStringField();
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  if (self->_widgetEngagement)
    PBDataWriterWriteSubmessage();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = self->_fractionalCohortMemberships;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v33;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v19);
  }

  v22 = self->_has;
  if ((*(_BYTE *)&v22 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v22 = self->_has;
  }
  if ((*(_BYTE *)&v22 & 1) != 0)
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
  if (self->_channelData)
    PBDataWriterWriteSubmessage();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = self->_topicIds;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v29;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteStringField();
        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    }
    while (v25);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  _DWORD *v6;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has;
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
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v44;
  uint64_t v45;
  void *v46;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v56;
  uint64_t v57;
  void *v58;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  NSMutableArray *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  NSMutableArray *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  _DWORD *v97;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v5 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v5[82] = self->_resultType;
    v5[105] |= 0x1000u;
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    v5[28] = self->_contentType;
    v5[105] |= 0x80u;
  }
  v8 = -[NSString copyWithZone:](self->_contentId, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 13);
  *((_QWORD *)v6 + 13) = v8;

  v10 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v6 + 40);
  *((_QWORD *)v6 + 40) = v10;

  v12 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v6 + 5);
  *((_QWORD *)v6 + 5) = v12;

  v14 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v6 + 7);
  *((_QWORD *)v6 + 7) = v14;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    v6[36] = self->_feedType;
    v6[105] |= 0x100u;
  }
  v16 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v17 = (void *)*((_QWORD *)v6 + 17);
  *((_QWORD *)v6 + 17) = v16;

  v18 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v19 = (void *)*((_QWORD *)v6 + 19);
  *((_QWORD *)v6 + 19) = v18;

  v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x8000000) != 0)
  {
    *((_BYTE *)v6 + 419) = self->_isUserSubscribedToFeed;
    v6[105] |= 0x8000000u;
    v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x4000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v20 & 0x2000) == 0)
        goto LABEL_10;
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&v20 & 0x4000) == 0)
  {
    goto LABEL_9;
  }
  v6[87] = self->_shareMethod;
  v6[105] |= 0x4000u;
  v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v20 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_69:
  v6[86] = self->_shareLocation;
  v6[105] |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    v6[24] = self->_characterCount;
    v6[105] |= 0x40u;
  }
LABEL_12:
  v21 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v22 = (void *)*((_QWORD *)v6 + 31);
  *((_QWORD *)v6 + 31) = v21;

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v23 = self->_namedEntities;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v108;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v108 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * v27), "copyWithZone:", a3);
        objc_msgSend(v6, "addNamedEntities:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v107, v113, 16);
    }
    while (v25);
  }

  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) != 0)
  {
    v6[78] = self->_publisherArticleVersion;
    v6[105] |= 0x800u;
    v29 = self->_has;
  }
  if ((*(_BYTE *)&v29 & 0x20) != 0)
  {
    v6[16] = self->_backendArticleVersion;
    v6[105] |= 0x20u;
  }
  v30 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v31 = (void *)*((_QWORD *)v6 + 44);
  *((_QWORD *)v6 + 44) = v30;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6[12] = self->_articleType;
    v6[105] |= 0x10u;
  }
  v32 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v33 = (void *)*((_QWORD *)v6 + 45);
  *((_QWORD *)v6 + 45) = v32;

  v34 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v35 = (void *)*((_QWORD *)v6 + 46);
  *((_QWORD *)v6 + 46) = v34;

  v36 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v37 = (void *)*((_QWORD *)v6 + 47);
  *((_QWORD *)v6 + 47) = v36;

  v38 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v39 = (void *)*((_QWORD *)v6 + 42);
  *((_QWORD *)v6 + 42) = v38;

  v40 = -[NSString copyWithZone:](self->_iosActivityType, "copyWithZone:", a3);
  v41 = (void *)*((_QWORD *)v6 + 28);
  *((_QWORD *)v6 + 28) = v40;

  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
  {
    *((_BYTE *)v6 + 411) = self->_isDigitalReplicaAd;
    v6[105] |= 0x80000u;
  }
  v42 = -[NSString copyWithZone:](self->_externalWeblinkUrl, "copyWithZone:", a3);
  v43 = (void *)*((_QWORD *)v6 + 16);
  *((_QWORD *)v6 + 16) = v42;

  v44 = self->_has;
  if ((*(_BYTE *)&v44 & 2) != 0)
  {
    *((_QWORD *)v6 + 2) = self->_personalizationTreatmentId;
    v6[105] |= 2u;
    v44 = self->_has;
  }
  if ((*(_DWORD *)&v44 & 0x200000) != 0)
  {
    *((_BYTE *)v6 + 413) = self->_isGroupedArticle;
    v6[105] |= 0x200000u;
  }
  v45 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v46 = (void *)*((_QWORD *)v6 + 21);
  *((_QWORD *)v6 + 21) = v45;

  v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x200) != 0)
  {
    v6[44] = self->_groupType;
    v6[105] |= 0x200u;
    v47 = self->_has;
    if ((*(_DWORD *)&v47 & 0x1000000) == 0)
    {
LABEL_33:
      if ((*(_DWORD *)&v47 & 0x100000) == 0)
        goto LABEL_34;
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v47 & 0x1000000) == 0)
  {
    goto LABEL_33;
  }
  *((_BYTE *)v6 + 416) = self->_isPaidSubscriberToSourceChannel;
  v6[105] |= 0x1000000u;
  v47 = self->_has;
  if ((*(_DWORD *)&v47 & 0x100000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v47 & 0x800000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_73:
  *((_BYTE *)v6 + 412) = self->_isFreeArticle;
  v6[105] |= 0x100000u;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_35:
    *((_BYTE *)v6 + 415) = self->_isNotificationArticle;
    v6[105] |= 0x800000u;
  }
LABEL_36:
  v48 = -[NSString copyWithZone:](self->_notificationId, "copyWithZone:", a3);
  v49 = (void *)*((_QWORD *)v6 + 36);
  *((_QWORD *)v6 + 36) = v48;

  v50 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v51 = (void *)*((_QWORD *)v6 + 9);
  *((_QWORD *)v6 + 9) = v50;

  v52 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v53 = (void *)*((_QWORD *)v6 + 10);
  *((_QWORD *)v6 + 10) = v52;

  v54 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v55 = (void *)*((_QWORD *)v6 + 15);
  *((_QWORD *)v6 + 15) = v54;

  v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x40000) != 0)
  {
    *((_BYTE *)v6 + 410) = self->_isCoverArticle;
    v6[105] |= 0x40000u;
    v56 = self->_has;
    if ((*(_DWORD *)&v56 & 0x10000) == 0)
    {
LABEL_38:
      if ((*(_WORD *)&v56 & 0x400) == 0)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&v56 & 0x10000) == 0)
  {
    goto LABEL_38;
  }
  *((_BYTE *)v6 + 408) = self->_fromNextArticleAffordanceTap;
  v6[105] |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_39:
    v6[68] = self->_nextArticleAffordanceType;
    v6[105] |= 0x400u;
  }
LABEL_40:
  v57 = -[NSString copyWithZone:](self->_nextArticleAffordanceTypeFeedId, "copyWithZone:", a3);
  v58 = (void *)*((_QWORD *)v6 + 35);
  *((_QWORD *)v6 + 35) = v57;

  v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x20000) != 0)
  {
    *((_BYTE *)v6 + 409) = self->_isBreakingNewsArticle;
    v6[105] |= 0x20000u;
    v59 = self->_has;
    if ((*(_WORD *)&v59 & 0x8000) == 0)
    {
LABEL_42:
      if ((*(_DWORD *)&v59 & 0x4000000) == 0)
        goto LABEL_43;
      goto LABEL_80;
    }
  }
  else if ((*(_WORD *)&v59 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  v6[96] = self->_topStoryType;
  v6[105] |= 0x8000u;
  v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x4000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v59 & 0x2000000) == 0)
      goto LABEL_44;
    goto LABEL_81;
  }
LABEL_80:
  *((_BYTE *)v6 + 418) = self->_isTopStoryArticle;
  v6[105] |= 0x4000000u;
  v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x2000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v59 & 0x400000) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_81:
  *((_BYTE *)v6 + 417) = self->_isSearchResult;
  v6[105] |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_45:
    *((_BYTE *)v6 + 414) = self->_isNativeAd;
    v6[105] |= 0x400000u;
  }
LABEL_46:
  v60 = -[NSString copyWithZone:](self->_nativeCampaignData, "copyWithZone:", a3);
  v61 = (void *)*((_QWORD *)v6 + 33);
  *((_QWORD *)v6 + 33) = v60;

  v62 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v63 = (void *)*((_QWORD *)v6 + 37);
  *((_QWORD *)v6 + 37) = v62;

  v64 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v65 = (void *)*((_QWORD *)v6 + 38);
  *((_QWORD *)v6 + 38) = v64;

  v66 = -[NTPBWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v67 = (void *)*((_QWORD *)v6 + 50);
  *((_QWORD *)v6 + 50) = v66;

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v68 = self->_fractionalCohortMemberships;
  v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v104;
    do
    {
      v72 = 0;
      do
      {
        if (*(_QWORD *)v104 != v71)
          objc_enumerationMutation(v68);
        v73 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * v72), "copyWithZone:", a3);
        objc_msgSend(v6, "addFractionalCohortMembership:", v73);

        ++v72;
      }
      while (v70 != v72);
      v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
    }
    while (v70);
  }

  v74 = self->_has;
  if ((*(_BYTE *)&v74 & 8) != 0)
  {
    *((_QWORD *)v6 + 4) = self->_publisherArticleVersionInt64;
    v6[105] |= 8u;
    v74 = self->_has;
  }
  if ((*(_BYTE *)&v74 & 1) != 0)
  {
    *((_QWORD *)v6 + 1) = self->_backendArticleVersionInt64;
    v6[105] |= 1u;
  }
  v75 = -[NSString copyWithZone:](self->_iadNativeCampaign, "copyWithZone:", a3);
  v76 = (void *)*((_QWORD *)v6 + 25);
  *((_QWORD *)v6 + 25) = v75;

  v77 = -[NSString copyWithZone:](self->_iadNativeLine, "copyWithZone:", a3);
  v78 = (void *)*((_QWORD *)v6 + 27);
  *((_QWORD *)v6 + 27) = v77;

  v79 = -[NSString copyWithZone:](self->_iadNativeAd, "copyWithZone:", a3);
  v80 = (void *)*((_QWORD *)v6 + 24);
  *((_QWORD *)v6 + 24) = v79;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v6 + 3) = self->_previousArticlePublisherArticleVersion;
    v6[105] |= 4u;
  }
  v81 = -[NSString copyWithZone:](self->_iadNativeCampaignAd, "copyWithZone:", a3);
  v82 = (void *)*((_QWORD *)v6 + 26);
  *((_QWORD *)v6 + 26) = v81;

  v83 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v84 = (void *)*((_QWORD *)v6 + 23);
  *((_QWORD *)v6 + 23) = v83;

  v85 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v86 = (void *)*((_QWORD *)v6 + 29);
  *((_QWORD *)v6 + 29) = v85;

  v87 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v88 = (void *)*((_QWORD *)v6 + 30);
  *((_QWORD *)v6 + 30) = v87;

  v89 = -[NTPBChannelData copyWithZone:](self->_channelData, "copyWithZone:", a3);
  v90 = (void *)*((_QWORD *)v6 + 11);
  *((_QWORD *)v6 + 11) = v89;

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v91 = self->_topicIds;
  v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
  if (v92)
  {
    v93 = v92;
    v94 = *(_QWORD *)v100;
    do
    {
      v95 = 0;
      do
      {
        if (*(_QWORD *)v100 != v94)
          objc_enumerationMutation(v91);
        v96 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * v95), "copyWithZone:", a3, (_QWORD)v99);
        objc_msgSend(v6, "addTopicIds:", v96);

        ++v95;
      }
      while (v93 != v95);
      v93 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
    }
    while (v93);
  }

  v97 = v6;
  return v97;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has;
  int v6;
  NSString *contentId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  int v11;
  NSString *feedId;
  NSData *feedViewExposureId;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v14;
  int v15;
  NSString *language;
  NSMutableArray *namedEntities;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v18;
  int v19;
  NSString *sourceChannelId;
  int v21;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  NSString *iosActivityType;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v27;
  int v28;
  NSString *externalWeblinkUrl;
  int v30;
  NSString *groupFeedId;
  int v32;
  NSString *notificationId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v37;
  int v38;
  NSString *nextArticleAffordanceTypeFeedId;
  int v40;
  NSString *nativeCampaignData;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  NSMutableArray *fractionalCohortMemberships;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v46;
  int v47;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  int v51;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBChannelData *channelData;
  NSMutableArray *topicIds;
  char v58;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_252;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 105);
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_resultType != *((_DWORD *)v4 + 82))
      goto LABEL_252;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_contentType != *((_DWORD *)v4 + 28))
      goto LABEL_252;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_252;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((_QWORD *)v4 + 13) && !-[NSString isEqual:](contentId, "isEqual:"))
    goto LABEL_252;
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_252;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:"))
      goto LABEL_252;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_252;
  }
  v11 = *((_DWORD *)v4 + 105);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_feedType != *((_DWORD *)v4 + 36))
      goto LABEL_252;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_252;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 17) && !-[NSString isEqual:](feedId, "isEqual:"))
    goto LABEL_252;
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_252;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 105);
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    if ((v15 & 0x8000000) == 0)
      goto LABEL_252;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 419))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 419))
    {
      goto LABEL_252;
    }
  }
  else if ((v15 & 0x8000000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0 || self->_shareMethod != *((_DWORD *)v4 + 87))
      goto LABEL_252;
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_shareLocation != *((_DWORD *)v4 + 86))
      goto LABEL_252;
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_characterCount != *((_DWORD *)v4 + 24))
      goto LABEL_252;
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_252;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 31) && !-[NSString isEqual:](language, "isEqual:"))
    goto LABEL_252;
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_252;
  }
  v18 = self->_has;
  v19 = *((_DWORD *)v4 + 105);
  if ((*(_WORD *)&v18 & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 78))
      goto LABEL_252;
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_BYTE *)&v18 & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 16))
      goto LABEL_252;
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_252;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_252;
    v18 = self->_has;
  }
  v21 = *((_DWORD *)v4 + 105);
  if ((*(_BYTE *)&v18 & 0x10) != 0)
  {
    if ((v21 & 0x10) == 0 || self->_articleType != *((_DWORD *)v4 + 12))
      goto LABEL_252;
  }
  else if ((v21 & 0x10) != 0)
  {
    goto LABEL_252;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 45)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_252;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 46))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_252;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 47))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_252;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 42))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_252;
  }
  iosActivityType = self->_iosActivityType;
  if ((unint64_t)iosActivityType | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](iosActivityType, "isEqual:"))
      goto LABEL_252;
  }
  v27 = self->_has;
  v28 = *((_DWORD *)v4 + 105);
  if ((*(_DWORD *)&v27 & 0x80000) != 0)
  {
    if ((v28 & 0x80000) == 0)
      goto LABEL_252;
    if (self->_isDigitalReplicaAd)
    {
      if (!*((_BYTE *)v4 + 411))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 411))
    {
      goto LABEL_252;
    }
  }
  else if ((v28 & 0x80000) != 0)
  {
    goto LABEL_252;
  }
  externalWeblinkUrl = self->_externalWeblinkUrl;
  if ((unint64_t)externalWeblinkUrl | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](externalWeblinkUrl, "isEqual:"))
      goto LABEL_252;
    v27 = self->_has;
  }
  v30 = *((_DWORD *)v4 + 105);
  if ((*(_BYTE *)&v27 & 2) != 0)
  {
    if ((v30 & 2) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 2))
      goto LABEL_252;
  }
  else if ((v30 & 2) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v27 & 0x200000) != 0)
  {
    if ((v30 & 0x200000) == 0)
      goto LABEL_252;
    if (self->_isGroupedArticle)
    {
      if (!*((_BYTE *)v4 + 413))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 413))
    {
      goto LABEL_252;
    }
  }
  else if ((v30 & 0x200000) != 0)
  {
    goto LABEL_252;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_252;
    v27 = self->_has;
  }
  v32 = *((_DWORD *)v4 + 105);
  if ((*(_WORD *)&v27 & 0x200) != 0)
  {
    if ((v32 & 0x200) == 0 || self->_groupType != *((_DWORD *)v4 + 44))
      goto LABEL_252;
  }
  else if ((v32 & 0x200) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v27 & 0x1000000) != 0)
  {
    if ((v32 & 0x1000000) == 0)
      goto LABEL_252;
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((_BYTE *)v4 + 416))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 416))
    {
      goto LABEL_252;
    }
  }
  else if ((v32 & 0x1000000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v27 & 0x100000) != 0)
  {
    if ((v32 & 0x100000) == 0)
      goto LABEL_252;
    if (self->_isFreeArticle)
    {
      if (!*((_BYTE *)v4 + 412))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 412))
    {
      goto LABEL_252;
    }
  }
  else if ((v32 & 0x100000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v27 & 0x800000) != 0)
  {
    if ((v32 & 0x800000) == 0)
      goto LABEL_252;
    if (self->_isNotificationArticle)
    {
      if (!*((_BYTE *)v4 + 415))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 415))
    {
      goto LABEL_252;
    }
  }
  else if ((v32 & 0x800000) != 0)
  {
    goto LABEL_252;
  }
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((_QWORD *)v4 + 36)
    && !-[NSString isEqual:](notificationId, "isEqual:"))
  {
    goto LABEL_252;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_252;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_252;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_252;
  }
  v37 = self->_has;
  v38 = *((_DWORD *)v4 + 105);
  if ((*(_DWORD *)&v37 & 0x40000) != 0)
  {
    if ((v38 & 0x40000) == 0)
      goto LABEL_252;
    if (self->_isCoverArticle)
    {
      if (!*((_BYTE *)v4 + 410))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 410))
    {
      goto LABEL_252;
    }
  }
  else if ((v38 & 0x40000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v37 & 0x10000) != 0)
  {
    if ((v38 & 0x10000) == 0)
      goto LABEL_252;
    if (self->_fromNextArticleAffordanceTap)
    {
      if (!*((_BYTE *)v4 + 408))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 408))
    {
      goto LABEL_252;
    }
  }
  else if ((v38 & 0x10000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_WORD *)&v37 & 0x400) != 0)
  {
    if ((v38 & 0x400) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 68))
      goto LABEL_252;
  }
  else if ((v38 & 0x400) != 0)
  {
    goto LABEL_252;
  }
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if ((unint64_t)nextArticleAffordanceTypeFeedId | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](nextArticleAffordanceTypeFeedId, "isEqual:"))
      goto LABEL_252;
    v37 = self->_has;
  }
  v40 = *((_DWORD *)v4 + 105);
  if ((*(_DWORD *)&v37 & 0x20000) != 0)
  {
    if ((v40 & 0x20000) == 0)
      goto LABEL_252;
    if (self->_isBreakingNewsArticle)
    {
      if (!*((_BYTE *)v4 + 409))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 409))
    {
      goto LABEL_252;
    }
  }
  else if ((v40 & 0x20000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_WORD *)&v37 & 0x8000) != 0)
  {
    if ((v40 & 0x8000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 96))
      goto LABEL_252;
  }
  else if ((v40 & 0x8000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v37 & 0x4000000) != 0)
  {
    if ((v40 & 0x4000000) == 0)
      goto LABEL_252;
    if (self->_isTopStoryArticle)
    {
      if (!*((_BYTE *)v4 + 418))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 418))
    {
      goto LABEL_252;
    }
  }
  else if ((v40 & 0x4000000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v37 & 0x2000000) != 0)
  {
    if ((v40 & 0x2000000) == 0)
      goto LABEL_252;
    if (self->_isSearchResult)
    {
      if (!*((_BYTE *)v4 + 417))
        goto LABEL_252;
    }
    else if (*((_BYTE *)v4 + 417))
    {
      goto LABEL_252;
    }
  }
  else if ((v40 & 0x2000000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v37 & 0x400000) != 0)
  {
    if ((v40 & 0x400000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((_BYTE *)v4 + 414))
          goto LABEL_252;
        goto LABEL_209;
      }
      if (!*((_BYTE *)v4 + 414))
        goto LABEL_209;
    }
LABEL_252:
    v58 = 0;
    goto LABEL_253;
  }
  if ((v40 & 0x400000) != 0)
    goto LABEL_252;
LABEL_209:
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((_QWORD *)v4 + 33)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_252;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_252;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_252;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((_QWORD *)v4 + 50))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
      goto LABEL_252;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
      goto LABEL_252;
  }
  v46 = self->_has;
  v47 = *((_DWORD *)v4 + 105);
  if ((*(_BYTE *)&v46 & 8) != 0)
  {
    if ((v47 & 8) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 4))
      goto LABEL_252;
  }
  else if ((v47 & 8) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_BYTE *)&v46 & 1) != 0)
  {
    if ((v47 & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_252;
  }
  else if ((v47 & 1) != 0)
  {
    goto LABEL_252;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((_QWORD *)v4 + 25)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_252;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:"))
      goto LABEL_252;
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:"))
      goto LABEL_252;
  }
  v51 = *((_DWORD *)v4 + 105);
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v51 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 3))
      goto LABEL_252;
  }
  else if ((v51 & 4) != 0)
  {
    goto LABEL_252;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((_QWORD *)v4 + 26)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_252;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 23))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_252;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 29))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_252;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 30))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_252;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((_QWORD *)v4 + 11))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:"))
      goto LABEL_252;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 49))
    v58 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  else
    v58 = 1;
LABEL_253:

  return v58;
}

- (unint64_t)hash
{
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v4;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v5;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v6;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v7;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v8;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v9;
  NSUInteger v10;
  unint64_t v11;
  uint64_t v12;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  NSUInteger v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  uint64_t v46;
  uint64_t v47;
  NSUInteger v48;
  uint64_t v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  uint64_t v55;
  NSUInteger v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSUInteger v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSUInteger v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSUInteger v70;
  NSUInteger v71;
  uint64_t v72;
  uint64_t v73;

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v73 = 2654435761 * self->_resultType;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_3;
  }
  else
  {
    v73 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
LABEL_3:
      v72 = 2654435761 * self->_contentType;
      goto LABEL_6;
    }
  }
  v72 = 0;
LABEL_6:
  v71 = -[NSString hash](self->_contentId, "hash");
  v70 = -[NSString hash](self->_referencedArticleId, "hash");
  v69 = -[NSData hash](self->_articleSessionId, "hash");
  v68 = -[NSData hash](self->_articleViewingSessionId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v67 = 2654435761 * self->_feedType;
  else
    v67 = 0;
  v66 = -[NSString hash](self->_feedId, "hash");
  v65 = -[NSData hash](self->_feedViewExposureId, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
    v64 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
    {
LABEL_11:
      v63 = 2654435761 * self->_shareMethod;
      if ((*(_WORD *)&v4 & 0x2000) != 0)
        goto LABEL_12;
LABEL_16:
      v62 = 0;
      if ((*(_BYTE *)&v4 & 0x40) != 0)
        goto LABEL_13;
      goto LABEL_17;
    }
  }
  else
  {
    v64 = 0;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_11;
  }
  v63 = 0;
  if ((*(_WORD *)&v4 & 0x2000) == 0)
    goto LABEL_16;
LABEL_12:
  v62 = 2654435761 * self->_shareLocation;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
LABEL_13:
    v61 = 2654435761 * self->_characterCount;
    goto LABEL_18;
  }
LABEL_17:
  v61 = 0;
LABEL_18:
  v60 = -[NSString hash](self->_language, "hash");
  v59 = -[NSMutableArray hash](self->_namedEntities, "hash");
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
    v58 = 2654435761 * self->_publisherArticleVersion;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
      goto LABEL_20;
  }
  else
  {
    v58 = 0;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
    {
LABEL_20:
      v57 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_23;
    }
  }
  v57 = 0;
LABEL_23:
  v56 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v55 = 2654435761 * self->_articleType;
  else
    v55 = 0;
  v54 = -[NSString hash](self->_surfacedByChannelId, "hash");
  v53 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v52 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v51 = -[NSString hash](self->_sectionHeadlineId, "hash");
  v50 = -[NSString hash](self->_iosActivityType, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    v49 = 2654435761 * self->_isDigitalReplicaAd;
  else
    v49 = 0;
  v48 = -[NSString hash](self->_externalWeblinkUrl, "hash");
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
    v47 = 2654435761 * self->_personalizationTreatmentId;
    if ((*(_DWORD *)&v6 & 0x200000) != 0)
      goto LABEL_31;
  }
  else
  {
    v47 = 0;
    if ((*(_DWORD *)&v6 & 0x200000) != 0)
    {
LABEL_31:
      v46 = 2654435761 * self->_isGroupedArticle;
      goto LABEL_34;
    }
  }
  v46 = 0;
LABEL_34:
  v45 = -[NSString hash](self->_groupFeedId, "hash");
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    v44 = 2654435761 * self->_groupType;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0)
    {
LABEL_36:
      v43 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
      if ((*(_DWORD *)&v7 & 0x100000) != 0)
        goto LABEL_37;
LABEL_41:
      v42 = 0;
      if ((*(_DWORD *)&v7 & 0x800000) != 0)
        goto LABEL_38;
      goto LABEL_42;
    }
  }
  else
  {
    v44 = 0;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0)
      goto LABEL_36;
  }
  v43 = 0;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
    goto LABEL_41;
LABEL_37:
  v42 = 2654435761 * self->_isFreeArticle;
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
LABEL_38:
    v41 = 2654435761 * self->_isNotificationArticle;
    goto LABEL_43;
  }
LABEL_42:
  v41 = 0;
LABEL_43:
  v40 = -[NSString hash](self->_notificationId, "hash");
  v39 = -[NSString hash](self->_campaignId, "hash");
  v38 = -[NSString hash](self->_campaignType, "hash");
  v37 = -[NSString hash](self->_creativeId, "hash");
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    v36 = 0;
    if ((*(_DWORD *)&v8 & 0x10000) != 0)
      goto LABEL_45;
LABEL_48:
    v35 = 0;
    if ((*(_WORD *)&v8 & 0x400) != 0)
      goto LABEL_46;
    goto LABEL_49;
  }
  v36 = 2654435761 * self->_isCoverArticle;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
    goto LABEL_48;
LABEL_45:
  v35 = 2654435761 * self->_fromNextArticleAffordanceTap;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
LABEL_46:
    v34 = 2654435761 * self->_nextArticleAffordanceType;
    goto LABEL_50;
  }
LABEL_49:
  v34 = 0;
LABEL_50:
  v33 = -[NSString hash](self->_nextArticleAffordanceTypeFeedId, "hash");
  v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) != 0)
  {
    v32 = 2654435761 * self->_isBreakingNewsArticle;
    if ((*(_WORD *)&v9 & 0x8000) != 0)
    {
LABEL_52:
      v31 = 2654435761 * self->_topStoryType;
      if ((*(_DWORD *)&v9 & 0x4000000) != 0)
        goto LABEL_53;
      goto LABEL_58;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&v9 & 0x8000) != 0)
      goto LABEL_52;
  }
  v31 = 0;
  if ((*(_DWORD *)&v9 & 0x4000000) != 0)
  {
LABEL_53:
    v30 = 2654435761 * self->_isTopStoryArticle;
    if ((*(_DWORD *)&v9 & 0x2000000) != 0)
      goto LABEL_54;
LABEL_59:
    v29 = 0;
    if ((*(_DWORD *)&v9 & 0x400000) != 0)
      goto LABEL_55;
    goto LABEL_60;
  }
LABEL_58:
  v30 = 0;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
    goto LABEL_59;
LABEL_54:
  v29 = 2654435761 * self->_isSearchResult;
  if ((*(_DWORD *)&v9 & 0x400000) != 0)
  {
LABEL_55:
    v28 = 2654435761 * self->_isNativeAd;
    goto LABEL_61;
  }
LABEL_60:
  v28 = 0;
LABEL_61:
  v27 = -[NSString hash](self->_nativeCampaignData, "hash");
  v26 = -[NSString hash](self->_previousArticleId, "hash");
  v10 = -[NSString hash](self->_previousArticleVersion, "hash");
  v11 = -[NTPBWidgetEngagement hash](self->_widgetEngagement, "hash");
  v12 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 8) != 0)
  {
    v14 = 2654435761 * self->_publisherArticleVersionInt64;
    if ((*(_BYTE *)&v13 & 1) != 0)
      goto LABEL_63;
  }
  else
  {
    v14 = 0;
    if ((*(_BYTE *)&v13 & 1) != 0)
    {
LABEL_63:
      v15 = 2654435761 * self->_backendArticleVersionInt64;
      goto LABEL_66;
    }
  }
  v15 = 0;
LABEL_66:
  v16 = -[NSString hash](self->_iadNativeCampaign, "hash");
  v17 = -[NSString hash](self->_iadNativeLine, "hash");
  v18 = -[NSString hash](self->_iadNativeAd, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v19 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  else
    v19 = 0;
  v20 = v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[NSString hash](self->_iadNativeCampaignAd, "hash");
  v21 = v72 ^ v73 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v10 ^ v20 ^ -[NSData hash](self->_groupViewExposureId, "hash");
  v22 = -[NTPBIssueData hash](self->_issueData, "hash");
  v23 = v22 ^ -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  v24 = v23 ^ -[NTPBChannelData hash](self->_channelData, "hash");
  return v21 ^ v24 ^ -[NSMutableArray hash](self->_topicIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  int v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  int v25;
  NTPBIssueData *issueData;
  uint64_t v27;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v29;
  NTPBChannelData *channelData;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
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
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = v4[105];
  if ((v6 & 0x1000) != 0)
  {
    self->_resultType = v4[82];
    *(_DWORD *)&self->_has |= 0x1000u;
    v6 = v4[105];
  }
  if ((v6 & 0x80) != 0)
  {
    self->_contentType = v4[28];
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 13))
    -[NTPBShareResult setContentId:](self, "setContentId:");
  if (*((_QWORD *)v5 + 40))
    -[NTPBShareResult setReferencedArticleId:](self, "setReferencedArticleId:");
  if (*((_QWORD *)v5 + 5))
    -[NTPBShareResult setArticleSessionId:](self, "setArticleSessionId:");
  if (*((_QWORD *)v5 + 7))
    -[NTPBShareResult setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  if ((*((_BYTE *)v5 + 421) & 1) != 0)
  {
    self->_feedType = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v5 + 17))
    -[NTPBShareResult setFeedId:](self, "setFeedId:");
  if (*((_QWORD *)v5 + 19))
    -[NTPBShareResult setFeedViewExposureId:](self, "setFeedViewExposureId:");
  v7 = *((_DWORD *)v5 + 105);
  if ((v7 & 0x8000000) != 0)
  {
    self->_isUserSubscribedToFeed = *((_BYTE *)v5 + 419);
    *(_DWORD *)&self->_has |= 0x8000000u;
    v7 = *((_DWORD *)v5 + 105);
    if ((v7 & 0x4000) == 0)
    {
LABEL_21:
      if ((v7 & 0x2000) == 0)
        goto LABEL_22;
      goto LABEL_97;
    }
  }
  else if ((v7 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  self->_shareMethod = *((_DWORD *)v5 + 87);
  *(_DWORD *)&self->_has |= 0x4000u;
  v7 = *((_DWORD *)v5 + 105);
  if ((v7 & 0x2000) == 0)
  {
LABEL_22:
    if ((v7 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_97:
  self->_shareLocation = *((_DWORD *)v5 + 86);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 105) & 0x40) != 0)
  {
LABEL_23:
    self->_characterCount = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_24:
  if (*((_QWORD *)v5 + 31))
    -[NTPBShareResult setLanguage:](self, "setLanguage:");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = *((id *)v5 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        -[NTPBShareResult addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v10);
  }

  v13 = *((_DWORD *)v5 + 105);
  if ((v13 & 0x800) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 78);
    *(_DWORD *)&self->_has |= 0x800u;
    v13 = *((_DWORD *)v5 + 105);
  }
  if ((v13 & 0x20) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v5 + 16);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v5 + 44))
    -[NTPBShareResult setSourceChannelId:](self, "setSourceChannelId:");
  if ((*((_BYTE *)v5 + 420) & 0x10) != 0)
  {
    self->_articleType = *((_DWORD *)v5 + 12);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v5 + 45))
    -[NTPBShareResult setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v5 + 46))
    -[NTPBShareResult setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v5 + 47))
    -[NTPBShareResult setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 42))
    -[NTPBShareResult setSectionHeadlineId:](self, "setSectionHeadlineId:");
  if (*((_QWORD *)v5 + 28))
    -[NTPBShareResult setIosActivityType:](self, "setIosActivityType:");
  if ((*((_BYTE *)v5 + 422) & 8) != 0)
  {
    self->_isDigitalReplicaAd = *((_BYTE *)v5 + 411);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
  if (*((_QWORD *)v5 + 16))
    -[NTPBShareResult setExternalWeblinkUrl:](self, "setExternalWeblinkUrl:");
  v14 = *((_DWORD *)v5 + 105);
  if ((v14 & 2) != 0)
  {
    self->_personalizationTreatmentId = *((_QWORD *)v5 + 2);
    *(_DWORD *)&self->_has |= 2u;
    v14 = *((_DWORD *)v5 + 105);
  }
  if ((v14 & 0x200000) != 0)
  {
    self->_isGroupedArticle = *((_BYTE *)v5 + 413);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
  if (*((_QWORD *)v5 + 21))
    -[NTPBShareResult setGroupFeedId:](self, "setGroupFeedId:");
  v15 = *((_DWORD *)v5 + 105);
  if ((v15 & 0x200) != 0)
  {
    self->_groupType = *((_DWORD *)v5 + 44);
    *(_DWORD *)&self->_has |= 0x200u;
    v15 = *((_DWORD *)v5 + 105);
    if ((v15 & 0x1000000) == 0)
    {
LABEL_63:
      if ((v15 & 0x100000) == 0)
        goto LABEL_64;
      goto LABEL_101;
    }
  }
  else if ((v15 & 0x1000000) == 0)
  {
    goto LABEL_63;
  }
  self->_isPaidSubscriberToSourceChannel = *((_BYTE *)v5 + 416);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v15 = *((_DWORD *)v5 + 105);
  if ((v15 & 0x100000) == 0)
  {
LABEL_64:
    if ((v15 & 0x800000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_101:
  self->_isFreeArticle = *((_BYTE *)v5 + 412);
  *(_DWORD *)&self->_has |= 0x100000u;
  if ((*((_DWORD *)v5 + 105) & 0x800000) != 0)
  {
LABEL_65:
    self->_isNotificationArticle = *((_BYTE *)v5 + 415);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
LABEL_66:
  if (*((_QWORD *)v5 + 36))
    -[NTPBShareResult setNotificationId:](self, "setNotificationId:");
  if (*((_QWORD *)v5 + 9))
    -[NTPBShareResult setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v5 + 10))
    -[NTPBShareResult setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v5 + 15))
    -[NTPBShareResult setCreativeId:](self, "setCreativeId:");
  v16 = *((_DWORD *)v5 + 105);
  if ((v16 & 0x40000) != 0)
  {
    self->_isCoverArticle = *((_BYTE *)v5 + 410);
    *(_DWORD *)&self->_has |= 0x40000u;
    v16 = *((_DWORD *)v5 + 105);
    if ((v16 & 0x10000) == 0)
    {
LABEL_76:
      if ((v16 & 0x400) == 0)
        goto LABEL_78;
      goto LABEL_77;
    }
  }
  else if ((v16 & 0x10000) == 0)
  {
    goto LABEL_76;
  }
  self->_fromNextArticleAffordanceTap = *((_BYTE *)v5 + 408);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v5 + 105) & 0x400) != 0)
  {
LABEL_77:
    self->_nextArticleAffordanceType = *((_DWORD *)v5 + 68);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_78:
  if (*((_QWORD *)v5 + 35))
    -[NTPBShareResult setNextArticleAffordanceTypeFeedId:](self, "setNextArticleAffordanceTypeFeedId:");
  v17 = *((_DWORD *)v5 + 105);
  if ((v17 & 0x20000) != 0)
  {
    self->_isBreakingNewsArticle = *((_BYTE *)v5 + 409);
    *(_DWORD *)&self->_has |= 0x20000u;
    v17 = *((_DWORD *)v5 + 105);
    if ((v17 & 0x8000) == 0)
    {
LABEL_82:
      if ((v17 & 0x4000000) == 0)
        goto LABEL_83;
      goto LABEL_108;
    }
  }
  else if ((v17 & 0x8000) == 0)
  {
    goto LABEL_82;
  }
  self->_topStoryType = *((_DWORD *)v5 + 96);
  *(_DWORD *)&self->_has |= 0x8000u;
  v17 = *((_DWORD *)v5 + 105);
  if ((v17 & 0x4000000) == 0)
  {
LABEL_83:
    if ((v17 & 0x2000000) == 0)
      goto LABEL_84;
    goto LABEL_109;
  }
LABEL_108:
  self->_isTopStoryArticle = *((_BYTE *)v5 + 418);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v17 = *((_DWORD *)v5 + 105);
  if ((v17 & 0x2000000) == 0)
  {
LABEL_84:
    if ((v17 & 0x400000) == 0)
      goto LABEL_86;
    goto LABEL_85;
  }
LABEL_109:
  self->_isSearchResult = *((_BYTE *)v5 + 417);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v5 + 105) & 0x400000) != 0)
  {
LABEL_85:
    self->_isNativeAd = *((_BYTE *)v5 + 414);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_86:
  if (*((_QWORD *)v5 + 33))
    -[NTPBShareResult setNativeCampaignData:](self, "setNativeCampaignData:");
  if (*((_QWORD *)v5 + 37))
    -[NTPBShareResult setPreviousArticleId:](self, "setPreviousArticleId:");
  if (*((_QWORD *)v5 + 38))
    -[NTPBShareResult setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  widgetEngagement = self->_widgetEngagement;
  v19 = *((_QWORD *)v5 + 50);
  if (widgetEngagement)
  {
    if (v19)
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v19)
  {
    -[NTPBShareResult setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v20 = *((id *)v5 + 20);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(v20);
        -[NTPBShareResult addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v22);
  }

  v25 = *((_DWORD *)v5 + 105);
  if ((v25 & 8) != 0)
  {
    self->_publisherArticleVersionInt64 = *((_QWORD *)v5 + 4);
    *(_DWORD *)&self->_has |= 8u;
    v25 = *((_DWORD *)v5 + 105);
  }
  if ((v25 & 1) != 0)
  {
    self->_backendArticleVersionInt64 = *((_QWORD *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 25))
    -[NTPBShareResult setIadNativeCampaign:](self, "setIadNativeCampaign:");
  if (*((_QWORD *)v5 + 27))
    -[NTPBShareResult setIadNativeLine:](self, "setIadNativeLine:");
  if (*((_QWORD *)v5 + 24))
    -[NTPBShareResult setIadNativeAd:](self, "setIadNativeAd:");
  if ((*((_BYTE *)v5 + 420) & 4) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v5 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 26))
    -[NTPBShareResult setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  if (*((_QWORD *)v5 + 23))
    -[NTPBShareResult setGroupViewExposureId:](self, "setGroupViewExposureId:");
  issueData = self->_issueData;
  v27 = *((_QWORD *)v5 + 29);
  if (issueData)
  {
    if (v27)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v27)
  {
    -[NTPBShareResult setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v29 = *((_QWORD *)v5 + 30);
  if (issueExposureData)
  {
    if (v29)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v29)
  {
    -[NTPBShareResult setIssueExposureData:](self, "setIssueExposureData:");
  }
  channelData = self->_channelData;
  v31 = *((_QWORD *)v5 + 11);
  if (channelData)
  {
    if (v31)
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else if (v31)
  {
    -[NTPBShareResult setChannelData:](self, "setChannelData:");
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v32 = *((id *)v5 + 49);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(v32);
        -[NTPBShareResult addTopicIds:](self, "addTopicIds:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k), (_QWORD)v37);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v34);
  }

}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
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

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
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

- (NSString)iosActivityType
{
  return self->_iosActivityType;
}

- (void)setIosActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_iosActivityType, a3);
}

- (BOOL)isDigitalReplicaAd
{
  return self->_isDigitalReplicaAd;
}

- (NSString)externalWeblinkUrl
{
  return self->_externalWeblinkUrl;
}

- (void)setExternalWeblinkUrl:(id)a3
{
  objc_storeStrong((id *)&self->_externalWeblinkUrl, a3);
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

- (BOOL)isSearchResult
{
  return self->_isSearchResult;
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
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_nextArticleAffordanceTypeFeedId, 0);
  objc_storeStrong((id *)&self->_nativeCampaignData, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iosActivityType, 0);
  objc_storeStrong((id *)&self->_iadNativeLine, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaign, 0);
  objc_storeStrong((id *)&self->_iadNativeAd, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_externalWeblinkUrl, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
}

@end
