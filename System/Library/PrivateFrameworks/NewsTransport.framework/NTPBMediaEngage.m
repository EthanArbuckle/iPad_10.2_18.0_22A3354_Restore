@implementation NTPBMediaEngage

- (int)mediaType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    return self->_mediaType;
  else
    return 0;
}

- (void)setMediaType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_24CD4E1B8[a3];
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

- (void)setMediaTimePlayed:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_mediaTimePlayed = a3;
}

- (void)setHasMediaTimePlayed:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasMediaTimePlayed
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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

- (int)mediaPlayMethod
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_mediaPlayMethod;
  else
    return 0;
}

- (void)setMediaPlayMethod:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_mediaPlayMethod = a3;
}

- (void)setHasMediaPlayMethod:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMediaPlayMethod
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)mediaPauseMethod
{
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    return self->_mediaPauseMethod;
  else
    return 0;
}

- (void)setMediaPauseMethod:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_mediaPauseMethod = a3;
}

- (void)setHasMediaPauseMethod:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasMediaPauseMethod
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setMediaPausePosition:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_mediaPausePosition = a3;
}

- (void)setHasMediaPausePosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasMediaPausePosition
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMediaResumeTimePlayed:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_mediaResumeTimePlayed = a3;
}

- (void)setHasMediaResumeTimePlayed:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasMediaResumeTimePlayed
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)mediaResumeMethod
{
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    return self->_mediaResumeMethod;
  else
    return 0;
}

- (void)setMediaResumeMethod:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_mediaResumeMethod = a3;
}

- (void)setHasMediaResumeMethod:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMediaResumeMethod
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMediaResumePosition:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_mediaResumePosition = a3;
}

- (void)setHasMediaResumePosition:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasMediaResumePosition
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)mediaPlayLocation
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_mediaPlayLocation;
  else
    return 0;
}

- (void)setMediaPlayLocation:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_mediaPlayLocation = a3;
}

- (void)setHasMediaPlayLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasMediaPlayLocation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)feedType
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasFeedType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4E1F0[a3];
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
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_feedCellSection;
  else
    return 0;
}

- (void)setFeedCellSection:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasFeedCellSection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 < 0x12)
    return off_24CD4E2A0[a3];
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
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (int)articleType
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_articleType;
  else
    return 0;
}

- (void)setArticleType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasArticleType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD4E330[a3];
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
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
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
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (int)userAction
{
  if ((*((_BYTE *)&self->_has + 3) & 4) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasUserAction
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsVideoInFeed:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_isVideoInFeed = a3;
}

- (void)setHasIsVideoInFeed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasIsVideoInFeed
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (int)mediaPauseLocation
{
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_mediaPauseLocation;
  else
    return 0;
}

- (void)setMediaPauseLocation:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_mediaPauseLocation = a3;
}

- (void)setHasMediaPauseLocation:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasMediaPauseLocation
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMediaDuration:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_mediaDuration = a3;
}

- (void)setHasMediaDuration:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasMediaDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsBreakingNewsArticle:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_isBreakingNewsArticle = a3;
}

- (void)setHasIsBreakingNewsArticle:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (int)loadFailureReason
{
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    return self->_loadFailureReason;
  else
    return 0;
}

- (void)setLoadFailureReason:(int)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_loadFailureReason = a3;
}

- (void)setHasLoadFailureReason:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasLoadFailureReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)topStoryType
{
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
    return self->_topStoryType;
  else
    return 0;
}

- (void)setTopStoryType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_topStoryType = a3;
}

- (void)setHasTopStoryType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasTopStoryType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)topStoryTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4E360[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTopStoryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TOP_STORY_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MANDATORY_TOP_STORY_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OPTIONAL_TOP_STORY_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsTopStoryArticle:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsTopStoryArticle
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsNativeAd
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
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
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasGroupType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return off_24CD4E378[a3];
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
  if ((*((_BYTE *)&self->_has + 3) & 8) != 0)
    return self->_videoType;
  else
    return 0;
}

- (void)setVideoType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_videoType = a3;
}

- (void)setHasVideoType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasVideoType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (id)videoTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4E4B8[a3];
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
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)muteButtonState
{
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    return self->_muteButtonState;
  else
    return 0;
}

- (void)setMuteButtonState:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_muteButtonState = a3;
}

- (void)setHasMuteButtonState:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMuteButtonState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setOsVolumeLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_osVolumeLevel = a3;
}

- (void)setHasOsVolumeLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasOsVolumeLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
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
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return *(_BYTE *)&self->_has >> 7;
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
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_rankInVideoPlaylist = a3;
}

- (void)setHasRankInVideoPlaylist:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasRankInVideoPlaylist
{
  return *((_BYTE *)&self->_has + 3) & 1;
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
  v8.super_class = (Class)NTPBMediaEngage;
  -[NTPBMediaEngage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBMediaEngage dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  NSString *articleId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  $16045DCADA8B3DB0231ED545073A6F77 has;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t feedType;
  __CFString *v22;
  NSString *feedId;
  uint64_t feedCellSection;
  __CFString *v25;
  NSData *feedViewExposureId;
  $16045DCADA8B3DB0231ED545073A6F77 v27;
  void *v28;
  uint64_t articleType;
  __CFString *v30;
  NSMutableArray *namedEntities;
  $16045DCADA8B3DB0231ED545073A6F77 v32;
  void *v33;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  $16045DCADA8B3DB0231ED545073A6F77 v38;
  void *v39;
  NSString *nativeCampaignData;
  NSString *metadata;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  void *v45;
  uint64_t groupType;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t topStoryType;
  __CFString *v59;
  NSString *groupFeedId;
  double v61;
  void *v62;
  NSMutableArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  void *v68;
  $16045DCADA8B3DB0231ED545073A6F77 v69;
  void *v70;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  void *v74;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBAlternateHeadline *alternateHeadline;
  void *v78;
  void *v79;
  NTPBIssueData *issueData;
  void *v81;
  NTPBIssueExposureData *issueExposureData;
  void *v83;
  NTPBIssueViewData *issueViewData;
  void *v85;
  NSMutableArray *topicIds;
  id v87;
  uint64_t videoType;
  __CFString *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    mediaType = self->_mediaType;
    if (mediaType >= 7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediaType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24CD4E1B8[mediaType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("media_type"));

  }
  mediaId = self->_mediaId;
  if (mediaId)
    objc_msgSend(v3, "setObject:forKey:", mediaId, CFSTR("media_id"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mediaTimePlayed);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("media_time_played"));

  }
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
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mediaPlayMethod);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("media_play_method"));

    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_22:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_23;
      goto LABEL_31;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mediaPauseMethod);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("media_pause_method"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_24;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mediaPausePosition);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("media_pause_position"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_25;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mediaResumeTimePlayed);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("media_resume_time_played"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_26;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mediaResumeMethod);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("media_resume_method"));

  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_27;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mediaResumePosition);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("media_resume_position"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_40;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mediaPlayLocation);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("media_play_location"));

  if ((*(_QWORD *)&self->_has & 0x1000) == 0)
    goto LABEL_40;
LABEL_36:
  feedType = self->_feedType;
  if (feedType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_24CD4E1F0[feedType];
  }
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("feed_type"));

LABEL_40:
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    feedCellSection = self->_feedCellSection;
    if (feedCellSection >= 0x12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedCellSection);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_24CD4E2A0[feedCellSection];
    }
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("feed_cell_section"));

  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  v27 = self->_has;
  if ((*(_QWORD *)&v27 & 0x200000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isUserSubscribedToFeed);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("is_user_subscribed_to_feed"));

    v27 = self->_has;
  }
  if ((*(_WORD *)&v27 & 0x200) != 0)
  {
    articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_articleType);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_24CD4E330[articleType];
    }
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("article_type"));

  }
  namedEntities = self->_namedEntities;
  if (namedEntities)
    objc_msgSend(v3, "setObject:forKey:", namedEntities, CFSTR("named_entities"));
  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x800000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_publisherArticleVersion);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("publisher_article_version"));

    v32 = self->_has;
    if ((*(_WORD *)&v32 & 0x400) == 0)
    {
LABEL_60:
      if ((*(_DWORD *)&v32 & 0x10000000) == 0)
        goto LABEL_62;
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v32 & 0x400) == 0)
  {
    goto LABEL_60;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_backendArticleVersion);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("backend_article_version"));

  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_61:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_adSupportedChannel);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("ad_supported_channel"));

  }
