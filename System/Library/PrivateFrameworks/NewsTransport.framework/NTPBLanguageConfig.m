@implementation NTPBLanguageConfig

- (BOOL)hasLanguageTag
{
  return self->_languageTag != 0;
}

- (BOOL)hasHiddenFeedId
{
  return self->_hiddenFeedId != 0;
}

- (BOOL)hasRootCategory
{
  return self->_rootCategory != 0;
}

- (void)clearPreSubscribedFeedIds
{
  -[NSMutableArray removeAllObjects](self->_preSubscribedFeedIds, "removeAllObjects");
}

- (void)addPreSubscribedFeedIds:(id)a3
{
  id v4;
  NSMutableArray *preSubscribedFeedIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preSubscribedFeedIds = self->_preSubscribedFeedIds;
  v8 = v4;
  if (!preSubscribedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_preSubscribedFeedIds;
    self->_preSubscribedFeedIds = v6;

    v4 = v8;
    preSubscribedFeedIds = self->_preSubscribedFeedIds;
  }
  -[NSMutableArray addObject:](preSubscribedFeedIds, "addObject:", v4);

}

- (unint64_t)preSubscribedFeedIdsCount
{
  return -[NSMutableArray count](self->_preSubscribedFeedIds, "count");
}

- (id)preSubscribedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preSubscribedFeedIds, "objectAtIndex:", a3);
}

+ (Class)preSubscribedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearOnboardingTagIds
{
  -[NSMutableArray removeAllObjects](self->_onboardingTagIds, "removeAllObjects");
}

- (void)addOnboardingTagIds:(id)a3
{
  id v4;
  NSMutableArray *onboardingTagIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  onboardingTagIds = self->_onboardingTagIds;
  v8 = v4;
  if (!onboardingTagIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_onboardingTagIds;
    self->_onboardingTagIds = v6;

    v4 = v8;
    onboardingTagIds = self->_onboardingTagIds;
  }
  -[NSMutableArray addObject:](onboardingTagIds, "addObject:", v4);

}

- (unint64_t)onboardingTagIdsCount
{
  return -[NSMutableArray count](self->_onboardingTagIds, "count");
}

- (id)onboardingTagIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_onboardingTagIds, "objectAtIndex:", a3);
}

+ (Class)onboardingTagIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTopStoriesConfig
{
  return self->_topStoriesConfig != 0;
}

- (void)clearPreSubscribedNotificationsChannelIds
{
  -[NSMutableArray removeAllObjects](self->_preSubscribedNotificationsChannelIds, "removeAllObjects");
}

- (void)addPreSubscribedNotificationsChannelIds:(id)a3
{
  id v4;
  NSMutableArray *preSubscribedNotificationsChannelIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preSubscribedNotificationsChannelIds = self->_preSubscribedNotificationsChannelIds;
  v8 = v4;
  if (!preSubscribedNotificationsChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_preSubscribedNotificationsChannelIds;
    self->_preSubscribedNotificationsChannelIds = v6;

    v4 = v8;
    preSubscribedNotificationsChannelIds = self->_preSubscribedNotificationsChannelIds;
  }
  -[NSMutableArray addObject:](preSubscribedNotificationsChannelIds, "addObject:", v4);

}

- (unint64_t)preSubscribedNotificationsChannelIdsCount
{
  return -[NSMutableArray count](self->_preSubscribedNotificationsChannelIds, "count");
}

- (id)preSubscribedNotificationsChannelIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preSubscribedNotificationsChannelIds, "objectAtIndex:", a3);
}

+ (Class)preSubscribedNotificationsChannelIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearRecommendedNotificationChannels
{
  -[NSMutableArray removeAllObjects](self->_recommendedNotificationChannels, "removeAllObjects");
}

- (void)addRecommendedNotificationChannels:(id)a3
{
  id v4;
  NSMutableArray *recommendedNotificationChannels;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recommendedNotificationChannels = self->_recommendedNotificationChannels;
  v8 = v4;
  if (!recommendedNotificationChannels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_recommendedNotificationChannels;
    self->_recommendedNotificationChannels = v6;

    v4 = v8;
    recommendedNotificationChannels = self->_recommendedNotificationChannels;
  }
  -[NSMutableArray addObject:](recommendedNotificationChannels, "addObject:", v4);

}

- (unint64_t)recommendedNotificationChannelsCount
{
  return -[NSMutableArray count](self->_recommendedNotificationChannels, "count");
}

- (id)recommendedNotificationChannelsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recommendedNotificationChannels, "objectAtIndex:", a3);
}

+ (Class)recommendedNotificationChannelsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCoverArticlesConfig
{
  return self->_coverArticlesConfig != 0;
}

- (BOOL)hasAppleEditorialChannelId
{
  return self->_appleEditorialChannelId != 0;
}

- (BOOL)hasForYouConfigId
{
  return self->_forYouConfigId != 0;
}

- (BOOL)hasBriefingsTagId
{
  return self->_briefingsTagId != 0;
}

- (BOOL)hasTrendingTagId
{
  return self->_trendingTagId != 0;
}

- (BOOL)hasFeaturedStoriesTagId
{
  return self->_featuredStoriesTagId != 0;
}

- (BOOL)hasSavedStoriesTagId
{
  return self->_savedStoriesTagId != 0;
}

