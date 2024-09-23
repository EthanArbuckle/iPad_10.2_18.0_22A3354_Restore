@implementation NTPBMediaView

- (int)mediaType
{
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_mediaType;
  else
    return 0;
}

- (void)setMediaType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMediaType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_24CD4D700[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMediaType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GALLERY_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMAGE_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERACTIVE_WIDGET_MEDIA_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_MEDIA_TYPE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasMediaId
{
  return self->_mediaId != 0;
}

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

- (void)setGalleryImageCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_galleryImageCount = a3;
}

- (void)setHasGalleryImageCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasGalleryImageCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)galleryType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_galleryType;
  else
    return 0;
}

- (void)setGalleryType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_galleryType = a3;
}

- (void)setHasGalleryType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasGalleryType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)galleryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4D738[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGalleryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_GALLERY_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOSAIC_GALLERY_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STRIP_GALLERY_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4D750[a3];
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

- (int)feedCellSection
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_feedCellSection;
  else
    return 0;
}

- (void)setFeedCellSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFeedCellSection
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 < 0x12)
    return off_24CD4D800[a3];
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

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return *(_WORD *)&self->_has >> 15;
}

- (int)articleType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasArticleType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD4D890[a3];
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
  *(_WORD *)&self->_has |= 0x800u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasPublisherArticleVersion
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasBackendArticleVersion
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_WORD *)&self->_has >> 12) & 1;
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

- (void)setIsDigitalReplicaAd:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)clearGalleryImageIds
{
  -[NSMutableArray removeAllObjects](self->_galleryImageIds, "removeAllObjects");
}

- (void)addGalleryImageIds:(id)a3
{
  id v4;
  NSMutableArray *galleryImageIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  galleryImageIds = self->_galleryImageIds;
  v8 = v4;
  if (!galleryImageIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_galleryImageIds;
    self->_galleryImageIds = v6;

    v4 = v8;
    galleryImageIds = self->_galleryImageIds;
  }
  -[NSMutableArray addObject:](galleryImageIds, "addObject:", v4);

}

- (unint64_t)galleryImageIdsCount
{
  return -[NSMutableArray count](self->_galleryImageIds, "count");
}

- (id)galleryImageIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_galleryImageIds, "objectAtIndex:", a3);
}

+ (Class)galleryImageIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
}

- (BOOL)hasPreviousArticleVersion
{
  return self->_previousArticleVersion != 0;
}

- (BOOL)hasWidgetEngagement
{
  return self->_widgetEngagement != 0;
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

- (void)setIsNativeAd:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsNativeAd
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasGalleryId
{
  return self->_galleryId != 0;
}

- (BOOL)hasGalleryViewingSessionId
{
  return self->_galleryViewingSessionId != 0;
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

- (BOOL)hasIadNativeCampaignAd
{
  return self->_iadNativeCampaignAd != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBMediaView;
  -[NTPBMediaView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBMediaView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t mediaType;
  __CFString *v5;
  NSString *mediaId;
  NSString *articleId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  __int16 has;
  void *v13;
  uint64_t galleryType;
  __CFString *v15;
  uint64_t feedType;
  __CFString *v17;
  NSString *feedId;
  uint64_t feedCellSection;
  __CFString *v20;
  NSData *feedViewExposureId;
  $8CCE0CD08026D23CC9DDF7AE99B63396 v22;
  void *v23;
  uint64_t articleType;
  __CFString *v25;
  NSMutableArray *namedEntities;
  __int16 v27;
  void *v28;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  __int16 v33;
  void *v34;
  void *v35;
  NSMutableArray *galleryImageIds;
  NSString *metadata;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  void *v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  __int16 v49;
  void *v50;
  NSString *galleryId;
  NSData *galleryViewingSessionId;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  NSString *iadNativeCampaignAd;
  NTPBIssueData *issueData;
  void *v58;
  NTPBIssueExposureData *issueExposureData;
  void *v60;
  NTPBIssueViewData *issueViewData;
  void *v62;
  id v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    mediaType = self->_mediaType;
    if (mediaType >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediaType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD4D700[mediaType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("media_type"));

  }
  mediaId = self->_mediaId;
  if (mediaId)
    objc_msgSend(v3, "setObject:forKey:", mediaId, CFSTR("media_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId)
    objc_msgSend(v3, "setObject:forKey:", referencedArticleId, CFSTR("referenced_article_id"));
  articleSessionId = self->_articleSessionId;
  if (articleSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleSessionId, CFSTR("article_session_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_galleryImageCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("gallery_image_count"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_20:
      if ((has & 0x80) == 0)
        goto LABEL_31;
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_20;
  }
  galleryType = self->_galleryType;
  if (galleryType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_galleryType);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_24CD4D738[galleryType];
  }
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("gallery_type"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_27:
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_24CD4D750[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("feed_type"));

  }
LABEL_31:
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    feedCellSection = self->_feedCellSection;
    if (feedCellSection >= 0x12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellSection);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_24CD4D800[feedCellSection];
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("feed_cell_section"));

  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("is_user_subscribed_to_feed"));

    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_48;
  }
  else if ((*(_BYTE *)&v22 & 0x10) == 0)
  {
    goto LABEL_48;
  }
  articleType = self->_articleType;
  if (articleType >= 6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_24CD4D890[articleType];
  }
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("article_type"));

LABEL_48:
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v3, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  v27 = (__int16)self->_has;
  if ((v27 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("publisher_article_version"));

    v27 = (__int16)self->_has;
    if ((v27 & 0x20) == 0)
    {
LABEL_52:
      if ((v27 & 0x1000) == 0)
        goto LABEL_54;
      goto LABEL_53;
    }
  }
  else if ((v27 & 0x20) == 0)
  {
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("backend_article_version"));

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_53:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("ad_supported_channel"));

  }
