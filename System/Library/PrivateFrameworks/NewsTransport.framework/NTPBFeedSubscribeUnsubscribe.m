@implementation NTPBFeedSubscribeUnsubscribe

- (int)userAction
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserAction
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4F860[a3];
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

- (int)subscribeUnsubscribeLocation
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_subscribeUnsubscribeLocation;
  else
    return 0;
}

- (void)setSubscribeUnsubscribeLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_subscribeUnsubscribeLocation = a3;
}

- (void)setHasSubscribeUnsubscribeLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubscribeUnsubscribeLocation
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)feedViewPresentationReason
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_feedViewPresentationReason;
  else
    return 0;
}

- (void)setFeedViewPresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_feedViewPresentationReason = a3;
}

- (void)setHasFeedViewPresentationReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFeedViewPresentationReason
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)feedViewPresentationReasonAsString:(int)a3
{
  if (a3 < 0x2C)
    return off_24CD4F910[a3];
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

- (int)feedCellSection
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_feedCellSection;
  else
    return 0;
}

- (void)setFeedCellSection:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFeedCellSection
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 < 0x12)
    return off_24CD4FA70[a3];
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
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_feedCellHostType;
  else
    return 0;
}

- (void)setFeedCellHostType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_feedCellHostType = a3;
}

- (void)setHasFeedCellHostType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFeedCellHostType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)feedCellHostTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_24CD4FB00[a3];
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

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (void)clearSubscribedFeedIds
{
  -[NSMutableArray removeAllObjects](self->_subscribedFeedIds, "removeAllObjects");
}

- (void)addSubscribedFeedIds:(id)a3
{
  id v4;
  NSMutableArray *subscribedFeedIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subscribedFeedIds = self->_subscribedFeedIds;
  v8 = v4;
  if (!subscribedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_subscribedFeedIds;
    self->_subscribedFeedIds = v6;

    v4 = v8;
    subscribedFeedIds = self->_subscribedFeedIds;
  }
  -[NSMutableArray addObject:](subscribedFeedIds, "addObject:", v4);

}

- (unint64_t)subscribedFeedIdsCount
{
  return -[NSMutableArray count](self->_subscribedFeedIds, "count");
}

- (id)subscribedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subscribedFeedIds, "objectAtIndex:", a3);
}

+ (Class)subscribedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)setCameFromGroup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_cameFromGroup = a3;
}

- (void)setHasCameFromGroup:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasCameFromGroup
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD4FB88[a3];
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

- (void)setIsPaidSubscriberToFeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isPaidSubscriberToFeed = a3;
}

- (void)setHasIsPaidSubscriberToFeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsPaidSubscriberToFeed
{
  return (*(_WORD *)&self->_has >> 13) & 1;
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

- (int)recommendationBrickType
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_recommendationBrickType;
  else
    return 0;
}

- (void)setRecommendationBrickType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_recommendationBrickType = a3;
}

- (void)setHasRecommendationBrickType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRecommendationBrickType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)recommendationBrickTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD4FCC8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRecommendationBrickType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_RECOMMENDATION_BRICK_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDED_BRICK_RECOMMENDATION_BRICK_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_BRICK_RECOMMENDATION_BRICK_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORIAL_PICKS_RECOMMENDATION_BRICK_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)subscribeUnsubscribeSurfaceReason
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_subscribeUnsubscribeSurfaceReason;
  else
    return 0;
}

- (void)setSubscribeUnsubscribeSurfaceReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subscribeUnsubscribeSurfaceReason = a3;
}

- (void)setHasSubscribeUnsubscribeSurfaceReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubscribeUnsubscribeSurfaceReason
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
}

- (BOOL)hasPreviousArticleVersion
{
  return self->_previousArticleVersion != 0;
}

- (int)feedSubscriptionOrigin
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_feedSubscriptionOrigin;
  else
    return 0;
}

- (void)setFeedSubscriptionOrigin:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_feedSubscriptionOrigin = a3;
}

