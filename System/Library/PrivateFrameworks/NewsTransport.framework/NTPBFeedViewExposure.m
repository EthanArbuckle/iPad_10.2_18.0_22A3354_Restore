@implementation NTPBFeedViewExposure

- (int)feedType
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFeedType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD51080[a3];
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

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int)presentationReason
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_presentationReason;
  else
    return 0;
}

- (void)setPresentationReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_presentationReason = a3;
}

- (void)setHasPresentationReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPresentationReason
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)presentationReasonAsString:(int)a3
{
  if (a3 < 0x2C)
    return off_24CD51130[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPresentationReason:(id)a3
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

- (BOOL)hasPresentationReasonSearchString
{
  return self->_presentationReasonSearchString != 0;
}

- (BOOL)hasViewFrameInScreen
{
  return self->_viewFrameInScreen != 0;
}

- (int)feedCellSection
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_feedCellSection;
  else
    return 0;
}

- (void)setFeedCellSection:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasFeedCellSection
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 < 0x12)
    return off_24CD51290[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedCellSection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_SUGGESTED_CHANNELS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_SUGGESTED_TOPICS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROWSE_FEATURED_CHANNELS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROWSE_FEATURED_TOPICS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_FEATURED_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_SUGGESTED_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTIONS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHANNELS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOPICS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATIONS_MORE_CHANNELS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAID_SUBSCRIPTIONS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOLLOWING_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROWSE_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISLIKED_CHANNELS_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAVED_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HISTORY_FEED_CELL_SECTION")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAGAZINE_CATEGORY_FEED_CELL_SECTION")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)feedCellHostType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_feedCellHostType;
  else
    return 0;
}

- (void)setFeedCellHostType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_feedCellHostType = a3;
}

- (void)setHasFeedCellHostType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFeedCellHostType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)feedCellHostTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_24CD51320[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedCellHostType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPLORE_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITES_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDATION_BRICK_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISCOVERY_WIDGET_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISCOVERY_WIDGET_FULL_VIEW_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONBOARDING_PICKER_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BROWSE_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_WIDGET_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORS_PICKS_WIDGET_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_TOPICS_WIDGET_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_DETECTION_SCREEN_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITES_SUGGESTIONS_SEE_ALL_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATIONS_SETTINGS_SCREEN_FOLLOWING_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUTE_MANAGER_FEED_CELL_HOST_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOC_FEED_CELL_HOST_TYPE")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setIsNewUserToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isNewUserToFeed = a3;
}

- (void)setHasIsNewUserToFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsNewUserToFeed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (BOOL)hasUserActivityType
{
  return self->_userActivityType != 0;
}

- (void)setCameFromGroup:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_cameFromGroup = a3;
}

- (void)setHasCameFromGroup:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasCameFromGroup
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int)groupType
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasGroupType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD513A8[a3];
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
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isSubscribedToGroupFeed = a3;
}

- (void)setHasIsSubscribedToGroupFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsSubscribedToGroupFeed
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCountOfTotalGroupExposures:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_countOfTotalGroupExposures = a3;
}

- (void)setHasCountOfTotalGroupExposures:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCountOfTotalGroupExposures
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCountOfTotalGroupsExposed:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_countOfTotalGroupsExposed = a3;
}

- (void)setHasCountOfTotalGroupsExposed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCountOfTotalGroupsExposed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsPaidSubscriberToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isPaidSubscriberToFeed = a3;
}

- (void)setHasIsPaidSubscriberToFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToFeed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
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

- (int)areaPresentationReason
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_areaPresentationReason;
  else
    return 0;
}

- (void)setAreaPresentationReason:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_areaPresentationReason = a3;
}

- (void)setHasAreaPresentationReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAreaPresentationReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)areaPresentationReasonAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD514E8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAreaPresentationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FOR_YOU_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FAVORITES_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_FAVORITES_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_EXPLORE_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_EDITORS_PICKS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_RECOMMENDED_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_EXPLORE_BROWSE_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_CHANNELS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_TOPICS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_BROWSE_CHANNELS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_EXPLORE_BROWSE_TOPICS_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SEARCH_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_IN_SEARCH_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SEARCH_RESULTS_LIST_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SAVED_MAIN_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_SAVED_HISTORY_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_DISCOVER_MORE_BUTTON_TAP_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_DISCOVER_MORE_BACK_TAP_AREA_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_ARTICLE_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_FEED_AREA_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_TOC_AREA_VIEW_PRESENTATION_REASON")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  *(_DWORD *)&self->_has |= 1u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (void)setRankInToc:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rankInToc = a3;
}