LABEL_54:
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
  v33 = (__int16)self->_has;
  if ((v33 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDigitalReplicaAd);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("is_digital_replica_ad"));

    v33 = (__int16)self->_has;
  }
  if ((v33 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("personalization_treatment_id"));

  }
  galleryImageIds = self->_galleryImageIds;
  if (galleryImageIds)
    objc_msgSend(v3, "setObject:forKey:", galleryImageIds, CFSTR("gallery_image_ids"));
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v3, "setObject:forKey:", metadata, CFSTR("metadata"));
  previousArticleId = self->_previousArticleId;
  if (previousArticleId)
    objc_msgSend(v3, "setObject:forKey:", previousArticleId, CFSTR("previous_article_id"));
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion)
    objc_msgSend(v3, "setObject:forKey:", previousArticleVersion, CFSTR("previous_article_version"));
  widgetEngagement = self->_widgetEngagement;
  if (widgetEngagement)
  {
    -[NTPBWidgetEngagement dictionaryRepresentation](widgetEngagement, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("widget_engagement"));

  }
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v43 = self->_fractionalCohortMemberships;
    v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v71 != v46)
            objc_enumerationMutation(v43);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "dictionaryRepresentation");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v48);

        }
        v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      }
      while (v45);
    }

    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("fractional_cohort_membership"));
  }
  v49 = (__int16)self->_has;
  if ((v49 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNativeAd);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("is_native_ad"));

    v49 = (__int16)self->_has;
    if ((v49 & 8) == 0)
    {
LABEL_87:
      if ((v49 & 1) == 0)
        goto LABEL_88;
      goto LABEL_114;
    }
  }
  else if ((v49 & 8) == 0)
  {
    goto LABEL_87;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("publisher_article_version_int64"));

  v49 = (__int16)self->_has;
  if ((v49 & 1) == 0)
  {
LABEL_88:
    if ((v49 & 4) == 0)
      goto LABEL_90;
    goto LABEL_89;
  }
LABEL_114:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("backend_article_version_int64"));

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_89:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("previous_article_publisher_article_version"));

  }
LABEL_90:
  galleryId = self->_galleryId;
  if (galleryId)
    objc_msgSend(v3, "setObject:forKey:", galleryId, CFSTR("gallery_id"));
  galleryViewingSessionId = self->_galleryViewingSessionId;
  if (galleryViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", galleryViewingSessionId, CFSTR("gallery_viewing_session_id"));
  iadNativeCampaign = self->_iadNativeCampaign;
  if (iadNativeCampaign)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaign, CFSTR("iad_native_campaign"));
  iadNativeLine = self->_iadNativeLine;
  if (iadNativeLine)
    objc_msgSend(v3, "setObject:forKey:", iadNativeLine, CFSTR("iad_native_line"));
  iadNativeAd = self->_iadNativeAd;
  if (iadNativeAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeAd, CFSTR("iad_native_ad"));
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaignAd, CFSTR("iad_native_campaign_ad"));
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("issue_exposure_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("issue_view_data"));

  }
  v63 = v3;

  return v63;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMediaViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  $8CCE0CD08026D23CC9DDF7AE99B63396 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int16 v12;
  __int16 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  __int16 v24;
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
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_mediaId)
    PBDataWriterWriteStringField();
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
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 0x80) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_18:
    PBDataWriterWriteInt32Field();
