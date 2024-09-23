@implementation COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement

- (int)widgetEngagementType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_widgetEngagementType;
  else
    return 0;
}

- (void)setWidgetEngagementType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_widgetEngagementType = a3;
}

- (void)setHasWidgetEngagementType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWidgetEngagementType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)widgetEngagementTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_24CD50C28[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_VIEW_WIDGET_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_PLAY_WIDGET_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_STORIES_READ_MORE_BUTTON_TAP_WIDGET_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEADER_TAP_WIDGET_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEB_EMBED_TAP_WIDGET_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISCOVER_MORE_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_CALL_TO_ACTION_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_BACKGROUND_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECTION_NAME_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WHOLE_WIDGET_ENGAGEMENT_TYPE")))
  {
    v4 = 10;
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
  *(_WORD *)&self->_has |= 0x200u;
  self->_widgetSectionDisplayRank = a3;
}

- (void)setHasWidgetSectionDisplayRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWidgetSectionDisplayRank
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setWidgetArticleRankInSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_widgetArticleRankInSection = a3;
}

- (void)setHasWidgetArticleRankInSection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasWidgetArticleRankInSection
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setWidgetArticleRank:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_widgetArticleRank = a3;
}

- (void)setHasWidgetArticleRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasWidgetArticleRank
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setWidgetArticleCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_widgetArticleCount = a3;
}

- (void)setHasWidgetArticleCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasWidgetArticleCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)clearOtherVisibleSections
{
  -[NSMutableArray removeAllObjects](self->_otherVisibleSections, "removeAllObjects");
}

- (void)addOtherVisibleSections:(id)a3
{
  id v4;
  NSMutableArray *otherVisibleSections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  otherVisibleSections = self->_otherVisibleSections;
  v8 = v4;
  if (!otherVisibleSections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_otherVisibleSections;
    self->_otherVisibleSections = v6;

    v4 = v8;
    otherVisibleSections = self->_otherVisibleSections;
  }
  -[NSMutableArray addObject:](otherVisibleSections, "addObject:", v4);

}

- (unint64_t)otherVisibleSectionsCount
{
  return -[NSMutableArray count](self->_otherVisibleSections, "count");
}

- (id)otherVisibleSectionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_otherVisibleSections, "objectAtIndex:", a3);
}

+ (Class)otherVisibleSectionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (int)widgetVideoPresentationReason
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_widgetVideoPresentationReason;
  else
    return 0;
}

- (void)setWidgetVideoPresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_widgetVideoPresentationReason = a3;
}

- (void)setHasWidgetVideoPresentationReason:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWidgetVideoPresentationReason
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)widgetVideoPresentationReasonAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD50C80[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetVideoPresentationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_VIDEO_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEXT_VIDEO_TAP_WIDGET_VIDEO_PRESENTATION_REASON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PREVIOUS_VIDEO_COMPLETED_WIDGET_VIDEO_PRESENTATION_REASON")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setWidgetArticleCountInSection:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_widgetArticleCountInSection = a3;
}

- (void)setHasWidgetArticleCountInSection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasWidgetArticleCountInSection
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasWidgetUserId
{
  return self->_widgetUserId != 0;
}

- (int)widgetContentType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_widgetContentType;
  else
    return 0;
}

- (void)setWidgetContentType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_widgetContentType = a3;
}

- (void)setHasWidgetContentType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasWidgetContentType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)widgetContentTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD50C98[a3];
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

- (BOOL)hasEngagementTargetUrl
{
  return self->_engagementTargetUrl != 0;
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (void)setContentFetchDate:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_contentFetchDate = a3;
}

- (void)setHasContentFetchDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasContentFetchDate
{
  return *(_WORD *)&self->_has & 1;
}

- (int)widgetDisplayMode
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_widgetDisplayMode;
  else
    return 0;
}

- (void)setWidgetDisplayMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_widgetDisplayMode = a3;
}