- (BOOL)hasWidgetSectionConfigId
{
  return self->_widgetSectionConfigId != 0;
}

- (BOOL)hasEditorialGemsSectionId
{
  return self->_editorialGemsSectionId != 0;
}

- (BOOL)hasExploreArticleId
{
  return self->_exploreArticleId != 0;
}

- (BOOL)hasBreakingNewsChannelId
{
  return self->_breakingNewsChannelId != 0;
}

- (void)clearMediaSharingBlacklistedChannelIds
{
  -[NSMutableArray removeAllObjects](self->_mediaSharingBlacklistedChannelIds, "removeAllObjects");
}

- (void)addMediaSharingBlacklistedChannelIds:(id)a3
{
  id v4;
  NSMutableArray *mediaSharingBlacklistedChannelIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mediaSharingBlacklistedChannelIds = self->_mediaSharingBlacklistedChannelIds;
  v8 = v4;
  if (!mediaSharingBlacklistedChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_mediaSharingBlacklistedChannelIds;
    self->_mediaSharingBlacklistedChannelIds = v6;

    v4 = v8;
    mediaSharingBlacklistedChannelIds = self->_mediaSharingBlacklistedChannelIds;
  }
  -[NSMutableArray addObject:](mediaSharingBlacklistedChannelIds, "addObject:", v4);

}

- (unint64_t)mediaSharingBlacklistedChannelIdsCount
{
  return -[NSMutableArray count](self->_mediaSharingBlacklistedChannelIds, "count");
}

- (id)mediaSharingBlacklistedChannelIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mediaSharingBlacklistedChannelIds, "objectAtIndex:", a3);
}

+ (Class)mediaSharingBlacklistedChannelIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSpecialEventsChannelId
{
  return self->_specialEventsChannelId != 0;
}

- (BOOL)hasTopVideosChannelId
{
  return self->_topVideosChannelId != 0;
}

- (BOOL)hasMoreVideosChannelId
{
  return self->_moreVideosChannelId != 0;
}

