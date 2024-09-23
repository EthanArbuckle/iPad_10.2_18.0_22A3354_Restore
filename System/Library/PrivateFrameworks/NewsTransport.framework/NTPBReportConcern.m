@implementation NTPBReportConcern

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (int)concernReason
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_concernReason;
  else
    return 0;
}

- (void)setConcernReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_concernReason = a3;
}

- (void)setHasConcernReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasConcernReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasConcernComments
{
  return self->_concernComments != 0;
}

- (int)contentType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_contentType;
  else
    return 0;
}

- (void)setContentType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasContentType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD4F1F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContentType:(id)a3
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

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (void)setPublisherArticleVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPublisherArticleVersion
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBackendArticleVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBackendArticleVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasArticleParentFeedId
{
  return self->_articleParentFeedId != 0;
}

- (int)articleParentFeedType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_articleParentFeedType;
  else
    return 0;
}

- (void)setArticleParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_articleParentFeedType = a3;
}

- (void)setHasArticleParentFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasArticleParentFeedType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)articleParentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4F228[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArticleParentFeedType:(id)a3
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

- (int)feedFeedType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_feedFeedType;
  else
    return 0;
}

- (void)setFeedFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_feedFeedType = a3;
}

- (void)setHasFeedFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFeedFeedType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)feedFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4F228[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedFeedType:(id)a3
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

- (int)articleFeedCellHostType
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_articleFeedCellHostType;
  else
    return 0;
}

- (void)setArticleFeedCellHostType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_articleFeedCellHostType = a3;
}

- (void)setHasArticleFeedCellHostType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasArticleFeedCellHostType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)articleFeedCellHostTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_24CD4F2D8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArticleFeedCellHostType:(id)a3
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

- (int)articleFeedCellSection
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_articleFeedCellSection;
  else
    return 0;
}

- (void)setArticleFeedCellSection:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_articleFeedCellSection = a3;
}

- (void)setHasArticleFeedCellSection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasArticleFeedCellSection
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)articleFeedCellSectionAsString:(int)a3
{
  if (a3 < 0x12)
    return off_24CD4F320[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArticleFeedCellSection:(id)a3
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

- (int)feedViewPresentationReason
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_feedViewPresentationReason;
  else
    return 0;
}

- (void)setFeedViewPresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_feedViewPresentationReason = a3;
}

- (void)setHasFeedViewPresentationReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFeedViewPresentationReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)feedViewPresentationReasonAsString:(int)a3
{
  if (a3 < 0x2C)
    return off_24CD4F3B0[a3];
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

- (BOOL)hasFeedPresentationSearchString
{
  return self->_feedPresentationSearchString != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (int)originProductType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_originProductType;
  else
    return 0;
}

- (void)setOriginProductType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_originProductType = a3;
}

- (void)setHasOriginProductType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOriginProductType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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
  v8.super_class = (Class)NTPBReportConcern;
  -[NTPBReportConcern description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBReportConcern dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientId;
  void *v6;
  NSString *concernComments;
  uint64_t contentType;
  __CFString *v9;
  NSString *contentId;
  NSString *referencedArticleId;
  __int16 has;
  void *v13;
  void *v14;
  NSString *articleParentFeedId;
  __int16 v16;
  uint64_t articleParentFeedType;
  __CFString *v18;
  uint64_t feedFeedType;
  __CFString *v20;
  uint64_t articleFeedCellHostType;
  __CFString *v22;
  uint64_t articleFeedCellSection;
  __CFString *v24;
  uint64_t feedViewPresentationReason;
  __CFString *v26;
  NSString *feedPresentationSearchString;
  void *v28;
  NSString *userId;
  void *v30;
  id v31;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_reportVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("report_version"));

  clientId = self->_clientId;
  if (clientId)
    objc_msgSend(v3, "setObject:forKey:", clientId, CFSTR("client_id"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_concernReason);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("concern_reason"));

  }
  concernComments = self->_concernComments;
  if (concernComments)
    objc_msgSend(v3, "setObject:forKey:", concernComments, CFSTR("concern_comments"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    contentType = self->_contentType;
    if (contentType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_contentType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_24CD4F1F8[contentType];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("content_type"));

  }
  contentId = self->_contentId;
  if (contentId)
    objc_msgSend(v3, "setObject:forKey:", contentId, CFSTR("content_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("publisher_article_version"));

    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("backend_article_version"));

  }
  articleParentFeedId = self->_articleParentFeedId;
  if (articleParentFeedId)
    objc_msgSend(v3, "setObject:forKey:", articleParentFeedId, CFSTR("article_parent_feed_id"));
  v16 = (__int16)self->_has;
  if ((v16 & 0x10) != 0)
  {
    articleParentFeedType = self->_articleParentFeedType;
    if (articleParentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleParentFeedType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_24CD4F228[articleParentFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("article_parent_feed_type"));

    v16 = (__int16)self->_has;
    if ((v16 & 0x80) == 0)
    {
LABEL_24:
      if ((v16 & 4) == 0)
        goto LABEL_25;
      goto LABEL_36;
    }
  }
  else if ((v16 & 0x80) == 0)
  {
    goto LABEL_24;
  }
  feedFeedType = self->_feedFeedType;
  if (feedFeedType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedFeedType);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_24CD4F228[feedFeedType];
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("feed_feed_type"));

  v16 = (__int16)self->_has;
  if ((v16 & 4) == 0)
  {
LABEL_25:
    if ((v16 & 8) == 0)
      goto LABEL_26;
    goto LABEL_40;
  }
LABEL_36:
  articleFeedCellHostType = self->_articleFeedCellHostType;
  if (articleFeedCellHostType >= 9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleFeedCellHostType);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_24CD4F2D8[articleFeedCellHostType];
  }
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("article_feed_cell_host_type"));

  v16 = (__int16)self->_has;
  if ((v16 & 8) == 0)
  {
LABEL_26:
    if ((v16 & 0x100) == 0)
      goto LABEL_48;
    goto LABEL_44;
  }
