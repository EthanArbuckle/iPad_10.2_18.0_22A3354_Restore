@implementation NTPBMediaEngageComplete

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
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_24CD4DE08[a3];
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
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFeedType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4DE40[a3];
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
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFeedCellSection
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 < 0x12)
    return off_24CD4DEF0[a3];
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
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (int)articleType
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasArticleType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD4DF80[a3];
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
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return *((_BYTE *)&self->_has + 2) & 1;
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
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)mediaPlayLocation
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_mediaPlayLocation;
  else
    return 0;
}

- (void)setMediaPlayLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_mediaPlayLocation = a3;
}

- (void)setHasMediaPlayLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMediaPlayLocation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsVideoInFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isVideoInFeed = a3;
}

- (void)setHasIsVideoInFeed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsVideoInFeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setMediaDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_mediaDuration = a3;
}

- (void)setHasMediaDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasMediaDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMediaTimePlayed:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_mediaTimePlayed = a3;
}

- (void)setHasMediaTimePlayed:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMediaTimePlayed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsNativeAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasNativeCampaignData
{
  return self->_nativeCampaignData != 0;
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

- (int)groupType
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasGroupType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD4DFB0[a3];
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

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (void)setIsBreakingNewsArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isBreakingNewsArticle = a3;
}

- (void)setHasIsBreakingNewsArticle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
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
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_videoType;
  else
    return 0;
}

- (void)setVideoType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_videoType = a3;
}

- (void)setHasVideoType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasVideoType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)videoTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4E0F0[a3];
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

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_DWORD *)&self->_has & 1;
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

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasIadNativeCampaignAd
{
  return self->_iadNativeCampaignAd != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (BOOL)hasAlternateHeadline
{
  return self->_alternateHeadline != 0;
}

- (void)setRankInVideoPlaylist:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rankInVideoPlaylist = a3;
}

- (void)setHasRankInVideoPlaylist:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRankInVideoPlaylist
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
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

- (void)clearTopicIds
{
  -[NSMutableArray removeAllObjects](self->_topicIds, "removeAllObjects");
}

- (void)addTopicIds:(id)a3
{
  id v4;
  NSMutableArray *topicIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicIds = self->_topicIds;
  v8 = v4;
  if (!topicIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_topicIds;
    self->_topicIds = v6;

    v4 = v8;
    topicIds = self->_topicIds;
  }
  -[NSMutableArray addObject:](topicIds, "addObject:", v4);

}

- (unint64_t)topicIdsCount
{
  return -[NSMutableArray count](self->_topicIds, "count");
}

- (id)topicIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicIds, "objectAtIndex:", a3);
}

+ (Class)topicIdsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)NTPBMediaEngageComplete;
  -[NTPBMediaEngageComplete description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBMediaEngageComplete dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t feedType;
  __CFString *v13;
  NSString *feedId;
  uint64_t feedCellSection;
  __CFString *v16;
  NSData *feedViewExposureId;
  $D13936C5278104CB1C8259D497E97548 has;
  void *v19;
  uint64_t articleType;
  __CFString *v21;
  NSMutableArray *namedEntities;
  $D13936C5278104CB1C8259D497E97548 v23;
  void *v24;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  $D13936C5278104CB1C8259D497E97548 v29;
  void *v30;
  NSString *nativeCampaignData;
  NSString *metadata;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  void *v36;
  uint64_t groupType;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSString *groupFeedId;
  void *v48;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  $D13936C5278104CB1C8259D497E97548 v56;
  void *v57;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  void *v61;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBAlternateHeadline *alternateHeadline;
  void *v65;
  void *v66;
  NTPBIssueData *issueData;
  void *v68;
  NTPBIssueExposureData *issueExposureData;
  void *v70;
  NTPBIssueViewData *issueViewData;
  void *v72;
  NSMutableArray *topicIds;
  id v74;
  uint64_t videoType;
  __CFString *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
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
      v5 = off_24CD4DE08[mediaType];
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
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_24CD4DE40[feedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("feed_type"));

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
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_24CD4DEF0[feedCellSection];
    }
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("feed_cell_section"));

  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("is_user_subscribed_to_feed"));

    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_24CD4DF80[articleType];
    }
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("article_type"));

  }
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v3, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("publisher_article_version"));

    v23 = self->_has;
    if ((*(_BYTE *)&v23 & 0x80) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v23 & 0x10000) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if ((*(_BYTE *)&v23 & 0x80) == 0)
  {
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("backend_article_version"));

  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_44:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("ad_supported_channel"));

  }
LABEL_45:
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
  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDigitalReplicaAd);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("is_digital_replica_ad"));

    v29 = self->_has;
    if ((*(_BYTE *)&v29 & 8) == 0)
    {
LABEL_55:
      if ((*(_WORD *)&v29 & 0x800) == 0)
        goto LABEL_56;
      goto LABEL_79;
    }
  }
  else if ((*(_BYTE *)&v29 & 8) == 0)
  {
    goto LABEL_55;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("personalization_treatment_id"));

  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v29 & 0x200000) == 0)
      goto LABEL_57;
    goto LABEL_80;
  }
LABEL_79:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mediaPlayLocation);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v43, CFSTR("media_play_location"));

  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x200000) == 0)
  {
LABEL_57:
    if ((*(_BYTE *)&v29 & 2) == 0)
      goto LABEL_58;
    goto LABEL_81;
  }