- (void)setHasRankInToc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRankInToc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)sessionEndReason
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_sessionEndReason;
  else
    return 0;
}

- (void)setSessionEndReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_sessionEndReason = a3;
}

- (void)setHasSessionEndReason:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasSessionEndReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)sessionEndReasonAsString:(int)a3
{
  if (a3 < 8)
    return off_24CD51598[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSessionEndReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("READING_HISTORY_CLEAR_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_BACKGROUND_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FORCE_QUIT_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCAL_NOTIFICATION_RECEIVED_RESET_USER_ID_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ICLOUD_SYNCED_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_VIDEO_PLAYER_DISMISSED_SESSION_END_REASON")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("USER_NAVIGATION_SESSION_END_REASON")))
  {
    v4 = 7;
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
  v8.super_class = (Class)NTPBFeedViewExposure;
  -[NTPBFeedViewExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBFeedViewExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t feedType;
  __CFString *v5;
  NSString *feedId;
  $EF4891B5BA640532944CBDAFC895D309 has;
  void *v8;
  uint64_t presentationReason;
  __CFString *v10;
  NSString *presentationReasonSearchString;
  NSString *viewFrameInScreen;
  $EF4891B5BA640532944CBDAFC895D309 v13;
  uint64_t feedCellSection;
  __CFString *v15;
  uint64_t feedCellHostType;
  __CFString *v17;
  NSData *feedViewExposureId;
  void *v19;
  NSString *sourceChannelId;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  NSString *userActivityType;
  $EF4891B5BA640532944CBDAFC895D309 v24;
  void *v25;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  uint64_t areaPresentationReason;
  __CFString *v30;
  void *v31;
  uint64_t groupType;
  __CFString *v33;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  void *v36;
  NSData *groupViewExposureId;
  $EF4891B5BA640532944CBDAFC895D309 v38;
  void *v39;
  uint64_t sessionEndReason;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD51080[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("feed_type"));

  }
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("is_user_subscribed_to_feed"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    presentationReason = self->_presentationReason;
    if (presentationReason >= 0x2C)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_presentationReason);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_24CD51130[presentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("presentation_reason"));

  }
  presentationReasonSearchString = self->_presentationReasonSearchString;
  if (presentationReasonSearchString)
    objc_msgSend(v3, "setObject:forKey:", presentationReasonSearchString, CFSTR("presentation_reason_search_string"));
  viewFrameInScreen = self->_viewFrameInScreen;
  if (viewFrameInScreen)
    objc_msgSend(v3, "setObject:forKey:", viewFrameInScreen, CFSTR("view_frame_in_screen"));
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x20) != 0)
  {
    feedCellSection = self->_feedCellSection;
    if (feedCellSection >= 0x12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellSection);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_24CD51290[feedCellSection];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("feed_cell_section"));

    v13 = self->_has;
  }
  if ((*(_BYTE *)&v13 & 0x10) != 0)
  {
    feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellHostType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_24CD51320[feedCellHostType];
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("feed_cell_host_type"));

  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNewUserToFeed);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("is_new_user_to_feed"));

  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication)
    objc_msgSend(v3, "setObject:forKey:", referringSourceApplication, CFSTR("referring_source_application"));
  referringUrl = self->_referringUrl;
  if (referringUrl)
    objc_msgSend(v3, "setObject:forKey:", referringUrl, CFSTR("referring_url"));
  userActivityType = self->_userActivityType;
  if (userActivityType)
    objc_msgSend(v3, "setObject:forKey:", userActivityType, CFSTR("user_activity_type"));
  v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cameFromGroup);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("came_from_group"));

    v24 = self->_has;
    if ((*(_BYTE *)&v24 & 0x80) == 0)
    {
LABEL_43:
      if ((*(_WORD *)&v24 & 0x8000) == 0)
        goto LABEL_44;
      goto LABEL_78;
    }
  }
  else if ((*(_BYTE *)&v24 & 0x80) == 0)
  {
    goto LABEL_43;
  }
  groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = off_24CD513A8[groupType];
  }
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("group_type"));

  v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x8000) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v24 & 4) == 0)
      goto LABEL_45;
    goto LABEL_79;
  }
