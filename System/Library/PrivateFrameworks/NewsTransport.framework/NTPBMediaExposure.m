@implementation NTPBMediaExposure

- (int)mediaType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_mediaType;
  else
    return 0;
}

- (void)setMediaType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_24CD4DC30[a3];
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

- (int)galleryType
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_galleryType;
  else
    return 0;
}

- (void)setGalleryType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_galleryType = a3;
}

- (void)setHasGalleryType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasGalleryType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)galleryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4DC68[a3];
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
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFeedType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4DC80[a3];
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
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_feedCellSection;
  else
    return 0;
}

- (void)setFeedCellSection:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFeedCellSection
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 < 0x12)
    return off_24CD4DD30[a3];
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
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)articleType
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasArticleType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD4DDC0[a3];
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
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (int)mediaLocation
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_mediaLocation;
  else
    return 0;
}

- (void)setMediaLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_mediaLocation = a3;
}

- (void)setHasMediaLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMediaLocation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsVideoInFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isVideoInFeed = a3;
}

- (void)setHasIsVideoInFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsVideoInFeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCountOfImagesExposed:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_countOfImagesExposed = a3;
}

- (void)setHasCountOfImagesExposed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCountOfImagesExposed
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setCountOfImagesInGallery:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_countOfImagesInGallery = a3;
}

- (void)setHasCountOfImagesInGallery:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCountOfImagesInGallery
{
  return *(_BYTE *)&self->_has >> 7;
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

- (int)videoType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_videoType;
  else
    return 0;
}

- (void)setVideoType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_videoType = a3;
}

- (void)setHasVideoType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasVideoType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)videoTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4DDF0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVideoType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_VIDEO_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANF_VIDEO_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL_EMBED_VIDEO_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsNativeAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasGalleryId
{
  return self->_galleryId != 0;
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
  v8.super_class = (Class)NTPBMediaExposure;
  -[NTPBMediaExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBMediaExposure dictionaryRepresentation](self, "dictionaryRepresentation");
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
  $AFEC46119D70AFB1E844D7CA844A7A4B has;
  uint64_t galleryType;
  __CFString *v14;
  uint64_t feedType;
  __CFString *v16;
  NSString *feedId;
  uint64_t feedCellSection;
  __CFString *v19;
  NSData *feedViewExposureId;
  $AFEC46119D70AFB1E844D7CA844A7A4B v21;
  void *v22;
  uint64_t articleType;
  __CFString *v24;
  NSMutableArray *namedEntities;
  $AFEC46119D70AFB1E844D7CA844A7A4B v26;
  void *v27;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  $AFEC46119D70AFB1E844D7CA844A7A4B v32;
  void *v33;
  NSString *metadata;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  $AFEC46119D70AFB1E844D7CA844A7A4B v46;
  void *v47;
  NSString *galleryId;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  NSString *iadNativeCampaignAd;
  NTPBIssueData *issueData;
  void *v54;
  NTPBIssueExposureData *issueExposureData;
  void *v56;
  NTPBIssueViewData *issueViewData;
  void *v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t videoType;
  __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    mediaType = self->_mediaType;
    if (mediaType >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediaType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD4DC30[mediaType];
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
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    galleryType = self->_galleryType;
    if (galleryType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_galleryType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_24CD4DC68[galleryType];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("gallery_type"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_24CD4DC80[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("feed_type"));

  }
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    feedCellSection = self->_feedCellSection;
    if (feedCellSection >= 0x12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellSection);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_24CD4DD30[feedCellSection];
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("feed_cell_section"));

  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("is_user_subscribed_to_feed"));

    v21 = self->_has;
  }
  if ((*(_BYTE *)&v21 & 0x10) != 0)
  {
    articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_24CD4DDC0[articleType];
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("article_type"));

  }
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v3, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("publisher_article_version"));

    v26 = self->_has;
    if ((*(_BYTE *)&v26 & 0x20) == 0)
    {
LABEL_48:
      if ((*(_WORD *)&v26 & 0x8000) == 0)
        goto LABEL_50;
      goto LABEL_49;
    }
  }
  else if ((*(_BYTE *)&v26 & 0x20) == 0)
  {
    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("backend_article_version"));

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_49:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("ad_supported_channel"));

  }
LABEL_50:
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
  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDigitalReplicaAd);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("is_digital_replica_ad"));

    v32 = self->_has;
    if ((*(_WORD *)&v32 & 0x800) == 0)
    {
LABEL_60:
      if ((*(_DWORD *)&v32 & 0x80000) == 0)
        goto LABEL_61;
      goto LABEL_110;
    }
  }
  else if ((*(_WORD *)&v32 & 0x800) == 0)
  {
    goto LABEL_60;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mediaLocation);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v64, CFSTR("media_location"));

  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x80000) == 0)
  {
LABEL_61:
    if ((*(_BYTE *)&v32 & 2) == 0)
      goto LABEL_62;
    goto LABEL_111;
  }
