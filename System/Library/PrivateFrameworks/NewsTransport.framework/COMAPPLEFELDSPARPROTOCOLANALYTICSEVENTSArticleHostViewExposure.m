@implementation COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure

- (int)articleHostViewType
{
  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
    return self->_articleHostViewType;
  else
    return 0;
}

- (void)setArticleHostViewType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_articleHostViewType = a3;
}

- (void)setHasArticleHostViewType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasArticleHostViewType
{
  return (*(_QWORD *)&self->_has >> 17) & 1;
}

- (id)articleHostViewTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_24CD52378[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArticleHostViewType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ARTICLE_HOST_VIEW_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEED_VIEW_CELL_ARTICLE_HOST_VIEW_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXCERPT_VIEW_ARTICLE_HOST_VIEW_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_VIEW_ARTICLE_HOST_VIEW_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEED_VIEW_CELL_PLAY_VIDEO_ARTICLE_HOST_VIEW_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEED_VIEW_CELL_TAP_PLAY_VIDEO_ARTICLE_HOST_VIEW_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORIAL_HOMEPAGE_MEDIA_ARTICLE_HOST_VIEW_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_VIEW_PLAY_ARTICLE_HOST_VIEW_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_ARTICLE_HOST_VIEW_TYPE")))
  {
    v4 = 8;
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

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (void)setPublisherArticleVersion:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000000uLL;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPublisherArticleVersion
{
  return (*(_QWORD *)&self->_has >> 52) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasBackendArticleVersion
{
  return (*(_QWORD *)&self->_has >> 21) & 1;
}

- (BOOL)hasArticleSessionId
{
  return self->_articleSessionId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (void)setDisplayRank:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_displayRank = a3;
}

- (void)setHasDisplayRank:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasDisplayRank
{
  return (*(_QWORD *)&self->_has >> 28) & 1;
}

- (int)articleViewPresentationReason
{
  if ((*(_QWORD *)&self->_has & 0x100000) != 0)
    return self->_articleViewPresentationReason;
  else
    return 0;
}

- (void)setArticleViewPresentationReason:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_articleViewPresentationReason = a3;
}

- (void)setHasArticleViewPresentationReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasArticleViewPresentationReason
{
  return (*(_QWORD *)&self->_has >> 20) & 1;
}

- (id)articleViewPresentationReasonAsString:(int)a3
{
  if (a3 < 0x1E)
    return off_24CD523C0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArticleViewPresentationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXCERPT_VIEW_READ_MORE_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_URL_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ARTICLE_VIEW_CELL_SELECTION_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEED_VIEW_CELL_SELECTION_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SWIPE_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_PUB_ARTICLES_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RELATED_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HANDOFF_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAME_FROM_AD_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COVER_ARTICLE_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_LAUNCH_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_ARTICLE_AFFORDANCE_TAP_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_ARTICLE_MARGIN_TAP_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_ARTICLE_BACK_TAP_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINKED_FROM_OTHER_NEWS_ARTICLE_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_ARTICLE_SELECTION_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS_SELECTION_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAFARI_SEARCH_RESULTS_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORIAL_HOMEPAGE_TAB_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_EDITORIAL_ARTICLE_TAP_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_AUTO_PLAY_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_GROUP_PLAY_VIDEO_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOC_CELL_SELECTION_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_TOC_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOC_MODAL_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_MODAL_TOC_ARTICLE_VIEW_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 28;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FROM_TOC_ARTICLE_VIEW_PRESENTATION_REASON")))
  {
    v4 = 29;
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

- (int)feedPresentationReason
{
  if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
    return self->_feedPresentationReason;
  else
    return 0;
}

- (void)setFeedPresentationReason:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_feedPresentationReason = a3;
}

- (void)setHasFeedPresentationReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasFeedPresentationReason
{
  return (*(_QWORD *)&self->_has >> 31) & 1;
}

- (id)feedPresentationReasonAsString:(int)a3
{
  if (a3 < 0x2C)
    return off_24CD524B0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedPresentationReason:(id)a3
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

- (BOOL)hasFeedPresentationReasonSearchString
{
  return self->_feedPresentationReasonSearchString != 0;
}

- (int)feedCellHostType
{
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
    return self->_feedCellHostType;
  else
    return 0;
}

- (void)setFeedCellHostType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_feedCellHostType = a3;
}

- (void)setHasFeedCellHostType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasFeedCellHostType
{
  return (*(_QWORD *)&self->_has >> 30) & 1;
}

- (id)feedCellHostTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_24CD52610[a3];
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

- (int)parentFeedType
{
  if ((*(_QWORD *)&self->_has & 0x2000000000000) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_QWORD *)&self->_has >> 49) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD52698[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParentFeedType:(id)a3
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

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (void)setIsUserSubscribedToParentFeed:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x80000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isUserSubscribedToParentFeed = a3;
}

- (void)setHasIsUserSubscribedToParentFeed:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFF7FFFF;
  if (a3)
    v4 = 0x80000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsUserSubscribedToParentFeed
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 19) & 1;
}

- (void)setActiveTimeSpent:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_activeTimeSpent = a3;
}

- (void)setHasActiveTimeSpent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasActiveTimeSpent
{
  return (*(_QWORD *)&self->_has >> 15) & 1;
}

- (void)setMaxActiveTimeSpent:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_maxActiveTimeSpent = a3;
}

- (void)setHasMaxActiveTimeSpent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasMaxActiveTimeSpent
{
  return (*(_QWORD *)&self->_has >> 41) & 1;
}

- (void)setDidBounce:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 1u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_didBounce = a3;
}

- (void)setHasDidBounce:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (BOOL)hasDidBounce
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (void)setIsNewUserToArticle:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x1000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isNewUserToArticle = a3;
}

- (void)setHasIsNewUserToArticle:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xEFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 4096;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xEFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsNewUserToArticle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 12) & 1;
}

- (void)setDidOpenInSafari:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 4u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_didOpenInSafari = a3;
}

- (void)setHasDidOpenInSafari:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFFB | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 4;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasDidOpenInSafari
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (void)setIsExplorationArticle:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x100u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isExplorationArticle = a3;
}

- (void)setHasIsExplorationArticle:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFEFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 256;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsExplorationArticle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (BOOL)hasSourceBinId
{
  return self->_sourceBinId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_QWORD *)&self->_has >> 61) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasViewFrameInScreen
{
  return self->_viewFrameInScreen != 0;
}

- (void)setCharacterCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_characterCount = a3;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasCharacterCount
{
  return (*(_QWORD *)&self->_has >> 24) & 1;
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

- (int)articleType
{
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasArticleType
{
  return (*(_QWORD *)&self->_has >> 19) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD52748[a3];
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

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (void)setIsDigitalReplicaAd:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x80u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFF7F | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 128;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (int)previousArticleHostViewTypeIfSwipe
{
  if ((*(_QWORD *)&self->_has & 0x4000000000000) != 0)
    return self->_previousArticleHostViewTypeIfSwipe;
  else
    return 0;
}

- (void)setPreviousArticleHostViewTypeIfSwipe:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000uLL;
  self->_previousArticleHostViewTypeIfSwipe = a3;
}

- (void)setHasPreviousArticleHostViewTypeIfSwipe:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPreviousArticleHostViewTypeIfSwipe
{
  return (*(_QWORD *)&self->_has >> 50) & 1;
}

- (id)previousArticleHostViewTypeIfSwipeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD52778[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreviousArticleHostViewTypeIfSwipe:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PREVIOUS_ARTICLE_HOST_VIEW_TYPE_IF_SWIPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXCERPT_VIEW_PREVIOUS_ARTICLE_HOST_VIEW_TYPE_IF_SWIPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_VIEW_PREVIOUS_ARTICLE_HOST_VIEW_TYPE_IF_SWIPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsVideoInFeed:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x100000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isVideoInFeed = a3;
}

- (void)setHasIsVideoInFeed:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFEFFFFF;
  if (a3)
    v4 = 0x100000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsVideoInFeed
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 20) & 1;
}

- (void)setIsTopStoryArticle:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x40000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFBFFFF;
  if (a3)
    v4 = 0x40000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsTopStoryArticle
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 18) & 1;
}

- (BOOL)hasStoryType
{
  return self->_storyType != 0;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_QWORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasUserActivityType
{
  return self->_userActivityType != 0;
}

- (void)setIsGroupedArticle:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x400u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isGroupedArticle = a3;
}

- (void)setHasIsGroupedArticle:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFBFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 1024;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFBFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsGroupedArticle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 10) & 1;
}

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (int)groupType
{
  if ((*(_QWORD *)&self->_has & 0x4000000000) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasGroupType
{
  return (*(_QWORD *)&self->_has >> 38) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD52790[a3];
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
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x10000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isSubscribedToGroupFeed = a3;
}

- (void)setHasIsSubscribedToGroupFeed:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFEFFFF;
  if (a3)
    v4 = 0x10000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsSubscribedToGroupFeed
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 16) & 1;
}

- (void)setArticleDisplayRankInGroup:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_articleDisplayRankInGroup = a3;
}

- (void)setHasArticleDisplayRankInGroup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasArticleDisplayRankInGroup
{
  return (*(_QWORD *)&self->_has >> 16) & 1;
}

- (void)setSubscriptionOnlyArticle:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x200000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_subscriptionOnlyArticle = a3;
}

- (void)setHasSubscriptionOnlyArticle:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFDFFFFF;
  if (a3)
    v4 = 0x200000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasSubscriptionOnlyArticle
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 21) & 1;
}

- (void)setIsSharedSubscriptionOnlyArticle:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x8000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isSharedSubscriptionOnlyArticle = a3;
}

- (void)setHasIsSharedSubscriptionOnlyArticle:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0x7FFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x8000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0x7FFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsSharedSubscriptionOnlyArticle
{
  return (unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 15;
}

- (void)setIsFreeArticle:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x200u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isFreeArticle = a3;
}

- (void)setHasIsFreeArticle:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFDFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 512;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFDFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsFreeArticle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 9) & 1;
}

- (void)setIsPaidSubscriberToFeed:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x2000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isPaidSubscriberToFeed = a3;
}

- (void)setHasIsPaidSubscriberToFeed:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xDFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x2000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xDFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsPaidSubscriberToFeed
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 13) & 1;
}

- (void)setIsCoverArticle:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x40u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isCoverArticle = a3;
}

- (void)setHasIsCoverArticle:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFBF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 64;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsCoverArticle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (void)setCoverArticleDisplayRank:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_coverArticleDisplayRank = a3;
}

- (void)setHasCoverArticleDisplayRank:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasCoverArticleDisplayRank
{
  return (*(_QWORD *)&self->_has >> 25) & 1;
}

- (int)coverArticleFeatureType
{
  if ((*(_QWORD *)&self->_has & 0x4000000) != 0)
    return self->_coverArticleFeatureType;
  else
    return 0;
}

- (void)setCoverArticleFeatureType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_coverArticleFeatureType = a3;
}

- (void)setHasCoverArticleFeatureType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasCoverArticleFeatureType
{
  return (*(_QWORD *)&self->_has >> 26) & 1;
}

- (id)coverArticleFeatureTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD528D0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCoverArticleFeatureType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_COVER_ARTICLE_FEATURE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SQUARE_COVER_ARTICLE_FEATURE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PORTRAIT_COVER_ARTICLE_FEATURE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LANDSCAPE_COVER_ARTICLE_FEATURE_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)paidSubscriberToFeedType
{
  if ((*(_QWORD *)&self->_has & 0x1000000000000) != 0)
    return self->_paidSubscriberToFeedType;
  else
    return 0;
}

- (void)setPaidSubscriberToFeedType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  self->_paidSubscriberToFeedType = a3;
}

- (void)setHasPaidSubscriberToFeedType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPaidSubscriberToFeedType
{
  return HIWORD(*(_QWORD *)&self->_has) & 1;
}

- (id)paidSubscriberToFeedTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD528F0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPaidSubscriberToFeedType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PAID_SUBSCRIBER_TO_FEED_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_PAID_SUBSCRIBER_TO_FEED_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_STORE_PAID_SUBSCRIBER_TO_FEED_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WEBSITE_PAID_SUBSCRIBER_TO_FEED_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x4000u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xBFFF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 0x4000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xBFFF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 14) & 1;
}

- (void)setMaxVerticalScrollPositionEnding:(float)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_maxVerticalScrollPositionEnding = a3;
}

- (void)setHasMaxVerticalScrollPositionEnding:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasMaxVerticalScrollPositionEnding
{
  return (*(_QWORD *)&self->_has >> 42) & 1;
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

- (void)setViewFromNotificationDirectOpen:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x400000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_viewFromNotificationDirectOpen = a3;
}

- (void)setHasViewFromNotificationDirectOpen:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFBFFFFF;
  if (a3)
    v4 = 0x400000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasViewFromNotificationDirectOpen
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 22) & 1;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
}

- (int)nextArticleAffordanceType
{
  if ((*(_QWORD *)&self->_has & 0x800000000000) != 0)
    return self->_nextArticleAffordanceType;
  else
    return 0;
}

- (void)setNextArticleAffordanceType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000uLL;
  self->_nextArticleAffordanceType = a3;
}

- (void)setHasNextArticleAffordanceType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasNextArticleAffordanceType
{
  return (*(_QWORD *)&self->_has >> 47) & 1;
}

- (id)nextArticleAffordanceTypeAsString:(int)a3
{
  if (a3 < 0x10)
    return off_24CD52910[a3];
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

- (void)setGroupArticleCountInForYou:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_groupArticleCountInForYou = a3;
}

- (void)setHasGroupArticleCountInForYou:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasGroupArticleCountInForYou
{
  return (*(_QWORD *)&self->_has >> 33) & 1;
}

- (void)setGroupDisplayRankInForYou:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_groupDisplayRankInForYou = a3;
}

- (void)setHasGroupDisplayRankInForYou:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasGroupDisplayRankInForYou
{
  return (*(_QWORD *)&self->_has >> 34) & 1;
}

- (void)setArticleLoaded:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  self->_articleLoaded = a3;
}

- (void)setHasArticleLoaded:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasArticleLoaded
{
  return (*(_QWORD *)&self->_has >> 62) & 1;
}

- (int)loadFailureReason
{
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
    return self->_loadFailureReason;
  else
    return 0;
}

- (void)setLoadFailureReason:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_loadFailureReason = a3;
}

- (void)setHasLoadFailureReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasLoadFailureReason
{
  return (*(_QWORD *)&self->_has >> 40) & 1;
}

- (id)loadFailureReasonAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD52990[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLoadFailureReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_LOAD_FAILURE_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIMEOUT_LOAD_FAILURE_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNABLE_TO_FETCH_LOAD_FAILURE_REASON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNABLE_TO_PARSE_JSON_LOAD_FAILURE_REASON")))
  {
    v4 = 3;
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

- (int)widgetSection
{
  if ((*(_QWORD *)&self->_has & 0x800000000000000) != 0)
    return self->_widgetSection;
  else
    return 0;
}

- (void)setWidgetSection:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000000000uLL;
  self->_widgetSection = a3;
}

- (void)setHasWidgetSection:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetSection
{
  return (*(_QWORD *)&self->_has >> 59) & 1;
}

- (id)widgetSectionAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD529B0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetSection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_SECTION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_STORIES_WIDGET_SECTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOR_YOU_WIDGET_SECTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRENDING_WIDGET_SECTION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORIAL_WIDGET_SECTION")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setWidgetSectionArticleRank:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  self->_widgetSectionArticleRank = a3;
}

- (void)setHasWidgetSectionArticleRank:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetSectionArticleRank
{
  return (*(_QWORD *)&self->_has >> 60) & 1;
}

- (void)setWidgetArticleRank:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  self->_widgetArticleRank = a3;
}

- (void)setHasWidgetArticleRank:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasWidgetArticleRank
{
  return (*(_QWORD *)&self->_has >> 58) & 1;
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

- (void)setIsBreakingNewsArticle:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x20u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isBreakingNewsArticle = a3;
}

- (void)setHasIsBreakingNewsArticle:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFDF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 32;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (void)setBreakingNewsArticlePosition:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_breakingNewsArticlePosition = a3;
}

- (void)setHasBreakingNewsArticlePosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasBreakingNewsArticlePosition
{
  return (*(_QWORD *)&self->_has >> 23) & 1;
}

- (void)setBreakingNewsArticleCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_breakingNewsArticleCount = a3;
}

- (void)setHasBreakingNewsArticleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasBreakingNewsArticleCount
{
  return (*(_QWORD *)&self->_has >> 22) & 1;
}

- (int)topStoryType
{
  if ((*(_QWORD *)&self->_has & 0x200000000000000) != 0)
    return self->_topStoryType;
  else
    return 0;
}

- (void)setTopStoryType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  self->_topStoryType = a3;
}

- (void)setHasTopStoryType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTopStoryType
{
  return (*(_QWORD *)&self->_has >> 57) & 1;
}

- (id)topStoryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD529D8[a3];
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

- (void)setTopStoryMandatoryArticleCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  self->_topStoryMandatoryArticleCount = a3;
}

- (void)setHasTopStoryMandatoryArticleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTopStoryMandatoryArticleCount
{
  return (*(_QWORD *)&self->_has >> 55) & 1;
}

- (void)setTopStoryOptionalArticleCount:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  self->_topStoryOptionalArticleCount = a3;
}

- (void)setHasTopStoryOptionalArticleCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasTopStoryOptionalArticleCount
{
  return HIBYTE(*(_QWORD *)&self->_has) & 1;
}

- (int)groupPresentationReason
{
  if ((*(_QWORD *)&self->_has & 0x2000000000) != 0)
    return self->_groupPresentationReason;
  else
    return 0;
}

- (void)setGroupPresentationReason:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_groupPresentationReason = a3;
}

- (void)setHasGroupPresentationReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasGroupPresentationReason
{
  return (*(_QWORD *)&self->_has >> 37) & 1;
}

- (id)groupPresentationReasonAsString:(int)a3
{
  if (a3 < 0xB)
    return off_24CD529F0[a3];
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

- (void)setPersonalizationScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_personalizationScore = a3;
}

- (void)setHasPersonalizationScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasPersonalizationScore
{
  return (*(_QWORD *)&self->_has >> 9) & 1;
}

- (void)setIsSubscribedToSourceChannel:(BOOL)a3
{
  int v3;
  unsigned int v4;

  v3 = *((unsigned __int16 *)&self->_has + 4);
  v4 = (v3 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_has + 4) = v3;
  *((_BYTE *)&self->_has + 10) = v4;
  self->_isSubscribedToSourceChannel = a3;
}

- (void)setHasIsSubscribedToSourceChannel:(BOOL)a3
{
  unsigned int v3;
  int v4;

  v3 = (*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0xFFFDFFFF;
  if (a3)
    v4 = 0x20000;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
  *((_BYTE *)&self->_has + 10) = (v3 | v4) >> 16;
}

- (BOOL)hasIsSubscribedToSourceChannel
{
  return ((unint64_t)(*((unsigned __int8 *)&self->_has + 10) << 16) >> 17) & 1;
}

- (void)setIsNativeAd:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x800u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xF7FF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 2048;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xF7FF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsNativeAd
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 11) & 1;
}

- (BOOL)hasNativeCampaignData
{
  return self->_nativeCampaignData != 0;
}

- (BOOL)hasPreviousArticleVersion
{
  return self->_previousArticleVersion != 0;
}

- (BOOL)hasAnfComponentId
{
  return self->_anfComponentId != 0;
}

- (void)setBadgeExposure:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000000;
  self->_badgeExposure = a3;
}

- (void)setHasBadgeExposure:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = v3 & 0x8000000000000000 | *(_QWORD *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasBadgeExposure
{
  return *(_QWORD *)&self->_has >> 63;
}

- (BOOL)hasWidgetEngagement
{
  return self->_widgetEngagement != 0;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(_QWORD *)&self->_has >> 12) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasBackendArticleVersionInt64
{
  return (*(_QWORD *)&self->_has >> 3) & 1;
}

- (int)feedSubscriptionOrigin
{
  if ((*(_QWORD *)&self->_has & 0x100000000) != 0)
    return self->_feedSubscriptionOrigin;
  else
    return 0;
}

- (void)setFeedSubscriptionOrigin:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_feedSubscriptionOrigin = a3;
}

- (void)setHasFeedSubscriptionOrigin:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasFeedSubscriptionOrigin
{
  return HIDWORD(*(_QWORD *)&self->_has) & 1;
}

- (id)feedSubscriptionOriginAsString:(int)a3
{
  if (a3 < 0xA)
    return off_24CD52A48[a3];
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
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(_QWORD *)&self->_has >> 11) & 1;
}

- (int)groupFormationReason
{
  if ((*(_QWORD *)&self->_has & 0x800000000) != 0)
    return self->_groupFormationReason;
  else
    return 0;
}

- (void)setGroupFormationReason:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_groupFormationReason = a3;
}

- (void)setHasGroupFormationReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasGroupFormationReason
{
  return (*(_QWORD *)&self->_has >> 35) & 1;
}

- (id)groupFormationReasonAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD52A98[a3];
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
  if ((*(_QWORD *)&self->_has & 0x20000000) != 0)
    return self->_feedAutoSubscribeType;
  else
    return 0;
}

- (void)setFeedAutoSubscribeType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_feedAutoSubscribeType = a3;
}

- (void)setHasFeedAutoSubscribeType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasFeedAutoSubscribeType
{
  return (*(_QWORD *)&self->_has >> 29) & 1;
}

- (id)feedAutoSubscribeTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD52AB8[a3];
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

- (void)setFeatureCtr:(double)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_featureCtr = a3;
}

- (void)setHasFeatureCtr:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasFeatureCtr
{
  return (*(_QWORD *)&self->_has >> 6) & 1;
}

- (void)setPaidNonpaidSubscriptionCtr:(double)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_paidNonpaidSubscriptionCtr = a3;
}

- (void)setHasPaidNonpaidSubscriptionCtr:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasPaidNonpaidSubscriptionCtr
{
  return (*(_QWORD *)&self->_has >> 8) & 1;
}

- (void)setAutoSubscribeCtr:(double)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_autoSubscribeCtr = a3;
}

- (void)setHasAutoSubscribeCtr:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasAutoSubscribeCtr
{
  return (*(_QWORD *)&self->_has >> 2) & 1;
}

- (void)setComputedGlobalScoreCoefficient:(double)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_computedGlobalScoreCoefficient = a3;
}

- (void)setHasComputedGlobalScoreCoefficient:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasComputedGlobalScoreCoefficient
{
  return (*(_QWORD *)&self->_has >> 4) & 1;
}

- (void)setGlobalScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_globalScore = a3;
}

- (void)setHasGlobalScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasGlobalScore
{
  return (*(_QWORD *)&self->_has >> 7) & 1;
}

- (void)setUserFeedbackScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_userFeedbackScore = a3;
}

- (void)setHasUserFeedbackScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasUserFeedbackScore
{
  return (*(_QWORD *)&self->_has >> 14) & 1;
}

- (void)setAgedUserFeedbackScore:(double)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_agedUserFeedbackScore = a3;
}

- (void)setHasAgedUserFeedbackScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasAgedUserFeedbackScore
{
  return (*(_QWORD *)&self->_has >> 1) & 1;
}

- (void)setAgedPersonalizationScore:(double)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_agedPersonalizationScore = a3;
}

- (void)setHasAgedPersonalizationScore:(BOOL)a3
{
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasAgedPersonalizationScore
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDiversifiedPersonalizationScore:(double)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_diversifiedPersonalizationScore = a3;
}

- (void)setHasDiversifiedPersonalizationScore:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasDiversifiedPersonalizationScore
{
  return (*(_QWORD *)&self->_has >> 5) & 1;
}

- (int)moduleEventType
{
  if ((*(_QWORD *)&self->_has & 0x80000000000) != 0)
    return self->_moduleEventType;
  else
    return 0;
}

- (void)setModuleEventType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_moduleEventType = a3;
}

- (void)setHasModuleEventType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasModuleEventType
{
  return (*(_QWORD *)&self->_has >> 43) & 1;
}

- (id)moduleEventTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD52AD0[a3];
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
  if ((*(_QWORD *)&self->_has & 0x400000000000) != 0)
    return self->_moduleLocation;
  else
    return 0;
}

- (void)setModuleLocation:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  self->_moduleLocation = a3;
}

- (void)setHasModuleLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasModuleLocation
{
  return (*(_QWORD *)&self->_has >> 46) & 1;
}

- (id)moduleLocationAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD52AE8[a3];
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
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_moduleItemCount = a3;
}

- (void)setHasModuleItemCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasModuleItemCount
{
  return (*(_QWORD *)&self->_has >> 44) & 1;
}

- (void)setModuleItemPosition:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_moduleItemPosition = a3;
}

- (void)setHasModuleItemPosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasModuleItemPosition
{
  return (*(_QWORD *)&self->_has >> 45) & 1;
}

- (BOOL)hasModuleExposureId
{
  return self->_moduleExposureId != 0;
}

- (BOOL)hasPreviousWebEmbedId
{
  return self->_previousWebEmbedId != 0;
}

- (int)previousWebEmbedLocation
{
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
    return self->_previousWebEmbedLocation;
  else
    return 0;
}

- (void)setPreviousWebEmbedLocation:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  self->_previousWebEmbedLocation = a3;
}

- (void)setHasPreviousWebEmbedLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPreviousWebEmbedLocation
{
  return (*(_QWORD *)&self->_has >> 51) & 1;
}

- (id)previousWebEmbedLocationAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD52B00[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreviousWebEmbedLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PREVIOUS_WEB_EMBED_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_MODULE_PREVIOUS_WEB_EMBED_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_PREVIOUS_WEB_EMBED_LOCATION")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearSurfacedByTagIds
{
  -[NSMutableArray removeAllObjects](self->_surfacedByTagIds, "removeAllObjects");
}

- (void)addSurfacedByTagIds:(id)a3
{
  id v4;
  NSMutableArray *surfacedByTagIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  surfacedByTagIds = self->_surfacedByTagIds;
  v8 = v4;
  if (!surfacedByTagIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_surfacedByTagIds;
    self->_surfacedByTagIds = v6;

    v4 = v8;
    surfacedByTagIds = self->_surfacedByTagIds;
  }
  -[NSMutableArray addObject:](surfacedByTagIds, "addObject:", v4);

}

- (unint64_t)surfacedByTagIdsCount
{
  return -[NSMutableArray count](self->_surfacedByTagIds, "count");
}

- (id)surfacedByTagIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_surfacedByTagIds, "objectAtIndex:", a3);
}

+ (Class)surfacedByTagIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasIadNativeCampaignAd
{
  return self->_iadNativeCampaignAd != 0;
}

- (int)curatedContentType
{
  if ((*(_QWORD *)&self->_has & 0x8000000) != 0)
    return self->_curatedContentType;
  else
    return 0;
}

- (void)setCuratedContentType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_curatedContentType = a3;
}

- (void)setHasCuratedContentType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasCuratedContentType
{
  return (*(_QWORD *)&self->_has >> 27) & 1;
}

- (id)curatedContentTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD52B18[a3];
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

- (int)groupLocation
{
  if ((*(_QWORD *)&self->_has & 0x1000000000) != 0)
    return self->_groupLocation;
  else
    return 0;
}

- (void)setGroupLocation:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_groupLocation = a3;
}

- (void)setHasGroupLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasGroupLocation
{
  return (*(_QWORD *)&self->_has >> 36) & 1;
}

- (id)groupLocationAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD52B30[a3];
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

- (BOOL)hasExposedInLocationId
{
  return self->_exposedInLocationId != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (BOOL)hasExposedGroupSourceChannelId
{
  return self->_exposedGroupSourceChannelId != 0;
}

- (int)articleSuggestionOrigin
{
  if ((*(_QWORD *)&self->_has & 0x40000) != 0)
    return self->_articleSuggestionOrigin;
  else
    return 0;
}

- (void)setArticleSuggestionOrigin:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_articleSuggestionOrigin = a3;
}

- (void)setHasArticleSuggestionOrigin:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasArticleSuggestionOrigin
{
  return (*(_QWORD *)&self->_has >> 18) & 1;
}

- (id)articleSuggestionOriginAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD52B50[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArticleSuggestionOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ARTICLE_SUGGESTION_ORIGIN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BACKFILL_ARTICLE_SUGGESTION_ORIGIN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_ARTICLE_SUGGESTION_ORIGIN")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDidExpandDuringView:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 2u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_didExpandDuringView = a3;
}

- (void)setHasDidExpandDuringView:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFFD | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 2;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasDidExpandDuringView
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setSubscribedChannelCtr:(double)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_subscribedChannelCtr = a3;
}