- (BOOL)hasShareVideoPlayerConfig
{
  return self->_shareVideoPlayerConfig != 0;
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
  v8.super_class = (Class)NTPBLanguageConfig;
  -[NTPBLanguageConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBLanguageConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *languageTag;
  NSString *hiddenFeedId;
  NTPBCategory *rootCategory;
  void *v8;
  NSMutableArray *preSubscribedFeedIds;
  NSMutableArray *onboardingTagIds;
  NTPBTopStoriesConfig *topStoriesConfig;
  void *v12;
  NSMutableArray *preSubscribedNotificationsChannelIds;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NTPBCoverArticlesConfig *coverArticlesConfig;
  void *v22;
  NSString *appleEditorialChannelId;
  NSString *forYouConfigId;
  NSString *briefingsTagId;
  NSString *trendingTagId;
  NSString *featuredStoriesTagId;
  NSString *savedStoriesTagId;
  NSString *widgetSectionConfigId;
  NSString *editorialGemsSectionId;
  NSString *exploreArticleId;
  NSString *breakingNewsChannelId;
  NSMutableArray *mediaSharingBlacklistedChannelIds;
  NSString *specialEventsChannelId;
  NSString *topVideosChannelId;
  NSString *moreVideosChannelId;
  NTPBVideoPlayerConfig *shareVideoPlayerConfig;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  languageTag = self->_languageTag;
  if (languageTag)
    objc_msgSend(v3, "setObject:forKey:", languageTag, CFSTR("language_tag"));
  hiddenFeedId = self->_hiddenFeedId;
  if (hiddenFeedId)
    objc_msgSend(v4, "setObject:forKey:", hiddenFeedId, CFSTR("hidden_feed_id"));
  rootCategory = self->_rootCategory;
  if (rootCategory)
  {
    -[NTPBCategory dictionaryRepresentation](rootCategory, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("root_category"));

  }
  preSubscribedFeedIds = self->_preSubscribedFeedIds;
  if (preSubscribedFeedIds)
    objc_msgSend(v4, "setObject:forKey:", preSubscribedFeedIds, CFSTR("pre_subscribed_feed_ids"));
  onboardingTagIds = self->_onboardingTagIds;
  if (onboardingTagIds)
    objc_msgSend(v4, "setObject:forKey:", onboardingTagIds, CFSTR("onboarding_tag_ids"));
  topStoriesConfig = self->_topStoriesConfig;
  if (topStoriesConfig)
  {
    -[NTPBTopStoriesConfig dictionaryRepresentation](topStoriesConfig, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("top_stories_config"));

  }
  preSubscribedNotificationsChannelIds = self->_preSubscribedNotificationsChannelIds;
  if (preSubscribedNotificationsChannelIds)
    objc_msgSend(v4, "setObject:forKey:", preSubscribedNotificationsChannelIds, CFSTR("pre_subscribed_notifications_channel_ids"));
  if (-[NSMutableArray count](self->_recommendedNotificationChannels, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_recommendedNotificationChannels, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v15 = self->_recommendedNotificationChannels;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v40);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("recommended_notification_channels"));
  }
  coverArticlesConfig = self->_coverArticlesConfig;
  if (coverArticlesConfig)
  {
    -[NTPBCoverArticlesConfig dictionaryRepresentation](coverArticlesConfig, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("cover_articles_config"));

  }
  appleEditorialChannelId = self->_appleEditorialChannelId;
  if (appleEditorialChannelId)
    objc_msgSend(v4, "setObject:forKey:", appleEditorialChannelId, CFSTR("apple_editorial_channel_id"));
  forYouConfigId = self->_forYouConfigId;
  if (forYouConfigId)
    objc_msgSend(v4, "setObject:forKey:", forYouConfigId, CFSTR("for_you_config_id"));
  briefingsTagId = self->_briefingsTagId;
  if (briefingsTagId)
    objc_msgSend(v4, "setObject:forKey:", briefingsTagId, CFSTR("briefings_tag_id"));
  trendingTagId = self->_trendingTagId;
  if (trendingTagId)
    objc_msgSend(v4, "setObject:forKey:", trendingTagId, CFSTR("trending_tag_id"));
  featuredStoriesTagId = self->_featuredStoriesTagId;
  if (featuredStoriesTagId)
    objc_msgSend(v4, "setObject:forKey:", featuredStoriesTagId, CFSTR("featured_stories_tag_id"));
  savedStoriesTagId = self->_savedStoriesTagId;
  if (savedStoriesTagId)
    objc_msgSend(v4, "setObject:forKey:", savedStoriesTagId, CFSTR("saved_stories_tag_id"));
  widgetSectionConfigId = self->_widgetSectionConfigId;
  if (widgetSectionConfigId)
    objc_msgSend(v4, "setObject:forKey:", widgetSectionConfigId, CFSTR("widget_section_config_id"));
  editorialGemsSectionId = self->_editorialGemsSectionId;
  if (editorialGemsSectionId)
    objc_msgSend(v4, "setObject:forKey:", editorialGemsSectionId, CFSTR("editorial_gems_section_id"));
  exploreArticleId = self->_exploreArticleId;
  if (exploreArticleId)
    objc_msgSend(v4, "setObject:forKey:", exploreArticleId, CFSTR("explore_article_id"));
  breakingNewsChannelId = self->_breakingNewsChannelId;
  if (breakingNewsChannelId)
    objc_msgSend(v4, "setObject:forKey:", breakingNewsChannelId, CFSTR("breaking_news_channel_id"));
  mediaSharingBlacklistedChannelIds = self->_mediaSharingBlacklistedChannelIds;
  if (mediaSharingBlacklistedChannelIds)
    objc_msgSend(v4, "setObject:forKey:", mediaSharingBlacklistedChannelIds, CFSTR("media_sharing_blacklisted_channel_ids"));
  specialEventsChannelId = self->_specialEventsChannelId;
  if (specialEventsChannelId)
    objc_msgSend(v4, "setObject:forKey:", specialEventsChannelId, CFSTR("special_events_channel_id"));
  topVideosChannelId = self->_topVideosChannelId;
  if (topVideosChannelId)
    objc_msgSend(v4, "setObject:forKey:", topVideosChannelId, CFSTR("top_videos_channel_id"));
  moreVideosChannelId = self->_moreVideosChannelId;
  if (moreVideosChannelId)
    objc_msgSend(v4, "setObject:forKey:", moreVideosChannelId, CFSTR("more_videos_channel_id"));
  shareVideoPlayerConfig = self->_shareVideoPlayerConfig;
  if (shareVideoPlayerConfig)
  {
    -[NTPBVideoPlayerConfig dictionaryRepresentation](shareVideoPlayerConfig, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("share_video_player_config"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLanguageConfigReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_languageTag)
    PBDataWriterWriteStringField();
  if (self->_hiddenFeedId)
    PBDataWriterWriteStringField();
  if (self->_rootCategory)
    PBDataWriterWriteSubmessage();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = self->_preSubscribedFeedIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v7);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = self->_onboardingTagIds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v12);
  }

  if (self->_topStoriesConfig)
    PBDataWriterWriteSubmessage();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_preSubscribedNotificationsChannelIds;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v17);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_recommendedNotificationChannels;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v35;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v35 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v51, 16);
    }
    while (v22);
  }

  if (self->_coverArticlesConfig)
    PBDataWriterWriteSubmessage();
  if (self->_appleEditorialChannelId)
    PBDataWriterWriteStringField();
  if (self->_forYouConfigId)
    PBDataWriterWriteStringField();
  if (self->_briefingsTagId)
    PBDataWriterWriteStringField();
  if (self->_trendingTagId)
    PBDataWriterWriteStringField();
  if (self->_featuredStoriesTagId)
    PBDataWriterWriteStringField();
  if (self->_savedStoriesTagId)
    PBDataWriterWriteStringField();
  if (self->_widgetSectionConfigId)
    PBDataWriterWriteStringField();
  if (self->_editorialGemsSectionId)
    PBDataWriterWriteStringField();
  if (self->_exploreArticleId)
    PBDataWriterWriteStringField();
  if (self->_breakingNewsChannelId)
    PBDataWriterWriteStringField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self->_mediaSharingBlacklistedChannelIds;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v30, v50, 16);
    }
    while (v27);
  }

  if (self->_specialEventsChannelId)
    PBDataWriterWriteStringField();
  if (self->_topVideosChannelId)
    PBDataWriterWriteStringField();
  if (self->_moreVideosChannelId)
    PBDataWriterWriteStringField();
  if (self->_shareVideoPlayerConfig)
    PBDataWriterWriteSubmessage();

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
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
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_languageTag, "copyWithZone:", a3);
  v7 = (void *)v5[10];
  v5[10] = v6;

  v8 = -[NSString copyWithZone:](self->_hiddenFeedId, "copyWithZone:", a3);
  v9 = (void *)v5[9];
  v5[9] = v8;

  v10 = -[NTPBCategory copyWithZone:](self->_rootCategory, "copyWithZone:", a3);
  v11 = (void *)v5[17];
  v5[17] = v10;

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v12 = self->_preSubscribedFeedIds;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v92;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v92 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * v16), "copyWithZone:", a3);
        objc_msgSend(v5, "addPreSubscribedFeedIds:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
    }
    while (v14);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v18 = self->_onboardingTagIds;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v88;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v88 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * v22), "copyWithZone:", a3);
        objc_msgSend(v5, "addOnboardingTagIds:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    }
    while (v20);
  }

  v24 = -[NTPBTopStoriesConfig copyWithZone:](self->_topStoriesConfig, "copyWithZone:", a3);
  v25 = (void *)v5[21];
  v5[21] = v24;

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v26 = self->_preSubscribedNotificationsChannelIds;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v84;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v84 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v30), "copyWithZone:", a3);
        objc_msgSend(v5, "addPreSubscribedNotificationsChannelIds:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v83, v97, 16);
    }
    while (v28);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v32 = self->_recommendedNotificationChannels;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v80;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v80 != v35)
          objc_enumerationMutation(v32);
        v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v36), "copyWithZone:", a3);
        objc_msgSend(v5, "addRecommendedNotificationChannels:", v37);

        ++v36;
      }
      while (v34 != v36);
      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v79, v96, 16);
    }
    while (v34);
  }

  v38 = -[NTPBCoverArticlesConfig copyWithZone:](self->_coverArticlesConfig, "copyWithZone:", a3);
  v39 = (void *)v5[4];
  v5[4] = v38;

  v40 = -[NSString copyWithZone:](self->_appleEditorialChannelId, "copyWithZone:", a3);
  v41 = (void *)v5[1];
  v5[1] = v40;

  v42 = -[NSString copyWithZone:](self->_forYouConfigId, "copyWithZone:", a3);
  v43 = (void *)v5[8];
  v5[8] = v42;

  v44 = -[NSString copyWithZone:](self->_briefingsTagId, "copyWithZone:", a3);
  v45 = (void *)v5[3];
  v5[3] = v44;

  v46 = -[NSString copyWithZone:](self->_trendingTagId, "copyWithZone:", a3);
  v47 = (void *)v5[23];
  v5[23] = v46;

  v48 = -[NSString copyWithZone:](self->_featuredStoriesTagId, "copyWithZone:", a3);
  v49 = (void *)v5[7];
  v5[7] = v48;

  v50 = -[NSString copyWithZone:](self->_savedStoriesTagId, "copyWithZone:", a3);
  v51 = (void *)v5[18];
  v5[18] = v50;

  v52 = -[NSString copyWithZone:](self->_widgetSectionConfigId, "copyWithZone:", a3);
  v53 = (void *)v5[24];
  v5[24] = v52;

  v54 = -[NSString copyWithZone:](self->_editorialGemsSectionId, "copyWithZone:", a3);
  v55 = (void *)v5[5];
  v5[5] = v54;

  v56 = -[NSString copyWithZone:](self->_exploreArticleId, "copyWithZone:", a3);
  v57 = (void *)v5[6];
  v5[6] = v56;

  v58 = -[NSString copyWithZone:](self->_breakingNewsChannelId, "copyWithZone:", a3);
  v59 = (void *)v5[2];
  v5[2] = v58;

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v60 = self->_mediaSharingBlacklistedChannelIds;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v76;
    do
    {
      v64 = 0;
      do
      {
        if (*(_QWORD *)v76 != v63)
          objc_enumerationMutation(v60);
        v65 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v64), "copyWithZone:", a3, (_QWORD)v75);
        objc_msgSend(v5, "addMediaSharingBlacklistedChannelIds:", v65);

        ++v64;
      }
      while (v62 != v64);
      v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
    }
    while (v62);
  }

  v66 = -[NSString copyWithZone:](self->_specialEventsChannelId, "copyWithZone:", a3);
  v67 = (void *)v5[20];
  v5[20] = v66;

  v68 = -[NSString copyWithZone:](self->_topVideosChannelId, "copyWithZone:", a3);
  v69 = (void *)v5[22];
  v5[22] = v68;

  v70 = -[NSString copyWithZone:](self->_moreVideosChannelId, "copyWithZone:", a3);
  v71 = (void *)v5[12];
  v5[12] = v70;

  v72 = -[NTPBVideoPlayerConfig copyWithZone:](self->_shareVideoPlayerConfig, "copyWithZone:", a3);
  v73 = (void *)v5[19];
  v5[19] = v72;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *languageTag;
  NSString *hiddenFeedId;
  NTPBCategory *rootCategory;
  NSMutableArray *preSubscribedFeedIds;
  NSMutableArray *onboardingTagIds;
  NTPBTopStoriesConfig *topStoriesConfig;
  NSMutableArray *preSubscribedNotificationsChannelIds;
  NSMutableArray *recommendedNotificationChannels;
  NTPBCoverArticlesConfig *coverArticlesConfig;
  NSString *appleEditorialChannelId;
  NSString *forYouConfigId;
  NSString *briefingsTagId;
  NSString *trendingTagId;
  NSString *featuredStoriesTagId;
  NSString *savedStoriesTagId;
  NSString *widgetSectionConfigId;
  NSString *editorialGemsSectionId;
  NSString *exploreArticleId;
  NSString *breakingNewsChannelId;
  NSMutableArray *mediaSharingBlacklistedChannelIds;
  NSString *specialEventsChannelId;
  NSString *topVideosChannelId;
  NSString *moreVideosChannelId;
  NTPBVideoPlayerConfig *shareVideoPlayerConfig;
  char v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_50;
  languageTag = self->_languageTag;
  if ((unint64_t)languageTag | v4[10])
  {
    if (!-[NSString isEqual:](languageTag, "isEqual:"))
      goto LABEL_50;
  }
  hiddenFeedId = self->_hiddenFeedId;
  if ((unint64_t)hiddenFeedId | v4[9] && !-[NSString isEqual:](hiddenFeedId, "isEqual:"))
    goto LABEL_50;
  rootCategory = self->_rootCategory;
  if ((unint64_t)rootCategory | v4[17] && !-[NTPBCategory isEqual:](rootCategory, "isEqual:"))
    goto LABEL_50;
  preSubscribedFeedIds = self->_preSubscribedFeedIds;
  if ((unint64_t)preSubscribedFeedIds | v4[14]
    && !-[NSMutableArray isEqual:](preSubscribedFeedIds, "isEqual:"))
  {
    goto LABEL_50;
  }
  onboardingTagIds = self->_onboardingTagIds;
  if ((unint64_t)onboardingTagIds | v4[13]
    && !-[NSMutableArray isEqual:](onboardingTagIds, "isEqual:"))
  {
    goto LABEL_50;
  }
  topStoriesConfig = self->_topStoriesConfig;
  if ((unint64_t)topStoriesConfig | v4[21] && !-[NTPBTopStoriesConfig isEqual:](topStoriesConfig, "isEqual:"))
    goto LABEL_50;
  preSubscribedNotificationsChannelIds = self->_preSubscribedNotificationsChannelIds;
  if ((unint64_t)preSubscribedNotificationsChannelIds | v4[15]
    && !-[NSMutableArray isEqual:](preSubscribedNotificationsChannelIds, "isEqual:"))
  {
    goto LABEL_50;
  }
  recommendedNotificationChannels = self->_recommendedNotificationChannels;
  if ((unint64_t)recommendedNotificationChannels | v4[16]
    && !-[NSMutableArray isEqual:](recommendedNotificationChannels, "isEqual:"))
  {
    goto LABEL_50;
  }
  coverArticlesConfig = self->_coverArticlesConfig;
  if ((unint64_t)coverArticlesConfig | v4[4]
    && !-[NTPBCoverArticlesConfig isEqual:](coverArticlesConfig, "isEqual:"))
  {
    goto LABEL_50;
  }
  appleEditorialChannelId = self->_appleEditorialChannelId;
  if ((unint64_t)appleEditorialChannelId | v4[1]
    && !-[NSString isEqual:](appleEditorialChannelId, "isEqual:"))
  {
    goto LABEL_50;
  }
  forYouConfigId = self->_forYouConfigId;
  if ((unint64_t)forYouConfigId | v4[8] && !-[NSString isEqual:](forYouConfigId, "isEqual:"))
    goto LABEL_50;
  briefingsTagId = self->_briefingsTagId;
  if ((unint64_t)briefingsTagId | v4[3] && !-[NSString isEqual:](briefingsTagId, "isEqual:"))
    goto LABEL_50;
  trendingTagId = self->_trendingTagId;
  if ((unint64_t)trendingTagId | v4[23] && !-[NSString isEqual:](trendingTagId, "isEqual:"))
    goto LABEL_50;
  featuredStoriesTagId = self->_featuredStoriesTagId;
  if ((unint64_t)featuredStoriesTagId | v4[7]
    && !-[NSString isEqual:](featuredStoriesTagId, "isEqual:"))
  {
    goto LABEL_50;
  }
  savedStoriesTagId = self->_savedStoriesTagId;
  if ((unint64_t)savedStoriesTagId | v4[18]
    && !-[NSString isEqual:](savedStoriesTagId, "isEqual:"))
  {
    goto LABEL_50;
  }
  widgetSectionConfigId = self->_widgetSectionConfigId;
  if ((unint64_t)widgetSectionConfigId | v4[24]
    && !-[NSString isEqual:](widgetSectionConfigId, "isEqual:"))
  {
    goto LABEL_50;
  }
  if (((editorialGemsSectionId = self->_editorialGemsSectionId, !((unint64_t)editorialGemsSectionId | v4[5]))
     || -[NSString isEqual:](editorialGemsSectionId, "isEqual:"))
    && ((exploreArticleId = self->_exploreArticleId, !((unint64_t)exploreArticleId | v4[6]))
     || -[NSString isEqual:](exploreArticleId, "isEqual:"))
    && ((breakingNewsChannelId = self->_breakingNewsChannelId, !((unint64_t)breakingNewsChannelId | v4[2]))
     || -[NSString isEqual:](breakingNewsChannelId, "isEqual:"))
    && ((mediaSharingBlacklistedChannelIds = self->_mediaSharingBlacklistedChannelIds,
         !((unint64_t)mediaSharingBlacklistedChannelIds | v4[11]))
     || -[NSMutableArray isEqual:](mediaSharingBlacklistedChannelIds, "isEqual:"))
    && ((specialEventsChannelId = self->_specialEventsChannelId, !((unint64_t)specialEventsChannelId | v4[20]))
     || -[NSString isEqual:](specialEventsChannelId, "isEqual:"))
    && ((topVideosChannelId = self->_topVideosChannelId, !((unint64_t)topVideosChannelId | v4[22]))
     || -[NSString isEqual:](topVideosChannelId, "isEqual:"))
    && ((moreVideosChannelId = self->_moreVideosChannelId, !((unint64_t)moreVideosChannelId | v4[12]))
     || -[NSString isEqual:](moreVideosChannelId, "isEqual:")))
  {
    shareVideoPlayerConfig = self->_shareVideoPlayerConfig;
    if ((unint64_t)shareVideoPlayerConfig | v4[19])
      v29 = -[NTPBVideoPlayerConfig isEqual:](shareVideoPlayerConfig, "isEqual:");
    else
      v29 = 1;
  }
  else
  {
LABEL_50:
    v29 = 0;
  }

  return v29;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;

  v3 = -[NSString hash](self->_languageTag, "hash");
  v4 = -[NSString hash](self->_hiddenFeedId, "hash") ^ v3;
  v5 = -[NTPBCategory hash](self->_rootCategory, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_preSubscribedFeedIds, "hash");
  v7 = -[NSMutableArray hash](self->_onboardingTagIds, "hash");
  v8 = v7 ^ -[NTPBTopStoriesConfig hash](self->_topStoriesConfig, "hash");
  v9 = v6 ^ v8 ^ -[NSMutableArray hash](self->_preSubscribedNotificationsChannelIds, "hash");
  v10 = -[NSMutableArray hash](self->_recommendedNotificationChannels, "hash");
  v11 = v10 ^ -[NTPBCoverArticlesConfig hash](self->_coverArticlesConfig, "hash");
  v12 = v11 ^ -[NSString hash](self->_appleEditorialChannelId, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_forYouConfigId, "hash");
  v14 = -[NSString hash](self->_briefingsTagId, "hash");
  v15 = v14 ^ -[NSString hash](self->_trendingTagId, "hash");
  v16 = v15 ^ -[NSString hash](self->_featuredStoriesTagId, "hash");
  v17 = v16 ^ -[NSString hash](self->_savedStoriesTagId, "hash");
  v18 = v13 ^ v17 ^ -[NSString hash](self->_widgetSectionConfigId, "hash");
  v19 = -[NSString hash](self->_editorialGemsSectionId, "hash");
  v20 = v19 ^ -[NSString hash](self->_exploreArticleId, "hash");
  v21 = v20 ^ -[NSString hash](self->_breakingNewsChannelId, "hash");
  v22 = v21 ^ -[NSMutableArray hash](self->_mediaSharingBlacklistedChannelIds, "hash");
  v23 = v22 ^ -[NSString hash](self->_specialEventsChannelId, "hash");
  v24 = v18 ^ v23 ^ -[NSString hash](self->_topVideosChannelId, "hash");
  v25 = -[NSString hash](self->_moreVideosChannelId, "hash");
  return v24 ^ v25 ^ -[NTPBVideoPlayerConfig hash](self->_shareVideoPlayerConfig, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NTPBCategory *rootCategory;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NTPBTopStoriesConfig *topStoriesConfig;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  NTPBCoverArticlesConfig *coverArticlesConfig;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  NTPBVideoPlayerConfig *shareVideoPlayerConfig;
  uint64_t v37;
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
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 10))
    -[NTPBLanguageConfig setLanguageTag:](self, "setLanguageTag:");
  if (*((_QWORD *)v4 + 9))
    -[NTPBLanguageConfig setHiddenFeedId:](self, "setHiddenFeedId:");
  rootCategory = self->_rootCategory;
  v6 = *((_QWORD *)v4 + 17);
  if (rootCategory)
  {
    if (v6)
      -[NTPBCategory mergeFrom:](rootCategory, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBLanguageConfig setRootCategory:](self, "setRootCategory:");
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v7 = *((id *)v4 + 14);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v55 != v10)
          objc_enumerationMutation(v7);
        -[NTPBLanguageConfig addPreSubscribedFeedIds:](self, "addPreSubscribedFeedIds:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v9);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v12 = *((id *)v4 + 13);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v51 != v15)
          objc_enumerationMutation(v12);
        -[NTPBLanguageConfig addOnboardingTagIds:](self, "addOnboardingTagIds:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v14);
  }

  topStoriesConfig = self->_topStoriesConfig;
  v18 = *((_QWORD *)v4 + 21);
  if (topStoriesConfig)
  {
    if (v18)
      -[NTPBTopStoriesConfig mergeFrom:](topStoriesConfig, "mergeFrom:");
  }
  else if (v18)
  {
    -[NTPBLanguageConfig setTopStoriesConfig:](self, "setTopStoriesConfig:");
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v19 = *((id *)v4 + 15);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(v19);
        -[NTPBLanguageConfig addPreSubscribedNotificationsChannelIds:](self, "addPreSubscribedNotificationsChannelIds:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v21);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = *((id *)v4 + 16);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v43;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v24);
        -[NTPBLanguageConfig addRecommendedNotificationChannels:](self, "addRecommendedNotificationChannels:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    }
    while (v26);
  }

  coverArticlesConfig = self->_coverArticlesConfig;
  v30 = *((_QWORD *)v4 + 4);
  if (coverArticlesConfig)
  {
    if (v30)
      -[NTPBCoverArticlesConfig mergeFrom:](coverArticlesConfig, "mergeFrom:");
  }
  else if (v30)
  {
    -[NTPBLanguageConfig setCoverArticlesConfig:](self, "setCoverArticlesConfig:");
  }
  if (*((_QWORD *)v4 + 1))
    -[NTPBLanguageConfig setAppleEditorialChannelId:](self, "setAppleEditorialChannelId:");
  if (*((_QWORD *)v4 + 8))
    -[NTPBLanguageConfig setForYouConfigId:](self, "setForYouConfigId:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBLanguageConfig setBriefingsTagId:](self, "setBriefingsTagId:");
  if (*((_QWORD *)v4 + 23))
    -[NTPBLanguageConfig setTrendingTagId:](self, "setTrendingTagId:");
  if (*((_QWORD *)v4 + 7))
    -[NTPBLanguageConfig setFeaturedStoriesTagId:](self, "setFeaturedStoriesTagId:");
  if (*((_QWORD *)v4 + 18))
    -[NTPBLanguageConfig setSavedStoriesTagId:](self, "setSavedStoriesTagId:");
  if (*((_QWORD *)v4 + 24))
    -[NTPBLanguageConfig setWidgetSectionConfigId:](self, "setWidgetSectionConfigId:");
  if (*((_QWORD *)v4 + 5))
    -[NTPBLanguageConfig setEditorialGemsSectionId:](self, "setEditorialGemsSectionId:");
  if (*((_QWORD *)v4 + 6))
    -[NTPBLanguageConfig setExploreArticleId:](self, "setExploreArticleId:");
  if (*((_QWORD *)v4 + 2))
    -[NTPBLanguageConfig setBreakingNewsChannelId:](self, "setBreakingNewsChannelId:");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = *((id *)v4 + 11);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v39;
    do
    {
      for (n = 0; n != v33; ++n)
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v31);
        -[NTPBLanguageConfig addMediaSharingBlacklistedChannelIds:](self, "addMediaSharingBlacklistedChannelIds:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * n), (_QWORD)v38);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
    }
    while (v33);
  }

  if (*((_QWORD *)v4 + 20))
    -[NTPBLanguageConfig setSpecialEventsChannelId:](self, "setSpecialEventsChannelId:");
  if (*((_QWORD *)v4 + 22))
    -[NTPBLanguageConfig setTopVideosChannelId:](self, "setTopVideosChannelId:");
  if (*((_QWORD *)v4 + 12))
    -[NTPBLanguageConfig setMoreVideosChannelId:](self, "setMoreVideosChannelId:");
  shareVideoPlayerConfig = self->_shareVideoPlayerConfig;
  v37 = *((_QWORD *)v4 + 19);
  if (shareVideoPlayerConfig)
  {
    if (v37)
      -[NTPBVideoPlayerConfig mergeFrom:](shareVideoPlayerConfig, "mergeFrom:");
  }
  else if (v37)
  {
    -[NTPBLanguageConfig setShareVideoPlayerConfig:](self, "setShareVideoPlayerConfig:");
  }

}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
  objc_storeStrong((id *)&self->_languageTag, a3);
}

- (NSString)hiddenFeedId
{
  return self->_hiddenFeedId;
}

- (void)setHiddenFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenFeedId, a3);
}