LABEL_110:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVideoInFeed);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("is_video_in_feed"));

  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 2) == 0)
  {
LABEL_62:
    if ((*(_BYTE *)&v32 & 0x40) == 0)
      goto LABEL_63;
    goto LABEL_112;
  }
LABEL_111:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("personalization_treatment_id"));

  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 0x40) == 0)
  {
LABEL_63:
    if ((*(_BYTE *)&v32 & 0x80) == 0)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_112:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_countOfImagesExposed);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("count_of_images_exposed"));

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_64:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_countOfImagesInGallery);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("count_of_images_in_gallery"));

  }
LABEL_65:
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
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("widget_engagement"));

  }
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v40 = self->_fractionalCohortMemberships;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v74 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45);

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      }
      while (v42);
    }

    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("fractional_cohort_membership"));
  }
  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x4000) != 0)
  {
    videoType = self->_videoType;
    if (videoType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_videoType);
      v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v69 = off_24CD4DDF0[videoType];
    }
    objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("video_type"));

    v46 = self->_has;
    if ((*(_DWORD *)&v46 & 0x20000) == 0)
    {
LABEL_84:
      if ((*(_BYTE *)&v46 & 8) == 0)
        goto LABEL_85;
      goto LABEL_119;
    }
  }
  else if ((*(_DWORD *)&v46 & 0x20000) == 0)
  {
    goto LABEL_84;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNativeAd);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("is_native_ad"));

  v46 = self->_has;
  if ((*(_BYTE *)&v46 & 8) == 0)
  {
LABEL_85:
    if ((*(_BYTE *)&v46 & 1) == 0)
      goto LABEL_86;
    goto LABEL_120;
  }
LABEL_119:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("publisher_article_version_int64"));

  v46 = self->_has;
  if ((*(_BYTE *)&v46 & 1) == 0)
  {
LABEL_86:
    if ((*(_BYTE *)&v46 & 4) == 0)
      goto LABEL_88;
    goto LABEL_87;
  }
LABEL_120:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("backend_article_version_int64"));

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_87:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("previous_article_publisher_article_version"));

  }
LABEL_88:
  galleryId = self->_galleryId;
  if (galleryId)
    objc_msgSend(v3, "setObject:forKey:", galleryId, CFSTR("gallery_id"));
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
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("issue_exposure_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("issue_view_data"));

  }
  v59 = v3;

  return v59;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMediaExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $AFEC46119D70AFB1E844D7CA844A7A4B has;
  $AFEC46119D70AFB1E844D7CA844A7A4B v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $AFEC46119D70AFB1E844D7CA844A7A4B v12;
  $AFEC46119D70AFB1E844D7CA844A7A4B v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $AFEC46119D70AFB1E844D7CA844A7A4B v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
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
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = self->_has;
  }
  if ((*(_BYTE *)&v6 & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_namedEntities;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = self->_has;
    if ((*(_BYTE *)&v12 & 0x20) == 0)
    {
LABEL_38:
      if ((*(_WORD *)&v12 & 0x8000) == 0)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  else if ((*(_BYTE *)&v12 & 0x20) == 0)
  {
    goto LABEL_38;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_39:
    PBDataWriterWriteBOOLField();
LABEL_40:
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x800) == 0)
    {
LABEL_50:
      if ((*(_DWORD *)&v13 & 0x80000) == 0)
        goto LABEL_51;
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v13 & 0x800) == 0)
  {
    goto LABEL_50;
  }
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_51:
    if ((*(_BYTE *)&v13 & 2) == 0)
      goto LABEL_52;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteBOOLField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 2) == 0)
  {
LABEL_52:
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_53;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt64Field();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
  {
LABEL_53:
    if ((*(_BYTE *)&v13 & 0x80) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
LABEL_54:
    PBDataWriterWriteInt32Field();
LABEL_55:
  if (self->_metadata)
    PBDataWriterWriteStringField();
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  if (self->_widgetEngagement)
    PBDataWriterWriteSubmessage();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = self->_fractionalCohortMemberships;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v19 = self->_has;
    if ((*(_DWORD *)&v19 & 0x20000) == 0)
    {
LABEL_72:
      if ((*(_BYTE *)&v19 & 8) == 0)
        goto LABEL_73;
      goto LABEL_104;
    }
  }
  else if ((*(_DWORD *)&v19 & 0x20000) == 0)
  {
    goto LABEL_72;
  }
  PBDataWriterWriteBOOLField();
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 8) == 0)
  {
LABEL_73:
    if ((*(_BYTE *)&v19 & 1) == 0)
      goto LABEL_74;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteInt64Field();
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 1) == 0)
  {
LABEL_74:
    if ((*(_BYTE *)&v19 & 4) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_105:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 4) != 0)
