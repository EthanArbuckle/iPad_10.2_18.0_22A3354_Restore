@implementation NTPBFeedCellHostViewExposure

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
    return off_24CD4E6E0[a3];
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

- (int)areaPresentationReason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_areaPresentationReason;
  else
    return 0;
}

- (void)setAreaPresentationReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_areaPresentationReason = a3;
}

- (void)setHasAreaPresentationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAreaPresentationReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)areaPresentationReasonAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4E768[a3];
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

- (BOOL)hasTopicFeedId
{
  return self->_topicFeedId != 0;
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

- (void)setPickFavsButtonExposed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_pickFavsButtonExposed = a3;
}

- (void)setHasPickFavsButtonExposed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPickFavsButtonExposed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)userAction
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserAction
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)NTPBFeedCellHostViewExposure;
  -[NTPBFeedCellHostViewExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBFeedCellHostViewExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t feedCellHostType;
  __CFString *v6;
  uint64_t areaPresentationReason;
  __CFString *v8;
  NSString *topicFeedId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  char v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellHostType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_24CD4E6E0[feedCellHostType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("feed_cell_host_type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    areaPresentationReason = self->_areaPresentationReason;
    if (areaPresentationReason >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_areaPresentationReason);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_24CD4E768[areaPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("area_presentation_reason"));

  }
  topicFeedId = self->_topicFeedId;
  if (topicFeedId)
    objc_msgSend(v3, "setObject:forKey:", topicFeedId, CFSTR("topic_feed_id"));
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  v13 = (char)self->_has;
  if ((v13 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pickFavsButtonExposed);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("pick_favs_button_exposed"));

    v13 = (char)self->_has;
  }
  if ((v13 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("user_action"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedCellHostViewExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_topicFeedId)
    PBDataWriterWriteStringField();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0)
    PBDataWriterWriteInt32Field();

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
  char v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_feedCellHostType;
    *(_BYTE *)(v5 + 64) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_areaPresentationReason;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_topicFeedId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v14;

  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    *(_BYTE *)(v6 + 60) = self->_pickFavsButtonExposed;
    *(_BYTE *)(v6 + 64) |= 8u;
    v16 = (char)self->_has;
  }
  if ((v16 & 4) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_userAction;
    *(_BYTE *)(v6 + 64) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *topicFeedId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 10))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_areaPresentationReason != *((_DWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_32;
  }
  topicFeedId = self->_topicFeedId;
  if ((unint64_t)topicFeedId | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](topicFeedId, "isEqual:"))
  {
    goto LABEL_32;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_32;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_32;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) != 0)
    {
      if (self->_pickFavsButtonExposed)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_32;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_28;
    }
LABEL_32:
    v9 = 0;
    goto LABEL_33;
  }
  if ((*((_BYTE *)v4 + 64) & 8) != 0)
    goto LABEL_32;
LABEL_28:
  v9 = (*((_BYTE *)v4 + 64) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_userAction != *((_DWORD *)v4 + 14))
      goto LABEL_32;
    v9 = 1;
  }
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_feedCellHostType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_areaPresentationReason;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_topicFeedId, "hash");
  v6 = -[NSString hash](self->_campaignId, "hash");
  v7 = -[NSString hash](self->_campaignType, "hash");
  v8 = -[NSString hash](self->_creativeId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v9 = 2654435761 * self->_pickFavsButtonExposed;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_10:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_8:
  v10 = 2654435761 * self->_userAction;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 2) != 0)
  {
    self->_feedCellHostType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 64);
  }
  if ((v5 & 1) != 0)
  {
    self->_areaPresentationReason = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBFeedCellHostViewExposure setTopicFeedId:](self, "setTopicFeedId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBFeedCellHostViewExposure setCampaignId:](self, "setCampaignId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBFeedCellHostViewExposure setCampaignType:](self, "setCampaignType:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBFeedCellHostViewExposure setCreativeId:](self, "setCreativeId:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 64);
  if ((v6 & 8) != 0)
  {
    self->_pickFavsButtonExposed = *((_BYTE *)v4 + 60);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 64);
  }
  if ((v6 & 4) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)topicFeedId
{
  return self->_topicFeedId;
}

- (void)setTopicFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_topicFeedId, a3);
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

- (BOOL)pickFavsButtonExposed
{
  return self->_pickFavsButtonExposed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicFeedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end