- (void)setHasFeedSubscriptionOrigin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFeedSubscriptionOrigin
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)feedSubscriptionOriginAsString:(int)a3
{
  if (a3 < 0xA)
    return off_24CD4FCE8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedSubscriptionOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_INITIATED_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAFARI_HISTORY_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL_APP_USAGE_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL_APP_USAGE_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOT_NEWS_TODAY_TOPIC_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOT_NEWS_TODAY_SUB_TOPIC_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FALLBACK_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT_TOPICS_FEED_SUBSCRIPTION_ORIGIN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PORTRAIT_FEED_SUBSCRIPTION_ORIGIN")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return *(_WORD *)&self->_has & 1;
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
  v8.super_class = (Class)NTPBFeedSubscribeUnsubscribe;
  -[NTPBFeedSubscribeUnsubscribe description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBFeedSubscribeUnsubscribe dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  uint64_t feedType;
  __CFString *v7;
  NSString *feedId;
  __int16 v9;
  void *v10;
  uint64_t feedViewPresentationReason;
  __CFString *v12;
  uint64_t feedCellSection;
  __CFString *v14;
  uint64_t feedCellHostType;
  __CFString *v16;
  NSData *feedViewExposureId;
  void *v18;
  NSString *searchString;
  NSMutableArray *subscribedFeedIds;
  void *v21;
  NSString *groupFeedId;
  __int16 v23;
  uint64_t groupType;
  __CFString *v25;
  void *v26;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  __int16 v30;
  uint64_t recommendationBrickType;
  __CFString *v32;
  void *v33;
  NSString *articleId;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  __int16 v37;
  uint64_t feedSubscriptionOrigin;
  __CFString *v39;
  void *v40;
  NSData *groupViewExposureId;
  id v42;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_action"));

    has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_24CD4F860[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("feed_type"));

  }
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  v9 = (__int16)self->_has;
  if ((v9 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_subscribeUnsubscribeLocation);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("subscribe_unsubscribe_location"));

    v9 = (__int16)self->_has;
    if ((v9 & 0x40) == 0)
    {
LABEL_12:
      if ((v9 & 8) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_12;
  }
  feedViewPresentationReason = self->_feedViewPresentationReason;
  if (feedViewPresentationReason >= 0x2C)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedViewPresentationReason);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_24CD4F910[feedViewPresentationReason];
  }
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("feed_view_presentation_reason"));

  v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_13:
    if ((v9 & 4) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
LABEL_20:
  feedCellSection = self->_feedCellSection;
  if (feedCellSection >= 0x12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellSection);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24CD4FA70[feedCellSection];
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("feed_cell_section"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellHostType);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_24CD4FB00[feedCellHostType];
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("feed_cell_host_type"));

  }