LABEL_62:
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
  v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDigitalReplicaAd);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("is_digital_replica_ad"));

    v38 = self->_has;
    if ((*(_DWORD *)&v38 & 0x4000000) == 0)
    {
LABEL_72:
      if ((*(_QWORD *)&v38 & 0x400000000) == 0)
        goto LABEL_73;
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v38 & 0x4000000) == 0)
  {
    goto LABEL_72;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("user_action"));

  v38 = self->_has;
  if ((*(_QWORD *)&v38 & 0x400000000) == 0)
  {
LABEL_73:
    if ((*(_BYTE *)&v38 & 0x40) == 0)
      goto LABEL_74;
    goto LABEL_101;
  }
LABEL_100:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isVideoInFeed);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("is_video_in_feed"));

  v38 = self->_has;
  if ((*(_BYTE *)&v38 & 0x40) == 0)
  {
LABEL_74:
    if ((*(_WORD *)&v38 & 0x8000) == 0)
      goto LABEL_75;
    goto LABEL_102;
  }
LABEL_101:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("personalization_treatment_id"));

  v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x8000) == 0)
  {
LABEL_75:
    if ((*(_BYTE *)&v38 & 2) == 0)
      goto LABEL_76;
    goto LABEL_103;
  }
LABEL_102:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_mediaPauseLocation);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("media_pause_location"));

  v38 = self->_has;
  if ((*(_BYTE *)&v38 & 2) == 0)
  {
LABEL_76:
    if ((*(_DWORD *)&v38 & 0x20000000) == 0)
      goto LABEL_77;
    goto LABEL_104;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mediaDuration);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("media_duration"));

  v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x20000000) == 0)
  {
LABEL_77:
    if ((*(_WORD *)&v38 & 0x4000) == 0)
      goto LABEL_78;
    goto LABEL_105;
  }
LABEL_104:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBreakingNewsArticle);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("is_breaking_news_article"));

  v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x4000) == 0)
  {
LABEL_78:
    if ((*(_DWORD *)&v38 & 0x2000000) == 0)
      goto LABEL_79;
    goto LABEL_106;
  }
LABEL_105:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_loadFailureReason);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("load_failure_reason"));

  v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x2000000) == 0)
  {
LABEL_79:
    if ((*(_QWORD *)&v38 & 0x100000000) == 0)
      goto LABEL_80;
    goto LABEL_156;
  }
LABEL_106:
  topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_topStoryType);
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = off_24CD4E360[topStoryType];
  }
  objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("top_story_type"));

  v38 = self->_has;
  if ((*(_QWORD *)&v38 & 0x100000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v38 & 0x80000000) == 0)
      goto LABEL_82;
    goto LABEL_81;
  }
LABEL_156:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isTopStoryArticle);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v91, CFSTR("is_top_story_article"));

  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_81:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNativeAd);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v39, CFSTR("is_native_ad"));

  }
LABEL_82:
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
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("widget_engagement"));

  }
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_24CD4E378[groupType];
    }
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("group_type"));

  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId)
    objc_msgSend(v3, "setObject:forKey:", groupFeedId, CFSTR("group_feed_id"));
  if (-[NSMutableArray count](self->_fractionalCohortMemberships, "count"))
  {
    v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v63 = self->_fractionalCohortMemberships;
    v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v96;
      do
      {
        for (i = 0; i != v65; ++i)
        {
          if (*(_QWORD *)v96 != v66)
            objc_enumerationMutation(v63);
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * i), "dictionaryRepresentation");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "addObject:", v68);

        }
        v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v95, v99, 16);
      }
      while (v65);
    }

    objc_msgSend(v3, "setObject:forKey:", v62, CFSTR("fractional_cohort_membership"));
  }
  v69 = self->_has;
  if ((*(_DWORD *)&v69 & 0x8000000) != 0)
  {
    videoType = self->_videoType;
    if (videoType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_videoType);
      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v90 = off_24CD4E4B8[videoType];
    }
    objc_msgSend(v3, "setObject:forKey:", v90, CFSTR("video_type"));

    v69 = self->_has;
    if ((*(_WORD *)&v69 & 0x100) == 0)
    {
LABEL_123:
      if ((*(_BYTE *)&v69 & 1) == 0)
        goto LABEL_124;
      goto LABEL_161;
    }
  }
  else if ((*(_WORD *)&v69 & 0x100) == 0)
  {
    goto LABEL_123;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_publisherArticleVersionInt64);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v92, CFSTR("publisher_article_version_int64"));

  v69 = self->_has;
  if ((*(_BYTE *)&v69 & 1) == 0)
  {
LABEL_124:
    if ((*(_DWORD *)&v69 & 0x200000) == 0)
      goto LABEL_125;
    goto LABEL_162;
  }
LABEL_161:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backendArticleVersionInt64);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v93, CFSTR("backend_article_version_int64"));

  v69 = self->_has;
  if ((*(_DWORD *)&v69 & 0x200000) == 0)
  {
LABEL_125:
    if ((*(_DWORD *)&v69 & 0x400000) == 0)
      goto LABEL_127;
    goto LABEL_126;
  }
LABEL_162:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_muteButtonState);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v94, CFSTR("mute_button_state"));

  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_126:
    *(float *)&v61 = self->_osVolumeLevel;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v61);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("os_volume_level"));

  }
LABEL_127:
  iadNativeCampaign = self->_iadNativeCampaign;
  if (iadNativeCampaign)
    objc_msgSend(v3, "setObject:forKey:", iadNativeCampaign, CFSTR("iad_native_campaign"));
  iadNativeLine = self->_iadNativeLine;
  if (iadNativeLine)
    objc_msgSend(v3, "setObject:forKey:", iadNativeLine, CFSTR("iad_native_line"));
  iadNativeAd = self->_iadNativeAd;
  if (iadNativeAd)
    objc_msgSend(v3, "setObject:forKey:", iadNativeAd, CFSTR("iad_native_ad"));
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_previousArticlePublisherArticleVersion);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("previous_article_publisher_article_version"));

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
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v78, CFSTR("alternate_headline"));

  }
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rankInVideoPlaylist);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v79, CFSTR("rank_in_video_playlist"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v81, CFSTR("issue_data"));

  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    -[NTPBIssueExposureData dictionaryRepresentation](issueExposureData, "dictionaryRepresentation");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v83, CFSTR("issue_exposure_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v85, CFSTR("issue_view_data"));

  }
  topicIds = self->_topicIds;
  if (topicIds)
    objc_msgSend(v3, "setObject:forKey:", topicIds, CFSTR("topic_ids"));
  v87 = v3;

  return v87;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMediaEngageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $16045DCADA8B3DB0231ED545073A6F77 has;
  $16045DCADA8B3DB0231ED545073A6F77 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $16045DCADA8B3DB0231ED545073A6F77 v12;
  $16045DCADA8B3DB0231ED545073A6F77 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $16045DCADA8B3DB0231ED545073A6F77 v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_mediaId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt64Field();
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
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_19:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_20;
      goto LABEL_126;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_23;
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_130:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x1000) != 0)
LABEL_25:
    PBDataWriterWriteInt32Field();
LABEL_26:
  if (self->_feedId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x200) != 0)
    PBDataWriterWriteInt32Field();
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
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }

  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x400) == 0)
    {
LABEL_45:
      if ((*(_DWORD *)&v12 & 0x10000000) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v12 & 0x400) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
LABEL_46:
    PBDataWriterWriteBOOLField();
LABEL_47:
  if (self->_surfacedByChannelId)
    PBDataWriterWriteStringField();
  if (self->_surfacedBySectionId)
    PBDataWriterWriteStringField();
  if (self->_surfacedByTopicId)
    PBDataWriterWriteStringField();
  if (self->_sectionHeadlineId)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x4000000) == 0)
    {
LABEL_57:
      if ((*(_QWORD *)&v13 & 0x400000000) == 0)
        goto LABEL_58;
      goto LABEL_137;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_QWORD *)&v13 & 0x400000000) == 0)
  {
LABEL_58:
    if ((*(_BYTE *)&v13 & 0x40) == 0)
      goto LABEL_59;
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteBOOLField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 0x40) == 0)
  {
LABEL_59:
    if ((*(_WORD *)&v13 & 0x8000) == 0)
      goto LABEL_60;
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteInt64Field();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_60:
    if ((*(_BYTE *)&v13 & 2) == 0)
      goto LABEL_61;
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 2) == 0)
  {
LABEL_61:
    if ((*(_DWORD *)&v13 & 0x20000000) == 0)
      goto LABEL_62;
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteInt64Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v13 & 0x4000) == 0)
      goto LABEL_63;
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteBOOLField();
  v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0)
      goto LABEL_64;
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_64:
    if ((*(_QWORD *)&v13 & 0x100000000) == 0)
      goto LABEL_65;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteInt32Field();
  v13 = self->_has;
  if ((*(_QWORD *)&v13 & 0x100000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v13 & 0x80000000) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
LABEL_66:
    PBDataWriterWriteBOOLField();
LABEL_67:
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
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_groupFeedId)
    PBDataWriterWriteStringField();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_fractionalCohortMemberships;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v16);
  }

  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x8000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v19 = self->_has;
    if ((*(_WORD *)&v19 & 0x100) == 0)
    {
LABEL_90:
      if ((*(_BYTE *)&v19 & 1) == 0)
        goto LABEL_91;
      goto LABEL_148;
    }
  }
  else if ((*(_WORD *)&v19 & 0x100) == 0)
  {
    goto LABEL_90;
  }
  PBDataWriterWriteInt64Field();
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 1) == 0)
  {
LABEL_91:
    if ((*(_DWORD *)&v19 & 0x200000) == 0)
      goto LABEL_92;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteInt64Field();
  v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x200000) == 0)
  {
LABEL_92:
    if ((*(_DWORD *)&v19 & 0x400000) == 0)
      goto LABEL_94;
    goto LABEL_93;
  }