- (void)setHasSubscribedChannelCtr:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasSubscribedChannelCtr
{
  return (*(_QWORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasAlternateHeadline
{
  return self->_alternateHeadline != 0;
}

- (void)setRankInVideoPlaylist:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  self->_rankInVideoPlaylist = a3;
}

- (void)setHasRankInVideoPlaylist:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRankInVideoPlaylist
{
  return (*(_QWORD *)&self->_has >> 53) & 1;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (int)role
{
  if ((*(_QWORD *)&self->_has & 0x40000000000000) != 0)
    return self->_role;
  else
    return 0;
}

- (void)setRole:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRole
{
  return (*(_QWORD *)&self->_has >> 54) & 1;
}

- (id)roleAsString:(int)a3
{
  if (a3 < 9)
    return off_24CD52B68[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRole:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ROLE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_ROLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COVER_ROLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REPLICA_AD_ROLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAMPAIGN_LANDING_PAGE_ROLE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_ROLE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURE_ROLE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ISSUE_ROLE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_DAILY_BRIEFING_ROLE")))
  {
    v4 = 8;
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

- (BOOL)hasIssueViewContextData
{
  return self->_issueViewContextData != 0;
}

- (int)heroArticleType
{
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
    return self->_heroArticleType;
  else
    return 0;
}

- (void)setHeroArticleType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_heroArticleType = a3;
}

- (void)setHasHeroArticleType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *(_QWORD *)&self->_has = *(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasHeroArticleType
{
  return (*(_QWORD *)&self->_has >> 39) & 1;
}

- (id)heroArticleTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD52BB0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsHeroArticleType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_HERO_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_HERO_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_CURATED_HERO_ARTICLE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EDITORIAL_CURATED_HERO_ARTICLE_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasWebEmbedId
{
  return self->_webEmbedId != 0;
}

- (BOOL)hasCuratedBatchId
{
  return self->_curatedBatchId != 0;
}

- (void)setIsAudioEligible:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 8u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isAudioEligible = a3;
}

- (void)setHasIsAudioEligible:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 8;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsAudioEligible
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setIsAudioEngaged:(BOOL)a3
{
  char v3;

  v3 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x10u;
  *((_BYTE *)&self->_has + 10) = v3;
  self->_isAudioEngaged = a3;
}

- (void)setHasIsAudioEngaged:(BOOL)a3
{
  int v3;
  __int16 v4;

  v3 = *((_WORD *)&self->_has + 4) & 0xFFEF | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if (a3)
    v4 = 16;
  else
    v4 = 0;
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v4;
  *((_BYTE *)&self->_has + 10) = BYTE2(v3);
}

- (BOOL)hasIsAudioEngaged
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
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

- (void)clearPurchaseOffersItems
{
  -[NSMutableArray removeAllObjects](self->_purchaseOffersItems, "removeAllObjects");
}

- (void)addPurchaseOffersItem:(id)a3
{
  id v4;
  NSMutableArray *purchaseOffersItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  purchaseOffersItems = self->_purchaseOffersItems;
  v8 = v4;
  if (!purchaseOffersItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_purchaseOffersItems;
    self->_purchaseOffersItems = v6;

    v4 = v8;
    purchaseOffersItems = self->_purchaseOffersItems;
  }
  -[NSMutableArray addObject:](purchaseOffersItems, "addObject:", v4);

}

- (unint64_t)purchaseOffersItemsCount
{
  return -[NSMutableArray count](self->_purchaseOffersItems, "count");
}

- (id)purchaseOffersItemAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_purchaseOffersItems, "objectAtIndex:", a3);
}

+ (Class)purchaseOffersItemType
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
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure;
  -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  uint64_t articleHostViewType;
  __CFString *v6;
  NSString *articleId;
  NSString *referencedArticleId;
  uint64_t has;
  void *v10;
  void *v11;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  uint64_t v14;
  void *v15;
  uint64_t articleViewPresentationReason;
  __CFString *v17;
  NSData *feedViewExposureId;
  uint64_t feedPresentationReason;
  __CFString *v20;
  NSString *feedPresentationReasonSearchString;
  uint64_t v22;
  uint64_t feedCellHostType;
  __CFString *v24;
  uint64_t parentFeedType;
  __CFString *v26;
  NSString *parentFeedId;
  $C23011C766481CAA0C62272794C1DCF4 *p_has;
  int v29;
  void *v30;
  void *v31;
  NSString *sourceBinId;
  void *v33;
  NSString *sourceChannelId;
  NSString *viewFrameInScreen;
  void *v36;
  NSString *language;
  NSMutableArray *namedEntities;
  uint64_t articleType;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  int v52;
  int v53;
  void *v54;
  void *v55;
  NSString *storyType;
  void *v57;
  NSString *userActivityType;
  void *v59;
  NSString *groupFeedId;
  uint64_t v61;
  int v62;
  uint64_t previousArticleHostViewTypeIfSwipe;
  __CFString *v64;
  uint64_t groupType;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  void *v73;
  NSString *notificationId;
  uint64_t nextArticleAffordanceType;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t coverArticleFeatureType;
  __CFString *v85;
  NSString *nextArticleAffordanceTypeFeedId;
  $C23011C766481CAA0C62272794C1DCF4 *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t loadFailureReason;
  __CFString *v93;
  uint64_t paidSubscriberToFeedType;
  __CFString *v95;
  NSString *previousArticleId;
  uint64_t v97;
  void *v98;
  void *v99;
  NSMutableArray *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i;
  void *v105;
  $C23011C766481CAA0C62272794C1DCF4 *v106;
  int v107;
  int v108;
  void *v109;
  uint64_t v110;
  void *v111;
  NSString *nativeCampaignData;
  NSString *previousArticleVersion;
  NSString *anfComponentId;
  void *v115;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement *widgetEngagement;
  void *v117;
  $C23011C766481CAA0C62272794C1DCF4 *v118;
  uint64_t v119;
  uint64_t widgetSection;
  __CFString *v121;
  void *v122;
  void *v123;
  uint64_t topStoryType;
  __CFString *v125;
  void *v126;
  void *v127;
  uint64_t feedSubscriptionOrigin;
  __CFString *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t groupPresentationReason;
  __CFString *v135;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  $C23011C766481CAA0C62272794C1DCF4 *v139;
  uint64_t v140;
  void *v141;
  NSData *moduleExposureId;
  NSString *previousWebEmbedId;
  uint64_t previousWebEmbedLocation;
  __CFString *v145;
  void *v146;
  uint64_t groupFormationReason;
  __CFString *v148;
  void *v149;
  void *v150;
  NSMutableArray *surfacedByTagIds;
  NSString *iadNativeCampaignAd;
  uint64_t v153;
  uint64_t curatedContentType;
  __CFString *v155;
  uint64_t feedAutoSubscribeType;
  __CFString *v157;
  uint64_t groupLocation;
  __CFString *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  uint64_t moduleEventType;
  __CFString *v170;
  NSString *exposedInLocationId;
  NSData *groupViewExposureId;
  NSString *exposedGroupSourceChannelId;
  uint64_t v174;
  uint64_t articleSuggestionOrigin;
  __CFString *v176;
  uint64_t moduleLocation;
  __CFString *v178;
  void *v179;
  void *v180;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline *alternateHeadline;
  void *v182;
  void *v183;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData *issueData;
  void *v185;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData *issueExposureData;
  void *v187;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData *issueViewData;
  void *v189;
  uint64_t role;
  __CFString *v191;
  void *v192;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData *channelData;
  void *v194;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData *issueViewContextData;
  void *v196;
  uint64_t heroArticleType;
  __CFString *v198;
  NSString *webEmbedId;
  NSString *curatedBatchId;
  __int16 v201;
  void *v202;
  void *v203;
  NSMutableArray *topicIds;
  void *v205;
  NSMutableArray *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t j;
  void *v211;
  id v212;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _BYTE v222[128];
  _BYTE v223[128];
  uint64_t v224;

  v224 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
  {
    articleHostViewType = self->_articleHostViewType;
    if (articleHostViewType >= 9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleHostViewType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_24CD52378[articleHostViewType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("article_host_view_type"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("publisher_article_version"));

    has = (uint64_t)self->_has;
  }
  if ((has & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("backend_article_version"));

  }
  articleSessionId = self->_articleSessionId;
  if (articleSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleSessionId, CFSTR("article_session_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  v14 = (uint64_t)self->_has;
  if ((v14 & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_displayRank);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("display_rank"));

    v14 = (uint64_t)self->_has;
  }
  if ((v14 & 0x100000) != 0)
  {
    articleViewPresentationReason = self->_articleViewPresentationReason;
    if (articleViewPresentationReason >= 0x1E)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleViewPresentationReason);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_24CD523C0[articleViewPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("article_view_presentation_reason"));

  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
  {
    feedPresentationReason = self->_feedPresentationReason;
    if (feedPresentationReason >= 0x2C)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedPresentationReason);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_24CD524B0[feedPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("feed_presentation_reason"));

  }
  feedPresentationReasonSearchString = self->_feedPresentationReasonSearchString;
  if (feedPresentationReasonSearchString)
    objc_msgSend(v3, "setObject:forKey:", feedPresentationReasonSearchString, CFSTR("feed_presentation_reason_search_string"));
  v22 = (uint64_t)self->_has;
  if ((v22 & 0x40000000) != 0)
  {
    feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellHostType);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_24CD52610[feedCellHostType];
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("feed_cell_host_type"));

    v22 = (uint64_t)self->_has;
  }
  if ((v22 & 0x2000000000000) != 0)
  {
    parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_24CD52698[parentFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("parent_feed_type"));

  }
  parentFeedId = self->_parentFeedId;
  if (parentFeedId)
    objc_msgSend(v3, "setObject:forKey:", parentFeedId, CFSTR("parent_feed_id"));
  p_has = &self->_has;
  v29 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v29 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToParentFeed);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("is_user_subscribed_to_parent_feed"));

    LOWORD(v29) = *((_WORD *)&self->_has + 4);
  }
  if ((*(_QWORD *)p_has & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_activeTimeSpent);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("active_time_spent"));

    LOWORD(v29) = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)&self->_has & 0x20000000000) == 0)
    {
LABEL_50:
      if ((v29 & 1) == 0)
        goto LABEL_51;
      goto LABEL_74;
    }
  }
  else if ((*(_QWORD *)p_has & 0x20000000000) == 0)
  {
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_maxActiveTimeSpent);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("max_active_time_spent"));

  LOWORD(v29) = *((_WORD *)&self->_has + 4);
  if ((v29 & 1) == 0)
  {
LABEL_51:
    if ((v29 & 0x1000) == 0)
      goto LABEL_52;
    goto LABEL_75;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didBounce);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("did_bounce"));

  LOWORD(v29) = *((_WORD *)&self->_has + 4);
  if ((v29 & 0x1000) == 0)
  {
LABEL_52:
    if ((v29 & 4) == 0)
      goto LABEL_53;
    goto LABEL_76;
  }
LABEL_75:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNewUserToArticle);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("is_new_user_to_article"));

  LOWORD(v29) = *((_WORD *)&self->_has + 4);
  if ((v29 & 4) == 0)
  {
LABEL_53:
    if ((v29 & 0x100) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_76:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didOpenInSafari);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("did_open_in_safari"));

  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_54:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isExplorationArticle);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("is_exploration_article"));

  }
LABEL_55:
  sourceBinId = self->_sourceBinId;
  if (sourceBinId)
    objc_msgSend(v3, "setObject:forKey:", sourceBinId, CFSTR("source_bin_id"));
  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("ad_supported_channel"));

  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  viewFrameInScreen = self->_viewFrameInScreen;
  if (viewFrameInScreen)
    objc_msgSend(v3, "setObject:forKey:", viewFrameInScreen, CFSTR("view_frame_in_screen"));
  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_characterCount);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("character_count"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v3, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
    articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = off_24CD52748[articleType];
    }
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("article_type"));

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
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication)
    objc_msgSend(v3, "setObject:forKey:", referringSourceApplication, CFSTR("referring_source_application"));
  referringUrl = self->_referringUrl;
  if (referringUrl)
    objc_msgSend(v3, "setObject:forKey:", referringUrl, CFSTR("referring_url"));
  v52 = *((unsigned __int16 *)&self->_has + 4);
  v53 = v52 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v52 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDigitalReplicaAd);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("is_digital_replica_ad"));

    v53 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  }
  if ((*(_QWORD *)&self->_has & 0x4000000000000) != 0)
  {
    previousArticleHostViewTypeIfSwipe = self->_previousArticleHostViewTypeIfSwipe;
    if (previousArticleHostViewTypeIfSwipe >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_previousArticleHostViewTypeIfSwipe);
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = off_24CD52778[previousArticleHostViewTypeIfSwipe];
    }
    objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("previous_article_host_view_type_if_swipe"));

    v53 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v53 & 0x100000) == 0)
    {
LABEL_96:
      if ((v53 & 0x40000) == 0)
        goto LABEL_98;
      goto LABEL_97;
    }
  }
  else if ((v53 & 0x100000) == 0)
  {
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVideoInFeed);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("is_video_in_feed"));

  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x40000) != 0)
  {
LABEL_97:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isTopStoryArticle);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("is_top_story_article"));

  }
LABEL_98:
  storyType = self->_storyType;
  if (storyType)
    objc_msgSend(v3, "setObject:forKey:", storyType, CFSTR("story_type"));
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("personalization_treatment_id"));

  }
  userActivityType = self->_userActivityType;
  if (userActivityType)
    objc_msgSend(v3, "setObject:forKey:", userActivityType, CFSTR("user_activity_type"));
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isGroupedArticle);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("is_grouped_article"));

  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v3, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  v61 = (uint64_t)self->_has;
  if ((v61 & 0x4000000000) == 0)
  {
    v62 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v62 & 0x10000) == 0)
      goto LABEL_122;
LABEL_121:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSubscribedToGroupFeed);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("is_subscribed_to_group_feed"));

    v62 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v61 = (uint64_t)self->_has;
    goto LABEL_122;
  }
  groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v66 = off_24CD52790[groupType];
  }
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("group_type"));

  v62 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v61 = (uint64_t)self->_has;
  if ((v62 & 0x10000) != 0)
    goto LABEL_121;
LABEL_122:
  if ((v61 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_articleDisplayRankInGroup);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("article_display_rank_in_group"));

    v62 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v61 = (uint64_t)self->_has;
    if ((v62 & 0x200000) == 0)
    {
LABEL_124:
      if ((v62 & 0x8000) == 0)
        goto LABEL_125;
      goto LABEL_149;
    }
  }
  else if ((v62 & 0x200000) == 0)
  {
    goto LABEL_124;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_subscriptionOnlyArticle);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("subscription_only_article"));

  LOWORD(v62) = *((_WORD *)&self->_has + 4);
  v61 = (uint64_t)self->_has;
  if ((v62 & 0x8000) == 0)
  {
LABEL_125:
    if ((v62 & 0x200) == 0)
      goto LABEL_126;
    goto LABEL_150;
  }
LABEL_149:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSharedSubscriptionOnlyArticle);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("is_shared_subscription_only_article"));

  LOWORD(v62) = *((_WORD *)&self->_has + 4);
  v61 = (uint64_t)self->_has;
  if ((v62 & 0x200) == 0)
  {
LABEL_126:
    if ((v62 & 0x2000) == 0)
      goto LABEL_127;
    goto LABEL_151;
  }
LABEL_150:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFreeArticle);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v80, CFSTR("is_free_article"));

  LOWORD(v62) = *((_WORD *)&self->_has + 4);
  v61 = (uint64_t)self->_has;
  if ((v62 & 0x2000) == 0)
  {
LABEL_127:
    if ((v62 & 0x40) == 0)
      goto LABEL_128;
    goto LABEL_152;
  }
LABEL_151:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToFeed);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("is_paid_subscriber_to_feed"));

  LOWORD(v62) = *((_WORD *)&self->_has + 4);
  v61 = (uint64_t)self->_has;
  if ((v62 & 0x40) == 0)
  {
LABEL_128:
    if ((v61 & 0x2000000) == 0)
      goto LABEL_129;
    goto LABEL_153;
  }
LABEL_152:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCoverArticle);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v82, CFSTR("is_cover_article"));

  LOWORD(v62) = *((_WORD *)&self->_has + 4);
  v61 = (uint64_t)self->_has;
  if ((v61 & 0x2000000) == 0)
  {
LABEL_129:
    if ((v61 & 0x4000000) == 0)
      goto LABEL_130;
    goto LABEL_154;
  }
LABEL_153:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_coverArticleDisplayRank);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("cover_article_display_rank"));

  LOWORD(v62) = *((_WORD *)&self->_has + 4);
  v61 = (uint64_t)self->_has;
  if ((v61 & 0x4000000) == 0)
  {
LABEL_130:
    if ((v61 & 0x1000000000000) == 0)
      goto LABEL_131;
    goto LABEL_172;
  }
LABEL_154:
  coverArticleFeatureType = self->_coverArticleFeatureType;
  if (coverArticleFeatureType >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_coverArticleFeatureType);
    v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v85 = off_24CD528D0[coverArticleFeatureType];
  }
  objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("cover_article_feature_type"));

  LOWORD(v62) = *((_WORD *)&self->_has + 4);
  v61 = (uint64_t)self->_has;
  if ((v61 & 0x1000000000000) == 0)
  {
LABEL_131:
    if ((v62 & 0x4000) == 0)
      goto LABEL_132;
    goto LABEL_229;
  }
LABEL_172:
  paidSubscriberToFeedType = self->_paidSubscriberToFeedType;
  if (paidSubscriberToFeedType >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriberToFeedType);
    v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v95 = off_24CD528F0[paidSubscriberToFeedType];
  }
  objc_msgSend(v3, "setObject:forKey:", v95, CFSTR("paid_subscriber_to_feed_type"));

  v61 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x4000) == 0)
  {
LABEL_132:
    if ((v61 & 0x40000000000) == 0)
      goto LABEL_134;
    goto LABEL_133;
  }
LABEL_229:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberToSourceChannel);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v130, CFSTR("is_paid_subscriber_to_source_channel"));

  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_133:
    *(float *)&v4 = self->_maxVerticalScrollPositionEnding;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("max_vertical_scroll_position_ending"));

  }
LABEL_134:
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x400000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_viewFromNotificationDirectOpen);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("view_from_notification_direct_open"));

  }
  notificationId = self->_notificationId;
  if (notificationId)
    objc_msgSend(v3, "setObject:forKey:", notificationId, CFSTR("notification_id"));
  if ((*(_QWORD *)&self->_has & 0x800000000000) != 0)
  {
    nextArticleAffordanceType = self->_nextArticleAffordanceType;
    if (nextArticleAffordanceType >= 0x10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_nextArticleAffordanceType);
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_24CD52910[nextArticleAffordanceType];
    }
    objc_msgSend(v3, "setObject:forKey:", v76, CFSTR("next_article_affordance_type"));

  }
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if (nextArticleAffordanceTypeFeedId)
    objc_msgSend(v3, "setObject:forKey:", nextArticleAffordanceTypeFeedId, CFSTR("next_article_affordance_type_feed_id"));
  v87 = &self->_has;
  v88 = (uint64_t)self->_has;
  if ((v88 & 0x200000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_groupArticleCountInForYou);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v89, CFSTR("group_article_count_in_for_you"));

    v88 = *(_QWORD *)v87;
    if ((*(_QWORD *)v87 & 0x400000000) == 0)
    {
LABEL_162:
      if ((v88 & 0x4000000000000000) == 0)
        goto LABEL_163;
      goto LABEL_167;
    }
  }
  else if ((v88 & 0x400000000) == 0)
  {
    goto LABEL_162;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_groupDisplayRankInForYou);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("group_display_rank_in_for_you"));

  v88 = (uint64_t)self->_has;
  if ((v88 & 0x4000000000000000) == 0)
  {
LABEL_163:
    if ((v88 & 0x10000000000) == 0)
      goto LABEL_176;
    goto LABEL_168;
  }
LABEL_167:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_articleLoaded);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("article_loaded"));

  if ((*(_QWORD *)&self->_has & 0x10000000000) == 0)
    goto LABEL_176;
LABEL_168:
  loadFailureReason = self->_loadFailureReason;
  if (loadFailureReason >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_loadFailureReason);
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v93 = off_24CD52990[loadFailureReason];
  }
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("load_failure_reason"));

LABEL_176:
  previousArticleId = self->_previousArticleId;
  if (previousArticleId)
    objc_msgSend(v3, "setObject:forKey:", previousArticleId, CFSTR("previous_article_id"));
  v97 = (uint64_t)self->_has;
  if ((v97 & 0x800000000000000) != 0)
  {
    widgetSection = self->_widgetSection;
    if (widgetSection >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetSection);
      v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v121 = off_24CD529B0[widgetSection];
    }
    objc_msgSend(v3, "setObject:forKey:", v121, CFSTR("widget_section"));

    v97 = (uint64_t)self->_has;
    if ((v97 & 0x1000000000000000) == 0)
    {
LABEL_180:
      if ((v97 & 0x400000000000000) == 0)
        goto LABEL_182;
      goto LABEL_181;
    }
  }
  else if ((v97 & 0x1000000000000000) == 0)
  {
    goto LABEL_180;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetSectionArticleRank);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v131, CFSTR("widget_section_article_rank"));

  if ((*(_QWORD *)&self->_has & 0x400000000000000) != 0)
  {
LABEL_181:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleRank);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v98, CFSTR("widget_article_rank"));

  }
LABEL_182:
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v218 = 0u;
    v219 = 0u;
    v220 = 0u;
    v221 = 0u;
    v100 = self->_fractionalCohortMemberships;
    v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v218, v223, 16);
    if (v101)
    {
      v102 = v101;
      v103 = *(_QWORD *)v219;
      do
      {
        for (i = 0; i != v102; ++i)
        {
          if (*(_QWORD *)v219 != v103)
            objc_enumerationMutation(v100);
          objc_msgSend(*(id *)(*((_QWORD *)&v218 + 1) + 8 * i), "dictionaryRepresentation");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addObject:", v105);

        }
        v102 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v100, "countByEnumeratingWithState:objects:count:", &v218, v223, 16);
      }
      while (v102);
    }

    objc_msgSend(v3, "setObject:forKey:", v99, CFSTR("fractional_cohort_membership"));
  }
  v106 = &self->_has;
  v107 = *((unsigned __int16 *)&self->_has + 4);
  v108 = v107 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v107 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBreakingNewsArticle);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v109, CFSTR("is_breaking_news_article"));

    v108 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  }
  v110 = *(_QWORD *)v106;
  if ((*(_QWORD *)v106 & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_breakingNewsArticlePosition);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v122, CFSTR("breaking_news_article_position"));

    v108 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v110 = (uint64_t)self->_has;
    if ((v110 & 0x400000) == 0)
    {
LABEL_195:
      if ((v110 & 0x200000000000000) == 0)
        goto LABEL_196;
      goto LABEL_221;
    }
  }
  else if ((v110 & 0x400000) == 0)
  {
    goto LABEL_195;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_breakingNewsArticleCount);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v123, CFSTR("breaking_news_article_count"));

  v108 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v110 = (uint64_t)self->_has;
  if ((v110 & 0x200000000000000) == 0)
  {
LABEL_196:
    if ((v110 & 0x80000000000000) == 0)
      goto LABEL_197;
    goto LABEL_237;
  }
LABEL_221:
  topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_topStoryType);
    v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v125 = off_24CD529D8[topStoryType];
  }
  objc_msgSend(v3, "setObject:forKey:", v125, CFSTR("top_story_type"));

  v108 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v110 = (uint64_t)self->_has;
  if ((v110 & 0x80000000000000) == 0)
  {
LABEL_197:
    if ((v110 & 0x100000000000000) == 0)
      goto LABEL_198;
    goto LABEL_238;
  }
LABEL_237:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_topStoryMandatoryArticleCount);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v132, CFSTR("top_story_mandatory_article_count"));

  v108 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v110 = (uint64_t)self->_has;
  if ((v110 & 0x100000000000000) == 0)
  {
LABEL_198:
    if ((v110 & 0x2000000000) == 0)
      goto LABEL_199;
    goto LABEL_239;
  }
LABEL_238:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_topStoryOptionalArticleCount);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v133, CFSTR("top_story_optional_article_count"));

  v108 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v110 = (uint64_t)self->_has;
  if ((v110 & 0x2000000000) == 0)
  {
LABEL_199:
    if ((v110 & 0x200) == 0)
      goto LABEL_200;
    goto LABEL_278;
  }
LABEL_239:
  groupPresentationReason = self->_groupPresentationReason;
  if (groupPresentationReason >= 0xB)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupPresentationReason);
    v135 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v135 = off_24CD529F0[groupPresentationReason];
  }
  objc_msgSend(v3, "setObject:forKey:", v135, CFSTR("group_presentation_reason"));

  v108 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*(_QWORD *)&self->_has & 0x200) == 0)
  {
LABEL_200:
    if ((v108 & 0x20000) == 0)
      goto LABEL_201;
    goto LABEL_279;
  }
LABEL_278:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_personalizationScore);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v149, CFSTR("personalization_score"));

  v108 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v108 & 0x20000) == 0)
  {
LABEL_201:
    if ((v108 & 0x800) == 0)
      goto LABEL_203;
    goto LABEL_202;
  }
LABEL_279:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSubscribedToSourceChannel);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v150, CFSTR("is_subscribed_to_source_channel"));

  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
LABEL_202:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNativeAd);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v111, CFSTR("is_native_ad"));

  }
LABEL_203:
  nativeCampaignData = self->_nativeCampaignData;
  if (nativeCampaignData)
    objc_msgSend(v3, "setObject:forKey:", nativeCampaignData, CFSTR("native_campaign_data"));
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion)
    objc_msgSend(v3, "setObject:forKey:", previousArticleVersion, CFSTR("previous_article_version"));
  anfComponentId = self->_anfComponentId;
  if (anfComponentId)
    objc_msgSend(v3, "setObject:forKey:", anfComponentId, CFSTR("anf_component_id"));
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_badgeExposure);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v115, CFSTR("badge_exposure"));

  }
  widgetEngagement = self->_widgetEngagement;
  if (widgetEngagement)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement dictionaryRepresentation](widgetEngagement, "dictionaryRepresentation");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v117, CFSTR("widget_engagement"));

  }
  v118 = &self->_has;
  v119 = (uint64_t)self->_has;
  if ((v119 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v126, CFSTR("publisher_article_version_int64"));

    v119 = *(_QWORD *)v118;
    if ((*(_QWORD *)v118 & 8) == 0)
    {
LABEL_215:
      if ((v119 & 0x100000000) == 0)
        goto LABEL_243;
      goto LABEL_225;
    }
  }
  else if ((v119 & 8) == 0)
  {
    goto LABEL_215;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v127, CFSTR("backend_article_version_int64"));

  if ((*(_QWORD *)&self->_has & 0x100000000) == 0)
    goto LABEL_243;
LABEL_225:
  feedSubscriptionOrigin = self->_feedSubscriptionOrigin;
  if (feedSubscriptionOrigin >= 0xA)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedSubscriptionOrigin);
    v129 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v129 = off_24CD52A48[feedSubscriptionOrigin];
  }
  objc_msgSend(v3, "setObject:forKey:", v129, CFSTR("feed_subscription_origin"));

LABEL_243:
  iadNativeCampaign = self->_iadNativeCampaign;
  if (iadNativeCampaign)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaign, CFSTR("iad_native_campaign"));
  iadNativeLine = self->_iadNativeLine;
  if (iadNativeLine)
    objc_msgSend(v3, "setObject:forKey:", iadNativeLine, CFSTR("iad_native_line"));
  iadNativeAd = self->_iadNativeAd;
  if (iadNativeAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeAd, CFSTR("iad_native_ad"));
  v139 = &self->_has;
  v140 = (uint64_t)self->_has;
  if ((v140 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v146, CFSTR("previous_article_publisher_article_version"));

    v140 = *(_QWORD *)v139;
    if ((*(_QWORD *)v139 & 0x800000000) == 0)
    {
LABEL_251:
      if ((v140 & 0x20000000) == 0)
        goto LABEL_252;
      goto LABEL_292;
    }
  }
  else if ((v140 & 0x800000000) == 0)
  {
    goto LABEL_251;
  }
  groupFormationReason = self->_groupFormationReason;
  if (groupFormationReason >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupFormationReason);
    v148 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v148 = off_24CD52A98[groupFormationReason];
  }
  objc_msgSend(v3, "setObject:forKey:", v148, CFSTR("group_formation_reason"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x20000000) == 0)
  {
LABEL_252:
    if ((v140 & 0x40) == 0)
      goto LABEL_253;
    goto LABEL_301;
  }
LABEL_292:
  feedAutoSubscribeType = self->_feedAutoSubscribeType;
  if (feedAutoSubscribeType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedAutoSubscribeType);
    v157 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v157 = off_24CD52AB8[feedAutoSubscribeType];
  }
  objc_msgSend(v3, "setObject:forKey:", v157, CFSTR("feed_auto_subscribe_type"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x40) == 0)
  {
LABEL_253:
    if ((v140 & 0x100) == 0)
      goto LABEL_254;
    goto LABEL_302;
  }
LABEL_301:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_featureCtr);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v160, CFSTR("feature_ctr"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x100) == 0)
  {
LABEL_254:
    if ((v140 & 4) == 0)
      goto LABEL_255;
    goto LABEL_303;
  }
LABEL_302:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_paidNonpaidSubscriptionCtr);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v161, CFSTR("paid_nonpaid_subscription_ctr"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 4) == 0)
  {
LABEL_255:
    if ((v140 & 0x10) == 0)
      goto LABEL_256;
    goto LABEL_304;
  }
LABEL_303:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_autoSubscribeCtr);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v162, CFSTR("auto_subscribe_ctr"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x10) == 0)
  {
LABEL_256:
    if ((v140 & 0x80) == 0)
      goto LABEL_257;
    goto LABEL_305;
  }
LABEL_304:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_computedGlobalScoreCoefficient);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v163, CFSTR("computed_global_score_coefficient"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x80) == 0)
  {
LABEL_257:
    if ((v140 & 0x4000) == 0)
      goto LABEL_258;
    goto LABEL_306;
  }
LABEL_305:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_globalScore);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v164, CFSTR("global_score"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x4000) == 0)
  {
LABEL_258:
    if ((v140 & 2) == 0)
      goto LABEL_259;
    goto LABEL_307;
  }
LABEL_306:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_userFeedbackScore);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v165, CFSTR("user_feedback_score"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 2) == 0)
  {
LABEL_259:
    if ((v140 & 1) == 0)
      goto LABEL_260;
    goto LABEL_308;
  }
LABEL_307:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_agedUserFeedbackScore);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v166, CFSTR("aged_user_feedback_score"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 1) == 0)
  {
LABEL_260:
    if ((v140 & 0x20) == 0)
      goto LABEL_261;
    goto LABEL_309;
  }
LABEL_308:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_agedPersonalizationScore);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v167, CFSTR("aged_personalization_score"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x20) == 0)
  {
LABEL_261:
    if ((v140 & 0x80000000000) == 0)
      goto LABEL_262;
    goto LABEL_310;
  }
LABEL_309:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_diversifiedPersonalizationScore);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v168, CFSTR("diversified_personalization_score"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x80000000000) == 0)
  {
LABEL_262:
    if ((v140 & 0x400000000000) == 0)
      goto LABEL_263;
    goto LABEL_327;
  }
LABEL_310:
  moduleEventType = self->_moduleEventType;
  if (moduleEventType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_moduleEventType);
    v170 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v170 = off_24CD52AD0[moduleEventType];
  }
  objc_msgSend(v3, "setObject:forKey:", v170, CFSTR("module_event_type"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x400000000000) == 0)
  {
LABEL_263:
    if ((v140 & 0x100000000000) == 0)
      goto LABEL_264;
    goto LABEL_349;
  }
LABEL_327:
  moduleLocation = self->_moduleLocation;
  if (moduleLocation >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_moduleLocation);
    v178 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v178 = off_24CD52AE8[moduleLocation];
  }
  objc_msgSend(v3, "setObject:forKey:", v178, CFSTR("module_location"));

  v140 = (uint64_t)self->_has;
  if ((v140 & 0x100000000000) == 0)
  {
LABEL_264:
    if ((v140 & 0x200000000000) == 0)
      goto LABEL_266;
    goto LABEL_265;
  }
LABEL_349:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_moduleItemCount);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v192, CFSTR("module_item_count"));

  if ((*(_QWORD *)&self->_has & 0x200000000000) != 0)
  {
LABEL_265:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_moduleItemPosition);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v141, CFSTR("module_item_position"));

  }
LABEL_266:
  moduleExposureId = self->_moduleExposureId;
  if (moduleExposureId)
    objc_msgSend(v3, "setObject:forKey:", moduleExposureId, CFSTR("module_exposure_id"));
  previousWebEmbedId = self->_previousWebEmbedId;
  if (previousWebEmbedId)
    objc_msgSend(v3, "setObject:forKey:", previousWebEmbedId, CFSTR("previous_web_embed_id"));
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
  {
    previousWebEmbedLocation = self->_previousWebEmbedLocation;
    if (previousWebEmbedLocation >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_previousWebEmbedLocation);
      v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v145 = off_24CD52B00[previousWebEmbedLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v145, CFSTR("previous_web_embed_location"));

  }
  surfacedByTagIds = self->_surfacedByTagIds;
  if (surfacedByTagIds)
    objc_msgSend(v3, "setObject:forKey:", surfacedByTagIds, CFSTR("surfaced_by_tag_ids"));
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaignAd, CFSTR("iad_native_campaign_ad"));
  v153 = (uint64_t)self->_has;
  if ((v153 & 0x8000000) != 0)
  {
    curatedContentType = self->_curatedContentType;
    if (curatedContentType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_curatedContentType);
      v155 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v155 = off_24CD52B18[curatedContentType];
    }
    objc_msgSend(v3, "setObject:forKey:", v155, CFSTR("curated_content_type"));

    v153 = (uint64_t)self->_has;
  }
  if ((v153 & 0x1000000000) != 0)
  {
    groupLocation = self->_groupLocation;
    if (groupLocation >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupLocation);
      v159 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v159 = off_24CD52B30[groupLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v159, CFSTR("group_location"));

  }
  exposedInLocationId = self->_exposedInLocationId;
  if (exposedInLocationId)
    objc_msgSend(v3, "setObject:forKey:", exposedInLocationId, CFSTR("exposed_in_location_id"));
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  exposedGroupSourceChannelId = self->_exposedGroupSourceChannelId;
  if (exposedGroupSourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", exposedGroupSourceChannelId, CFSTR("exposed_group_source_channel_id"));
  v174 = (uint64_t)self->_has;
  if ((v174 & 0x40000) == 0)
  {
    if ((*((_WORD *)&self->_has + 4) & 2) == 0)
      goto LABEL_332;
LABEL_331:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didExpandDuringView);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v179, CFSTR("did_expand_during_view"));

    v174 = (uint64_t)self->_has;
    goto LABEL_332;
  }
  articleSuggestionOrigin = self->_articleSuggestionOrigin;
  if (articleSuggestionOrigin >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleSuggestionOrigin);
    v176 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v176 = off_24CD52B50[articleSuggestionOrigin];
  }
  objc_msgSend(v3, "setObject:forKey:", v176, CFSTR("article_suggestion_origin"));

  v174 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) != 0)
    goto LABEL_331;
LABEL_332:
  if ((v174 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_subscribedChannelCtr);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v180, CFSTR("subscribed_channel_ctr"));

  }
  alternateHeadline = self->_alternateHeadline;
  if (alternateHeadline)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline dictionaryRepresentation](alternateHeadline, "dictionaryRepresentation");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v182, CFSTR("alternate_headline"));

  }
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rankInVideoPlaylist);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v183, CFSTR("rank_in_video_playlist"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v185, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v187, CFSTR("issue_exposure_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v189, CFSTR("issue_view_data"));

  }
  if ((*(_QWORD *)&self->_has & 0x40000000000000) != 0)
  {
    role = self->_role;
    if (role >= 9)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_role);
      v191 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v191 = off_24CD52B68[role];
    }
    objc_msgSend(v3, "setObject:forKey:", v191, CFSTR("role"));

  }
  channelData = self->_channelData;
  if (channelData)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData dictionaryRepresentation](channelData, "dictionaryRepresentation");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v194, CFSTR("channel_data"));

  }
  issueViewContextData = self->_issueViewContextData;
  if (issueViewContextData)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData dictionaryRepresentation](issueViewContextData, "dictionaryRepresentation");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v196, CFSTR("issue_view_context_data"));

  }
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
    heroArticleType = self->_heroArticleType;
    if (heroArticleType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_heroArticleType);
      v198 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v198 = off_24CD52BB0[heroArticleType];
    }
    objc_msgSend(v3, "setObject:forKey:", v198, CFSTR("hero_article_type"));

  }
  webEmbedId = self->_webEmbedId;
  if (webEmbedId)
    objc_msgSend(v3, "setObject:forKey:", webEmbedId, CFSTR("web_embed_id"));
  curatedBatchId = self->_curatedBatchId;
  if (curatedBatchId)
    objc_msgSend(v3, "setObject:forKey:", curatedBatchId, CFSTR("curated_batch_id"));
  LOBYTE(v201) = *((_WORD *)&self->_has + 4);
  if ((*((_WORD *)&self->_has + 4) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAudioEligible);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v202, CFSTR("is_audio_eligible"));

    v201 = *((_WORD *)&self->_has + 4);
  }
  if ((v201 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAudioEngaged);
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v203, CFSTR("is_audio_engaged"));

  }
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v3, "setObject:forKey:", topicIds, CFSTR("topic_ids"));
  if (-[NSMutableArray count](self->_purchaseOffersItems, "count"))
  {
    v205 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_purchaseOffersItems, "count"));
    v214 = 0u;
    v215 = 0u;
    v216 = 0u;
    v217 = 0u;
    v206 = self->_purchaseOffersItems;
    v207 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v206, "countByEnumeratingWithState:objects:count:", &v214, v222, 16);
    if (v207)
    {
      v208 = v207;
      v209 = *(_QWORD *)v215;
      do
      {
        for (j = 0; j != v208; ++j)
        {
          if (*(_QWORD *)v215 != v209)
            objc_enumerationMutation(v206);
          objc_msgSend(*(id *)(*((_QWORD *)&v214 + 1) + 8 * j), "dictionaryRepresentation");
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "addObject:", v211);

        }
        v208 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v206, "countByEnumeratingWithState:objects:count:", &v214, v222, 16);
      }
      while (v208);
    }

    objc_msgSend(v3, "setObject:forKey:", v205, CFSTR("purchase_offers_item"));
  }
  v212 = v3;

  return v212;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  uint64_t has;
  uint64_t v6;
  uint64_t v7;
  $C23011C766481CAA0C62272794C1DCF4 *p_has;
  int v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  $C23011C766481CAA0C62272794C1DCF4 *v19;
  uint64_t v20;
  $C23011C766481CAA0C62272794C1DCF4 *v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  $C23011C766481CAA0C62272794C1DCF4 *v28;
  int v29;
  int v30;
  uint64_t v31;
  $C23011C766481CAA0C62272794C1DCF4 *v32;
  uint64_t v33;
  $C23011C766481CAA0C62272794C1DCF4 *v34;
  uint64_t v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  uint64_t v42;
  __int16 v43;
  NSMutableArray *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_referencedArticleId)
    PBDataWriterWriteStringField();
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (uint64_t)self->_has;
  }
  if ((has & 0x200000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleSessionId)
    PBDataWriterWriteDataField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  v6 = (uint64_t)self->_has;
  if ((v6 & 0x10000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = (uint64_t)self->_has;
  }
  if ((v6 & 0x100000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedPresentationReasonSearchString)
    PBDataWriterWriteStringField();
  v7 = (uint64_t)self->_has;
  if ((v7 & 0x40000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v7 = (uint64_t)self->_has;
  }
  if ((v7 & 0x2000000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_parentFeedId)
    PBDataWriterWriteStringField();
  p_has = &self->_has;
  v9 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v9 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    LOWORD(v9) = *((_WORD *)&self->_has + 4);
  }
  if ((*(_QWORD *)p_has & 0x8000) != 0)
  {
    PBDataWriterWriteInt32Field();
    LOWORD(v9) = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)&self->_has & 0x20000000000) == 0)
    {
LABEL_35:
      if ((v9 & 1) == 0)
        goto LABEL_36;
      goto LABEL_94;
    }
  }
  else if ((*(_QWORD *)p_has & 0x20000000000) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteInt32Field();
  LOWORD(v9) = *((_WORD *)&self->_has + 4);
  if ((v9 & 1) == 0)
  {
LABEL_36:
    if ((v9 & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteBOOLField();
  LOWORD(v9) = *((_WORD *)&self->_has + 4);
  if ((v9 & 0x1000) == 0)
  {
LABEL_37:
    if ((v9 & 4) == 0)
      goto LABEL_38;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteBOOLField();
  LOWORD(v9) = *((_WORD *)&self->_has + 4);
  if ((v9 & 4) == 0)
  {
LABEL_38:
    if ((v9 & 0x100) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_96:
  PBDataWriterWriteBOOLField();
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
LABEL_39:
    PBDataWriterWriteBOOLField();
LABEL_40:
  if (self->_sourceBinId)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if (self->_viewFrameInScreen)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_language)
    PBDataWriterWriteStringField();
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = self->_namedEntities;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v71 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    }
    while (v12);
  }

  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  if (self->_referringSourceApplication)
    PBDataWriterWriteStringField();
  if (self->_referringUrl)
    PBDataWriterWriteStringField();
  v15 = *((unsigned __int16 *)&self->_has + 4);
  v16 = v15 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v15 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  }
  if ((*(_QWORD *)&self->_has & 0x4000000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v16 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v16 & 0x100000) == 0)
    {
LABEL_77:
      if ((v16 & 0x40000) == 0)
        goto LABEL_79;
      goto LABEL_78;
    }
  }
  else if ((v16 & 0x100000) == 0)
  {
    goto LABEL_77;
  }
  PBDataWriterWriteBOOLField();
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x40000) != 0)
LABEL_78:
    PBDataWriterWriteBOOLField();
LABEL_79:
  if (self->_storyType)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_userActivityType)
    PBDataWriterWriteStringField();
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x4000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v17 = (uint64_t)self->_has;
    if ((v18 & 0x10000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
  v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v18 & 0x10000) != 0)
  {
LABEL_102:
    PBDataWriterWriteBOOLField();
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v17 = (uint64_t)self->_has;
  }