LABEL_80:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVideoInFeed);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("is_video_in_feed"));

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 2) == 0)
  {
LABEL_58:
    if ((*(_BYTE *)&v29 & 4) == 0)
      goto LABEL_59;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mediaDuration);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("media_duration"));

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 4) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v29 & 0x80000) == 0)
      goto LABEL_61;
    goto LABEL_60;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mediaTimePlayed);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("media_time_played"));

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_60:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNativeAd);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("is_native_ad"));

  }
LABEL_61:
  nativeCampaignData = self->_nativeCampaignData;
  if (nativeCampaignData)
    objc_msgSend(v3, "setObject:forKey:", nativeCampaignData, CFSTR("native_campaign_data"));
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
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("widget_engagement"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_24CD4DFB0[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("group_type"));

  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v3, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBreakingNewsArticle);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("is_breaking_news_article"));

  }
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v50 = self->_fractionalCohortMemberships;
    v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v80 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "dictionaryRepresentation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v55);

        }
        v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
      }
      while (v52);
    }

    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("fractional_cohort_membership"));
  }
  v56 = self->_has;
  if ((*(_WORD *)&v56 & 0x8000) != 0)
  {
    videoType = self->_videoType;
    if (videoType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_videoType);
      v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v77 = off_24CD4E0F0[videoType];
    }
    objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("video_type"));

    v56 = self->_has;
    if ((*(_BYTE *)&v56 & 0x20) == 0)
    {
LABEL_101:
      if ((*(_BYTE *)&v56 & 1) == 0)
        goto LABEL_103;
      goto LABEL_102;
    }
  }
  else if ((*(_BYTE *)&v56 & 0x20) == 0)
  {
    goto LABEL_101;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("publisher_article_version_int64"));

  if ((*(_DWORD *)&self->_has & 1) != 0)
  {
LABEL_102:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("backend_article_version_int64"));

  }
LABEL_103:
  iadNativeCampaign = self->_iadNativeCampaign;
  if (iadNativeCampaign)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaign, CFSTR("iad_native_campaign"));
  iadNativeLine = self->_iadNativeLine;
  if (iadNativeLine)
    objc_msgSend(v3, "setObject:forKey:", iadNativeLine, CFSTR("iad_native_line"));
  iadNativeAd = self->_iadNativeAd;
  if (iadNativeAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeAd, CFSTR("iad_native_ad"));
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("previous_article_publisher_article_version"));

  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaignAd, CFSTR("iad_native_campaign_ad"));
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  alternateHeadline = self->_alternateHeadline;
  if (alternateHeadline)
  {
    -[NTPBAlternateHeadline dictionaryRepresentation](alternateHeadline, "dictionaryRepresentation");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v65, CFSTR("alternate_headline"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rankInVideoPlaylist);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("rank_in_video_playlist"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v68, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("issue_exposure_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("issue_view_data"));

  }
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v3, "setObject:forKey:", topicIds, CFSTR("topic_ids"));
  v74 = v3;

  return v74;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMediaEngageCompleteReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $D13936C5278104CB1C8259D497E97548 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $D13936C5278104CB1C8259D497E97548 v11;
  $D13936C5278104CB1C8259D497E97548 v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  $D13936C5278104CB1C8259D497E97548 v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
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
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = self->_namedEntities;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v8);
  }

  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x80) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v11 & 0x10000) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x80) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
LABEL_37:
    PBDataWriterWriteBOOLField();
LABEL_38:
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
    if ((*(_BYTE *)&v12 & 8) == 0)
    {
LABEL_48:
      if ((*(_WORD *)&v12 & 0x800) == 0)
        goto LABEL_49;
      goto LABEL_116;
    }
  }
  else if ((*(_BYTE *)&v12 & 8) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteInt64Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v12 & 0x200000) == 0)
      goto LABEL_50;
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x200000) == 0)
  {
LABEL_50:
    if ((*(_BYTE *)&v12 & 2) == 0)
      goto LABEL_51;
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 2) == 0)
  {
LABEL_51:
    if ((*(_BYTE *)&v12 & 4) == 0)
      goto LABEL_52;
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteInt64Field();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 4) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v12 & 0x80000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_119:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
LABEL_53:
    PBDataWriterWriteBOOLField();
LABEL_54:
  if (self->_nativeCampaignData)
    PBDataWriterWriteStringField();
  if (self->_metadata)
    PBDataWriterWriteStringField();
  if (self->_previousArticleId)
    PBDataWriterWriteStringField();
  if (self->_previousArticleVersion)
    PBDataWriterWriteStringField();
  if (self->_widgetEngagement)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    PBDataWriterWriteBOOLField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = self->_fractionalCohortMemberships;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v15);
  }

  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v18 = self->_has;
    if ((*(_BYTE *)&v18 & 0x20) == 0)
    {
LABEL_79:
      if ((*(_BYTE *)&v18 & 1) == 0)
        goto LABEL_81;
      goto LABEL_80;
    }
  }
  else if ((*(_BYTE *)&v18 & 0x20) == 0)
  {
    goto LABEL_79;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 1) != 0)
LABEL_80:
    PBDataWriterWriteInt64Field();