LABEL_149:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
LABEL_93:
    PBDataWriterWriteFloatField();
LABEL_94:
  if (self->_iadNativeCampaign)
    PBDataWriterWriteStringField();
  if (self->_iadNativeLine)
    PBDataWriterWriteStringField();
  if (self->_iadNativeAd)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_iadNativeCampaignAd)
    PBDataWriterWriteStringField();
  if (self->_groupViewExposureId)
    PBDataWriterWriteDataField();
  if (self->_alternateHeadline)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_issueData)
    PBDataWriterWriteSubmessage();
  if (self->_issueExposureData)
    PBDataWriterWriteSubmessage();
  if (self->_issueViewData)
    PBDataWriterWriteSubmessage();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_topicIds;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v22);
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
  $16045DCADA8B3DB0231ED545073A6F77 has;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  $16045DCADA8B3DB0231ED545073A6F77 v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  $16045DCADA8B3DB0231ED545073A6F77 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  $16045DCADA8B3DB0231ED545073A6F77 v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSMutableArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  $16045DCADA8B3DB0231ED545073A6F77 v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  NSMutableArray *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
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
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 276) = self->_mediaType;
    *(_QWORD *)(v5 + 432) |= 0x100000uLL;
  }
  v7 = -[NSString copyWithZone:](self->_mediaId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v7;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_mediaTimePlayed;
    *(_QWORD *)(v6 + 432) |= 0x20uLL;
  }
  v9 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v9;

  v11 = -[NSString copyWithZone:](self->_referencedArticleId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 344);
  *(_QWORD *)(v6 + 344) = v11;

  v13 = -[NSData copyWithZone:](self->_articleSessionId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v13;

  v15 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v15;

  v17 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 360);
  *(_QWORD *)(v6 + 360) = v17;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *(_DWORD *)(v6 + 268) = self->_mediaPlayMethod;
    *(_QWORD *)(v6 + 432) |= 0x40000uLL;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 4) == 0)
        goto LABEL_8;
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 260) = self->_mediaPauseMethod;
  *(_QWORD *)(v6 + 432) |= 0x10000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_73;
  }
LABEL_72:
  *(_QWORD *)(v6 + 24) = self->_mediaPausePosition;
  *(_QWORD *)(v6 + 432) |= 4uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x80000) == 0)
      goto LABEL_10;
    goto LABEL_74;
  }
LABEL_73:
  *(_QWORD *)(v6 + 40) = self->_mediaResumeTimePlayed;
  *(_QWORD *)(v6 + 432) |= 0x10uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 8) == 0)
      goto LABEL_11;
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v6 + 272) = self->_mediaResumeMethod;
  *(_QWORD *)(v6 + 432) |= 0x80000uLL;
  has = self->_has;
  if ((*(_BYTE *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_12;
    goto LABEL_76;
  }
LABEL_75:
  *(_QWORD *)(v6 + 32) = self->_mediaResumePosition;
  *(_QWORD *)(v6 + 432) |= 8uLL;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_76:
  *(_DWORD *)(v6 + 264) = self->_mediaPlayLocation;
  *(_QWORD *)(v6 + 432) |= 0x20000uLL;
  if ((*(_QWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 136) = self->_feedType;
    *(_QWORD *)(v6 + 432) |= 0x1000uLL;
  }
LABEL_14:
  v20 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v20;

  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    *(_DWORD *)(v6 + 124) = self->_feedCellSection;
    *(_QWORD *)(v6 + 432) |= 0x800uLL;
  }
  v22 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v22;

  v24 = self->_has;
  if ((*(_QWORD *)&v24 & 0x200000000) != 0)
  {
    *(_BYTE *)(v6 + 429) = self->_isUserSubscribedToFeed;
    *(_QWORD *)(v6 + 432) |= 0x200000000uLL;
    v24 = self->_has;
  }
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_articleType;
    *(_QWORD *)(v6 + 432) |= 0x200uLL;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v25 = self->_namedEntities;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v95;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v95 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * v29), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addNamedEntities:", v30);

        ++v29;
      }
      while (v27 != v29);
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
    }
    while (v27);
  }

  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x800000) != 0)
  {
    *(_DWORD *)(v6 + 336) = self->_publisherArticleVersion;
    *(_QWORD *)(v6 + 432) |= 0x800000uLL;
    v31 = self->_has;
    if ((*(_WORD *)&v31 & 0x400) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v31 & 0x10000000) == 0)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&v31 & 0x400) == 0)
  {
    goto LABEL_29;
  }
  *(_DWORD *)(v6 + 120) = self->_backendArticleVersion;
  *(_QWORD *)(v6 + 432) |= 0x400uLL;
  if ((*(_QWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_30:
    *(_BYTE *)(v6 + 424) = self->_adSupportedChannel;
    *(_QWORD *)(v6 + 432) |= 0x10000000uLL;
  }
LABEL_31:
  v32 = -[NSString copyWithZone:](self->_surfacedByChannelId, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 368);
  *(_QWORD *)(v6 + 368) = v32;

  v34 = -[NSString copyWithZone:](self->_surfacedBySectionId, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 376);
  *(_QWORD *)(v6 + 376) = v34;

  v36 = -[NSString copyWithZone:](self->_surfacedByTopicId, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 384);
  *(_QWORD *)(v6 + 384) = v36;

  v38 = -[NSString copyWithZone:](self->_sectionHeadlineId, "copyWithZone:", a3);
  v39 = *(void **)(v6 + 352);
  *(_QWORD *)(v6 + 352) = v38;

  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x40000000) != 0)
  {
    *(_BYTE *)(v6 + 426) = self->_isDigitalReplicaAd;
    *(_QWORD *)(v6 + 432) |= 0x40000000uLL;
    v40 = self->_has;
    if ((*(_DWORD *)&v40 & 0x4000000) == 0)
    {
LABEL_33:
      if ((*(_QWORD *)&v40 & 0x400000000) == 0)
        goto LABEL_34;
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v40 & 0x4000000) == 0)
  {
    goto LABEL_33;
  }
  *(_DWORD *)(v6 + 408) = self->_userAction;
  *(_QWORD *)(v6 + 432) |= 0x4000000uLL;
  v40 = self->_has;
  if ((*(_QWORD *)&v40 & 0x400000000) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v40 & 0x40) == 0)
      goto LABEL_35;
    goto LABEL_84;
  }
LABEL_83:
  *(_BYTE *)(v6 + 430) = self->_isVideoInFeed;
  *(_QWORD *)(v6 + 432) |= 0x400000000uLL;
  v40 = self->_has;
  if ((*(_BYTE *)&v40 & 0x40) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v40 & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_85;
  }
LABEL_84:
  *(_QWORD *)(v6 + 56) = self->_personalizationTreatmentId;
  *(_QWORD *)(v6 + 432) |= 0x40uLL;
  v40 = self->_has;
  if ((*(_WORD *)&v40 & 0x8000) == 0)
  {
LABEL_36:
    if ((*(_BYTE *)&v40 & 2) == 0)
      goto LABEL_37;
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v6 + 256) = self->_mediaPauseLocation;
  *(_QWORD *)(v6 + 432) |= 0x8000uLL;
  v40 = self->_has;
  if ((*(_BYTE *)&v40 & 2) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v40 & 0x20000000) == 0)
      goto LABEL_38;
    goto LABEL_87;
  }
LABEL_86:
  *(_QWORD *)(v6 + 16) = self->_mediaDuration;
  *(_QWORD *)(v6 + 432) |= 2uLL;
  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v40 & 0x4000) == 0)
      goto LABEL_39;
    goto LABEL_88;
  }