LABEL_103:
  if ((v17 & 0x10000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v17 = (uint64_t)self->_has;
    if ((v18 & 0x200000) == 0)
    {
LABEL_105:
      if ((v18 & 0x8000) == 0)
        goto LABEL_106;
      goto LABEL_226;
    }
  }
  else if ((v18 & 0x200000) == 0)
  {
    goto LABEL_105;
  }
  PBDataWriterWriteBOOLField();
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v18 & 0x8000) == 0)
  {
LABEL_106:
    if ((v18 & 0x200) == 0)
      goto LABEL_107;
    goto LABEL_227;
  }
LABEL_226:
  PBDataWriterWriteBOOLField();
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v18 & 0x200) == 0)
  {
LABEL_107:
    if ((v18 & 0x2000) == 0)
      goto LABEL_108;
    goto LABEL_228;
  }
LABEL_227:
  PBDataWriterWriteBOOLField();
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v18 & 0x2000) == 0)
  {
LABEL_108:
    if ((v18 & 0x40) == 0)
      goto LABEL_109;
    goto LABEL_229;
  }
LABEL_228:
  PBDataWriterWriteBOOLField();
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v18 & 0x40) == 0)
  {
LABEL_109:
    if ((v17 & 0x2000000) == 0)
      goto LABEL_110;
    goto LABEL_230;
  }
LABEL_229:
  PBDataWriterWriteBOOLField();
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x2000000) == 0)
  {
LABEL_110:
    if ((v17 & 0x4000000) == 0)
      goto LABEL_111;
    goto LABEL_231;
  }
LABEL_230:
  PBDataWriterWriteInt32Field();
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x4000000) == 0)
  {
LABEL_111:
    if ((v17 & 0x1000000000000) == 0)
      goto LABEL_112;
    goto LABEL_232;
  }
LABEL_231:
  PBDataWriterWriteInt32Field();
  LOWORD(v18) = *((_WORD *)&self->_has + 4);
  v17 = (uint64_t)self->_has;
  if ((v17 & 0x1000000000000) == 0)
  {
LABEL_112:
    if ((v18 & 0x4000) == 0)
      goto LABEL_113;
    goto LABEL_233;
  }
LABEL_232:
  PBDataWriterWriteInt32Field();
  v17 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x4000) == 0)
  {
LABEL_113:
    if ((v17 & 0x40000000000) == 0)
      goto LABEL_115;
    goto LABEL_114;
  }
LABEL_233:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
LABEL_114:
    PBDataWriterWriteFloatField();
LABEL_115:
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x400000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_notificationId)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x800000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_nextArticleAffordanceTypeFeedId)
    PBDataWriterWriteStringField();
  v19 = &self->_has;
  v20 = (uint64_t)self->_has;
  if ((v20 & 0x200000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v20 = *(_QWORD *)v19;
    if ((*(_QWORD *)v19 & 0x400000000) == 0)
    {
LABEL_131:
      if ((v20 & 0x4000000000000000) == 0)
        goto LABEL_132;
      goto LABEL_237;
    }
  }
  else if ((v20 & 0x400000000) == 0)
  {
    goto LABEL_131;
  }
  PBDataWriterWriteInt32Field();
  v20 = (uint64_t)self->_has;
  if ((v20 & 0x4000000000000000) == 0)
  {
LABEL_132:
    if ((v20 & 0x10000000000) == 0)
      goto LABEL_134;
    goto LABEL_133;
  }
LABEL_237:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
LABEL_133:
    PBDataWriterWriteInt32Field();
LABEL_134:
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  v21 = &self->_has;
  v22 = (uint64_t)self->_has;
  if ((v22 & 0x800000000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v22 = *(_QWORD *)v21;
    if ((*(_QWORD *)v21 & 0x1000000000000000) == 0)
    {
LABEL_138:
      if ((v22 & 0x400000000000000) == 0)
        goto LABEL_140;
      goto LABEL_139;
    }
  }
  else if ((v22 & 0x1000000000000000) == 0)
  {
    goto LABEL_138;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x400000000000000) != 0)
LABEL_139:
    PBDataWriterWriteInt32Field();
LABEL_140:
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v23 = self->_fractionalCohortMemberships;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v67 != v26)
          objc_enumerationMutation(v23);
        PBDataWriterWriteSubmessage();
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    }
    while (v25);
  }

  v28 = &self->_has;
  v29 = *((unsigned __int16 *)&self->_has + 4);
  v30 = v29 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v29 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v30 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  }
  v31 = *(_QWORD *)v28;
  if ((*(_QWORD *)v28 & 0x800000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v30 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v31 = (uint64_t)self->_has;
    if ((v31 & 0x400000) == 0)
    {
LABEL_151:
      if ((v31 & 0x200000000000000) == 0)
        goto LABEL_152;
      goto LABEL_244;
    }
  }
  else if ((v31 & 0x400000) == 0)
  {
    goto LABEL_151;
  }
  PBDataWriterWriteInt32Field();
  v30 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v31 = (uint64_t)self->_has;
  if ((v31 & 0x200000000000000) == 0)
  {
LABEL_152:
    if ((v31 & 0x80000000000000) == 0)
      goto LABEL_153;
    goto LABEL_245;
  }
LABEL_244:
  PBDataWriterWriteInt32Field();
  v30 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v31 = (uint64_t)self->_has;
  if ((v31 & 0x80000000000000) == 0)
  {
LABEL_153:
    if ((v31 & 0x100000000000000) == 0)
      goto LABEL_154;
    goto LABEL_246;
  }
LABEL_245:
  PBDataWriterWriteInt32Field();
  v30 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v31 = (uint64_t)self->_has;
  if ((v31 & 0x100000000000000) == 0)
  {
LABEL_154:
    if ((v31 & 0x2000000000) == 0)
      goto LABEL_155;
    goto LABEL_247;
  }
LABEL_246:
  PBDataWriterWriteInt32Field();
  v30 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v31 = (uint64_t)self->_has;
  if ((v31 & 0x2000000000) == 0)
  {
LABEL_155:
    if ((v31 & 0x200) == 0)
      goto LABEL_156;
    goto LABEL_248;
  }
LABEL_247:
  PBDataWriterWriteInt32Field();
  v30 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*(_QWORD *)&self->_has & 0x200) == 0)
  {
LABEL_156:
    if ((v30 & 0x20000) == 0)
      goto LABEL_157;
    goto LABEL_249;
  }
LABEL_248:
  PBDataWriterWriteDoubleField();
  v30 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v30 & 0x20000) == 0)
  {
LABEL_157:
    if ((v30 & 0x800) == 0)
      goto LABEL_159;
    goto LABEL_158;
  }
LABEL_249:
  PBDataWriterWriteBOOLField();
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
LABEL_158:
    PBDataWriterWriteBOOLField();
LABEL_159:
  if (self->_nativeCampaignData)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  if (self->_anfComponentId)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_widgetEngagement)
    PBDataWriterWriteSubmessage();
  v32 = &self->_has;
  v33 = (uint64_t)self->_has;
  if ((v33 & 0x1000) != 0)
  {
    PBDataWriterWriteInt64Field();
    v33 = *(_QWORD *)v32;
    if ((*(_QWORD *)v32 & 8) == 0)
    {
LABEL_171:
      if ((v33 & 0x100000000) == 0)
        goto LABEL_173;
      goto LABEL_172;
    }
  }
  else if ((v33 & 8) == 0)
  {
    goto LABEL_171;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_QWORD *)&self->_has & 0x100000000) != 0)
LABEL_172:
    PBDataWriterWriteInt32Field();
LABEL_173:
  if (self->_iadNativeCampaign)
    PBDataWriterWriteStringField();
  if (self->_iadNativeLine)
    PBDataWriterWriteStringField();
  if (self->_iadNativeAd)
    PBDataWriterWriteStringField();
  v34 = &self->_has;
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x800) != 0)
  {
    PBDataWriterWriteInt64Field();
    v35 = *(_QWORD *)v34;
    if ((*(_QWORD *)v34 & 0x800000000) == 0)
    {
LABEL_181:
      if ((v35 & 0x20000000) == 0)
        goto LABEL_182;
      goto LABEL_256;
    }
  }
  else if ((v35 & 0x800000000) == 0)
  {
    goto LABEL_181;
  }
  PBDataWriterWriteInt32Field();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x20000000) == 0)
  {
LABEL_182:
    if ((v35 & 0x40) == 0)
      goto LABEL_183;
    goto LABEL_257;
  }
LABEL_256:
  PBDataWriterWriteInt32Field();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x40) == 0)
  {
LABEL_183:
    if ((v35 & 0x100) == 0)
      goto LABEL_184;
    goto LABEL_258;
  }
LABEL_257:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x100) == 0)
  {
LABEL_184:
    if ((v35 & 4) == 0)
      goto LABEL_185;
    goto LABEL_259;
  }
LABEL_258:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 4) == 0)
  {
LABEL_185:
    if ((v35 & 0x10) == 0)
      goto LABEL_186;
    goto LABEL_260;
  }
LABEL_259:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x10) == 0)
  {
LABEL_186:
    if ((v35 & 0x80) == 0)
      goto LABEL_187;
    goto LABEL_261;
  }
LABEL_260:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x80) == 0)
  {
LABEL_187:
    if ((v35 & 0x4000) == 0)
      goto LABEL_188;
    goto LABEL_262;
  }
LABEL_261:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x4000) == 0)
  {
LABEL_188:
    if ((v35 & 2) == 0)
      goto LABEL_189;
    goto LABEL_263;
  }
LABEL_262:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 2) == 0)
  {
LABEL_189:
    if ((v35 & 1) == 0)
      goto LABEL_190;
    goto LABEL_264;
  }
LABEL_263:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 1) == 0)
  {
LABEL_190:
    if ((v35 & 0x20) == 0)
      goto LABEL_191;
    goto LABEL_265;
  }
LABEL_264:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x20) == 0)
  {
LABEL_191:
    if ((v35 & 0x80000000000) == 0)
      goto LABEL_192;
    goto LABEL_266;
  }
LABEL_265:
  PBDataWriterWriteDoubleField();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x80000000000) == 0)
  {
LABEL_192:
    if ((v35 & 0x400000000000) == 0)
      goto LABEL_193;
    goto LABEL_267;
  }
LABEL_266:
  PBDataWriterWriteInt32Field();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x400000000000) == 0)
  {
LABEL_193:
    if ((v35 & 0x100000000000) == 0)
      goto LABEL_194;
    goto LABEL_268;
  }
LABEL_267:
  PBDataWriterWriteInt32Field();
  v35 = (uint64_t)self->_has;
  if ((v35 & 0x100000000000) == 0)
  {
LABEL_194:
    if ((v35 & 0x200000000000) == 0)
      goto LABEL_196;
    goto LABEL_195;
  }
LABEL_268:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x200000000000) != 0)
LABEL_195:
    PBDataWriterWriteInt32Field();
LABEL_196:
  if (self->_moduleExposureId)
    PBDataWriterWriteDataField();
  if (self->_previousWebEmbedId)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
    PBDataWriterWriteInt32Field();
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v36 = self->_surfacedByTagIds;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v63;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v63 != v39)
          objc_enumerationMutation(v36);
        PBDataWriterWriteStringField();
      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    }
    while (v38);
  }

  if (self->_iadNativeCampaignAd)
    PBDataWriterWriteStringField();
  v41 = (uint64_t)self->_has;
  if ((v41 & 0x8000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v41 = (uint64_t)self->_has;
  }
  if ((v41 & 0x1000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_exposedInLocationId)
    PBDataWriterWriteStringField();
  if (self->_groupViewExposureId)
    PBDataWriterWriteDataField();
  if (self->_exposedGroupSourceChannelId)
    PBDataWriterWriteStringField();
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v42 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 2) == 0)
      goto LABEL_272;
    goto LABEL_271;
  }
  if ((*((_WORD *)&self->_has + 4) & 2) != 0)
  {
LABEL_271:
    PBDataWriterWriteBOOLField();
    v42 = (uint64_t)self->_has;
  }
LABEL_272:
  if ((v42 & 0x2000) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_alternateHeadline)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueExposureData)
    PBDataWriterWriteSubmessage();
  if (self->_issueViewData)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_has & 0x40000000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_channelData)
    PBDataWriterWriteSubmessage();
  if (self->_issueViewContextData)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_webEmbedId)
    PBDataWriterWriteStringField();
  if (self->_curatedBatchId)
    PBDataWriterWriteStringField();
  LOBYTE(v43) = *((_WORD *)&self->_has + 4);
  if ((*((_WORD *)&self->_has + 4) & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v43 = *((_WORD *)&self->_has + 4);
  }
  if ((v43 & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v44 = self->_topicIds;
  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v59;
    do
    {
      for (m = 0; m != v46; ++m)
      {
        if (*(_QWORD *)v59 != v47)
          objc_enumerationMutation(v44);
        PBDataWriterWriteStringField();
      }
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    }
    while (v46);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v49 = self->_purchaseOffersItems;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v55;
    do
    {
      for (n = 0; n != v51; ++n)
      {
        if (*(_QWORD *)v55 != v52)
          objc_enumerationMutation(v49);
        PBDataWriterWriteSubmessage();
      }
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
    }
    while (v51);
  }

}

- (void)copyTo:(id)a3
{
  char *v4;
  uint64_t has;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  char *v16;
  int v17;
  int v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  char v23;
  char v24;
  char v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  $C23011C766481CAA0C62272794C1DCF4 *p_has;
  uint64_t v32;
  $C23011C766481CAA0C62272794C1DCF4 *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t j;
  void *v38;
  $C23011C766481CAA0C62272794C1DCF4 *v39;
  int v40;
  int v41;
  uint64_t v42;
  char *v43;
  unsigned int v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  $C23011C766481CAA0C62272794C1DCF4 *v51;
  uint64_t v52;
  $C23011C766481CAA0C62272794C1DCF4 *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t k;
  void *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  char v64;
  char v65;
  char v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t m;
  void *v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t n;
  void *v74;
  char *v75;

  v4 = (char *)a3;
  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
  {
    *((_DWORD *)v4 + 39) = self->_articleHostViewType;
    *(_QWORD *)(v4 + 812) |= 0x20000uLL;
  }
  v75 = v4;
  if (self->_articleId)
  {
    objc_msgSend(v4, "setArticleId:");
    v4 = v75;
  }
  if (self->_referencedArticleId)
  {
    objc_msgSend(v75, "setReferencedArticleId:");
    v4 = v75;
  }
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) != 0)
  {
    *((_DWORD *)v4 + 149) = self->_publisherArticleVersion;
    *(_QWORD *)(v4 + 812) |= 0x10000000000000uLL;
    has = (uint64_t)self->_has;
  }
  if ((has & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 50) = self->_backendArticleVersion;
    *(_QWORD *)(v4 + 812) |= 0x200000uLL;
  }
  if (self->_articleSessionId)
  {
    objc_msgSend(v75, "setArticleSessionId:");
    v4 = v75;
  }
  if (self->_articleViewingSessionId)
  {
    objc_msgSend(v75, "setArticleViewingSessionId:");
    v4 = v75;
  }
  v6 = (uint64_t)self->_has;
  if ((v6 & 0x10000000) != 0)
  {
    *((_DWORD *)v4 + 69) = self->_displayRank;
    *(_QWORD *)(v4 + 812) |= 0x10000000uLL;
    v6 = (uint64_t)self->_has;
  }
  if ((v6 & 0x100000) != 0)
  {
    *((_DWORD *)v4 + 46) = self->_articleViewPresentationReason;
    *(_QWORD *)(v4 + 812) |= 0x100000uLL;
  }
  if (self->_feedViewExposureId)
  {
    objc_msgSend(v75, "setFeedViewExposureId:");
    v4 = v75;
  }
  if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)v4 + 76) = self->_feedPresentationReason;
    *(_QWORD *)(v4 + 812) |= 0x80000000uLL;
  }
  if (self->_feedPresentationReasonSearchString)
  {
    objc_msgSend(v75, "setFeedPresentationReasonSearchString:");
    v4 = v75;
  }
  v7 = (uint64_t)self->_has;
  if ((v7 & 0x40000000) != 0)
  {
    *((_DWORD *)v4 + 75) = self->_feedCellHostType;
    *(_QWORD *)(v4 + 812) |= 0x40000000uLL;
    v7 = (uint64_t)self->_has;
  }
  if ((v7 & 0x2000000000000) != 0)
  {
    *((_DWORD *)v4 + 140) = self->_parentFeedType;
    *(_QWORD *)(v4 + 812) |= 0x2000000000000uLL;
  }
  if (self->_parentFeedId)
  {
    objc_msgSend(v75, "setParentFeedId:");
    v4 = v75;
  }
  v8 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v8 & 0x80000) != 0)
  {
    v4[806] = self->_isUserSubscribedToParentFeed;
    v9 = *((unsigned __int16 *)v4 + 410);
    v10 = (v9 | (v4[822] << 16) | 0x80000u) >> 16;
    *((_WORD *)v4 + 410) = v9;
    v4[822] = v10;
    LOWORD(v8) = *((_WORD *)&self->_has + 4);
  }
  v11 = (uint64_t)self->_has;
  if ((v11 & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_activeTimeSpent;
    *(_QWORD *)(v4 + 812) |= 0x8000uLL;
    LOWORD(v8) = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)&self->_has & 0x20000000000) == 0)
    {
LABEL_35:
      if ((v8 & 1) == 0)
        goto LABEL_36;
      goto LABEL_91;
    }
  }
  else if ((v11 & 0x20000000000) == 0)
  {
    goto LABEL_35;
  }
  *((_DWORD *)v4 + 117) = self->_maxActiveTimeSpent;
  *(_QWORD *)(v4 + 812) |= 0x20000000000uLL;
  LOWORD(v8) = *((_WORD *)&self->_has + 4);
  if ((v8 & 1) == 0)
  {
LABEL_36:
    if ((v8 & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_92;
  }
LABEL_91:
  v4[787] = self->_didBounce;
  v23 = v4[822];
  *((_WORD *)v4 + 410) |= 1u;
  v4[822] = v23;
  LOWORD(v8) = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x1000) == 0)
  {
LABEL_37:
    if ((v8 & 4) == 0)
      goto LABEL_38;
    goto LABEL_93;
  }
LABEL_92:
  v4[799] = self->_isNewUserToArticle;
  v24 = v4[822];
  *((_WORD *)v4 + 410) |= 0x1000u;
  v4[822] = v24;
  LOWORD(v8) = *((_WORD *)&self->_has + 4);
  if ((v8 & 4) == 0)
  {
LABEL_38:
    if ((v8 & 0x100) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_93:
  v4[789] = self->_didOpenInSafari;
  v25 = v4[822];
  *((_WORD *)v4 + 410) |= 4u;
  v4[822] = v25;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_39:
    v4[795] = self->_isExplorationArticle;
    *((_WORD *)v4 + 410) |= 0x100u;
  }
LABEL_40:
  if (self->_sourceBinId)
  {
    objc_msgSend(v75, "setSourceBinId:");
    v4 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
  {
    v4[784] = self->_adSupportedChannel;
    *(_QWORD *)(v4 + 812) |= 0x2000000000000000uLL;
  }
  if (self->_sourceChannelId)
  {
    objc_msgSend(v75, "setSourceChannelId:");
    v4 = v75;
  }
  if (self->_viewFrameInScreen)
  {
    objc_msgSend(v75, "setViewFrameInScreen:");
    v4 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
  {
    *((_DWORD *)v4 + 60) = self->_characterCount;
    *(_QWORD *)(v4 + 812) |= 0x1000000uLL;
  }
  if (self->_language)
    objc_msgSend(v75, "setLanguage:");
  if (-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure namedEntitiesCount](self, "namedEntitiesCount"))
  {
    objc_msgSend(v75, "clearNamedEntities");
    v12 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure namedEntitiesCount](self, "namedEntitiesCount");
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure namedEntitiesAtIndex:](self, "namedEntitiesAtIndex:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addNamedEntities:", v15);

      }
    }
  }
  v16 = v75;
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
    *((_DWORD *)v75 + 45) = self->_articleType;
    *(_QWORD *)(v75 + 812) |= 0x80000uLL;
  }
  if (self->_surfacedByChannelId)
  {
    objc_msgSend(v75, "setSurfacedByChannelId:");
    v16 = v75;
  }
  if (self->_surfacedBySectionId)
  {
    objc_msgSend(v75, "setSurfacedBySectionId:");
    v16 = v75;
  }
  if (self->_surfacedByTopicId)
  {
    objc_msgSend(v75, "setSurfacedByTopicId:");
    v16 = v75;
  }
  if (self->_sectionHeadlineId)
  {
    objc_msgSend(v75, "setSectionHeadlineId:");
    v16 = v75;
  }
  if (self->_referringSourceApplication)
  {
    objc_msgSend(v75, "setReferringSourceApplication:");
    v16 = v75;
  }
  if (self->_referringUrl)
  {
    objc_msgSend(v75, "setReferringUrl:");
    v16 = v75;
  }
  v17 = *((unsigned __int16 *)&self->_has + 4);
  v18 = v17 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v17 & 0x80) != 0)
  {
    v16[794] = self->_isDigitalReplicaAd;
    v19 = v16[822];
    *((_WORD *)v16 + 410) |= 0x80u;
    v16[822] = v19;
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  }
  if ((*(_QWORD *)&self->_has & 0x4000000000000) != 0)
  {
    *((_DWORD *)v16 + 141) = self->_previousArticleHostViewTypeIfSwipe;
    *(_QWORD *)(v16 + 812) |= 0x4000000000000uLL;
    v18 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v18 & 0x100000) == 0)
    {
LABEL_74:
      if ((v18 & 0x40000) == 0)
        goto LABEL_76;
      goto LABEL_75;
    }
  }
  else if ((v18 & 0x100000) == 0)
  {
    goto LABEL_74;
  }
  v16[807] = self->_isVideoInFeed;
  v26 = *((unsigned __int16 *)v16 + 410);
  v27 = (v26 | (v16[822] << 16) | 0x100000u) >> 16;
  *((_WORD *)v16 + 410) = v26;
  v16[822] = v27;
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x40000) != 0)
  {
LABEL_75:
    v16[805] = self->_isTopStoryArticle;
    v20 = ((v16[822] << 16) | 0x40000u) >> 16;
    *((_WORD *)v16 + 410) = *((_WORD *)v16 + 410);
    v16[822] = v20;
  }
LABEL_76:
  if (self->_storyType)
  {
    objc_msgSend(v75, "setStoryType:");
    v16 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
    *((_QWORD *)v16 + 11) = self->_personalizationTreatmentId;
    *(_QWORD *)(v16 + 812) |= 0x400uLL;
  }
  if (self->_userActivityType)
  {
    objc_msgSend(v75, "setUserActivityType:");
    v16 = v75;
  }
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
    v16[797] = self->_isGroupedArticle;
    *((_WORD *)v16 + 410) |= 0x400u;
  }
  if (self->_groupFeedId)
  {
    objc_msgSend(v75, "setGroupFeedId:");
    v16 = v75;
  }
  v21 = (uint64_t)self->_has;
  if ((v21 & 0x4000000000) != 0)
  {
    *((_DWORD *)v16 + 93) = self->_groupType;
    *(_QWORD *)(v16 + 812) |= 0x4000000000uLL;
    v22 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v21 = (uint64_t)self->_has;
    if ((v22 & 0x10000) == 0)
      goto LABEL_100;
    goto LABEL_99;
  }
  v22 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v22 & 0x10000) != 0)
  {
LABEL_99:
    v16[803] = self->_isSubscribedToGroupFeed;
    v28 = *((unsigned __int16 *)v16 + 410);
    v29 = (v28 | (v16[822] << 16) | 0x10000u) >> 16;
    *((_WORD *)v16 + 410) = v28;
    v16[822] = v29;
    v22 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v21 = (uint64_t)self->_has;
  }
LABEL_100:
  if ((v21 & 0x10000) != 0)
  {
    *((_DWORD *)v16 + 38) = self->_articleDisplayRankInGroup;
    *(_QWORD *)(v16 + 812) |= 0x10000uLL;
    v22 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v21 = (uint64_t)self->_has;
    if ((v22 & 0x200000) == 0)
    {
LABEL_102:
      if ((v22 & 0x8000) == 0)
        goto LABEL_103;
      goto LABEL_146;
    }
  }
  else if ((v22 & 0x200000) == 0)
  {
    goto LABEL_102;
  }
  v16[808] = self->_subscriptionOnlyArticle;
  v22 = *((unsigned __int16 *)v16 + 410);
  v44 = (v22 | (v16[822] << 16) | 0x200000u) >> 16;
  *((_WORD *)v16 + 410) = v22;
  v16[822] = v44;
  LOWORD(v22) = *((_WORD *)&self->_has + 4);
  v21 = (uint64_t)self->_has;
  if ((v22 & 0x8000) == 0)
  {
LABEL_103:
    if ((v22 & 0x200) == 0)
      goto LABEL_104;
    goto LABEL_147;
  }
LABEL_146:
  v16[802] = self->_isSharedSubscriptionOnlyArticle;
  v45 = v16[822];
  *((_WORD *)v16 + 410) |= 0x8000u;
  v16[822] = v45;
  LOWORD(v22) = *((_WORD *)&self->_has + 4);
  v21 = (uint64_t)self->_has;
  if ((v22 & 0x200) == 0)
  {
LABEL_104:
    if ((v22 & 0x2000) == 0)
      goto LABEL_105;
    goto LABEL_148;
  }
LABEL_147:
  v16[796] = self->_isFreeArticle;
  v46 = v16[822];
  *((_WORD *)v16 + 410) |= 0x200u;
  v16[822] = v46;
  LOWORD(v22) = *((_WORD *)&self->_has + 4);
  v21 = (uint64_t)self->_has;
  if ((v22 & 0x2000) == 0)
  {
LABEL_105:
    if ((v22 & 0x40) == 0)
      goto LABEL_106;
    goto LABEL_149;
  }
LABEL_148:
  v16[800] = self->_isPaidSubscriberToFeed;
  v47 = v16[822];
  *((_WORD *)v16 + 410) |= 0x2000u;
  v16[822] = v47;
  LOWORD(v22) = *((_WORD *)&self->_has + 4);
  v21 = (uint64_t)self->_has;
  if ((v22 & 0x40) == 0)
  {
LABEL_106:
    if ((v21 & 0x2000000) == 0)
      goto LABEL_107;
    goto LABEL_150;
  }
LABEL_149:
  v16[793] = self->_isCoverArticle;
  v48 = v16[822];
  *((_WORD *)v16 + 410) |= 0x40u;
  v16[822] = v48;
  LOWORD(v22) = *((_WORD *)&self->_has + 4);
  v21 = (uint64_t)self->_has;
  if ((v21 & 0x2000000) == 0)
  {
LABEL_107:
    if ((v21 & 0x4000000) == 0)
      goto LABEL_108;
    goto LABEL_151;
  }
LABEL_150:
  *((_DWORD *)v16 + 61) = self->_coverArticleDisplayRank;
  *(_QWORD *)(v16 + 812) |= 0x2000000uLL;
  LOWORD(v22) = *((_WORD *)&self->_has + 4);
  v21 = (uint64_t)self->_has;
  if ((v21 & 0x4000000) == 0)
  {
LABEL_108:
    if ((v21 & 0x1000000000000) == 0)
      goto LABEL_109;
    goto LABEL_152;
  }
LABEL_151:
  *((_DWORD *)v16 + 62) = self->_coverArticleFeatureType;
  *(_QWORD *)(v16 + 812) |= 0x4000000uLL;
  LOWORD(v22) = *((_WORD *)&self->_has + 4);
  v21 = (uint64_t)self->_has;
  if ((v21 & 0x1000000000000) == 0)
  {
LABEL_109:
    if ((v22 & 0x4000) == 0)
      goto LABEL_110;
    goto LABEL_153;
  }
LABEL_152:
  *((_DWORD *)v16 + 136) = self->_paidSubscriberToFeedType;
  *(_QWORD *)(v16 + 812) |= 0x1000000000000uLL;
  v21 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x4000) == 0)
  {
LABEL_110:
    if ((v21 & 0x40000000000) == 0)
      goto LABEL_112;
    goto LABEL_111;
  }
LABEL_153:
  v16[801] = self->_isPaidSubscriberToSourceChannel;
  v49 = v16[822];
  *((_WORD *)v16 + 410) |= 0x4000u;
  v16[822] = v49;
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_111:
    *((_DWORD *)v16 + 118) = LODWORD(self->_maxVerticalScrollPositionEnding);
    *(_QWORD *)(v16 + 812) |= 0x40000000000uLL;
  }
LABEL_112:
  if (self->_campaignId)
  {
    objc_msgSend(v75, "setCampaignId:");
    v16 = v75;
  }
  if (self->_campaignType)
  {
    objc_msgSend(v75, "setCampaignType:");
    v16 = v75;
  }
  if (self->_creativeId)
  {
    objc_msgSend(v75, "setCreativeId:");
    v16 = v75;
  }
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x400000) != 0)
  {
    v16[809] = self->_viewFromNotificationDirectOpen;
    v30 = ((v16[822] << 16) | 0x400000u) >> 16;
    *((_WORD *)v16 + 410) = *((_WORD *)v16 + 410);
    v16[822] = v30;
  }
  if (self->_notificationId)
  {
    objc_msgSend(v75, "setNotificationId:");
    v16 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x800000000000) != 0)
  {
    *((_DWORD *)v16 + 130) = self->_nextArticleAffordanceType;
    *(_QWORD *)(v16 + 812) |= 0x800000000000uLL;
  }
  if (self->_nextArticleAffordanceTypeFeedId)
  {
    objc_msgSend(v75, "setNextArticleAffordanceTypeFeedId:");
    v16 = v75;
  }
  p_has = &self->_has;
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x200000000) != 0)
  {
    *((_DWORD *)v16 + 86) = self->_groupArticleCountInForYou;
    *(_QWORD *)(v16 + 812) |= 0x200000000uLL;
    v32 = *(_QWORD *)p_has;
    if ((*(_QWORD *)p_has & 0x400000000) == 0)
    {
LABEL_128:
      if ((v32 & 0x4000000000000000) == 0)
        goto LABEL_129;
      goto LABEL_157;
    }
  }
  else if ((v32 & 0x400000000) == 0)
  {
    goto LABEL_128;
  }
  *((_DWORD *)v16 + 87) = self->_groupDisplayRankInForYou;
  *(_QWORD *)(v16 + 812) |= 0x400000000uLL;
  v32 = (uint64_t)self->_has;
  if ((v32 & 0x4000000000000000) == 0)
  {
LABEL_129:
    if ((v32 & 0x10000000000) == 0)
      goto LABEL_131;
    goto LABEL_130;
  }
