@implementation NTPBIssueTocView

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

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (int)parentFeedType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParentFeedType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4D190[a3];
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

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NTPBIssueTocView;
  -[NTPBIssueTocView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBIssueTocView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBIssueData *issueData;
  void *v5;
  NTPBIssueExposureData *issueExposureData;
  void *v7;
  NTPBIssueViewData *issueViewData;
  void *v9;
  NSString *articleId;
  uint64_t parentFeedType;
  __CFString *v12;
  NSString *parentFeedId;
  NSString *sourceChannelId;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("issue_exposure_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("issue_view_data"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_24CD4D190[parentFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("parent_feed_type"));

  }
  parentFeedId = self->_parentFeedId;
  if (parentFeedId)
    objc_msgSend(v3, "setObject:forKey:", parentFeedId, CFSTR("parent_feed_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("ad_supported_channel"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueTocViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_issueExposureData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_issueViewData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_parentFeedId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_parentFeedType;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_parentFeedId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_adSupportedChannel;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBIssueViewData *issueViewData;
  NSString *articleId;
  NSString *parentFeedId;
  NSString *sourceChannelId;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 2))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_21;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 3))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_21;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 4))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_21;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 12))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_21;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](parentFeedId, "isEqual:"))
  {
    goto LABEL_21;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_21;
  }
  v11 = (*((_BYTE *)v4 + 68) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0)
    {
LABEL_21:
      v11 = 0;
      goto LABEL_22;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_21;
    }
    v11 = 1;
  }
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;

  v3 = -[NTPBIssueData hash](self->_issueData, "hash");
  v4 = -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  v5 = -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  v6 = -[NSString hash](self->_articleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_parentFeedType;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_parentFeedId, "hash");
  v9 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_adSupportedChannel;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NTPBIssueData *issueData;
  uint64_t v6;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v8;
  NTPBIssueViewData *issueViewData;
  uint64_t v10;
  id v11;

  v4 = a3;
  issueData = self->_issueData;
  v6 = *((_QWORD *)v4 + 2);
  v11 = v4;
  if (issueData)
  {
    if (!v6)
      goto LABEL_7;
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NTPBIssueTocView setIssueData:](self, "setIssueData:");
  }
  v4 = v11;
LABEL_7:
  issueExposureData = self->_issueExposureData;
  v8 = *((_QWORD *)v4 + 3);
  if (issueExposureData)
  {
    if (!v8)
      goto LABEL_13;
    -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[NTPBIssueTocView setIssueExposureData:](self, "setIssueExposureData:");
  }
  v4 = v11;
LABEL_13:
  issueViewData = self->_issueViewData;
  v10 = *((_QWORD *)v4 + 4);
  if (issueViewData)
  {
    if (!v10)
      goto LABEL_19;
    -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[NTPBIssueTocView setIssueViewData:](self, "setIssueViewData:");
  }
  v4 = v11;
LABEL_19:
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBIssueTocView setArticleId:](self, "setArticleId:");
    v4 = v11;
  }
  if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    self->_parentFeedType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBIssueTocView setParentFeedId:](self, "setParentFeedId:");
    v4 = v11;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBIssueTocView setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v11;
  }
  if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    self->_adSupportedChannel = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (NTPBIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
  objc_storeStrong((id *)&self->_issueExposureData, a3);
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewData, a3);
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_parentFeedId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