- (void)setHasWidgetDisplayMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasWidgetDisplayMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)widgetDisplayModeAsString:(int)a3
{
  if (a3 < 8)
    return off_24CD50CB0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetDisplayMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPACT_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPANDED_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TWO_BY_TWO_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TWO_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOUR_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIX_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ONE_BY_TWO_WIDGET_DISPLAY_MODE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasWidgetContentId
{
  return self->_widgetContentId != 0;
}

- (int)widgetExposureStackLocation
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_widgetExposureStackLocation;
  else
    return 0;
}

- (void)setWidgetExposureStackLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_widgetExposureStackLocation = a3;
}

- (void)setHasWidgetExposureStackLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWidgetExposureStackLocation
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)widgetExposureStackLocationAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD50CF0[a3];
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
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_widgetType;
  else
    return 0;
}

- (void)setWidgetType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_widgetType = a3;
}

- (void)setHasWidgetType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWidgetType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)widgetTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD50D20[a3];
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

- (BOOL)hasEngagementId
{
  return self->_engagementId != 0;
}

- (BOOL)hasEntryId
{
  return self->_entryId != 0;
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
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement;
  -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t widgetEngagementType;
  __CFString *v5;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *widgetSectionId;
  __int16 has;
  void *v10;
  NSMutableArray *otherVisibleSections;
  NSData *articleViewingSessionId;
  __int16 v13;
  uint64_t widgetVideoPresentationReason;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *widgetUserId;
  uint64_t widgetContentType;
  __CFString *v22;
  NSString *webEmbedId;
  NSString *engagementTargetUrl;
  NSString *contentId;
  __int16 v26;
  void *v27;
  uint64_t widgetDisplayMode;
  __CFString *v29;
  NSString *widgetContentId;
  __int16 v31;
  uint64_t widgetExposureStackLocation;
  __CFString *v33;
  uint64_t widgetType;
  __CFString *v35;
  NSString *widgetSectionSubid;
  NSString *storyType;
  NSString *engagementId;
  NSString *entryId;
  id v40;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    widgetEngagementType = self->_widgetEngagementType;
    if (widgetEngagementType >= 0xB)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetEngagementType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD50C28[widgetEngagementType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("widget_engagement_type"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  widgetSectionId = self->_widgetSectionId;
  if (widgetSectionId)
    objc_msgSend(v3, "setObject:forKey:", widgetSectionId, CFSTR("widget_section_id"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetSectionDisplayRank);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("widget_section_display_rank"));

    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_14:
      if ((has & 8) == 0)
        goto LABEL_15;
      goto LABEL_26;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleRankInSection);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("widget_article_rank_in_section"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 2) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleRank);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("widget_article_rank"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleCount);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("widget_article_count"));

  }