LABEL_157:
  v16[785] = self->_articleLoaded;
  *(_QWORD *)(v16 + 812) |= 0x4000000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
  {
LABEL_130:
    *((_DWORD *)v16 + 116) = self->_loadFailureReason;
    *(_QWORD *)(v16 + 812) |= 0x10000000000uLL;
  }
LABEL_131:
  if (self->_previousArticleId)
  {
    objc_msgSend(v75, "setPreviousArticleId:");
    v16 = v75;
  }
  v33 = &self->_has;
  v34 = (uint64_t)self->_has;
  if ((v34 & 0x800000000000000) == 0)
  {
    if ((v34 & 0x1000000000000000) == 0)
      goto LABEL_135;
LABEL_160:
    *((_DWORD *)v16 + 195) = self->_widgetSectionArticleRank;
    *(_QWORD *)(v16 + 812) |= 0x1000000000000000uLL;
    if ((*(_QWORD *)&self->_has & 0x400000000000000) == 0)
      goto LABEL_137;
    goto LABEL_136;
  }
  *((_DWORD *)v16 + 194) = self->_widgetSection;
  *(_QWORD *)(v16 + 812) |= 0x800000000000000uLL;
  v34 = *(_QWORD *)v33;
  if ((*(_QWORD *)v33 & 0x1000000000000000) != 0)
    goto LABEL_160;
LABEL_135:
  if ((v34 & 0x400000000000000) != 0)
  {
LABEL_136:
    *((_DWORD *)v16 + 190) = self->_widgetArticleRank;
    *(_QWORD *)(v16 + 812) |= 0x400000000000000uLL;
  }
LABEL_137:
  if (-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure fractionalCohortMembershipsCount](self, "fractionalCohortMembershipsCount"))
  {
    objc_msgSend(v75, "clearFractionalCohortMemberships");
    v35 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure fractionalCohortMembershipsCount](self, "fractionalCohortMembershipsCount");
    if (v35)
    {
      v36 = v35;
      for (j = 0; j != v36; ++j)
      {
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure fractionalCohortMembershipAtIndex:](self, "fractionalCohortMembershipAtIndex:", j);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addFractionalCohortMembership:", v38);

      }
    }
  }
  v39 = &self->_has;
  v40 = *((unsigned __int16 *)&self->_has + 4);
  v41 = v40 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v40 & 0x20) != 0)
  {
    v43 = v75;
    v75[792] = self->_isBreakingNewsArticle;
    v50 = v75[822];
    *((_WORD *)v75 + 410) |= 0x20u;
    v75[822] = v50;
    v41 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v42 = *(_QWORD *)v39;
    if ((v42 & 0x800000) == 0)
      goto LABEL_164;
    goto LABEL_163;
  }
  v42 = *(_QWORD *)v39;
  v43 = v75;
  if ((v42 & 0x800000) != 0)
  {
LABEL_163:
    *((_DWORD *)v43 + 52) = self->_breakingNewsArticlePosition;
    *(_QWORD *)(v43 + 812) |= 0x800000uLL;
    v41 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v42 = (uint64_t)self->_has;
  }
LABEL_164:
  if ((v42 & 0x400000) != 0)
  {
    *((_DWORD *)v43 + 51) = self->_breakingNewsArticleCount;
    *(_QWORD *)(v43 + 812) |= 0x400000uLL;
    v41 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v42 = (uint64_t)self->_has;
    if ((v42 & 0x200000000000000) == 0)
    {
LABEL_166:
      if ((v42 & 0x80000000000000) == 0)
        goto LABEL_167;
      goto LABEL_237;
    }
  }
  else if ((v42 & 0x200000000000000) == 0)
  {
    goto LABEL_166;
  }
  *((_DWORD *)v43 + 180) = self->_topStoryType;
  *(_QWORD *)(v43 + 812) |= 0x200000000000000uLL;
  v41 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x80000000000000) == 0)
  {
LABEL_167:
    if ((v42 & 0x100000000000000) == 0)
      goto LABEL_168;
    goto LABEL_238;
  }
LABEL_237:
  *((_DWORD *)v43 + 178) = self->_topStoryMandatoryArticleCount;
  *(_QWORD *)(v43 + 812) |= 0x80000000000000uLL;
  v41 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x100000000000000) == 0)
  {
LABEL_168:
    if ((v42 & 0x2000000000) == 0)
      goto LABEL_169;
    goto LABEL_239;
  }
LABEL_238:
  *((_DWORD *)v43 + 179) = self->_topStoryOptionalArticleCount;
  *(_QWORD *)(v43 + 812) |= 0x100000000000000uLL;
  v41 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v42 = (uint64_t)self->_has;
  if ((v42 & 0x2000000000) == 0)
  {
LABEL_169:
    if ((v42 & 0x200) == 0)
      goto LABEL_170;
    goto LABEL_240;
  }
LABEL_239:
  *((_DWORD *)v43 + 92) = self->_groupPresentationReason;
  *(_QWORD *)(v43 + 812) |= 0x2000000000uLL;
  v41 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*(_QWORD *)&self->_has & 0x200) == 0)
  {
LABEL_170:
    if ((v41 & 0x20000) == 0)
      goto LABEL_171;
    goto LABEL_241;
  }
LABEL_240:
  *((_QWORD *)v43 + 10) = *(_QWORD *)&self->_personalizationScore;
  *(_QWORD *)(v43 + 812) |= 0x200uLL;
  v41 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v41 & 0x20000) == 0)
  {
LABEL_171:
    if ((v41 & 0x800) == 0)
      goto LABEL_173;
    goto LABEL_172;
  }
LABEL_241:
  v43[804] = self->_isSubscribedToSourceChannel;
  v62 = *((unsigned __int16 *)v43 + 410);
  v63 = (v62 | (v43[822] << 16) | 0x20000u) >> 16;
  *((_WORD *)v43 + 410) = v62;
  v43[822] = v63;
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
LABEL_172:
    v43[798] = self->_isNativeAd;
    *((_WORD *)v43 + 410) |= 0x800u;
  }
LABEL_173:
  if (self->_nativeCampaignData)
  {
    objc_msgSend(v75, "setNativeCampaignData:");
    v43 = v75;
  }
  if (self->_previousArticleVersion)
  {
    objc_msgSend(v75, "setPreviousArticleVersion:");
    v43 = v75;
  }
  if (self->_anfComponentId)
  {
    objc_msgSend(v75, "setAnfComponentId:");
    v43 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
  {
    v43[786] = self->_badgeExposure;
    *(_QWORD *)(v43 + 812) |= 0x8000000000000000;
  }
  if (self->_widgetEngagement)
  {
    objc_msgSend(v75, "setWidgetEngagement:");
    v43 = v75;
  }
  v51 = &self->_has;
  v52 = (uint64_t)self->_has;
  if ((v52 & 0x1000) != 0)
  {
    *((_QWORD *)v43 + 13) = self->_publisherArticleVersionInt64;
    *(_QWORD *)(v43 + 812) |= 0x1000uLL;
    v52 = *(_QWORD *)v51;
    if ((*(_QWORD *)v51 & 8) == 0)
    {
LABEL_185:
      if ((v52 & 0x100000000) == 0)
        goto LABEL_187;
      goto LABEL_186;
    }
  }
  else if ((v52 & 8) == 0)
  {
    goto LABEL_185;
  }
  *((_QWORD *)v43 + 4) = self->_backendArticleVersionInt64;
  *(_QWORD *)(v43 + 812) |= 8uLL;
  if ((*(_QWORD *)&self->_has & 0x100000000) != 0)
  {
LABEL_186:
    *((_DWORD *)v43 + 80) = self->_feedSubscriptionOrigin;
    *(_QWORD *)(v43 + 812) |= 0x100000000uLL;
  }
LABEL_187:
  if (self->_iadNativeCampaign)
  {
    objc_msgSend(v75, "setIadNativeCampaign:");
    v43 = v75;
  }
  if (self->_iadNativeLine)
  {
    objc_msgSend(v75, "setIadNativeLine:");
    v43 = v75;
  }
  if (self->_iadNativeAd)
  {
    objc_msgSend(v75, "setIadNativeAd:");
    v43 = v75;
  }
  v53 = &self->_has;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x800) != 0)
  {
    *((_QWORD *)v43 + 12) = self->_previousArticlePublisherArticleVersion;
    *(_QWORD *)(v43 + 812) |= 0x800uLL;
    v54 = *(_QWORD *)v53;
    if ((*(_QWORD *)v53 & 0x800000000) == 0)
    {
LABEL_195:
      if ((v54 & 0x20000000) == 0)
        goto LABEL_196;
      goto LABEL_248;
    }
  }
  else if ((v54 & 0x800000000) == 0)
  {
    goto LABEL_195;
  }
  *((_DWORD *)v43 + 90) = self->_groupFormationReason;
  *(_QWORD *)(v43 + 812) |= 0x800000000uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x20000000) == 0)
  {
LABEL_196:
    if ((v54 & 0x40) == 0)
      goto LABEL_197;
    goto LABEL_249;
  }
LABEL_248:
  *((_DWORD *)v43 + 74) = self->_feedAutoSubscribeType;
  *(_QWORD *)(v43 + 812) |= 0x20000000uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x40) == 0)
  {
LABEL_197:
    if ((v54 & 0x100) == 0)
      goto LABEL_198;
    goto LABEL_250;
  }
LABEL_249:
  *((_QWORD *)v43 + 7) = *(_QWORD *)&self->_featureCtr;
  *(_QWORD *)(v43 + 812) |= 0x40uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x100) == 0)
  {
LABEL_198:
    if ((v54 & 4) == 0)
      goto LABEL_199;
    goto LABEL_251;
  }
LABEL_250:
  *((_QWORD *)v43 + 9) = *(_QWORD *)&self->_paidNonpaidSubscriptionCtr;
  *(_QWORD *)(v43 + 812) |= 0x100uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 4) == 0)
  {
LABEL_199:
    if ((v54 & 0x10) == 0)
      goto LABEL_200;
    goto LABEL_252;
  }
LABEL_251:
  *((_QWORD *)v43 + 3) = *(_QWORD *)&self->_autoSubscribeCtr;
  *(_QWORD *)(v43 + 812) |= 4uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x10) == 0)
  {
LABEL_200:
    if ((v54 & 0x80) == 0)
      goto LABEL_201;
    goto LABEL_253;
  }
LABEL_252:
  *((_QWORD *)v43 + 5) = *(_QWORD *)&self->_computedGlobalScoreCoefficient;
  *(_QWORD *)(v43 + 812) |= 0x10uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x80) == 0)
  {
LABEL_201:
    if ((v54 & 0x4000) == 0)
      goto LABEL_202;
    goto LABEL_254;
  }
LABEL_253:
  *((_QWORD *)v43 + 8) = *(_QWORD *)&self->_globalScore;
  *(_QWORD *)(v43 + 812) |= 0x80uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x4000) == 0)
  {
LABEL_202:
    if ((v54 & 2) == 0)
      goto LABEL_203;
    goto LABEL_255;
  }
LABEL_254:
  *((_QWORD *)v43 + 15) = *(_QWORD *)&self->_userFeedbackScore;
  *(_QWORD *)(v43 + 812) |= 0x4000uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 2) == 0)
  {
LABEL_203:
    if ((v54 & 1) == 0)
      goto LABEL_204;
    goto LABEL_256;
  }
LABEL_255:
  *((_QWORD *)v43 + 2) = *(_QWORD *)&self->_agedUserFeedbackScore;
  *(_QWORD *)(v43 + 812) |= 2uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 1) == 0)
  {
LABEL_204:
    if ((v54 & 0x20) == 0)
      goto LABEL_205;
    goto LABEL_257;
  }
LABEL_256:
  *((_QWORD *)v43 + 1) = *(_QWORD *)&self->_agedPersonalizationScore;
  *(_QWORD *)(v43 + 812) |= 1uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x20) == 0)
  {
LABEL_205:
    if ((v54 & 0x80000000000) == 0)
      goto LABEL_206;
    goto LABEL_258;
  }
LABEL_257:
  *((_QWORD *)v43 + 6) = *(_QWORD *)&self->_diversifiedPersonalizationScore;
  *(_QWORD *)(v43 + 812) |= 0x20uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x80000000000) == 0)
  {
LABEL_206:
    if ((v54 & 0x400000000000) == 0)
      goto LABEL_207;
    goto LABEL_259;
  }
LABEL_258:
  *((_DWORD *)v43 + 119) = self->_moduleEventType;
  *(_QWORD *)(v43 + 812) |= 0x80000000000uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x400000000000) == 0)
  {
LABEL_207:
    if ((v54 & 0x100000000000) == 0)
      goto LABEL_208;
    goto LABEL_260;
  }
LABEL_259:
  *((_DWORD *)v43 + 124) = self->_moduleLocation;
  *(_QWORD *)(v43 + 812) |= 0x400000000000uLL;
  v54 = (uint64_t)self->_has;
  if ((v54 & 0x100000000000) == 0)
  {
LABEL_208:
    if ((v54 & 0x200000000000) == 0)
      goto LABEL_210;
    goto LABEL_209;
  }
LABEL_260:
  *((_DWORD *)v43 + 122) = self->_moduleItemCount;
  *(_QWORD *)(v43 + 812) |= 0x100000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000000000) != 0)
  {
LABEL_209:
    *((_DWORD *)v43 + 123) = self->_moduleItemPosition;
    *(_QWORD *)(v43 + 812) |= 0x200000000000uLL;
  }
LABEL_210:
  if (self->_moduleExposureId)
  {
    objc_msgSend(v75, "setModuleExposureId:");
    v43 = v75;
  }
  if (self->_previousWebEmbedId)
  {
    objc_msgSend(v75, "setPreviousWebEmbedId:");
    v43 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
  {
    *((_DWORD *)v43 + 148) = self->_previousWebEmbedLocation;
    *(_QWORD *)(v43 + 812) |= 0x8000000000000uLL;
  }
  if (-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure surfacedByTagIdsCount](self, "surfacedByTagIdsCount"))
  {
    objc_msgSend(v75, "clearSurfacedByTagIds");
    v55 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure surfacedByTagIdsCount](self, "surfacedByTagIdsCount");
    if (v55)
    {
      v56 = v55;
      for (k = 0; k != v56; ++k)
      {
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure surfacedByTagIdsAtIndex:](self, "surfacedByTagIdsAtIndex:", k);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addSurfacedByTagIds:", v58);

      }
    }
  }
  if (self->_iadNativeCampaignAd)
    objc_msgSend(v75, "setIadNativeCampaignAd:");
  v59 = (uint64_t)self->_has;
  v60 = v75;
  if ((v59 & 0x8000000) != 0)
  {
    *((_DWORD *)v75 + 68) = self->_curatedContentType;
    *(_QWORD *)(v75 + 812) |= 0x8000000uLL;
    v59 = (uint64_t)self->_has;
  }
  if ((v59 & 0x1000000000) != 0)
  {
    *((_DWORD *)v75 + 91) = self->_groupLocation;
    *(_QWORD *)(v75 + 812) |= 0x1000000000uLL;
  }
  if (self->_exposedInLocationId)
  {
    objc_msgSend(v75, "setExposedInLocationId:");
    v60 = v75;
  }
  if (self->_groupViewExposureId)
  {
    objc_msgSend(v75, "setGroupViewExposureId:");
    v60 = v75;
  }
  if (self->_exposedGroupSourceChannelId)
  {
    objc_msgSend(v75, "setExposedGroupSourceChannelId:");
    v60 = v75;
  }
  v61 = (uint64_t)self->_has;
  if ((v61 & 0x40000) != 0)
  {
    *((_DWORD *)v60 + 44) = self->_articleSuggestionOrigin;
    *(_QWORD *)(v60 + 812) |= 0x40000uLL;
    v61 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 2) == 0)
      goto LABEL_264;
    goto LABEL_263;
  }
  if ((*((_WORD *)&self->_has + 4) & 2) != 0)
  {
LABEL_263:
    v60[788] = self->_didExpandDuringView;
    v64 = v60[822];
    *((_WORD *)v60 + 410) |= 2u;
    v60[822] = v64;
    v61 = (uint64_t)self->_has;
  }
LABEL_264:
  if ((v61 & 0x2000) != 0)
  {
    *((_QWORD *)v60 + 14) = *(_QWORD *)&self->_subscribedChannelCtr;
    *(_QWORD *)(v60 + 812) |= 0x2000uLL;
  }
  if (self->_alternateHeadline)
  {
    objc_msgSend(v75, "setAlternateHeadline:");
    v60 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
  {
    *((_DWORD *)v60 + 152) = self->_rankInVideoPlaylist;
    *(_QWORD *)(v60 + 812) |= 0x20000000000000uLL;
  }
  if (self->_issueData)
  {
    objc_msgSend(v75, "setIssueData:");
    v60 = v75;
  }
  if (self->_issueExposureData)
  {
    objc_msgSend(v75, "setIssueExposureData:");
    v60 = v75;
  }
  if (self->_issueViewData)
  {
    objc_msgSend(v75, "setIssueViewData:");
    v60 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x40000000000000) != 0)
  {
    *((_DWORD *)v60 + 160) = self->_role;
    *(_QWORD *)(v60 + 812) |= 0x40000000000000uLL;
  }
  if (self->_channelData)
  {
    objc_msgSend(v75, "setChannelData:");
    v60 = v75;
  }
  if (self->_issueViewContextData)
  {
    objc_msgSend(v75, "setIssueViewContextData:");
    v60 = v75;
  }
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
    *((_DWORD *)v60 + 96) = self->_heroArticleType;
    *(_QWORD *)(v60 + 812) |= 0x8000000000uLL;
  }
  if (self->_webEmbedId)
  {
    objc_msgSend(v75, "setWebEmbedId:");
    v60 = v75;
  }
  if (self->_curatedBatchId)
  {
    objc_msgSend(v75, "setCuratedBatchId:");
    v60 = v75;
  }
  v65 = *((_WORD *)&self->_has + 4);
  if ((*((_WORD *)&self->_has + 4) & 8) != 0)
  {
    v60[790] = self->_isAudioEligible;
    v66 = v60[822];
    *((_WORD *)v60 + 410) |= 8u;
    v60[822] = v66;
    v65 = *((_WORD *)&self->_has + 4);
  }
  if ((v65 & 0x10) != 0)
  {
    v60[791] = self->_isAudioEngaged;
    *((_WORD *)v60 + 410) |= 0x10u;
  }
  if (-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure topicIdsCount](self, "topicIdsCount"))
  {
    objc_msgSend(v75, "clearTopicIds");
    v67 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure topicIdsCount](self, "topicIdsCount");
    if (v67)
    {
      v68 = v67;
      for (m = 0; m != v68; ++m)
      {
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure topicIdsAtIndex:](self, "topicIdsAtIndex:", m);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addTopicIds:", v70);

      }
    }
  }
  if (-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure purchaseOffersItemsCount](self, "purchaseOffersItemsCount"))
  {
    objc_msgSend(v75, "clearPurchaseOffersItems");
    v71 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure purchaseOffersItemsCount](self, "purchaseOffersItemsCount");
    if (v71)
    {
      v72 = v71;
      for (n = 0; n != v72; ++n)
      {
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure purchaseOffersItemAtIndex:](self, "purchaseOffersItemAtIndex:", n);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addPurchaseOffersItem:", v74);

      }
    }
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
  uint64_t has;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
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
  int v54;
  int v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  $C23011C766481CAA0C62272794C1DCF4 *p_has;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  int v66;
  char v67;
  char v68;
  char v69;
  int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  unsigned int v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  $C23011C766481CAA0C62272794C1DCF4 *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  $C23011C766481CAA0C62272794C1DCF4 *v89;
  uint64_t v90;
  NSMutableArray *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t j;
  void *v96;
  int v97;
  int v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  void *v108;
  $C23011C766481CAA0C62272794C1DCF4 *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  $C23011C766481CAA0C62272794C1DCF4 *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  NSMutableArray *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t k;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  unsigned int v139;
  char v140;
  char v141;
  char v142;
  char v143;
  char v144;
  int v145;
  unsigned int v146;
  char v147;
  id v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  id v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  __int16 v164;
  char v165;
  NSMutableArray *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t m;
  void *v171;
  NSMutableArray *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t n;
  void *v177;
  id v178;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  _BYTE v204[128];
  uint64_t v205;

  v205 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
  {
    *(_DWORD *)(v5 + 156) = self->_articleHostViewType;
    *(_QWORD *)(v5 + 812) |= 0x20000uLL;
  }
  v7 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v7;

  v9 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 616);
  *(_QWORD *)(v6 + 616) = v9;

  has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) != 0)
  {
    *(_DWORD *)(v6 + 596) = self->_publisherArticleVersion;
    *(_QWORD *)(v6 + 812) |= 0x10000000000000uLL;
    has = (uint64_t)self->_has;
  }
  if ((has & 0x200000) != 0)
  {
    *(_DWORD *)(v6 + 200) = self->_backendArticleVersion;
    *(_QWORD *)(v6 + 812) |= 0x200000uLL;
  }
  v12 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v12;

  v14 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v14;

  v16 = (uint64_t)self->_has;
  if ((v16 & 0x10000000) != 0)
  {
    *(_DWORD *)(v6 + 276) = self->_displayRank;
    *(_QWORD *)(v6 + 812) |= 0x10000000uLL;
    v16 = (uint64_t)self->_has;
  }
  if ((v16 & 0x100000) != 0)
  {
    *(_DWORD *)(v6 + 184) = self->_articleViewPresentationReason;
    *(_QWORD *)(v6 + 812) |= 0x100000uLL;
  }
  v17 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = v17;

  if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
  {
    *(_DWORD *)(v6 + 304) = self->_feedPresentationReason;
    *(_QWORD *)(v6 + 812) |= 0x80000000uLL;
  }
  v19 = -[NSString copyWithZone:](self->_feedPresentationReasonSearchString, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 312);
  *(_QWORD *)(v6 + 312) = v19;

  v21 = (uint64_t)self->_has;
  if ((v21 & 0x40000000) != 0)
  {
    *(_DWORD *)(v6 + 300) = self->_feedCellHostType;
    *(_QWORD *)(v6 + 812) |= 0x40000000uLL;
    v21 = (uint64_t)self->_has;
  }
  if ((v21 & 0x2000000000000) != 0)
  {
    *(_DWORD *)(v6 + 560) = self->_parentFeedType;
    *(_QWORD *)(v6 + 812) |= 0x2000000000000uLL;
  }
  v22 = -[NSString copyWithZone:](self->_parentFeedId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 552);
  *(_QWORD *)(v6 + 552) = v22;

  v24 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v24 & 0x80000) != 0)
  {
    *(_BYTE *)(v6 + 806) = self->_isUserSubscribedToParentFeed;
    v25 = *(unsigned __int16 *)(v6 + 820);
    v26 = (v25 | (*(unsigned __int8 *)(v6 + 822) << 16) | 0x80000u) >> 16;
    *(_WORD *)(v6 + 820) = v25;
    *(_BYTE *)(v6 + 822) = v26;
    LOWORD(v24) = *((_WORD *)&self->_has + 4);
  }
  v27 = (uint64_t)self->_has;
  if ((v27 & 0x8000) != 0)
  {
    *(_DWORD *)(v6 + 128) = self->_activeTimeSpent;
    *(_QWORD *)(v6 + 812) |= 0x8000uLL;
    LOWORD(v24) = *((_WORD *)&self->_has + 4);
    if ((*(_QWORD *)&self->_has & 0x20000000000) == 0)
    {
LABEL_21:
      if ((v24 & 1) == 0)
        goto LABEL_22;
      goto LABEL_54;
    }
  }
  else if ((v27 & 0x20000000000) == 0)
  {
    goto LABEL_21;
  }
  *(_DWORD *)(v6 + 468) = self->_maxActiveTimeSpent;
  *(_QWORD *)(v6 + 812) |= 0x20000000000uLL;
  LOWORD(v24) = *((_WORD *)&self->_has + 4);
  if ((v24 & 1) == 0)
  {
LABEL_22:
    if ((v24 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_55;
  }
LABEL_54:
  *(_BYTE *)(v6 + 787) = self->_didBounce;
  v67 = *(_BYTE *)(v6 + 822);
  *(_WORD *)(v6 + 820) |= 1u;
  *(_BYTE *)(v6 + 822) = v67;
  LOWORD(v24) = *((_WORD *)&self->_has + 4);
  if ((v24 & 0x1000) == 0)
  {
LABEL_23:
    if ((v24 & 4) == 0)
      goto LABEL_24;
    goto LABEL_56;
  }
LABEL_55:
  *(_BYTE *)(v6 + 799) = self->_isNewUserToArticle;
  v68 = *(_BYTE *)(v6 + 822);
  *(_WORD *)(v6 + 820) |= 0x1000u;
  *(_BYTE *)(v6 + 822) = v68;
  LOWORD(v24) = *((_WORD *)&self->_has + 4);
  if ((v24 & 4) == 0)
  {
LABEL_24:
    if ((v24 & 0x100) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_56:
  *(_BYTE *)(v6 + 789) = self->_didOpenInSafari;
  v69 = *(_BYTE *)(v6 + 822);
  *(_WORD *)(v6 + 820) |= 4u;
  *(_BYTE *)(v6 + 822) = v69;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_25:
    *(_BYTE *)(v6 + 795) = self->_isExplorationArticle;
    *(_WORD *)(v6 + 820) |= 0x100u;
  }
LABEL_26:
  v28 = -[NSString copyWithZone:](self->_sourceBinId, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 656);
  *(_QWORD *)(v6 + 656) = v28;

  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
  {
    *(_BYTE *)(v6 + 784) = self->_adSupportedChannel;
    *(_QWORD *)(v6 + 812) |= 0x2000000000000000uLL;
  }
  v30 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 664);
  *(_QWORD *)(v6 + 664) = v30;

  v32 = -[NSString copyWithZone:](self->_viewFrameInScreen, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 744);
  *(_QWORD *)(v6 + 744) = v32;

  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
  {
    *(_DWORD *)(v6 + 240) = self->_characterCount;
    *(_QWORD *)(v6 + 812) |= 0x1000000uLL;
  }
  v34 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 456);
  *(_QWORD *)(v6 + 456) = v34;

  v198 = 0u;
  v199 = 0u;
  v196 = 0u;
  v197 = 0u;
  v36 = self->_namedEntities;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v196, v204, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v197;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v197 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v196 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNamedEntities:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v196, v204, 16);
    }
    while (v38);
  }

  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
    *(_DWORD *)(v6 + 180) = self->_articleType;
    *(_QWORD *)(v6 + 812) |= 0x80000uLL;
  }
  v42 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 680);
  *(_QWORD *)(v6 + 680) = v42;

  v44 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v45 = *(void **)(v6 + 688);
  *(_QWORD *)(v6 + 688) = v44;

  v46 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v47 = *(void **)(v6 + 704);
  *(_QWORD *)(v6 + 704) = v46;

  v48 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v49 = *(void **)(v6 + 648);
  *(_QWORD *)(v6 + 648) = v48;

  v50 = -[NSString copyWithZone:](self->_referringSourceApplication, "copyWithZone:", a3);
  v51 = *(void **)(v6 + 624);
  *(_QWORD *)(v6 + 624) = v50;

  v52 = -[NSString copyWithZone:](self->_referringUrl, "copyWithZone:", a3);
  v53 = *(void **)(v6 + 632);
  *(_QWORD *)(v6 + 632) = v52;

  v54 = *((unsigned __int16 *)&self->_has + 4);
  v55 = v54 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v54 & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 794) = self->_isDigitalReplicaAd;
    v56 = *(_BYTE *)(v6 + 822);
    *(_WORD *)(v6 + 820) |= 0x80u;
    *(_BYTE *)(v6 + 822) = v56;
    v55 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  }
  if ((*(_QWORD *)&self->_has & 0x4000000000000) != 0)
  {
    *(_DWORD *)(v6 + 564) = self->_previousArticleHostViewTypeIfSwipe;
    *(_QWORD *)(v6 + 812) |= 0x4000000000000uLL;
    v55 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    if ((v55 & 0x100000) == 0)
    {
LABEL_43:
      if ((v55 & 0x40000) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if ((v55 & 0x100000) == 0)
  {
    goto LABEL_43;
  }
  *(_BYTE *)(v6 + 807) = self->_isVideoInFeed;
  v70 = *(unsigned __int16 *)(v6 + 820);
  v71 = (v70 | (*(unsigned __int8 *)(v6 + 822) << 16) | 0x100000u) >> 16;
  *(_WORD *)(v6 + 820) = v70;
  *(_BYTE *)(v6 + 822) = v71;
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x40000) != 0)
  {
LABEL_44:
    *(_BYTE *)(v6 + 805) = self->_isTopStoryArticle;
    v57 = ((*(unsigned __int8 *)(v6 + 822) << 16) | 0x40000u) >> 16;
    *(_WORD *)(v6 + 820) = *(_WORD *)(v6 + 820);
    *(_BYTE *)(v6 + 822) = v57;
  }
LABEL_45:
  v58 = -[NSString copyWithZone:](self->_storyType, "copyWithZone:", a3);
  v59 = *(void **)(v6 + 672);
  *(_QWORD *)(v6 + 672) = v58;

  if ((*(_QWORD *)&self->_has & 0x400) != 0)
  {
    *(_QWORD *)(v6 + 88) = self->_personalizationTreatmentId;
    *(_QWORD *)(v6 + 812) |= 0x400uLL;
  }
  v60 = -[NSString copyWithZone:](self->_userActivityType, "copyWithZone:", a3);
  v61 = *(void **)(v6 + 736);
  *(_QWORD *)(v6 + 736) = v60;

  p_has = &self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
    *(_BYTE *)(v6 + 797) = self->_isGroupedArticle;
    *(_WORD *)(v6 + 820) |= 0x400u;
  }
  v63 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v64 = *(void **)(v6 + 352);
  *(_QWORD *)(v6 + 352) = v63;

  v65 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000000) != 0)
  {
    *(_DWORD *)(v6 + 372) = self->_groupType;
    *(_QWORD *)(v6 + 812) |= 0x4000000000uLL;
    v66 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v65 = (uint64_t)self->_has;
    if ((v66 & 0x10000) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
  v66 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v66 & 0x10000) != 0)
  {
LABEL_62:
    *(_BYTE *)(v6 + 803) = self->_isSubscribedToGroupFeed;
    v72 = *(unsigned __int16 *)(v6 + 820);
    v73 = (v72 | (*(unsigned __int8 *)(v6 + 822) << 16) | 0x10000u) >> 16;
    *(_WORD *)(v6 + 820) = v72;
    *(_BYTE *)(v6 + 822) = v73;
    v66 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v65 = (uint64_t)self->_has;
  }
LABEL_63:
  if ((v65 & 0x10000) != 0)
  {
    *(_DWORD *)(v6 + 152) = self->_articleDisplayRankInGroup;
    *(_QWORD *)(v6 + 812) |= 0x10000uLL;
    v66 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v65 = (uint64_t)self->_has;
    if ((v66 & 0x200000) == 0)
    {
LABEL_65:
      if ((v66 & 0x8000) == 0)
        goto LABEL_66;
      goto LABEL_148;
    }
  }
  else if ((v66 & 0x200000) == 0)
  {
    goto LABEL_65;
  }
  *(_BYTE *)(v6 + 808) = self->_subscriptionOnlyArticle;
  v66 = *(unsigned __int16 *)(v6 + 820);
  v139 = (v66 | (*(unsigned __int8 *)(v6 + 822) << 16) | 0x200000u) >> 16;
  *(_WORD *)(v6 + 820) = v66;
  *(_BYTE *)(v6 + 822) = v139;
  LOWORD(v66) = *((_WORD *)&self->_has + 4);
  v65 = (uint64_t)self->_has;
  if ((v66 & 0x8000) == 0)
  {
LABEL_66:
    if ((v66 & 0x200) == 0)
      goto LABEL_67;
    goto LABEL_149;
  }
LABEL_148:
  *(_BYTE *)(v6 + 802) = self->_isSharedSubscriptionOnlyArticle;
  v140 = *(_BYTE *)(v6 + 822);
  *(_WORD *)(v6 + 820) |= 0x8000u;
  *(_BYTE *)(v6 + 822) = v140;
  LOWORD(v66) = *((_WORD *)&self->_has + 4);
  v65 = (uint64_t)self->_has;
  if ((v66 & 0x200) == 0)
  {
LABEL_67:
    if ((v66 & 0x2000) == 0)
      goto LABEL_68;
    goto LABEL_150;
  }
LABEL_149:
  *(_BYTE *)(v6 + 796) = self->_isFreeArticle;
  v141 = *(_BYTE *)(v6 + 822);
  *(_WORD *)(v6 + 820) |= 0x200u;
  *(_BYTE *)(v6 + 822) = v141;
  LOWORD(v66) = *((_WORD *)&self->_has + 4);
  v65 = (uint64_t)self->_has;
  if ((v66 & 0x2000) == 0)
  {
LABEL_68:
    if ((v66 & 0x40) == 0)
      goto LABEL_69;
    goto LABEL_151;
  }
LABEL_150:
  *(_BYTE *)(v6 + 800) = self->_isPaidSubscriberToFeed;
  v142 = *(_BYTE *)(v6 + 822);
  *(_WORD *)(v6 + 820) |= 0x2000u;
  *(_BYTE *)(v6 + 822) = v142;
  LOWORD(v66) = *((_WORD *)&self->_has + 4);
  v65 = (uint64_t)self->_has;
  if ((v66 & 0x40) == 0)
  {
LABEL_69:
    if ((v65 & 0x2000000) == 0)
      goto LABEL_70;
    goto LABEL_152;
  }
