@implementation NTPBTodayWidgetHeadlineExposure

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasWidgetSectionId
{
  return self->_widgetSectionId != 0;
}

- (void)setWidgetSectionDisplayRank:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_widgetSectionDisplayRank = a3;
}

- (void)setHasWidgetSectionDisplayRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasWidgetSectionDisplayRank
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setWidgetArticleRankInSection:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_widgetArticleRankInSection = a3;
}

- (void)setHasWidgetArticleRankInSection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWidgetArticleRankInSection
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setWidgetArticleRank:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_widgetArticleRank = a3;
}

- (void)setHasWidgetArticleRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidgetArticleRank
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWidgetArticleCount:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_widgetArticleCount = a3;
}

- (void)setHasWidgetArticleCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWidgetArticleCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWidgetArticleCountInSection:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_widgetArticleCountInSection = a3;
}

- (void)setHasWidgetArticleCountInSection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetArticleCountInSection
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)widgetContentType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_widgetContentType;
  else
    return 0;
}

- (void)setWidgetContentType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_widgetContentType = a3;
}

- (void)setHasWidgetContentType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWidgetContentType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)widgetContentTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD536F0 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetContentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_HEADLINE_WIDGET_CONTENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WEB_EMBED_WIDGET_CONTENT_TYPE")))
  {
    v4 = 2;
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

- (BOOL)hasAlternateHeadline
{
  return self->_alternateHeadline != 0;
}

- (int)widgetExposureStackLocation
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_widgetExposureStackLocation;
  else
    return 0;
}

- (void)setWidgetExposureStackLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_widgetExposureStackLocation = a3;
}

- (void)setHasWidgetExposureStackLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWidgetExposureStackLocation
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)widgetExposureStackLocationAsString:(int)a3
{
  if (a3 < 6)
    return *(&off_24CD53708 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetExposureStackLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TODAY_PAGE_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_SCREEN_PAGE_ONE_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_SCREEN_PAGE_TWO_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_SCREEN_PAGE_THREE_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_SCREEN_OTHER_PAGES_WIDGET_EXPOSURE_STACK_LOCATION")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)widgetType
{
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    return self->_widgetType;
  else
    return 0;
}

- (void)setWidgetType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_widgetType = a3;
}

- (void)setHasWidgetType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasWidgetType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)widgetTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_24CD53738 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PINNED_WIDGET_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_STACK_WIDGET_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NON_SMART_STACK_WIDGET_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasWidgetSectionSubid
{
  return self->_widgetSectionSubid != 0;
}

- (BOOL)hasStoryType
{
  return self->_storyType != 0;
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
  v8.super_class = (Class)NTPBTodayWidgetHeadlineExposure;
  -[NTPBTodayWidgetHeadlineExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTodayWidgetHeadlineExposure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *widgetSectionId;
  char has;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t widgetContentType;
  void *v15;
  NSString *webEmbedId;
  NTPBAlternateHeadline *alternateHeadline;
  void *v18;
  char v19;
  uint64_t widgetExposureStackLocation;
  void *v21;
  uint64_t widgetType;
  void *v23;
  NSString *widgetSectionSubid;
  NSString *storyType;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  widgetSectionId = self->_widgetSectionId;
  if (widgetSectionId)
    objc_msgSend(v4, "setObject:forKey:", widgetSectionId, CFSTR("widget_section_id"));
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetSectionDisplayRank);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("widget_section_display_rank"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleRankInSection);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("widget_article_rank_in_section"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleRank);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("widget_article_rank"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("widget_article_count"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleCountInSection);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("widget_article_count_in_section"));

  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_23;
LABEL_19:
  widgetContentType = self->_widgetContentType;
  if (widgetContentType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetContentType);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = *(&off_24CD536F0 + widgetContentType);
  }
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("widget_content_type"));