LABEL_87:
  *(_BYTE *)(v6 + 425) = self->_isBreakingNewsArticle;
  *(_QWORD *)(v6 + 432) |= 0x20000000uLL;
  v40 = self->_has;
  if ((*(_WORD *)&v40 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v40 & 0x2000000) == 0)
      goto LABEL_40;
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v6 + 240) = self->_loadFailureReason;
  *(_QWORD *)(v6 + 432) |= 0x4000uLL;
  v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x2000000) == 0)
  {
LABEL_40:
    if ((*(_QWORD *)&v40 & 0x100000000) == 0)
      goto LABEL_41;
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v6 + 392) = self->_topStoryType;
  *(_QWORD *)(v6 + 432) |= 0x2000000uLL;
  v40 = self->_has;
  if ((*(_QWORD *)&v40 & 0x100000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v40 & 0x80000000) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_90:
  *(_BYTE *)(v6 + 428) = self->_isTopStoryArticle;
  *(_QWORD *)(v6 + 432) |= 0x100000000uLL;
  if ((*(_QWORD *)&self->_has & 0x80000000) != 0)
  {
LABEL_42:
    *(_BYTE *)(v6 + 427) = self->_isNativeAd;
    *(_QWORD *)(v6 + 432) |= 0x80000000uLL;
  }
LABEL_43:
  v41 = -[NSString copyWithZone:](self->_nativeCampaignData, "copyWithZone:", a3);
  v42 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v41;

  v43 = -[NSString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v44 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v43;

  v45 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v46 = *(void **)(v6 + 320);
  *(_QWORD *)(v6 + 320) = v45;

  v47 = -[NSString copyWithZone:](self->_previousArticleVersion, "copyWithZone:", a3);
  v48 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = v47;

  v49 = -[NTPBWidgetEngagement copyWithZone:](self->_widgetEngagement, "copyWithZone:", a3);
  v50 = *(void **)(v6 + 416);
  *(_QWORD *)(v6 + 416) = v49;

  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 168) = self->_groupType;
    *(_QWORD *)(v6 + 432) |= 0x2000uLL;
  }
  v51 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3);
  v52 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v51;

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v53 = self->_fractionalCohortMemberships;
  v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v91;
    do
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v91 != v56)
          objc_enumerationMutation(v53);
        v58 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v57), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFractionalCohortMembership:", v58);

        ++v57;
      }
      while (v55 != v57);
      v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    }
    while (v55);
  }

  v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x8000000) != 0)
  {
    *(_DWORD *)(v6 + 412) = self->_videoType;
    *(_QWORD *)(v6 + 432) |= 0x8000000uLL;
    v59 = self->_has;
    if ((*(_WORD *)&v59 & 0x100) == 0)
    {
LABEL_54:
      if ((*(_BYTE *)&v59 & 1) == 0)
        goto LABEL_55;
      goto LABEL_94;
    }
  }
  else if ((*(_WORD *)&v59 & 0x100) == 0)
  {
    goto LABEL_54;
  }
  *(_QWORD *)(v6 + 72) = self->_publisherArticleVersionInt64;
  *(_QWORD *)(v6 + 432) |= 0x100uLL;
  v59 = self->_has;
  if ((*(_BYTE *)&v59 & 1) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v59 & 0x200000) == 0)
      goto LABEL_56;
    goto LABEL_95;
  }
LABEL_94:
  *(_QWORD *)(v6 + 8) = self->_backendArticleVersionInt64;
  *(_QWORD *)(v6 + 432) |= 1uLL;
  v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x200000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v59 & 0x400000) == 0)
      goto LABEL_58;
    goto LABEL_57;
  }