LABEL_75:
    PBDataWriterWriteInt64Field();
LABEL_76:
  if (self->_galleryId)
    PBDataWriterWriteStringField();
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
  $AFEC46119D70AFB1E844D7CA844A7A4B has;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  $AFEC46119D70AFB1E844D7CA844A7A4B v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  $AFEC46119D70AFB1E844D7CA844A7A4B v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  $AFEC46119D70AFB1E844D7CA844A7A4B v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  NSMutableArray *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  $AFEC46119D70AFB1E844D7CA844A7A4B v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 204) = self->_mediaType;
    *(_DWORD *)(v5 + 320) |= 0x1000u;
  }
  v7 = -[NSString copyWithZone:](self->_mediaId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v7;

  v9 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v11;

  v13 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v13;

  v15 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v15;

  v17 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v17;

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 128) = self->_galleryType;
    *(_DWORD *)(v6 + 320) |= 0x400u;
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_feedType;
    *(_DWORD *)(v6 + 320) |= 0x200u;
  }
  v20 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v20;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_DWORD *)(v6 + 84) = self->_feedCellSection;
    *(_DWORD *)(v6 + 320) |= 0x100u;
  }
  v22 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v22;

  v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    *(_BYTE *)(v6 + 315) = self->_isUserSubscribedToFeed;
    *(_DWORD *)(v6 + 320) |= 0x40000u;
    v24 = self->_has;
  }
  if ((*(_BYTE *)&v24 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_articleType;
    *(_DWORD *)(v6 + 320) |= 0x10u;
  }
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v25 = self->_namedEntities;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v78;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v78 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v29), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNamedEntities:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    }
    while (v27);
  }

  v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x2000) != 0)
  {
    *(_DWORD *)(v6 + 240) = self->_publisherArticleVersion;
    *(_DWORD *)(v6 + 320) |= 0x2000u;
    v31 = self->_has;
    if ((*(_BYTE *)&v31 & 0x20) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v31 & 0x8000) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&v31 & 0x20) == 0)
  {
    goto LABEL_22;
  }
  *(_DWORD *)(v6 + 72) = self->_backendArticleVersion;
  *(_DWORD *)(v6 + 320) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_23:
    *(_BYTE *)(v6 + 312) = self->_adSupportedChannel;
    *(_DWORD *)(v6 + 320) |= 0x8000u;
  }
LABEL_24:
  v32 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 272);
  *(_QWORD *)(v6 + 272) = v32;

  v34 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v34;

  v36 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v36;

  v38 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v39 = *(void **)(v6 + 256);
  *(_QWORD *)(v6 + 256) = v38;

  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x10000) != 0)
  {
    *(_BYTE *)(v6 + 313) = self->_isDigitalReplicaAd;
    *(_DWORD *)(v6 + 320) |= 0x10000u;
    v40 = self->_has;
    if ((*(_WORD *)&v40 & 0x800) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v40 & 0x80000) == 0)
        goto LABEL_27;
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&v40 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  *(_DWORD *)(v6 + 200) = self->_mediaLocation;
  *(_DWORD *)(v6 + 320) |= 0x800u;
  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x80000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v40 & 2) == 0)
      goto LABEL_28;
    goto LABEL_51;
  }
LABEL_50:
  *(_BYTE *)(v6 + 316) = self->_isVideoInFeed;
  *(_DWORD *)(v6 + 320) |= 0x80000u;
  v40 = self->_has;
  if ((*(_BYTE *)&v40 & 2) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v40 & 0x40) == 0)
      goto LABEL_29;
    goto LABEL_52;
  }
LABEL_51:
  *(_QWORD *)(v6 + 16) = self->_personalizationTreatmentId;
  *(_DWORD *)(v6 + 320) |= 2u;
  v40 = self->_has;
  if ((*(_BYTE *)&v40 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_BYTE *)&v40 & 0x80) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_52:
  *(_DWORD *)(v6 + 76) = self->_countOfImagesExposed;
  *(_DWORD *)(v6 + 320) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_30:
    *(_DWORD *)(v6 + 80) = self->_countOfImagesInGallery;
    *(_DWORD *)(v6 + 320) |= 0x80u;
  }