LABEL_81:
  if (self->_iadNativeCampaign)
    PBDataWriterWriteStringField();
  if (self->_iadNativeLine)
    PBDataWriterWriteStringField();
  if (self->_iadNativeAd)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_iadNativeCampaignAd)
    PBDataWriterWriteStringField();
  if (self->_groupViewExposureId)
    PBDataWriterWriteDataField();
  if (self->_alternateHeadline)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueExposureData)
    PBDataWriterWriteSubmessage();
  if (self->_issueViewData)
    PBDataWriterWriteSubmessage();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = self->_topicIds;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteStringField();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v21);
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  $D13936C5278104CB1C8259D497E97548 has;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  $D13936C5278104CB1C8259D497E97548 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  $D13936C5278104CB1C8259D497E97548 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  $D13936C5278104CB1C8259D497E97548 v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  NSMutableArray *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 228) = self->_mediaType;
    *(_DWORD *)(v5 + 360) |= 0x1000u;
  }
  v7 = -[NSString copyWithZone:](self->_mediaId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v7;

  v9 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v9;

  v11 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v11;

  v13 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v13;

  v15 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v15;

  v17 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 296);
  *(_QWORD *)(v6 + 296) = v17;

  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    *(_DWORD *)(v6 + 112) = self->_feedType;
    *(_DWORD *)(v6 + 360) |= 0x200u;
  }
  v19 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v19;

  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_feedCellSection;
    *(_DWORD *)(v6 + 360) |= 0x100u;
  }
  v21 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v21;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *(_BYTE *)(v6 + 356) = self->_isUserSubscribedToFeed;
    *(_DWORD *)(v6 + 360) |= 0x100000u;
    has = self->_has;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_articleType;
    *(_DWORD *)(v6 + 360) |= 0x40u;
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v24 = self->_namedEntities;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v93;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v93 != v27)
          objc_enumerationMutation(v24);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * v28), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNamedEntities:", v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v92, v98, 16);
    }
    while (v26);
  }

  v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x2000) != 0)
  {
    *(_DWORD *)(v6 + 272) = self->_publisherArticleVersion;
    *(_DWORD *)(v6 + 360) |= 0x2000u;
    v30 = self->_has;
    if ((*(_BYTE *)&v30 & 0x80) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&v30 & 0x10000) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&v30 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  *(_DWORD *)(v6 + 96) = self->_backendArticleVersion;
  *(_DWORD *)(v6 + 360) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_21:
    *(_BYTE *)(v6 + 352) = self->_adSupportedChannel;
    *(_DWORD *)(v6 + 360) |= 0x10000u;
  }
LABEL_22:
  v31 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v31;

  v33 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v34 = *(void **)(v6 + 312);
  *(_QWORD *)(v6 + 312) = v33;

  v35 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v36 = *(void **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = v35;

  v37 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v38 = *(void **)(v6 + 288);
  *(_QWORD *)(v6 + 288) = v37;

  v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x40000) != 0)
  {
    *(_BYTE *)(v6 + 354) = self->_isDigitalReplicaAd;
    *(_DWORD *)(v6 + 360) |= 0x40000u;
    v39 = self->_has;
    if ((*(_BYTE *)&v39 & 8) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&v39 & 0x800) == 0)
        goto LABEL_25;
      goto LABEL_62;
    }
  }
  else if ((*(_BYTE *)&v39 & 8) == 0)
  {
    goto LABEL_24;
  }
  *(_QWORD *)(v6 + 32) = self->_personalizationTreatmentId;
  *(_DWORD *)(v6 + 360) |= 8u;
  v39 = self->_has;
  if ((*(_WORD *)&v39 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v39 & 0x200000) == 0)
      goto LABEL_26;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v6 + 224) = self->_mediaPlayLocation;
  *(_DWORD *)(v6 + 360) |= 0x800u;
  v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x200000) == 0)
  {
LABEL_26:
    if ((*(_BYTE *)&v39 & 2) == 0)
      goto LABEL_27;
    goto LABEL_64;
  }
LABEL_63:
  *(_BYTE *)(v6 + 357) = self->_isVideoInFeed;
  *(_DWORD *)(v6 + 360) |= 0x200000u;
  v39 = self->_has;
  if ((*(_BYTE *)&v39 & 2) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v39 & 4) == 0)
      goto LABEL_28;
    goto LABEL_65;
  }
LABEL_64:
  *(_QWORD *)(v6 + 16) = self->_mediaDuration;
  *(_DWORD *)(v6 + 360) |= 2u;
  v39 = self->_has;
  if ((*(_BYTE *)&v39 & 4) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v39 & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_65:
  *(_QWORD *)(v6 + 24) = self->_mediaTimePlayed;
  *(_DWORD *)(v6 + 360) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_29:
    *(_BYTE *)(v6 + 355) = self->_isNativeAd;
    *(_DWORD *)(v6 + 360) |= 0x80000u;
  }