LABEL_95:
  *(_DWORD *)(v6 + 288) = self->_muteButtonState;
  *(_QWORD *)(v6 + 432) |= 0x200000uLL;
  if ((*(_QWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_57:
    *(float *)(v6 + 312) = self->_osVolumeLevel;
    *(_QWORD *)(v6 + 432) |= 0x400000uLL;
  }
LABEL_58:
  v60 = -[NSString copyWithZone:](self->_iadNativeCampaign, "copyWithZone:", a3);
  v61 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v60;

  v62 = -[NSString copyWithZone:](self->_iadNativeLine, "copyWithZone:", a3);
  v63 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v62;

  v64 = -[NSString copyWithZone:](self->_iadNativeAd, "copyWithZone:", a3);
  v65 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v64;

  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    *(_QWORD *)(v6 + 64) = self->_previousArticlePublisherArticleVersion;
    *(_QWORD *)(v6 + 432) |= 0x80uLL;
  }
  v66 = -[NSString copyWithZone:](self->_iadNativeCampaignAd, "copyWithZone:", a3);
  v67 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v66;

  v68 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v69 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v68;

  v70 = -[NTPBAlternateHeadline copyWithZone:](self->_alternateHeadline, "copyWithZone:", a3);
  v71 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v70;

  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    *(_DWORD *)(v6 + 340) = self->_rankInVideoPlaylist;
    *(_QWORD *)(v6 + 432) |= 0x1000000uLL;
  }
  v72 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v73 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v72;

  v74 = -[NTPBIssueExposureData copyWithZone:](self->_issueExposureData, "copyWithZone:", a3);
  v75 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v74;

  v76 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v77 = *(void **)(v6 + 232);
  *(_QWORD *)(v6 + 232) = v76;

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v78 = self->_topicIds;
  v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v87;
    do
    {
      v82 = 0;
      do
      {
        if (*(_QWORD *)v87 != v81)
          objc_enumerationMutation(v78);
        v83 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v82), "copyWithZone:", a3, (_QWORD)v86);
        objc_msgSend((id)v6, "addTopicIds:", v83);

        ++v82;
      }
      while (v80 != v82);
      v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
    }
    while (v80);
  }

  v84 = (id)v6;
  return v84;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $16045DCADA8B3DB0231ED545073A6F77 has;
  uint64_t v6;
  NSString *mediaId;
  uint64_t v8;
  NSString *articleId;
  NSString *referencedArticleId;
  NSData *articleSessionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  $16045DCADA8B3DB0231ED545073A6F77 v14;
  uint64_t v15;
  NSString *feedId;
  uint64_t v17;
  NSData *feedViewExposureId;
  uint64_t v19;
  NSMutableArray *namedEntities;
  uint64_t v21;
  NSString *surfacedByChannelId;
  NSString *surfacedBySectionId;
  NSString *surfacedByTopicId;
  NSString *sectionHeadlineId;
  $16045DCADA8B3DB0231ED545073A6F77 v26;
  uint64_t v27;
  NSString *nativeCampaignData;
  NSString *metadata;
  NSString *previousArticleId;
  NSString *previousArticleVersion;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v33;
  NSString *groupFeedId;
  NSMutableArray *fractionalCohortMemberships;
  $16045DCADA8B3DB0231ED545073A6F77 v36;
  uint64_t v37;
  NSString *iadNativeCampaign;
  NSString *iadNativeLine;
  NSString *iadNativeAd;
  uint64_t v41;
  NSString *iadNativeCampaignAd;
  NSData *groupViewExposureId;
  NTPBAlternateHeadline *alternateHeadline;
  uint64_t v45;
  NTPBIssueData *issueData;
  NTPBIssueExposureData *issueExposureData;
  NTPBIssueViewData *issueViewData;
  NSMutableArray *topicIds;
  char v50;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_262;
  has = self->_has;
  v6 = *((_QWORD *)v4 + 54);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_mediaType != *((_DWORD *)v4 + 69))
      goto LABEL_262;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_262;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](mediaId, "isEqual:"))
      goto LABEL_262;
    has = self->_has;
  }
  v8 = *((_QWORD *)v4 + 54);
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_mediaTimePlayed != *((_QWORD *)v4 + 6))
      goto LABEL_262;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_262;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_262;
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:"))
      goto LABEL_262;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:"))
      goto LABEL_262;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_262;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 45))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_262;
  }
  v14 = self->_has;
  v15 = *((_QWORD *)v4 + 54);
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_mediaPlayMethod != *((_DWORD *)v4 + 67))
      goto LABEL_262;
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0 || self->_mediaPauseMethod != *((_DWORD *)v4 + 65))
      goto LABEL_262;
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_mediaPausePosition != *((_QWORD *)v4 + 3))
      goto LABEL_262;
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_BYTE *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_mediaResumeTimePlayed != *((_QWORD *)v4 + 5))
      goto LABEL_262;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_mediaResumeMethod != *((_DWORD *)v4 + 68))
      goto LABEL_262;
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_mediaResumePosition != *((_QWORD *)v4 + 4))
      goto LABEL_262;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    if ((v15 & 0x20000) == 0 || self->_mediaPlayLocation != *((_DWORD *)v4 + 66))
      goto LABEL_262;
  }
  else if ((v15 & 0x20000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0 || self->_feedType != *((_DWORD *)v4 + 34))
      goto LABEL_262;
  }
  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_262;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
      goto LABEL_262;
    v14 = self->_has;
  }
  v17 = *((_QWORD *)v4 + 54);
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
    if ((v17 & 0x800) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 31))
      goto LABEL_262;
  }
  else if ((v17 & 0x800) != 0)
  {
    goto LABEL_262;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_262;
    v14 = self->_has;
  }
  v19 = *((_QWORD *)v4 + 54);
  if ((*(_QWORD *)&v14 & 0x200000000) != 0)
  {
    if ((v19 & 0x200000000) == 0)
      goto LABEL_262;
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((_BYTE *)v4 + 429))
        goto LABEL_262;
    }
    else if (*((_BYTE *)v4 + 429))
    {
      goto LABEL_262;
    }
  }
  else if ((v19 & 0x200000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v19 & 0x200) == 0 || self->_articleType != *((_DWORD *)v4 + 26))
      goto LABEL_262;
  }
  else if ((v19 & 0x200) != 0)
  {
    goto LABEL_262;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((_QWORD *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:"))
      goto LABEL_262;
    v14 = self->_has;
  }
  v21 = *((_QWORD *)v4 + 54);
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    if ((v21 & 0x800000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 84))
      goto LABEL_262;
  }
  else if ((v21 & 0x800000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v21 & 0x400) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 30))
      goto LABEL_262;
  }
  else if ((v21 & 0x400) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    if ((v21 & 0x10000000) == 0)
      goto LABEL_262;
    if (self->_adSupportedChannel)
    {
      if (!*((_BYTE *)v4 + 424))
        goto LABEL_262;
    }
    else if (*((_BYTE *)v4 + 424))
    {
      goto LABEL_262;
    }
  }
  else if ((v21 & 0x10000000) != 0)
  {
    goto LABEL_262;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((_QWORD *)v4 + 46)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_262;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((_QWORD *)v4 + 47))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:"))
      goto LABEL_262;
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((_QWORD *)v4 + 48))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:"))
      goto LABEL_262;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:"))
      goto LABEL_262;
  }
  v26 = self->_has;
  v27 = *((_QWORD *)v4 + 54);
  if ((*(_DWORD *)&v26 & 0x40000000) != 0)
  {
    if ((v27 & 0x40000000) == 0)
      goto LABEL_262;
    if (self->_isDigitalReplicaAd)
    {
      if (!*((_BYTE *)v4 + 426))
        goto LABEL_262;
    }
    else if (*((_BYTE *)v4 + 426))
    {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x40000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v26 & 0x4000000) != 0)
  {
    if ((v27 & 0x4000000) == 0 || self->_userAction != *((_DWORD *)v4 + 102))
      goto LABEL_262;
  }
  else if ((v27 & 0x4000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_QWORD *)&v26 & 0x400000000) != 0)
  {
    if ((v27 & 0x400000000) == 0)
      goto LABEL_262;
    if (self->_isVideoInFeed)
    {
      if (!*((_BYTE *)v4 + 430))
        goto LABEL_262;
    }
    else if (*((_BYTE *)v4 + 430))
    {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x400000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_BYTE *)&v26 & 0x40) != 0)
  {
    if ((v27 & 0x40) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 7))
      goto LABEL_262;
  }
  else if ((v27 & 0x40) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v26 & 0x8000) != 0)
  {
    if ((v27 & 0x8000) == 0 || self->_mediaPauseLocation != *((_DWORD *)v4 + 64))
      goto LABEL_262;
  }
  else if ((v27 & 0x8000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_BYTE *)&v26 & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_mediaDuration != *((_QWORD *)v4 + 2))
      goto LABEL_262;
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v26 & 0x20000000) != 0)
  {
    if ((v27 & 0x20000000) == 0)
      goto LABEL_262;
    if (self->_isBreakingNewsArticle)
    {
      if (!*((_BYTE *)v4 + 425))
        goto LABEL_262;
    }
    else if (*((_BYTE *)v4 + 425))
    {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x20000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v26 & 0x4000) != 0)
  {
    if ((v27 & 0x4000) == 0 || self->_loadFailureReason != *((_DWORD *)v4 + 60))
      goto LABEL_262;
  }
  else if ((v27 & 0x4000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v26 & 0x2000000) != 0)
  {
    if ((v27 & 0x2000000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 98))
      goto LABEL_262;
  }
  else if ((v27 & 0x2000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_QWORD *)&v26 & 0x100000000) != 0)
  {
    if ((v27 & 0x100000000) == 0)
      goto LABEL_262;
    if (self->_isTopStoryArticle)
    {
      if (!*((_BYTE *)v4 + 428))
        goto LABEL_262;
    }
    else if (*((_BYTE *)v4 + 428))
    {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x100000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v26 & 0x80000000) != 0)
  {
    if ((v27 & 0x80000000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((_BYTE *)v4 + 427))
          goto LABEL_262;
        goto LABEL_188;
      }
      if (!*((_BYTE *)v4 + 427))
        goto LABEL_188;
    }
LABEL_262:
    v50 = 0;
    goto LABEL_263;
  }
  if ((v27 & 0x80000000) != 0)
    goto LABEL_262;
LABEL_188:
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((_QWORD *)v4 + 38)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_262;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](metadata, "isEqual:"))
      goto LABEL_262;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:"))
      goto LABEL_262;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((_QWORD *)v4 + 41))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:"))
      goto LABEL_262;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((_QWORD *)v4 + 52))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
      goto LABEL_262;
  }
  v33 = *((_QWORD *)v4 + 54);
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    if ((v33 & 0x2000) == 0 || self->_groupType != *((_DWORD *)v4 + 42))
      goto LABEL_262;
  }
  else if ((v33 & 0x2000) != 0)
  {
    goto LABEL_262;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((_QWORD *)v4 + 20)
    && !-[NSString isEqual:](groupFeedId, "isEqual:"))
  {
    goto LABEL_262;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
      goto LABEL_262;
  }
  v36 = self->_has;
  v37 = *((_QWORD *)v4 + 54);
  if ((*(_DWORD *)&v36 & 0x8000000) != 0)
  {
    if ((v37 & 0x8000000) == 0 || self->_videoType != *((_DWORD *)v4 + 103))
      goto LABEL_262;
  }
  else if ((v37 & 0x8000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v36 & 0x100) != 0)
  {
    if ((v37 & 0x100) == 0 || self->_publisherArticleVersionInt64 != *((_QWORD *)v4 + 9))
      goto LABEL_262;
  }
  else if ((v37 & 0x100) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_BYTE *)&v36 & 1) != 0)
  {
    if ((v37 & 1) == 0 || self->_backendArticleVersionInt64 != *((_QWORD *)v4 + 1))
      goto LABEL_262;
  }
  else if ((v37 & 1) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v36 & 0x200000) != 0)
  {
    if ((v37 & 0x200000) == 0 || self->_muteButtonState != *((_DWORD *)v4 + 72))
      goto LABEL_262;
  }
  else if ((v37 & 0x200000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v36 & 0x400000) != 0)
  {
    if ((v37 & 0x400000) == 0 || self->_osVolumeLevel != *((float *)v4 + 78))
      goto LABEL_262;
  }
  else if ((v37 & 0x400000) != 0)
  {
    goto LABEL_262;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((_QWORD *)v4 + 24)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_262;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:"))
      goto LABEL_262;
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:"))
      goto LABEL_262;
  }
  v41 = *((_QWORD *)v4 + 54);
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v41 & 0x80) == 0 || self->_previousArticlePublisherArticleVersion != *((_QWORD *)v4 + 8))
      goto LABEL_262;
  }
  else if ((v41 & 0x80) != 0)
  {
    goto LABEL_262;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((_QWORD *)v4 + 25)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_262;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 22))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:"))
      goto LABEL_262;
  }
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((_QWORD *)v4 + 10))
  {
    if (!-[NTPBAlternateHeadline isEqual:](alternateHeadline, "isEqual:"))
      goto LABEL_262;
  }
  v45 = *((_QWORD *)v4 + 54);
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
  {
    if ((v45 & 0x1000000) == 0 || self->_rankInVideoPlaylist != *((_DWORD *)v4 + 85))
      goto LABEL_262;
  }
  else if ((v45 & 0x1000000) != 0)
  {
    goto LABEL_262;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 27) && !-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    goto LABEL_262;
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((_QWORD *)v4 + 28))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:"))
      goto LABEL_262;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 29))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_262;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((_QWORD *)v4 + 50))
    v50 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  else
    v50 = 1;