LABEL_40:
  articleFeedCellSection = self->_articleFeedCellSection;
  if (articleFeedCellSection >= 0x12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleFeedCellSection);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_24CD4F320[articleFeedCellSection];
  }
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("article_feed_cell_section"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_44:
    feedViewPresentationReason = self->_feedViewPresentationReason;
    if (feedViewPresentationReason >= 0x2C)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedViewPresentationReason);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_24CD4F3B0[feedViewPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("feed_view_presentation_reason"));

  }
LABEL_48:
  feedPresentationSearchString = self->_feedPresentationSearchString;
  if (feedPresentationSearchString)
    objc_msgSend(v3, "setObject:forKey:", feedPresentationSearchString, CFSTR("feed_presentation_search_string"));
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("is_user_subscribed_to_feed"));

  }
  userId = self->_userId;
  if (userId)
    objc_msgSend(v3, "setObject:forKey:", userId, CFSTR("user_id"));
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_originProductType);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("origin_product_type"));

  }
  v31 = v3;

  return v31;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBReportConcernReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  __int16 has;
  __int16 v6;
  id v7;

  v7 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_clientId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  v4 = v7;
  if (self->_concernComments)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_contentId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
  if (self->_articleParentFeedId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_19:
      if ((v6 & 4) == 0)
        goto LABEL_20;
      goto LABEL_36;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 8) == 0)
      goto LABEL_21;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_21:
    if ((v6 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_22:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_23:
  if (self->_feedPresentationSearchString)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
  if (self->_referencedArticleId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  uint64_t v10;
  void *v11;
  __int16 has;
  uint64_t v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 112) = self->_reportVersion;
  v6 = -[NSString copyWithZone:](self->_clientId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_concernReason;
    *(_WORD *)(v5 + 132) |= 0x20u;
  }
  v8 = -[NSString copyWithZone:](self->_concernComments, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_contentType;
    *(_WORD *)(v5 + 132) |= 0x40u;
  }
  v10 = -[NSString copyWithZone:](self->_contentId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_publisherArticleVersion;
    *(_WORD *)(v5 + 132) |= 2u;
    has = (__int16)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_backendArticleVersion;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  v13 = -[NSString copyWithZone:](self->_articleParentFeedId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = (__int16)self->_has;
  if ((v15 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_articleParentFeedType;
    *(_WORD *)(v5 + 132) |= 0x10u;
    v15 = (__int16)self->_has;
    if ((v15 & 0x80) == 0)
    {
LABEL_11:
      if ((v15 & 4) == 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v5 + 84) = self->_feedFeedType;
  *(_WORD *)(v5 + 132) |= 0x80u;
  v15 = (__int16)self->_has;
  if ((v15 & 4) == 0)
  {
LABEL_12:
    if ((v15 & 8) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 24) = self->_articleFeedCellHostType;
  *(_WORD *)(v5 + 132) |= 4u;
  v15 = (__int16)self->_has;
  if ((v15 & 8) == 0)
  {
LABEL_13:
    if ((v15 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_23:
  *(_DWORD *)(v5 + 28) = self->_articleFeedCellSection;
  *(_WORD *)(v5 + 132) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 96) = self->_feedViewPresentationReason;
    *(_WORD *)(v5 + 132) |= 0x100u;
  }
LABEL_15:
  v16 = -[NSString copyWithZone:](self->_feedPresentationSearchString, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v16;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 128) = self->_isUserSubscribedToFeed;
    *(_WORD *)(v5 + 132) |= 0x400u;
  }
  v18 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v18;

  v20 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v20;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_originProductType;
    *(_WORD *)(v5 + 132) |= 0x200u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientId;
  __int16 has;
  __int16 v7;
  NSString *concernComments;
  __int16 v9;
  NSString *contentId;
  __int16 v11;
  NSString *articleParentFeedId;
  __int16 v13;
  NSString *feedPresentationSearchString;
  NSString *referencedArticleId;
  NSString *userId;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_79;
  if (self->_reportVersion != *((_DWORD *)v4 + 28))
    goto LABEL_79;
  clientId = self->_clientId;
  if ((unint64_t)clientId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](clientId, "isEqual:"))
      goto LABEL_79;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 66);
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_concernReason != *((_DWORD *)v4 + 16))
      goto LABEL_79;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  concernComments = self->_concernComments;
  if ((unint64_t)concernComments | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](concernComments, "isEqual:"))
      goto LABEL_79;
    has = (__int16)self->_has;
  }
  v9 = *((_WORD *)v4 + 66);
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_contentType != *((_DWORD *)v4 + 20))
      goto LABEL_79;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:"))
      goto LABEL_79;
    has = (__int16)self->_has;
  }
  v11 = *((_WORD *)v4 + 66);
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_publisherArticleVersion != *((_QWORD *)v4 + 2))
      goto LABEL_79;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_backendArticleVersion != *((_QWORD *)v4 + 1))
      goto LABEL_79;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_79;
  }
  articleParentFeedId = self->_articleParentFeedId;
  if ((unint64_t)articleParentFeedId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](articleParentFeedId, "isEqual:"))
      goto LABEL_79;
    has = (__int16)self->_has;
  }
  v13 = *((_WORD *)v4 + 66);
  if ((has & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_articleParentFeedType != *((_DWORD *)v4 + 10))
      goto LABEL_79;
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_feedFeedType != *((_DWORD *)v4 + 21))
      goto LABEL_79;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_articleFeedCellHostType != *((_DWORD *)v4 + 6))
      goto LABEL_79;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_articleFeedCellSection != *((_DWORD *)v4 + 7))
      goto LABEL_79;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) == 0 || self->_feedViewPresentationReason != *((_DWORD *)v4 + 24))
      goto LABEL_79;
  }
  else if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  feedPresentationSearchString = self->_feedPresentationSearchString;
  if ((unint64_t)feedPresentationSearchString | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](feedPresentationSearchString, "isEqual:"))
      goto LABEL_79;
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x400) != 0)
    {
      if (self->_isUserSubscribedToFeed)
      {
        if (!*((_BYTE *)v4 + 128))
          goto LABEL_79;
        goto LABEL_70;
      }
      if (!*((_BYTE *)v4 + 128))
        goto LABEL_70;
    }