LABEL_78:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSubscribedToGroupFeed);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("is_subscribed_to_group_feed"));

  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 4) == 0)
  {
LABEL_45:
    if ((*(_BYTE *)&v24 & 8) == 0)
      goto LABEL_46;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_countOfTotalGroupExposures);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("count_of_total_group_exposures"));

  v24 = self->_has;
  if ((*(_BYTE *)&v24 & 8) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v24 & 0x4000) == 0)
      goto LABEL_47;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_countOfTotalGroupsExposed);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("count_of_total_groups_exposed"));

  v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x4000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v24 & 0x800) == 0)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToFeed);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("is_paid_subscriber_to_feed"));

  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("ad_supported_channel"));

  }
LABEL_49:
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    areaPresentationReason = self->_areaPresentationReason;
    if (areaPresentationReason >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_areaPresentationReason);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_24CD514E8[areaPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("area_presentation_reason"));

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
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("previous_article_publisher_article_version"));

  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rankInToc);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("rank_in_toc"));

    v38 = self->_has;
  }
  if ((*(_WORD *)&v38 & 0x400) != 0)
  {
    sessionEndReason = self->_sessionEndReason;
    if (sessionEndReason >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sessionEndReason);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_24CD51598[sessionEndReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("session_end_reason"));

  }
  v46 = v3;

  return v46;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedViewExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $EF4891B5BA640532944CBDAFC895D309 has;
  $EF4891B5BA640532944CBDAFC895D309 v5;
  $EF4891B5BA640532944CBDAFC895D309 v6;
  $EF4891B5BA640532944CBDAFC895D309 v7;
  id v8;

  v8 = a3;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedId)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_presentationReasonSearchString)
    PBDataWriterWriteStringField();
  if (self->_viewFrameInScreen)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = self->_has;
  }
  if ((*(_BYTE *)&v5 & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if (self->_referringSourceApplication)
    PBDataWriterWriteStringField();
  if (self->_referringUrl)
    PBDataWriterWriteStringField();
  if (self->_userActivityType)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = self->_has;
    if ((*(_BYTE *)&v6 & 0x80) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v6 & 0x8000) == 0)
        goto LABEL_32;
      goto LABEL_60;
    }
  }
  else if ((*(_BYTE *)&v6 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_33;
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_34;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_35;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v6 & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
LABEL_36:
    PBDataWriterWriteBOOLField();
LABEL_37:
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_groupViewExposureId)
    PBDataWriterWriteDataField();
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x400) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  $EF4891B5BA640532944CBDAFC895D309 has;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  $EF4891B5BA640532944CBDAFC895D309 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  $EF4891B5BA640532944CBDAFC895D309 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  $EF4891B5BA640532944CBDAFC895D309 v38;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_feedType;
    *(_DWORD *)(v5 + 200) |= 0x40u;
  }
  v7 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v7;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(_BYTE *)(v6 + 197) = self->_isUserSubscribedToFeed;
    *(_DWORD *)(v6 + 200) |= 0x10000u;
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_presentationReason;
    *(_DWORD *)(v6 + 200) |= 0x100u;
  }
  v10 = -[NSString copyWithZone:](self->_presentationReasonSearchString, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v10;

  v12 = -[NSString copyWithZone:](self->_viewFrameInScreen, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v12;

  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_feedCellSection;
    *(_DWORD *)(v6 + 200) |= 0x20u;
    v14 = self->_has;
  }
  if ((*(_BYTE *)&v14 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_feedCellHostType;
    *(_DWORD *)(v6 + 200) |= 0x10u;
  }
  v15 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v15;

  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 194) = self->_isNewUserToFeed;
    *(_DWORD *)(v6 + 200) |= 0x2000u;
  }
  v17 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v17;

  v19 = -[NSString copyWithZone:](self->_referringSourceApplication, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v19;

  v21 = -[NSString copyWithZone:](self->_referringUrl, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v21;

  v23 = -[NSString copyWithZone:](self->_userActivityType, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v23;

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x1000) != 0)
  {
    *(_BYTE *)(v6 + 193) = self->_cameFromGroup;
    *(_DWORD *)(v6 + 200) |= 0x1000u;
    v25 = self->_has;
    if ((*(_BYTE *)&v25 & 0x80) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v25 & 0x8000) == 0)
        goto LABEL_16;
      goto LABEL_32;
    }
  }
  else if ((*(_BYTE *)&v25 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 88) = self->_groupType;
  *(_DWORD *)(v6 + 200) |= 0x80u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x8000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v25 & 4) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  *(_BYTE *)(v6 + 196) = self->_isSubscribedToGroupFeed;
  *(_DWORD *)(v6 + 200) |= 0x8000u;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 4) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v25 & 8) == 0)
      goto LABEL_18;
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v6 + 40) = self->_countOfTotalGroupExposures;
  *(_DWORD *)(v6 + 200) |= 4u;
  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 8) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v25 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v6 + 44) = self->_countOfTotalGroupsExposed;
  *(_DWORD *)(v6 + 200) |= 8u;
  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v25 & 0x800) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_35:
  *(_BYTE *)(v6 + 195) = self->_isPaidSubscriberToFeed;
  *(_DWORD *)(v6 + 200) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_20:
    *(_BYTE *)(v6 + 192) = self->_adSupportedChannel;
    *(_DWORD *)(v6 + 200) |= 0x800u;
  }