LABEL_17:
  otherVisibleSections = self->_otherVisibleSections;
  if (otherVisibleSections)
    objc_msgSend(v3, "setObject:forKey:", otherVisibleSections, CFSTR("other_visible_sections"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  v13 = (__int16)self->_has;
  if ((v13 & 0x800) != 0)
  {
    widgetVideoPresentationReason = self->_widgetVideoPresentationReason;
    if (widgetVideoPresentationReason >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetVideoPresentationReason);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_24CD50C80[widgetVideoPresentationReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("widget_video_presentation_reason"));

    v13 = (__int16)self->_has;
  }
  if ((v13 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleCountInSection);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("widget_article_count_in_section"));

  }
  widgetUserId = self->_widgetUserId;
  if (widgetUserId)
    objc_msgSend(v3, "setObject:forKey:", widgetUserId, CFSTR("widget_user_id"));
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    widgetContentType = self->_widgetContentType;
    if (widgetContentType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetContentType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_24CD50C98[widgetContentType];
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("widget_content_type"));

  }
  webEmbedId = self->_webEmbedId;
  if (webEmbedId)
    objc_msgSend(v3, "setObject:forKey:", webEmbedId, CFSTR("web_embed_id"));
  engagementTargetUrl = self->_engagementTargetUrl;
  if (engagementTargetUrl)
    objc_msgSend(v3, "setObject:forKey:", engagementTargetUrl, CFSTR("engagement_target_url"));
  contentId = self->_contentId;
  if (contentId)
    objc_msgSend(v3, "setObject:forKey:", contentId, CFSTR("content_id"));
  v26 = (__int16)self->_has;
  if ((v26 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_contentFetchDate);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("content_fetch_date"));

    v26 = (__int16)self->_has;
  }
  if ((v26 & 0x40) != 0)
  {
    widgetDisplayMode = self->_widgetDisplayMode;
    if (widgetDisplayMode >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetDisplayMode);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_24CD50CB0[widgetDisplayMode];
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("widget_display_mode"));

  }
  widgetContentId = self->_widgetContentId;
  if (widgetContentId)
    objc_msgSend(v3, "setObject:forKey:", widgetContentId, CFSTR("widget_content_id"));
  v31 = (__int16)self->_has;
  if ((v31 & 0x100) != 0)
  {
    widgetExposureStackLocation = self->_widgetExposureStackLocation;
    if (widgetExposureStackLocation >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetExposureStackLocation);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_24CD50CF0[widgetExposureStackLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("widget_exposure_stack_location"));

    v31 = (__int16)self->_has;
  }
  if ((v31 & 0x400) != 0)
  {
    widgetType = self->_widgetType;
    if (widgetType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetType);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = off_24CD50D20[widgetType];
    }
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("widget_type"));

  }
  widgetSectionSubid = self->_widgetSectionSubid;
  if (widgetSectionSubid)
    objc_msgSend(v3, "setObject:forKey:", widgetSectionSubid, CFSTR("widget_section_subid"));
  storyType = self->_storyType;
  if (storyType)
    objc_msgSend(v3, "setObject:forKey:", storyType, CFSTR("story_type"));
  engagementId = self->_engagementId;
  if (engagementId)
    objc_msgSend(v3, "setObject:forKey:", engagementId, CFSTR("engagement_id"));
  entryId = self->_entryId;
  if (entryId)
    objc_msgSend(v3, "setObject:forKey:", entryId, CFSTR("entry_id"));
  v40 = v3;

  return v40;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if (self->_widgetSectionId)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
      goto LABEL_58;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 2) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 2) != 0)
LABEL_13:
    PBDataWriterWriteInt32Field();