LABEL_23:
  webEmbedId = self->_webEmbedId;
  if (webEmbedId)
    objc_msgSend(v4, "setObject:forKey:", webEmbedId, CFSTR("web_embed_id"));
  alternateHeadline = self->_alternateHeadline;
  if (alternateHeadline)
  {
    -[NTPBAlternateHeadline dictionaryRepresentation](alternateHeadline, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("alternate_headline"));

  }
  v19 = (char)self->_has;
  if ((v19 & 0x20) != 0)
  {
    widgetExposureStackLocation = self->_widgetExposureStackLocation;
    if (widgetExposureStackLocation >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetExposureStackLocation);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = *(&off_24CD53708 + widgetExposureStackLocation);
    }
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("widget_exposure_stack_location"));

    v19 = (char)self->_has;
  }
  if (v19 < 0)
  {
    widgetType = self->_widgetType;
    if (widgetType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetType);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = *(&off_24CD53738 + widgetType);
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("widget_type"));

  }
  widgetSectionSubid = self->_widgetSectionSubid;
  if (widgetSectionSubid)
    objc_msgSend(v4, "setObject:forKey:", widgetSectionSubid, CFSTR("widget_section_subid"));
  storyType = self->_storyType;
  if (storyType)
    objc_msgSend(v4, "setObject:forKey:", storyType, CFSTR("story_type"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayWidgetHeadlineExposureReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_widgetSectionId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_29;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_14:
  if (self->_webEmbedId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_alternateHeadline)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if (v6 < 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_widgetSectionSubid)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_storyType)
  {
    PBDataWriterWriteStringField();
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
  char has;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_widgetSectionId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v10;

  has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_widgetSectionDisplayRank;
    *(_BYTE *)(v5 + 100) |= 0x40u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 60) = self->_widgetArticleRankInSection;
  *(_BYTE *)(v5 + 100) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 56) = self->_widgetArticleRank;
  *(_BYTE *)(v5 + 100) |= 4u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 48) = self->_widgetArticleCount;
  *(_BYTE *)(v5 + 100) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_17:
  *(_DWORD *)(v5 + 52) = self->_widgetArticleCountInSection;
  *(_BYTE *)(v5 + 100) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 64) = self->_widgetContentType;
    *(_BYTE *)(v5 + 100) |= 0x10u;
  }
LABEL_8:
  v13 = -[NSString copyWithZone:](self->_webEmbedId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[NTPBAlternateHeadline copyWithZone:](self->_alternateHeadline, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v15;

  v17 = (char)self->_has;
  if ((v17 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_widgetExposureStackLocation;
    *(_BYTE *)(v5 + 100) |= 0x20u;
    v17 = (char)self->_has;
  }
  if (v17 < 0)
  {
    *(_DWORD *)(v5 + 96) = self->_widgetType;
    *(_BYTE *)(v5 + 100) |= 0x80u;
  }
  v18 = -[NSString copyWithZone:](self->_widgetSectionSubid, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  v20 = -[NSString copyWithZone:](self->_storyType, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *widgetSectionId;
  NSString *webEmbedId;
  NTPBAlternateHeadline *alternateHeadline;
  NSString *widgetSectionSubid;
  NSString *storyType;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_55;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_55;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_55;
  }
  widgetSectionId = self->_widgetSectionId;
  if ((unint64_t)widgetSectionId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](widgetSectionId, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x40) == 0 || self->_widgetSectionDisplayRank != *((_DWORD *)v4 + 18))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x40) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) == 0 || self->_widgetArticleRankInSection != *((_DWORD *)v4 + 15))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_widgetArticleRank != *((_DWORD *)v4 + 14))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_widgetArticleCount != *((_DWORD *)v4 + 12))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0 || self->_widgetArticleCountInSection != *((_DWORD *)v4 + 13))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x10) == 0 || self->_widgetContentType != *((_DWORD *)v4 + 16))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_55;
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](webEmbedId, "isEqual:"))
    goto LABEL_55;
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((_QWORD *)v4 + 1))
  {
    if (!-[NTPBAlternateHeadline isEqual:](alternateHeadline, "isEqual:"))
      goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x20) == 0 || self->_widgetExposureStackLocation != *((_DWORD *)v4 + 17))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x80) == 0 || self->_widgetType != *((_DWORD *)v4 + 24))
      goto LABEL_55;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x80) != 0)
  {
LABEL_55:
    v12 = 0;
    goto LABEL_56;
  }
  widgetSectionSubid = self->_widgetSectionSubid;
  if ((unint64_t)widgetSectionSubid | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](widgetSectionSubid, "isEqual:"))
  {
    goto LABEL_55;
  }
  storyType = self->_storyType;
  if ((unint64_t)storyType | *((_QWORD *)v4 + 4))
    v12 = -[NSString isEqual:](storyType, "isEqual:");
  else
    v12 = 1;
LABEL_56:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v19;
  NSUInteger v20;

  v20 = -[NSString hash](self->_articleId, "hash");
  v19 = -[NSString hash](self->_sourceChannelId, "hash");
  v3 = -[NSString hash](self->_widgetSectionId, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v4 = 2654435761 * self->_widgetSectionDisplayRank;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_widgetArticleRankInSection;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_widgetArticleRank;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_widgetArticleCount;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_widgetArticleCountInSection;
    goto LABEL_12;
  }
