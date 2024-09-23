@implementation NTPBChannelMuteUnmute

- (int)userAction
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserAction
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)muteUnmuteLocation
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_muteUnmuteLocation;
  else
    return 0;
}

- (void)setMuteUnmuteLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_muteUnmuteLocation = a3;
}

- (void)setHasMuteUnmuteLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMuteUnmuteLocation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasArticleSessionIdDeprecated
{
  return self->_articleSessionIdDeprecated != 0;
}

- (BOOL)hasArticleViewingSessionIdDeprecated
{
  return self->_articleViewingSessionIdDeprecated != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)feedType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4D240[a3];
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

- (BOOL)hasChannelMuteUnmuteFeedId
{
  return self->_channelMuteUnmuteFeedId != 0;
}

- (BOOL)hasFeedViewExposureIdDeprecated
{
  return self->_feedViewExposureIdDeprecated != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasArticleSessionId
{
  return self->_articleSessionId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
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
    return off_24CD4D2F0[a3];
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

- (int)feedViewPresentationReason
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_feedViewPresentationReason;
  else
    return 0;
}

- (void)setFeedViewPresentationReason:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_feedViewPresentationReason = a3;
}

- (void)setHasFeedViewPresentationReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeedViewPresentationReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)feedViewPresentationReasonAsString:(int)a3
{
  if (a3 < 0x2C)
    return off_24CD4D430[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedViewPresentationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_VIEW_CELL_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEED_CELL_HOST_VIEW_CELL_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_URL_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAVED_SEGMENTED_CONTROL_TOGGLE_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAVED_TAB_BAR_BUTTON_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RETURN_FROM_ARTICLE_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDATION_BRICK_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXCERPT_TOPIC_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_ARTICLES_TOPIC_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_PUB_ARTICLES_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_SUGGESTED_CHANNELS_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_SUGGESTED_TOPICS_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROWSE_FEATURED_CHANNELS_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROWSE_FEATURED_TOPICS_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROWSE_CHANNELS_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROWSE_TOPICS_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_LAUNCH_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_FEATURED_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_SUGGESTED_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_EDITORS_PICKS_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_RECOMMENDED_FOR_YOU_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_WIDGET_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORS_PICKS_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_TOPICS_WIDGET_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAME_FROM_AD")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_ARTICLE_PLACARD_PURCHASE_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUCCESSFUL_SUBSCRIPTION_RENEWAL_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAME_FROM_SUBSCRIPTION_AD_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SECTION_VIEW_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SAVED_GROUP_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEXT_ARTICLE_ROTATION_COMPLETE_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_DISCOVER_MORE_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_ARTICLE_BACK_TAP_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRENDING_SELECTION_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_EDITORIAL_HOMEPAGE_TAB_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ARTICLE_PAID_SUBSCRIPTION_COMPLETE_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTIONS_SEE_ALL_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_SETTINGS_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUTE_MANAGER_FEED_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 42;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOC_FEED_VIEW_PRESENTATION_REASON")))
  {
    v4 = 43;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsSearchResultArticle:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isSearchResultArticle = a3;
}

- (void)setHasIsSearchResultArticle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsSearchResultArticle
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
}