LABEL_151:
  *(_BYTE *)(v6 + 793) = self->_isCoverArticle;
  v143 = *(_BYTE *)(v6 + 822);
  *(_WORD *)(v6 + 820) |= 0x40u;
  *(_BYTE *)(v6 + 822) = v143;
  LOWORD(v66) = *((_WORD *)&self->_has + 4);
  v65 = (uint64_t)self->_has;
  if ((v65 & 0x2000000) == 0)
  {
LABEL_70:
    if ((v65 & 0x4000000) == 0)
      goto LABEL_71;
    goto LABEL_153;
  }
LABEL_152:
  *(_DWORD *)(v6 + 244) = self->_coverArticleDisplayRank;
  *(_QWORD *)(v6 + 812) |= 0x2000000uLL;
  LOWORD(v66) = *((_WORD *)&self->_has + 4);
  v65 = (uint64_t)self->_has;
  if ((v65 & 0x4000000) == 0)
  {
LABEL_71:
    if ((v65 & 0x1000000000000) == 0)
      goto LABEL_72;
    goto LABEL_154;
  }
LABEL_153:
  *(_DWORD *)(v6 + 248) = self->_coverArticleFeatureType;
  *(_QWORD *)(v6 + 812) |= 0x4000000uLL;
  LOWORD(v66) = *((_WORD *)&self->_has + 4);
  v65 = (uint64_t)self->_has;
  if ((v65 & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v66 & 0x4000) == 0)
      goto LABEL_73;
    goto LABEL_155;
  }
LABEL_154:
  *(_DWORD *)(v6 + 544) = self->_paidSubscriberToFeedType;
  *(_QWORD *)(v6 + 812) |= 0x1000000000000uLL;
  v65 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x4000) == 0)
  {
LABEL_73:
    if ((v65 & 0x40000000000) == 0)
      goto LABEL_75;
    goto LABEL_74;
  }
LABEL_155:
  *(_BYTE *)(v6 + 801) = self->_isPaidSubscriberToSourceChannel;
  v144 = *(_BYTE *)(v6 + 822);
  *(_WORD *)(v6 + 820) |= 0x4000u;
  *(_BYTE *)(v6 + 822) = v144;
  if ((*(_QWORD *)&self->_has & 0x40000000000) != 0)
  {
LABEL_74:
    *(float *)(v6 + 472) = self->_maxVerticalScrollPositionEnding;
    *(_QWORD *)(v6 + 812) |= 0x40000000000uLL;
  }
LABEL_75:
  v74 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v75 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v74;

  v76 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v77 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v76;

  v78 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v79 = *(void **)(v6 + 256);
  *(_QWORD *)(v6 + 256) = v78;

  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x400000) != 0)
  {
    *(_BYTE *)(v6 + 809) = self->_viewFromNotificationDirectOpen;
    v80 = ((*(unsigned __int8 *)(v6 + 822) << 16) | 0x400000u) >> 16;
    *(_WORD *)(v6 + 820) = *(_WORD *)(v6 + 820);
    *(_BYTE *)(v6 + 822) = v80;
  }
  v81 = -[NSString copyWithZone:](self->_notificationId, "copyWithZone:", a3);
  v82 = *(void **)(v6 + 536);
  *(_QWORD *)(v6 + 536) = v81;

  if ((*(_QWORD *)&self->_has & 0x800000000000) != 0)
  {
    *(_DWORD *)(v6 + 520) = self->_nextArticleAffordanceType;
    *(_QWORD *)(v6 + 812) |= 0x800000000000uLL;
  }
  v83 = -[NSString copyWithZone:](self->_nextArticleAffordanceTypeFeedId, "copyWithZone:", a3);
  v84 = *(void **)(v6 + 528);
  *(_QWORD *)(v6 + 528) = v83;

  v85 = &self->_has;
  v86 = (uint64_t)self->_has;
  if ((v86 & 0x200000000) != 0)
  {
    *(_DWORD *)(v6 + 344) = self->_groupArticleCountInForYou;
    *(_QWORD *)(v6 + 812) |= 0x200000000uLL;
    v86 = *(_QWORD *)v85;
    if ((*(_QWORD *)v85 & 0x400000000) == 0)
    {
LABEL_81:
      if ((v86 & 0x4000000000000000) == 0)
        goto LABEL_82;
      goto LABEL_159;
    }
  }
  else if ((v86 & 0x400000000) == 0)
  {
    goto LABEL_81;
  }
  *(_DWORD *)(v6 + 348) = self->_groupDisplayRankInForYou;
  *(_QWORD *)(v6 + 812) |= 0x400000000uLL;
  v86 = (uint64_t)self->_has;
  if ((v86 & 0x4000000000000000) == 0)
  {
LABEL_82:
    if ((v86 & 0x10000000000) == 0)
      goto LABEL_84;
    goto LABEL_83;
  }
LABEL_159:
  *(_BYTE *)(v6 + 785) = self->_articleLoaded;
  *(_QWORD *)(v6 + 812) |= 0x4000000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000000) != 0)
  {
LABEL_83:
    *(_DWORD *)(v6 + 464) = self->_loadFailureReason;
    *(_QWORD *)(v6 + 812) |= 0x10000000000uLL;
  }
LABEL_84:
  v87 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v88 = *(void **)(v6 + 568);
  *(_QWORD *)(v6 + 568) = v87;

  v89 = &self->_has;
  v90 = (uint64_t)self->_has;
  if ((v90 & 0x800000000000000) != 0)
  {
    *(_DWORD *)(v6 + 776) = self->_widgetSection;
    *(_QWORD *)(v6 + 812) |= 0x800000000000000uLL;
    v90 = *(_QWORD *)v89;
    if ((*(_QWORD *)v89 & 0x1000000000000000) == 0)
    {
LABEL_86:
      if ((v90 & 0x400000000000000) == 0)
        goto LABEL_88;
      goto LABEL_87;
    }
  }
  else if ((v90 & 0x1000000000000000) == 0)
  {
    goto LABEL_86;
  }
  *(_DWORD *)(v6 + 780) = self->_widgetSectionArticleRank;
  *(_QWORD *)(v6 + 812) |= 0x1000000000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000000000000) != 0)
  {
LABEL_87:
    *(_DWORD *)(v6 + 760) = self->_widgetArticleRank;
    *(_QWORD *)(v6 + 812) |= 0x400000000000000uLL;
  }
LABEL_88:
  v194 = 0u;
  v195 = 0u;
  v192 = 0u;
  v193 = 0u;
  v91 = self->_fractionalCohortMemberships;
  v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v192, v203, 16);
  if (v92)
  {
    v93 = v92;
    v94 = *(_QWORD *)v193;
    do
    {
      for (j = 0; j != v93; ++j)
      {
        if (*(_QWORD *)v193 != v94)
          objc_enumerationMutation(v91);
        v96 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFractionalCohortMembership:", v96);

      }
      v93 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v192, v203, 16);
    }
    while (v93);
  }

  v97 = *((unsigned __int16 *)&self->_has + 4);
  v98 = v97 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v97 & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 792) = self->_isBreakingNewsArticle;
    v99 = *(_BYTE *)(v6 + 822);
    *(_WORD *)(v6 + 820) |= 0x20u;
    *(_BYTE *)(v6 + 822) = v99;
    v98 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  }
  v100 = (uint64_t)self->_has;
  if ((v100 & 0x800000) != 0)
  {
    *(_DWORD *)(v6 + 208) = self->_breakingNewsArticlePosition;
    *(_QWORD *)(v6 + 812) |= 0x800000uLL;
    v98 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v100 = (uint64_t)self->_has;
    if ((v100 & 0x400000) == 0)
    {
LABEL_99:
      if ((v100 & 0x200000000000000) == 0)
        goto LABEL_100;
      goto LABEL_166;
    }
  }
  else if ((v100 & 0x400000) == 0)
  {
    goto LABEL_99;
  }
  *(_DWORD *)(v6 + 204) = self->_breakingNewsArticleCount;
  *(_QWORD *)(v6 + 812) |= 0x400000uLL;
  v98 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v100 = (uint64_t)self->_has;
  if ((v100 & 0x200000000000000) == 0)
  {
LABEL_100:
    if ((v100 & 0x80000000000000) == 0)
      goto LABEL_101;
    goto LABEL_167;
  }
LABEL_166:
  *(_DWORD *)(v6 + 720) = self->_topStoryType;
  *(_QWORD *)(v6 + 812) |= 0x200000000000000uLL;
  v98 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v100 = (uint64_t)self->_has;
  if ((v100 & 0x80000000000000) == 0)
  {
LABEL_101:
    if ((v100 & 0x100000000000000) == 0)
      goto LABEL_102;
    goto LABEL_168;
  }
LABEL_167:
  *(_DWORD *)(v6 + 712) = self->_topStoryMandatoryArticleCount;
  *(_QWORD *)(v6 + 812) |= 0x80000000000000uLL;
  v98 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v100 = (uint64_t)self->_has;
  if ((v100 & 0x100000000000000) == 0)
  {
LABEL_102:
    if ((v100 & 0x2000000000) == 0)
      goto LABEL_103;
    goto LABEL_169;
  }
LABEL_168:
  *(_DWORD *)(v6 + 716) = self->_topStoryOptionalArticleCount;
  *(_QWORD *)(v6 + 812) |= 0x100000000000000uLL;
  v98 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v100 = (uint64_t)self->_has;
  if ((v100 & 0x2000000000) == 0)
  {
LABEL_103:
    if ((v100 & 0x200) == 0)
      goto LABEL_104;
    goto LABEL_170;
  }
LABEL_169:
  *(_DWORD *)(v6 + 368) = self->_groupPresentationReason;
  *(_QWORD *)(v6 + 812) |= 0x2000000000uLL;
  v98 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((*(_QWORD *)&self->_has & 0x200) == 0)
  {
LABEL_104:
    if ((v98 & 0x20000) == 0)
      goto LABEL_105;
    goto LABEL_171;
  }
LABEL_170:
  *(double *)(v6 + 80) = self->_personalizationScore;
  *(_QWORD *)(v6 + 812) |= 0x200uLL;
  v98 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  if ((v98 & 0x20000) == 0)
  {
LABEL_105:
    if ((v98 & 0x800) == 0)
      goto LABEL_107;
    goto LABEL_106;
  }
LABEL_171:
  *(_BYTE *)(v6 + 804) = self->_isSubscribedToSourceChannel;
  v145 = *(unsigned __int16 *)(v6 + 820);
  v146 = (v145 | (*(unsigned __int8 *)(v6 + 822) << 16) | 0x20000u) >> 16;
  *(_WORD *)(v6 + 820) = v145;
  *(_BYTE *)(v6 + 822) = v146;
  if ((*((_WORD *)&self->_has + 4) & 0x800) != 0)
  {
LABEL_106:
    *(_BYTE *)(v6 + 798) = self->_isNativeAd;
    *(_WORD *)(v6 + 820) |= 0x800u;
  }
LABEL_107:
  v101 = -[NSString copyWithZone:](self->_nativeCampaignData, "copyWithZone:", a3);
  v102 = *(void **)(v6 + 512);
  *(_QWORD *)(v6 + 512) = v101;

  v103 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v104 = *(void **)(v6 + 576);
  *(_QWORD *)(v6 + 576) = v103;

  v105 = -[NSString copyWithZone:](self->_anfComponentId, "copyWithZone:", a3);
  v106 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v105;

  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
  {
    *(_BYTE *)(v6 + 786) = self->_badgeExposure;
    *(_QWORD *)(v6 + 812) |= 0x8000000000000000;
  }
  v107 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v108 = *(void **)(v6 + 768);
  *(_QWORD *)(v6 + 768) = v107;

  v109 = &self->_has;
  v110 = (uint64_t)self->_has;
  if ((v110 & 0x1000) != 0)
  {
    *(_QWORD *)(v6 + 104) = self->_publisherArticleVersionInt64;
    *(_QWORD *)(v6 + 812) |= 0x1000uLL;
    v110 = *(_QWORD *)v109;
    if ((*(_QWORD *)v109 & 8) == 0)
    {
LABEL_111:
      if ((v110 & 0x100000000) == 0)
        goto LABEL_113;
      goto LABEL_112;
    }
  }
  else if ((v110 & 8) == 0)
  {
    goto LABEL_111;
  }
  *(_QWORD *)(v6 + 32) = self->_backendArticleVersionInt64;
  *(_QWORD *)(v6 + 812) |= 8uLL;
  if ((*(_QWORD *)&self->_has & 0x100000000) != 0)
  {
LABEL_112:
    *(_DWORD *)(v6 + 320) = self->_feedSubscriptionOrigin;
    *(_QWORD *)(v6 + 812) |= 0x100000000uLL;
  }
LABEL_113:
  v111 = -[NSString copyWithZone:](self->_iadNativeCampaign, "copyWithZone:", a3);
  v112 = *(void **)(v6 + 400);
  *(_QWORD *)(v6 + 400) = v111;

  v113 = -[NSString copyWithZone:](self->_iadNativeLine, "copyWithZone:", a3);
  v114 = *(void **)(v6 + 416);
  *(_QWORD *)(v6 + 416) = v113;

  v115 = -[NSString copyWithZone:](self->_iadNativeAd, "copyWithZone:", a3);
  v116 = *(void **)(v6 + 392);
  *(_QWORD *)(v6 + 392) = v115;

  v117 = &self->_has;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x800) != 0)
  {
    *(_QWORD *)(v6 + 96) = self->_previousArticlePublisherArticleVersion;
    *(_QWORD *)(v6 + 812) |= 0x800uLL;
    v118 = *(_QWORD *)v117;
    if ((*(_QWORD *)v117 & 0x800000000) == 0)
    {
LABEL_115:
      if ((v118 & 0x20000000) == 0)
        goto LABEL_116;
      goto LABEL_178;
    }
  }
  else if ((v118 & 0x800000000) == 0)
  {
    goto LABEL_115;
  }
  *(_DWORD *)(v6 + 360) = self->_groupFormationReason;
  *(_QWORD *)(v6 + 812) |= 0x800000000uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x20000000) == 0)
  {
LABEL_116:
    if ((v118 & 0x40) == 0)
      goto LABEL_117;
    goto LABEL_179;
  }
LABEL_178:
  *(_DWORD *)(v6 + 296) = self->_feedAutoSubscribeType;
  *(_QWORD *)(v6 + 812) |= 0x20000000uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x40) == 0)
  {
LABEL_117:
    if ((v118 & 0x100) == 0)
      goto LABEL_118;
    goto LABEL_180;
  }
LABEL_179:
  *(double *)(v6 + 56) = self->_featureCtr;
  *(_QWORD *)(v6 + 812) |= 0x40uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x100) == 0)
  {
LABEL_118:
    if ((v118 & 4) == 0)
      goto LABEL_119;
    goto LABEL_181;
  }
LABEL_180:
  *(double *)(v6 + 72) = self->_paidNonpaidSubscriptionCtr;
  *(_QWORD *)(v6 + 812) |= 0x100uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 4) == 0)
  {
LABEL_119:
    if ((v118 & 0x10) == 0)
      goto LABEL_120;
    goto LABEL_182;
  }
LABEL_181:
  *(double *)(v6 + 24) = self->_autoSubscribeCtr;
  *(_QWORD *)(v6 + 812) |= 4uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x10) == 0)
  {
LABEL_120:
    if ((v118 & 0x80) == 0)
      goto LABEL_121;
    goto LABEL_183;
  }
LABEL_182:
  *(double *)(v6 + 40) = self->_computedGlobalScoreCoefficient;
  *(_QWORD *)(v6 + 812) |= 0x10uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x80) == 0)
  {
LABEL_121:
    if ((v118 & 0x4000) == 0)
      goto LABEL_122;
    goto LABEL_184;
  }
LABEL_183:
  *(double *)(v6 + 64) = self->_globalScore;
  *(_QWORD *)(v6 + 812) |= 0x80uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x4000) == 0)
  {
LABEL_122:
    if ((v118 & 2) == 0)
      goto LABEL_123;
    goto LABEL_185;
  }
LABEL_184:
  *(double *)(v6 + 120) = self->_userFeedbackScore;
  *(_QWORD *)(v6 + 812) |= 0x4000uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 2) == 0)
  {
LABEL_123:
    if ((v118 & 1) == 0)
      goto LABEL_124;
    goto LABEL_186;
  }
LABEL_185:
  *(double *)(v6 + 16) = self->_agedUserFeedbackScore;
  *(_QWORD *)(v6 + 812) |= 2uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 1) == 0)
  {
LABEL_124:
    if ((v118 & 0x20) == 0)
      goto LABEL_125;
    goto LABEL_187;
  }
LABEL_186:
  *(double *)(v6 + 8) = self->_agedPersonalizationScore;
  *(_QWORD *)(v6 + 812) |= 1uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x20) == 0)
  {
LABEL_125:
    if ((v118 & 0x80000000000) == 0)
      goto LABEL_126;
    goto LABEL_188;
  }
LABEL_187:
  *(double *)(v6 + 48) = self->_diversifiedPersonalizationScore;
  *(_QWORD *)(v6 + 812) |= 0x20uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x80000000000) == 0)
  {
LABEL_126:
    if ((v118 & 0x400000000000) == 0)
      goto LABEL_127;
    goto LABEL_189;
  }
LABEL_188:
  *(_DWORD *)(v6 + 476) = self->_moduleEventType;
  *(_QWORD *)(v6 + 812) |= 0x80000000000uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x400000000000) == 0)
  {
LABEL_127:
    if ((v118 & 0x100000000000) == 0)
      goto LABEL_128;
    goto LABEL_190;
  }
LABEL_189:
  *(_DWORD *)(v6 + 496) = self->_moduleLocation;
  *(_QWORD *)(v6 + 812) |= 0x400000000000uLL;
  v118 = (uint64_t)self->_has;
  if ((v118 & 0x100000000000) == 0)
  {
LABEL_128:
    if ((v118 & 0x200000000000) == 0)
      goto LABEL_130;
    goto LABEL_129;
  }
LABEL_190:
  *(_DWORD *)(v6 + 488) = self->_moduleItemCount;
  *(_QWORD *)(v6 + 812) |= 0x100000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000000000) != 0)
  {
LABEL_129:
    *(_DWORD *)(v6 + 492) = self->_moduleItemPosition;
    *(_QWORD *)(v6 + 812) |= 0x200000000000uLL;
  }
LABEL_130:
  v119 = -[NSData copyWithZone:](self->_moduleExposureId, "copyWithZone:", a3);
  v120 = *(void **)(v6 + 480);
  *(_QWORD *)(v6 + 480) = v119;

  v121 = -[NSString copyWithZone:](self->_previousWebEmbedId, "copyWithZone:", a3);
  v122 = *(void **)(v6 + 584);
  *(_QWORD *)(v6 + 584) = v121;

  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
  {
    *(_DWORD *)(v6 + 592) = self->_previousWebEmbedLocation;
    *(_QWORD *)(v6 + 812) |= 0x8000000000000uLL;
  }
  v190 = 0u;
  v191 = 0u;
  v188 = 0u;
  v189 = 0u;
  v123 = self->_surfacedByTagIds;
  v124 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v188, v202, 16);
  if (v124)
  {
    v125 = v124;
    v126 = *(_QWORD *)v189;
    do
    {
      for (k = 0; k != v125; ++k)
      {
        if (*(_QWORD *)v189 != v126)
          objc_enumerationMutation(v123);
        v128 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v188 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSurfacedByTagIds:", v128);

      }
      v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v188, v202, 16);
    }
    while (v125);
  }

  v129 = -[NSString copyWithZone:](self->_iadNativeCampaignAd, "copyWithZone:", a3);
  v130 = *(void **)(v6 + 408);
  *(_QWORD *)(v6 + 408) = v129;

  v131 = (uint64_t)self->_has;
  if ((v131 & 0x8000000) != 0)
  {
    *(_DWORD *)(v6 + 272) = self->_curatedContentType;
    *(_QWORD *)(v6 + 812) |= 0x8000000uLL;
    v131 = (uint64_t)self->_has;
  }
  if ((v131 & 0x1000000000) != 0)
  {
    *(_DWORD *)(v6 + 364) = self->_groupLocation;
    *(_QWORD *)(v6 + 812) |= 0x1000000000uLL;
  }
  v132 = -[NSString copyWithZone:](self->_exposedInLocationId, "copyWithZone:", a3);
  v133 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v132;

  v134 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v135 = *(void **)(v6 + 376);
  *(_QWORD *)(v6 + 376) = v134;

  v136 = -[NSString copyWithZone:](self->_exposedGroupSourceChannelId, "copyWithZone:", a3);
  v137 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v136;

  v138 = (uint64_t)self->_has;
  if ((v138 & 0x40000) != 0)
  {
    *(_DWORD *)(v6 + 176) = self->_articleSuggestionOrigin;
    *(_QWORD *)(v6 + 812) |= 0x40000uLL;
    v138 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 2) == 0)
      goto LABEL_194;
    goto LABEL_193;
  }
  if ((*((_WORD *)&self->_has + 4) & 2) != 0)
  {
LABEL_193:
    *(_BYTE *)(v6 + 788) = self->_didExpandDuringView;
    v147 = *(_BYTE *)(v6 + 822);
    *(_WORD *)(v6 + 820) |= 2u;
    *(_BYTE *)(v6 + 822) = v147;
    v138 = (uint64_t)self->_has;
  }