LABEL_31:
  v41 = -[NSString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v42 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v41;

  v43 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v44 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v43;

  v45 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v46 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v45;

  v47 = -[NTPBWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v48 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v47;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v49 = self->_fractionalCohortMemberships;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v74;
    do
    {
      v53 = 0;
      do
      {
        if (*(_QWORD *)v74 != v52)
          objc_enumerationMutation(v49);
        v54 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v53), "copyWithZone:", a3, (_QWORD)v73);
        objc_msgSend((id)v6, "addFractionalCohortMembership:", v54);

        ++v53;
      }
      while (v51 != v53);
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v51);
  }

  v55 = self->_has;
  if ((*(_WORD *)&v55 & 0x4000) != 0)
  {
    *(_DWORD *)(v6 + 296) = self->_videoType;
    *(_DWORD *)(v6 + 320) |= 0x4000u;
    v55 = self->_has;
    if ((*(_DWORD *)&v55 & 0x20000) == 0)
    {
LABEL_40:
      if ((*(_BYTE *)&v55 & 8) == 0)
        goto LABEL_41;
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&v55 & 0x20000) == 0)
  {
    goto LABEL_40;
  }
  *(_BYTE *)(v6 + 314) = self->_isNativeAd;
  *(_DWORD *)(v6 + 320) |= 0x20000u;
  v55 = self->_has;
  if ((*(_BYTE *)&v55 & 8) == 0)
  {
LABEL_41:
    if ((*(_BYTE *)&v55 & 1) == 0)
      goto LABEL_42;
LABEL_57:
    *(_QWORD *)(v6 + 8) = self->_backendArticleVersionInt64;
    *(_DWORD *)(v6 + 320) |= 1u;
    if ((*(_DWORD *)&self->_has & 4) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_56:
  *(_QWORD *)(v6 + 32) = self->_publisherArticleVersionInt64;
  *(_DWORD *)(v6 + 320) |= 8u;
  v55 = self->_has;
  if ((*(_BYTE *)&v55 & 1) != 0)
    goto LABEL_57;
LABEL_42:
  if ((*(_BYTE *)&v55 & 4) != 0)
  {
LABEL_43:
    *(_QWORD *)(v6 + 24) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v6 + 320) |= 4u;
  }
LABEL_44:
  v56 = -[NSString copyWithZone:](self->_galleryId, "copyWithZone:", a3, (_QWORD)v73);
  v57 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v56;

  v58 = -[NSString copyWithZone:](self->_iadNativeCampaign, "copyWithZone:", a3);
  v59 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v58;

  v60 = -[NSString copyWithZone:](self->_iadNativeLine, "copyWithZone:", a3);
  v61 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v60;

  v62 = -[NSString copyWithZone:](self->_iadNativeAd, "copyWithZone:", a3);
  v63 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v62;

  v64 = -[NSString copyWithZone:](self->_iadNativeCampaignAd, "copyWithZone:", a3);
  v65 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v64;

  v66 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v67 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v66;

  v68 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v69 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v68;

  v70 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v71 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v70;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  NSString *mediaId;
  NSString *articleId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  $AFEC46119D70AFB1E844D7CA844A7A4B has;
  int v13;
  NSString *feedId;
  int v15;
  NSData *feedViewExposureId;
  int v17;
  NSMutableArray *namedEntities;
  int v19;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  $AFEC46119D70AFB1E844D7CA844A7A4B v24;
  int v25;
  NSString *metadata;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  NSMutableArray *fractionalCohortMemberships;
  $AFEC46119D70AFB1E844D7CA844A7A4B v31;
  int v32;
  NSString *galleryId;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  NSString *iadNativeCampaignAd;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBIssueViewData *issueViewData;
  char v41;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_172;
  v5 = *((_DWORD *)v4 + 80);
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    if ((v5 & 0x1000) == 0 || self->_mediaType != *((_DWORD *)v4 + 51))
      goto LABEL_172;
  }
  else if ((v5 & 0x1000) != 0)
  {
    goto LABEL_172;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((_QWORD *)v4 + 24) && !-[NSString isEqual:](mediaId, "isEqual:"))
    goto LABEL_172;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_172;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_172;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:"))
      goto LABEL_172;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_172;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_172;
  }
  has = self->_has;
  v13 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_galleryType != *((_DWORD *)v4 + 32))
      goto LABEL_172;
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_feedType != *((_DWORD *)v4 + 24))
      goto LABEL_172;
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_172;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_172;
    has = self->_has;
  }
  v15 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 21))
      goto LABEL_172;
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_172;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_172;
    has = self->_has;
  }
  v17 = *((_DWORD *)v4 + 80);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v17 & 0x40000) == 0)
      goto LABEL_172;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 315))
        goto LABEL_172;
    }
    else if (*((_BYTE *)v4 + 315))
    {
      goto LABEL_172;
    }
  }
  else if ((v17 & 0x40000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_articleType != *((_DWORD *)v4 + 14))
      goto LABEL_172;
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_172;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_172;
    has = self->_has;
  }
  v19 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 60))
      goto LABEL_172;
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 18))
      goto LABEL_172;
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v19 & 0x8000) == 0)
      goto LABEL_172;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 312))
        goto LABEL_172;
    }
    else if (*((_BYTE *)v4 + 312))
    {
      goto LABEL_172;
    }
  }
  else if ((v19 & 0x8000) != 0)
  {
    goto LABEL_172;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 34)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_172;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_172;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_172;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_172;
  }
  v24 = self->_has;
  v25 = *((_DWORD *)v4 + 80);
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    if ((v25 & 0x10000) == 0)
      goto LABEL_172;
    if (self->_isDigitalReplicaAd)
    {
      if (!*((_BYTE *)v4 + 313))
        goto LABEL_172;
    }
    else if (*((_BYTE *)v4 + 313))
    {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x10000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&v24 & 0x800) != 0)
  {
    if ((v25 & 0x800) == 0 || self->_mediaLocation != *((_DWORD *)v4 + 50))
      goto LABEL_172;
  }
  else if ((v25 & 0x800) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_DWORD *)&v24 & 0x80000) != 0)
  {
    if ((v25 & 0x80000) == 0)
      goto LABEL_172;
    if (self->_isVideoInFeed)
    {
      if (!*((_BYTE *)v4 + 316))
        goto LABEL_172;
    }
    else if (*((_BYTE *)v4 + 316))
    {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x80000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_BYTE *)&v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 2))
      goto LABEL_172;
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_BYTE *)&v24 & 0x40) != 0)
  {
    if ((v25 & 0x40) == 0 || self->_countOfImagesExposed != *((_DWORD *)v4 + 19))
      goto LABEL_172;
  }
  else if ((v25 & 0x40) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_BYTE *)&v24 & 0x80) != 0)
  {
    if ((v25 & 0x80) == 0 || self->_countOfImagesInGallery != *((_DWORD *)v4 + 20))
      goto LABEL_172;
  }
  else if ((v25 & 0x80) != 0)
  {
    goto LABEL_172;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 26) && !-[NSString isEqual:](metadata, "isEqual:"))
    goto LABEL_172;
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_172;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_172;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((_QWORD *)v4 + 38))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
      goto LABEL_172;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
      goto LABEL_172;
  }
  v31 = self->_has;
  v32 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&v31 & 0x4000) != 0)
  {
    if ((v32 & 0x4000) == 0 || self->_videoType != *((_DWORD *)v4 + 74))
      goto LABEL_172;
  }
  else if ((v32 & 0x4000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_DWORD *)&v31 & 0x20000) != 0)
  {
    if ((v32 & 0x20000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((_BYTE *)v4 + 314))
          goto LABEL_172;
        goto LABEL_141;
      }
      if (!*((_BYTE *)v4 + 314))
        goto LABEL_141;
    }