LABEL_19:
  if (self->_feedId)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_27:
    PBDataWriterWriteInt32Field();
LABEL_28:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = self->_namedEntities;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }

  v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = (__int16)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_37:
      if ((v12 & 0x1000) == 0)
        goto LABEL_39;
      goto LABEL_38;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_37;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_38:
    PBDataWriterWriteBOOLField();
LABEL_39:
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  v13 = (__int16)self->_has;
  if ((v13 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = (__int16)self->_has;
  }
  if ((v13 & 2) != 0)
    PBDataWriterWriteInt64Field();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_galleryImageIds;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteStringField();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v16);
  }

  if (self->_metadata)
    PBDataWriterWriteStringField();
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  if (self->_widgetEngagement)
    PBDataWriterWriteSubmessage();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = self->_fractionalCohortMemberships;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v21);
  }

  v24 = (__int16)self->_has;
  if ((v24 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v24 = (__int16)self->_has;
    if ((v24 & 8) == 0)
    {
LABEL_75:
      if ((v24 & 1) == 0)
        goto LABEL_76;
      goto LABEL_105;
    }
  }
  else if ((v24 & 8) == 0)
  {
    goto LABEL_75;
  }
  PBDataWriterWriteInt64Field();
  v24 = (__int16)self->_has;
  if ((v24 & 1) == 0)
  {
LABEL_76:
    if ((v24 & 4) == 0)
      goto LABEL_78;
    goto LABEL_77;
  }
LABEL_105:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 4) != 0)
LABEL_77:
    PBDataWriterWriteInt64Field();
LABEL_78:
  if (self->_galleryId)
    PBDataWriterWriteStringField();
  if (self->_galleryViewingSessionId)
    PBDataWriterWriteDataField();
  if (self->_iadNativeCampaign)
    PBDataWriterWriteStringField();
  if (self->_iadNativeLine)
    PBDataWriterWriteStringField();
  if (self->_iadNativeAd)
    PBDataWriterWriteStringField();
  if (self->_iadNativeCampaignAd)
    PBDataWriterWriteStringField();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueExposureData)
    PBDataWriterWriteSubmessage();
  if (self->_issueViewData)
    PBDataWriterWriteSubmessage();

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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int16 has;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  $8CCE0CD08026D23CC9DDF7AE99B63396 v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  __int16 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __int16 v40;
  NSMutableArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  NSMutableArray *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  __int16 v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 216) = self->_mediaType;
    *(_WORD *)(v5 + 324) |= 0x400u;
  }
  v7 = -[NSString copyWithZone:](self->_mediaId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v7;

  v9 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v11;

  v13 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v13;

  v15 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v15;

  v17 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v17;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 120) = self->_galleryImageCount;
    *(_WORD *)(v6 + 324) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 136) = self->_galleryType;
  *(_WORD *)(v6 + 324) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 88) = self->_feedType;
    *(_WORD *)(v6 + 324) |= 0x80u;
  }
LABEL_7:
  v20 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v20;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 76) = self->_feedCellSection;
    *(_WORD *)(v6 + 324) |= 0x40u;
  }
  v22 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v22;

  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v24 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  *(_BYTE *)(v6 + 323) = self->_isUserSubscribedToFeed;
  *(_WORD *)(v6 + 324) |= 0x8000u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 56) = self->_articleType;
    *(_WORD *)(v6 + 324) |= 0x10u;
  }