- (NTPBCategory)rootCategory
{
  return self->_rootCategory;
}

- (void)setRootCategory:(id)a3
{
  objc_storeStrong((id *)&self->_rootCategory, a3);
}

- (NSMutableArray)preSubscribedFeedIds
{
  return self->_preSubscribedFeedIds;
}

- (void)setPreSubscribedFeedIds:(id)a3
{
  objc_storeStrong((id *)&self->_preSubscribedFeedIds, a3);
}

- (NSMutableArray)onboardingTagIds
{
  return self->_onboardingTagIds;
}

- (void)setOnboardingTagIds:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingTagIds, a3);
}

- (NTPBTopStoriesConfig)topStoriesConfig
{
  return self->_topStoriesConfig;
}

- (void)setTopStoriesConfig:(id)a3
{
  objc_storeStrong((id *)&self->_topStoriesConfig, a3);
}

- (NSMutableArray)preSubscribedNotificationsChannelIds
{
  return self->_preSubscribedNotificationsChannelIds;
}

- (void)setPreSubscribedNotificationsChannelIds:(id)a3
{
  objc_storeStrong((id *)&self->_preSubscribedNotificationsChannelIds, a3);
}

- (NSMutableArray)recommendedNotificationChannels
{
  return self->_recommendedNotificationChannels;
}