LABEL_30:
  v40 = -[NSString copyWithZone:](self->_nativeCampaignData, "copyWithZone:", a3);
  v41 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v40;

  v42 = -[NSString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v43 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v42;

  v44 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v45 = *(void **)(v6 + 256);
  *(_QWORD *)(v6 + 256) = v44;

  v46 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v47 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v46;

  v48 = -[NTPBWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v49 = *(void **)(v6 + 344);
  *(_QWORD *)(v6 + 344) = v48;

  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_groupType;
    *(_DWORD *)(v6 + 360) |= 0x400u;
  }
  v50 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v51 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v50;

  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *(_BYTE *)(v6 + 353) = self->_isBreakingNewsArticle;
    *(_DWORD *)(v6 + 360) |= 0x20000u;
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v52 = self->_fractionalCohortMemberships;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v89;
    do
    {
      v56 = 0;
      do
      {
        if (*(_QWORD *)v89 != v55)
          objc_enumerationMutation(v52);
        v57 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * v56), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFractionalCohortMembership:", v57);

        ++v56;
      }
      while (v54 != v56);
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v54);
  }

  v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x8000) != 0)
  {
    *(_DWORD *)(v6 + 336) = self->_videoType;
    *(_DWORD *)(v6 + 360) |= 0x8000u;
    v58 = self->_has;
    if ((*(_BYTE *)&v58 & 0x20) == 0)
    {
LABEL_43:
      if ((*(_BYTE *)&v58 & 1) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if ((*(_BYTE *)&v58 & 0x20) == 0)
  {
    goto LABEL_43;
  }
  *(_QWORD *)(v6 + 48) = self->_publisherArticleVersionInt64;
  *(_DWORD *)(v6 + 360) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 1) != 0)
  {
LABEL_44:
    *(_QWORD *)(v6 + 8) = self->_backendArticleVersionInt64;
    *(_DWORD *)(v6 + 360) |= 1u;
  }
LABEL_45:
  v59 = -[NSString copyWithZone:](self->_iadNativeCampaign, "copyWithZone:", a3);
  v60 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v59;

  v61 = -[NSString copyWithZone:](self->_iadNativeLine, "copyWithZone:", a3);
  v62 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v61;

  v63 = -[NSString copyWithZone:](self->_iadNativeAd, "copyWithZone:", a3);
  v64 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v63;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_QWORD *)(v6 + 40) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v6 + 360) |= 0x10u;
  }
  v65 = -[NSString copyWithZone:](self->_iadNativeCampaignAd, "copyWithZone:", a3);
  v66 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v65;

  v67 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v68 = *(void **)(v6 + 152);
  *(_QWORD *)(v6 + 152) = v67;

  v69 = -[NTPBAlternateHeadline copyWithZone:](self->_alternateHeadline, "copyWithZone:", a3);
  v70 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v69;

  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 276) = self->_rankInVideoPlaylist;
    *(_DWORD *)(v6 + 360) |= 0x4000u;
  }
  v71 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v72 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v71;

  v73 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v74 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v73;

  v75 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v76 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v75;

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v77 = self->_topicIds;
  v78 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v85;
    do
    {
      v81 = 0;
      do
      {
        if (*(_QWORD *)v85 != v80)
          objc_enumerationMutation(v77);
        v82 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * v81), "copyWithZone:", a3, (_QWORD)v84);
        objc_msgSend((id)v6, "addTopicIds:", v82);

        ++v81;
      }
      while (v79 != v81);
      v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    }
    while (v79);
  }

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
  $D13936C5278104CB1C8259D497E97548 has;
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
  $D13936C5278104CB1C8259D497E97548 v24;
  int v25;
  NSString *nativeCampaignData;
  NSString *metadata;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  $D13936C5278104CB1C8259D497E97548 v31;
  int v32;
  NSString *groupFeedId;
  int v34;
  NSMutableArray *fractionalCohortMemberships;
  int v36;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  int v40;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBAlternateHeadline *alternateHeadline;
  int v44;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBIssueViewData *issueViewData;
  NSMutableArray *topicIds;
  char v49;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_195;
  v5 = *((_DWORD *)v4 + 90);
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    if ((v5 & 0x1000) == 0 || self->_mediaType != *((_DWORD *)v4 + 57))
      goto LABEL_195;
  }
  else if ((v5 & 0x1000) != 0)
  {
    goto LABEL_195;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((_QWORD *)v4 + 27) && !-[NSString isEqual:](mediaId, "isEqual:"))
    goto LABEL_195;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_195;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_195;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:"))
      goto LABEL_195;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_195;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_195;
  }
  has = self->_has;
  v13 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_feedType != *((_DWORD *)v4 + 28))
      goto LABEL_195;
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_195;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_195;
    has = self->_has;
  }
  v15 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 25))
      goto LABEL_195;
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_195;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_195;
    has = self->_has;
  }
  v17 = *((_DWORD *)v4 + 90);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v17 & 0x100000) == 0)
      goto LABEL_195;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 356))
        goto LABEL_195;
    }
    else if (*((_BYTE *)v4 + 356))
    {
      goto LABEL_195;
    }
  }
  else if ((v17 & 0x100000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_articleType != *((_DWORD *)v4 + 20))
      goto LABEL_195;
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_195;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_195;
    has = self->_has;
  }
  v19 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 68))
      goto LABEL_195;
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 24))
      goto LABEL_195;
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v19 & 0x10000) == 0)
      goto LABEL_195;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 352))
        goto LABEL_195;
    }
    else if (*((_BYTE *)v4 + 352))
    {
      goto LABEL_195;
    }
  }
  else if ((v19 & 0x10000) != 0)
  {
    goto LABEL_195;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 38)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_195;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 39))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_195;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_195;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_195;
  }
  v24 = self->_has;
  v25 = *((_DWORD *)v4 + 90);
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    if ((v25 & 0x40000) == 0)
      goto LABEL_195;
    if (self->_isDigitalReplicaAd)
    {
      if (!*((_BYTE *)v4 + 354))
        goto LABEL_195;
    }
    else if (*((_BYTE *)v4 + 354))
    {
      goto LABEL_195;
    }
  }
  else if ((v25 & 0x40000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_BYTE *)&v24 & 8) != 0)
  {
    if ((v25 & 8) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 4))
      goto LABEL_195;
  }
  else if ((v25 & 8) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_WORD *)&v24 & 0x800) != 0)
  {
    if ((v25 & 0x800) == 0 || self->_mediaPlayLocation != *((_DWORD *)v4 + 56))
      goto LABEL_195;
  }
  else if ((v25 & 0x800) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_DWORD *)&v24 & 0x200000) != 0)
  {
    if ((v25 & 0x200000) == 0)
      goto LABEL_195;
    if (self->_isVideoInFeed)
    {
      if (!*((_BYTE *)v4 + 357))
        goto LABEL_195;
    }
    else if (*((_BYTE *)v4 + 357))
    {
      goto LABEL_195;
    }
  }
  else if ((v25 & 0x200000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_BYTE *)&v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_mediaDuration != *((_QWORD *)v4 + 2))
      goto LABEL_195;
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_BYTE *)&v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_mediaTimePlayed != *((_QWORD *)v4 + 3))
      goto LABEL_195;
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_DWORD *)&v24 & 0x80000) != 0)
  {
    if ((v25 & 0x80000) == 0)
      goto LABEL_195;
    if (self->_isNativeAd)
    {
      if (!*((_BYTE *)v4 + 355))
        goto LABEL_195;
    }
    else if (*((_BYTE *)v4 + 355))
    {
      goto LABEL_195;
    }
  }
  else if ((v25 & 0x80000) != 0)
  {
    goto LABEL_195;
  }
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((_QWORD *)v4 + 31)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_195;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](metadata, "isEqual:"))
      goto LABEL_195;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_195;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_195;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((_QWORD *)v4 + 43))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
      goto LABEL_195;
  }
  v31 = self->_has;
  v32 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&v31 & 0x400) != 0)
  {
    if ((v32 & 0x400) == 0 || self->_groupType != *((_DWORD *)v4 + 36))
      goto LABEL_195;
  }
  else if ((v32 & 0x400) != 0)
  {
    goto LABEL_195;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:"))
      goto LABEL_195;
    v31 = self->_has;
  }
  v34 = *((_DWORD *)v4 + 90);
  if ((*(_DWORD *)&v31 & 0x20000) != 0)
  {
    if ((v34 & 0x20000) == 0)
      goto LABEL_195;
    if (self->_isBreakingNewsArticle)
    {
      if (!*((_BYTE *)v4 + 353))
        goto LABEL_195;
    }
    else if (*((_BYTE *)v4 + 353))
    {
      goto LABEL_195;
    }
  }
  else if ((v34 & 0x20000) != 0)
  {
    goto LABEL_195;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if (!((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 16)))
    goto LABEL_150;
  if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
  {
LABEL_195:
    v49 = 0;
    goto LABEL_196;
  }
  v31 = self->_has;
LABEL_150:
  v36 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&v31 & 0x8000) != 0)
  {
    if ((v36 & 0x8000) == 0 || self->_videoType != *((_DWORD *)v4 + 84))
      goto LABEL_195;
  }
  else if ((v36 & 0x8000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_BYTE *)&v31 & 0x20) != 0)
  {
    if ((v36 & 0x20) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 6))
      goto LABEL_195;
  }
  else if ((v36 & 0x20) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_BYTE *)&v31 & 1) != 0)
  {
    if ((v36 & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_195;
  }
  else if ((v36 & 1) != 0)
  {
    goto LABEL_195;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_195;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:"))
      goto LABEL_195;
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:"))
      goto LABEL_195;
  }
  v40 = *((_DWORD *)v4 + 90);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v40 & 0x10) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 5))
      goto LABEL_195;
  }
  else if ((v40 & 0x10) != 0)
  {
    goto LABEL_195;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((_QWORD *)v4 + 22)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_195;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_195;
  }
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((_QWORD *)v4 + 7))
  {
    if (!-[NTPBAlternateHeadline isEqual:](alternateHeadline, "isEqual:"))
      goto LABEL_195;
  }
  v44 = *((_DWORD *)v4 + 90);
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v44 & 0x4000) == 0 || self->_rankInVideoPlaylist != *((_DWORD *)v4 + 69))
      goto LABEL_195;
  }
  else if ((v44 & 0x4000) != 0)
  {
    goto LABEL_195;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 24) && !-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    goto LABEL_195;
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 25))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_195;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 26))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_195;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 41))
    v49 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  else
    v49 = 1;