LABEL_172:
    v41 = 0;
    goto LABEL_173;
  }
  if ((v32 & 0x20000) != 0)
    goto LABEL_172;
LABEL_141:
  if ((*(_BYTE *)&v31 & 8) != 0)
  {
    if ((v32 & 8) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 4))
      goto LABEL_172;
  }
  else if ((v32 & 8) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_BYTE *)&v31 & 1) != 0)
  {
    if ((v32 & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_172;
  }
  else if ((v32 & 1) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_BYTE *)&v31 & 4) != 0)
  {
    if ((v32 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 3))
      goto LABEL_172;
  }
  else if ((v32 & 4) != 0)
  {
    goto LABEL_172;
  }
  galleryId = self->_galleryId;
  if ((unint64_t)galleryId | *((_QWORD *)v4 + 15) && !-[NSString isEqual:](galleryId, "isEqual:"))
    goto LABEL_172;
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
      goto LABEL_172;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:"))
      goto LABEL_172;
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:"))
      goto LABEL_172;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
      goto LABEL_172;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 21))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:"))
      goto LABEL_172;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 22))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_172;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 23))
    v41 = -[NTPBIssueViewData isEqual:](issueViewData, "isEqual:");
  else
    v41 = 1;
LABEL_173:

  return v41;
}

- (unint64_t)hash
{
  $AFEC46119D70AFB1E844D7CA844A7A4B has;
  $AFEC46119D70AFB1E844D7CA844A7A4B v4;
  $AFEC46119D70AFB1E844D7CA844A7A4B v5;
  $AFEC46119D70AFB1E844D7CA844A7A4B v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v14;
  $AFEC46119D70AFB1E844D7CA844A7A4B v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  NSUInteger v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSUInteger v46;
  uint64_t v47;
  uint64_t v48;
  NSUInteger v49;
  uint64_t v50;
  uint64_t v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  uint64_t v55;

  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    v55 = 2654435761 * self->_mediaType;
  else
    v55 = 0;
  v54 = -[NSString hash](self->_mediaId, "hash");
  v53 = -[NSString hash](self->_articleId, "hash");
  v52 = -[NSString hash](self->_referencedArticleId, "hash");
  v51 = -[NSData hash](self->_articleSessionId, "hash");
  v50 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v49 = -[NSString hash](self->_sourceChannelId, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v48 = 2654435761 * self->_galleryType;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_6;
  }
  else
  {
    v48 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
LABEL_6:
      v47 = 2654435761 * self->_feedType;
      goto LABEL_9;
    }
  }
  v47 = 0;