- (void)setRecommendedNotificationChannels:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedNotificationChannels, a3);
}

- (NTPBCoverArticlesConfig)coverArticlesConfig
{
  return self->_coverArticlesConfig;
}

- (void)setCoverArticlesConfig:(id)a3
{
  objc_storeStrong((id *)&self->_coverArticlesConfig, a3);
}

- (NSString)appleEditorialChannelId
{
  return self->_appleEditorialChannelId;
}

- (void)setAppleEditorialChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_appleEditorialChannelId, a3);
}

- (NSString)forYouConfigId
{
  return self->_forYouConfigId;
}

- (void)setForYouConfigId:(id)a3
{
  objc_storeStrong((id *)&self->_forYouConfigId, a3);
}

- (NSString)briefingsTagId
{
  return self->_briefingsTagId;
}

- (void)setBriefingsTagId:(id)a3
{
  objc_storeStrong((id *)&self->_briefingsTagId, a3);
}

- (NSString)trendingTagId
{
  return self->_trendingTagId;
}

- (void)setTrendingTagId:(id)a3
{
  objc_storeStrong((id *)&self->_trendingTagId, a3);
}

- (NSString)featuredStoriesTagId
{
  return self->_featuredStoriesTagId;
}

- (void)setFeaturedStoriesTagId:(id)a3
{
  objc_storeStrong((id *)&self->_featuredStoriesTagId, a3);
}

