@implementation NTPBInAppWebEmbedExposure

- (int)moduleEventType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_moduleEventType;
  else
    return 0;
}

- (void)setModuleEventType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_moduleEventType = a3;
}

- (void)setHasModuleEventType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasModuleEventType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)moduleEventTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4CF38[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModuleEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MODULE_EVENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BREAKING_NEWS_MODULE_EVENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SPECIAL_EVENTS_MODULE_EVENT_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)moduleLocation
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_moduleLocation;
  else
    return 0;
}

- (void)setModuleLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_moduleLocation = a3;
}

- (void)setHasModuleLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasModuleLocation
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)moduleLocationAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4CF50[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModuleLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MODULE_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOR_YOU_MODULE_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_MODULE_EVENT_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setModuleItemCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_moduleItemCount = a3;
}

- (void)setHasModuleItemCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasModuleItemCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasModuleExposureId
{
  return self->_moduleExposureId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (int)webEmbedLocation
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_webEmbedLocation;
  else
    return 0;
}

- (void)setWebEmbedLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_webEmbedLocation = a3;
}

- (void)setHasWebEmbedLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWebEmbedLocation
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)webEmbedLocationAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4CF68[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWebEmbedLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WEB_EMBED_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_MODULE_WEB_EMBED_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_WEB_EMBED_LOCATION")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (void)setModuleItemPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_moduleItemPosition = a3;
}

- (void)setHasModuleItemPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasModuleItemPosition
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasWebEmbedId
{
  return self->_webEmbedId != 0;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD4CF80[a3];
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

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4D0C0[a3];
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

- (void)setDisplayRank:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_displayRank = a3;
}

- (void)setHasDisplayRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDisplayRank
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setArticleDisplayRankInGroup:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_articleDisplayRankInGroup = a3;
}