LABEL_11:
  v8 = 0;
LABEL_12:
  v9 = v7;
  v10 = v3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v11 = 2654435761 * self->_widgetContentType;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_webEmbedId, "hash");
  v13 = -[NTPBAlternateHeadline hash](self->_alternateHeadline, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v14 = 2654435761 * self->_widgetExposureStackLocation;
  else
    v14 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v15 = 2654435761 * self->_widgetType;
  else
    v15 = 0;
  v16 = v19 ^ v20 ^ v10 ^ v4 ^ v5 ^ v6 ^ v9 ^ v8 ^ v11 ^ v12 ^ v13;
  v17 = v14 ^ v15 ^ -[NSString hash](self->_widgetSectionSubid, "hash");
  return v16 ^ v17 ^ -[NSString hash](self->_storyType, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  char v5;
  NTPBAlternateHeadline *alternateHeadline;
  uint64_t v7;
  char v8;
  int *v9;

  v4 = (int *)a3;
  v9 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBTodayWidgetHeadlineExposure setArticleId:](self, "setArticleId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBTodayWidgetHeadlineExposure setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[NTPBTodayWidgetHeadlineExposure setWidgetSectionId:](self, "setWidgetSectionId:");
    v4 = v9;
  }
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 0x40) != 0)
  {
    self->_widgetSectionDisplayRank = v4[18];
    *(_BYTE *)&self->_has |= 0x40u;
    v5 = *((_BYTE *)v4 + 100);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((v4[25] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_widgetArticleRankInSection = v4[15];
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  self->_widgetArticleRank = v4[14];
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  self->_widgetArticleCount = v4[12];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_23:
  self->_widgetArticleCountInSection = v4[13];
  *(_BYTE *)&self->_has |= 2u;
  if ((v4[25] & 0x10) != 0)
  {
LABEL_13:
    self->_widgetContentType = v4[16];
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBTodayWidgetHeadlineExposure setWebEmbedId:](self, "setWebEmbedId:");
    v4 = v9;
  }
  alternateHeadline = self->_alternateHeadline;
  v7 = *((_QWORD *)v4 + 1);
  if (alternateHeadline)
  {
    if (!v7)
      goto LABEL_28;
    -[NTPBAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_28;
    -[NTPBTodayWidgetHeadlineExposure setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  v4 = v9;
LABEL_28:
  v8 = *((_BYTE *)v4 + 100);
  if ((v8 & 0x20) != 0)
  {
    self->_widgetExposureStackLocation = v4[17];
    *(_BYTE *)&self->_has |= 0x20u;
    v8 = *((_BYTE *)v4 + 100);
  }
  if (v8 < 0)
  {
    self->_widgetType = v4[24];
    *(_BYTE *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[NTPBTodayWidgetHeadlineExposure setWidgetSectionSubid:](self, "setWidgetSectionSubid:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBTodayWidgetHeadlineExposure setStoryType:](self, "setStoryType:");
    v4 = v9;
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

- (NSString)widgetSectionId
{
  return self->_widgetSectionId;
}

- (void)setWidgetSectionId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSectionId, a3);
}

- (int)widgetSectionDisplayRank
{
  return self->_widgetSectionDisplayRank;
}

- (int)widgetArticleRankInSection
{
  return self->_widgetArticleRankInSection;
}

- (int)widgetArticleRank
{
  return self->_widgetArticleRank;
}

- (int)widgetArticleCount
{
  return self->_widgetArticleCount;
}

- (int)widgetArticleCountInSection
{
  return self->_widgetArticleCountInSection;
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
  objc_storeStrong((id *)&self->_webEmbedId, a3);
}

- (NTPBAlternateHeadline)alternateHeadline
{
  return self->_alternateHeadline;
}

- (void)setAlternateHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_alternateHeadline, a3);
}

- (NSString)widgetSectionSubid
{
  return self->_widgetSectionSubid;
}

- (void)setWidgetSectionSubid:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSectionSubid, a3);
}

- (NSString)storyType
{
  return self->_storyType;
}

- (void)setStoryType:(id)a3
{
  objc_storeStrong((id *)&self->_storyType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionSubid, 0);
  objc_storeStrong((id *)&self->_widgetSectionId, 0);
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_storyType, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
  objc_storeStrong((id *)&self->_alternateHeadline, 0);
}

@end