- (NSString)savedStoriesTagId
{
  return self->_savedStoriesTagId;
}

- (void)setSavedStoriesTagId:(id)a3
{
  objc_storeStrong((id *)&self->_savedStoriesTagId, a3);
}

- (NSString)widgetSectionConfigId
{
  return self->_widgetSectionConfigId;
}

- (void)setWidgetSectionConfigId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSectionConfigId, a3);
}

- (NSString)editorialGemsSectionId
{
  return self->_editorialGemsSectionId;
}

- (void)setEditorialGemsSectionId:(id)a3
{
  objc_storeStrong((id *)&self->_editorialGemsSectionId, a3);
}

- (NSString)exploreArticleId
{
  return self->_exploreArticleId;
}

- (void)setExploreArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_exploreArticleId, a3);
}

- (NSString)breakingNewsChannelId
{
  return self->_breakingNewsChannelId;
}

- (void)setBreakingNewsChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_breakingNewsChannelId, a3);
}

- (NSMutableArray)mediaSharingBlacklistedChannelIds
{
  return self->_mediaSharingBlacklistedChannelIds;
}

- (void)setMediaSharingBlacklistedChannelIds:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSharingBlacklistedChannelIds, a3);
}

- (NSString)specialEventsChannelId
{
  return self->_specialEventsChannelId;
}