LABEL_9:
  v46 = -[NSString hash](self->_feedId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v45 = 2654435761 * self->_feedCellSection;
  else
    v45 = 0;
  v44 = -[NSData hash](self->_feedViewExposureId, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
    v43 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_14;
  }
  else
  {
    v43 = 0;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
    {
LABEL_14:
      v42 = 2654435761 * self->_articleType;
      goto LABEL_17;
    }
  }
  v42 = 0;
LABEL_17:
  v41 = -[NSMutableArray hash](self->_namedEntities, "hash");
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
    v40 = 0;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
      goto LABEL_19;
LABEL_22:
    v39 = 0;
    if ((*(_WORD *)&v5 & 0x8000) != 0)
      goto LABEL_20;
    goto LABEL_23;
  }
  v40 = 2654435761 * self->_publisherArticleVersion;
  if ((*(_BYTE *)&v5 & 0x20) == 0)
    goto LABEL_22;
LABEL_19:
  v39 = 2654435761 * self->_backendArticleVersion;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
LABEL_20:
    v38 = 2654435761 * self->_adSupportedChannel;
    goto LABEL_24;
  }
LABEL_23:
  v38 = 0;
LABEL_24:
  v37 = -[NSString hash](self->_surfacedByChannelId, "hash");
  v36 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v35 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v34 = -[NSString hash](self->_sectionHeadlineId, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
    v33 = 2654435761 * self->_isDigitalReplicaAd;
    if ((*(_WORD *)&v6 & 0x800) != 0)
    {
LABEL_26:
      v32 = 2654435761 * self->_mediaLocation;
      if ((*(_DWORD *)&v6 & 0x80000) != 0)
        goto LABEL_27;
      goto LABEL_33;
    }
  }
  else
  {
    v33 = 0;
    if ((*(_WORD *)&v6 & 0x800) != 0)
      goto LABEL_26;
  }
  v32 = 0;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
LABEL_27:
    v30 = 2654435761 * self->_isVideoInFeed;
    if ((*(_BYTE *)&v6 & 2) != 0)
      goto LABEL_28;
    goto LABEL_34;
  }
LABEL_33:
  v30 = 0;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
LABEL_28:
    v7 = 2654435761 * self->_personalizationTreatmentId;
    if ((*(_BYTE *)&v6 & 0x40) != 0)
      goto LABEL_29;
LABEL_35:
    v8 = 0;
    if ((*(_BYTE *)&v6 & 0x80) != 0)
      goto LABEL_30;
    goto LABEL_36;
  }
LABEL_34:
  v7 = 0;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
    goto LABEL_35;
LABEL_29:
  v8 = 2654435761 * self->_countOfImagesExposed;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
LABEL_30:
    v9 = 2654435761 * self->_countOfImagesInGallery;
    goto LABEL_37;
  }
LABEL_36:
  v9 = 0;
LABEL_37:
  v10 = -[NSString hash](self->_metadata, "hash", v30);
  v11 = -[NSString hash](self->_previousArticleId, "hash");
  v12 = -[NSString hash](self->_previousArticleVersion, "hash");
  v13 = -[NTPBWidgetEngagement hash](self->_widgetEngagement, "hash");
  v14 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x4000) != 0)
  {
    v16 = 2654435761 * self->_videoType;
    if ((*(_DWORD *)&v15 & 0x20000) != 0)
    {
LABEL_39:
      v17 = 2654435761 * self->_isNativeAd;
      if ((*(_BYTE *)&v15 & 8) != 0)
        goto LABEL_40;
      goto LABEL_45;
    }
  }
  else
  {
    v16 = 0;
    if ((*(_DWORD *)&v15 & 0x20000) != 0)
      goto LABEL_39;
  }
  v17 = 0;
  if ((*(_BYTE *)&v15 & 8) != 0)
  {
LABEL_40:
    v18 = 2654435761 * self->_publisherArticleVersionInt64;
    if ((*(_BYTE *)&v15 & 1) != 0)
      goto LABEL_41;
LABEL_46:
    v19 = 0;
    if ((*(_BYTE *)&v15 & 4) != 0)
      goto LABEL_42;
LABEL_47:
    v20 = 0;
    goto LABEL_48;
  }
LABEL_45:
  v18 = 0;
  if ((*(_BYTE *)&v15 & 1) == 0)
    goto LABEL_46;
