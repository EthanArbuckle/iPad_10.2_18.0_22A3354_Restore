@implementation NTPBEndOfArticleExposure

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)clearRecommendedArticleIds
{
  -[NSMutableArray removeAllObjects](self->_recommendedArticleIds, "removeAllObjects");
}

- (void)addRecommendedArticleId:(id)a3
{
  id v4;
  NSMutableArray *recommendedArticleIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recommendedArticleIds = self->_recommendedArticleIds;
  v8 = v4;
  if (!recommendedArticleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_recommendedArticleIds;
    self->_recommendedArticleIds = v6;

    v4 = v8;
    recommendedArticleIds = self->_recommendedArticleIds;
  }
  -[NSMutableArray addObject:](recommendedArticleIds, "addObject:", v4);

}

- (unint64_t)recommendedArticleIdsCount
{
  return -[NSMutableArray count](self->_recommendedArticleIds, "count");
}

- (id)recommendedArticleIdAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recommendedArticleIds, "objectAtIndex:", a3);
}

+ (Class)recommendedArticleIdType
{
  return (Class)objc_opt_class();
}

- (void)clearReferencedRecommendedArticleIds
{
  -[NSMutableArray removeAllObjects](self->_referencedRecommendedArticleIds, "removeAllObjects");
}

- (void)addReferencedRecommendedArticleIds:(id)a3
{
  id v4;
  NSMutableArray *referencedRecommendedArticleIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  referencedRecommendedArticleIds = self->_referencedRecommendedArticleIds;
  v8 = v4;
  if (!referencedRecommendedArticleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_referencedRecommendedArticleIds;
    self->_referencedRecommendedArticleIds = v6;

    v4 = v8;
    referencedRecommendedArticleIds = self->_referencedRecommendedArticleIds;
  }
  -[NSMutableArray addObject:](referencedRecommendedArticleIds, "addObject:", v4);

}

- (unint64_t)referencedRecommendedArticleIdsCount
{
  return -[NSMutableArray count](self->_referencedRecommendedArticleIds, "count");
}

- (id)referencedRecommendedArticleIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_referencedRecommendedArticleIds, "objectAtIndex:", a3);
}

+ (Class)referencedRecommendedArticleIdsType
{
  return (Class)objc_opt_class();
}

- (int)articleType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasArticleType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD50768[a3];
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

