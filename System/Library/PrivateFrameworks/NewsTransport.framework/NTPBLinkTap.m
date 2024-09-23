@implementation NTPBLinkTap

- (int)tapLocationType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_tapLocationType;
  else
    return 0;
}

- (void)setTapLocationType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tapLocationType = a3;
}

- (void)setHasTapLocationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTapLocationType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasTappedLinkUrl
{
  return self->_tappedLinkUrl != 0;
}

- (BOOL)hasWebEmbedId
{
  return self->_webEmbedId != 0;
}

- (int)webEmbedLocation
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_webEmbedLocation;
  else
    return 0;
}

- (void)setWebEmbedLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_webEmbedLocation = a3;
}

- (void)setHasWebEmbedLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWebEmbedLocation
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)webEmbedLocationAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD53E20 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWebEmbedLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WEB_EMBED_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_MODULE_WEB_EMBED_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_WEB_EMBED_LOCATION")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)linkType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_linkType;
  else
    return 0;
}

- (void)setLinkType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)groupType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroupType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return *(&off_24CD53E38 + a3);
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

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
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
  v8.super_class = (Class)NTPBLinkTap;
  -[NTPBLinkTap description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBLinkTap dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *referencedArticleId;
  NSString *tappedLinkUrl;
  NSString *webEmbedId;
  char has;
  uint64_t webEmbedLocation;
  void *v11;
  void *v12;
  uint64_t groupType;
  void *v14;
  NSData *articleViewingSessionId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_tapLocationType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("tap_location_type"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  tappedLinkUrl = self->_tappedLinkUrl;
  if (tappedLinkUrl)
    objc_msgSend(v3, "setObject:forKey:", tappedLinkUrl, CFSTR("tapped_link_url"));
  webEmbedId = self->_webEmbedId;
  if (webEmbedId)
    objc_msgSend(v3, "setObject:forKey:", webEmbedId, CFSTR("web_embed_id"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_13;
LABEL_19:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_linkType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("link_type"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_24;
LABEL_20:
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = *(&off_24CD53E38 + groupType);
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("group_type"));

    goto LABEL_24;
  }
  webEmbedLocation = self->_webEmbedLocation;
  if (webEmbedLocation >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_webEmbedLocation);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *(&off_24CD53E20 + webEmbedLocation);
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("web_embed_location"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_13:
  if ((has & 1) != 0)
    goto LABEL_20;
LABEL_24:
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLinkTapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_referencedArticleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_tappedLinkUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_webEmbedId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_15:
  if (self->_articleViewingSessionId)
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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char has;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_tapLocationType;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  v9 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_tappedLinkUrl, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  v13 = -[NSString copyWithZone:](self->_webEmbedId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v13;

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v6 + 28) = self->_linkType;
    *(_BYTE *)(v6 + 68) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 64) = self->_webEmbedLocation;
  *(_BYTE *)(v6 + 68) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_groupType;
    *(_BYTE *)(v6 + 68) |= 1u;
  }
LABEL_7:
  v16 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v16;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSString *referencedArticleId;
  NSString *tappedLinkUrl;
  NSString *webEmbedId;
  NSData *articleViewingSessionId;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_tapLocationType != *((_DWORD *)v4 + 10))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
LABEL_32:
    v10 = 0;
    goto LABEL_33;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_32;
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_32;
  }
  tappedLinkUrl = self->_tappedLinkUrl;
  if ((unint64_t)tappedLinkUrl | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](tappedLinkUrl, "isEqual:"))
      goto LABEL_32;
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](webEmbedId, "isEqual:"))
      goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_webEmbedLocation != *((_DWORD *)v4 + 16))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_linkType != *((_DWORD *)v4 + 7))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_32;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 2))
    v10 = -[NSData isEqual:](articleViewingSessionId, "isEqual:");
  else
    v10 = 1;
LABEL_33:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_tapLocationType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_articleId, "hash");
  v5 = -[NSString hash](self->_referencedArticleId, "hash");
  v6 = -[NSString hash](self->_tappedLinkUrl, "hash");
  v7 = -[NSString hash](self->_webEmbedId, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_10:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSData hash](self->_articleViewingSessionId, "hash");
  }
  v8 = 2654435761 * self->_webEmbedLocation;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v9 = 2654435761 * self->_linkType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v10 = 2654435761 * self->_groupType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSData hash](self->_articleViewingSessionId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;
  _DWORD *v6;

  v4 = a3;
  if ((v4[17] & 4) != 0)
  {
    self->_tapLocationType = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBLinkTap setArticleId:](self, "setArticleId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBLinkTap setReferencedArticleId:](self, "setReferencedArticleId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBLinkTap setTappedLinkUrl:](self, "setTappedLinkUrl:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBLinkTap setWebEmbedId:](self, "setWebEmbedId:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 8) != 0)
  {
    self->_webEmbedLocation = v4[16];
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((v4[17] & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_linkType = v4[7];
  *(_BYTE *)&self->_has |= 2u;
  if ((v4[17] & 1) != 0)
  {
LABEL_14:
    self->_groupType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBLinkTap setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v6;
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

- (NSString)tappedLinkUrl
{
  return self->_tappedLinkUrl;
}

- (void)setTappedLinkUrl:(id)a3
{
  objc_storeStrong((id *)&self->_tappedLinkUrl, a3);
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
  objc_storeStrong((id *)&self->_webEmbedId, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_tappedLinkUrl, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