LABEL_21:
  v26 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v26;

  v28 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v28;

  v30 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v30;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_areaPresentationReason;
    *(_DWORD *)(v6 + 200) |= 2u;
  }
  v32 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v32;

  v34 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v34;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v6 + 200) |= 1u;
  }
  v36 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v36;

  v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_rankInToc;
    *(_DWORD *)(v6 + 200) |= 0x200u;
    v38 = self->_has;
  }
  if ((*(_WORD *)&v38 & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_sessionEndReason;
    *(_DWORD *)(v6 + 200) |= 0x400u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $EF4891B5BA640532944CBDAFC895D309 has;
  int v6;
  NSString *feedId;
  int v8;
  NSString *presentationReasonSearchString;
  NSString *viewFrameInScreen;
  $EF4891B5BA640532944CBDAFC895D309 v11;
  int v12;
  NSData *feedViewExposureId;
  int v14;
  NSString *sourceChannelId;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  NSString *userActivityType;
  $EF4891B5BA640532944CBDAFC895D309 v19;
  int v20;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  int v24;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  $EF4891B5BA640532944CBDAFC895D309 v27;
  int v28;
  NSData *groupViewExposureId;
  int v30;
  BOOL v31;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_136;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_feedType != *((_DWORD *)v4 + 18))
      goto LABEL_136;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_136;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_136;
    has = self->_has;
  }
  v8 = *((_DWORD *)v4 + 50);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0)
      goto LABEL_136;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 197))
        goto LABEL_136;
    }
    else if (*((_BYTE *)v4 + 197))
    {
      goto LABEL_136;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_presentationReason != *((_DWORD *)v4 + 26))
      goto LABEL_136;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_136;
  }
  presentationReasonSearchString = self->_presentationReasonSearchString;
  if ((unint64_t)presentationReasonSearchString | *((_QWORD *)v4 + 14)
    && !-[NSString isEqual:](presentationReasonSearchString, "isEqual:"))
  {
    goto LABEL_136;
  }
  viewFrameInScreen = self->_viewFrameInScreen;
  if ((unint64_t)viewFrameInScreen | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](viewFrameInScreen, "isEqual:"))
      goto LABEL_136;
  }
  v11 = self->_has;
  v12 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 15))
      goto LABEL_136;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 14))
      goto LABEL_136;
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_136;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_136;
    v11 = self->_has;
  }
  v14 = *((_DWORD *)v4 + 50);
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v14 & 0x2000) == 0)
      goto LABEL_136;
    if (self->_isNewUserToFeed)
    {
      if (!*((_BYTE *)v4 + 194))
        goto LABEL_136;
    }
    else if (*((_BYTE *)v4 + 194))
    {
      goto LABEL_136;
    }
  }
  else if ((v14 & 0x2000) != 0)
  {
    goto LABEL_136;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](sourceChannelId, "isEqual:"))
  {
    goto LABEL_136;
  }
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](referringSourceApplication, "isEqual:"))
      goto LABEL_136;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](referringUrl, "isEqual:"))
      goto LABEL_136;
  }
  userActivityType = self->_userActivityType;
  if ((unint64_t)userActivityType | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](userActivityType, "isEqual:"))
      goto LABEL_136;
  }
  v19 = self->_has;
  v20 = *((_DWORD *)v4 + 50);
  if ((*(_WORD *)&v19 & 0x1000) != 0)
  {
    if ((v20 & 0x1000) == 0)
      goto LABEL_136;
    if (self->_cameFromGroup)
    {
      if (!*((_BYTE *)v4 + 193))
        goto LABEL_136;
    }
    else if (*((_BYTE *)v4 + 193))
    {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x1000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0 || self->_groupType != *((_DWORD *)v4 + 22))
      goto LABEL_136;
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v19 & 0x8000) != 0)
  {
    if ((v20 & 0x8000) == 0)
      goto LABEL_136;
    if (self->_isSubscribedToGroupFeed)
    {
      if (!*((_BYTE *)v4 + 196))
        goto LABEL_136;
    }
    else if (*((_BYTE *)v4 + 196))
    {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x8000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_countOfTotalGroupExposures != *((_DWORD *)v4 + 10))
      goto LABEL_136;
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_countOfTotalGroupsExposed != *((_DWORD *)v4 + 11))
      goto LABEL_136;
  }
  else if ((v20 & 8) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v19 & 0x4000) != 0)
  {
    if ((v20 & 0x4000) == 0)
      goto LABEL_136;
    if (self->_isPaidSubscriberToFeed)
    {
      if (!*((_BYTE *)v4 + 195))
        goto LABEL_136;
    }
    else if (*((_BYTE *)v4 + 195))
    {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x4000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v19 & 0x800) != 0)
  {
    if ((v20 & 0x800) == 0)
      goto LABEL_136;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 192))
        goto LABEL_136;
    }
    else if (*((_BYTE *)v4 + 192))
    {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x800) != 0)
  {
    goto LABEL_136;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](campaignId, "isEqual:"))
    goto LABEL_136;
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_136;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_136;
  }
  v24 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_areaPresentationReason != *((_DWORD *)v4 + 4))
      goto LABEL_136;
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_136;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 15)
    && !-[NSString isEqual:](previousArticleId, "isEqual:"))
  {
    goto LABEL_136;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_136;
  }
  v27 = self->_has;
  v28 = *((_DWORD *)v4 + 50);
  if ((*(_BYTE *)&v27 & 1) != 0)
  {
    if ((v28 & 1) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 1))
      goto LABEL_136;
  }
  else if ((v28 & 1) != 0)
  {
    goto LABEL_136;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 12))
  {
    if (-[NSData isEqual:](groupViewExposureId, "isEqual:"))
    {
      v27 = self->_has;
      goto LABEL_126;
    }
LABEL_136:
    v31 = 0;
    goto LABEL_137;
  }