LABEL_28:
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_displayRank);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("display_rank"));

  }
  searchString = self->_searchString;
  if (searchString)
    objc_msgSend(v3, "setObject:forKey:", searchString, CFSTR("search_string"));
  subscribedFeedIds = self->_subscribedFeedIds;
  if (subscribedFeedIds)
    objc_msgSend(v3, "setObject:forKey:", subscribedFeedIds, CFSTR("subscribed_feed_ids"));
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cameFromGroup);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("came_from_group"));

  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v3, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  v23 = (__int16)self->_has;
  if ((v23 & 0x80) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_24CD4FB88[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("group_type"));

    v23 = (__int16)self->_has;
  }
  if ((v23 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToFeed);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("is_paid_subscriber_to_feed"));

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
  v30 = (__int16)self->_has;
  if ((v30 & 0x100) != 0)
  {
    recommendationBrickType = self->_recommendationBrickType;
    if (recommendationBrickType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_recommendationBrickType);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_24CD4FCC8[recommendationBrickType];
    }
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("recommendation_brick_type"));

    v30 = (__int16)self->_has;
  }
  if ((v30 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_subscribeUnsubscribeSurfaceReason);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("subscribe_unsubscribe_surface_reason"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  previousArticleId = self->_previousArticleId;
  if (previousArticleId)
    objc_msgSend(v3, "setObject:forKey:", previousArticleId, CFSTR("previous_article_id"));
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion)
    objc_msgSend(v3, "setObject:forKey:", previousArticleVersion, CFSTR("previous_article_version"));
  v37 = (__int16)self->_has;
  if ((v37 & 0x10) != 0)
  {
    feedSubscriptionOrigin = self->_feedSubscriptionOrigin;
    if (feedSubscriptionOrigin >= 0xA)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedSubscriptionOrigin);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_24CD4FCE8[feedSubscriptionOrigin];
    }
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("feed_subscription_origin"));

    v37 = (__int16)self->_has;
  }
  if ((v37 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("previous_article_publisher_article_version"));

  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  v42 = v3;

  return v42;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedSubscribeUnsubscribeReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int16 v13;
  __int16 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedId)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0)
        goto LABEL_10;
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_10:
    if ((v6 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_11:
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  if ((*(_WORD *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_searchString)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_subscribedFeedIds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  v12 = (__int16)self->_has;
  if ((v12 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x2000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = (__int16)self->_has;
  }
  if ((v13 & 0x400) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  v14 = (__int16)self->_has;
  if ((v14 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v14 = (__int16)self->_has;
  }
  if ((v14 & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_groupViewExposureId)
    PBDataWriterWriteDataField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_userAction;
    *(_WORD *)(v5 + 176) |= 0x800u;
    has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_feedType;
    *(_WORD *)(v5 + 176) |= 0x20u;
  }
  v8 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 152) = self->_subscribeUnsubscribeLocation;
    *(_WORD *)(v6 + 176) |= 0x200u;
    v10 = (__int16)self->_has;
    if ((v10 & 0x40) == 0)
    {
LABEL_7:
      if ((v10 & 8) == 0)
        goto LABEL_8;
      goto LABEL_36;
    }
  }
  else if ((v10 & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 88) = self->_feedViewPresentationReason;
  *(_WORD *)(v6 + 176) |= 0x40u;
  v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_8:
    if ((v10 & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_36:
  *(_DWORD *)(v6 + 56) = self->_feedCellSection;
  *(_WORD *)(v6 + 176) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 52) = self->_feedCellHostType;
    *(_WORD *)(v6 + 176) |= 4u;
  }
LABEL_10:
  v11 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v11;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_displayRank;
    *(_WORD *)(v6 + 176) |= 2u;
  }
  v13 = -[NSString copyWithZone:](self->_searchString, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v13;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v15 = self->_subscribedFeedIds;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v41);
        objc_msgSend((id)v6, "addSubscribedFeedIds:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v17);
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *(_BYTE *)(v6 + 172) = self->_cameFromGroup;
    *(_WORD *)(v6 + 176) |= 0x1000u;
  }
  v21 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3, (_QWORD)v41);
  v22 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v21;

  v23 = (__int16)self->_has;
  if ((v23 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_groupType;
    *(_WORD *)(v6 + 176) |= 0x80u;
    v23 = (__int16)self->_has;
  }
  if ((v23 & 0x2000) != 0)
  {
    *(_BYTE *)(v6 + 173) = self->_isPaidSubscriberToFeed;
    *(_WORD *)(v6 + 176) |= 0x2000u;
  }
  v24 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v24;

  v26 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v26;

  v28 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v28;

  v30 = (__int16)self->_has;
  if ((v30 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_recommendationBrickType;
    *(_WORD *)(v6 + 176) |= 0x100u;
    v30 = (__int16)self->_has;
  }
  if ((v30 & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 156) = self->_subscribeUnsubscribeSurfaceReason;
    *(_WORD *)(v6 + 176) |= 0x400u;
  }
  v31 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v31;

  v33 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v34 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v33;

  v35 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v36 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v35;

  v37 = (__int16)self->_has;
  if ((v37 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_feedSubscriptionOrigin;
    *(_WORD *)(v6 + 176) |= 0x10u;
    v37 = (__int16)self->_has;
  }
  if ((v37 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_previousArticlePublisherArticleVersion;
    *(_WORD *)(v6 + 176) |= 1u;
  }
  v38 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v39 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v38;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *feedId;
  __int16 v8;
  NSData *feedViewExposureId;
  __int16 v10;
  NSString *searchString;
  NSMutableArray *subscribedFeedIds;
  __int16 v13;
  NSString *groupFeedId;
  __int16 v15;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  NSString *articleId;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  __int16 v22;
  __int16 v23;
  NSData *groupViewExposureId;
  char v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_105;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 88);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x800) == 0 || self->_userAction != *((_DWORD *)v4 + 42))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 88) & 0x800) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_feedType != *((_DWORD *)v4 + 19))
      goto LABEL_105;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_105;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_105;
    has = (__int16)self->_has;
  }
  v8 = *((_WORD *)v4 + 88);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x200) == 0 || self->_subscribeUnsubscribeLocation != *((_DWORD *)v4 + 38))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 88) & 0x200) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_feedViewPresentationReason != *((_DWORD *)v4 + 22))
      goto LABEL_105;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 14))
      goto LABEL_105;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 13))
      goto LABEL_105;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_105;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_105;
    has = (__int16)self->_has;
  }
  v10 = *((_WORD *)v4 + 88);
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_displayRank != *((_DWORD *)v4 + 12))
      goto LABEL_105;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_105;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_105;
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if ((unint64_t)subscribedFeedIds | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](subscribedFeedIds, "isEqual:"))
      goto LABEL_105;
  }
  v13 = (__int16)self->_has;
  if ((v13 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x1000) == 0)
      goto LABEL_105;
    if (self->_cameFromGroup)
    {
      if (!*((_BYTE *)v4 + 172))
        goto LABEL_105;
    }
    else if (*((_BYTE *)v4 + 172))
    {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 88) & 0x1000) != 0)
  {
    goto LABEL_105;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_105;
    v13 = (__int16)self->_has;
  }
  v15 = *((_WORD *)v4 + 88);
  if ((v13 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0 || self->_groupType != *((_DWORD *)v4 + 26))
      goto LABEL_105;
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_105;
  }
  if ((v13 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x2000) != 0)
    {
      if (self->_isPaidSubscriberToFeed)
      {
        if (!*((_BYTE *)v4 + 173))
          goto LABEL_105;
        goto LABEL_71;
      }
      if (!*((_BYTE *)v4 + 173))
        goto LABEL_71;
    }