LABEL_79:
    v17 = 0;
    goto LABEL_80;
  }
  if ((*((_WORD *)v4 + 66) & 0x400) != 0)
    goto LABEL_79;
LABEL_70:
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](referencedArticleId, "isEqual:"))
  {
    goto LABEL_79;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](userId, "isEqual:"))
      goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0 || self->_originProductType != *((_DWORD *)v4 + 25))
      goto LABEL_79;
    v17 = 1;
  }
  else
  {
    v17 = (*((_WORD *)v4 + 66) & 0x200) == 0;
  }
LABEL_80:

  return v17;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  NSUInteger v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t reportVersion;

  reportVersion = self->_reportVersion;
  v24 = -[NSString hash](self->_clientId, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v23 = 2654435761 * self->_concernReason;
  else
    v23 = 0;
  v22 = -[NSString hash](self->_concernComments, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v21 = 2654435761 * self->_contentType;
  else
    v21 = 0;
  v20 = -[NSString hash](self->_contentId, "hash");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v19 = 2654435761 * self->_publisherArticleVersion;
    if ((has & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v19 = 0;
    if ((has & 1) != 0)
    {
LABEL_9:
      v18 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_12;
    }
  }
  v18 = 0;
LABEL_12:
  v17 = -[NSString hash](self->_articleParentFeedId, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    v15 = 2654435761 * self->_articleParentFeedType;
    if ((v4 & 0x80) != 0)
    {
LABEL_14:
      v5 = 2654435761 * self->_feedFeedType;
      if ((v4 & 4) != 0)
        goto LABEL_15;
      goto LABEL_20;
    }
  }
  else
  {
    v15 = 0;
    if ((v4 & 0x80) != 0)
      goto LABEL_14;
  }
  v5 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_15:
    v6 = 2654435761 * self->_articleFeedCellHostType;
    if ((v4 & 8) != 0)
      goto LABEL_16;
LABEL_21:
    v7 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_17;
    goto LABEL_22;
  }
LABEL_20:
  v6 = 0;
  if ((v4 & 8) == 0)
    goto LABEL_21;
LABEL_16:
  v7 = 2654435761 * self->_articleFeedCellSection;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_17:
    v8 = 2654435761 * self->_feedViewPresentationReason;
    goto LABEL_23;
  }
LABEL_22:
  v8 = 0;
LABEL_23:
  v9 = -[NSString hash](self->_feedPresentationSearchString, "hash", v15);
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v10 = 2654435761 * self->_isUserSubscribedToFeed;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_referencedArticleId, "hash");
  v12 = -[NSString hash](self->_userId, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v13 = 2654435761 * self->_originProductType;
  else
    v13 = 0;
  return v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ (2654435761 * reportVersion) ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  self->_reportVersion = *((_DWORD *)v4 + 28);
  v7 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBReportConcern setClientId:](self, "setClientId:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 66) & 0x20) != 0)
  {
    self->_concernReason = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBReportConcern setConcernComments:](self, "setConcernComments:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 66) & 0x40) != 0)
  {
    self->_contentType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBReportConcern setContentId:](self, "setContentId:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 66);
  if ((v5 & 2) != 0)
  {
    self->_publisherArticleVersion = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)v4 + 66);
  }
  if ((v5 & 1) != 0)
  {
    self->_backendArticleVersion = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBReportConcern setArticleParentFeedId:](self, "setArticleParentFeedId:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x10) != 0)
  {
    self->_articleParentFeedType = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
    v6 = *((_WORD *)v4 + 66);
    if ((v6 & 0x80) == 0)
    {
LABEL_19:
      if ((v6 & 4) == 0)
        goto LABEL_20;
      goto LABEL_36;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_19;
  }
  self->_feedFeedType = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x80u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 8) == 0)
      goto LABEL_21;
    goto LABEL_37;
  }