LABEL_263:

  return v50;
}

- (unint64_t)hash
{
  $16045DCADA8B3DB0231ED545073A6F77 has;
  $16045DCADA8B3DB0231ED545073A6F77 v4;
  $16045DCADA8B3DB0231ED545073A6F77 v5;
  $16045DCADA8B3DB0231ED545073A6F77 v6;
  $16045DCADA8B3DB0231ED545073A6F77 v7;
  float osVolumeLevel;
  float v9;
  float v10;
  float v11;
  unint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  uint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSUInteger v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSUInteger v69;
  uint64_t v70;
  uint64_t v71;
  NSUInteger v72;
  NSUInteger v73;
  uint64_t v74;
  NSUInteger v75;
  uint64_t v76;

  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    v76 = 2654435761 * self->_mediaType;
  else
    v76 = 0;
  v75 = -[NSString hash](self->_mediaId, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v74 = 2654435761 * self->_mediaTimePlayed;
  else
    v74 = 0;
  v73 = -[NSString hash](self->_articleId, "hash");
  v72 = -[NSString hash](self->_referencedArticleId, "hash");
  v71 = -[NSData hash](self->_articleSessionId, "hash");
  v70 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v69 = -[NSString hash](self->_sourceChannelId, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v68 = 2654435761 * self->_mediaPlayMethod;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_9:
      v67 = 2654435761 * self->_mediaPauseMethod;
      if ((*(_BYTE *)&has & 4) != 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else
  {
    v68 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_9;
  }
  v67 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_10:
    v66 = 2654435761 * self->_mediaPausePosition;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  v66 = 0;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
LABEL_11:
    v65 = 2654435761 * self->_mediaResumeTimePlayed;
    if ((*(_DWORD *)&has & 0x80000) != 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  v65 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_12:
    v64 = 2654435761 * self->_mediaResumeMethod;
    if ((*(_BYTE *)&has & 8) != 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  v64 = 0;
  if ((*(_BYTE *)&has & 8) != 0)
  {
LABEL_13:
    v63 = 2654435761 * self->_mediaResumePosition;
    if ((*(_DWORD *)&has & 0x20000) != 0)
      goto LABEL_14;
LABEL_22:
    v62 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_21:
  v63 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0)
    goto LABEL_22;
LABEL_14:
  v62 = 2654435761 * self->_mediaPlayLocation;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_15:
    v61 = 2654435761 * self->_feedType;
    goto LABEL_24;
  }
LABEL_23:
  v61 = 0;
LABEL_24:
  v60 = -[NSString hash](self->_feedId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    v59 = 2654435761 * self->_feedCellSection;
  else
    v59 = 0;
  v58 = -[NSData hash](self->_feedViewExposureId, "hash");
  v4 = self->_has;
  if ((*(_QWORD *)&v4 & 0x200000000) != 0)
  {
    v57 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_29;
  }
  else
  {
    v57 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0)
    {
LABEL_29:
      v56 = 2654435761 * self->_articleType;
      goto LABEL_32;
    }
  }
  v56 = 0;
LABEL_32:
  v55 = -[NSMutableArray hash](self->_namedEntities, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) == 0)
  {
    v54 = 0;
    if ((*(_WORD *)&v5 & 0x400) != 0)
      goto LABEL_34;
LABEL_37:
    v53 = 0;
    if ((*(_DWORD *)&v5 & 0x10000000) != 0)
      goto LABEL_35;
    goto LABEL_38;
  }
  v54 = 2654435761 * self->_publisherArticleVersion;
  if ((*(_WORD *)&v5 & 0x400) == 0)
    goto LABEL_37;
LABEL_34:
  v53 = 2654435761 * self->_backendArticleVersion;
  if ((*(_DWORD *)&v5 & 0x10000000) != 0)
  {
LABEL_35:
    v52 = 2654435761 * self->_adSupportedChannel;
    goto LABEL_39;
  }
LABEL_38:
  v52 = 0;
LABEL_39:
  v51 = -[NSString hash](self->_surfacedByChannelId, "hash");
  v50 = -[NSString hash](self->_surfacedBySectionId, "hash");
  v49 = -[NSString hash](self->_surfacedByTopicId, "hash");
  v48 = -[NSString hash](self->_sectionHeadlineId, "hash");
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) != 0)
  {
    v47 = 2654435761 * self->_isDigitalReplicaAd;
    if ((*(_DWORD *)&v6 & 0x4000000) != 0)
    {
LABEL_41:
      v46 = 2654435761 * self->_userAction;
      if ((*(_QWORD *)&v6 & 0x400000000) != 0)
        goto LABEL_42;
      goto LABEL_53;
    }
  }
  else
  {
    v47 = 0;
    if ((*(_DWORD *)&v6 & 0x4000000) != 0)
      goto LABEL_41;
  }
  v46 = 0;
  if ((*(_QWORD *)&v6 & 0x400000000) != 0)
  {
LABEL_42:
    v45 = 2654435761 * self->_isVideoInFeed;
    if ((*(_BYTE *)&v6 & 0x40) != 0)
      goto LABEL_43;
    goto LABEL_54;
  }
LABEL_53:
  v45 = 0;
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
LABEL_43:
    v44 = 2654435761 * self->_personalizationTreatmentId;
    if ((*(_WORD *)&v6 & 0x8000) != 0)
      goto LABEL_44;
    goto LABEL_55;
  }
LABEL_54:
  v44 = 0;
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
LABEL_44:
    v43 = 2654435761 * self->_mediaPauseLocation;
    if ((*(_BYTE *)&v6 & 2) != 0)
      goto LABEL_45;
    goto LABEL_56;
  }
LABEL_55:
  v43 = 0;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
LABEL_45:
    v42 = 2654435761 * self->_mediaDuration;
    if ((*(_DWORD *)&v6 & 0x20000000) != 0)
      goto LABEL_46;
    goto LABEL_57;
  }
LABEL_56:
  v42 = 0;
  if ((*(_DWORD *)&v6 & 0x20000000) != 0)
  {
LABEL_46:
    v41 = 2654435761 * self->_isBreakingNewsArticle;
    if ((*(_WORD *)&v6 & 0x4000) != 0)
      goto LABEL_47;
    goto LABEL_58;
  }
LABEL_57:
  v41 = 0;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
LABEL_47:
    v40 = 2654435761 * self->_loadFailureReason;
    if ((*(_DWORD *)&v6 & 0x2000000) != 0)
      goto LABEL_48;
    goto LABEL_59;
  }
LABEL_58:
  v40 = 0;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
LABEL_48:
    v39 = 2654435761 * self->_topStoryType;
    if ((*(_QWORD *)&v6 & 0x100000000) != 0)
      goto LABEL_49;
LABEL_60:
    v38 = 0;
    if ((*(_DWORD *)&v6 & 0x80000000) != 0)
      goto LABEL_50;
    goto LABEL_61;
  }
LABEL_59:
  v39 = 0;
  if ((*(_QWORD *)&v6 & 0x100000000) == 0)
    goto LABEL_60;
LABEL_49:
  v38 = 2654435761 * self->_isTopStoryArticle;
  if ((*(_DWORD *)&v6 & 0x80000000) != 0)
  {
LABEL_50:
    v37 = 2654435761 * self->_isNativeAd;
    goto LABEL_62;
  }
LABEL_61:
  v37 = 0;
LABEL_62:
  v36 = -[NSString hash](self->_nativeCampaignData, "hash");
  v35 = -[NSString hash](self->_metadata, "hash");
  v34 = -[NSString hash](self->_previousArticleId, "hash");
  v33 = -[NSString hash](self->_previousArticleVersion, "hash");
  v32 = -[NTPBWidgetEngagement hash](self->_widgetEngagement, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    v31 = 2654435761 * self->_groupType;
  else
    v31 = 0;
  v30 = -[NSString hash](self->_groupFeedId, "hash");
  v29 = -[NSMutableArray hash](self->_fractionalCohortMemberships, "hash");
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x8000000) != 0)
  {
    v28 = 2654435761 * self->_videoType;
    if ((*(_WORD *)&v7 & 0x100) != 0)
    {
LABEL_67:
      v27 = 2654435761 * self->_publisherArticleVersionInt64;
      if ((*(_BYTE *)&v7 & 1) != 0)
        goto LABEL_68;
      goto LABEL_76;
    }
  }
  else
  {
    v28 = 0;
    if ((*(_WORD *)&v7 & 0x100) != 0)
      goto LABEL_67;
  }
  v27 = 0;
  if ((*(_BYTE *)&v7 & 1) != 0)
  {
LABEL_68:
    v26 = 2654435761 * self->_backendArticleVersionInt64;
    if ((*(_DWORD *)&v7 & 0x200000) != 0)
      goto LABEL_69;
LABEL_77:
    v25 = 0;
    if ((*(_DWORD *)&v7 & 0x400000) != 0)
      goto LABEL_70;
LABEL_78:
    v12 = 0;
    goto LABEL_81;
  }