LABEL_14:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_otherVisibleSections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  v11 = (__int16)self->_has;
  if ((v11 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (__int16)self->_has;
  }
  if ((v11 & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_widgetUserId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_webEmbedId)
    PBDataWriterWriteStringField();
  if (self->_engagementTargetUrl)
    PBDataWriterWriteStringField();
  if (self->_contentId)
    PBDataWriterWriteStringField();
  v12 = (__int16)self->_has;
  if ((v12 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_widgetContentId)
    PBDataWriterWriteStringField();
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v13 = (__int16)self->_has;
  }
  if ((v13 & 0x400) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_widgetSectionSubid)
    PBDataWriterWriteStringField();
  if (self->_storyType)
    PBDataWriterWriteStringField();
  if (self->_engagementId)
    PBDataWriterWriteStringField();
  if (self->_entryId)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  __int16 v10;
  _DWORD *v11;
  __int16 v12;
  __int16 v13;
  _DWORD *v14;

  v4 = a3;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v4[32] = self->_widgetEngagementType;
    *((_WORD *)v4 + 90) |= 0x80u;
  }
  v14 = v4;
  if (self->_articleId)
  {
    objc_msgSend(v4, "setArticleId:");
    v4 = v14;
  }
  if (self->_sourceChannelId)
  {
    objc_msgSend(v14, "setSourceChannelId:");
    v4 = v14;
  }
  if (self->_widgetSectionId)
  {
    objc_msgSend(v14, "setWidgetSectionId:");
    v4 = v14;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[34] = self->_widgetSectionDisplayRank;
    *((_WORD *)v4 + 90) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_12;
LABEL_55:
      v4[26] = self->_widgetArticleRank;
      *((_WORD *)v4 + 90) |= 8u;
      if ((*(_WORD *)&self->_has & 2) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  v4[27] = self->_widgetArticleRankInSection;
  *((_WORD *)v4 + 90) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_55;
LABEL_12:
  if ((has & 2) != 0)
  {
LABEL_13:
    v4[24] = self->_widgetArticleCount;
    *((_WORD *)v4 + 90) |= 2u;
  }
LABEL_14:
  if (-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement otherVisibleSectionsCount](self, "otherVisibleSectionsCount"))
  {
    objc_msgSend(v14, "clearOtherVisibleSections");
    v6 = -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement otherVisibleSectionsCount](self, "otherVisibleSectionsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement otherVisibleSectionsAtIndex:](self, "otherVisibleSectionsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addOtherVisibleSections:", v9);

      }
    }
  }
  if (self->_articleViewingSessionId)
    objc_msgSend(v14, "setArticleViewingSessionId:");
  v10 = (__int16)self->_has;
  v11 = v14;
  if ((v10 & 0x800) != 0)
  {
    v14[44] = self->_widgetVideoPresentationReason;
    *((_WORD *)v14 + 90) |= 0x800u;
    v10 = (__int16)self->_has;
  }
  if ((v10 & 4) != 0)
  {
    v14[25] = self->_widgetArticleCountInSection;
    *((_WORD *)v14 + 90) |= 4u;
  }
  if (self->_widgetUserId)
  {
    objc_msgSend(v14, "setWidgetUserId:");
    v11 = v14;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v11[30] = self->_widgetContentType;
    *((_WORD *)v11 + 90) |= 0x20u;
  }
  if (self->_webEmbedId)
  {
    objc_msgSend(v14, "setWebEmbedId:");
    v11 = v14;
  }
  if (self->_engagementTargetUrl)
  {
    objc_msgSend(v14, "setEngagementTargetUrl:");
    v11 = v14;
  }
  if (self->_contentId)
  {
    objc_msgSend(v14, "setContentId:");
    v11 = v14;
  }
  v12 = (__int16)self->_has;
  if ((v12 & 1) != 0)
  {
    *((_QWORD *)v11 + 1) = self->_contentFetchDate;
    *((_WORD *)v11 + 90) |= 1u;
    v12 = (__int16)self->_has;
  }
  if ((v12 & 0x40) != 0)
  {
    v11[31] = self->_widgetDisplayMode;
    *((_WORD *)v11 + 90) |= 0x40u;
  }
  if (self->_widgetContentId)
  {
    objc_msgSend(v14, "setWidgetContentId:");
    v11 = v14;
  }
  v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    v11[33] = self->_widgetExposureStackLocation;
    *((_WORD *)v11 + 90) |= 0x100u;
    v13 = (__int16)self->_has;
  }
  if ((v13 & 0x400) != 0)
  {
    v11[40] = self->_widgetType;
    *((_WORD *)v11 + 90) |= 0x400u;
  }
  if (self->_widgetSectionSubid)
  {
    objc_msgSend(v14, "setWidgetSectionSubid:");
    v11 = v14;
  }
  if (self->_storyType)
  {
    objc_msgSend(v14, "setStoryType:");
    v11 = v14;
  }
  if (self->_engagementId)
  {
    objc_msgSend(v14, "setEngagementId:");
    v11 = v14;
  }
  if (self->_entryId)
  {
    objc_msgSend(v14, "setEntryId:");
    v11 = v14;
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
  uint64_t v11;
  void *v12;
  __int16 has;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_widgetEngagementType;
    *(_WORD *)(v5 + 180) |= 0x80u;
  }
  v7 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  v9 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v9;

  v11 = -[NSString copyWithZone:](self->_widgetSectionId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v11;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_widgetSectionDisplayRank;
    *(_WORD *)(v6 + 180) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_32;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 108) = self->_widgetArticleRankInSection;
  *(_WORD *)(v6 + 180) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_32:
  *(_DWORD *)(v6 + 104) = self->_widgetArticleRank;
  *(_WORD *)(v6 + 180) |= 8u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 96) = self->_widgetArticleCount;
    *(_WORD *)(v6 + 180) |= 2u;
  }