- (void)setCharacterCount:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_characterCount = a3;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCharacterCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (void)setPublisherArticleVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPublisherArticleVersion
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBackendArticleVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NTPBEndOfArticleExposure;
  -[NTPBEndOfArticleExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBEndOfArticleExposure dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *feedId;
  NSData *feedViewExposureId;
  void *v9;
  NSMutableArray *recommendedArticleIds;
  NSMutableArray *referencedRecommendedArticleIds;
  char has;
  uint64_t articleType;
  __CFString *v14;
  void *v15;
  NSString *language;
  NSMutableArray *namedEntities;
  char v18;
  void *v19;
  void *v20;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  char v25;
  void *v26;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v4, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v4, "setObject:forKey:", feedId, CFSTR("feed_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("is_user_subscribed_to_feed"));

  }
  recommendedArticleIds = self->_recommendedArticleIds;
  if (recommendedArticleIds)
    objc_msgSend(v4, "setObject:forKey:", recommendedArticleIds, CFSTR("recommended_article_id"));
  referencedRecommendedArticleIds = self->_referencedRecommendedArticleIds;
  if (referencedRecommendedArticleIds)
    objc_msgSend(v4, "setObject:forKey:", referencedRecommendedArticleIds, CFSTR("referenced_recommended_article_ids"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_24CD50768[articleType];
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("article_type"));

    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_characterCount);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("character_count"));

  }
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v4, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  v18 = (char)self->_has;
  if ((v18 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("publisher_article_version"));

    v18 = (char)self->_has;
  }
  if ((v18 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("backend_article_version"));

  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId)
    objc_msgSend(v4, "setObject:forKey:", surfacedByChannelId, CFSTR("surfaced_by_channel_id"));
  surfacedBySectionId = self->_surfacedBySectionId;
  if (surfacedBySectionId)
    objc_msgSend(v4, "setObject:forKey:", surfacedBySectionId, CFSTR("surfaced_by_section_id"));
  surfacedByTopicId = self->_surfacedByTopicId;
  if (surfacedByTopicId)
    objc_msgSend(v4, "setObject:forKey:", surfacedByTopicId, CFSTR("surfaced_by_topic_id"));
  sectionHeadlineId = self->_sectionHeadlineId;
  if (sectionHeadlineId)
    objc_msgSend(v4, "setObject:forKey:", sectionHeadlineId, CFSTR("section_headline_id"));
  v25 = (char)self->_has;
  if ((v25 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_40;
LABEL_44:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("publisher_article_version_int64"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v4;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("personalization_treatment_id"));

  v25 = (char)self->_has;
  if ((v25 & 4) != 0)
    goto LABEL_44;
LABEL_40:
  if ((v25 & 1) != 0)
  {
LABEL_41:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("backend_article_version_int64"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEndOfArticleExposureReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char has;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  char v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_articleId)
    PBDataWriterWriteStringField();
  if (self->_referencedArticleId)
    PBDataWriterWriteStringField();
  if (self->_feedId)
    PBDataWriterWriteStringField();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteBOOLField();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_recommendedArticleIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_referencedRecommendedArticleIds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_language)
    PBDataWriterWriteStringField();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_namedEntities;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v18);
  }

  v21 = (char)self->_has;
  if ((v21 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v21 = (char)self->_has;
  }
  if ((v21 & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  v22 = (char)self->_has;
  if ((v22 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_52;
LABEL_56:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
  PBDataWriterWriteInt64Field();
  v22 = (char)self->_has;
  if ((v22 & 4) != 0)
    goto LABEL_56;
LABEL_52:
  if ((v22 & 1) != 0)
LABEL_53:
    PBDataWriterWriteInt64Field();
LABEL_54:

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
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  char has;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v8;

  v10 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_BYTE *)(v5 + 152) = self->_isUserSubscribedToFeed;
    *(_BYTE *)(v5 + 156) |= 0x80u;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v14 = self->_recommendedArticleIds;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v55 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRecommendedArticleId:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v16);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v20 = self->_referencedRecommendedArticleIds;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v51 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addReferencedRecommendedArticleIds:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v22);
  }

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_articleType;
    *(_BYTE *)(v5 + 156) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_characterCount;
    *(_BYTE *)(v5 + 156) |= 0x20u;
  }
  v27 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v27;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = self->_namedEntities;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v46);
        objc_msgSend((id)v5, "addNamedEntities:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v31);
  }

  v35 = (char)self->_has;
  if ((v35 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_publisherArticleVersion;
    *(_BYTE *)(v5 + 156) |= 0x40u;
    v35 = (char)self->_has;
  }
  if ((v35 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_backendArticleVersion;
    *(_BYTE *)(v5 + 156) |= 0x10u;
  }
  v36 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3, (_QWORD)v46);
  v37 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v36;

  v38 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v38;

  v40 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v40;

  v42 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v42;

  v44 = (char)self->_has;
  if ((v44 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_34;
LABEL_38:
    *(_QWORD *)(v5 + 24) = self->_publisherArticleVersionInt64;
    *(_BYTE *)(v5 + 156) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_35;
  }
  *(_QWORD *)(v5 + 16) = self->_personalizationTreatmentId;
  *(_BYTE *)(v5 + 156) |= 2u;
  v44 = (char)self->_has;
  if ((v44 & 4) != 0)
    goto LABEL_38;
LABEL_34:
  if ((v44 & 1) != 0)
  {
LABEL_35:
    *(_QWORD *)(v5 + 8) = self->_backendArticleVersionInt64;
    *(_BYTE *)(v5 + 156) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *articleId;
  NSString *referencedArticleId;
  NSString *feedId;
  NSData *feedViewExposureId;
  int v9;
  NSMutableArray *recommendedArticleIds;
  NSMutableArray *referencedRecommendedArticleIds;
  NSString *language;
  NSMutableArray *namedEntities;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  BOOL v18;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_69;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_69;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_69;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_69;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_69;
  }
  v9 = v4[156];
  if ((*(_BYTE *)&self->_has & 0x80000000) == 0)
  {
    if ((v9 & 0x80000000) == 0)
      goto LABEL_12;
LABEL_69:
    v18 = 0;
    goto LABEL_70;
  }
  if ((v9 & 0x80000000) == 0)
    goto LABEL_69;
  if (self->_isUserSubscribedToFeed)
  {
    if (!v4[152])
      goto LABEL_69;
  }
  else if (v4[152])
  {
    goto LABEL_69;
  }
LABEL_12:
  recommendedArticleIds = self->_recommendedArticleIds;
  if ((unint64_t)recommendedArticleIds | *((_QWORD *)v4 + 12)
    && !-[NSMutableArray isEqual:](recommendedArticleIds, "isEqual:"))
  {
    goto LABEL_69;
  }
  referencedRecommendedArticleIds = self->_referencedRecommendedArticleIds;
  if ((unint64_t)referencedRecommendedArticleIds | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](referencedRecommendedArticleIds, "isEqual:"))
      goto LABEL_69;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[156] & 8) == 0 || self->_articleType != *((_DWORD *)v4 + 10))
      goto LABEL_69;
  }
  else if ((v4[156] & 8) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[156] & 0x20) == 0 || self->_characterCount != *((_DWORD *)v4 + 12))
      goto LABEL_69;
  }
  else if ((v4[156] & 0x20) != 0)
  {
    goto LABEL_69;
  }
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](language, "isEqual:"))
    goto LABEL_69;
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_69;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[156] & 0x40) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 22))
      goto LABEL_69;
  }
  else if ((v4[156] & 0x40) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[156] & 0x10) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 11))
      goto LABEL_69;
  }
  else if ((v4[156] & 0x10) != 0)
  {
    goto LABEL_69;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_69;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_69;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_69;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_69;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[156] & 2) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 2))
      goto LABEL_69;
  }
  else if ((v4[156] & 2) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[156] & 4) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 3))
      goto LABEL_69;
  }
  else if ((v4[156] & 4) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[156] & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_69;
    v18 = 1;
  }
  else
  {
    v18 = (v4[156] & 1) == 0;
  }