LABEL_196:

  return v49;
}

- (unint64_t)hash
{
  $D13936C5278104CB1C8259D497E97548 *p_has;
  $D13936C5278104CB1C8259D497E97548 has;
  $D13936C5278104CB1C8259D497E97548 v5;
  $D13936C5278104CB1C8259D497E97548 v6;
  $D13936C5278104CB1C8259D497E97548 v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger v26;
  uint64_t v27;
  unint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  NSUInteger v41;
  NSUInteger v42;
  NSUInteger v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSUInteger v52;
  uint64_t v53;
  NSUInteger v54;
  uint64_t v55;
  uint64_t v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  uint64_t v60;

  p_has = &self->_has;
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    v60 = 2654435761 * self->_mediaType;
  else
    v60 = 0;
  v59 = -[NSString hash](self->_mediaId, "hash");
  v58 = -[NSString hash](self->_articleId, "hash");
  v57 = -[NSString hash](self->_referencedArticleId, "hash");
  v56 = -[NSData hash](self->_articleSessionId, "hash");
  v55 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v54 = -[NSString hash](self->_sourceChannelId, "hash");
  if ((*((_BYTE *)p_has + 1) & 2) != 0)
    v53 = 2654435761 * self->_feedType;
  else
    v53 = 0;
  v52 = -[NSString hash](self->_feedId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v51 = 2654435761 * self->_feedCellSection;
  else
    v51 = 0;
  v50 = -[NSData hash](self->_feedViewExposureId, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v49 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_12;
  }
  else
  {
    v49 = 0;
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
LABEL_12:
      v48 = 2654435761 * self->_articleType;
      goto LABEL_15;
    }
  }
  v48 = 0;
LABEL_15:
  v47 = -[NSMutableArray hash](self->_namedEntities, "hash");
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
    v46 = 0;
    if ((*(_BYTE *)&v5 & 0x80) != 0)
      goto LABEL_17;
LABEL_20:
    v45 = 0;
    if ((*(_DWORD *)&v5 & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_21;
  }
  v46 = 2654435761 * self->_publisherArticleVersion;
  if ((*(_BYTE *)&v5 & 0x80) == 0)
    goto LABEL_20;
LABEL_17:
  v45 = 2654435761 * self->_backendArticleVersion;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_18:
    v44 = 2654435761 * self->_adSupportedChannel;
    goto LABEL_22;
  }
LABEL_21:
  v44 = 0;
LABEL_22:
  v43 = -[NSString hash](self->_surfacedByChannelId, "hash");
  v42 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v41 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v40 = -[NSString hash](self->_sectionHeadlineId, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    v39 = 2654435761 * self->_isDigitalReplicaAd;
    if ((*(_BYTE *)&v6 & 8) != 0)
    {
LABEL_24:
      v38 = 2654435761 * self->_personalizationTreatmentId;
      if ((*(_WORD *)&v6 & 0x800) != 0)
        goto LABEL_25;
      goto LABEL_32;
    }
  }
  else
  {
    v39 = 0;
    if ((*(_BYTE *)&v6 & 8) != 0)
      goto LABEL_24;
  }
  v38 = 0;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_25:
    v37 = 2654435761 * self->_mediaPlayLocation;
    if ((*(_DWORD *)&v6 & 0x200000) != 0)
      goto LABEL_26;
    goto LABEL_33;
  }