LABEL_12:
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v25 = self->_namedEntities;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v90 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNamedEntities:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    }
    while (v27);
  }

  v31 = (__int16)self->_has;
  if ((v31 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 256) = self->_publisherArticleVersion;
    *(_WORD *)(v6 + 324) |= 0x800u;
    v31 = (__int16)self->_has;
    if ((v31 & 0x20) == 0)
    {
LABEL_21:
      if ((v31 & 0x1000) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((v31 & 0x20) == 0)
  {
    goto LABEL_21;
  }
  *(_DWORD *)(v6 + 72) = self->_backendArticleVersion;
  *(_WORD *)(v6 + 324) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_22:
    *(_BYTE *)(v6 + 320) = self->_adSupportedChannel;
    *(_WORD *)(v6 + 324) |= 0x1000u;
  }
LABEL_23:
  v32 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v32;

  v34 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 296);
  *(_QWORD *)(v6 + 296) = v34;

  v36 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v36;

  v38 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v39 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v38;

  v40 = (__int16)self->_has;
  if ((v40 & 0x2000) != 0)
  {
    *(_BYTE *)(v6 + 321) = self->_isDigitalReplicaAd;
    *(_WORD *)(v6 + 324) |= 0x2000u;
    v40 = (__int16)self->_has;
  }
  if ((v40 & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_personalizationTreatmentId;
    *(_WORD *)(v6 + 324) |= 2u;
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v41 = self->_galleryImageIds;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v86 != v44)
          objc_enumerationMutation(v41);
        v46 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addGalleryImageIds:", v46);

      }
      v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    }
    while (v43);
  }

  v47 = -[NSString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v48 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v47;

  v49 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v50 = *(void **)(v6 + 240);
  *(_QWORD *)(v6 + 240) = v49;

  v51 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v52 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v51;

  v53 = -[NTPBWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v54 = *(void **)(v6 + 312);
  *(_QWORD *)(v6 + 312) = v53;

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v55 = self->_fractionalCohortMemberships;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v82;
    do
    {
      for (k = 0; k != v57; ++k)
      {
        if (*(_QWORD *)v82 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v81);
        objc_msgSend((id)v6, "addFractionalCohortMembership:", v60);

      }
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
    }
    while (v57);
  }

  v61 = (__int16)self->_has;
  if ((v61 & 0x4000) != 0)
  {
    *(_BYTE *)(v6 + 322) = self->_isNativeAd;
    *(_WORD *)(v6 + 324) |= 0x4000u;
    v61 = (__int16)self->_has;
    if ((v61 & 8) == 0)
    {
LABEL_43:
      if ((v61 & 1) == 0)
        goto LABEL_44;
LABEL_55:
      *(_QWORD *)(v6 + 8) = self->_backendArticleVersionInt64;
      *(_WORD *)(v6 + 324) |= 1u;
      if ((*(_WORD *)&self->_has & 4) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((v61 & 8) == 0)
  {
    goto LABEL_43;
  }
  *(_QWORD *)(v6 + 32) = self->_publisherArticleVersionInt64;
  *(_WORD *)(v6 + 324) |= 8u;
  v61 = (__int16)self->_has;
  if ((v61 & 1) != 0)
    goto LABEL_55;
LABEL_44:
  if ((v61 & 4) != 0)
  {
LABEL_45:
    *(_QWORD *)(v6 + 24) = self->_previousArticlePublisherArticleVersion;
    *(_WORD *)(v6 + 324) |= 4u;
  }
LABEL_46:
  v62 = -[NSString copyWithZone:](self->_galleryId, "copyWithZone:", a3, (_QWORD)v81);
  v63 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v62;

  v64 = -[NSData copyWithZone:](self->_galleryViewingSessionId, "copyWithZone:", a3);
  v65 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v64;

  v66 = -[NSString copyWithZone:](self->_iadNativeCampaign, "copyWithZone:", a3);
  v67 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v66;

  v68 = -[NSString copyWithZone:](self->_iadNativeLine, "copyWithZone:", a3);
  v69 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v68;

  v70 = -[NSString copyWithZone:](self->_iadNativeAd, "copyWithZone:", a3);
  v71 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v70;

  v72 = -[NSString copyWithZone:](self->_iadNativeCampaignAd, "copyWithZone:", a3);
  v73 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v72;

  v74 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v75 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v74;

  v76 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v77 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v76;

  v78 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v79 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v78;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mediaId;
  NSString *articleId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  __int16 has;
  __int16 v12;
  NSString *feedId;
  __int16 v14;
  NSData *feedViewExposureId;
  __int16 v16;
  NSMutableArray *namedEntities;
  __int16 v18;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  __int16 v23;
  __int16 v24;
  NSMutableArray *galleryImageIds;
  NSString *metadata;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  NSMutableArray *fractionalCohortMemberships;
  __int16 v31;
  __int16 v32;
  NSString *galleryId;
  NSData *galleryViewingSessionId;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  NSString *iadNativeCampaignAd;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBIssueViewData *issueViewData;
  char v42;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_153;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x400) == 0 || self->_mediaType != *((_DWORD *)v4 + 54))
      goto LABEL_153;
  }
  else if ((*((_WORD *)v4 + 162) & 0x400) != 0)
  {
    goto LABEL_153;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((_QWORD *)v4 + 26) && !-[NSString isEqual:](mediaId, "isEqual:"))
    goto LABEL_153;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_153;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_153;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:"))
      goto LABEL_153;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_153;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_153;
  }
  has = (__int16)self->_has;
  v12 = *((_WORD *)v4 + 162);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x100) == 0 || self->_galleryImageCount != *((_DWORD *)v4 + 30))
      goto LABEL_153;
  }
  else if ((*((_WORD *)v4 + 162) & 0x100) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x200) == 0 || self->_galleryType != *((_DWORD *)v4 + 34))
      goto LABEL_153;
  }
  else if ((*((_WORD *)v4 + 162) & 0x200) != 0)
  {
    goto LABEL_153;
  }
  if ((has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_feedType != *((_DWORD *)v4 + 22))
      goto LABEL_153;
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_153;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_153;
    has = (__int16)self->_has;
  }
  v14 = *((_WORD *)v4 + 162);
  if ((has & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 19))
      goto LABEL_153;
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_153;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_153;
    has = (__int16)self->_has;
  }
  v16 = *((_WORD *)v4 + 162);
  if (has < 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x8000) == 0)
      goto LABEL_153;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 323))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 323))
    {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x8000) != 0)
  {
    goto LABEL_153;
  }
  if ((has & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_articleType != *((_DWORD *)v4 + 14))
      goto LABEL_153;
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_153;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_153;
    has = (__int16)self->_has;
  }
  v18 = *((_WORD *)v4 + 162);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x800) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 64))
      goto LABEL_153;
  }
  else if ((*((_WORD *)v4 + 162) & 0x800) != 0)
  {
    goto LABEL_153;
  }
  if ((has & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 18))
      goto LABEL_153;
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_153;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x1000) == 0)
      goto LABEL_153;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 320))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 320))
    {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x1000) != 0)
  {
    goto LABEL_153;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 36)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_153;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_153;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_153;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_153;
  }
  v23 = (__int16)self->_has;
  v24 = *((_WORD *)v4 + 162);
  if ((v23 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x2000) == 0)
      goto LABEL_153;
    if (self->_isDigitalReplicaAd)
    {
      if (!*((_BYTE *)v4 + 321))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 321))
    {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x2000) != 0)
  {
    goto LABEL_153;
  }
  if ((v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 2))
      goto LABEL_153;
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_153;
  }
  galleryImageIds = self->_galleryImageIds;
  if ((unint64_t)galleryImageIds | *((_QWORD *)v4 + 16)
    && !-[NSMutableArray isEqual:](galleryImageIds, "isEqual:"))
  {
    goto LABEL_153;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](metadata, "isEqual:"))
      goto LABEL_153;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_153;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_153;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((_QWORD *)v4 + 39))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
      goto LABEL_153;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
      goto LABEL_153;
  }
  v31 = (__int16)self->_has;
  v32 = *((_WORD *)v4 + 162);
  if ((v31 & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x4000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((_BYTE *)v4 + 322))
          goto LABEL_153;
        goto LABEL_120;
      }
      if (!*((_BYTE *)v4 + 322))
        goto LABEL_120;
    }
