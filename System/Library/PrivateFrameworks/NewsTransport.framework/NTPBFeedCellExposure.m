@implementation NTPBFeedCellExposure

- (int)feedType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFeedType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD505A0[a3];
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
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)feedCellSection
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_feedCellSection;
  else
    return 0;
}

- (void)setFeedCellSection:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeedCellSection
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 < 0x12)
    return off_24CD50650[a3];
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

- (void)setDisplayRankInSection:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_displayRankInSection = a3;
}

- (void)setHasDisplayRankInSection:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayRankInSection
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasViewFrameInScreen
{
  return self->_viewFrameInScreen != 0;
}

- (int)feedCellHostType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_feedCellHostType;
  else
    return 0;
}

- (void)setFeedCellHostType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_feedCellHostType = a3;
}

- (void)setHasFeedCellHostType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedCellHostType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)feedCellHostTypeAsString:(int)a3
{
  if (a3 < 0x11)
    return off_24CD506E0[a3];
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

- (BOOL)hasFeedCellHostExposureId
{
  return self->_feedCellHostExposureId != 0;
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
  v8.super_class = (Class)NTPBFeedCellExposure;
  -[NTPBFeedCellExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBFeedCellExposure dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v8;
  NSString *viewFrameInScreen;
  uint64_t feedCellHostType;
  __CFString *v11;
  void *v12;
  uint64_t feedCellSection;
  __CFString *v14;
  NSData *feedCellHostExposureId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD505A0[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("feed_type"));

  }
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("is_user_subscribed_to_feed"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 1) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  feedCellSection = self->_feedCellSection;
  if (feedCellSection >= 0x12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellSection);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24CD50650[feedCellSection];
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("feed_cell_section"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_displayRankInSection);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("display_rank_in_section"));

  }
LABEL_12:
  viewFrameInScreen = self->_viewFrameInScreen;
  if (viewFrameInScreen)
    objc_msgSend(v3, "setObject:forKey:", viewFrameInScreen, CFSTR("view_frame_in_screen"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellHostType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_24CD506E0[feedCellHostType];
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("feed_cell_host_type"));

  }
  feedCellHostExposureId = self->_feedCellHostExposureId;
  if (feedCellHostExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedCellHostExposureId, CFSTR("feed_cell_host_exposure_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedCellExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_feedId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_9:
  if (self->_viewFrameInScreen)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_feedCellHostExposureId)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_feedType;
    *(_BYTE *)(v5 + 60) |= 8u;
  }
  v7 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 56) = self->_isUserSubscribedToFeed;
    *(_BYTE *)(v6 + 60) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 28) = self->_feedCellSection;
  *(_BYTE *)(v6 + 60) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 8) = self->_displayRankInSection;
    *(_BYTE *)(v6 + 60) |= 1u;
  }
LABEL_7:
  v10 = -[NSString copyWithZone:](self->_viewFrameInScreen, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_feedCellHostType;
    *(_BYTE *)(v6 + 60) |= 2u;
  }
  v12 = -[NSData copyWithZone:](self->_feedCellHostExposureId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *feedId;
  NSString *viewFrameInScreen;
  NSData *feedCellHostExposureId;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_feedType != *((_DWORD *)v4 + 10))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_38;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_38;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0)
      goto LABEL_38;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 7))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_displayRankInSection != *((_DWORD *)v4 + 2))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_38;
  }
  viewFrameInScreen = self->_viewFrameInScreen;
  if ((unint64_t)viewFrameInScreen | *((_QWORD *)v4 + 6))
  {
    if (-[NSString isEqual:](viewFrameInScreen, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_31;
    }
LABEL_38:
    v9 = 0;
    goto LABEL_39;
  }
LABEL_31:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 6))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_38;
  }
  feedCellHostExposureId = self->_feedCellHostExposureId;
  if ((unint64_t)feedCellHostExposureId | *((_QWORD *)v4 + 2))
    v9 = -[NSData isEqual:](feedCellHostExposureId, "isEqual:");
  else
    v9 = 1;
LABEL_39:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 8) != 0)
    v3 = 2654435761 * self->_feedType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_feedId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v5 = 2654435761 * self->_isUserSubscribedToFeed;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v6 = 2654435761 * self->_feedCellSection;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_displayRankInSection;
    goto LABEL_11;
  }
LABEL_10:
  v7 = 0;
LABEL_11:
  v8 = -[NSString hash](self->_viewFrameInScreen, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_feedCellHostType;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSData hash](self->_feedCellHostExposureId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    self->_feedType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBFeedCellExposure setFeedId:](self, "setFeedId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 0x10) != 0)
  {
    self->_isUserSubscribedToFeed = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_feedCellSection = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_8:
    self->_displayRankInSection = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBFeedCellExposure setViewFrameInScreen:](self, "setViewFrameInScreen:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    self->_feedCellHostType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBFeedCellExposure setFeedCellHostExposureId:](self, "setFeedCellHostExposureId:");
    v4 = v6;
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

- (int)displayRankInSection
{
  return self->_displayRankInSection;
}

- (NSString)viewFrameInScreen
{
  return self->_viewFrameInScreen;
}

- (void)setViewFrameInScreen:(id)a3
{
  objc_storeStrong((id *)&self->_viewFrameInScreen, a3);
}

- (NSData)feedCellHostExposureId
{
  return self->_feedCellHostExposureId;
}

- (void)setFeedCellHostExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedCellHostExposureId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewFrameInScreen, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_feedCellHostExposureId, 0);
}

@end