LABEL_8:
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v14 = self->_otherVisibleSections;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v45 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v44);
        objc_msgSend((id)v6, "addOtherVisibleSections:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v16);
  }

  v20 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v20;

  v22 = (__int16)self->_has;
  if ((v22 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 176) = self->_widgetVideoPresentationReason;
    *(_WORD *)(v6 + 180) |= 0x800u;
    v22 = (__int16)self->_has;
  }
  if ((v22 & 4) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_widgetArticleCountInSection;
    *(_WORD *)(v6 + 180) |= 4u;
  }
  v23 = -[NSString copyWithZone:](self->_widgetUserId, "copyWithZone:", a3, (_QWORD)v44);
  v24 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v23;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 120) = self->_widgetContentType;
    *(_WORD *)(v6 + 180) |= 0x20u;
  }
  v25 = -[NSString copyWithZone:](self->_webEmbedId, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v25;

  v27 = -[NSString copyWithZone:](self->_engagementTargetUrl, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v27;

  v29 = -[NSString copyWithZone:](self->_contentId, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v29;

  v31 = (__int16)self->_has;
  if ((v31 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_contentFetchDate;
    *(_WORD *)(v6 + 180) |= 1u;
    v31 = (__int16)self->_has;
  }
  if ((v31 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 124) = self->_widgetDisplayMode;
    *(_WORD *)(v6 + 180) |= 0x40u;
  }
  v32 = -[NSString copyWithZone:](self->_widgetContentId, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v32;

  v34 = (__int16)self->_has;
  if ((v34 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 132) = self->_widgetExposureStackLocation;
    *(_WORD *)(v6 + 180) |= 0x100u;
    v34 = (__int16)self->_has;
  }
  if ((v34 & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_widgetType;
    *(_WORD *)(v6 + 180) |= 0x400u;
  }
  v35 = -[NSString copyWithZone:](self->_widgetSectionSubid, "copyWithZone:", a3);
  v36 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v35;

  v37 = -[NSString copyWithZone:](self->_storyType, "copyWithZone:", a3);
  v38 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v37;

  v39 = -[NSString copyWithZone:](self->_engagementId, "copyWithZone:", a3);
  v40 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v39;

  v41 = -[NSString copyWithZone:](self->_entryId, "copyWithZone:", a3);
  v42 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v41;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *articleId;
  NSString *sourceChannelId;
  NSString *widgetSectionId;
  __int16 has;
  __int16 v10;
  NSMutableArray *otherVisibleSections;
  NSData *articleViewingSessionId;
  __int16 v13;
  __int16 v14;
  NSString *widgetUserId;
  __int16 v16;
  NSString *webEmbedId;
  NSString *engagementTargetUrl;
  NSString *contentId;
  __int16 v20;
  __int16 v21;
  NSString *widgetContentId;
  NSString *widgetSectionSubid;
  NSString *storyType;
  NSString *engagementId;
  NSString *entryId;
  char v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_92;
  v5 = *((_WORD *)v4 + 90);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v5 & 0x80) == 0 || self->_widgetEngagementType != *((_DWORD *)v4 + 32))
      goto LABEL_92;
  }
  else if ((v5 & 0x80) != 0)
  {
    goto LABEL_92;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_92;
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_92;
  }
  widgetSectionId = self->_widgetSectionId;
  if ((unint64_t)widgetSectionId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](widgetSectionId, "isEqual:"))
      goto LABEL_92;
  }
  has = (__int16)self->_has;
  v10 = *((_WORD *)v4 + 90);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x200) == 0 || self->_widgetSectionDisplayRank != *((_DWORD *)v4 + 34))
      goto LABEL_92;
  }
  else if ((*((_WORD *)v4 + 90) & 0x200) != 0)
  {
    goto LABEL_92;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_widgetArticleRankInSection != *((_DWORD *)v4 + 27))
      goto LABEL_92;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_92;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_widgetArticleRank != *((_DWORD *)v4 + 26))
      goto LABEL_92;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_92;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_widgetArticleCount != *((_DWORD *)v4 + 24))
      goto LABEL_92;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_92;
  }
  otherVisibleSections = self->_otherVisibleSections;
  if ((unint64_t)otherVisibleSections | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](otherVisibleSections, "isEqual:"))
  {
    goto LABEL_92;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_92;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 90);
  if ((v13 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x800) == 0 || self->_widgetVideoPresentationReason != *((_DWORD *)v4 + 44))
      goto LABEL_92;
  }
  else if ((*((_WORD *)v4 + 90) & 0x800) != 0)
  {
    goto LABEL_92;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_widgetArticleCountInSection != *((_DWORD *)v4 + 25))
      goto LABEL_92;
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_92;
  }
  widgetUserId = self->_widgetUserId;
  if ((unint64_t)widgetUserId | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](widgetUserId, "isEqual:"))
      goto LABEL_92;
    v13 = (__int16)self->_has;
  }
  v16 = *((_WORD *)v4 + 90);
  if ((v13 & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0 || self->_widgetContentType != *((_DWORD *)v4 + 30))
      goto LABEL_92;
  }
  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_92;
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](webEmbedId, "isEqual:"))
  {
    goto LABEL_92;
  }
  engagementTargetUrl = self->_engagementTargetUrl;
  if ((unint64_t)engagementTargetUrl | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](engagementTargetUrl, "isEqual:"))
      goto LABEL_92;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:"))
      goto LABEL_92;
  }
  v20 = (__int16)self->_has;
  v21 = *((_WORD *)v4 + 90);
  if ((v20 & 1) != 0)
  {
    if ((v21 & 1) == 0 || self->_contentFetchDate != *((_QWORD *)v4 + 1))
      goto LABEL_92;
  }
  else if ((v21 & 1) != 0)
  {
    goto LABEL_92;
  }
  if ((v20 & 0x40) != 0)
  {
    if ((v21 & 0x40) == 0 || self->_widgetDisplayMode != *((_DWORD *)v4 + 31))
      goto LABEL_92;
  }
  else if ((v21 & 0x40) != 0)
  {
    goto LABEL_92;
  }
  widgetContentId = self->_widgetContentId;
  if ((unint64_t)widgetContentId | *((_QWORD *)v4 + 14))
  {
    if (-[NSString isEqual:](widgetContentId, "isEqual:"))
    {
      v20 = (__int16)self->_has;
      goto LABEL_74;
    }
LABEL_92:
    v27 = 0;
    goto LABEL_93;
  }