- (void)setHasArticleDisplayRankInGroup:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasArticleDisplayRankInGroup
{
  return *(_WORD *)&self->_has & 1;
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
  v8.super_class = (Class)NTPBInAppWebEmbedExposure;
  -[NTPBInAppWebEmbedExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBInAppWebEmbedExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  uint64_t moduleEventType;
  __CFString *v6;
  uint64_t moduleLocation;
  __CFString *v8;
  void *v9;
  NSData *moduleExposureId;
  NSData *feedViewExposureId;
  uint64_t webEmbedLocation;
  __CFString *v13;
  NSString *articleId;
  void *v15;
  NSString *webEmbedId;
  __int16 v17;
  void *v18;
  uint64_t groupType;
  __CFString *v21;
  uint64_t feedType;
  __CFString *v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    moduleEventType = self->_moduleEventType;
    if (moduleEventType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_moduleEventType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_24CD4CF38[moduleEventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("module_event_type"));

    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    moduleLocation = self->_moduleLocation;
    if (moduleLocation >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_moduleLocation);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_24CD4CF50[moduleLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("module_location"));

    has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_moduleItemCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("module_item_count"));

  }
  moduleExposureId = self->_moduleExposureId;
  if (moduleExposureId)
    objc_msgSend(v3, "setObject:forKey:", moduleExposureId, CFSTR("module_exposure_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    webEmbedLocation = self->_webEmbedLocation;
    if (webEmbedLocation >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_webEmbedLocation);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_24CD4CF68[webEmbedLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("web_embed_location"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_moduleItemPosition);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("module_item_position"));

  }
  webEmbedId = self->_webEmbedId;
  if (webEmbedId)
    objc_msgSend(v3, "setObject:forKey:", webEmbedId, CFSTR("web_embed_id"));
  v17 = (__int16)self->_has;
  if ((v17 & 8) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_24CD4CF80[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("group_type"));

    v17 = (__int16)self->_has;
    if ((v17 & 4) == 0)
    {
LABEL_30:
      if ((v17 & 2) == 0)
        goto LABEL_31;
LABEL_42:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_displayRank);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("display_rank"));

      if ((*(_WORD *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_32;
    }
  }
  else if ((v17 & 4) == 0)
  {
    goto LABEL_30;
  }
  feedType = self->_feedType;
  if (feedType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_24CD4D0C0[feedType];
  }
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("feed_type"));

  v17 = (__int16)self->_has;
  if ((v17 & 2) != 0)
    goto LABEL_42;
LABEL_31:
  if ((v17 & 1) != 0)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_articleDisplayRankInGroup);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("article_display_rank_in_group"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBInAppWebEmbedExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  id v6;

  v6 = a3;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_moduleExposureId)
    PBDataWriterWriteDataField();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_webEmbedId)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (__int16)self->_has;
    if ((v5 & 4) == 0)
    {
LABEL_19:
      if ((v5 & 2) == 0)
        goto LABEL_20;
LABEL_28:
      PBDataWriterWriteInt32Field();
      if ((*(_WORD *)&self->_has & 1) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
    goto LABEL_28;
LABEL_20:
  if ((v5 & 1) != 0)
LABEL_21:
    PBDataWriterWriteInt32Field();
LABEL_22:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int16 v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_moduleEventType;
    *(_WORD *)(v5 + 84) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 64) = self->_moduleLocation;
  *(_WORD *)(v5 + 84) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 56) = self->_moduleItemCount;
    *(_WORD *)(v5 + 84) |= 0x20u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_moduleExposureId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v8;

  v10 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_webEmbedLocation;
    *(_WORD *)(v6 + 84) |= 0x100u;
  }
  v12 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v12;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_moduleItemPosition;
    *(_WORD *)(v6 + 84) |= 0x40u;
  }
  v14 = -[NSString copyWithZone:](self->_webEmbedId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v14;

  v16 = (__int16)self->_has;
  if ((v16 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_groupType;
    *(_WORD *)(v6 + 84) |= 8u;
    v16 = (__int16)self->_has;
    if ((v16 & 4) == 0)
    {
LABEL_11:
      if ((v16 & 2) == 0)
        goto LABEL_12;
LABEL_20:
      *(_DWORD *)(v6 + 24) = self->_displayRank;
      *(_WORD *)(v6 + 84) |= 2u;
      if ((*(_WORD *)&self->_has & 1) == 0)
        return (id)v6;
      goto LABEL_13;
    }
  }
  else if ((v16 & 4) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v6 + 28) = self->_feedType;
  *(_WORD *)(v6 + 84) |= 4u;
  v16 = (__int16)self->_has;
  if ((v16 & 2) != 0)
    goto LABEL_20;
LABEL_12:
  if ((v16 & 1) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 8) = self->_articleDisplayRankInGroup;
    *(_WORD *)(v6 + 84) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSData *moduleExposureId;
  NSData *feedViewExposureId;
  __int16 v9;
  NSString *articleId;
  __int16 v11;
  NSString *webEmbedId;
  __int16 v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 42);
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_moduleEventType != *((_DWORD *)v4 + 11))
      goto LABEL_57;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_moduleLocation != *((_DWORD *)v4 + 16))
      goto LABEL_57;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_moduleItemCount != *((_DWORD *)v4 + 14))
      goto LABEL_57;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  moduleExposureId = self->_moduleExposureId;
  if ((unint64_t)moduleExposureId | *((_QWORD *)v4 + 6)
    && !-[NSData isEqual:](moduleExposureId, "isEqual:"))
  {
    goto LABEL_57;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_57;
  }
  v9 = (__int16)self->_has;
  if ((v9 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) == 0 || self->_webEmbedLocation != *((_DWORD *)v4 + 20))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 42) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_57;
    v9 = (__int16)self->_has;
  }
  v11 = *((_WORD *)v4 + 42);
  if ((v9 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_moduleItemPosition != *((_DWORD *)v4 + 15))
      goto LABEL_57;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((_QWORD *)v4 + 9))
  {
    if (-[NSString isEqual:](webEmbedId, "isEqual:"))
    {
      v9 = (__int16)self->_has;
      goto LABEL_37;
    }
LABEL_57:
    v14 = 0;
    goto LABEL_58;
  }
