@implementation NTPBArticleScroll

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasArticleSessionId
{
  return self->_articleSessionId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)scrollHostViewType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_scrollHostViewType;
  else
    return 0;
}

- (void)setScrollHostViewType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_scrollHostViewType = a3;
}

- (void)setHasScrollHostViewType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScrollHostViewType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasVerticalScrollPositionStart
{
  return self->_verticalScrollPositionStart != 0;
}

- (BOOL)hasVerticalScrollPositionEnd
{
  return self->_verticalScrollPositionEnd != 0;
}

- (BOOL)hasScrollVelocity
{
  return self->_scrollVelocity != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasSectionHeadlineId
{
  return self->_sectionHeadlineId != 0;
}

- (void)setVerticalScrollPositionStarting:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_verticalScrollPositionStarting = a3;
}

- (void)setHasVerticalScrollPositionStarting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVerticalScrollPositionStarting
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setVerticalScrollPositionEnding:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_verticalScrollPositionEnding = a3;
}

- (void)setHasVerticalScrollPositionEnding:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVerticalScrollPositionEnding
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setScrollingVelocity:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_scrollingVelocity = a3;
}

- (void)setHasScrollingVelocity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScrollingVelocity
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (BOOL)hasAlternateHeadline
{
  return self->_alternateHeadline != 0;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
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
  v8.super_class = (Class)NTPBArticleScroll;
  -[NTPBArticleScroll description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBArticleScroll dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  void *v11;
  NSString *verticalScrollPositionStart;
  NSString *verticalScrollPositionEnd;
  NSString *scrollVelocity;
  NSData *feedViewExposureId;
  void *v16;
  NSString *sectionHeadlineId;
  char has;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NTPBAlternateHeadline *alternateHeadline;
  void *v28;
  NTPBIssueData *issueData;
  void *v30;
  NTPBIssueViewData *issueViewData;
  void *v32;
  NTPBIssueExposureData *issueExposureData;
  void *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v5, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  articleSessionId = self->_articleSessionId;
  if (articleSessionId)
    objc_msgSend(v5, "setObject:forKey:", articleSessionId, CFSTR("article_session_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v5, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v5, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_scrollHostViewType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("scroll_host_view_type"));

  }
  verticalScrollPositionStart = self->_verticalScrollPositionStart;
  if (verticalScrollPositionStart)
    objc_msgSend(v5, "setObject:forKey:", verticalScrollPositionStart, CFSTR("vertical_scroll_position_start"));
  verticalScrollPositionEnd = self->_verticalScrollPositionEnd;
  if (verticalScrollPositionEnd)
    objc_msgSend(v5, "setObject:forKey:", verticalScrollPositionEnd, CFSTR("vertical_scroll_position_end"));
  scrollVelocity = self->_scrollVelocity;
  if (scrollVelocity)
    objc_msgSend(v5, "setObject:forKey:", scrollVelocity, CFSTR("scroll_velocity"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v5, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("ad_supported_channel"));

  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if (sectionHeadlineId)
    objc_msgSend(v5, "setObject:forKey:", sectionHeadlineId, CFSTR("section_headline_id"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&v4 = self->_verticalScrollPositionStarting;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("vertical_scroll_position_starting"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_27:
      if ((has & 2) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_27;
  }
  *(float *)&v4 = self->_verticalScrollPositionEnding;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v37, CFSTR("vertical_scroll_position_ending"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_28:
    *(float *)&v4 = self->_scrollingVelocity;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("scrolling_velocity"));

  }
LABEL_29:
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v21 = self->_fractionalCohortMemberships;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v38);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v23);
    }

    objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("fractional_cohort_membership"));
  }
  alternateHeadline = self->_alternateHeadline;
  if (alternateHeadline)
  {
    -[NTPBAlternateHeadline dictionaryRepresentation](alternateHeadline, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("alternate_headline"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("issue_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("issue_view_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("issue_exposure_data"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleScrollReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_referencedArticleId)
    PBDataWriterWriteStringField();
  if (self->_articleSessionId)
    PBDataWriterWriteDataField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  if (self->_sourceChannelId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_verticalScrollPositionStart)
    PBDataWriterWriteStringField();
  if (self->_verticalScrollPositionEnd)
    PBDataWriterWriteStringField();
  if (self->_scrollVelocity)
    PBDataWriterWriteStringField();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_27:
      if ((has & 2) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_28:
    PBDataWriterWriteFloatField();
LABEL_29:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_fractionalCohortMemberships;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_alternateHeadline)
    PBDataWriterWriteSubmessage();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueViewData)
    PBDataWriterWriteSubmessage();
  if (self->_issueExposureData)
    PBDataWriterWriteSubmessage();

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
  char has;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v8;

  v10 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_scrollHostViewType;
    *(_BYTE *)(v5 + 160) |= 1u;
  }
  v16 = -[NSString copyWithZone:](self->_verticalScrollPositionStart, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v16;

  v18 = -[NSString copyWithZone:](self->_verticalScrollPositionEnd, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v18;

  v20 = -[NSString copyWithZone:](self->_scrollVelocity, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v20;

  v22 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v22;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 156) = self->_adSupportedChannel;
    *(_BYTE *)(v5 + 160) |= 0x10u;
  }
  v24 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v24;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)(v5 + 152) = self->_verticalScrollPositionStarting;
    *(_BYTE *)(v5 + 160) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(float *)(v5 + 136) = self->_verticalScrollPositionEnding;
  *(_BYTE *)(v5 + 160) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_8:
    *(float *)(v5 + 104) = self->_scrollingVelocity;
    *(_BYTE *)(v5 + 160) |= 2u;
  }
LABEL_9:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v27 = self->_fractionalCohortMemberships;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(v27);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v42);
        objc_msgSend((id)v5, "addFractionalCohortMembership:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v29);
  }

  v33 = -[NTPBAlternateHeadline copyWithZone:](self->_alternateHeadline, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v33;

  v35 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v35;

  v37 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v37;

  v39 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v39;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  NSString *verticalScrollPositionStart;
  NSString *verticalScrollPositionEnd;
  NSString *scrollVelocity;
  NSData *feedViewExposureId;
  char has;
  NSString *sectionHeadlineId;
  NSMutableArray *fractionalCohortMemberships;
  NTPBAlternateHeadline *alternateHeadline;
  NTPBIssueData *issueData;
  NTPBIssueViewData *issueViewData;
  NTPBIssueExposureData *issueExposureData;
  char v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_61;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_61;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_61;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:"))
      goto LABEL_61;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_61;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 1) == 0 || self->_scrollHostViewType != *((_DWORD *)v4 + 22))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 160) & 1) != 0)
  {
    goto LABEL_61;
  }
  verticalScrollPositionStart = self->_verticalScrollPositionStart;
  if ((unint64_t)verticalScrollPositionStart | *((_QWORD *)v4 + 18)
    && !-[NSString isEqual:](verticalScrollPositionStart, "isEqual:"))
  {
    goto LABEL_61;
  }
  verticalScrollPositionEnd = self->_verticalScrollPositionEnd;
  if ((unint64_t)verticalScrollPositionEnd | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](verticalScrollPositionEnd, "isEqual:"))
      goto LABEL_61;
  }
  scrollVelocity = self->_scrollVelocity;
  if ((unint64_t)scrollVelocity | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](scrollVelocity, "isEqual:"))
      goto LABEL_61;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_61;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 0x10) == 0)
      goto LABEL_61;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 156))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 156))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 160) & 0x10) != 0)
  {
    goto LABEL_61;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if (!((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 14)))
    goto LABEL_36;
  if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
  {
LABEL_61:
    v21 = 0;
    goto LABEL_62;
  }
  has = (char)self->_has;
LABEL_36:
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 8) == 0 || self->_verticalScrollPositionStarting != *((float *)v4 + 38))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 160) & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 4) == 0 || self->_verticalScrollPositionEnding != *((float *)v4 + 34))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 160) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 160) & 2) == 0 || self->_scrollingVelocity != *((float *)v4 + 26))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 160) & 2) != 0)
  {
    goto LABEL_61;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
  {
    goto LABEL_61;
  }
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((_QWORD *)v4 + 1))
  {
    if (!-[NTPBAlternateHeadline isEqual:](alternateHeadline, "isEqual:"))
      goto LABEL_61;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 7))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_61;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 9))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_61;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 8))
    v21 = -[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:");
  else
    v21 = 1;
LABEL_62:

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  char has;
  unint64_t v9;
  float verticalScrollPositionStarting;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float verticalScrollPositionEnding;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float scrollingVelocity;
  float v21;
  float v22;
  float v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  NSUInteger v29;
  uint64_t v30;
  NSUInteger v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;

  v35 = -[NSString hash](self->_articleId, "hash");
  v34 = -[NSString hash](self->_referencedArticleId, "hash");
  v33 = -[NSData hash](self->_articleSessionId, "hash");
  v32 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v31 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v30 = 2654435761 * self->_scrollHostViewType;
  else
    v30 = 0;
  v29 = -[NSString hash](self->_verticalScrollPositionStart, "hash");
  v3 = -[NSString hash](self->_verticalScrollPositionEnd, "hash");
  v4 = -[NSString hash](self->_scrollVelocity, "hash");
  v5 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v6 = 2654435761 * self->_adSupportedChannel;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_sectionHeadlineId, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    verticalScrollPositionStarting = self->_verticalScrollPositionStarting;
    v11 = -verticalScrollPositionStarting;
    if (verticalScrollPositionStarting >= 0.0)
      v11 = self->_verticalScrollPositionStarting;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) != 0)
  {
    verticalScrollPositionEnding = self->_verticalScrollPositionEnding;
    v16 = -verticalScrollPositionEnding;
    if (verticalScrollPositionEnding >= 0.0)
      v16 = self->_verticalScrollPositionEnding;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 2) != 0)
  {
    scrollingVelocity = self->_scrollingVelocity;
    v21 = -scrollingVelocity;
    if (scrollingVelocity >= 0.0)
      v21 = self->_scrollingVelocity;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v24 = v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14 ^ v19 ^ -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v25 = -[NTPBAlternateHeadline hash](self->_alternateHeadline, "hash");
  v26 = v25 ^ -[NTPBIssueData hash](self->_issueData, "hash");
  v27 = v26 ^ -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  return v24 ^ v27 ^ -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NTPBAlternateHeadline *alternateHeadline;
  uint64_t v12;
  NTPBIssueData *issueData;
  uint64_t v14;
  NTPBIssueViewData *issueViewData;
  uint64_t v16;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[NTPBArticleScroll setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v4 + 10))
    -[NTPBArticleScroll setReferencedArticleId:](self, "setReferencedArticleId:");
  if (*((_QWORD *)v4 + 3))
    -[NTPBArticleScroll setArticleSessionId:](self, "setArticleSessionId:");
  if (*((_QWORD *)v4 + 4))
    -[NTPBArticleScroll setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  if (*((_QWORD *)v4 + 15))
    -[NTPBArticleScroll setSourceChannelId:](self, "setSourceChannelId:");
  if ((*((_BYTE *)v4 + 160) & 1) != 0)
  {
    self->_scrollHostViewType = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 18))
    -[NTPBArticleScroll setVerticalScrollPositionStart:](self, "setVerticalScrollPositionStart:");
  if (*((_QWORD *)v4 + 16))
    -[NTPBArticleScroll setVerticalScrollPositionEnd:](self, "setVerticalScrollPositionEnd:");
  if (*((_QWORD *)v4 + 12))
    -[NTPBArticleScroll setScrollVelocity:](self, "setScrollVelocity:");
  if (*((_QWORD *)v4 + 5))
    -[NTPBArticleScroll setFeedViewExposureId:](self, "setFeedViewExposureId:");
  if ((*((_BYTE *)v4 + 160) & 0x10) != 0)
  {
    self->_adSupportedChannel = *((_BYTE *)v4 + 156);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 14))
    -[NTPBArticleScroll setSectionHeadlineId:](self, "setSectionHeadlineId:");
  v5 = *((_BYTE *)v4 + 160);
  if ((v5 & 8) != 0)
  {
    self->_verticalScrollPositionStarting = *((float *)v4 + 38);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 160);
    if ((v5 & 4) == 0)
    {
LABEL_27:
      if ((v5 & 2) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 160) & 4) == 0)
  {
    goto LABEL_27;
  }
  self->_verticalScrollPositionEnding = *((float *)v4 + 34);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 160) & 2) != 0)
  {
LABEL_28:
    self->_scrollingVelocity = *((float *)v4 + 26);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_29:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        -[NTPBArticleScroll addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  alternateHeadline = self->_alternateHeadline;
  v12 = *((_QWORD *)v4 + 1);
  if (alternateHeadline)
  {
    if (v12)
      -[NTPBAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
  }
  else if (v12)
  {
    -[NTPBArticleScroll setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  issueData = self->_issueData;
  v14 = *((_QWORD *)v4 + 7);
  if (issueData)
  {
    if (v14)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v14)
  {
    -[NTPBArticleScroll setIssueData:](self, "setIssueData:");
  }
  issueViewData = self->_issueViewData;
  v16 = *((_QWORD *)v4 + 9);
  if (issueViewData)
  {
    if (v16)
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else if (v16)
  {
    -[NTPBArticleScroll setIssueViewData:](self, "setIssueViewData:");
  }
  issueExposureData = self->_issueExposureData;
  v18 = *((_QWORD *)v4 + 8);
  if (issueExposureData)
  {
    if (v18)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v18)
  {
    -[NTPBArticleScroll setIssueExposureData:](self, "setIssueExposureData:");
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

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)verticalScrollPositionStart
{
  return self->_verticalScrollPositionStart;
}

- (void)setVerticalScrollPositionStart:(id)a3
{
  objc_storeStrong((id *)&self->_verticalScrollPositionStart, a3);
}

- (NSString)verticalScrollPositionEnd
{
  return self->_verticalScrollPositionEnd;
}

- (void)setVerticalScrollPositionEnd:(id)a3
{
  objc_storeStrong((id *)&self->_verticalScrollPositionEnd, a3);
}

- (NSString)scrollVelocity
{
  return self->_scrollVelocity;
}

- (void)setScrollVelocity:(id)a3
{
  objc_storeStrong((id *)&self->_scrollVelocity, a3);
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (NSString)sectionHeadlineId
{
  return self->_sectionHeadlineId;
}

- (void)setSectionHeadlineId:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeadlineId, a3);
}

- (float)verticalScrollPositionStarting
{
  return self->_verticalScrollPositionStarting;
}

- (float)verticalScrollPositionEnding
{
  return self->_verticalScrollPositionEnding;
}

- (float)scrollingVelocity
{
  return self->_scrollingVelocity;
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, a3);
}

- (NTPBAlternateHeadline)alternateHeadline
{
  return self->_alternateHeadline;
}

- (void)setAlternateHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_alternateHeadline, a3);
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

- (NTPBIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
  objc_storeStrong((id *)&self->_issueExposureData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalScrollPositionStart, 0);
  objc_storeStrong((id *)&self->_verticalScrollPositionEnd, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_scrollVelocity, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
  objc_storeStrong((id *)&self->_alternateHeadline, 0);
}

@end