LABEL_105:
    v25 = 0;
    goto LABEL_106;
  }
  if ((*((_WORD *)v4 + 88) & 0x2000) != 0)
    goto LABEL_105;
LABEL_71:
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](campaignId, "isEqual:"))
    goto LABEL_105;
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_105;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_105;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x100) == 0 || self->_recommendationBrickType != *((_DWORD *)v4 + 34))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 88) & 0x100) != 0)
  {
    goto LABEL_105;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x400) == 0 || self->_subscribeUnsubscribeSurfaceReason != *((_DWORD *)v4 + 39))
      goto LABEL_105;
  }
  else if ((*((_WORD *)v4 + 88) & 0x400) != 0)
  {
    goto LABEL_105;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_105;
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_105;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_105;
  }
  v22 = (__int16)self->_has;
  v23 = *((_WORD *)v4 + 88);
  if ((v22 & 0x10) != 0)
  {
    if ((v23 & 0x10) == 0 || self->_feedSubscriptionOrigin != *((_DWORD *)v4 + 18))
      goto LABEL_105;
  }
  else if ((v23 & 0x10) != 0)
  {
    goto LABEL_105;
  }
  if ((v22 & 1) != 0)
  {
    if ((v23 & 1) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 1))
      goto LABEL_105;
  }
  else if ((v23 & 1) != 0)
  {
    goto LABEL_105;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 14))
    v25 = -[NSData isEqual:](groupViewExposureId, "isEqual:");
  else
    v25 = 1;