LABEL_153:
    v42 = 0;
    goto LABEL_154;
  }
  if ((*((_WORD *)v4 + 162) & 0x4000) != 0)
    goto LABEL_153;
LABEL_120:
  if ((v31 & 8) != 0)
  {
    if ((v32 & 8) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 4))
      goto LABEL_153;
  }
  else if ((v32 & 8) != 0)
  {
    goto LABEL_153;
  }
  if ((v31 & 1) != 0)
  {
    if ((v32 & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_153;
  }
  else if ((v32 & 1) != 0)
  {
    goto LABEL_153;
  }
  if ((v31 & 4) != 0)
  {
    if ((v32 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 3))
      goto LABEL_153;
  }
  else if ((v32 & 4) != 0)
  {
    goto LABEL_153;
  }
  galleryId = self->_galleryId;
  if ((unint64_t)galleryId | *((_QWORD *)v4 + 14) && !-[NSString isEqual:](galleryId, "isEqual:"))
    goto LABEL_153;
  galleryViewingSessionId = self->_galleryViewingSessionId;
  if ((unint64_t)galleryViewingSessionId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSData isEqual:](galleryViewingSessionId, "isEqual:"))
      goto LABEL_153;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
      goto LABEL_153;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:"))
      goto LABEL_153;
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:"))
      goto LABEL_153;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
      goto LABEL_153;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 23))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_153;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 24))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_153;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 25))
    v42 = -[NTPBIssueViewData isEqual:](issueViewData, "isEqual:");
  else
    v42 = 1;
