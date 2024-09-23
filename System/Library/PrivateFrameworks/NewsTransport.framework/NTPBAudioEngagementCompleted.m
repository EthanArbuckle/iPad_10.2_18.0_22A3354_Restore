@implementation NTPBAudioEngagementCompleted

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)groupType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasGroupType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD50D68[a3];
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

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (int)feedType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeedType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD50EA8[a3];
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

- (void)setTrackDuration:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_trackDuration = a3;
}

- (void)setHasTrackDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTrackDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)trackVariant
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_trackVariant;
  else
    return 0;
}

- (void)setTrackVariant:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_trackVariant = a3;
}

- (void)setHasTrackVariant:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTrackVariant
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)trackVariantAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD50F58[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrackVariant:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRACK_VARIANT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAMPLE_TRACK_VARIANT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMPLETE_TRACK_VARIANT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (void)setTimePlayed:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timePlayed = a3;
}

- (void)setHasTimePlayed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimePlayed
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasChannelData
{
  return self->_channelData != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setPlaybackSpeed:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_playbackSpeed = a3;
}

- (void)setHasPlaybackSpeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPlaybackSpeed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasEngagementId
{
  return self->_engagementId != 0;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *(_BYTE *)&self->_has >> 7;
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
  v8.super_class = (Class)NTPBAudioEngagementCompleted;
  -[NTPBAudioEngagementCompleted description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAudioEngagementCompleted dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *articleId;
  NSString *sourceChannelId;
  char has;
  void *v9;
  uint64_t groupType;
  __CFString *v11;
  NSString *groupFeedId;
  NSData *groupViewExposureId;
  uint64_t feedType;
  __CFString *v15;
  NSString *feedId;
  char v17;
  void *v18;
  uint64_t trackVariant;
  __CFString *v20;
  NSData *articleViewingSessionId;
  void *v22;
  NTPBIssueData *issueData;
  void *v24;
  NTPBIssueViewData *issueViewData;
  void *v26;
  NTPBChannelData *channelData;
  void *v28;
  NSString *language;
  void *v30;
  NSString *engagementId;
  void *v32;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v5, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("ad_supported_channel"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24CD50D68[groupType];
    }
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("group_type"));

  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v5, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v5, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_24CD50EA8[feedType];
    }
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("feed_type"));

  }
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v5, "setObject:forKey:", feedId, CFSTR("feed_id"));
  v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_trackDuration);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("track_duration"));

    v17 = (char)self->_has;
  }
  if ((v17 & 0x20) != 0)
  {
    trackVariant = self->_trackVariant;
    if (trackVariant >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_trackVariant);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_24CD50F58[trackVariant];
    }
    objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("track_variant"));

  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v5, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timePlayed);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("time_played"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("issue_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("issue_view_data"));

  }
  channelData = self->_channelData;
  if (channelData)
  {
    -[NTPBChannelData dictionaryRepresentation](channelData, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("channel_data"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v5, "setObject:forKey:", language, CFSTR("language"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(float *)&v4 = self->_playbackSpeed;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("playbackSpeed"));

  }
  engagementId = self->_engagementId;
  if (engagementId)
    objc_msgSend(v5, "setObject:forKey:", engagementId, CFSTR("engagement_id"));
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToSourceChannel);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("is_paid_subscriber_to_source_channel"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAudioEngagementCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_groupFeedId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_feedId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_issueViewData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_channelData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v7;
  }
  if (self->_engagementId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v8;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 140) = self->_adSupportedChannel;
    *(_BYTE *)(v5 + 144) |= 0x40u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_groupType;
    *(_BYTE *)(v5 + 144) |= 8u;
  }
  v11 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v13;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_feedType;
    *(_BYTE *)(v5 + 144) |= 4u;
  }
  v15 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_trackDuration;
    *(_BYTE *)(v5 + 144) |= 2u;
    v17 = (char)self->_has;
  }
  if ((v17 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_trackVariant;
    *(_BYTE *)(v5 + 144) |= 0x20u;
  }
  v18 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timePlayed;
    *(_BYTE *)(v5 + 144) |= 1u;
  }
  v20 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v20;

  v22 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v22;

  v24 = -[NTPBChannelData copyWithZone:](self->_channelData, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v24;

  v26 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v26;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(float *)(v5 + 120) = self->_playbackSpeed;
    *(_BYTE *)(v5 + 144) |= 0x10u;
  }
  v28 = -[NSString copyWithZone:](self->_engagementId, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v28;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_BYTE *)(v5 + 141) = self->_isPaidSubscriberToSourceChannel;
    *(_BYTE *)(v5 + 144) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *groupFeedId;
  NSData *groupViewExposureId;
  char has;
  NSString *feedId;
  NSData *articleViewingSessionId;
  NTPBIssueData *issueData;
  NTPBIssueViewData *issueViewData;
  NTPBChannelData *channelData;
  NSString *language;
  char v16;
  NSString *engagementId;
  int v18;
  BOOL v19;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_68;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_68;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_68;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[144] & 0x40) == 0)
      goto LABEL_68;
    if (self->_adSupportedChannel)
    {
      if (!v4[140])
        goto LABEL_68;
    }
    else if (v4[140])
    {
      goto LABEL_68;
    }
  }
  else if ((v4[144] & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[144] & 8) == 0 || self->_groupType != *((_DWORD *)v4 + 20))
      goto LABEL_68;
  }
  else if ((v4[144] & 8) != 0)
  {
    goto LABEL_68;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](groupFeedId, "isEqual:"))
  {
    goto LABEL_68;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_68;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((v4[144] & 4) == 0 || self->_feedType != *((_DWORD *)v4 + 16))
      goto LABEL_68;
  }
  else if ((v4[144] & 4) != 0)
  {
    goto LABEL_68;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_68;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((v4[144] & 2) == 0 || self->_trackDuration != *((_QWORD *)v4 + 2))
      goto LABEL_68;
  }
  else if ((v4[144] & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x20) != 0)
  {
    if ((v4[144] & 0x20) == 0 || self->_trackVariant != *((_DWORD *)v4 + 34))
      goto LABEL_68;
  }
  else if ((v4[144] & 0x20) != 0)
  {
    goto LABEL_68;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_68;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((v4[144] & 1) == 0 || self->_timePlayed != *((_QWORD *)v4 + 1))
      goto LABEL_68;
  }
  else if ((v4[144] & 1) != 0)
  {
    goto LABEL_68;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 12) && !-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    goto LABEL_68;
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 13))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_68;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((_QWORD *)v4 + 5))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:"))
      goto LABEL_68;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_68;
  }
  v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    if ((v4[144] & 0x10) == 0 || self->_playbackSpeed != *((float *)v4 + 30))
      goto LABEL_68;
  }
  else if ((v4[144] & 0x10) != 0)
  {
    goto LABEL_68;
  }
  engagementId = self->_engagementId;
  if ((unint64_t)engagementId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](engagementId, "isEqual:"))
      goto LABEL_68;
    v16 = (char)self->_has;
  }
  v18 = v4[144];
  if (v16 < 0)
  {
    if (v18 < 0)
    {
      if (self->_isPaidSubscriberToSourceChannel)
      {
        if (!v4[141])
          goto LABEL_68;
      }
      else if (v4[141])
      {
        goto LABEL_68;
      }
      v19 = 1;
      goto LABEL_69;
    }
LABEL_68:
    v19 = 0;
    goto LABEL_69;
  }
  v19 = v18 >= 0;