LABEL_41:
  v19 = 2654435761 * self->_backendArticleVersionInt64;
  if ((*(_BYTE *)&v15 & 4) == 0)
    goto LABEL_47;
LABEL_42:
  v20 = 2654435761 * self->_previousArticlePublisherArticleVersion;
LABEL_48:
  v21 = v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16;
  v22 = v17 ^ v18 ^ v19 ^ v20 ^ -[NSString hash](self->_galleryId, "hash");
  v23 = v22 ^ -[NSString hash](self->_iadNativeCampaign, "hash");
  v24 = v23 ^ -[NSString hash](self->_iadNativeLine, "hash");
  v25 = v24 ^ -[NSString hash](self->_iadNativeAd, "hash");
  v26 = v25 ^ -[NSString hash](self->_iadNativeCampaignAd, "hash");
  v27 = v26 ^ -[NTPBIssueData hash](self->_issueData, "hash");
  v28 = v21 ^ v27 ^ -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  return v28 ^ -[NTPBIssueViewData hash](self->_issueViewData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  int v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  int v14;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  int v22;
  NTPBIssueData *issueData;
  uint64_t v24;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v26;
  NTPBIssueViewData *issueViewData;
  uint64_t v28;
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
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 321) & 0x10) != 0)
  {
    self->_mediaType = v4[51];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((_QWORD *)v4 + 24))
    -[NTPBMediaExposure setMediaId:](self, "setMediaId:");
  if (*((_QWORD *)v5 + 5))
    -[NTPBMediaExposure setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 31))
    -[NTPBMediaExposure setReferencedArticleId:](self, "setReferencedArticleId:");
  if (*((_QWORD *)v5 + 6))
    -[NTPBMediaExposure setArticleSessionId:](self, "setArticleSessionId:");
  if (*((_QWORD *)v5 + 8))
    -[NTPBMediaExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  if (*((_QWORD *)v5 + 33))
    -[NTPBMediaExposure setSourceChannelId:](self, "setSourceChannelId:");
  v6 = *((_DWORD *)v5 + 80);
  if ((v6 & 0x400) != 0)
  {
    self->_galleryType = *((_DWORD *)v5 + 32);
    *(_DWORD *)&self->_has |= 0x400u;
    v6 = *((_DWORD *)v5 + 80);
  }
  if ((v6 & 0x200) != 0)
  {
    self->_feedType = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)v5 + 11))
    -[NTPBMediaExposure setFeedId:](self, "setFeedId:");
  if ((*((_BYTE *)v5 + 321) & 1) != 0)
  {
    self->_feedCellSection = *((_DWORD *)v5 + 21);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v5 + 13))
    -[NTPBMediaExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
  v7 = *((_DWORD *)v5 + 80);
  if ((v7 & 0x40000) != 0)
  {
    self->_isUserSubscribedToFeed = *((_BYTE *)v5 + 315);
    *(_DWORD *)&self->_has |= 0x40000u;
    v7 = *((_DWORD *)v5 + 80);
  }
  if ((v7 & 0x10) != 0)
  {
    self->_articleType = *((_DWORD *)v5 + 14);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = *((id *)v5 + 27);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        -[NTPBMediaExposure addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  v13 = *((_DWORD *)v5 + 80);
  if ((v13 & 0x2000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 60);
    *(_DWORD *)&self->_has |= 0x2000u;
    v13 = *((_DWORD *)v5 + 80);
    if ((v13 & 0x20) == 0)
    {
LABEL_38:
      if ((v13 & 0x8000) == 0)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  else if ((v13 & 0x20) == 0)
  {
    goto LABEL_38;
  }
  self->_backendArticleVersion = *((_DWORD *)v5 + 18);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v5 + 80) & 0x8000) != 0)
  {
LABEL_39:
    self->_adSupportedChannel = *((_BYTE *)v5 + 312);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_40:
  if (*((_QWORD *)v5 + 34))
    -[NTPBMediaExposure setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v5 + 35))
    -[NTPBMediaExposure setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v5 + 36))
    -[NTPBMediaExposure setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 32))
    -[NTPBMediaExposure setSectionHeadlineId:](self, "setSectionHeadlineId:");
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x10000) != 0)
  {
    self->_isDigitalReplicaAd = *((_BYTE *)v5 + 313);
    *(_DWORD *)&self->_has |= 0x10000u;
    v14 = *((_DWORD *)v5 + 80);
    if ((v14 & 0x800) == 0)
    {
LABEL_50:
      if ((v14 & 0x80000) == 0)
        goto LABEL_51;
      goto LABEL_69;
    }
  }
  else if ((v14 & 0x800) == 0)
  {
    goto LABEL_50;
  }
  self->_mediaLocation = *((_DWORD *)v5 + 50);
  *(_DWORD *)&self->_has |= 0x800u;
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x80000) == 0)
  {
LABEL_51:
    if ((v14 & 2) == 0)
      goto LABEL_52;
    goto LABEL_70;
  }