LABEL_194:
  if ((v138 & 0x2000) != 0)
  {
    *(double *)(v6 + 112) = self->_subscribedChannelCtr;
    *(_QWORD *)(v6 + 812) |= 0x2000uLL;
  }
  v148 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline copyWithZone:](self->_alternateHeadline, "copyWithZone:", a3);
  v149 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v148;

  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
  {
    *(_DWORD *)(v6 + 608) = self->_rankInVideoPlaylist;
    *(_QWORD *)(v6 + 812) |= 0x20000000000000uLL;
  }
  v150 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v151 = *(void **)(v6 + 424);
  *(_QWORD *)(v6 + 424) = v150;

  v152 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v153 = *(void **)(v6 + 432);
  *(_QWORD *)(v6 + 432) = v152;

  v154 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v155 = *(void **)(v6 + 448);
  *(_QWORD *)(v6 + 448) = v154;

  if ((*(_QWORD *)&self->_has & 0x40000000000000) != 0)
  {
    *(_DWORD *)(v6 + 640) = self->_role;
    *(_QWORD *)(v6 + 812) |= 0x40000000000000uLL;
  }
  v156 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData copyWithZone:](self->_channelData, "copyWithZone:", a3);
  v157 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v156;

  v158 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData copyWithZone:](self->_issueViewContextData, "copyWithZone:", a3);
  v159 = *(void **)(v6 + 440);
  *(_QWORD *)(v6 + 440) = v158;

  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
    *(_DWORD *)(v6 + 384) = self->_heroArticleType;
    *(_QWORD *)(v6 + 812) |= 0x8000000000uLL;
  }
  v160 = -[NSString copyWithZone:](self->_webEmbedId, "copyWithZone:", a3);
  v161 = *(void **)(v6 + 752);
  *(_QWORD *)(v6 + 752) = v160;

  v162 = -[NSString copyWithZone:](self->_curatedBatchId, "copyWithZone:", a3);
  v163 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v162;

  LOBYTE(v164) = *((_WORD *)&self->_has + 4);
  if ((*((_WORD *)&self->_has + 4) & 8) != 0)
  {
    *(_BYTE *)(v6 + 790) = self->_isAudioEligible;
    v165 = *(_BYTE *)(v6 + 822);
    *(_WORD *)(v6 + 820) |= 8u;
    *(_BYTE *)(v6 + 822) = v165;
    v164 = *((_WORD *)&self->_has + 4);
  }
  if ((v164 & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 791) = self->_isAudioEngaged;
    *(_WORD *)(v6 + 820) |= 0x10u;
  }
  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  v166 = self->_topicIds;
  v167 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v166, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
  if (v167)
  {
    v168 = v167;
    v169 = *(_QWORD *)v185;
    do
    {
      for (m = 0; m != v168; ++m)
      {
        if (*(_QWORD *)v185 != v169)
          objc_enumerationMutation(v166);
        v171 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addTopicIds:", v171);

      }
      v168 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v166, "countByEnumeratingWithState:objects:count:", &v184, v201, 16);
    }
    while (v168);
  }

  v182 = 0u;
  v183 = 0u;
  v180 = 0u;
  v181 = 0u;
  v172 = self->_purchaseOffersItems;
  v173 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v172, "countByEnumeratingWithState:objects:count:", &v180, v200, 16);
  if (v173)
  {
    v174 = v173;
    v175 = *(_QWORD *)v181;
    do
    {
      for (n = 0; n != v174; ++n)
      {
        if (*(_QWORD *)v181 != v175)
          objc_enumerationMutation(v172);
        v177 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v180 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v180);
        objc_msgSend((id)v6, "addPurchaseOffersItem:", v177);

      }
      v174 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v172, "countByEnumeratingWithState:objects:count:", &v180, v200, 16);
    }
    while (v174);
  }

  v178 = (id)v6;
  return v178;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  NSString *articleId;
  NSString *referencedArticleId;
  uint64_t has;
  uint64_t v9;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  uint64_t v12;
  uint64_t v13;
  NSData *feedViewExposureId;
  int v15;
  uint64_t v16;
  NSString *feedPresentationReasonSearchString;
  uint64_t v18;
  NSString *parentFeedId;
  int v20;
  uint64_t v21;
  NSString *sourceBinId;
  uint64_t v23;
  NSString *sourceChannelId;
  NSString *viewFrameInScreen;
  uint64_t v26;
  NSString *language;
  NSMutableArray *namedEntities;
  uint64_t v29;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  NSString *referringSourceApplication;
  NSString *referringUrl;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  NSString *storyType;
  uint64_t v41;
  NSString *userActivityType;
  NSString *groupFeedId;
  uint64_t v44;
  int v45;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  int v49;
  uint64_t v50;
  int v51;
  NSString *notificationId;
  uint64_t v53;
  NSString *nextArticleAffordanceTypeFeedId;
  uint64_t v55;
  NSString *previousArticleId;
  uint64_t v57;
  NSMutableArray *fractionalCohortMemberships;
  int v59;
  uint64_t v60;
  NSString *nativeCampaignData;
  NSString *previousArticleVersion;
  NSString *anfComponentId;
  uint64_t v64;
  uint64_t v65;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement *widgetEngagement;
  uint64_t v67;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  uint64_t v71;
  uint64_t v72;
  NSData *moduleExposureId;
  NSString *previousWebEmbedId;
  uint64_t v75;
  NSMutableArray *surfacedByTagIds;
  NSString *iadNativeCampaignAd;
  uint64_t v78;
  uint64_t v79;
  NSString *exposedInLocationId;
  NSData *groupViewExposureId;
  NSString *exposedGroupSourceChannelId;
  uint64_t v83;
  uint64_t v84;
  __int16 v85;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline *alternateHeadline;
  uint64_t v87;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData *issueData;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData *issueExposureData;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData *issueViewData;
  uint64_t v91;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData *channelData;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData *issueViewContextData;
  uint64_t v94;
  NSString *webEmbedId;
  NSString *curatedBatchId;
  __int16 v97;
  __int16 v98;
  NSMutableArray *topicIds;
  NSMutableArray *purchaseOffersItems;
  char v101;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_633;
  v5 = *(_QWORD *)(v4 + 812);
  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
  {
    if ((v5 & 0x20000) == 0 || self->_articleHostViewType != *((_DWORD *)v4 + 39))
      goto LABEL_633;
  }
  else if ((v5 & 0x20000) != 0)
  {
    goto LABEL_633;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 20) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_633;
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 77))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_633;
  }
  has = (uint64_t)self->_has;
  v9 = *(_QWORD *)(v4 + 812);
  if ((has & 0x10000000000000) != 0)
  {
    if ((v9 & 0x10000000000000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 149))
      goto LABEL_633;
  }
  else if ((v9 & 0x10000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 50))
      goto LABEL_633;
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_633;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 21)
    && !-[NSData isEqual:](articleSessionId, "isEqual:"))
  {
    goto LABEL_633;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 24))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_633;
  }
  v12 = (uint64_t)self->_has;
  v13 = *(_QWORD *)(v4 + 812);
  if ((v12 & 0x10000000) != 0)
  {
    if ((v13 & 0x10000000) == 0 || self->_displayRank != *((_DWORD *)v4 + 69))
      goto LABEL_633;
  }
  else if ((v13 & 0x10000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v12 & 0x100000) != 0)
  {
    if ((v13 & 0x100000) == 0 || self->_articleViewPresentationReason != *((_DWORD *)v4 + 46))
      goto LABEL_633;
  }
  else if ((v13 & 0x100000) != 0)
  {
    goto LABEL_633;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 41))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_633;
    v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v12 = (uint64_t)self->_has;
  }
  else
  {
    v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  }
  v16 = *(_QWORD *)(v4 + 812);
  if ((v12 & 0x80000000) != 0)
  {
    if ((v16 & 0x80000000) == 0 || self->_feedPresentationReason != *((_DWORD *)v4 + 76))
      goto LABEL_633;
  }
  else if ((v16 & 0x80000000) != 0)
  {
    goto LABEL_633;
  }
  feedPresentationReasonSearchString = self->_feedPresentationReasonSearchString;
  if ((unint64_t)feedPresentationReasonSearchString | *((_QWORD *)v4 + 39))
  {
    if (!-[NSString isEqual:](feedPresentationReasonSearchString, "isEqual:"))
      goto LABEL_633;
    v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v12 = (uint64_t)self->_has;
  }
  v18 = *(_QWORD *)(v4 + 812);
  if ((v12 & 0x40000000) != 0)
  {
    if ((v18 & 0x40000000) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 75))
      goto LABEL_633;
  }
  else if ((v18 & 0x40000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v12 & 0x2000000000000) != 0)
  {
    if ((v18 & 0x2000000000000) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 140))
      goto LABEL_633;
  }
  else if ((v18 & 0x2000000000000) != 0)
  {
    goto LABEL_633;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((_QWORD *)v4 + 69))
  {
    if (!-[NSString isEqual:](parentFeedId, "isEqual:"))
      goto LABEL_633;
    v15 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v12 = (uint64_t)self->_has;
  }
  v20 = *((unsigned __int16 *)v4 + 410) | (v4[822] << 16);
  v21 = *(_QWORD *)(v4 + 812);
  if ((v15 & 0x80000) != 0)
  {
    if ((v20 & 0x80000) == 0)
      goto LABEL_633;
    if (self->_isUserSubscribedToParentFeed)
    {
      if (!v4[806])
        goto LABEL_633;
    }
    else if (v4[806])
    {
      goto LABEL_633;
    }
  }
  else if ((v20 & 0x80000) != 0)
  {
    goto LABEL_633;
  }
  if ((v12 & 0x8000) != 0)
  {
    if ((v21 & 0x8000) == 0 || self->_activeTimeSpent != *((_DWORD *)v4 + 32))
      goto LABEL_633;
  }
  else if ((v21 & 0x8000) != 0)
  {
    goto LABEL_633;
  }
  if ((v12 & 0x20000000000) != 0)
  {
    if ((v21 & 0x20000000000) == 0 || self->_maxActiveTimeSpent != *((_DWORD *)v4 + 117))
      goto LABEL_633;
  }
  else if ((v21 & 0x20000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v15 & 1) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 1) == 0)
      goto LABEL_633;
    if (self->_didBounce)
    {
      if (!v4[787])
        goto LABEL_633;
    }
    else if (v4[787])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 1) != 0)
  {
    goto LABEL_633;
  }
  if ((v15 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x1000) == 0)
      goto LABEL_633;
    if (self->_isNewUserToArticle)
    {
      if (!v4[799])
        goto LABEL_633;
    }
    else if (v4[799])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x1000) != 0)
  {
    goto LABEL_633;
  }
  if ((v15 & 4) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 4) == 0)
      goto LABEL_633;
    if (self->_didOpenInSafari)
    {
      if (!v4[789])
        goto LABEL_633;
    }
    else if (v4[789])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 4) != 0)
  {
    goto LABEL_633;
  }
  if ((v15 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x100) == 0)
      goto LABEL_633;
    if (self->_isExplorationArticle)
    {
      if (!v4[795])
        goto LABEL_633;
    }
    else if (v4[795])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x100) != 0)
  {
    goto LABEL_633;
  }
  sourceBinId = self->_sourceBinId;
  if ((unint64_t)sourceBinId | *((_QWORD *)v4 + 82))
  {
    if (!-[NSString isEqual:](sourceBinId, "isEqual:"))
      goto LABEL_633;
    v12 = (uint64_t)self->_has;
  }
  v23 = *(_QWORD *)(v4 + 812);
  if ((v12 & 0x2000000000000000) != 0)
  {
    if ((v23 & 0x2000000000000000) == 0)
      goto LABEL_633;
    if (self->_adSupportedChannel)
    {
      if (!v4[784])
        goto LABEL_633;
    }
    else if (v4[784])
    {
      goto LABEL_633;
    }
  }
  else if ((v23 & 0x2000000000000000) != 0)
  {
    goto LABEL_633;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 83)
    && !-[NSString isEqual:](sourceChannelId, "isEqual:"))
  {
    goto LABEL_633;
  }
  viewFrameInScreen = self->_viewFrameInScreen;
  if ((unint64_t)viewFrameInScreen | *((_QWORD *)v4 + 93))
  {
    if (!-[NSString isEqual:](viewFrameInScreen, "isEqual:"))
      goto LABEL_633;
  }
  v26 = *(_QWORD *)(v4 + 812);
  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
  {
    if ((v26 & 0x1000000) == 0 || self->_characterCount != *((_DWORD *)v4 + 60))
      goto LABEL_633;
  }
  else if ((v26 & 0x1000000) != 0)
  {
    goto LABEL_633;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 57) && !-[NSString isEqual:](language, "isEqual:"))
    goto LABEL_633;
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 63))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_633;
  }
  v29 = *(_QWORD *)(v4 + 812);
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
    if ((v29 & 0x80000) == 0 || self->_articleType != *((_DWORD *)v4 + 45))
      goto LABEL_633;
  }
  else if ((v29 & 0x80000) != 0)
  {
    goto LABEL_633;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 85)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_633;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 86))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_633;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 88))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_633;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 81))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_633;
  }
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((_QWORD *)v4 + 78))
  {
    if (!-[NSString isEqual:](referringSourceApplication, "isEqual:"))
      goto LABEL_633;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((_QWORD *)v4 + 79))
  {
    if (!-[NSString isEqual:](referringUrl, "isEqual:"))
      goto LABEL_633;
  }
  v36 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v37 = (uint64_t)self->_has;
  v38 = *((unsigned __int16 *)v4 + 410) | (v4[822] << 16);
  v39 = *(_QWORD *)(v4 + 812);
  if ((*((_WORD *)&self->_has + 4) & 0x80) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x80) == 0)
      goto LABEL_633;
    if (self->_isDigitalReplicaAd)
    {
      if (!v4[794])
        goto LABEL_633;
    }
    else if (v4[794])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x80) != 0)
  {
    goto LABEL_633;
  }
  if ((v37 & 0x4000000000000) != 0)
  {
    if ((v39 & 0x4000000000000) == 0 || self->_previousArticleHostViewTypeIfSwipe != *((_DWORD *)v4 + 141))
      goto LABEL_633;
  }
  else if ((v39 & 0x4000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v36 & 0x100000) != 0)
  {
    if ((v38 & 0x100000) == 0)
      goto LABEL_633;
    if (self->_isVideoInFeed)
    {
      if (!v4[807])
        goto LABEL_633;
    }
    else if (v4[807])
    {
      goto LABEL_633;
    }
  }
  else if ((v38 & 0x100000) != 0)
  {
    goto LABEL_633;
  }
  if ((v36 & 0x40000) != 0)
  {
    if ((v38 & 0x40000) == 0)
      goto LABEL_633;
    if (self->_isTopStoryArticle)
    {
      if (!v4[805])
        goto LABEL_633;
    }
    else if (v4[805])
    {
      goto LABEL_633;
    }
  }
  else if ((v38 & 0x40000) != 0)
  {
    goto LABEL_633;
  }
  storyType = self->_storyType;
  if ((unint64_t)storyType | *((_QWORD *)v4 + 84))
  {
    if (!-[NSString isEqual:](storyType, "isEqual:"))
      goto LABEL_633;
    v36 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v37 = (uint64_t)self->_has;
  }
  v41 = *(_QWORD *)(v4 + 812);
  if ((v37 & 0x400) != 0)
  {
    if ((v41 & 0x400) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 11))
      goto LABEL_633;
  }
  else if ((v41 & 0x400) != 0)
  {
    goto LABEL_633;
  }
  userActivityType = self->_userActivityType;
  if ((unint64_t)userActivityType | *((_QWORD *)v4 + 92))
  {
    if (!-[NSString isEqual:](userActivityType, "isEqual:"))
      goto LABEL_633;
    v36 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v37 = (uint64_t)self->_has;
  }
  if ((v36 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x400) == 0)
      goto LABEL_633;
    if (self->_isGroupedArticle)
    {
      if (!v4[797])
        goto LABEL_633;
    }
    else if (v4[797])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x400) != 0)
  {
    goto LABEL_633;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_633;
    v36 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v37 = (uint64_t)self->_has;
  }
  v44 = *(_QWORD *)(v4 + 812);
  if ((v37 & 0x4000000000) != 0)
  {
    if ((v44 & 0x4000000000) == 0 || self->_groupType != *((_DWORD *)v4 + 93))
      goto LABEL_633;
  }
  else if ((v44 & 0x4000000000) != 0)
  {
    goto LABEL_633;
  }
  v45 = *((unsigned __int16 *)v4 + 410) | (v4[822] << 16);
  if ((v36 & 0x10000) != 0)
  {
    if ((v45 & 0x10000) == 0)
      goto LABEL_633;
    if (self->_isSubscribedToGroupFeed)
    {
      if (!v4[803])
        goto LABEL_633;
    }
    else if (v4[803])
    {
      goto LABEL_633;
    }
  }
  else if ((v45 & 0x10000) != 0)
  {
    goto LABEL_633;
  }
  if ((v37 & 0x10000) != 0)
  {
    if ((v44 & 0x10000) == 0 || self->_articleDisplayRankInGroup != *((_DWORD *)v4 + 38))
      goto LABEL_633;
  }
  else if ((v44 & 0x10000) != 0)
  {
    goto LABEL_633;
  }
  if ((v36 & 0x200000) != 0)
  {
    if ((v45 & 0x200000) == 0)
      goto LABEL_633;
    if (self->_subscriptionOnlyArticle)
    {
      if (!v4[808])
        goto LABEL_633;
    }
    else if (v4[808])
    {
      goto LABEL_633;
    }
  }
  else if ((v45 & 0x200000) != 0)
  {
    goto LABEL_633;
  }
  if ((v36 & 0x8000) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x8000) == 0)
      goto LABEL_633;
    if (self->_isSharedSubscriptionOnlyArticle)
    {
      if (!v4[802])
        goto LABEL_633;
    }
    else if (v4[802])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x8000) != 0)
  {
    goto LABEL_633;
  }
  if ((v36 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x200) == 0)
      goto LABEL_633;
    if (self->_isFreeArticle)
    {
      if (!v4[796])
        goto LABEL_633;
    }
    else if (v4[796])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x200) != 0)
  {
    goto LABEL_633;
  }
  if ((v36 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x2000) == 0)
      goto LABEL_633;
    if (self->_isPaidSubscriberToFeed)
    {
      if (!v4[800])
        goto LABEL_633;
    }
    else if (v4[800])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x2000) != 0)
  {
    goto LABEL_633;
  }
  if ((v36 & 0x40) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x40) == 0)
      goto LABEL_633;
    if (self->_isCoverArticle)
    {
      if (!v4[793])
        goto LABEL_633;
    }
    else if (v4[793])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x40) != 0)
  {
    goto LABEL_633;
  }
  if ((v37 & 0x2000000) != 0)
  {
    if ((v44 & 0x2000000) == 0 || self->_coverArticleDisplayRank != *((_DWORD *)v4 + 61))
      goto LABEL_633;
  }
  else if ((v44 & 0x2000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v37 & 0x4000000) != 0)
  {
    if ((v44 & 0x4000000) == 0 || self->_coverArticleFeatureType != *((_DWORD *)v4 + 62))
      goto LABEL_633;
  }
  else if ((v44 & 0x4000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v37 & 0x1000000000000) != 0)
  {
    if ((v44 & 0x1000000000000) == 0 || self->_paidSubscriberToFeedType != *((_DWORD *)v4 + 136))
      goto LABEL_633;
  }
  else if ((v44 & 0x1000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v36 & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x4000) == 0)
      goto LABEL_633;
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!v4[801])
        goto LABEL_633;
    }
    else if (v4[801])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x4000) != 0)
  {
    goto LABEL_633;
  }
  if ((v37 & 0x40000000000) != 0)
  {
    if ((v44 & 0x40000000000) == 0 || self->_maxVerticalScrollPositionEnding != *((float *)v4 + 118))
      goto LABEL_633;
  }
  else if ((v44 & 0x40000000000) != 0)
  {
    goto LABEL_633;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 27)
    && !-[NSString isEqual:](campaignId, "isEqual:"))
  {
    goto LABEL_633;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_633;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_633;
  }
  v49 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v50 = (uint64_t)self->_has;
  v51 = *((unsigned __int16 *)v4 + 410) | (v4[822] << 16);
  if ((v49 & 0x400000) != 0)
  {
    if ((v51 & 0x400000) == 0)
      goto LABEL_633;
    if (self->_viewFromNotificationDirectOpen)
    {
      if (!v4[809])
        goto LABEL_633;
    }
    else if (v4[809])
    {
      goto LABEL_633;
    }
  }
  else if ((v51 & 0x400000) != 0)
  {
    goto LABEL_633;
  }
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((_QWORD *)v4 + 67))
  {
    if (!-[NSString isEqual:](notificationId, "isEqual:"))
      goto LABEL_633;
    v49 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v50 = (uint64_t)self->_has;
  }
  v53 = *(_QWORD *)(v4 + 812);
  if ((v50 & 0x800000000000) != 0)
  {
    if ((v53 & 0x800000000000) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 130))
      goto LABEL_633;
  }
  else if ((v53 & 0x800000000000) != 0)
  {
    goto LABEL_633;
  }
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if ((unint64_t)nextArticleAffordanceTypeFeedId | *((_QWORD *)v4 + 66))
  {
    if (!-[NSString isEqual:](nextArticleAffordanceTypeFeedId, "isEqual:"))
      goto LABEL_633;
    v49 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v50 = (uint64_t)self->_has;
  }
  v55 = *(_QWORD *)(v4 + 812);
  if ((v50 & 0x200000000) != 0)
  {
    if ((v55 & 0x200000000) == 0 || self->_groupArticleCountInForYou != *((_DWORD *)v4 + 86))
      goto LABEL_633;
  }
  else if ((v55 & 0x200000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x400000000) != 0)
  {
    if ((v55 & 0x400000000) == 0 || self->_groupDisplayRankInForYou != *((_DWORD *)v4 + 87))
      goto LABEL_633;
  }
  else if ((v55 & 0x400000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x4000000000000000) != 0)
  {
    if ((v55 & 0x4000000000000000) == 0)
      goto LABEL_633;
    if (self->_articleLoaded)
    {
      if (!v4[785])
        goto LABEL_633;
    }
    else if (v4[785])
    {
      goto LABEL_633;
    }
  }
  else if ((v55 & 0x4000000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x10000000000) != 0)
  {
    if ((v55 & 0x10000000000) == 0 || self->_loadFailureReason != *((_DWORD *)v4 + 116))
      goto LABEL_633;
  }
  else if ((v55 & 0x10000000000) != 0)
  {
    goto LABEL_633;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 71))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_633;
    v49 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v50 = (uint64_t)self->_has;
  }
  v57 = *(_QWORD *)(v4 + 812);
  if ((v50 & 0x800000000000000) != 0)
  {
    if ((v57 & 0x800000000000000) == 0 || self->_widgetSection != *((_DWORD *)v4 + 194))
      goto LABEL_633;
  }
  else if ((v57 & 0x800000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x1000000000000000) != 0)
  {
    if ((v57 & 0x1000000000000000) == 0 || self->_widgetSectionArticleRank != *((_DWORD *)v4 + 195))
      goto LABEL_633;
  }
  else if ((v57 & 0x1000000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x400000000000000) != 0)
  {
    if ((v57 & 0x400000000000000) == 0 || self->_widgetArticleRank != *((_DWORD *)v4 + 190))
      goto LABEL_633;
  }
  else if ((v57 & 0x400000000000000) != 0)
  {
    goto LABEL_633;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 42))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
      goto LABEL_633;
    v49 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
    v50 = (uint64_t)self->_has;
  }
  v59 = *((unsigned __int16 *)v4 + 410) | (v4[822] << 16);
  v60 = *(_QWORD *)(v4 + 812);
  if ((v49 & 0x20) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x20) == 0)
      goto LABEL_633;
    if (self->_isBreakingNewsArticle)
    {
      if (!v4[792])
        goto LABEL_633;
    }
    else if (v4[792])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x20) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x800000) != 0)
  {
    if ((v60 & 0x800000) == 0 || self->_breakingNewsArticlePosition != *((_DWORD *)v4 + 52))
      goto LABEL_633;
  }
  else if ((v60 & 0x800000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x400000) != 0)
  {
    if ((v60 & 0x400000) == 0 || self->_breakingNewsArticleCount != *((_DWORD *)v4 + 51))
      goto LABEL_633;
  }
  else if ((v60 & 0x400000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x200000000000000) != 0)
  {
    if ((v60 & 0x200000000000000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 180))
      goto LABEL_633;
  }
  else if ((v60 & 0x200000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x80000000000000) != 0)
  {
    if ((v60 & 0x80000000000000) == 0 || self->_topStoryMandatoryArticleCount != *((_DWORD *)v4 + 178))
      goto LABEL_633;
  }
  else if ((v60 & 0x80000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x100000000000000) != 0)
  {
    if ((v60 & 0x100000000000000) == 0 || self->_topStoryOptionalArticleCount != *((_DWORD *)v4 + 179))
      goto LABEL_633;
  }
  else if ((v60 & 0x100000000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x2000000000) != 0)
  {
    if ((v60 & 0x2000000000) == 0 || self->_groupPresentationReason != *((_DWORD *)v4 + 92))
      goto LABEL_633;
  }
  else if ((v60 & 0x2000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v50 & 0x200) != 0)
  {
    if ((v60 & 0x200) == 0 || self->_personalizationScore != *((double *)v4 + 10))
      goto LABEL_633;
  }
  else if ((v60 & 0x200) != 0)
  {
    goto LABEL_633;
  }
  if ((v49 & 0x20000) != 0)
  {
    if ((v59 & 0x20000) == 0)
      goto LABEL_633;
    if (self->_isSubscribedToSourceChannel)
    {
      if (!v4[804])
        goto LABEL_633;
    }
    else if (v4[804])
    {
      goto LABEL_633;
    }
  }
  else if ((v59 & 0x20000) != 0)
  {
    goto LABEL_633;
  }
  if ((v49 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 410) & 0x800) == 0)
      goto LABEL_633;
    if (self->_isNativeAd)
    {
      if (!v4[798])
        goto LABEL_633;
    }
    else if (v4[798])
    {
      goto LABEL_633;
    }
  }
  else if ((*((_WORD *)v4 + 410) & 0x800) != 0)
  {
    goto LABEL_633;
  }
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((_QWORD *)v4 + 64)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_633;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 72))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_633;
  }
  anfComponentId = self->_anfComponentId;
  if ((unint64_t)anfComponentId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](anfComponentId, "isEqual:"))
      goto LABEL_633;
  }
  v64 = (uint64_t)self->_has;
  v65 = *(_QWORD *)(v4 + 812);
  if (v64 < 0)
  {
    if ((v65 & 0x8000000000000000) == 0)
      goto LABEL_633;
    if (self->_badgeExposure)
    {
      if (!v4[786])
        goto LABEL_633;
    }
    else if (v4[786])
    {
      goto LABEL_633;
    }
  }
  else if (v65 < 0)
  {
    goto LABEL_633;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((_QWORD *)v4 + 96))
  {
    if (!-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
      goto LABEL_633;
    v64 = (uint64_t)self->_has;
  }
  v67 = *(_QWORD *)(v4 + 812);
  if ((v64 & 0x1000) != 0)
  {
    if ((v67 & 0x1000) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 13))
      goto LABEL_633;
  }
  else if ((v67 & 0x1000) != 0)
  {
    goto LABEL_633;
  }
  if ((v64 & 8) != 0)
  {
    if ((v67 & 8) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 4))
      goto LABEL_633;
  }
  else if ((v67 & 8) != 0)
  {
    goto LABEL_633;
  }
  if ((v64 & 0x100000000) != 0)
  {
    if ((v67 & 0x100000000) == 0 || self->_feedSubscriptionOrigin != *((_DWORD *)v4 + 80))
      goto LABEL_633;
  }
  else if ((v67 & 0x100000000) != 0)
  {
    goto LABEL_633;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((_QWORD *)v4 + 50)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_633;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((_QWORD *)v4 + 52))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:"))
      goto LABEL_633;
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((_QWORD *)v4 + 49))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:"))
      goto LABEL_633;
  }
  v71 = (uint64_t)self->_has;
  v72 = *(_QWORD *)(v4 + 812);
  if ((v71 & 0x800) != 0)
  {
    if ((v72 & 0x800) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 12))
      goto LABEL_633;
  }
  else if ((v72 & 0x800) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x800000000) != 0)
  {
    if ((v72 & 0x800000000) == 0 || self->_groupFormationReason != *((_DWORD *)v4 + 90))
      goto LABEL_633;
  }
  else if ((v72 & 0x800000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x20000000) != 0)
  {
    if ((v72 & 0x20000000) == 0 || self->_feedAutoSubscribeType != *((_DWORD *)v4 + 74))
      goto LABEL_633;
  }
  else if ((v72 & 0x20000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x40) != 0)
  {
    if ((v72 & 0x40) == 0 || self->_featureCtr != *((double *)v4 + 7))
      goto LABEL_633;
  }
  else if ((v72 & 0x40) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x100) != 0)
  {
    if ((v72 & 0x100) == 0 || self->_paidNonpaidSubscriptionCtr != *((double *)v4 + 9))
      goto LABEL_633;
  }
  else if ((v72 & 0x100) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 4) != 0)
  {
    if ((v72 & 4) == 0 || self->_autoSubscribeCtr != *((double *)v4 + 3))
      goto LABEL_633;
  }
  else if ((v72 & 4) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x10) != 0)
  {
    if ((v72 & 0x10) == 0 || self->_computedGlobalScoreCoefficient != *((double *)v4 + 5))
      goto LABEL_633;
  }
  else if ((v72 & 0x10) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x80) != 0)
  {
    if ((v72 & 0x80) == 0 || self->_globalScore != *((double *)v4 + 8))
      goto LABEL_633;
  }
  else if ((v72 & 0x80) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x4000) != 0)
  {
    if ((v72 & 0x4000) == 0 || self->_userFeedbackScore != *((double *)v4 + 15))
      goto LABEL_633;
  }
  else if ((v72 & 0x4000) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 2) != 0)
  {
    if ((v72 & 2) == 0 || self->_agedUserFeedbackScore != *((double *)v4 + 2))
      goto LABEL_633;
  }
  else if ((v72 & 2) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 1) != 0)
  {
    if ((v72 & 1) == 0 || self->_agedPersonalizationScore != *((double *)v4 + 1))
      goto LABEL_633;
  }
  else if ((v72 & 1) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x20) != 0)
  {
    if ((v72 & 0x20) == 0 || self->_diversifiedPersonalizationScore != *((double *)v4 + 6))
      goto LABEL_633;
  }
  else if ((v72 & 0x20) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x80000000000) != 0)
  {
    if ((v72 & 0x80000000000) == 0 || self->_moduleEventType != *((_DWORD *)v4 + 119))
      goto LABEL_633;
  }
  else if ((v72 & 0x80000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x400000000000) != 0)
  {
    if ((v72 & 0x400000000000) == 0 || self->_moduleLocation != *((_DWORD *)v4 + 124))
      goto LABEL_633;
  }
  else if ((v72 & 0x400000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x100000000000) != 0)
  {
    if ((v72 & 0x100000000000) == 0 || self->_moduleItemCount != *((_DWORD *)v4 + 122))
      goto LABEL_633;
  }
  else if ((v72 & 0x100000000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v71 & 0x200000000000) != 0)
  {
    if ((v72 & 0x200000000000) == 0 || self->_moduleItemPosition != *((_DWORD *)v4 + 123))
      goto LABEL_633;
  }
  else if ((v72 & 0x200000000000) != 0)
  {
    goto LABEL_633;
  }
  moduleExposureId = self->_moduleExposureId;
  if ((unint64_t)moduleExposureId | *((_QWORD *)v4 + 60)
    && !-[NSData isEqual:](moduleExposureId, "isEqual:"))
  {
    goto LABEL_633;
  }
  previousWebEmbedId = self->_previousWebEmbedId;
  if ((unint64_t)previousWebEmbedId | *((_QWORD *)v4 + 73))
  {
    if (!-[NSString isEqual:](previousWebEmbedId, "isEqual:"))
      goto LABEL_633;
  }
  v75 = *(_QWORD *)(v4 + 812);
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
  {
    if ((v75 & 0x8000000000000) == 0 || self->_previousWebEmbedLocation != *((_DWORD *)v4 + 148))
      goto LABEL_633;
  }
  else if ((v75 & 0x8000000000000) != 0)
  {
    goto LABEL_633;
  }
  surfacedByTagIds = self->_surfacedByTagIds;
  if ((unint64_t)surfacedByTagIds | *((_QWORD *)v4 + 87)
    && !-[NSMutableArray isEqual:](surfacedByTagIds, "isEqual:"))
  {
    goto LABEL_633;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
      goto LABEL_633;
  }
  v78 = (uint64_t)self->_has;
  v79 = *(_QWORD *)(v4 + 812);
  if ((v78 & 0x8000000) != 0)
  {
    if ((v79 & 0x8000000) == 0 || self->_curatedContentType != *((_DWORD *)v4 + 68))
      goto LABEL_633;
  }
  else if ((v79 & 0x8000000) != 0)
  {
    goto LABEL_633;
  }
  if ((v78 & 0x1000000000) != 0)
  {
    if ((v79 & 0x1000000000) == 0 || self->_groupLocation != *((_DWORD *)v4 + 91))
      goto LABEL_633;
  }
  else if ((v79 & 0x1000000000) != 0)
  {
    goto LABEL_633;
  }
  exposedInLocationId = self->_exposedInLocationId;
  if ((unint64_t)exposedInLocationId | *((_QWORD *)v4 + 36)
    && !-[NSString isEqual:](exposedInLocationId, "isEqual:"))
  {
    goto LABEL_633;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 47))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_633;
  }
  exposedGroupSourceChannelId = self->_exposedGroupSourceChannelId;
  if ((unint64_t)exposedGroupSourceChannelId | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](exposedGroupSourceChannelId, "isEqual:"))
      goto LABEL_633;
  }
  v83 = (uint64_t)self->_has;
  v84 = *(_QWORD *)(v4 + 812);
  if ((v83 & 0x40000) != 0)
  {
    if ((v84 & 0x40000) == 0 || self->_articleSuggestionOrigin != *((_DWORD *)v4 + 44))
      goto LABEL_633;
  }
  else if ((v84 & 0x40000) != 0)
  {
    goto LABEL_633;
  }
  v85 = *((_WORD *)v4 + 410);
  if ((*((_WORD *)&self->_has + 4) & 2) != 0)
  {
    if ((v85 & 2) == 0)
      goto LABEL_633;
    if (self->_didExpandDuringView)
    {
      if (!v4[788])
        goto LABEL_633;
    }
    else if (v4[788])
    {
      goto LABEL_633;
    }
  }
  else if ((v85 & 2) != 0)
  {
    goto LABEL_633;
  }
  if ((v83 & 0x2000) != 0)
  {
    if ((v84 & 0x2000) == 0 || self->_subscribedChannelCtr != *((double *)v4 + 14))
      goto LABEL_633;
  }
  else if ((v84 & 0x2000) != 0)
  {
    goto LABEL_633;
  }
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((_QWORD *)v4 + 17))
  {
    if (!-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline isEqual:](alternateHeadline, "isEqual:"))
      goto LABEL_633;
    v83 = (uint64_t)self->_has;
  }
  v87 = *(_QWORD *)(v4 + 812);
  if ((v83 & 0x20000000000000) != 0)
  {
    if ((v87 & 0x20000000000000) == 0 || self->_rankInVideoPlaylist != *((_DWORD *)v4 + 152))
      goto LABEL_633;
  }
  else if ((v87 & 0x20000000000000) != 0)
  {
    goto LABEL_633;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 53)
    && !-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData isEqual:](issueData, "isEqual:"))
  {
    goto LABEL_633;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 54))
  {
    if (!-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_633;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 56))
  {
    if (!-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_633;
  }
  v91 = *(_QWORD *)(v4 + 812);
  if ((*(_QWORD *)&self->_has & 0x40000000000000) != 0)
  {
    if ((v91 & 0x40000000000000) == 0 || self->_role != *((_DWORD *)v4 + 160))
      goto LABEL_633;
  }
  else if ((v91 & 0x40000000000000) != 0)
  {
    goto LABEL_633;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((_QWORD *)v4 + 29)
    && !-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData isEqual:](channelData, "isEqual:"))
  {
    goto LABEL_633;
  }
  issueViewContextData = self->_issueViewContextData;
  if ((unint64_t)issueViewContextData | *((_QWORD *)v4 + 55))
  {
    if (!-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData isEqual:](issueViewContextData, "isEqual:"))
      goto LABEL_633;
  }
  v94 = *(_QWORD *)(v4 + 812);
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
  {
    if ((v94 & 0x8000000000) == 0 || self->_heroArticleType != *((_DWORD *)v4 + 96))
      goto LABEL_633;
  }
  else if ((v94 & 0x8000000000) != 0)
  {
    goto LABEL_633;
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((_QWORD *)v4 + 94)
    && !-[NSString isEqual:](webEmbedId, "isEqual:"))
  {
    goto LABEL_633;
  }
  curatedBatchId = self->_curatedBatchId;
  if ((unint64_t)curatedBatchId | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](curatedBatchId, "isEqual:"))
      goto LABEL_633;
  }
  v97 = *((_WORD *)&self->_has + 4);
  v98 = *((_WORD *)v4 + 410);
  if ((v97 & 8) != 0)
  {
    if ((v98 & 8) == 0)
      goto LABEL_633;
    if (self->_isAudioEligible)
    {
      if (!v4[790])
        goto LABEL_633;
    }
    else if (v4[790])
    {
      goto LABEL_633;
    }
  }
  else if ((v98 & 8) != 0)
  {
    goto LABEL_633;
  }
  if ((v97 & 0x10) == 0)
  {
    if ((v98 & 0x10) == 0)
      goto LABEL_629;
LABEL_633:
    v101 = 0;
    goto LABEL_634;
  }
  if ((v98 & 0x10) == 0)
    goto LABEL_633;
  if (self->_isAudioEngaged)
  {
    if (!v4[791])
      goto LABEL_633;
  }
  else if (v4[791])
  {
    goto LABEL_633;
  }
LABEL_629:
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 91)
    && !-[NSMutableArray isEqual:](topicIds, "isEqual:"))
  {
    goto LABEL_633;
  }
  purchaseOffersItems = self->_purchaseOffersItems;
  if ((unint64_t)purchaseOffersItems | *((_QWORD *)v4 + 75))
    v101 = -[NSMutableArray isEqual:](purchaseOffersItems, "isEqual:");
  else
    v101 = 1;
LABEL_634:

  return v101;
}

- (unint64_t)hash
{
  uint64_t has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  $C23011C766481CAA0C62272794C1DCF4 *p_has;
  int v11;
  uint64_t v12;
  float maxVerticalScrollPositionEnding;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  double personalizationScore;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double featureCtr;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  double paidNonpaidSubscriptionCtr;
  double v37;
  long double v38;
  double v39;
  unint64_t v40;
  double autoSubscribeCtr;
  double v42;
  long double v43;
  double v44;
  unint64_t v45;
  double computedGlobalScoreCoefficient;
  double v47;
  long double v48;
  double v49;
  unint64_t v50;
  double globalScore;
  double v52;
  long double v53;
  double v54;
  unint64_t v55;
  double userFeedbackScore;
  double v57;
  long double v58;
  double v59;
  double agedUserFeedbackScore;
  double v61;
  long double v62;
  double v63;
  unint64_t v64;
  unint64_t v65;
  double agedPersonalizationScore;
  double v67;
  long double v68;
  double v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  double diversifiedPersonalizationScore;
  double v74;
  long double v75;
  double v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  double subscribedChannelCtr;
  double v81;
  long double v82;
  double v83;
  unint64_t v84;
  uint64_t v85;
  NSUInteger v86;
  NSUInteger v87;
  uint64_t v88;
  uint64_t v89;
  NSUInteger v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSUInteger v106;
  uint64_t v107;
  NSUInteger v108;
  uint64_t v109;
  uint64_t v110;
  NSUInteger v111;
  uint64_t v112;
  uint64_t v113;
  NSUInteger v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSUInteger v125;
  NSUInteger v126;
  NSUInteger v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  NSUInteger v133;
  NSUInteger v134;
  NSUInteger v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSUInteger v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  NSUInteger v155;
  uint64_t v156;
  NSUInteger v157;
  uint64_t v158;
  NSUInteger v159;
  NSUInteger v160;
  NSUInteger v161;
  unint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  NSUInteger v175;
  uint64_t v176;
  NSUInteger v177;
  uint64_t v178;
  NSUInteger v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  NSUInteger v184;
  NSUInteger v185;
  NSUInteger v186;
  NSUInteger v187;
  NSUInteger v188;
  NSUInteger v189;
  uint64_t v190;
  uint64_t v191;
  NSUInteger v192;
  uint64_t v193;
  NSUInteger v194;
  NSUInteger v195;
  uint64_t v196;
  NSUInteger v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  NSUInteger v205;
  uint64_t v206;
  uint64_t v207;
  NSUInteger v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  NSUInteger v217;
  NSUInteger v218;
  uint64_t v219;
  unint64_t v220;
  unint64_t v221;

  if ((*(_QWORD *)&self->_has & 0x20000) != 0)
    v219 = 2654435761 * self->_articleHostViewType;
  else
    v219 = 0;
  v218 = -[NSString hash](self->_articleId, "hash");
  v217 = -[NSString hash](self->_referencedArticleId, "hash");
  has = (uint64_t)self->_has;
  if ((has & 0x10000000000000) != 0)
  {
    v216 = 2654435761 * self->_publisherArticleVersion;
    if ((has & 0x200000) != 0)
      goto LABEL_6;
  }
  else
  {
    v216 = 0;
    if ((has & 0x200000) != 0)
    {
LABEL_6:
      v215 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_9;
    }
  }
  v215 = 0;
LABEL_9:
  v214 = -[NSData hash](self->_articleSessionId, "hash");
  v213 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v4 = (uint64_t)self->_has;
  if ((v4 & 0x10000000) != 0)
  {
    v212 = 2654435761 * self->_displayRank;
    if ((v4 & 0x100000) != 0)
      goto LABEL_11;
  }
  else
  {
    v212 = 0;
    if ((v4 & 0x100000) != 0)
    {
LABEL_11:
      v211 = 2654435761 * self->_articleViewPresentationReason;
      goto LABEL_14;
    }
  }
  v211 = 0;
LABEL_14:
  v210 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_DWORD *)&self->_has & 0x80000000) != 0)
    v209 = 2654435761 * self->_feedPresentationReason;
  else
    v209 = 0;
  v208 = -[NSString hash](self->_feedPresentationReasonSearchString, "hash");
  v5 = (uint64_t)self->_has;
  if ((v5 & 0x40000000) != 0)
  {
    v207 = 2654435761 * self->_feedCellHostType;
    if ((v5 & 0x2000000000000) != 0)
      goto LABEL_19;
  }
  else
  {
    v207 = 0;
    if ((v5 & 0x2000000000000) != 0)
    {
LABEL_19:
      v206 = 2654435761 * self->_parentFeedType;
      goto LABEL_22;
    }
  }
  v206 = 0;
LABEL_22:
  v205 = -[NSString hash](self->_parentFeedId, "hash");
  v6 = (uint64_t)self->_has;
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x80000) != 0)
  {
    v204 = 2654435761 * self->_isUserSubscribedToParentFeed;
    if ((v6 & 0x8000) != 0)
    {
LABEL_24:
      v203 = 2654435761 * self->_activeTimeSpent;
      if ((v6 & 0x20000000000) != 0)
        goto LABEL_25;
      goto LABEL_32;
    }
  }
  else
  {
    v204 = 0;
    if ((v6 & 0x8000) != 0)
      goto LABEL_24;
  }
  v203 = 0;
  if ((v6 & 0x20000000000) != 0)
  {
LABEL_25:
    v202 = 2654435761 * self->_maxActiveTimeSpent;
    if ((*((_WORD *)&self->_has + 4) & 1) != 0)
      goto LABEL_26;
    goto LABEL_33;
  }
LABEL_32:
  v202 = 0;
  if ((*((_WORD *)&self->_has + 4) & 1) != 0)
  {
LABEL_26:
    v201 = 2654435761 * self->_didBounce;
    if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
      goto LABEL_27;
    goto LABEL_34;
  }
LABEL_33:
  v201 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x1000) != 0)
  {
LABEL_27:
    v200 = 2654435761 * self->_isNewUserToArticle;
    if ((*((_WORD *)&self->_has + 4) & 4) != 0)
      goto LABEL_28;
LABEL_35:
    v199 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
      goto LABEL_29;
    goto LABEL_36;
  }
LABEL_34:
  v200 = 0;
  if ((*((_WORD *)&self->_has + 4) & 4) == 0)
    goto LABEL_35;
LABEL_28:
  v199 = 2654435761 * self->_didOpenInSafari;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_29:
    v198 = 2654435761 * self->_isExplorationArticle;
    goto LABEL_37;
  }
LABEL_36:
  v198 = 0;
LABEL_37:
  v197 = -[NSString hash](self->_sourceBinId, "hash");
  if ((*(_QWORD *)&self->_has & 0x2000000000000000) != 0)
    v196 = 2654435761 * self->_adSupportedChannel;
  else
    v196 = 0;
  v195 = -[NSString hash](self->_sourceChannelId, "hash");
  v194 = -[NSString hash](self->_viewFrameInScreen, "hash");
  if ((*(_QWORD *)&self->_has & 0x1000000) != 0)
    v193 = 2654435761 * self->_characterCount;
  else
    v193 = 0;
  v192 = -[NSString hash](self->_language, "hash");
  v191 = -[NSMutableArray hash](self->_namedEntities, "hash");
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
    v190 = 2654435761 * self->_articleType;
  else
    v190 = 0;
  v189 = -[NSString hash](self->_surfacedByChannelId, "hash");
  v188 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v187 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v186 = -[NSString hash](self->_sectionHeadlineId, "hash");
  v185 = -[NSString hash](self->_referringSourceApplication, "hash");
  v184 = -[NSString hash](self->_referringUrl, "hash");
  v7 = *((unsigned __int16 *)&self->_has + 4);
  v8 = v7 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v9 = (uint64_t)self->_has;
  if ((v7 & 0x80) != 0)
  {
    v183 = 2654435761 * self->_isDigitalReplicaAd;
    if ((v9 & 0x4000000000000) != 0)
    {
LABEL_48:
      v182 = 2654435761 * self->_previousArticleHostViewTypeIfSwipe;
      if ((v8 & 0x100000) != 0)
        goto LABEL_49;
LABEL_53:
      v181 = 0;
      if ((v8 & 0x40000) != 0)
        goto LABEL_50;
      goto LABEL_54;
    }
  }
  else
  {
    v183 = 0;
    if ((v9 & 0x4000000000000) != 0)
      goto LABEL_48;
  }
  v182 = 0;
  if ((v8 & 0x100000) == 0)
    goto LABEL_53;