LABEL_154:

  return v42;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  __int16 has;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  __int16 v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  unint64_t v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSUInteger v54;
  uint64_t v55;
  uint64_t v56;
  NSUInteger v57;
  uint64_t v58;
  uint64_t v59;
  NSUInteger v60;
  NSUInteger v61;
  NSUInteger v62;
  NSUInteger v63;
  NSUInteger v64;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
    v46 = 2654435761 * self->_mediaType;
  else
    v46 = 0;
  v3 = -[NSString hash](self->_mediaId, "hash");
  v4 = -[NSString hash](self->_articleId, "hash");
  v60 = -[NSString hash](self->_referencedArticleId, "hash");
  v59 = -[NSData hash](self->_articleSessionId, "hash");
  v58 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v5 = -[NSString hash](self->_sourceChannelId, "hash");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v7 = 2654435761 * self->_galleryImageCount;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_galleryType;
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  v56 = v7;
  v57 = v5;
  v55 = v8;
  if ((has & 0x80) != 0)
    v45 = 2654435761 * self->_feedType;
  else
    v45 = 0;
  v54 = -[NSString hash](self->_feedId, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v44 = 2654435761 * self->_feedCellSection;
  else
    v44 = 0;
  v9 = -[NSData hash](self->_feedViewExposureId, "hash");
  v10 = (__int16)self->_has;
  if (v10 < 0)
    v11 = 2654435761 * self->_isUserSubscribedToFeed;
  else
    v11 = 0;
  v52 = v11;
  v53 = v9;
  if ((v10 & 0x10) != 0)
    v43 = 2654435761 * self->_articleType;
  else
    v43 = 0;
  v12 = -[NSMutableArray hash](self->_namedEntities, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x800) != 0)
  {
    v41 = 2654435761 * self->_publisherArticleVersion;
    if ((v13 & 0x20) != 0)
      goto LABEL_23;
  }
  else
  {
    v41 = 0;
    if ((v13 & 0x20) != 0)
    {
LABEL_23:
      v14 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_26;
    }
  }
  v14 = 0;
LABEL_26:
  v50 = v14;
  v51 = v12;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
    v49 = 2654435761 * self->_adSupportedChannel;
  else
    v49 = 0;
  v15 = -[NSString hash](self->_surfacedByChannelId, "hash", v41);
  v16 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v17 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v18 = -[NSString hash](self->_sectionHeadlineId, "hash");
  v19 = (__int16)self->_has;
  if ((v19 & 0x2000) != 0)
    v48 = 2654435761 * self->_isDigitalReplicaAd;
  else
    v48 = 0;
  v63 = v16;
  v64 = v15;
  v61 = v18;
  v62 = v17;
  if ((v19 & 2) != 0)
    v47 = 2654435761 * self->_personalizationTreatmentId;
  else
    v47 = 0;
  v20 = -[NSMutableArray hash](self->_galleryImageIds, "hash");
  v21 = -[NSString hash](self->_metadata, "hash");
  v22 = -[NSString hash](self->_previousArticleId, "hash");
  v23 = -[NSString hash](self->_previousArticleVersion, "hash");
  v24 = -[NTPBWidgetEngagement hash](self->_widgetEngagement, "hash");
  v25 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v26 = (__int16)self->_has;
  if ((v26 & 0x4000) != 0)
    v27 = 2654435761 * self->_isNativeAd;
  else
    v27 = 0;
  if ((v26 & 8) == 0)
  {
    v28 = 0;
    if ((v26 & 1) != 0)
      goto LABEL_40;
LABEL_43:
    v29 = 0;
    if ((v26 & 4) != 0)
      goto LABEL_41;
LABEL_44:
    v30 = 0;
    goto LABEL_45;
  }
  v28 = 2654435761 * self->_publisherArticleVersionInt64;
  if ((v26 & 1) == 0)
    goto LABEL_43;
LABEL_40:
  v29 = 2654435761 * self->_backendArticleVersionInt64;
  if ((v26 & 4) == 0)
    goto LABEL_44;
LABEL_41:
  v30 = 2654435761 * self->_previousArticlePublisherArticleVersion;
LABEL_45:
  v31 = v3 ^ v46 ^ v4 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v45 ^ v54 ^ v44 ^ v53 ^ v52 ^ v43 ^ v51 ^ v42 ^ v50 ^ v49 ^ v64 ^ v63 ^ v62 ^ v61 ^ v48 ^ v47 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v27;
  v32 = v28 ^ v29 ^ v30 ^ -[NSString hash](self->_galleryId, "hash");
  v33 = v32 ^ -[NSData hash](self->_galleryViewingSessionId, "hash");
  v34 = v33 ^ -[NSString hash](self->_iadNativeCampaign, "hash");
  v35 = v34 ^ -[NSString hash](self->_iadNativeLine, "hash");
  v36 = v35 ^ -[NSString hash](self->_iadNativeAd, "hash");
  v37 = v36 ^ -[NSString hash](self->_iadNativeCampaignAd, "hash");
  v38 = v31 ^ v37 ^ -[NTPBIssueData hash](self->_issueData, "hash");
  v39 = -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  return v38 ^ v39 ^ -[NTPBIssueViewData hash](self->_issueViewData, "hash");
}