- (BOOL)hasPreviousArticleVersion
{
  return self->_previousArticleVersion != 0;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
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
  v8.super_class = (Class)NTPBChannelMuteUnmute;
  -[NTPBChannelMuteUnmute description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBChannelMuteUnmute dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *articleId;
  NSString *referencedArticleId;
  NSString *articleSessionIdDeprecated;
  NSString *articleViewingSessionIdDeprecated;
  NSString *sourceChannelId;
  uint64_t feedType;
  __CFString *v13;
  NSString *channelMuteUnmuteFeedId;
  NSString *feedViewExposureIdDeprecated;
  void *v16;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSData *feedViewExposureId;
  uint64_t groupType;
  __CFString *v21;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  char v25;
  uint64_t feedViewPresentationReason;
  __CFString *v27;
  void *v28;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  void *v31;
  NSData *groupViewExposureId;
  id v33;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_action"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_muteUnmuteLocation);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("mute_unmute_location"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  articleSessionIdDeprecated = self->_articleSessionIdDeprecated;
  if (articleSessionIdDeprecated)
    objc_msgSend(v3, "setObject:forKey:", articleSessionIdDeprecated, CFSTR("article_session_id_deprecated"));
  articleViewingSessionIdDeprecated = self->_articleViewingSessionIdDeprecated;
  if (articleViewingSessionIdDeprecated)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionIdDeprecated, CFSTR("article_viewing_session_id_deprecated"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_24CD4D240[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("feed_type"));

  }
  channelMuteUnmuteFeedId = self->_channelMuteUnmuteFeedId;
  if (channelMuteUnmuteFeedId)
    objc_msgSend(v3, "setObject:forKey:", channelMuteUnmuteFeedId, CFSTR("channel_mute_unmute_feed_id"));
  feedViewExposureIdDeprecated = self->_feedViewExposureIdDeprecated;
  if (feedViewExposureIdDeprecated)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureIdDeprecated, CFSTR("feed_view_exposure_id_deprecated"));
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("is_user_subscribed_to_feed"));

  }
  articleSessionId = self->_articleSessionId;
  if (articleSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleSessionId, CFSTR("article_session_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_24CD4D2F0[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("group_type"));

  }
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  v25 = (char)self->_has;
  if ((v25 & 4) != 0)
  {
    feedViewPresentationReason = self->_feedViewPresentationReason;
    if (feedViewPresentationReason >= 0x2C)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedViewPresentationReason);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_24CD4D430[feedViewPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("feed_view_presentation_reason"));

    v25 = (char)self->_has;
  }
  if ((v25 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSearchResultArticle);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("is_search_result_article"));

  }
  previousArticleId = self->_previousArticleId;
  if (previousArticleId)
    objc_msgSend(v3, "setObject:forKey:", previousArticleId, CFSTR("previous_article_id"));
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion)
    objc_msgSend(v3, "setObject:forKey:", previousArticleVersion, CFSTR("previous_article_version"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("previous_article_publisher_article_version"));

  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  v33 = v3;

  return v33;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBChannelMuteUnmuteReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_referencedArticleId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_articleSessionIdDeprecated)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_articleViewingSessionIdDeprecated)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_channelMuteUnmuteFeedId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_feedViewExposureIdDeprecated)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_articleSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_campaignId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_campaignType)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_creativeId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_previousArticleId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_previousArticleVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }

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
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_userAction;
    *(_BYTE *)(v5 + 176) |= 0x20u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_muteUnmuteLocation;
    *(_BYTE *)(v5 + 176) |= 0x10u;
  }
  v8 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v10;

  v12 = -[NSString copyWithZone:](self->_articleSessionIdDeprecated, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_articleViewingSessionIdDeprecated, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v16;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_feedType;
    *(_BYTE *)(v6 + 176) |= 2u;
  }
  v18 = -[NSString copyWithZone:](self->_channelMuteUnmuteFeedId, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v18;

  v20 = -[NSString copyWithZone:](self->_feedViewExposureIdDeprecated, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v20;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_BYTE *)(v6 + 173) = self->_isUserSubscribedToFeed;
    *(_BYTE *)(v6 + 176) |= 0x80u;
  }
  v22 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v22;

  v24 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v24;

  v26 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v26;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 116) = self->_groupType;
    *(_BYTE *)(v6 + 176) |= 8u;
  }
  v28 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v28;

  v30 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v30;

  v32 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v32;

  v34 = (char)self->_has;
  if ((v34 & 4) != 0)
  {
    *(_DWORD *)(v6 + 112) = self->_feedViewPresentationReason;
    *(_BYTE *)(v6 + 176) |= 4u;
    v34 = (char)self->_has;
  }
  if ((v34 & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 172) = self->_isSearchResultArticle;
    *(_BYTE *)(v6 + 176) |= 0x40u;
  }
  v35 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v36 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v35;

  v37 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v38 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v37;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_previousArticlePublisherArticleVersion;
    *(_BYTE *)(v6 + 176) |= 1u;
  }
  v39 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v40 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v39;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *articleId;
  NSString *referencedArticleId;
  NSString *articleSessionIdDeprecated;
  NSString *articleViewingSessionIdDeprecated;
  NSString *sourceChannelId;
  NSString *channelMuteUnmuteFeedId;
  NSString *feedViewExposureIdDeprecated;
  int v12;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSData *feedViewExposureId;
  char v16;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NSData *groupViewExposureId;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[176] & 0x20) == 0 || self->_userAction != *((_DWORD *)v4 + 42))
      goto LABEL_43;
  }
  else if ((v4[176] & 0x20) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[176] & 0x10) == 0 || self->_muteUnmuteLocation != *((_DWORD *)v4 + 32))
      goto LABEL_43;
  }
  else if ((v4[176] & 0x10) != 0)
  {
    goto LABEL_43;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_43;
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_43;
  }
  articleSessionIdDeprecated = self->_articleSessionIdDeprecated;
  if ((unint64_t)articleSessionIdDeprecated | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](articleSessionIdDeprecated, "isEqual:"))
      goto LABEL_43;
  }
  articleViewingSessionIdDeprecated = self->_articleViewingSessionIdDeprecated;
  if ((unint64_t)articleViewingSessionIdDeprecated | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleViewingSessionIdDeprecated, "isEqual:"))
      goto LABEL_43;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[176] & 2) == 0 || self->_feedType != *((_DWORD *)v4 + 22))
      goto LABEL_43;
  }
  else if ((v4[176] & 2) != 0)
  {
    goto LABEL_43;
  }
  channelMuteUnmuteFeedId = self->_channelMuteUnmuteFeedId;
  if ((unint64_t)channelMuteUnmuteFeedId | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](channelMuteUnmuteFeedId, "isEqual:"))
  {
    goto LABEL_43;
  }
  feedViewExposureIdDeprecated = self->_feedViewExposureIdDeprecated;
  if ((unint64_t)feedViewExposureIdDeprecated | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](feedViewExposureIdDeprecated, "isEqual:"))
      goto LABEL_43;
  }
  v12 = v4[176];
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    if ((v12 & 0x80000000) == 0)
      goto LABEL_43;
    if (self->_isUserSubscribedToFeed)
    {
      if (!v4[173])
        goto LABEL_43;
    }
    else if (v4[173])
    {
      goto LABEL_43;
    }
  }
  else if (v12 < 0)
  {
    goto LABEL_43;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](articleSessionId, "isEqual:"))
  {
    goto LABEL_43;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_43;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[176] & 8) == 0 || self->_groupType != *((_DWORD *)v4 + 29))
      goto LABEL_43;
  }
  else if ((v4[176] & 8) != 0)
  {
    goto LABEL_43;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 7) && !-[NSString isEqual:](campaignId, "isEqual:"))
    goto LABEL_43;
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_43;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[176] & 4) == 0 || self->_feedViewPresentationReason != *((_DWORD *)v4 + 28))
      goto LABEL_43;
  }
  else if ((v4[176] & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[176] & 0x40) == 0)
      goto LABEL_43;
    if (self->_isSearchResultArticle)
    {
      if (!v4[172])
        goto LABEL_43;
    }
    else if (v4[172])
    {
      goto LABEL_43;
    }
  }
  else if ((v4[176] & 0x40) != 0)
  {
    goto LABEL_43;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 17)
    && !-[NSString isEqual:](previousArticleId, "isEqual:"))
  {
    goto LABEL_43;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_43;
  }
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((v4[176] & 1) == 0)
      goto LABEL_80;