LABEL_106:

  return v25;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;

  has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v31 = 2654435761 * self->_userAction;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  else
  {
    v31 = 0;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v30 = 2654435761 * self->_feedType;
      goto LABEL_6;
    }
  }
  v30 = 0;
LABEL_6:
  v29 = -[NSString hash](self->_feedId, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x200) != 0)
  {
    v28 = 2654435761 * self->_subscribeUnsubscribeLocation;
    if ((v4 & 0x40) != 0)
    {
LABEL_8:
      v27 = 2654435761 * self->_feedViewPresentationReason;
      if ((v4 & 8) != 0)
        goto LABEL_9;
LABEL_13:
      v26 = 0;
      if ((v4 & 4) != 0)
        goto LABEL_10;
      goto LABEL_14;
    }
  }
  else
  {
    v28 = 0;
    if ((v4 & 0x40) != 0)
      goto LABEL_8;
  }
  v27 = 0;
  if ((v4 & 8) == 0)
    goto LABEL_13;
LABEL_9:
  v26 = 2654435761 * self->_feedCellSection;
  if ((v4 & 4) != 0)
  {
LABEL_10:
    v25 = 2654435761 * self->_feedCellHostType;
    goto LABEL_15;
  }
LABEL_14:
  v25 = 0;
LABEL_15:
  v24 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_WORD *)&self->_has & 2) != 0)
    v23 = 2654435761 * self->_displayRank;
  else
    v23 = 0;
  v22 = -[NSString hash](self->_searchString, "hash");
  v21 = -[NSMutableArray hash](self->_subscribedFeedIds, "hash");
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    v20 = 2654435761 * self->_cameFromGroup;
  else
    v20 = 0;
  v19 = -[NSString hash](self->_groupFeedId, "hash");
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v18 = 2654435761 * self->_groupType;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_23;
  }
  else
  {
    v18 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_23:
      v17 = 2654435761 * self->_isPaidSubscriberToFeed;
      goto LABEL_26;
    }
  }
  v17 = 0;
LABEL_26:
  v5 = -[NSString hash](self->_campaignId, "hash");
  v6 = -[NSString hash](self->_campaignType, "hash");
  v7 = -[NSString hash](self->_creativeId, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v8 = 2654435761 * self->_recommendationBrickType;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_28;
  }
  else
  {
    v8 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_28:
      v9 = 2654435761 * self->_subscribeUnsubscribeSurfaceReason;
      goto LABEL_31;
    }
  }
  v9 = 0;
LABEL_31:
  v10 = -[NSString hash](self->_articleId, "hash");
  v11 = -[NSString hash](self->_previousArticleId, "hash");
  v12 = -[NSString hash](self->_previousArticleVersion, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    v14 = 2654435761 * self->_feedSubscriptionOrigin;
    if ((v13 & 1) != 0)
      goto LABEL_33;
LABEL_35:
    v15 = 0;
    return v30 ^ v31 ^ v28 ^ v27 ^ v26 ^ v25 ^ v29 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ -[NSData hash](self->_groupViewExposureId, "hash");
  }
  v14 = 0;
  if ((v13 & 1) == 0)
    goto LABEL_35;