- (void)mergeFrom:(id)a3
{
  __int16 *v4;
  __int16 *v5;
  __int16 v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int16 v13;
  __int16 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  __int16 v27;
  NTPBIssueData *issueData;
  uint64_t v29;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v31;
  NTPBIssueViewData *issueViewData;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = (__int16 *)a3;
  v5 = v4;
  if ((v4[162] & 0x400) != 0)
  {
    self->_mediaType = *((_DWORD *)v4 + 54);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)v4 + 26))
    -[NTPBMediaView setMediaId:](self, "setMediaId:");
  if (*((_QWORD *)v5 + 5))
    -[NTPBMediaView setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 33))
    -[NTPBMediaView setReferencedArticleId:](self, "setReferencedArticleId:");
  if (*((_QWORD *)v5 + 6))
    -[NTPBMediaView setArticleSessionId:](self, "setArticleSessionId:");
  if (*((_QWORD *)v5 + 8))
    -[NTPBMediaView setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  if (*((_QWORD *)v5 + 35))
    -[NTPBMediaView setSourceChannelId:](self, "setSourceChannelId:");
  v6 = v5[162];
  if ((v6 & 0x100) != 0)
  {
    self->_galleryImageCount = *((_DWORD *)v5 + 30);
    *(_WORD *)&self->_has |= 0x100u;
    v6 = v5[162];
    if ((v6 & 0x200) == 0)
    {
LABEL_17:
      if ((v6 & 0x80) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((v5[162] & 0x200) == 0)
  {
    goto LABEL_17;
  }
  self->_galleryType = *((_DWORD *)v5 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  if ((v5[162] & 0x80) != 0)
  {
LABEL_18:
    self->_feedType = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_19:
  if (*((_QWORD *)v5 + 10))
    -[NTPBMediaView setFeedId:](self, "setFeedId:");
  if ((v5[162] & 0x40) != 0)
  {
    self->_feedCellSection = *((_DWORD *)v5 + 19);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v5 + 12))
    -[NTPBMediaView setFeedViewExposureId:](self, "setFeedViewExposureId:");
  v7 = v5[162];
  if ((v7 & 0x80000000) == 0)
  {
    if ((v7 & 0x10) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
  self->_isUserSubscribedToFeed = *((_BYTE *)v5 + 323);
  *(_WORD *)&self->_has |= 0x8000u;
  if ((v5[162] & 0x10) != 0)
  {
LABEL_27:
    self->_articleType = *((_DWORD *)v5 + 14);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_28:
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = *((id *)v5 + 29);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v8);
        -[NTPBMediaView addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v10);
  }

  v13 = v5[162];
  if ((v13 & 0x800) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 64);
    *(_WORD *)&self->_has |= 0x800u;
    v13 = v5[162];
    if ((v13 & 0x20) == 0)
    {
LABEL_37:
      if ((v13 & 0x1000) == 0)
        goto LABEL_39;
      goto LABEL_38;
    }
  }
  else if ((v13 & 0x20) == 0)
  {
    goto LABEL_37;
  }
  self->_backendArticleVersion = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  if ((v5[162] & 0x1000) != 0)
  {
LABEL_38:
    self->_adSupportedChannel = *((_BYTE *)v5 + 320);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_39:
  if (*((_QWORD *)v5 + 36))
    -[NTPBMediaView setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v5 + 37))
    -[NTPBMediaView setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v5 + 38))
    -[NTPBMediaView setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 34))
    -[NTPBMediaView setSectionHeadlineId:](self, "setSectionHeadlineId:");
  v14 = v5[162];
  if ((v14 & 0x2000) != 0)
  {
    self->_isDigitalReplicaAd = *((_BYTE *)v5 + 321);
    *(_WORD *)&self->_has |= 0x2000u;
    v14 = v5[162];
  }
  if ((v14 & 2) != 0)
  {
    self->_personalizationTreatmentId = *((_QWORD *)v5 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = *((id *)v5 + 16);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v15);
        -[NTPBMediaView addGalleryImageIds:](self, "addGalleryImageIds:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v17);
  }

  if (*((_QWORD *)v5 + 28))
    -[NTPBMediaView setMetadata:](self, "setMetadata:");
  if (*((_QWORD *)v5 + 30))
    -[NTPBMediaView setPreviousArticleId:](self, "setPreviousArticleId:");
  if (*((_QWORD *)v5 + 31))
    -[NTPBMediaView setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  widgetEngagement = self->_widgetEngagement;
  v21 = *((_QWORD *)v5 + 39);
  if (widgetEngagement)
  {
    if (v21)
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v21)
  {
    -[NTPBMediaView setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = *((id *)v5 + 13);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        -[NTPBMediaView addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k), (_QWORD)v34);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v24);
  }

  v27 = v5[162];
  if ((v27 & 0x4000) != 0)
  {
    self->_isNativeAd = *((_BYTE *)v5 + 322);
    *(_WORD *)&self->_has |= 0x4000u;
    v27 = v5[162];
    if ((v27 & 8) == 0)
    {
LABEL_86:
      if ((v27 & 1) == 0)
        goto LABEL_87;
      goto LABEL_106;
    }
  }
  else if ((v27 & 8) == 0)
  {
    goto LABEL_86;
  }
  self->_publisherArticleVersionInt64 = *((_QWORD *)v5 + 4);
  *(_WORD *)&self->_has |= 8u;
  v27 = v5[162];
  if ((v27 & 1) == 0)
  {
LABEL_87:
    if ((v27 & 4) == 0)
      goto LABEL_89;
    goto LABEL_88;
  }
LABEL_106:
  self->_backendArticleVersionInt64 = *((_QWORD *)v5 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((v5[162] & 4) != 0)
  {
LABEL_88:
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v5 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_89:
  if (*((_QWORD *)v5 + 14))
    -[NTPBMediaView setGalleryId:](self, "setGalleryId:");
  if (*((_QWORD *)v5 + 18))
    -[NTPBMediaView setGalleryViewingSessionId:](self, "setGalleryViewingSessionId:");
  if (*((_QWORD *)v5 + 20))
    -[NTPBMediaView setIadNativeCampaign:](self, "setIadNativeCampaign:");
  if (*((_QWORD *)v5 + 22))
    -[NTPBMediaView setIadNativeLine:](self, "setIadNativeLine:");
  if (*((_QWORD *)v5 + 19))
    -[NTPBMediaView setIadNativeAd:](self, "setIadNativeAd:");
  if (*((_QWORD *)v5 + 21))
    -[NTPBMediaView setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  issueData = self->_issueData;
  v29 = *((_QWORD *)v5 + 23);
  if (issueData)
  {
    if (v29)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v29)
  {
    -[NTPBMediaView setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v31 = *((_QWORD *)v5 + 24);
  if (issueExposureData)
  {
    if (v31)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v31)
  {
    -[NTPBMediaView setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  v33 = *((_QWORD *)v5 + 25);
  if (issueViewData)
  {
    if (v33)
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else if (v33)
  {
    -[NTPBMediaView setIssueViewData:](self, "setIssueViewData:");
  }

}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void)setMediaId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaId, a3);
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

- (int)galleryImageCount
{
  return self->_galleryImageCount;
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

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
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

- (BOOL)isDigitalReplicaAd
{
  return self->_isDigitalReplicaAd;
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (NSMutableArray)galleryImageIds
{
  return self->_galleryImageIds;
}

- (void)setGalleryImageIds:(id)a3
{
  objc_storeStrong((id *)&self->_galleryImageIds, a3);
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSString)previousArticleId
{
  return self->_previousArticleId;
}

- (void)setPreviousArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_previousArticleId, a3);
}

- (NSString)previousArticleVersion
{
  return self->_previousArticleVersion;
}

- (void)setPreviousArticleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_previousArticleVersion, a3);
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEngagement, a3);
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, a3);
}

- (BOOL)isNativeAd
{
  return self->_isNativeAd;
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
}

- (int64_t)previousArticlePublisherArticleVersion
{
  return self->_previousArticlePublisherArticleVersion;
}

- (NSString)galleryId
{
  return self->_galleryId;
}

- (void)setGalleryId:(id)a3
{
  objc_storeStrong((id *)&self->_galleryId, a3);
}

- (NSData)galleryViewingSessionId
{
  return self->_galleryViewingSessionId;
}

- (void)setGalleryViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_galleryViewingSessionId, a3);
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

- (NSString)iadNativeCampaignAd
{
  return self->_iadNativeCampaignAd;
}

- (void)setIadNativeCampaignAd:(id)a3
{
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadNativeLine, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaign, 0);
  objc_storeStrong((id *)&self->_iadNativeAd, 0);
  objc_storeStrong((id *)&self->_galleryViewingSessionId, 0);
  objc_storeStrong((id *)&self->_galleryImageIds, 0);
  objc_storeStrong((id *)&self->_galleryId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