LABEL_126:
  v30 = *((_DWORD *)v4 + 50);
  if ((*(_WORD *)&v27 & 0x200) != 0)
  {
    if ((v30 & 0x200) == 0 || self->_rankInToc != *((_DWORD *)v4 + 34))
      goto LABEL_136;
  }
  else if ((v30 & 0x200) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v27 & 0x400) != 0)
  {
    if ((v30 & 0x400) == 0 || self->_sessionEndReason != *((_DWORD *)v4 + 40))
      goto LABEL_136;
    v31 = 1;
  }
  else
  {
    v31 = (*((_DWORD *)v4 + 50) & 0x400) == 0;
  }
LABEL_137:

  return v31;
}

- (unint64_t)hash
{
  $EF4891B5BA640532944CBDAFC895D309 has;
  $EF4891B5BA640532944CBDAFC895D309 v4;
  $EF4891B5BA640532944CBDAFC895D309 v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  $EF4891B5BA640532944CBDAFC895D309 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;
  uint64_t v39;

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v39 = 2654435761 * self->_feedType;
  else
    v39 = 0;
  v38 = -[NSString hash](self->_feedId, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    v37 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(_WORD *)&has & 0x100) != 0)
      goto LABEL_6;
  }
  else
  {
    v37 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_6:
      v36 = 2654435761 * self->_presentationReason;
      goto LABEL_9;
    }
  }
  v36 = 0;