LABEL_74:
  if ((v20 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x100) == 0 || self->_widgetExposureStackLocation != *((_DWORD *)v4 + 33))
      goto LABEL_92;
  }
  else if ((*((_WORD *)v4 + 90) & 0x100) != 0)
  {
    goto LABEL_92;
  }
  if ((v20 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x400) == 0 || self->_widgetType != *((_DWORD *)v4 + 40))
      goto LABEL_92;
  }
  else if ((*((_WORD *)v4 + 90) & 0x400) != 0)
  {
    goto LABEL_92;
  }
  widgetSectionSubid = self->_widgetSectionSubid;
  if ((unint64_t)widgetSectionSubid | *((_QWORD *)v4 + 19)
    && !-[NSString isEqual:](widgetSectionSubid, "isEqual:"))
  {
    goto LABEL_92;
  }
  storyType = self->_storyType;
  if ((unint64_t)storyType | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](storyType, "isEqual:"))
      goto LABEL_92;
  }
  engagementId = self->_engagementId;
  if ((unint64_t)engagementId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](engagementId, "isEqual:"))
      goto LABEL_92;
  }
  entryId = self->_entryId;
  if ((unint64_t)entryId | *((_QWORD *)v4 + 7))
    v27 = -[NSString isEqual:](entryId, "isEqual:");
  else
    v27 = 1;