LABEL_43:
    v16 = 0;
    goto LABEL_44;
  }
  if ((v4[176] & 1) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 1))
    goto LABEL_43;
LABEL_80:
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 15))
    v16 = -[NSData isEqual:](groupViewExposureId, "isEqual:");
  else
    v16 = 1;
LABEL_44:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  uint64_t v29;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v3 = 2654435761 * self->_userAction;
  else
    v3 = 0;
  v29 = v3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v19 = 2654435761 * self->_muteUnmuteLocation;
  else
    v19 = 0;
  v4 = -[NSString hash](self->_articleId, "hash");
  v5 = -[NSString hash](self->_referencedArticleId, "hash");
  v6 = -[NSString hash](self->_articleSessionIdDeprecated, "hash");
  v7 = -[NSString hash](self->_articleViewingSessionIdDeprecated, "hash");
  v28 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v18 = 2654435761 * self->_feedType;
  else
    v18 = 0;
  v8 = -[NSString hash](self->_channelMuteUnmuteFeedId, "hash");
  v9 = -[NSString hash](self->_feedViewExposureIdDeprecated, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v27 = 2654435761 * self->_isUserSubscribedToFeed;
  else
    v27 = 0;
  v26 = -[NSData hash](self->_articleSessionId, "hash");
  v25 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v24 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v17 = 2654435761 * self->_groupType;
  else
    v17 = 0;
  v23 = -[NSString hash](self->_campaignId, "hash");
  v22 = -[NSString hash](self->_campaignType, "hash");
  v10 = -[NSString hash](self->_creativeId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v11 = 2654435761 * self->_feedViewPresentationReason;
  else
    v11 = 0;
  v20 = v11;
  v21 = v10;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v12 = 2654435761 * self->_isSearchResultArticle;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_previousArticleId, "hash");
  v14 = -[NSString hash](self->_previousArticleVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v15 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  else
    v15 = 0;
  return v19 ^ v29 ^ v4 ^ v5 ^ v6 ^ v7 ^ v28 ^ v18 ^ v8 ^ v9 ^ v27 ^ v26 ^ v25 ^ v24 ^ v17 ^ v23 ^ v22 ^ v21 ^ v20 ^ v12 ^ v13 ^ v14 ^ v15 ^ -[NSData hash](self->_groupViewExposureId, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  char v6;
  char *v7;

  v4 = (char *)a3;
  v5 = v4[176];
  if ((v5 & 0x20) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 42);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = v4[176];
  }
  if ((v5 & 0x10) != 0)
  {
    self->_muteUnmuteLocation = *((_DWORD *)v4 + 32);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBChannelMuteUnmute setArticleId:](self, "setArticleId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[NTPBChannelMuteUnmute setReferencedArticleId:](self, "setReferencedArticleId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBChannelMuteUnmute setArticleSessionIdDeprecated:](self, "setArticleSessionIdDeprecated:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBChannelMuteUnmute setArticleViewingSessionIdDeprecated:](self, "setArticleViewingSessionIdDeprecated:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 20))
  {
    -[NTPBChannelMuteUnmute setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v7;
  }
  if ((v4[176] & 2) != 0)
  {
    self->_feedType = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBChannelMuteUnmute setChannelMuteUnmuteFeedId:](self, "setChannelMuteUnmuteFeedId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[NTPBChannelMuteUnmute setFeedViewExposureIdDeprecated:](self, "setFeedViewExposureIdDeprecated:");
    v4 = v7;
  }
  if (v4[176] < 0)
  {
    self->_isUserSubscribedToFeed = v4[173];
    *(_BYTE *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBChannelMuteUnmute setArticleSessionId:](self, "setArticleSessionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBChannelMuteUnmute setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[NTPBChannelMuteUnmute setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v4 = v7;
  }
  if ((v4[176] & 8) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 29);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBChannelMuteUnmute setCampaignId:](self, "setCampaignId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[NTPBChannelMuteUnmute setCampaignType:](self, "setCampaignType:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[NTPBChannelMuteUnmute setCreativeId:](self, "setCreativeId:");
    v4 = v7;
  }
  v6 = v4[176];
  if ((v6 & 4) != 0)
  {
    self->_feedViewPresentationReason = *((_DWORD *)v4 + 28);
    *(_BYTE *)&self->_has |= 4u;
    v6 = v4[176];
  }
  if ((v6 & 0x40) != 0)
  {
    self->_isSearchResultArticle = v4[172];
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[NTPBChannelMuteUnmute setPreviousArticleId:](self, "setPreviousArticleId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[NTPBChannelMuteUnmute setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
    v4 = v7;
  }
  if ((v4[176] & 1) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[NTPBChannelMuteUnmute setGroupViewExposureId:](self, "setGroupViewExposureId:");
    v4 = v7;
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

- (NSString)articleSessionIdDeprecated
{
  return self->_articleSessionIdDeprecated;
}

- (void)setArticleSessionIdDeprecated:(id)a3
{
  objc_storeStrong((id *)&self->_articleSessionIdDeprecated, a3);
}

- (NSString)articleViewingSessionIdDeprecated
{
  return self->_articleViewingSessionIdDeprecated;
}

- (void)setArticleViewingSessionIdDeprecated:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionIdDeprecated, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)channelMuteUnmuteFeedId
{
  return self->_channelMuteUnmuteFeedId;
}

- (void)setChannelMuteUnmuteFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_channelMuteUnmuteFeedId, a3);
}

- (NSString)feedViewExposureIdDeprecated
{
  return self->_feedViewExposureIdDeprecated;
}

- (void)setFeedViewExposureIdDeprecated:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureIdDeprecated, a3);
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
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

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
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

- (BOOL)isSearchResultArticle
{
  return self->_isSearchResultArticle;
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

- (int64_t)previousArticlePublisherArticleVersion
{
  return self->_previousArticlePublisherArticleVersion;
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureIdDeprecated, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_channelMuteUnmuteFeedId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionIdDeprecated, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionIdDeprecated, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