LABEL_9:
  v35 = -[NSString hash](self->_presentationReasonSearchString, "hash");
  v34 = -[NSString hash](self->_viewFrameInScreen, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
  {
    v33 = 2654435761 * self->_feedCellSection;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_11;
  }
  else
  {
    v33 = 0;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
    {
LABEL_11:
      v32 = 2654435761 * self->_feedCellHostType;
      goto LABEL_14;
    }
  }
  v32 = 0;
LABEL_14:
  v31 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    v30 = 2654435761 * self->_isNewUserToFeed;
  else
    v30 = 0;
  v29 = -[NSString hash](self->_sourceChannelId, "hash");
  v28 = -[NSString hash](self->_referringSourceApplication, "hash");
  v27 = -[NSString hash](self->_referringUrl, "hash");
  v26 = -[NSString hash](self->_userActivityType, "hash");
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
    v25 = 2654435761 * self->_cameFromGroup;
    if ((*(_BYTE *)&v5 & 0x80) != 0)
    {
LABEL_19:
      v24 = 2654435761 * self->_groupType;
      if ((*(_WORD *)&v5 & 0x8000) != 0)
        goto LABEL_20;
      goto LABEL_27;
    }
  }
  else
  {
    v25 = 0;
    if ((*(_BYTE *)&v5 & 0x80) != 0)
      goto LABEL_19;
  }
  v24 = 0;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
LABEL_20:
    v23 = 2654435761 * self->_isSubscribedToGroupFeed;
    if ((*(_BYTE *)&v5 & 4) != 0)
      goto LABEL_21;
    goto LABEL_28;
  }
LABEL_27:
  v23 = 0;
  if ((*(_BYTE *)&v5 & 4) != 0)
  {
LABEL_21:
    v22 = 2654435761 * self->_countOfTotalGroupExposures;
    if ((*(_BYTE *)&v5 & 8) != 0)
      goto LABEL_22;
    goto LABEL_29;
  }
LABEL_28:
  v22 = 0;
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
LABEL_22:
    v21 = 2654435761 * self->_countOfTotalGroupsExposed;
    if ((*(_WORD *)&v5 & 0x4000) != 0)
      goto LABEL_23;
LABEL_30:
    v20 = 0;
    if ((*(_WORD *)&v5 & 0x800) != 0)
      goto LABEL_24;
    goto LABEL_31;
  }
LABEL_29:
  v21 = 0;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
    goto LABEL_30;
LABEL_23:
  v20 = 2654435761 * self->_isPaidSubscriberToFeed;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
LABEL_24:
    v6 = -[NSString hash](self->_campaignId, "hash", 2654435761 * self->_adSupportedChannel);
    goto LABEL_32;
  }
LABEL_31:
  v6 = -[NSString hash](self->_campaignId, "hash", 0);
LABEL_32:
  v7 = v6;
  v8 = -[NSString hash](self->_campaignType, "hash");
  v9 = -[NSString hash](self->_creativeId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_areaPresentationReason;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_previousArticleId, "hash");
  v12 = -[NSString hash](self->_previousArticleVersion, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v13 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  else
    v13 = 0;
  v14 = -[NSData hash](self->_groupViewExposureId, "hash");
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) != 0)
  {
    v16 = 2654435761 * self->_rankInToc;
    if ((*(_WORD *)&v15 & 0x400) != 0)
      goto LABEL_40;
LABEL_42:
    v17 = 0;
    return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17;
  }
  v16 = 0;
  if ((*(_WORD *)&v15 & 0x400) == 0)
    goto LABEL_42;