LABEL_37:
  v13 = *((_WORD *)v4 + 42);
  if ((v9 & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_groupType != *((_DWORD *)v4 + 10))
      goto LABEL_57;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((v9 & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_feedType != *((_DWORD *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((v9 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_displayRank != *((_DWORD *)v4 + 6))
      goto LABEL_57;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((v9 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_articleDisplayRankInGroup != *((_DWORD *)v4 + 2))
      goto LABEL_57;
    v14 = 1;
  }
  else
  {
    v14 = (v13 & 1) == 0;
  }
LABEL_58:

  return v14;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
    v18 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v18 = 2654435761 * self->_moduleEventType;
  if ((has & 0x80) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_moduleLocation;
  if ((has & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_moduleItemCount;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSData hash](self->_moduleExposureId, "hash");
  v7 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v8 = 2654435761 * self->_webEmbedLocation;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_articleId, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v10 = 2654435761 * self->_moduleItemPosition;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_webEmbedId, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    v13 = 2654435761 * self->_groupType;
    if ((v12 & 4) != 0)
    {
LABEL_16:
      v14 = 2654435761 * self->_feedType;
      if ((v12 & 2) != 0)
        goto LABEL_17;
LABEL_21:
      v15 = 0;
      if ((v12 & 1) != 0)
        goto LABEL_18;
LABEL_22:
      v16 = 0;
      return v4 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 4) != 0)
      goto LABEL_16;
  }
  v14 = 0;
  if ((v12 & 2) == 0)
    goto LABEL_21;
LABEL_17:
  v15 = 2654435761 * self->_displayRank;
  if ((v12 & 1) == 0)
    goto LABEL_22;
LABEL_18:
  v16 = 2654435761 * self->_articleDisplayRankInGroup;
  return v4 ^ v18 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v5 = *((_WORD *)v4 + 42);
  if ((v5 & 0x10) != 0)
  {
    self->_moduleEventType = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)v4 + 42);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_moduleLocation = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 42) & 0x20) != 0)
  {
LABEL_4:
    self->_moduleItemCount = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_5:
  v7 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBInAppWebEmbedExposure setModuleExposureId:](self, "setModuleExposureId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBInAppWebEmbedExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 42) & 0x100) != 0)
  {
    self->_webEmbedLocation = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBInAppWebEmbedExposure setArticleId:](self, "setArticleId:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 42) & 0x40) != 0)
  {
    self->_moduleItemPosition = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBInAppWebEmbedExposure setWebEmbedId:](self, "setWebEmbedId:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 8) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 42);
    if ((v6 & 4) == 0)
    {
LABEL_19:
      if ((v6 & 2) == 0)
        goto LABEL_20;
LABEL_28:
      self->_displayRank = *((_DWORD *)v4 + 6);
      *(_WORD *)&self->_has |= 2u;
      if ((*((_WORD *)v4 + 42) & 1) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_19;
  }
  self->_feedType = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 42);
  if ((v6 & 2) != 0)
    goto LABEL_28;
LABEL_20:
  if ((v6 & 1) != 0)
  {
LABEL_21:
    self->_articleDisplayRankInGroup = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_22:

}

- (int)moduleItemCount
{
  return self->_moduleItemCount;
}

- (NSData)moduleExposureId
{
  return self->_moduleExposureId;
}

- (void)setModuleExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_moduleExposureId, a3);
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (int)moduleItemPosition
{
  return self->_moduleItemPosition;
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
  objc_storeStrong((id *)&self->_webEmbedId, a3);
}

- (int)displayRank
{
  return self->_displayRank;
}

- (int)articleDisplayRankInGroup
{
  return self->_articleDisplayRankInGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_moduleExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