LABEL_93:

  return v27;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v33 = 2654435761 * self->_widgetEngagementType;
  else
    v33 = 0;
  v32 = -[NSString hash](self->_articleId, "hash");
  v31 = -[NSString hash](self->_sourceChannelId, "hash");
  v30 = -[NSString hash](self->_widgetSectionId, "hash");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v29 = 2654435761 * self->_widgetSectionDisplayRank;
    if ((has & 0x10) != 0)
    {
LABEL_6:
      v28 = 2654435761 * self->_widgetArticleRankInSection;
      if ((has & 8) != 0)
        goto LABEL_7;
LABEL_11:
      v27 = 0;
      if ((has & 2) != 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else
  {
    v29 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_6;
  }
  v28 = 0;
  if ((has & 8) == 0)
    goto LABEL_11;
LABEL_7:
  v27 = 2654435761 * self->_widgetArticleRank;
  if ((has & 2) != 0)
  {
LABEL_8:
    v26 = 2654435761 * self->_widgetArticleCount;
    goto LABEL_13;
  }
LABEL_12:
  v26 = 0;
LABEL_13:
  v25 = -[NSMutableArray hash](self->_otherVisibleSections, "hash");
  v24 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x800) != 0)
  {
    v23 = 2654435761 * self->_widgetVideoPresentationReason;
    if ((v4 & 4) != 0)
      goto LABEL_15;
  }
  else
  {
    v23 = 0;
    if ((v4 & 4) != 0)
    {
LABEL_15:
      v5 = -[NSString hash](self->_widgetUserId, "hash", 2654435761 * self->_widgetArticleCountInSection);
      goto LABEL_18;
    }
  }
  v5 = -[NSString hash](self->_widgetUserId, "hash", 0);
LABEL_18:
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    v7 = 2654435761 * self->_widgetContentType;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_webEmbedId, "hash");
  v9 = -[NSString hash](self->_engagementTargetUrl, "hash");
  v10 = -[NSString hash](self->_contentId, "hash");
  v11 = (__int16)self->_has;
  if ((v11 & 1) != 0)
  {
    v12 = 2654435761 * self->_contentFetchDate;
    if ((v11 & 0x40) != 0)
      goto LABEL_23;
  }
  else
  {
    v12 = 0;
    if ((v11 & 0x40) != 0)
    {
LABEL_23:
      v13 = 2654435761 * self->_widgetDisplayMode;
      goto LABEL_26;
    }
  }
  v13 = 0;
LABEL_26:
  v14 = -[NSString hash](self->_widgetContentId, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v15 = 2654435761 * self->_widgetExposureStackLocation;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_28;
LABEL_30:
    v16 = 0;
    goto LABEL_31;
  }
  v15 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_30;
LABEL_28:
  v16 = 2654435761 * self->_widgetType;