LABEL_69:
  self->_isVideoInFeed = *((_BYTE *)v5 + 316);
  *(_DWORD *)&self->_has |= 0x80000u;
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 2) == 0)
  {
LABEL_52:
    if ((v14 & 0x40) == 0)
      goto LABEL_53;
    goto LABEL_71;
  }
LABEL_70:
  self->_personalizationTreatmentId = *((_QWORD *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x40) == 0)
  {
LABEL_53:
    if ((v14 & 0x80) == 0)
      goto LABEL_55;
    goto LABEL_54;
  }
LABEL_71:
  self->_countOfImagesExposed = *((_DWORD *)v5 + 19);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v5 + 80) & 0x80) != 0)
  {
LABEL_54:
    self->_countOfImagesInGallery = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_55:
  if (*((_QWORD *)v5 + 26))
    -[NTPBMediaExposure setMetadata:](self, "setMetadata:");
  if (*((_QWORD *)v5 + 28))
    -[NTPBMediaExposure setPreviousArticleId:](self, "setPreviousArticleId:");
  if (*((_QWORD *)v5 + 29))
    -[NTPBMediaExposure setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  widgetEngagement = self->_widgetEngagement;
  v16 = *((_QWORD *)v5 + 38);
  if (widgetEngagement)
  {
    if (v16)
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v16)
  {
    -[NTPBMediaExposure setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = *((id *)v5 + 14);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        -[NTPBMediaExposure addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), (_QWORD)v29);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v19);
  }

  v22 = *((_DWORD *)v5 + 80);
  if ((v22 & 0x4000) != 0)
  {
    self->_videoType = *((_DWORD *)v5 + 74);
    *(_DWORD *)&self->_has |= 0x4000u;
    v22 = *((_DWORD *)v5 + 80);
    if ((v22 & 0x20000) == 0)
    {
LABEL_84:
      if ((v22 & 8) == 0)
        goto LABEL_85;
      goto LABEL_103;
    }
  }
  else if ((v22 & 0x20000) == 0)
  {
    goto LABEL_84;
  }
  self->_isNativeAd = *((_BYTE *)v5 + 314);
  *(_DWORD *)&self->_has |= 0x20000u;
  v22 = *((_DWORD *)v5 + 80);
  if ((v22 & 8) == 0)
  {
LABEL_85:
    if ((v22 & 1) == 0)
      goto LABEL_86;
    goto LABEL_104;
  }
LABEL_103:
  self->_publisherArticleVersionInt64 = *((_QWORD *)v5 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v22 = *((_DWORD *)v5 + 80);
  if ((v22 & 1) == 0)
  {
LABEL_86:
    if ((v22 & 4) == 0)
      goto LABEL_88;
    goto LABEL_87;
  }
LABEL_104:
  self->_backendArticleVersionInt64 = *((_QWORD *)v5 + 1);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)v5 + 80) & 4) != 0)
  {
LABEL_87:
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v5 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_88:
  if (*((_QWORD *)v5 + 15))
    -[NTPBMediaExposure setGalleryId:](self, "setGalleryId:");
  if (*((_QWORD *)v5 + 18))
    -[NTPBMediaExposure setIadNativeCampaign:](self, "setIadNativeCampaign:");
  if (*((_QWORD *)v5 + 20))
    -[NTPBMediaExposure setIadNativeLine:](self, "setIadNativeLine:");
  if (*((_QWORD *)v5 + 17))
    -[NTPBMediaExposure setIadNativeAd:](self, "setIadNativeAd:");
  if (*((_QWORD *)v5 + 19))
    -[NTPBMediaExposure setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  issueData = self->_issueData;
  v24 = *((_QWORD *)v5 + 21);
  if (issueData)
  {
    if (v24)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v24)
  {
    -[NTPBMediaExposure setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v26 = *((_QWORD *)v5 + 22);
  if (issueExposureData)
  {
    if (v26)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v26)
  {
    -[NTPBMediaExposure setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  v28 = *((_QWORD *)v5 + 23);
  if (issueViewData)
  {
    if (v28)
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else if (v28)
  {
    -[NTPBMediaExposure setIssueViewData:](self, "setIssueViewData:");
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

- (BOOL)isVideoInFeed
{
  return self->_isVideoInFeed;
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (int)countOfImagesExposed
{
  return self->_countOfImagesExposed;
}

- (int)countOfImagesInGallery
{
  return self->_countOfImagesInGallery;
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
  objc_storeStrong((id *)&self->_galleryId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