LABEL_36:
  self->_articleFeedCellHostType = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  v6 = *((_WORD *)v4 + 66);
  if ((v6 & 8) == 0)
  {
LABEL_21:
    if ((v6 & 0x100) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_37:
  self->_articleFeedCellSection = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
LABEL_22:
    self->_feedViewPresentationReason = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_23:
  if (*((_QWORD *)v4 + 11))
  {
    -[NTPBReportConcern setFeedPresentationSearchString:](self, "setFeedPresentationSearchString:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 66) & 0x400) != 0)
  {
    self->_isUserSubscribedToFeed = *((_BYTE *)v4 + 128);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[NTPBReportConcern setReferencedArticleId:](self, "setReferencedArticleId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[NTPBReportConcern setUserId:](self, "setUserId:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    self->_originProductType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_has |= 0x200u;
  }

}

- (int)reportVersion
{
  return self->_reportVersion;
}

- (void)setReportVersion:(int)a3
{
  self->_reportVersion = a3;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
  objc_storeStrong((id *)&self->_clientId, a3);
}

- (NSString)concernComments
{
  return self->_concernComments;
}

- (void)setConcernComments:(id)a3
{
  objc_storeStrong((id *)&self->_concernComments, a3);
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

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (NSString)articleParentFeedId
{
  return self->_articleParentFeedId;
}

- (void)setArticleParentFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_articleParentFeedId, a3);
}

- (NSString)feedPresentationSearchString
{
  return self->_feedPresentationSearchString;
}

- (void)setFeedPresentationSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_feedPresentationSearchString, a3);
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_feedPresentationSearchString, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_concernComments, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_articleParentFeedId, 0);
}

@end