LABEL_31:
  v17 = v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
  v18 = v15 ^ v16 ^ -[NSString hash](self->_widgetSectionSubid, "hash");
  v19 = v18 ^ -[NSString hash](self->_storyType, "hash");
  v20 = v19 ^ -[NSString hash](self->_engagementId, "hash");
  return v17 ^ v20 ^ -[NSString hash](self->_entryId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  __int16 v6;
  id v7;
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
  v5 = v4;
  if ((v4[45] & 0x80) != 0)
  {
    self->_widgetEngagementType = v4[32];
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 2))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 9))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setSourceChannelId:](self, "setSourceChannelId:");
  if (*((_QWORD *)v5 + 18))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setWidgetSectionId:](self, "setWidgetSectionId:");
  v6 = *((_WORD *)v5 + 90);
  if ((v6 & 0x200) != 0)
  {
    self->_widgetSectionDisplayRank = *((_DWORD *)v5 + 34);
    *(_WORD *)&self->_has |= 0x200u;
    v6 = *((_WORD *)v5 + 90);
    if ((v6 & 0x10) == 0)
    {
LABEL_11:
      if ((v6 & 8) == 0)
        goto LABEL_12;
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_widgetArticleRankInSection = *((_DWORD *)v5 + 27);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)v5 + 90);
  if ((v6 & 8) == 0)
  {
LABEL_12:
    if ((v6 & 2) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_58:
  self->_widgetArticleRank = *((_DWORD *)v5 + 26);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v5 + 90) & 2) != 0)
  {
LABEL_13:
    self->_widgetArticleCount = *((_DWORD *)v5 + 24);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_14:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *((id *)v5 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement addOtherVisibleSections:](self, "addOtherVisibleSections:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (*((_QWORD *)v5 + 3))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  v12 = *((_WORD *)v5 + 90);
  if ((v12 & 0x800) != 0)
  {
    self->_widgetVideoPresentationReason = *((_DWORD *)v5 + 44);
    *(_WORD *)&self->_has |= 0x800u;
    v12 = *((_WORD *)v5 + 90);
  }
  if ((v12 & 4) != 0)
  {
    self->_widgetArticleCountInSection = *((_DWORD *)v5 + 25);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 21))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setWidgetUserId:](self, "setWidgetUserId:");
  if ((*((_WORD *)v5 + 90) & 0x20) != 0)
  {
    self->_widgetContentType = *((_DWORD *)v5 + 30);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v5 + 11))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setWebEmbedId:](self, "setWebEmbedId:");
  if (*((_QWORD *)v5 + 6))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setEngagementTargetUrl:](self, "setEngagementTargetUrl:");
  if (*((_QWORD *)v5 + 4))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setContentId:](self, "setContentId:");
  v13 = *((_WORD *)v5 + 90);
  if ((v13 & 1) != 0)
  {
    self->_contentFetchDate = *((_QWORD *)v5 + 1);
    *(_WORD *)&self->_has |= 1u;
    v13 = *((_WORD *)v5 + 90);
  }
  if ((v13 & 0x40) != 0)
  {
    self->_widgetDisplayMode = *((_DWORD *)v5 + 31);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v5 + 14))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setWidgetContentId:](self, "setWidgetContentId:");
  v14 = *((_WORD *)v5 + 90);
  if ((v14 & 0x100) != 0)
  {
    self->_widgetExposureStackLocation = *((_DWORD *)v5 + 33);
    *(_WORD *)&self->_has |= 0x100u;
    v14 = *((_WORD *)v5 + 90);
  }
  if ((v14 & 0x400) != 0)
  {
    self->_widgetType = *((_DWORD *)v5 + 40);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)v5 + 19))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setWidgetSectionSubid:](self, "setWidgetSectionSubid:");
  if (*((_QWORD *)v5 + 10))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setStoryType:](self, "setStoryType:");
  if (*((_QWORD *)v5 + 5))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setEngagementId:](self, "setEngagementId:");
  if (*((_QWORD *)v5 + 7))
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSWidgetEngagement setEntryId:](self, "setEntryId:");

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

- (NSMutableArray)otherVisibleSections
{
  return self->_otherVisibleSections;
}

- (void)setOtherVisibleSections:(id)a3
{
  objc_storeStrong((id *)&self->_otherVisibleSections, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (int)widgetArticleCountInSection
{
  return self->_widgetArticleCountInSection;
}

- (NSString)widgetUserId
{
  return self->_widgetUserId;
}

- (void)setWidgetUserId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUserId, a3);
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
  objc_storeStrong((id *)&self->_webEmbedId, a3);
}

- (NSString)engagementTargetUrl
{
  return self->_engagementTargetUrl;
}

- (void)setEngagementTargetUrl:(id)a3
{
  objc_storeStrong((id *)&self->_engagementTargetUrl, a3);
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
}

- (int64_t)contentFetchDate
{
  return self->_contentFetchDate;
}

- (NSString)widgetContentId
{
  return self->_widgetContentId;
}

- (void)setWidgetContentId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetContentId, a3);
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

- (NSString)engagementId
{
  return self->_engagementId;
}

- (void)setEngagementId:(id)a3
{
  objc_storeStrong((id *)&self->_engagementId, a3);
}

- (NSString)entryId
{
  return self->_entryId;
}

- (void)setEntryId:(id)a3
{
  objc_storeStrong((id *)&self->_entryId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUserId, 0);
  objc_storeStrong((id *)&self->_widgetSectionSubid, 0);
  objc_storeStrong((id *)&self->_widgetSectionId, 0);
  objc_storeStrong((id *)&self->_widgetContentId, 0);
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_storyType, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_otherVisibleSections, 0);
  objc_storeStrong((id *)&self->_entryId, 0);
  objc_storeStrong((id *)&self->_engagementTargetUrl, 0);
  objc_storeStrong((id *)&self->_engagementId, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