LABEL_69:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  unint64_t v10;
  float playbackSpeed;
  float v12;
  float v13;
  float v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;

  v27 = -[NSString hash](self->_articleId, "hash");
  v26 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v25 = 2654435761 * self->_adSupportedChannel;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v25 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_groupType;
      goto LABEL_6;
    }
  }
  v24 = 0;
LABEL_6:
  v23 = -[NSString hash](self->_groupFeedId, "hash");
  v22 = -[NSData hash](self->_groupViewExposureId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v21 = 2654435761 * self->_feedType;
  else
    v21 = 0;
  v20 = -[NSString hash](self->_feedId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v19 = 2654435761 * self->_trackDuration;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_11;
  }
  else
  {
    v19 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_11:
      v3 = -[NSData hash](self->_articleViewingSessionId, "hash", 2654435761 * self->_trackVariant);
      goto LABEL_14;
    }
  }
  v3 = -[NSData hash](self->_articleViewingSessionId, "hash", 0);
LABEL_14:
  v4 = v3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_timePlayed;
  else
    v5 = 0;
  v6 = -[NTPBIssueData hash](self->_issueData, "hash");
  v7 = -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  v8 = -[NTPBChannelData hash](self->_channelData, "hash");
  v9 = -[NSString hash](self->_language, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    playbackSpeed = self->_playbackSpeed;
    v12 = -playbackSpeed;
    if (playbackSpeed >= 0.0)
      v12 = self->_playbackSpeed;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = -[NSString hash](self->_engagementId, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v16 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
  else
    v16 = 0;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  char v6;
  NTPBIssueData *issueData;
  uint64_t v8;
  NTPBIssueViewData *issueViewData;
  uint64_t v10;
  NTPBChannelData *channelData;
  uint64_t v12;
  char *v13;

  v4 = (char *)a3;
  v13 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBAudioEngagementCompleted setArticleId:](self, "setArticleId:");
    v4 = v13;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[NTPBAudioEngagementCompleted setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v13;
  }
  v5 = v4[144];
  if ((v5 & 0x40) != 0)
  {
    self->_adSupportedChannel = v4[140];
    *(_BYTE *)&self->_has |= 0x40u;
    v5 = v4[144];
  }
  if ((v5 & 8) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBAudioEngagementCompleted setGroupFeedId:](self, "setGroupFeedId:");
    v4 = v13;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[NTPBAudioEngagementCompleted setGroupViewExposureId:](self, "setGroupViewExposureId:");
    v4 = v13;
  }
  if ((v4[144] & 4) != 0)
  {
    self->_feedType = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBAudioEngagementCompleted setFeedId:](self, "setFeedId:");
    v4 = v13;
  }
  v6 = v4[144];
  if ((v6 & 2) != 0)
  {
    self->_trackDuration = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = v4[144];
  }
  if ((v6 & 0x20) != 0)
  {
    self->_trackVariant = *((_DWORD *)v4 + 34);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBAudioEngagementCompleted setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v13;
  }
  if ((v4[144] & 1) != 0)
  {
    self->_timePlayed = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  issueData = self->_issueData;
  v8 = *((_QWORD *)v4 + 12);
  if (issueData)
  {
    if (!v8)
      goto LABEL_31;
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_31;
    -[NTPBAudioEngagementCompleted setIssueData:](self, "setIssueData:");
  }
  v4 = v13;
LABEL_31:
  issueViewData = self->_issueViewData;
  v10 = *((_QWORD *)v4 + 13);
  if (issueViewData)
  {
    if (!v10)
      goto LABEL_37;
    -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_37;
    -[NTPBAudioEngagementCompleted setIssueViewData:](self, "setIssueViewData:");
  }
  v4 = v13;
LABEL_37:
  channelData = self->_channelData;
  v12 = *((_QWORD *)v4 + 5);
  if (channelData)
  {
    if (!v12)
      goto LABEL_43;
    -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_43;
    -[NTPBAudioEngagementCompleted setChannelData:](self, "setChannelData:");
  }
  v4 = v13;
LABEL_43:
  if (*((_QWORD *)v4 + 14))
  {
    -[NTPBAudioEngagementCompleted setLanguage:](self, "setLanguage:");
    v4 = v13;
  }
  if ((v4[144] & 0x10) != 0)
  {
    self->_playbackSpeed = *((float *)v4 + 30);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBAudioEngagementCompleted setEngagementId:](self, "setEngagementId:");
    v4 = v13;
  }
  if (v4[144] < 0)
  {
    self->_isPaidSubscriberToSourceChannel = v4[141];
    *(_BYTE *)&self->_has |= 0x80u;
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

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_groupFeedId, a3);
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_feedId, a3);
}

- (int64_t)trackDuration
{
  return self->_trackDuration;
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (int64_t)timePlayed
{
  return self->_timePlayed;
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewData, a3);
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

- (float)playbackSpeed
{
  return self->_playbackSpeed;
}

- (NSString)engagementId
{
  return self->_engagementId;
}

- (void)setEngagementId:(id)a3
{
  objc_storeStrong((id *)&self->_engagementId, a3);
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_engagementId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