LABEL_70:

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;

  v28 = -[NSString hash](self->_articleId, "hash");
  v3 = -[NSString hash](self->_referencedArticleId, "hash");
  v4 = -[NSString hash](self->_feedId, "hash");
  v5 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v27 = 2654435761 * self->_isUserSubscribedToFeed;
  else
    v27 = 0;
  v26 = -[NSMutableArray hash](self->_recommendedArticleIds, "hash");
  v6 = -[NSMutableArray hash](self->_referencedRecommendedArticleIds, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v7 = 2654435761 * self->_articleType;
  else
    v7 = 0;
  v24 = v7;
  v25 = v6;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v21 = 2654435761 * self->_characterCount;
  else
    v21 = 0;
  v8 = -[NSString hash](self->_language, "hash");
  v9 = -[NSMutableArray hash](self->_namedEntities, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v10 = 2654435761 * self->_publisherArticleVersion;
  else
    v10 = 0;
  v23 = v4;
  v22 = v3;
  v11 = v9;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v12 = 2654435761 * self->_backendArticleVersion;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_surfacedByChannelId, "hash");
  v14 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v15 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v16 = -[NSString hash](self->_sectionHeadlineId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v17 = 2654435761 * self->_personalizationTreatmentId;
  else
    v17 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v18 = 2654435761 * self->_publisherArticleVersionInt64;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_21;
LABEL_23:
    v19 = 0;
    return v22 ^ v28 ^ v23 ^ v5 ^ v27 ^ v26 ^ v25 ^ v24 ^ v21 ^ v8 ^ v11 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  v18 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_23;
LABEL_21:
  v19 = 2654435761 * self->_backendArticleVersionInt64;
  return v22 ^ v28 ^ v23 ^ v5 ^ v27 ^ v26 ^ v25 ^ v24 ^ v21 ^ v8 ^ v11 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  char v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)a3;
  if (*((_QWORD *)v4 + 4))
    -[NTPBEndOfArticleExposure setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v4 + 13))
    -[NTPBEndOfArticleExposure setReferencedArticleId:](self, "setReferencedArticleId:");
  if (*((_QWORD *)v4 + 7))
    -[NTPBEndOfArticleExposure setFeedId:](self, "setFeedId:");
  if (*((_QWORD *)v4 + 8))
    -[NTPBEndOfArticleExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
  if (v4[156] < 0)
  {
    self->_isUserSubscribedToFeed = v4[152];
    *(_BYTE *)&self->_has |= 0x80u;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = *((id *)v4 + 12);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        -[NTPBEndOfArticleExposure addRecommendedArticleId:](self, "addRecommendedArticleId:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v7);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = *((id *)v4 + 14);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        -[NTPBEndOfArticleExposure addReferencedRecommendedArticleIds:](self, "addReferencedRecommendedArticleIds:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v12);
  }

  v15 = v4[156];
  if ((v15 & 8) != 0)
  {
    self->_articleType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
    v15 = v4[156];
  }
  if ((v15 & 0x20) != 0)
  {
    self->_characterCount = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 9))
    -[NTPBEndOfArticleExposure setLanguage:](self, "setLanguage:");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = *((id *)v4 + 10);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        -[NTPBEndOfArticleExposure addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * k), (_QWORD)v23);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v18);
  }

  v21 = v4[156];
  if ((v21 & 0x40) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v4 + 22);
    *(_BYTE *)&self->_has |= 0x40u;
    v21 = v4[156];
  }
  if ((v21 & 0x10) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 16))
    -[NTPBEndOfArticleExposure setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v4 + 17))
    -[NTPBEndOfArticleExposure setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v4 + 18))
    -[NTPBEndOfArticleExposure setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v4 + 15))
    -[NTPBEndOfArticleExposure setSectionHeadlineId:](self, "setSectionHeadlineId:");
  v22 = v4[156];
  if ((v22 & 2) == 0)
  {
    if ((v4[156] & 4) == 0)
      goto LABEL_52;
LABEL_56:
    self->_publisherArticleVersionInt64 = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    if ((v4[156] & 1) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
  self->_personalizationTreatmentId = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v22 = v4[156];
  if ((v22 & 4) != 0)
    goto LABEL_56;
LABEL_52:
  if ((v22 & 1) != 0)
  {
LABEL_53:
    self->_backendArticleVersionInt64 = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_54:

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

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSMutableArray)recommendedArticleIds
{
  return self->_recommendedArticleIds;
}

- (void)setRecommendedArticleIds:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedArticleIds, a3);
}

- (NSMutableArray)referencedRecommendedArticleIds
{
  return self->_referencedRecommendedArticleIds;
}

- (void)setReferencedRecommendedArticleIds:(id)a3
{
  objc_storeStrong((id *)&self->_referencedRecommendedArticleIds, a3);
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

- (int)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int)backendArticleVersion
{
  return self->_backendArticleVersion;
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

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referencedRecommendedArticleIds, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_recommendedArticleIds, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