LABEL_33:
  v15 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  return v30 ^ v31 ^ v28 ^ v27 ^ v26 ^ v25 ^ v29 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ -[NSData hash](self->_groupViewExposureId, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;
  __int16 v6;
  __int16 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (int *)a3;
  v5 = v4;
  v6 = *((_WORD *)v4 + 88);
  if ((v6 & 0x800) != 0)
  {
    self->_userAction = v4[42];
    *(_WORD *)&self->_has |= 0x800u;
    v6 = *((_WORD *)v4 + 88);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_feedType = v4[19];
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 8))
    -[NTPBFeedSubscribeUnsubscribe setFeedId:](self, "setFeedId:");
  v7 = *((_WORD *)v5 + 88);
  if ((v7 & 0x200) != 0)
  {
    self->_subscribeUnsubscribeLocation = v5[38];
    *(_WORD *)&self->_has |= 0x200u;
    v7 = *((_WORD *)v5 + 88);
    if ((v7 & 0x40) == 0)
    {
LABEL_9:
      if ((v7 & 8) == 0)
        goto LABEL_10;
      goto LABEL_58;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_feedViewPresentationReason = v5[22];
  *(_WORD *)&self->_has |= 0x40u;
  v7 = *((_WORD *)v5 + 88);
  if ((v7 & 8) == 0)
  {
LABEL_10:
    if ((v7 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_58:
  self->_feedCellSection = v5[14];
  *(_WORD *)&self->_has |= 8u;
  if ((v5[44] & 4) != 0)
  {
LABEL_11:
    self->_feedCellHostType = v5[13];
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((_QWORD *)v5 + 10))
    -[NTPBFeedSubscribeUnsubscribe setFeedViewExposureId:](self, "setFeedViewExposureId:");
  if ((v5[44] & 2) != 0)
  {
    self->_displayRank = v5[12];
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 18))
    -[NTPBFeedSubscribeUnsubscribe setSearchString:](self, "setSearchString:");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = *((id *)v5 + 20);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[NTPBFeedSubscribeUnsubscribe addSubscribedFeedIds:](self, "addSubscribedFeedIds:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  if ((v5[44] & 0x1000) != 0)
  {
    self->_cameFromGroup = *((_BYTE *)v5 + 172);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  if (*((_QWORD *)v5 + 12))
    -[NTPBFeedSubscribeUnsubscribe setGroupFeedId:](self, "setGroupFeedId:");
  v13 = *((_WORD *)v5 + 88);
  if ((v13 & 0x80) != 0)
  {
    self->_groupType = v5[26];
    *(_WORD *)&self->_has |= 0x80u;
    v13 = *((_WORD *)v5 + 88);
  }
  if ((v13 & 0x2000) != 0)
  {
    self->_isPaidSubscriberToFeed = *((_BYTE *)v5 + 173);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v5 + 3))
    -[NTPBFeedSubscribeUnsubscribe setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v5 + 4))
    -[NTPBFeedSubscribeUnsubscribe setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v5 + 5))
    -[NTPBFeedSubscribeUnsubscribe setCreativeId:](self, "setCreativeId:");
  v14 = *((_WORD *)v5 + 88);
  if ((v14 & 0x100) != 0)
  {
    self->_recommendationBrickType = v5[34];
    *(_WORD *)&self->_has |= 0x100u;
    v14 = *((_WORD *)v5 + 88);
  }
  if ((v14 & 0x400) != 0)
  {
    self->_subscribeUnsubscribeSurfaceReason = v5[39];
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)v5 + 2))
    -[NTPBFeedSubscribeUnsubscribe setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 15))
    -[NTPBFeedSubscribeUnsubscribe setPreviousArticleId:](self, "setPreviousArticleId:");
  if (*((_QWORD *)v5 + 16))
    -[NTPBFeedSubscribeUnsubscribe setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  v15 = *((_WORD *)v5 + 88);
  if ((v15 & 0x10) != 0)
  {
    self->_feedSubscriptionOrigin = v5[18];
    *(_WORD *)&self->_has |= 0x10u;
    v15 = *((_WORD *)v5 + 88);
  }
  if ((v15 & 1) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v5 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 14))
    -[NTPBFeedSubscribeUnsubscribe setGroupViewExposureId:](self, "setGroupViewExposureId:");

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

- (int)displayRank
{
  return self->_displayRank;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (NSMutableArray)subscribedFeedIds
{
  return self->_subscribedFeedIds;
}

- (void)setSubscribedFeedIds:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedFeedIds, a3);
}

- (BOOL)cameFromGroup
{
  return self->_cameFromGroup;
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_groupFeedId, a3);
}

- (BOOL)isPaidSubscriberToFeed
{
  return self->_isPaidSubscriberToFeed;
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

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
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
  objc_storeStrong((id *)&self->_subscribedFeedIds, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