LABEL_76:
  v26 = 0;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
    goto LABEL_77;
LABEL_69:
  v25 = 2654435761 * self->_muteButtonState;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
    goto LABEL_78;
LABEL_70:
  osVolumeLevel = self->_osVolumeLevel;
  v9 = -osVolumeLevel;
  if (osVolumeLevel >= 0.0)
    v9 = self->_osVolumeLevel;
  v10 = floorf(v9 + 0.5);
  v11 = (float)(v9 - v10) * 1.8447e19;
  v12 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabsf(v11);
  }
LABEL_81:
  v13 = -[NSString hash](self->_iadNativeCampaign, "hash");
  v14 = -[NSString hash](self->_iadNativeLine, "hash");
  v15 = -[NSString hash](self->_iadNativeAd, "hash");
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    v16 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  else
    v16 = 0;
  v17 = -[NSString hash](self->_iadNativeCampaignAd, "hash");
  v18 = -[NSData hash](self->_groupViewExposureId, "hash");
  v19 = -[NTPBAlternateHeadline hash](self->_alternateHeadline, "hash");
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    v20 = 2654435761 * self->_rankInVideoPlaylist;
  else
    v20 = 0;
  v21 = v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ -[NTPBIssueData hash](self->_issueData, "hash");
  v22 = v21 ^ -[NTPBIssueExposureData hash](self->_issueExposureData, "hash");
  v23 = v22 ^ -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  return v75 ^ v76 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v12 ^ v13 ^ v14 ^ v15 ^ v23 ^ -[NSMutableArray hash](self->_topicIds, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  NTPBWidgetEngagement *widgetEngagement;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  NTPBAlternateHeadline *alternateHeadline;
  uint64_t v24;
  NTPBIssueData *issueData;
  uint64_t v26;
  NTPBIssueExposureData *issueExposureData;
  uint64_t v28;
  NTPBIssueViewData *issueViewData;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
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
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 434) & 0x10) != 0)
  {
    self->_mediaType = v4[69];
    *(_QWORD *)&self->_has |= 0x100000uLL;
  }
  if (*((_QWORD *)v4 + 31))
    -[NTPBMediaEngage setMediaId:](self, "setMediaId:");
  if ((*((_BYTE *)v5 + 432) & 0x20) != 0)
  {
    self->_mediaTimePlayed = *((_QWORD *)v5 + 6);
    *(_QWORD *)&self->_has |= 0x20uLL;
  }
  if (*((_QWORD *)v5 + 11))
    -[NTPBMediaEngage setArticleId:](self, "setArticleId:");
  if (*((_QWORD *)v5 + 43))
    -[NTPBMediaEngage setReferencedArticleId:](self, "setReferencedArticleId:");
  if (*((_QWORD *)v5 + 12))
    -[NTPBMediaEngage setArticleSessionId:](self, "setArticleSessionId:");
  if (*((_QWORD *)v5 + 14))
    -[NTPBMediaEngage setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  if (*((_QWORD *)v5 + 45))
    -[NTPBMediaEngage setSourceChannelId:](self, "setSourceChannelId:");
  v6 = *((_QWORD *)v5 + 54);
  if ((v6 & 0x40000) != 0)
  {
    self->_mediaPlayMethod = *((_DWORD *)v5 + 67);
    *(_QWORD *)&self->_has |= 0x40000uLL;
    v6 = *((_QWORD *)v5 + 54);
    if ((v6 & 0x10000) == 0)
    {
LABEL_19:
      if ((v6 & 4) == 0)
        goto LABEL_20;
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x10000) == 0)
  {
    goto LABEL_19;
  }
  self->_mediaPauseMethod = *((_DWORD *)v5 + 65);
  *(_QWORD *)&self->_has |= 0x10000uLL;
  v6 = *((_QWORD *)v5 + 54);
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_81;
  }
LABEL_80:
  self->_mediaPausePosition = *((_QWORD *)v5 + 3);
  *(_QWORD *)&self->_has |= 4uLL;
  v6 = *((_QWORD *)v5 + 54);
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x80000) == 0)
      goto LABEL_22;
    goto LABEL_82;
  }
LABEL_81:
  self->_mediaResumeTimePlayed = *((_QWORD *)v5 + 5);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v6 = *((_QWORD *)v5 + 54);
  if ((v6 & 0x80000) == 0)
  {
LABEL_22:
    if ((v6 & 8) == 0)
      goto LABEL_23;
    goto LABEL_83;
  }
LABEL_82:
  self->_mediaResumeMethod = *((_DWORD *)v5 + 68);
  *(_QWORD *)&self->_has |= 0x80000uLL;
  v6 = *((_QWORD *)v5 + 54);
  if ((v6 & 8) == 0)
  {
LABEL_23:
    if ((v6 & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_84;
  }
LABEL_83:
  self->_mediaResumePosition = *((_QWORD *)v5 + 4);
  *(_QWORD *)&self->_has |= 8uLL;
  v6 = *((_QWORD *)v5 + 54);
  if ((v6 & 0x20000) == 0)
  {
LABEL_24:
    if ((v6 & 0x1000) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_84:
  self->_mediaPlayLocation = *((_DWORD *)v5 + 66);
  *(_QWORD *)&self->_has |= 0x20000uLL;
  if ((*((_QWORD *)v5 + 54) & 0x1000) != 0)
  {
LABEL_25:
    self->_feedType = *((_DWORD *)v5 + 34);
    *(_QWORD *)&self->_has |= 0x1000uLL;
  }
LABEL_26:
  if (*((_QWORD *)v5 + 16))
    -[NTPBMediaEngage setFeedId:](self, "setFeedId:");
  if ((*((_BYTE *)v5 + 433) & 8) != 0)
  {
    self->_feedCellSection = *((_DWORD *)v5 + 31);
    *(_QWORD *)&self->_has |= 0x800uLL;
  }
  if (*((_QWORD *)v5 + 18))
    -[NTPBMediaEngage setFeedViewExposureId:](self, "setFeedViewExposureId:");
  v7 = *((_QWORD *)v5 + 54);
  if ((v7 & 0x200000000) != 0)
  {
    self->_isUserSubscribedToFeed = *((_BYTE *)v5 + 429);
    *(_QWORD *)&self->_has |= 0x200000000uLL;
    v7 = *((_QWORD *)v5 + 54);
  }
  if ((v7 & 0x200) != 0)
  {
    self->_articleType = *((_DWORD *)v5 + 26);
    *(_QWORD *)&self->_has |= 0x200uLL;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = *((id *)v5 + 37);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        -[NTPBMediaEngage addNamedEntities:](self, "addNamedEntities:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v10);
  }

  v13 = *((_QWORD *)v5 + 54);
  if ((v13 & 0x800000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 84);
    *(_QWORD *)&self->_has |= 0x800000uLL;
    v13 = *((_QWORD *)v5 + 54);
    if ((v13 & 0x400) == 0)
    {
LABEL_45:
      if ((v13 & 0x10000000) == 0)
        goto LABEL_47;
      goto LABEL_46;
    }
  }
  else if ((v13 & 0x400) == 0)
  {
    goto LABEL_45;
  }
  self->_backendArticleVersion = *((_DWORD *)v5 + 30);
  *(_QWORD *)&self->_has |= 0x400uLL;
  if ((*((_QWORD *)v5 + 54) & 0x10000000) != 0)
  {
LABEL_46:
    self->_adSupportedChannel = *((_BYTE *)v5 + 424);
    *(_QWORD *)&self->_has |= 0x10000000uLL;
  }
LABEL_47:
  if (*((_QWORD *)v5 + 46))
    -[NTPBMediaEngage setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  if (*((_QWORD *)v5 + 47))
    -[NTPBMediaEngage setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  if (*((_QWORD *)v5 + 48))
    -[NTPBMediaEngage setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  if (*((_QWORD *)v5 + 44))
    -[NTPBMediaEngage setSectionHeadlineId:](self, "setSectionHeadlineId:");
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 0x40000000) != 0)
  {
    self->_isDigitalReplicaAd = *((_BYTE *)v5 + 426);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
    v14 = *((_QWORD *)v5 + 54);
    if ((v14 & 0x4000000) == 0)
    {
LABEL_57:
      if ((v14 & 0x400000000) == 0)
        goto LABEL_58;
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x4000000) == 0)
  {
    goto LABEL_57;
  }
  self->_userAction = *((_DWORD *)v5 + 102);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 0x400000000) == 0)
  {
LABEL_58:
    if ((v14 & 0x40) == 0)
      goto LABEL_59;
    goto LABEL_92;
  }
LABEL_91:
  self->_isVideoInFeed = *((_BYTE *)v5 + 430);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 0x40) == 0)
  {
LABEL_59:
    if ((v14 & 0x8000) == 0)
      goto LABEL_60;
    goto LABEL_93;
  }
LABEL_92:
  self->_personalizationTreatmentId = *((_QWORD *)v5 + 7);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 0x8000) == 0)
  {
LABEL_60:
    if ((v14 & 2) == 0)
      goto LABEL_61;
    goto LABEL_94;
  }