LABEL_40:
  v17 = 2654435761 * self->_sessionEndReason;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v4 = a3;
  if ((*((_BYTE *)v4 + 200) & 0x40) != 0)
  {
    self->_feedType = *((_DWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  v9 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[NTPBFeedViewExposure setFeedId:](self, "setFeedId:");
    v4 = v9;
  }
  v5 = *((_DWORD *)v4 + 50);
  if ((v5 & 0x10000) != 0)
  {
    self->_isUserSubscribedToFeed = *((_BYTE *)v4 + 197);
    *(_DWORD *)&self->_has |= 0x10000u;
    v5 = *((_DWORD *)v4 + 50);
  }
  if ((v5 & 0x100) != 0)
  {
    self->_presentationReason = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[NTPBFeedViewExposure setPresentationReasonSearchString:](self, "setPresentationReasonSearchString:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 23))
  {
    -[NTPBFeedViewExposure setViewFrameInScreen:](self, "setViewFrameInScreen:");
    v4 = v9;
  }
  v6 = *((_DWORD *)v4 + 50);
  if ((v6 & 0x20) != 0)
  {
    self->_feedCellSection = *((_DWORD *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x20u;
    v6 = *((_DWORD *)v4 + 50);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_feedCellHostType = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[NTPBFeedViewExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 201) & 0x20) != 0)
  {
    self->_isNewUserToFeed = *((_BYTE *)v4 + 194);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v4 + 21))
  {
    -[NTPBFeedViewExposure setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[NTPBFeedViewExposure setReferringSourceApplication:](self, "setReferringSourceApplication:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[NTPBFeedViewExposure setReferringUrl:](self, "setReferringUrl:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 22))
  {
    -[NTPBFeedViewExposure setUserActivityType:](self, "setUserActivityType:");
    v4 = v9;
  }
  v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 0x1000) != 0)
  {
    self->_cameFromGroup = *((_BYTE *)v4 + 193);
    *(_DWORD *)&self->_has |= 0x1000u;
    v7 = *((_DWORD *)v4 + 50);
    if ((v7 & 0x80) == 0)
    {
LABEL_31:
      if ((v7 & 0x8000) == 0)
        goto LABEL_32;
      goto LABEL_60;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  self->_groupType = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80u;
  v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 0x8000) == 0)
  {
LABEL_32:
    if ((v7 & 4) == 0)
      goto LABEL_33;
    goto LABEL_61;
  }
LABEL_60:
  self->_isSubscribedToGroupFeed = *((_BYTE *)v4 + 196);
  *(_DWORD *)&self->_has |= 0x8000u;
  v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 4) == 0)
  {
LABEL_33:
    if ((v7 & 8) == 0)
      goto LABEL_34;
    goto LABEL_62;
  }
LABEL_61:
  self->_countOfTotalGroupExposures = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 4u;
  v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 8) == 0)
  {
LABEL_34:
    if ((v7 & 0x4000) == 0)
      goto LABEL_35;
    goto LABEL_63;
  }
LABEL_62:
  self->_countOfTotalGroupsExposed = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 8u;
  v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 0x4000) == 0)
  {
LABEL_35:
    if ((v7 & 0x800) == 0)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_63:
  self->_isPaidSubscriberToFeed = *((_BYTE *)v4 + 195);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 50) & 0x800) != 0)
  {
LABEL_36:
    self->_adSupportedChannel = *((_BYTE *)v4 + 192);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_37:
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBFeedViewExposure setCampaignId:](self, "setCampaignId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBFeedViewExposure setCampaignType:](self, "setCampaignType:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBFeedViewExposure setCreativeId:](self, "setCreativeId:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 200) & 2) != 0)
  {
    self->_areaPresentationReason = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[NTPBFeedViewExposure setPreviousArticleId:](self, "setPreviousArticleId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[NTPBFeedViewExposure setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 200) & 1) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[NTPBFeedViewExposure setGroupViewExposureId:](self, "setGroupViewExposureId:");
    v4 = v9;
  }
  v8 = *((_DWORD *)v4 + 50);
  if ((v8 & 0x200) != 0)
  {
    self->_rankInToc = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_has |= 0x200u;
    v8 = *((_DWORD *)v4 + 50);
  }
  if ((v8 & 0x400) != 0)
  {
    self->_sessionEndReason = *((_DWORD *)v4 + 40);
    *(_DWORD *)&self->_has |= 0x400u;
  }

}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_feedId, a3);
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSString)presentationReasonSearchString
{
  return self->_presentationReasonSearchString;
}

- (void)setPresentationReasonSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_presentationReasonSearchString, a3);
}

- (NSString)viewFrameInScreen
{
  return self->_viewFrameInScreen;
}

- (void)setViewFrameInScreen:(id)a3
{
  objc_storeStrong((id *)&self->_viewFrameInScreen, a3);
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (BOOL)isNewUserToFeed
{
  return self->_isNewUserToFeed;
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)referringSourceApplication
{
  return self->_referringSourceApplication;
}

- (void)setReferringSourceApplication:(id)a3
{
  objc_storeStrong((id *)&self->_referringSourceApplication, a3);
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
  objc_storeStrong((id *)&self->_referringUrl, a3);
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityType, a3);
}

- (BOOL)cameFromGroup
{
  return self->_cameFromGroup;
}

- (BOOL)isSubscribedToGroupFeed
{
  return self->_isSubscribedToGroupFeed;
}

- (int)countOfTotalGroupExposures
{
  return self->_countOfTotalGroupExposures;
}

- (int)countOfTotalGroupsExposed
{
  return self->_countOfTotalGroupsExposed;
}

- (BOOL)isPaidSubscriberToFeed
{
  return self->_isPaidSubscriberToFeed;
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
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

- (int)rankInToc
{
  return self->_rankInToc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewFrameInScreen, 0);
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_presentationReasonSearchString, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end