LABEL_32:
  v37 = 0;
  if ((*(_DWORD *)&v6 & 0x200000) != 0)
  {
LABEL_26:
    v36 = 2654435761 * self->_isVideoInFeed;
    if ((*(_BYTE *)&v6 & 2) != 0)
      goto LABEL_27;
    goto LABEL_34;
  }
LABEL_33:
  v36 = 0;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
LABEL_27:
    v35 = 2654435761 * self->_mediaDuration;
    if ((*(_BYTE *)&v6 & 4) != 0)
      goto LABEL_28;
LABEL_35:
    v34 = 0;
    if ((*(_DWORD *)&v6 & 0x80000) != 0)
      goto LABEL_29;
    goto LABEL_36;
  }
LABEL_34:
  v35 = 0;
  if ((*(_BYTE *)&v6 & 4) == 0)
    goto LABEL_35;
LABEL_28:
  v34 = 2654435761 * self->_mediaTimePlayed;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
LABEL_29:
    v33 = 2654435761 * self->_isNativeAd;
    goto LABEL_37;
  }
LABEL_36:
  v33 = 0;
LABEL_37:
  v32 = -[NSString hash](self->_nativeCampaignData, "hash");
  v31 = -[NSString hash](self->_metadata, "hash");
  v30 = -[NSString hash](self->_previousArticleId, "hash");
  v29 = -[NSString hash](self->_previousArticleVersion, "hash");
  v28 = -[NTPBWidgetEngagement hash](self->_widgetEngagement, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    v27 = 2654435761 * self->_groupType;
  else
    v27 = 0;
  v26 = -[NSString hash](self->_groupFeedId, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    v25 = 2654435761 * self->_isBreakingNewsArticle;
  else
    v25 = 0;
  v24 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
    v23 = 0;
    if ((*(_BYTE *)&v7 & 0x20) != 0)
      goto LABEL_45;
LABEL_48:
    v21 = 0;
    if ((*(_BYTE *)&v7 & 1) != 0)
      goto LABEL_46;
    goto LABEL_49;
  }
  v23 = 2654435761 * self->_videoType;
  if ((*(_BYTE *)&v7 & 0x20) == 0)
    goto LABEL_48;
LABEL_45:
  v21 = 2654435761 * self->_publisherArticleVersionInt64;
  if ((*(_BYTE *)&v7 & 1) != 0)
  {
LABEL_46:
    v8 = 2654435761 * self->_backendArticleVersionInt64;
    goto LABEL_50;
  }
LABEL_49:
  v8 = 0;
LABEL_50:
  v9 = -[NSString hash](self->_iadNativeCampaign, "hash", v21);
  v10 = -[NSString hash](self->_iadNativeLine, "hash");
  v11 = -[NSString hash](self->_iadNativeAd, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v12 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_iadNativeCampaignAd, "hash");
  v14 = -[NSData hash](self->_groupViewExposureId, "hash");
  v15 = -[NTPBAlternateHeadline hash](self->_alternateHeadline, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v16 = 2654435761 * self->_rankInVideoPlaylist;
  else
    v16 = 0;
  v17 = v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NTPBIssueData hash](self->_issueData, "hash");
  v18 = v17 ^ -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  v19 = v59 ^ v60 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v8 ^ v9 ^ v10 ^ v18 ^ -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  return v19 ^ -[NSMutableArray hash](self->_topicIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  int v21;
  NTPBAlternateHeadline *alternateHeadline;
  uint64_t v23;
  NTPBIssueData *issueData;
  uint64_t v25;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v27;
  NTPBIssueViewData *issueViewData;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
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
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 361) & 0x10) != 0)
  {
    self->_mediaType = v4[57];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((_QWORD *)v4 + 27))
    -[NTPBMediaEngageComplete setMediaId:](self, "setMediaId:");
  if (*((_QWORD *)v5 + 8))
    -[NTPBMediaEngageComplete setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 35))
    -[NTPBMediaEngageComplete setReferencedArticleId:](self, "setReferencedArticleId:");
  if (*((_QWORD *)v5 + 9))
    -[NTPBMediaEngageComplete setArticleSessionId:](self, "setArticleSessionId:");
  if (*((_QWORD *)v5 + 11))
    -[NTPBMediaEngageComplete setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  if (*((_QWORD *)v5 + 37))
    -[NTPBMediaEngageComplete setSourceChannelId:](self, "setSourceChannelId:");
  if ((*((_BYTE *)v5 + 361) & 2) != 0)
  {
    self->_feedType = *((_DWORD *)v5 + 28);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)v5 + 13))
    -[NTPBMediaEngageComplete setFeedId:](self, "setFeedId:");
  if ((*((_BYTE *)v5 + 361) & 1) != 0)
  {
    self->_feedCellSection = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v5 + 15))
    -[NTPBMediaEngageComplete setFeedViewExposureId:](self, "setFeedViewExposureId:");
  v6 = *((_DWORD *)v5 + 90);
  if ((v6 & 0x100000) != 0)
  {
    self->_isUserSubscribedToFeed = *((_BYTE *)v5 + 356);
    *(_DWORD *)&self->_has |= 0x100000u;
    v6 = *((_DWORD *)v5 + 90);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_articleType = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = *((id *)v5 + 30);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v44 != v10)
          objc_enumerationMutation(v7);
        -[NTPBMediaEngageComplete addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v9);
  }

  v12 = *((_DWORD *)v5 + 90);
  if ((v12 & 0x2000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 68);
    *(_DWORD *)&self->_has |= 0x2000u;
    v12 = *((_DWORD *)v5 + 90);
    if ((v12 & 0x80) == 0)
    {
LABEL_36:
      if ((v12 & 0x10000) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((v12 & 0x80) == 0)
  {
    goto LABEL_36;
  }
  self->_backendArticleVersion = *((_DWORD *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v5 + 90) & 0x10000) != 0)
  {
LABEL_37:
    self->_adSupportedChannel = *((_BYTE *)v5 + 352);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_38:
  if (*((_QWORD *)v5 + 38))
    -[NTPBMediaEngageComplete setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v5 + 39))
    -[NTPBMediaEngageComplete setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v5 + 40))
    -[NTPBMediaEngageComplete setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 36))
    -[NTPBMediaEngageComplete setSectionHeadlineId:](self, "setSectionHeadlineId:");
  v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 0x40000) != 0)
  {
    self->_isDigitalReplicaAd = *((_BYTE *)v5 + 354);
    *(_DWORD *)&self->_has |= 0x40000u;
    v13 = *((_DWORD *)v5 + 90);
    if ((v13 & 8) == 0)
    {
LABEL_48:
      if ((v13 & 0x800) == 0)
        goto LABEL_49;
      goto LABEL_70;
    }
  }
  else if ((v13 & 8) == 0)
  {
    goto LABEL_48;
  }
  self->_personalizationTreatmentId = *((_QWORD *)v5 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 0x800) == 0)
  {
LABEL_49:
    if ((v13 & 0x200000) == 0)
      goto LABEL_50;
    goto LABEL_71;
  }