LABEL_49:
  v181 = 2654435761 * self->_isVideoInFeed;
  if ((v8 & 0x40000) != 0)
  {
LABEL_50:
    v180 = 2654435761 * self->_isTopStoryArticle;
    goto LABEL_55;
  }
LABEL_54:
  v180 = 0;
LABEL_55:
  v179 = -[NSString hash](self->_storyType, "hash");
  if ((*(_QWORD *)&self->_has & 0x400) != 0)
    v178 = 2654435761 * self->_personalizationTreatmentId;
  else
    v178 = 0;
  v177 = -[NSString hash](self->_userActivityType, "hash");
  p_has = &self->_has;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
    v176 = 2654435761 * self->_isGroupedArticle;
  else
    v176 = 0;
  v175 = -[NSString hash](self->_groupFeedId, "hash");
  v11 = *((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v12 = *(_QWORD *)p_has;
  if ((*(_QWORD *)p_has & 0x4000000000) != 0)
  {
    v174 = 2654435761 * self->_groupType;
    if ((v11 & 0x10000) != 0)
    {
LABEL_63:
      v173 = 2654435761 * self->_isSubscribedToGroupFeed;
      if ((v12 & 0x10000) != 0)
        goto LABEL_64;
      goto LABEL_80;
    }
  }
  else
  {
    v174 = 0;
    if ((v11 & 0x10000) != 0)
      goto LABEL_63;
  }
  v173 = 0;
  if ((v12 & 0x10000) != 0)
  {
LABEL_64:
    v172 = 2654435761 * self->_articleDisplayRankInGroup;
    if ((v11 & 0x200000) != 0)
      goto LABEL_65;
    goto LABEL_81;
  }
LABEL_80:
  v172 = 0;
  if ((v11 & 0x200000) != 0)
  {
LABEL_65:
    v171 = 2654435761 * self->_subscriptionOnlyArticle;
    if ((*((_WORD *)&self->_has + 4) & 0x8000) != 0)
      goto LABEL_66;
    goto LABEL_82;
  }
LABEL_81:
  v171 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x8000) != 0)
  {
LABEL_66:
    v170 = 2654435761 * self->_isSharedSubscriptionOnlyArticle;
    if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
      goto LABEL_67;
    goto LABEL_83;
  }
LABEL_82:
  v170 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x200) != 0)
  {
LABEL_67:
    v169 = 2654435761 * self->_isFreeArticle;
    if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0)
      goto LABEL_68;
    goto LABEL_84;
  }
LABEL_83:
  v169 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x2000) != 0)
  {
LABEL_68:
    v168 = 2654435761 * self->_isPaidSubscriberToFeed;
    if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
      goto LABEL_69;
    goto LABEL_85;
  }
LABEL_84:
  v168 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x40) != 0)
  {
LABEL_69:
    v167 = 2654435761 * self->_isCoverArticle;
    if ((v12 & 0x2000000) != 0)
      goto LABEL_70;
    goto LABEL_86;
  }
LABEL_85:
  v167 = 0;
  if ((v12 & 0x2000000) != 0)
  {
LABEL_70:
    v166 = 2654435761 * self->_coverArticleDisplayRank;
    if ((v12 & 0x4000000) != 0)
      goto LABEL_71;
    goto LABEL_87;
  }
LABEL_86:
  v166 = 0;
  if ((v12 & 0x4000000) != 0)
  {
LABEL_71:
    v165 = 2654435761 * self->_coverArticleFeatureType;
    if ((v12 & 0x1000000000000) != 0)
      goto LABEL_72;
    goto LABEL_88;
  }
LABEL_87:
  v165 = 0;
  if ((v12 & 0x1000000000000) != 0)
  {
LABEL_72:
    v164 = 2654435761 * self->_paidSubscriberToFeedType;
    if ((*((_WORD *)&self->_has + 4) & 0x4000) != 0)
      goto LABEL_73;
LABEL_89:
    v163 = 0;
    if ((v12 & 0x40000000000) != 0)
      goto LABEL_74;
LABEL_90:
    v17 = 0;
    goto LABEL_93;
  }
LABEL_88:
  v164 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x4000) == 0)
    goto LABEL_89;
LABEL_73:
  v163 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
  if ((v12 & 0x40000000000) == 0)
    goto LABEL_90;
LABEL_74:
  maxVerticalScrollPositionEnding = self->_maxVerticalScrollPositionEnding;
  v14 = -maxVerticalScrollPositionEnding;
  if (maxVerticalScrollPositionEnding >= 0.0)
    v14 = self->_maxVerticalScrollPositionEnding;
  v15 = floorf(v14 + 0.5);
  v16 = (float)(v14 - v15) * 1.8447e19;
  v17 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabsf(v16);
  }
LABEL_93:
  v162 = v17;
  v161 = -[NSString hash](self->_campaignId, "hash");
  v160 = -[NSString hash](self->_campaignType, "hash");
  v159 = -[NSString hash](self->_creativeId, "hash");
  if (((*((unsigned __int16 *)&self->_has + 4) | (*((unsigned __int8 *)&self->_has + 10) << 16)) & 0x400000) != 0)
    v158 = 2654435761 * self->_viewFromNotificationDirectOpen;
  else
    v158 = 0;
  v157 = -[NSString hash](self->_notificationId, "hash");
  if ((*(_QWORD *)&self->_has & 0x800000000000) != 0)
    v156 = 2654435761 * self->_nextArticleAffordanceType;
  else
    v156 = 0;
  v155 = -[NSString hash](self->_nextArticleAffordanceTypeFeedId, "hash");
  v18 = (uint64_t)self->_has;
  if ((v18 & 0x200000000) != 0)
  {
    v154 = 2654435761 * self->_groupArticleCountInForYou;
    if ((v18 & 0x400000000) != 0)
    {
LABEL_101:
      v153 = 2654435761 * self->_groupDisplayRankInForYou;
      if ((v18 & 0x4000000000000000) != 0)
        goto LABEL_102;
LABEL_106:
      v152 = 0;
      if ((v18 & 0x10000000000) != 0)
        goto LABEL_103;
      goto LABEL_107;
    }
  }
  else
  {
    v154 = 0;
    if ((v18 & 0x400000000) != 0)
      goto LABEL_101;
  }
  v153 = 0;
  if ((v18 & 0x4000000000000000) == 0)
    goto LABEL_106;
LABEL_102:
  v152 = 2654435761 * self->_articleLoaded;
  if ((v18 & 0x10000000000) != 0)
  {
LABEL_103:
    v151 = 2654435761 * self->_loadFailureReason;
    goto LABEL_108;
  }
LABEL_107:
  v151 = 0;
LABEL_108:
  v150 = -[NSString hash](self->_previousArticleId, "hash");
  v19 = (uint64_t)self->_has;
  if ((v19 & 0x800000000000000) == 0)
  {
    v149 = 0;
    if ((v19 & 0x1000000000000000) != 0)
      goto LABEL_110;
LABEL_113:
    v148 = 0;
    if ((v19 & 0x400000000000000) != 0)
      goto LABEL_111;
    goto LABEL_114;
  }
  v149 = 2654435761 * self->_widgetSection;
  if ((v19 & 0x1000000000000000) == 0)
    goto LABEL_113;
LABEL_110:
  v148 = 2654435761 * self->_widgetSectionArticleRank;
  if ((v19 & 0x400000000000000) != 0)
  {
LABEL_111:
    v147 = 2654435761 * self->_widgetArticleRank;
    goto LABEL_115;
  }
LABEL_114:
  v147 = 0;
LABEL_115:
  v146 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v20 = *((unsigned __int16 *)&self->_has + 4);
  v21 = v20 | (*((unsigned __int8 *)&self->_has + 10) << 16);
  v22 = (uint64_t)self->_has;
  if ((v20 & 0x20) != 0)
  {
    v145 = 2654435761 * self->_isBreakingNewsArticle;
    if ((v22 & 0x800000) != 0)
    {
LABEL_117:
      v144 = 2654435761 * self->_breakingNewsArticlePosition;
      if ((v22 & 0x400000) != 0)
        goto LABEL_118;
      goto LABEL_129;
    }
  }
  else
  {
    v145 = 0;
    if ((v22 & 0x800000) != 0)
      goto LABEL_117;
  }
  v144 = 0;
  if ((v22 & 0x400000) != 0)
  {
LABEL_118:
    v143 = 2654435761 * self->_breakingNewsArticleCount;
    if ((v22 & 0x200000000000000) != 0)
      goto LABEL_119;
    goto LABEL_130;
  }
LABEL_129:
  v143 = 0;
  if ((v22 & 0x200000000000000) != 0)
  {
LABEL_119:
    v142 = 2654435761 * self->_topStoryType;
    if ((v22 & 0x80000000000000) != 0)
      goto LABEL_120;
    goto LABEL_131;
  }
LABEL_130:
  v142 = 0;
  if ((v22 & 0x80000000000000) != 0)
  {
LABEL_120:
    v141 = 2654435761 * self->_topStoryMandatoryArticleCount;
    if ((v22 & 0x100000000000000) != 0)
      goto LABEL_121;
    goto LABEL_132;
  }
LABEL_131:
  v141 = 0;
  if ((v22 & 0x100000000000000) != 0)
  {
LABEL_121:
    v140 = 2654435761 * self->_topStoryOptionalArticleCount;
    if ((v22 & 0x2000000000) != 0)
      goto LABEL_122;
LABEL_133:
    v139 = 0;
    if ((v22 & 0x200) != 0)
      goto LABEL_123;
LABEL_134:
    v27 = 0;
    goto LABEL_137;
  }
LABEL_132:
  v140 = 0;
  if ((v22 & 0x2000000000) == 0)
    goto LABEL_133;
LABEL_122:
  v139 = 2654435761 * self->_groupPresentationReason;
  if ((v22 & 0x200) == 0)
    goto LABEL_134;
LABEL_123:
  personalizationScore = self->_personalizationScore;
  v24 = -personalizationScore;
  if (personalizationScore >= 0.0)
    v24 = self->_personalizationScore;
  v25 = floor(v24 + 0.5);
  v26 = (v24 - v25) * 1.84467441e19;
  v27 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
  if (v26 >= 0.0)
  {
    if (v26 > 0.0)
      v27 += (unint64_t)v26;
  }
  else
  {
    v27 -= (unint64_t)fabs(v26);
  }
LABEL_137:
  if ((v21 & 0x20000) != 0)
    v137 = 2654435761 * self->_isSubscribedToSourceChannel;
  else
    v137 = 0;
  v138 = v27;
  if ((v21 & 0x800) != 0)
    v136 = 2654435761 * self->_isNativeAd;
  else
    v136 = 0;
  v135 = -[NSString hash](self->_nativeCampaignData, "hash");
  v134 = -[NSString hash](self->_previousArticleVersion, "hash");
  v133 = -[NSString hash](self->_anfComponentId, "hash");
  if ((*(_QWORD *)&self->_has & 0x8000000000000000) != 0)
    v132 = 2654435761 * self->_badgeExposure;
  else
    v132 = 0;
  v131 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement hash](self->_widgetEngagement, "hash");
  v28 = (uint64_t)self->_has;
  if ((v28 & 0x1000) == 0)
  {
    v130 = 0;
    if ((v28 & 8) != 0)
      goto LABEL_148;
LABEL_151:
    v129 = 0;
    if ((v28 & 0x100000000) != 0)
      goto LABEL_149;
    goto LABEL_152;
  }
  v130 = 2654435761 * self->_publisherArticleVersionInt64;
  if ((v28 & 8) == 0)
    goto LABEL_151;
LABEL_148:
  v129 = 2654435761 * self->_backendArticleVersionInt64;
  if ((v28 & 0x100000000) != 0)
  {
LABEL_149:
    v128 = 2654435761 * self->_feedSubscriptionOrigin;
    goto LABEL_153;
  }
LABEL_152:
  v128 = 0;
LABEL_153:
  v127 = -[NSString hash](self->_iadNativeCampaign, "hash");
  v126 = -[NSString hash](self->_iadNativeLine, "hash");
  v125 = -[NSString hash](self->_iadNativeAd, "hash");
  v29 = (uint64_t)self->_has;
  if ((v29 & 0x800) != 0)
  {
    v124 = 2654435761 * self->_previousArticlePublisherArticleVersion;
    if ((v29 & 0x800000000) != 0)
    {
LABEL_155:
      v123 = 2654435761 * self->_groupFormationReason;
      if ((v29 & 0x20000000) != 0)
        goto LABEL_156;
LABEL_163:
      v122 = 0;
      if ((v29 & 0x40) != 0)
        goto LABEL_157;
LABEL_164:
      v34 = 0;
      goto LABEL_167;
    }
  }
  else
  {
    v124 = 0;
    if ((v29 & 0x800000000) != 0)
      goto LABEL_155;
  }
  v123 = 0;
  if ((v29 & 0x20000000) == 0)
    goto LABEL_163;
LABEL_156:
  v122 = 2654435761 * self->_feedAutoSubscribeType;
  if ((v29 & 0x40) == 0)
    goto LABEL_164;
LABEL_157:
  featureCtr = self->_featureCtr;
  v31 = -featureCtr;
  if (featureCtr >= 0.0)
    v31 = self->_featureCtr;
  v32 = floor(v31 + 0.5);
  v33 = (v31 - v32) * 1.84467441e19;
  v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
  if (v33 >= 0.0)
  {
    if (v33 > 0.0)
      v34 += (unint64_t)v33;
  }
  else
  {
    v34 -= (unint64_t)fabs(v33);
  }
LABEL_167:
  if ((v29 & 0x100) != 0)
  {
    paidNonpaidSubscriptionCtr = self->_paidNonpaidSubscriptionCtr;
    v37 = -paidNonpaidSubscriptionCtr;
    if (paidNonpaidSubscriptionCtr >= 0.0)
      v37 = self->_paidNonpaidSubscriptionCtr;
    v38 = floor(v37 + 0.5);
    v39 = (v37 - v38) * 1.84467441e19;
    v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0)
        v35 += (unint64_t)v39;
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    v35 = 0;
  }
  if ((v29 & 4) != 0)
  {
    autoSubscribeCtr = self->_autoSubscribeCtr;
    v42 = -autoSubscribeCtr;
    if (autoSubscribeCtr >= 0.0)
      v42 = self->_autoSubscribeCtr;
    v43 = floor(v42 + 0.5);
    v44 = (v42 - v43) * 1.84467441e19;
    v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0)
        v40 += (unint64_t)v44;
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    v40 = 0;
  }
  if ((v29 & 0x10) != 0)
  {
    computedGlobalScoreCoefficient = self->_computedGlobalScoreCoefficient;
    v47 = -computedGlobalScoreCoefficient;
    if (computedGlobalScoreCoefficient >= 0.0)
      v47 = self->_computedGlobalScoreCoefficient;
    v48 = floor(v47 + 0.5);
    v49 = (v47 - v48) * 1.84467441e19;
    v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0)
        v45 += (unint64_t)v49;
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    v45 = 0;
  }
  if ((v29 & 0x80) != 0)
  {
    globalScore = self->_globalScore;
    v52 = -globalScore;
    if (globalScore >= 0.0)
      v52 = self->_globalScore;
    v53 = floor(v52 + 0.5);
    v54 = (v52 - v53) * 1.84467441e19;
    v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0)
        v50 += (unint64_t)v54;
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    v50 = 0;
  }
  if ((v29 & 0x4000) != 0)
  {
    userFeedbackScore = self->_userFeedbackScore;
    v57 = -userFeedbackScore;
    if (userFeedbackScore >= 0.0)
      v57 = self->_userFeedbackScore;
    v58 = floor(v57 + 0.5);
    v59 = (v57 - v58) * 1.84467441e19;
    v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0)
        v55 += (unint64_t)v59;
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    v55 = 0;
  }
  if ((v29 & 2) == 0)
  {
    v221 = 0;
    goto LABEL_216;
  }
  agedUserFeedbackScore = self->_agedUserFeedbackScore;
  v61 = -agedUserFeedbackScore;
  if (agedUserFeedbackScore >= 0.0)
    v61 = self->_agedUserFeedbackScore;
  v62 = floor(v61 + 0.5);
  v63 = (v61 - v62) * 1.84467441e19;
  v64 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
  if (v63 >= 0.0)
  {
    v221 = v64;
    if (v63 <= 0.0)
      goto LABEL_216;
    v65 = v64 + (unint64_t)v63;
  }
  else
  {
    v65 = v64 - (unint64_t)fabs(v63);
  }
  v221 = v65;
LABEL_216:
  if ((v29 & 1) == 0)
  {
    v220 = 0;
    goto LABEL_225;
  }
  agedPersonalizationScore = self->_agedPersonalizationScore;
  v67 = -agedPersonalizationScore;
  if (agedPersonalizationScore >= 0.0)
    v67 = self->_agedPersonalizationScore;
  v68 = floor(v67 + 0.5);
  v69 = (v67 - v68) * 1.84467441e19;
  v70 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
  if (v69 >= 0.0)
  {
    v220 = v70;
    if (v69 <= 0.0)
      goto LABEL_225;
    v71 = v70 + (unint64_t)v69;
  }
  else
  {
    v71 = v70 - (unint64_t)fabs(v69);
  }
  v220 = v71;
LABEL_225:
  if ((v29 & 0x20) != 0)
  {
    diversifiedPersonalizationScore = self->_diversifiedPersonalizationScore;
    v74 = -diversifiedPersonalizationScore;
    if (diversifiedPersonalizationScore >= 0.0)
      v74 = self->_diversifiedPersonalizationScore;
    v75 = floor(v74 + 0.5);
    v76 = (v74 - v75) * 1.84467441e19;
    v72 = 2654435761u * (unint64_t)fmod(v75, 1.84467441e19);
    if (v76 >= 0.0)
    {
      if (v76 > 0.0)
        v72 += (unint64_t)v76;
    }
    else
    {
      v72 -= (unint64_t)fabs(v76);
    }
  }
  else
  {
    v72 = 0;
  }
  if ((v29 & 0x80000000000) == 0)
  {
    v119 = 0;
    if ((v29 & 0x400000000000) != 0)
      goto LABEL_235;
LABEL_238:
    v118 = 0;
    if ((v29 & 0x100000000000) != 0)
      goto LABEL_236;
    goto LABEL_239;
  }
  v119 = 2654435761 * self->_moduleEventType;
  if ((v29 & 0x400000000000) == 0)
    goto LABEL_238;
LABEL_235:
  v118 = 2654435761 * self->_moduleLocation;
  if ((v29 & 0x100000000000) != 0)
  {
LABEL_236:
    v117 = 2654435761 * self->_moduleItemCount;
    goto LABEL_240;
  }
LABEL_239:
  v117 = 0;
LABEL_240:
  v120 = v72;
  if ((v29 & 0x200000000000) != 0)
    v116 = 2654435761 * self->_moduleItemPosition;
  else
    v116 = 0;
  v115 = -[NSData hash](self->_moduleExposureId, "hash");
  v114 = -[NSString hash](self->_previousWebEmbedId, "hash");
  if ((*(_QWORD *)&self->_has & 0x8000000000000) != 0)
    v113 = 2654435761 * self->_previousWebEmbedLocation;
  else
    v113 = 0;
  v112 = -[NSMutableArray hash](self->_surfacedByTagIds, "hash");
  v111 = -[NSString hash](self->_iadNativeCampaignAd, "hash");
  v77 = (uint64_t)self->_has;
  if ((v77 & 0x8000000) != 0)
  {
    v110 = 2654435761 * self->_curatedContentType;
    if ((v77 & 0x1000000000) != 0)
      goto LABEL_248;
  }
  else
  {
    v110 = 0;
    if ((v77 & 0x1000000000) != 0)
    {
LABEL_248:
      v109 = 2654435761 * self->_groupLocation;
      goto LABEL_251;
    }
  }
  v109 = 0;
LABEL_251:
  v108 = -[NSString hash](self->_exposedInLocationId, "hash");
  v107 = -[NSData hash](self->_groupViewExposureId, "hash");
  v106 = -[NSString hash](self->_exposedGroupSourceChannelId, "hash");
  v78 = *((_WORD *)&self->_has + 4);
  v79 = (uint64_t)self->_has;
  if ((v79 & 0x40000) == 0)
  {
    v105 = 0;
    if ((v78 & 2) != 0)
      goto LABEL_253;
LABEL_259:
    v104 = 0;
    if ((v79 & 0x2000) != 0)
      goto LABEL_254;
LABEL_260:
    v84 = 0;
    goto LABEL_263;
  }
  v105 = 2654435761 * self->_articleSuggestionOrigin;
  if ((v78 & 2) == 0)
    goto LABEL_259;
LABEL_253:
  v104 = 2654435761 * self->_didExpandDuringView;
  if ((v79 & 0x2000) == 0)
    goto LABEL_260;
LABEL_254:
  subscribedChannelCtr = self->_subscribedChannelCtr;
  v81 = -subscribedChannelCtr;
  if (subscribedChannelCtr >= 0.0)
    v81 = self->_subscribedChannelCtr;
  v82 = floor(v81 + 0.5);
  v83 = (v81 - v82) * 1.84467441e19;
  v84 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
  if (v83 >= 0.0)
  {
    if (v83 > 0.0)
      v84 += (unint64_t)v83;
  }
  else
  {
    v84 -= (unint64_t)fabs(v83);
  }
LABEL_263:
  v103 = v84;
  v102 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline hash](self->_alternateHeadline, "hash");
  if ((*(_QWORD *)&self->_has & 0x20000000000000) != 0)
    v101 = 2654435761 * self->_rankInVideoPlaylist;
  else
    v101 = 0;
  v100 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData hash](self->_issueData, "hash");
  v99 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData hash](self->_issueExposureData, "hash");
  v98 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData hash](self->_issueViewData, "hash");
  v121 = v35;
  if ((*(_QWORD *)&self->_has & 0x40000000000000) != 0)
    v97 = 2654435761 * self->_role;
  else
    v97 = 0;
  v96 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData hash](self->_channelData, "hash");
  v94 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData hash](self->_issueViewContextData, "hash");
  if ((*(_QWORD *)&self->_has & 0x8000000000) != 0)
    v85 = 2654435761 * self->_heroArticleType;
  else
    v85 = 0;
  v86 = -[NSString hash](self->_webEmbedId, "hash", v94);
  v87 = -[NSString hash](self->_curatedBatchId, "hash");
  if ((*((_WORD *)&self->_has + 4) & 8) != 0)
    v88 = 2654435761 * self->_isAudioEligible;
  else
    v88 = 0;
  if ((*((_WORD *)&self->_has + 4) & 0x10) != 0)
    v89 = 2654435761 * self->_isAudioEngaged;
  else
    v89 = 0;
  v90 = v218 ^ v219 ^ v217 ^ v216 ^ v215 ^ v214 ^ v213 ^ v212 ^ v211 ^ v210 ^ v209 ^ v208 ^ v207 ^ v206 ^ v205 ^ v204 ^ v203 ^ v202 ^ v201 ^ v200 ^ v199 ^ v198 ^ v197 ^ v196 ^ v195 ^ v194 ^ v193 ^ v192 ^ v191 ^ v190 ^ v189 ^ v188 ^ v187 ^ v186 ^ v185 ^ v184 ^ v183 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125;
  v91 = v90 ^ v124 ^ v123 ^ v122 ^ v34 ^ v121 ^ v40 ^ v45 ^ v50 ^ v55 ^ v221 ^ v220 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v85;
  v92 = v86 ^ v87 ^ v88 ^ v89 ^ -[NSMutableArray hash](self->_topicIds, "hash");
  return v91 ^ v92 ^ -[NSMutableArray hash](self->_purchaseOffersItems, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  int v18;
  int v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  char v24;
  char v25;
  char v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  int v41;
  int v42;
  char v43;
  uint64_t v44;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement *widgetEngagement;
  uint64_t v46;
  unsigned int v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  int v53;
  unsigned int v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  uint64_t v65;
  char v66;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline *alternateHeadline;
  uint64_t v68;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData *issueData;
  uint64_t v70;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData *issueExposureData;
  uint64_t v72;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData *issueViewData;
  uint64_t v74;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData *channelData;
  uint64_t v76;
  COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData *issueViewContextData;
  uint64_t v78;
  __int16 v79;
  char v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t m;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t n;
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
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  v5 = v4;
  if ((*(_QWORD *)(v4 + 812) & 0x20000) != 0)
  {
    self->_articleHostViewType = *((_DWORD *)v4 + 39);
    *(_QWORD *)&self->_has |= 0x20000uLL;
  }
  if (*((_QWORD *)v4 + 20))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 77))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setReferencedArticleId:](self, "setReferencedArticleId:");
  v6 = *(_QWORD *)(v5 + 812);
  if ((v6 & 0x10000000000000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 149);
    *(_QWORD *)&self->_has |= 0x10000000000000uLL;
    v6 = *(_QWORD *)(v5 + 812);
  }
  if ((v6 & 0x200000) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v5 + 50);
    *(_QWORD *)&self->_has |= 0x200000uLL;
  }
  if (*((_QWORD *)v5 + 21))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setArticleSessionId:](self, "setArticleSessionId:");
  if (*((_QWORD *)v5 + 24))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  v7 = *(_QWORD *)(v5 + 812);
  if ((v7 & 0x10000000) != 0)
  {
    self->_displayRank = *((_DWORD *)v5 + 69);
    *(_QWORD *)&self->_has |= 0x10000000uLL;
    v7 = *(_QWORD *)(v5 + 812);
  }
  if ((v7 & 0x100000) != 0)
  {
    self->_articleViewPresentationReason = *((_DWORD *)v5 + 46);
    *(_QWORD *)&self->_has |= 0x100000uLL;
  }
  if (*((_QWORD *)v5 + 41))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
  if ((*((_DWORD *)v5 + 203) & 0x80000000) != 0)
  {
    self->_feedPresentationReason = *((_DWORD *)v5 + 76);
    *(_QWORD *)&self->_has |= 0x80000000uLL;
  }
  if (*((_QWORD *)v5 + 39))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setFeedPresentationReasonSearchString:](self, "setFeedPresentationReasonSearchString:");
  v8 = *(_QWORD *)(v5 + 812);
  if ((v8 & 0x40000000) != 0)
  {
    self->_feedCellHostType = *((_DWORD *)v5 + 75);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
    v8 = *(_QWORD *)(v5 + 812);
  }
  if ((v8 & 0x2000000000000) != 0)
  {
    self->_parentFeedType = *((_DWORD *)v5 + 140);
    *(_QWORD *)&self->_has |= 0x2000000000000uLL;
  }
  if (*((_QWORD *)v5 + 69))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setParentFeedId:](self, "setParentFeedId:");
  v9 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  if ((v9 & 0x80000) != 0)
  {
    self->_isUserSubscribedToParentFeed = v5[806];
    v10 = *((unsigned __int16 *)&self->_has + 4);
    v11 = (v10 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x80000u) >> 16;
    *((_WORD *)&self->_has + 4) = v10;
    *((_BYTE *)&self->_has + 10) = v11;
    LOWORD(v9) = *((_WORD *)v5 + 410);
  }
  v12 = *(_QWORD *)(v5 + 812);
  if ((v12 & 0x8000) != 0)
  {
    self->_activeTimeSpent = *((_DWORD *)v5 + 32);
    *(_QWORD *)&self->_has |= 0x8000uLL;
    LOWORD(v9) = *((_WORD *)v5 + 410);
    if ((*(_QWORD *)(v5 + 812) & 0x20000000000) == 0)
    {
LABEL_35:
      if ((v9 & 1) == 0)
        goto LABEL_36;
      goto LABEL_94;
    }
  }
  else if ((v12 & 0x20000000000) == 0)
  {
    goto LABEL_35;
  }
  self->_maxActiveTimeSpent = *((_DWORD *)v5 + 117);
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  LOWORD(v9) = *((_WORD *)v5 + 410);
  if ((v9 & 1) == 0)
  {
LABEL_36:
    if ((v9 & 0x1000) == 0)
      goto LABEL_37;
    goto LABEL_95;
  }
LABEL_94:
  self->_didBounce = v5[787];
  v24 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 1u;
  *((_BYTE *)&self->_has + 10) = v24;
  LOWORD(v9) = *((_WORD *)v5 + 410);
  if ((v9 & 0x1000) == 0)
  {
LABEL_37:
    if ((v9 & 4) == 0)
      goto LABEL_38;
    goto LABEL_96;
  }
LABEL_95:
  self->_isNewUserToArticle = v5[799];
  v25 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x1000u;
  *((_BYTE *)&self->_has + 10) = v25;
  LOWORD(v9) = *((_WORD *)v5 + 410);
  if ((v9 & 4) == 0)
  {
LABEL_38:
    if ((v9 & 0x100) == 0)
      goto LABEL_40;
    goto LABEL_39;
  }
LABEL_96:
  self->_didOpenInSafari = v5[789];
  v26 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 4u;
  *((_BYTE *)&self->_has + 10) = v26;
  if ((*((_WORD *)v5 + 410) & 0x100) != 0)
  {
LABEL_39:
    self->_isExplorationArticle = v5[795];
    *((_WORD *)&self->_has + 4) |= 0x100u;
  }
LABEL_40:
  if (*((_QWORD *)v5 + 82))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setSourceBinId:](self, "setSourceBinId:");
  if ((*(_QWORD *)(v5 + 812) & 0x2000000000000000) != 0)
  {
    self->_adSupportedChannel = v5[784];
    *(_QWORD *)&self->_has |= 0x2000000000000000uLL;
  }
  if (*((_QWORD *)v5 + 83))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setSourceChannelId:](self, "setSourceChannelId:");
  if (*((_QWORD *)v5 + 93))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setViewFrameInScreen:](self, "setViewFrameInScreen:");
  if ((*(_QWORD *)(v5 + 812) & 0x1000000) != 0)
  {
    self->_characterCount = *((_DWORD *)v5 + 60);
    *(_QWORD *)&self->_has |= 0x1000000uLL;
  }
  if (*((_QWORD *)v5 + 57))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setLanguage:](self, "setLanguage:");
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v13 = *((id *)v5 + 63);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v108 != v16)
          objc_enumerationMutation(v13);
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v107, v115, 16);
    }
    while (v15);
  }

  if ((*(_QWORD *)(v5 + 812) & 0x80000) != 0)
  {
    self->_articleType = *((_DWORD *)v5 + 45);
    *(_QWORD *)&self->_has |= 0x80000uLL;
  }
  if (*((_QWORD *)v5 + 85))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v5 + 86))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v5 + 88))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 81))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setSectionHeadlineId:](self, "setSectionHeadlineId:");
  if (*((_QWORD *)v5 + 78))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setReferringSourceApplication:](self, "setReferringSourceApplication:");
  if (*((_QWORD *)v5 + 79))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setReferringUrl:](self, "setReferringUrl:");
  v18 = *((unsigned __int16 *)v5 + 410);
  v19 = v18 | (v5[822] << 16);
  if ((v18 & 0x80) != 0)
  {
    self->_isDigitalReplicaAd = v5[794];
    v20 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 0x80u;
    *((_BYTE *)&self->_has + 10) = v20;
    v19 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  }
  if ((*(_QWORD *)(v5 + 812) & 0x4000000000000) != 0)
  {
    self->_previousArticleHostViewTypeIfSwipe = *((_DWORD *)v5 + 141);
    *(_QWORD *)&self->_has |= 0x4000000000000uLL;
    v19 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
    if ((v19 & 0x100000) == 0)
    {
LABEL_77:
      if ((v19 & 0x40000) == 0)
        goto LABEL_79;
      goto LABEL_78;
    }
  }
  else if ((v19 & 0x100000) == 0)
  {
    goto LABEL_77;
  }
  self->_isVideoInFeed = v5[807];
  v27 = *((unsigned __int16 *)&self->_has + 4);
  v28 = (v27 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x100000u) >> 16;
  *((_WORD *)&self->_has + 4) = v27;
  *((_BYTE *)&self->_has + 10) = v28;
  if (((*((unsigned __int16 *)v5 + 410) | (v5[822] << 16)) & 0x40000) != 0)
  {
LABEL_78:
    self->_isTopStoryArticle = v5[805];
    v21 = ((*((unsigned __int8 *)&self->_has + 10) << 16) | 0x40000u) >> 16;
    *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
    *((_BYTE *)&self->_has + 10) = v21;
  }