- (void)setSpecialEventsChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_specialEventsChannelId, a3);
}

- (NSString)topVideosChannelId
{
  return self->_topVideosChannelId;
}

- (void)setTopVideosChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_topVideosChannelId, a3);
}

- (NSString)moreVideosChannelId
{
  return self->_moreVideosChannelId;
}

- (void)setMoreVideosChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_moreVideosChannelId, a3);
}

- (NTPBVideoPlayerConfig)shareVideoPlayerConfig
{
  return self->_shareVideoPlayerConfig;
}

- (void)setShareVideoPlayerConfig:(id)a3
{
  objc_storeStrong((id *)&self->_shareVideoPlayerConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionConfigId, 0);
  objc_storeStrong((id *)&self->_trendingTagId, 0);
  objc_storeStrong((id *)&self->_topVideosChannelId, 0);
  objc_storeStrong((id *)&self->_topStoriesConfig, 0);
  objc_storeStrong((id *)&self->_specialEventsChannelId, 0);
  objc_storeStrong((id *)&self->_shareVideoPlayerConfig, 0);
  objc_storeStrong((id *)&self->_savedStoriesTagId, 0);
  objc_storeStrong((id *)&self->_rootCategory, 0);
  objc_storeStrong((id *)&self->_recommendedNotificationChannels, 0);
  objc_storeStrong((id *)&self->_preSubscribedNotificationsChannelIds, 0);
  objc_storeStrong((id *)&self->_preSubscribedFeedIds, 0);
  objc_storeStrong((id *)&self->_onboardingTagIds, 0);
  objc_storeStrong((id *)&self->_moreVideosChannelId, 0);
  objc_storeStrong((id *)&self->_mediaSharingBlacklistedChannelIds, 0);
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_hiddenFeedId, 0);
  objc_storeStrong((id *)&self->_forYouConfigId, 0);
  objc_storeStrong((id *)&self->_featuredStoriesTagId, 0);
  objc_storeStrong((id *)&self->_exploreArticleId, 0);
  objc_storeStrong((id *)&self->_editorialGemsSectionId, 0);
  objc_storeStrong((id *)&self->_coverArticlesConfig, 0);
  objc_storeStrong((id *)&self->_briefingsTagId, 0);
  objc_storeStrong((id *)&self->_breakingNewsChannelId, 0);
  objc_storeStrong((id *)&self->_appleEditorialChannelId, 0);
}

@end