LABEL_70:
  self->_mediaPlayLocation = *((_DWORD *)v5 + 56);
  *(_DWORD *)&self->_has |= 0x800u;
  v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 0x200000) == 0)
  {
LABEL_50:
    if ((v13 & 2) == 0)
      goto LABEL_51;
    goto LABEL_72;
  }
LABEL_71:
  self->_isVideoInFeed = *((_BYTE *)v5 + 357);
  *(_DWORD *)&self->_has |= 0x200000u;
  v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 2) == 0)
  {
LABEL_51:
    if ((v13 & 4) == 0)
      goto LABEL_52;
    goto LABEL_73;
  }
LABEL_72:
  self->_mediaDuration = *((_QWORD *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 4) == 0)
  {
LABEL_52:
    if ((v13 & 0x80000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_73:
  self->_mediaTimePlayed = *((_QWORD *)v5 + 3);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)v5 + 90) & 0x80000) != 0)
  {
LABEL_53:
    self->_isNativeAd = *((_BYTE *)v5 + 355);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_54:
  if (*((_QWORD *)v5 + 31))
    -[NTPBMediaEngageComplete setNativeCampaignData:](self, "setNativeCampaignData:");
  if (*((_QWORD *)v5 + 29))
    -[NTPBMediaEngageComplete setMetadata:](self, "setMetadata:");
  if (*((_QWORD *)v5 + 32))
    -[NTPBMediaEngageComplete setPreviousArticleId:](self, "setPreviousArticleId:");
  if (*((_QWORD *)v5 + 33))
    -[NTPBMediaEngageComplete setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  widgetEngagement = self->_widgetEngagement;
  v15 = *((_QWORD *)v5 + 43);
  if (widgetEngagement)
  {
    if (v15)
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v15)
  {
    -[NTPBMediaEngageComplete setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  if ((*((_BYTE *)v5 + 361) & 4) != 0)
  {
    self->_groupType = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((_QWORD *)v5 + 17))
    -[NTPBMediaEngageComplete setGroupFeedId:](self, "setGroupFeedId:");
  if ((*((_BYTE *)v5 + 362) & 2) != 0)
  {
    self->_isBreakingNewsArticle = *((_BYTE *)v5 + 353);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = *((id *)v5 + 16);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        -[NTPBMediaEngageComplete addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v18);
  }

  v21 = *((_DWORD *)v5 + 90);
  if ((v21 & 0x8000) != 0)
  {
    self->_videoType = *((_DWORD *)v5 + 84);
    *(_DWORD *)&self->_has |= 0x8000u;
    v21 = *((_DWORD *)v5 + 90);
    if ((v21 & 0x20) == 0)
    {
LABEL_92:
      if ((v21 & 1) == 0)
        goto LABEL_94;
      goto LABEL_93;
    }
  }
  else if ((v21 & 0x20) == 0)
  {
    goto LABEL_92;
  }
  self->_publisherArticleVersionInt64 = *((_QWORD *)v5 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v5 + 90) & 1) != 0)
  {
LABEL_93:
    self->_backendArticleVersionInt64 = *((_QWORD *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_94:
  if (*((_QWORD *)v5 + 21))
    -[NTPBMediaEngageComplete setIadNativeCampaign:](self, "setIadNativeCampaign:");
  if (*((_QWORD *)v5 + 23))
    -[NTPBMediaEngageComplete setIadNativeLine:](self, "setIadNativeLine:");
  if (*((_QWORD *)v5 + 20))
    -[NTPBMediaEngageComplete setIadNativeAd:](self, "setIadNativeAd:");
  if ((*((_BYTE *)v5 + 360) & 0x10) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v5 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v5 + 22))
    -[NTPBMediaEngageComplete setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  if (*((_QWORD *)v5 + 19))
    -[NTPBMediaEngageComplete setGroupViewExposureId:](self, "setGroupViewExposureId:");
  alternateHeadline = self->_alternateHeadline;
  v23 = *((_QWORD *)v5 + 7);
  if (alternateHeadline)
  {
    if (v23)
      -[NTPBAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
  }
  else if (v23)
  {
    -[NTPBMediaEngageComplete setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  if ((*((_BYTE *)v5 + 361) & 0x40) != 0)
  {
    self->_rankInVideoPlaylist = *((_DWORD *)v5 + 69);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  issueData = self->_issueData;
  v25 = *((_QWORD *)v5 + 24);
  if (issueData)
  {
    if (v25)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v25)
  {
    -[NTPBMediaEngageComplete setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v27 = *((_QWORD *)v5 + 25);
  if (issueExposureData)
  {
    if (v27)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v27)
  {
    -[NTPBMediaEngageComplete setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  v29 = *((_QWORD *)v5 + 26);
  if (issueViewData)
  {
    if (v29)
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else if (v29)
  {
    -[NTPBMediaEngageComplete setIssueViewData:](self, "setIssueViewData:");
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = *((id *)v5 + 41);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        -[NTPBMediaEngageComplete addTopicIds:](self, "addTopicIds:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k), (_QWORD)v35);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v32);
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

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (BOOL)isVideoInFeed
{
  return self->_isVideoInFeed;
}

- (int64_t)mediaDuration
{
  return self->_mediaDuration;
}

- (int64_t)mediaTimePlayed
{
  return self->_mediaTimePlayed;
}

- (BOOL)isNativeAd
{
  return self->_isNativeAd;
}

- (NSString)nativeCampaignData
{
  return self->_nativeCampaignData;
}

- (void)setNativeCampaignData:(id)a3
{
  objc_storeStrong((id *)&self->_nativeCampaignData, a3);
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

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_groupFeedId, a3);
}

- (BOOL)isBreakingNewsArticle
{
  return self->_isBreakingNewsArticle;
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, a3);
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
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

- (int64_t)previousArticlePublisherArticleVersion
{
  return self->_previousArticlePublisherArticleVersion;
}

- (NSString)iadNativeCampaignAd
{
  return self->_iadNativeCampaignAd;
}

- (void)setIadNativeCampaignAd:(id)a3
{
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, a3);
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
}

- (NTPBAlternateHeadline)alternateHeadline
{
  return self->_alternateHeadline;
}

- (void)setAlternateHeadline:(id)a3
{
  objc_storeStrong((id *)&self->_alternateHeadline, a3);
}

- (int)rankInVideoPlaylist
{
  return self->_rankInVideoPlaylist;
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

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
  objc_storeStrong((id *)&self->_topicIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_nativeCampaignData, 0);
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
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
  objc_storeStrong((id *)&self->_alternateHeadline, 0);
}

@end