LABEL_79:
  if (*((_QWORD *)v5 + 84))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setStoryType:](self, "setStoryType:");
  if ((*(_QWORD *)(v5 + 812) & 0x400) != 0)
  {
    self->_personalizationTreatmentId = *((_QWORD *)v5 + 11);
    *(_QWORD *)&self->_has |= 0x400uLL;
  }
  if (*((_QWORD *)v5 + 92))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setUserActivityType:](self, "setUserActivityType:");
  if ((*((_WORD *)v5 + 410) & 0x400) != 0)
  {
    self->_isGroupedArticle = v5[797];
    *((_WORD *)&self->_has + 4) |= 0x400u;
  }
  if (*((_QWORD *)v5 + 44))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setGroupFeedId:](self, "setGroupFeedId:");
  v22 = *(_QWORD *)(v5 + 812);
  if ((v22 & 0x4000000000) != 0)
  {
    self->_groupType = *((_DWORD *)v5 + 93);
    *(_QWORD *)&self->_has |= 0x4000000000uLL;
    v23 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
    v22 = *(_QWORD *)(v5 + 812);
    if ((v23 & 0x10000) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
  v23 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  if ((v23 & 0x10000) != 0)
  {
LABEL_102:
    self->_isSubscribedToGroupFeed = v5[803];
    v29 = *((unsigned __int16 *)&self->_has + 4);
    v30 = (v29 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x10000u) >> 16;
    *((_WORD *)&self->_has + 4) = v29;
    *((_BYTE *)&self->_has + 10) = v30;
    v23 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
    v22 = *(_QWORD *)(v5 + 812);
  }
LABEL_103:
  if ((v22 & 0x10000) != 0)
  {
    self->_articleDisplayRankInGroup = *((_DWORD *)v5 + 38);
    *(_QWORD *)&self->_has |= 0x10000uLL;
    v23 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
    v22 = *(_QWORD *)(v5 + 812);
    if ((v23 & 0x200000) == 0)
    {
LABEL_105:
      if ((v23 & 0x8000) == 0)
        goto LABEL_106;
      goto LABEL_172;
    }
  }
  else if ((v23 & 0x200000) == 0)
  {
    goto LABEL_105;
  }
  self->_subscriptionOnlyArticle = v5[808];
  v23 = *((unsigned __int16 *)&self->_has + 4);
  v47 = (v23 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x200000u) >> 16;
  *((_WORD *)&self->_has + 4) = v23;
  *((_BYTE *)&self->_has + 10) = v47;
  LOWORD(v23) = *((_WORD *)v5 + 410);
  v22 = *(_QWORD *)(v5 + 812);
  if ((v23 & 0x8000) == 0)
  {
LABEL_106:
    if ((v23 & 0x200) == 0)
      goto LABEL_107;
    goto LABEL_173;
  }
LABEL_172:
  self->_isSharedSubscriptionOnlyArticle = v5[802];
  v48 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x8000u;
  *((_BYTE *)&self->_has + 10) = v48;
  LOWORD(v23) = *((_WORD *)v5 + 410);
  v22 = *(_QWORD *)(v5 + 812);
  if ((v23 & 0x200) == 0)
  {
LABEL_107:
    if ((v23 & 0x2000) == 0)
      goto LABEL_108;
    goto LABEL_174;
  }
LABEL_173:
  self->_isFreeArticle = v5[796];
  v49 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x200u;
  *((_BYTE *)&self->_has + 10) = v49;
  LOWORD(v23) = *((_WORD *)v5 + 410);
  v22 = *(_QWORD *)(v5 + 812);
  if ((v23 & 0x2000) == 0)
  {
LABEL_108:
    if ((v23 & 0x40) == 0)
      goto LABEL_109;
    goto LABEL_175;
  }
LABEL_174:
  self->_isPaidSubscriberToFeed = v5[800];
  v50 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x2000u;
  *((_BYTE *)&self->_has + 10) = v50;
  LOWORD(v23) = *((_WORD *)v5 + 410);
  v22 = *(_QWORD *)(v5 + 812);
  if ((v23 & 0x40) == 0)
  {
LABEL_109:
    if ((v22 & 0x2000000) == 0)
      goto LABEL_110;
    goto LABEL_176;
  }
LABEL_175:
  self->_isCoverArticle = v5[793];
  v51 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x40u;
  *((_BYTE *)&self->_has + 10) = v51;
  LOWORD(v23) = *((_WORD *)v5 + 410);
  v22 = *(_QWORD *)(v5 + 812);
  if ((v22 & 0x2000000) == 0)
  {
LABEL_110:
    if ((v22 & 0x4000000) == 0)
      goto LABEL_111;
    goto LABEL_177;
  }
LABEL_176:
  self->_coverArticleDisplayRank = *((_DWORD *)v5 + 61);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  LOWORD(v23) = *((_WORD *)v5 + 410);
  v22 = *(_QWORD *)(v5 + 812);
  if ((v22 & 0x4000000) == 0)
  {
LABEL_111:
    if ((v22 & 0x1000000000000) == 0)
      goto LABEL_112;
    goto LABEL_178;
  }
LABEL_177:
  self->_coverArticleFeatureType = *((_DWORD *)v5 + 62);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  LOWORD(v23) = *((_WORD *)v5 + 410);
  v22 = *(_QWORD *)(v5 + 812);
  if ((v22 & 0x1000000000000) == 0)
  {
LABEL_112:
    if ((v23 & 0x4000) == 0)
      goto LABEL_113;
    goto LABEL_179;
  }
LABEL_178:
  self->_paidSubscriberToFeedType = *((_DWORD *)v5 + 136);
  *(_QWORD *)&self->_has |= 0x1000000000000uLL;
  v22 = *(_QWORD *)(v5 + 812);
  if ((*((_WORD *)v5 + 410) & 0x4000) == 0)
  {
LABEL_113:
    if ((v22 & 0x40000000000) == 0)
      goto LABEL_115;
    goto LABEL_114;
  }
LABEL_179:
  self->_isPaidSubscriberToSourceChannel = v5[801];
  v52 = *((_BYTE *)&self->_has + 10);
  *((_WORD *)&self->_has + 4) |= 0x4000u;
  *((_BYTE *)&self->_has + 10) = v52;
  if ((*(_QWORD *)(v5 + 812) & 0x40000000000) != 0)
  {
LABEL_114:
    self->_maxVerticalScrollPositionEnding = *((float *)v5 + 118);
    *(_QWORD *)&self->_has |= 0x40000000000uLL;
  }
LABEL_115:
  if (*((_QWORD *)v5 + 27))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setCampaignId:](self, "setCampaignId:");
  if (*((_QWORD *)v5 + 28))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setCampaignType:](self, "setCampaignType:");
  if (*((_QWORD *)v5 + 32))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setCreativeId:](self, "setCreativeId:");
  if (((*((unsigned __int16 *)v5 + 410) | (v5[822] << 16)) & 0x400000) != 0)
  {
    self->_viewFromNotificationDirectOpen = v5[809];
    v31 = ((*((unsigned __int8 *)&self->_has + 10) << 16) | 0x400000u) >> 16;
    *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4);
    *((_BYTE *)&self->_has + 10) = v31;
  }
  if (*((_QWORD *)v5 + 67))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setNotificationId:](self, "setNotificationId:");
  if ((*(_QWORD *)(v5 + 812) & 0x800000000000) != 0)
  {
    self->_nextArticleAffordanceType = *((_DWORD *)v5 + 130);
    *(_QWORD *)&self->_has |= 0x800000000000uLL;
  }
  if (*((_QWORD *)v5 + 66))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setNextArticleAffordanceTypeFeedId:](self, "setNextArticleAffordanceTypeFeedId:");
  v32 = (uint64_t *)(v5 + 812);
  v33 = *(_QWORD *)(v5 + 812);
  if ((v33 & 0x200000000) != 0)
  {
    self->_groupArticleCountInForYou = *((_DWORD *)v5 + 86);
    *(_QWORD *)&self->_has |= 0x200000000uLL;
    v33 = *v32;
    if ((*v32 & 0x400000000) == 0)
    {
LABEL_131:
      if ((v33 & 0x4000000000000000) == 0)
        goto LABEL_132;
      goto LABEL_183;
    }
  }
  else if ((v33 & 0x400000000) == 0)
  {
    goto LABEL_131;
  }
  self->_groupDisplayRankInForYou = *((_DWORD *)v5 + 87);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v33 = *(_QWORD *)(v5 + 812);
  if ((v33 & 0x4000000000000000) == 0)
  {
LABEL_132:
    if ((v33 & 0x10000000000) == 0)
      goto LABEL_134;
    goto LABEL_133;
  }
LABEL_183:
  self->_articleLoaded = v5[785];
  *(_QWORD *)&self->_has |= 0x4000000000000000uLL;
  if ((*(_QWORD *)(v5 + 812) & 0x10000000000) != 0)
  {
LABEL_133:
    self->_loadFailureReason = *((_DWORD *)v5 + 116);
    *(_QWORD *)&self->_has |= 0x10000000000uLL;
  }
LABEL_134:
  if (*((_QWORD *)v5 + 71))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setPreviousArticleId:](self, "setPreviousArticleId:");
  v34 = (uint64_t *)(v5 + 812);
  v35 = *(_QWORD *)(v5 + 812);
  if ((v35 & 0x800000000000000) != 0)
  {
    self->_widgetSection = *((_DWORD *)v5 + 194);
    *(_QWORD *)&self->_has |= 0x800000000000000uLL;
    v35 = *v34;
    if ((*v34 & 0x1000000000000000) == 0)
    {
LABEL_138:
      if ((v35 & 0x400000000000000) == 0)
        goto LABEL_140;
      goto LABEL_139;
    }
  }
  else if ((v35 & 0x1000000000000000) == 0)
  {
    goto LABEL_138;
  }
  self->_widgetSectionArticleRank = *((_DWORD *)v5 + 195);
  *(_QWORD *)&self->_has |= 0x1000000000000000uLL;
  if ((*(_QWORD *)(v5 + 812) & 0x400000000000000) != 0)
  {
LABEL_139:
    self->_widgetArticleRank = *((_DWORD *)v5 + 190);
    *(_QWORD *)&self->_has |= 0x400000000000000uLL;
  }
LABEL_140:
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v36 = *((id *)v5 + 42);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v104 != v39)
          objc_enumerationMutation(v36);
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v103, v114, 16);
    }
    while (v38);
  }

  v41 = *((unsigned __int16 *)v5 + 410);
  v42 = v41 | (v5[822] << 16);
  if ((v41 & 0x20) != 0)
  {
    self->_isBreakingNewsArticle = v5[792];
    v43 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 0x20u;
    *((_BYTE *)&self->_has + 10) = v43;
    v42 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  }
  v44 = *(_QWORD *)(v5 + 812);
  if ((v44 & 0x800000) != 0)
  {
    self->_breakingNewsArticlePosition = *((_DWORD *)v5 + 52);
    *(_QWORD *)&self->_has |= 0x800000uLL;
    v42 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
    v44 = *(_QWORD *)(v5 + 812);
    if ((v44 & 0x400000) == 0)
    {
LABEL_151:
      if ((v44 & 0x200000000000000) == 0)
        goto LABEL_152;
      goto LABEL_190;
    }
  }
  else if ((v44 & 0x400000) == 0)
  {
    goto LABEL_151;
  }
  self->_breakingNewsArticleCount = *((_DWORD *)v5 + 51);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v42 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  v44 = *(_QWORD *)(v5 + 812);
  if ((v44 & 0x200000000000000) == 0)
  {
LABEL_152:
    if ((v44 & 0x80000000000000) == 0)
      goto LABEL_153;
    goto LABEL_191;
  }
LABEL_190:
  self->_topStoryType = *((_DWORD *)v5 + 180);
  *(_QWORD *)&self->_has |= 0x200000000000000uLL;
  v42 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  v44 = *(_QWORD *)(v5 + 812);
  if ((v44 & 0x80000000000000) == 0)
  {
LABEL_153:
    if ((v44 & 0x100000000000000) == 0)
      goto LABEL_154;
    goto LABEL_192;
  }
LABEL_191:
  self->_topStoryMandatoryArticleCount = *((_DWORD *)v5 + 178);
  *(_QWORD *)&self->_has |= 0x80000000000000uLL;
  v42 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  v44 = *(_QWORD *)(v5 + 812);
  if ((v44 & 0x100000000000000) == 0)
  {
LABEL_154:
    if ((v44 & 0x2000000000) == 0)
      goto LABEL_155;
    goto LABEL_193;
  }
LABEL_192:
  self->_topStoryOptionalArticleCount = *((_DWORD *)v5 + 179);
  *(_QWORD *)&self->_has |= 0x100000000000000uLL;
  v42 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  v44 = *(_QWORD *)(v5 + 812);
  if ((v44 & 0x2000000000) == 0)
  {
LABEL_155:
    if ((v44 & 0x200) == 0)
      goto LABEL_156;
    goto LABEL_194;
  }
LABEL_193:
  self->_groupPresentationReason = *((_DWORD *)v5 + 92);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  v42 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  if ((*(_QWORD *)(v5 + 812) & 0x200) == 0)
  {
LABEL_156:
    if ((v42 & 0x20000) == 0)
      goto LABEL_157;
    goto LABEL_195;
  }
LABEL_194:
  self->_personalizationScore = *((double *)v5 + 10);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v42 = *((unsigned __int16 *)v5 + 410) | (v5[822] << 16);
  if ((v42 & 0x20000) == 0)
  {
LABEL_157:
    if ((v42 & 0x800) == 0)
      goto LABEL_159;
    goto LABEL_158;
  }
LABEL_195:
  self->_isSubscribedToSourceChannel = v5[804];
  v53 = *((unsigned __int16 *)&self->_has + 4);
  v54 = (v53 | (*((unsigned __int8 *)&self->_has + 10) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_has + 4) = v53;
  *((_BYTE *)&self->_has + 10) = v54;
  if ((*((_WORD *)v5 + 410) & 0x800) != 0)
  {
LABEL_158:
    self->_isNativeAd = v5[798];
    *((_WORD *)&self->_has + 4) |= 0x800u;
  }
LABEL_159:
  if (*((_QWORD *)v5 + 64))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setNativeCampaignData:](self, "setNativeCampaignData:");
  if (*((_QWORD *)v5 + 72))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  if (*((_QWORD *)v5 + 18))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setAnfComponentId:](self, "setAnfComponentId:");
  if ((*(_QWORD *)(v5 + 812) & 0x8000000000000000) != 0)
  {
    self->_badgeExposure = v5[786];
    *(_QWORD *)&self->_has |= 0x8000000000000000;
  }
  widgetEngagement = self->_widgetEngagement;
  v46 = *((_QWORD *)v5 + 96);
  if (widgetEngagement)
  {
    if (v46)
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v46)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  v55 = (uint64_t *)(v5 + 812);
  v56 = *(_QWORD *)(v5 + 812);
  if ((v56 & 0x1000) != 0)
  {
    self->_publisherArticleVersionInt64 = *((_QWORD *)v5 + 13);
    *(_QWORD *)&self->_has |= 0x1000uLL;
    v56 = *v55;
    if ((*v55 & 8) == 0)
    {
LABEL_201:
      if ((v56 & 0x100000000) == 0)
        goto LABEL_203;
      goto LABEL_202;
    }
  }
  else if ((v56 & 8) == 0)
  {
    goto LABEL_201;
  }
  self->_backendArticleVersionInt64 = *((_QWORD *)v5 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  if ((*(_QWORD *)(v5 + 812) & 0x100000000) != 0)
  {
LABEL_202:
    self->_feedSubscriptionOrigin = *((_DWORD *)v5 + 80);
    *(_QWORD *)&self->_has |= 0x100000000uLL;
  }
LABEL_203:
  if (*((_QWORD *)v5 + 50))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setIadNativeCampaign:](self, "setIadNativeCampaign:");
  if (*((_QWORD *)v5 + 52))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setIadNativeLine:](self, "setIadNativeLine:");
  if (*((_QWORD *)v5 + 49))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setIadNativeAd:](self, "setIadNativeAd:");
  v57 = (uint64_t *)(v5 + 812);
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x800) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v5 + 12);
    *(_QWORD *)&self->_has |= 0x800uLL;
    v58 = *v57;
    if ((*v57 & 0x800000000) == 0)
    {
LABEL_211:
      if ((v58 & 0x20000000) == 0)
        goto LABEL_212;
      goto LABEL_259;
    }
  }
  else if ((v58 & 0x800000000) == 0)
  {
    goto LABEL_211;
  }
  self->_groupFormationReason = *((_DWORD *)v5 + 90);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x20000000) == 0)
  {
LABEL_212:
    if ((v58 & 0x40) == 0)
      goto LABEL_213;
    goto LABEL_260;
  }
LABEL_259:
  self->_feedAutoSubscribeType = *((_DWORD *)v5 + 74);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x40) == 0)
  {
LABEL_213:
    if ((v58 & 0x100) == 0)
      goto LABEL_214;
    goto LABEL_261;
  }
LABEL_260:
  self->_featureCtr = *((double *)v5 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x100) == 0)
  {
LABEL_214:
    if ((v58 & 4) == 0)
      goto LABEL_215;
    goto LABEL_262;
  }
LABEL_261:
  self->_paidNonpaidSubscriptionCtr = *((double *)v5 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 4) == 0)
  {
LABEL_215:
    if ((v58 & 0x10) == 0)
      goto LABEL_216;
    goto LABEL_263;
  }
LABEL_262:
  self->_autoSubscribeCtr = *((double *)v5 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x10) == 0)
  {
LABEL_216:
    if ((v58 & 0x80) == 0)
      goto LABEL_217;
    goto LABEL_264;
  }
LABEL_263:
  self->_computedGlobalScoreCoefficient = *((double *)v5 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x80) == 0)
  {
LABEL_217:
    if ((v58 & 0x4000) == 0)
      goto LABEL_218;
    goto LABEL_265;
  }
LABEL_264:
  self->_globalScore = *((double *)v5 + 8);
  *(_QWORD *)&self->_has |= 0x80uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x4000) == 0)
  {
LABEL_218:
    if ((v58 & 2) == 0)
      goto LABEL_219;
    goto LABEL_266;
  }
LABEL_265:
  self->_userFeedbackScore = *((double *)v5 + 15);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 2) == 0)
  {
LABEL_219:
    if ((v58 & 1) == 0)
      goto LABEL_220;
    goto LABEL_267;
  }
LABEL_266:
  self->_agedUserFeedbackScore = *((double *)v5 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 1) == 0)
  {
LABEL_220:
    if ((v58 & 0x20) == 0)
      goto LABEL_221;
    goto LABEL_268;
  }
LABEL_267:
  self->_agedPersonalizationScore = *((double *)v5 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x20) == 0)
  {
LABEL_221:
    if ((v58 & 0x80000000000) == 0)
      goto LABEL_222;
    goto LABEL_269;
  }
LABEL_268:
  self->_diversifiedPersonalizationScore = *((double *)v5 + 6);
  *(_QWORD *)&self->_has |= 0x20uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x80000000000) == 0)
  {
LABEL_222:
    if ((v58 & 0x400000000000) == 0)
      goto LABEL_223;
    goto LABEL_270;
  }
LABEL_269:
  self->_moduleEventType = *((_DWORD *)v5 + 119);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x400000000000) == 0)
  {
LABEL_223:
    if ((v58 & 0x100000000000) == 0)
      goto LABEL_224;
    goto LABEL_271;
  }
LABEL_270:
  self->_moduleLocation = *((_DWORD *)v5 + 124);
  *(_QWORD *)&self->_has |= 0x400000000000uLL;
  v58 = *(_QWORD *)(v5 + 812);
  if ((v58 & 0x100000000000) == 0)
  {
LABEL_224:
    if ((v58 & 0x200000000000) == 0)
      goto LABEL_226;
    goto LABEL_225;
  }
LABEL_271:
  self->_moduleItemCount = *((_DWORD *)v5 + 122);
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  if ((*(_QWORD *)(v5 + 812) & 0x200000000000) != 0)
  {
LABEL_225:
    self->_moduleItemPosition = *((_DWORD *)v5 + 123);
    *(_QWORD *)&self->_has |= 0x200000000000uLL;
  }
LABEL_226:
  if (*((_QWORD *)v5 + 60))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setModuleExposureId:](self, "setModuleExposureId:");
  if (*((_QWORD *)v5 + 73))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setPreviousWebEmbedId:](self, "setPreviousWebEmbedId:");
  if ((*(_QWORD *)(v5 + 812) & 0x8000000000000) != 0)
  {
    self->_previousWebEmbedLocation = *((_DWORD *)v5 + 148);
    *(_QWORD *)&self->_has |= 0x8000000000000uLL;
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v59 = *((id *)v5 + 87);
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v99, v113, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v100;
    do
    {
      for (k = 0; k != v61; ++k)
      {
        if (*(_QWORD *)v100 != v62)
          objc_enumerationMutation(v59);
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure addSurfacedByTagIds:](self, "addSurfacedByTagIds:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * k));
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v99, v113, 16);
    }
    while (v61);
  }

  if (*((_QWORD *)v5 + 51))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  v64 = *(_QWORD *)(v5 + 812);
  if ((v64 & 0x8000000) != 0)
  {
    self->_curatedContentType = *((_DWORD *)v5 + 68);
    *(_QWORD *)&self->_has |= 0x8000000uLL;
    v64 = *(_QWORD *)(v5 + 812);
  }
  if ((v64 & 0x1000000000) != 0)
  {
    self->_groupLocation = *((_DWORD *)v5 + 91);
    *(_QWORD *)&self->_has |= 0x1000000000uLL;
  }
  if (*((_QWORD *)v5 + 36))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setExposedInLocationId:](self, "setExposedInLocationId:");
  if (*((_QWORD *)v5 + 47))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setGroupViewExposureId:](self, "setGroupViewExposureId:");
  if (*((_QWORD *)v5 + 35))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setExposedGroupSourceChannelId:](self, "setExposedGroupSourceChannelId:");
  v65 = *(_QWORD *)(v5 + 812);
  if ((v65 & 0x40000) != 0)
  {
    self->_articleSuggestionOrigin = *((_DWORD *)v5 + 44);
    *(_QWORD *)&self->_has |= 0x40000uLL;
    v65 = *(_QWORD *)(v5 + 812);
    if ((*((_WORD *)v5 + 410) & 2) == 0)
      goto LABEL_275;
    goto LABEL_274;
  }
  if ((*((_WORD *)v5 + 410) & 2) != 0)
  {
LABEL_274:
    self->_didExpandDuringView = v5[788];
    v66 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 2u;
    *((_BYTE *)&self->_has + 10) = v66;
    v65 = *(_QWORD *)(v5 + 812);
  }
LABEL_275:
  if ((v65 & 0x2000) != 0)
  {
    self->_subscribedChannelCtr = *((double *)v5 + 14);
    *(_QWORD *)&self->_has |= 0x2000uLL;
  }
  alternateHeadline = self->_alternateHeadline;
  v68 = *((_QWORD *)v5 + 17);
  if (alternateHeadline)
  {
    if (v68)
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
  }
  else if (v68)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  if ((*(_QWORD *)(v5 + 812) & 0x20000000000000) != 0)
  {
    self->_rankInVideoPlaylist = *((_DWORD *)v5 + 152);
    *(_QWORD *)&self->_has |= 0x20000000000000uLL;
  }
  issueData = self->_issueData;
  v70 = *((_QWORD *)v5 + 53);
  if (issueData)
  {
    if (v70)
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v70)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v72 = *((_QWORD *)v5 + 54);
  if (issueExposureData)
  {
    if (v72)
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v72)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  v74 = *((_QWORD *)v5 + 56);
  if (issueViewData)
  {
    if (v74)
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else if (v74)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setIssueViewData:](self, "setIssueViewData:");
  }
  if ((*(_QWORD *)(v5 + 812) & 0x40000000000000) != 0)
  {
    self->_role = *((_DWORD *)v5 + 160);
    *(_QWORD *)&self->_has |= 0x40000000000000uLL;
  }
  channelData = self->_channelData;
  v76 = *((_QWORD *)v5 + 29);
  if (channelData)
  {
    if (v76)
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else if (v76)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setChannelData:](self, "setChannelData:");
  }
  issueViewContextData = self->_issueViewContextData;
  v78 = *((_QWORD *)v5 + 55);
  if (issueViewContextData)
  {
    if (v78)
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData mergeFrom:](issueViewContextData, "mergeFrom:");
  }
  else if (v78)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setIssueViewContextData:](self, "setIssueViewContextData:");
  }
  if ((*(_QWORD *)(v5 + 812) & 0x8000000000) != 0)
  {
    self->_heroArticleType = *((_DWORD *)v5 + 96);
    *(_QWORD *)&self->_has |= 0x8000000000uLL;
  }
  if (*((_QWORD *)v5 + 94))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setWebEmbedId:](self, "setWebEmbedId:");
  if (*((_QWORD *)v5 + 33))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure setCuratedBatchId:](self, "setCuratedBatchId:");
  LOBYTE(v79) = *((_WORD *)v5 + 410);
  if ((*((_WORD *)v5 + 410) & 8) != 0)
  {
    self->_isAudioEligible = v5[790];
    v80 = *((_BYTE *)&self->_has + 10);
    *((_WORD *)&self->_has + 4) |= 8u;
    *((_BYTE *)&self->_has + 10) = v80;
    v79 = *((_WORD *)v5 + 410);
  }
  if ((v79 & 0x10) != 0)
  {
    self->_isAudioEngaged = v5[791];
    *((_WORD *)&self->_has + 4) |= 0x10u;
  }
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v81 = *((id *)v5 + 91);
  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v95, v112, 16);
  if (v82)
  {
    v83 = v82;
    v84 = *(_QWORD *)v96;
    do
    {
      for (m = 0; m != v83; ++m)
      {
        if (*(_QWORD *)v96 != v84)
          objc_enumerationMutation(v81);
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure addTopicIds:](self, "addTopicIds:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * m));
      }
      v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v95, v112, 16);
    }
    while (v83);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v86 = *((id *)v5 + 75);
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v91, v111, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v92;
    do
    {
      for (n = 0; n != v88; ++n)
      {
        if (*(_QWORD *)v92 != v89)
          objc_enumerationMutation(v86);
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSArticleHostViewExposure addPurchaseOffersItem:](self, "addPurchaseOffersItem:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * n), (_QWORD)v91);
      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v91, v111, 16);
    }
    while (v88);
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

- (int)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int)backendArticleVersion
{
  return self->_backendArticleVersion;
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

- (int)displayRank
{
  return self->_displayRank;
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (NSString)feedPresentationReasonSearchString
{
  return self->_feedPresentationReasonSearchString;
}

- (void)setFeedPresentationReasonSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_feedPresentationReasonSearchString, a3);
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_parentFeedId, a3);
}

- (BOOL)isUserSubscribedToParentFeed
{
  return self->_isUserSubscribedToParentFeed;
}

- (int)activeTimeSpent
{
  return self->_activeTimeSpent;
}

- (int)maxActiveTimeSpent
{
  return self->_maxActiveTimeSpent;
}

- (BOOL)didBounce
{
  return self->_didBounce;
}

- (BOOL)isNewUserToArticle
{
  return self->_isNewUserToArticle;
}

- (BOOL)didOpenInSafari
{
  return self->_didOpenInSafari;
}

- (BOOL)isExplorationArticle
{
  return self->_isExplorationArticle;
}

- (NSString)sourceBinId
{
  return self->_sourceBinId;
}

- (void)setSourceBinId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBinId, a3);
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)viewFrameInScreen
{
  return self->_viewFrameInScreen;
}

- (void)setViewFrameInScreen:(id)a3
{
  objc_storeStrong((id *)&self->_viewFrameInScreen, a3);
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

- (BOOL)isDigitalReplicaAd
{
  return self->_isDigitalReplicaAd;
}

- (BOOL)isVideoInFeed
{
  return self->_isVideoInFeed;
}

- (BOOL)isTopStoryArticle
{
  return self->_isTopStoryArticle;
}

- (NSString)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(id)a3
{
  objc_storeStrong((id *)&self->_storyType, a3);
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityType, a3);
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

- (BOOL)isSubscribedToGroupFeed
{
  return self->_isSubscribedToGroupFeed;
}

- (int)articleDisplayRankInGroup
{
  return self->_articleDisplayRankInGroup;
}

- (BOOL)subscriptionOnlyArticle
{
  return self->_subscriptionOnlyArticle;
}

- (BOOL)isSharedSubscriptionOnlyArticle
{
  return self->_isSharedSubscriptionOnlyArticle;
}

- (BOOL)isFreeArticle
{
  return self->_isFreeArticle;
}

- (BOOL)isPaidSubscriberToFeed
{
  return self->_isPaidSubscriberToFeed;
}

- (BOOL)isCoverArticle
{
  return self->_isCoverArticle;
}

- (int)coverArticleDisplayRank
{
  return self->_coverArticleDisplayRank;
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (float)maxVerticalScrollPositionEnding
{
  return self->_maxVerticalScrollPositionEnding;
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

- (BOOL)viewFromNotificationDirectOpen
{
  return self->_viewFromNotificationDirectOpen;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (void)setNotificationId:(id)a3
{
  objc_storeStrong((id *)&self->_notificationId, a3);
}

- (NSString)nextArticleAffordanceTypeFeedId
{
  return self->_nextArticleAffordanceTypeFeedId;
}

- (void)setNextArticleAffordanceTypeFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_nextArticleAffordanceTypeFeedId, a3);
}

- (int)groupArticleCountInForYou
{
  return self->_groupArticleCountInForYou;
}

- (int)groupDisplayRankInForYou
{
  return self->_groupDisplayRankInForYou;
}

- (BOOL)articleLoaded
{
  return self->_articleLoaded;
}

- (NSString)previousArticleId
{
  return self->_previousArticleId;
}

- (void)setPreviousArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_previousArticleId, a3);
}

- (int)widgetSectionArticleRank
{
  return self->_widgetSectionArticleRank;
}

- (int)widgetArticleRank
{
  return self->_widgetArticleRank;
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, a3);
}

- (BOOL)isBreakingNewsArticle
{
  return self->_isBreakingNewsArticle;
}

- (int)breakingNewsArticlePosition
{
  return self->_breakingNewsArticlePosition;
}

- (int)breakingNewsArticleCount
{
  return self->_breakingNewsArticleCount;
}

- (int)topStoryMandatoryArticleCount
{
  return self->_topStoryMandatoryArticleCount;
}

- (int)topStoryOptionalArticleCount
{
  return self->_topStoryOptionalArticleCount;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (BOOL)isSubscribedToSourceChannel
{
  return self->_isSubscribedToSourceChannel;
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

- (NSString)previousArticleVersion
{
  return self->_previousArticleVersion;
}

- (void)setPreviousArticleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_previousArticleVersion, a3);
}

- (NSString)anfComponentId
{
  return self->_anfComponentId;
}

- (void)setAnfComponentId:(id)a3
{
  objc_storeStrong((id *)&self->_anfComponentId, a3);
}

- (BOOL)badgeExposure
{
  return self->_badgeExposure;
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEngagement, a3);
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

- (double)featureCtr
{
  return self->_featureCtr;
}

- (double)paidNonpaidSubscriptionCtr
{
  return self->_paidNonpaidSubscriptionCtr;
}

- (double)autoSubscribeCtr
{
  return self->_autoSubscribeCtr;
}

- (double)computedGlobalScoreCoefficient
{
  return self->_computedGlobalScoreCoefficient;
}

- (double)globalScore
{
  return self->_globalScore;
}

- (double)userFeedbackScore
{
  return self->_userFeedbackScore;
}

- (double)agedUserFeedbackScore
{
  return self->_agedUserFeedbackScore;
}

- (double)agedPersonalizationScore
{
  return self->_agedPersonalizationScore;
}

- (double)diversifiedPersonalizationScore
{
  return self->_diversifiedPersonalizationScore;
}

- (int)moduleItemCount
{
  return self->_moduleItemCount;
}

- (int)moduleItemPosition
{
  return self->_moduleItemPosition;
}

- (NSData)moduleExposureId
{
  return self->_moduleExposureId;
}

- (void)setModuleExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_moduleExposureId, a3);
}

- (NSString)previousWebEmbedId
{
  return self->_previousWebEmbedId;
}

- (void)setPreviousWebEmbedId:(id)a3
{
  objc_storeStrong((id *)&self->_previousWebEmbedId, a3);
}

- (NSMutableArray)surfacedByTagIds
{
  return self->_surfacedByTagIds;
}

- (void)setSurfacedByTagIds:(id)a3
{
  objc_storeStrong((id *)&self->_surfacedByTagIds, a3);
}

- (NSString)iadNativeCampaignAd
{
  return self->_iadNativeCampaignAd;
}

- (void)setIadNativeCampaignAd:(id)a3
{
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, a3);
}

- (NSString)exposedInLocationId
{
  return self->_exposedInLocationId;
}

- (void)setExposedInLocationId:(id)a3
{
  objc_storeStrong((id *)&self->_exposedInLocationId, a3);
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
}

- (NSString)exposedGroupSourceChannelId
{
  return self->_exposedGroupSourceChannelId;
}

- (void)setExposedGroupSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_exposedGroupSourceChannelId, a3);
}

- (BOOL)didExpandDuringView
{
  return self->_didExpandDuringView;
}

- (double)subscribedChannelCtr
{
  return self->_subscribedChannelCtr;
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSAlternateHeadline)alternateHeadline
{
  return self->_alternateHeadline;
}

- (void)setAlternateHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_alternateHeadline, a3);
}

- (int)rankInVideoPlaylist
{
  return self->_rankInVideoPlaylist;
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
  objc_storeStrong((id *)&self->_issueExposureData, a3);
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewData, a3);
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
{
  objc_storeStrong((id *)&self->_channelData, a3);
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueViewContextData)issueViewContextData
{
  return self->_issueViewContextData;
}

- (void)setIssueViewContextData:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewContextData, a3);
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
  objc_storeStrong((id *)&self->_webEmbedId, a3);
}

- (NSString)curatedBatchId
{
  return self->_curatedBatchId;
}

- (void)setCuratedBatchId:(id)a3
{
  objc_storeStrong((id *)&self->_curatedBatchId, a3);
}

- (BOOL)isAudioEligible
{
  return self->_isAudioEligible;
}

- (BOOL)isAudioEngaged
{
  return self->_isAudioEngaged;
}

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
  objc_storeStrong((id *)&self->_topicIds, a3);
}

- (NSMutableArray)purchaseOffersItems
{
  return self->_purchaseOffersItems;
}

- (void)setPurchaseOffersItems:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseOffersItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_viewFrameInScreen, 0);
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedByTagIds, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_storyType, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sourceBinId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_purchaseOffersItems, 0);
  objc_storeStrong((id *)&self->_previousWebEmbedId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_nextArticleAffordanceTypeFeedId, 0);
  objc_storeStrong((id *)&self->_nativeCampaignData, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_moduleExposureId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueViewContextData, 0);
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
  objc_storeStrong((id *)&self->_feedPresentationReasonSearchString, 0);
  objc_storeStrong((id *)&self->_exposedInLocationId, 0);
  objc_storeStrong((id *)&self->_exposedGroupSourceChannelId, 0);
  objc_storeStrong((id *)&self->_curatedBatchId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
  objc_storeStrong((id *)&self->_anfComponentId, 0);
  objc_storeStrong((id *)&self->_alternateHeadline, 0);
}

@end