LABEL_93:
  self->_mediaPauseLocation = *((_DWORD *)v5 + 64);
  *(_QWORD *)&self->_has |= 0x8000uLL;
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 2) == 0)
  {
LABEL_61:
    if ((v14 & 0x20000000) == 0)
      goto LABEL_62;
    goto LABEL_95;
  }
LABEL_94:
  self->_mediaDuration = *((_QWORD *)v5 + 2);
  *(_QWORD *)&self->_has |= 2uLL;
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 0x20000000) == 0)
  {
LABEL_62:
    if ((v14 & 0x4000) == 0)
      goto LABEL_63;
    goto LABEL_96;
  }
LABEL_95:
  self->_isBreakingNewsArticle = *((_BYTE *)v5 + 425);
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 0x4000) == 0)
  {
LABEL_63:
    if ((v14 & 0x2000000) == 0)
      goto LABEL_64;
    goto LABEL_97;
  }
LABEL_96:
  self->_loadFailureReason = *((_DWORD *)v5 + 60);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 0x2000000) == 0)
  {
LABEL_64:
    if ((v14 & 0x100000000) == 0)
      goto LABEL_65;
    goto LABEL_98;
  }
LABEL_97:
  self->_topStoryType = *((_DWORD *)v5 + 98);
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  v14 = *((_QWORD *)v5 + 54);
  if ((v14 & 0x100000000) == 0)
  {
LABEL_65:
    if ((v14 & 0x80000000) == 0)
      goto LABEL_67;
    goto LABEL_66;
  }
LABEL_98:
  self->_isTopStoryArticle = *((_BYTE *)v5 + 428);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  if ((*((_QWORD *)v5 + 54) & 0x80000000) != 0)
  {
LABEL_66:
    self->_isNativeAd = *((_BYTE *)v5 + 427);
    *(_QWORD *)&self->_has |= 0x80000000uLL;
  }
LABEL_67:
  if (*((_QWORD *)v5 + 38))
    -[NTPBMediaEngage setNativeCampaignData:](self, "setNativeCampaignData:");
  if (*((_QWORD *)v5 + 35))
    -[NTPBMediaEngage setMetadata:](self, "setMetadata:");
  if (*((_QWORD *)v5 + 40))
    -[NTPBMediaEngage setPreviousArticleId:](self, "setPreviousArticleId:");
  if (*((_QWORD *)v5 + 41))
    -[NTPBMediaEngage setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  widgetEngagement = self->_widgetEngagement;
  v16 = *((_QWORD *)v5 + 52);
  if (widgetEngagement)
  {
    if (v16)
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
  }
  else if (v16)
  {
    -[NTPBMediaEngage setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  if ((*((_BYTE *)v5 + 433) & 0x20) != 0)
  {
    self->_groupType = *((_DWORD *)v5 + 42);
    *(_QWORD *)&self->_has |= 0x2000uLL;
  }
  if (*((_QWORD *)v5 + 20))
    -[NTPBMediaEngage setGroupFeedId:](self, "setGroupFeedId:");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = *((id *)v5 + 19);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        -[NTPBMediaEngage addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v19);
  }

  v22 = *((_QWORD *)v5 + 54);
  if ((v22 & 0x8000000) != 0)
  {
    self->_videoType = *((_DWORD *)v5 + 103);
    *(_QWORD *)&self->_has |= 0x8000000uLL;
    v22 = *((_QWORD *)v5 + 54);
    if ((v22 & 0x100) == 0)
    {
LABEL_115:
      if ((v22 & 1) == 0)
        goto LABEL_116;
      goto LABEL_136;
    }
  }
  else if ((v22 & 0x100) == 0)
  {
    goto LABEL_115;
  }
  self->_publisherArticleVersionInt64 = *((_QWORD *)v5 + 9);
  *(_QWORD *)&self->_has |= 0x100uLL;
  v22 = *((_QWORD *)v5 + 54);
  if ((v22 & 1) == 0)
  {
LABEL_116:
    if ((v22 & 0x200000) == 0)
      goto LABEL_117;
    goto LABEL_137;
  }
LABEL_136:
  self->_backendArticleVersionInt64 = *((_QWORD *)v5 + 1);
  *(_QWORD *)&self->_has |= 1uLL;
  v22 = *((_QWORD *)v5 + 54);
  if ((v22 & 0x200000) == 0)
  {
LABEL_117:
    if ((v22 & 0x400000) == 0)
      goto LABEL_119;
    goto LABEL_118;
  }
LABEL_137:
  self->_muteButtonState = *((_DWORD *)v5 + 72);
  *(_QWORD *)&self->_has |= 0x200000uLL;
  if ((*((_QWORD *)v5 + 54) & 0x400000) != 0)
  {
LABEL_118:
    self->_osVolumeLevel = *((float *)v5 + 78);
    *(_QWORD *)&self->_has |= 0x400000uLL;
  }
LABEL_119:
  if (*((_QWORD *)v5 + 24))
    -[NTPBMediaEngage setIadNativeCampaign:](self, "setIadNativeCampaign:");
  if (*((_QWORD *)v5 + 26))
    -[NTPBMediaEngage setIadNativeLine:](self, "setIadNativeLine:");
  if (*((_QWORD *)v5 + 23))
    -[NTPBMediaEngage setIadNativeAd:](self, "setIadNativeAd:");
  if ((*((_BYTE *)v5 + 432) & 0x80) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((_QWORD *)v5 + 8);
    *(_QWORD *)&self->_has |= 0x80uLL;
  }
  if (*((_QWORD *)v5 + 25))
    -[NTPBMediaEngage setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  if (*((_QWORD *)v5 + 22))
    -[NTPBMediaEngage setGroupViewExposureId:](self, "setGroupViewExposureId:");
  alternateHeadline = self->_alternateHeadline;
  v24 = *((_QWORD *)v5 + 10);
  if (alternateHeadline)
  {
    if (v24)
      -[NTPBAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
  }
  else if (v24)
  {
    -[NTPBMediaEngage setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  if ((*((_BYTE *)v5 + 435) & 1) != 0)
  {
    self->_rankInVideoPlaylist = *((_DWORD *)v5 + 85);
    *(_QWORD *)&self->_has |= 0x1000000uLL;
  }
  issueData = self->_issueData;
  v26 = *((_QWORD *)v5 + 27);
  if (issueData)
  {
    if (v26)
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else if (v26)
  {
    -[NTPBMediaEngage setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  v28 = *((_QWORD *)v5 + 28);
  if (issueExposureData)
  {
    if (v28)
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else if (v28)
  {
    -[NTPBMediaEngage setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  v30 = *((_QWORD *)v5 + 29);
  if (issueViewData)
  {
    if (v30)
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else if (v30)
  {
    -[NTPBMediaEngage setIssueViewData:](self, "setIssueViewData:");
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = *((id *)v5 + 50);
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(v31);
        -[NTPBMediaEngage addTopicIds:](self, "addTopicIds:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k), (_QWORD)v36);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v33);
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

- (int64_t)mediaTimePlayed
{
  return self->_mediaTimePlayed;
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

- (int64_t)mediaPausePosition
{
  return self->_mediaPausePosition;
}

- (int64_t)mediaResumeTimePlayed
{
  return self->_mediaResumeTimePlayed;
}

- (int64_t)mediaResumePosition
{
  return self->_mediaResumePosition;
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

- (int64_t)mediaDuration
{
  return self->_mediaDuration;
}

- (BOOL)isBreakingNewsArticle
{
  return self->_isBreakingNewsArticle;
}

- (BOOL)isTopStoryArticle
{
  return self->_isTopStoryArticle;
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

- (float)osVolumeLevel
{
  return self->_osVolumeLevel;
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
