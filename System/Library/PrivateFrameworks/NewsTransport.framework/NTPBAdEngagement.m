@implementation NTPBAdEngagement

- (BOOL)hasIadCampaign
{
  return self->_iadCampaign != 0;
}

- (BOOL)hasIadLine
{
  return self->_iadLine != 0;
}

- (BOOL)hasIadAd
{
  return self->_iadAd != 0;
}

- (int)adEngagementType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_adEngagementType;
  else
    return 0;
}

- (void)setAdEngagementType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_adEngagementType = a3;
}

- (void)setHasAdEngagementType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAdEngagementType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)adEngagementTypeAsString:(int)a3
{
  if (a3 < 6)
    return *(&off_24CD538D8 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAdEngagementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AD_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_AD_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_AD_VIEW_AD_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_AD_SKIP_AD_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CTA_BUTTON_TAP_AD_ENGAGEMENT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_AD_PAUSE_AD_ENGAGEMENT_TYPE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)adType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_adType;
  else
    return 0;
}

- (void)setAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_adType = a3;
}

- (void)setHasAdType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAdType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)adTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN_AD_TYPE");
  if (a3 == 1)
  {
    v3 = CFSTR("NON_NATIVE_AD_TYPE");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAdType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AD_TYPE")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NON_NATIVE_AD_TYPE"));

  return v4;
}

- (int)adCreativeType
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_adCreativeType;
  else
    return 0;
}

- (void)setAdCreativeType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_adCreativeType = a3;
}

- (void)setHasAdCreativeType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAdCreativeType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)adCreativeTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_24CD53908 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAdCreativeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AD_CREATIVE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BANNER_AD_CREATIVE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_AD_CREATIVE_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTERSTITIAL_AD_CREATIVE_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)adLocation
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_adLocation;
  else
    return 0;
}

- (void)setAdLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_adLocation = a3;
}

- (void)setHasAdLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAdLocation
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)adLocationAsString:(int)a3
{
  if (a3 < 6)
    return *(&off_24CD53928 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAdLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_AD_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEED_AD_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARTICLE_AD_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GALLERY_AD_LOCATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_AD_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_IN_APP_AD_LOCATION")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)newsProductType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_newsProductType;
  else
    return 0;
}

- (void)setNewsProductType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_newsProductType = a3;
}

- (void)setHasNewsProductType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNewsProductType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)newsProductTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD53958 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNewsProductType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NEWS_PRODUCT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_APP_NEWS_PRODUCT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TODAY_WIDGET_NEWS_PRODUCT_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)videoAdType
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_videoAdType;
  else
    return 0;
}

- (void)setVideoAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_videoAdType = a3;
}

- (void)setHasVideoAdType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVideoAdType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)videoAdTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD53970 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVideoAdType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_VIDEO_AD_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRE_ROLL_VIDEO_AD_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NON_PRE_ROLL_VIDEO_AD_TYPE")))
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
    return *(&off_24CD53988 + a3);
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

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (void)setVideoAdDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_videoAdDuration = a3;
}

- (void)setHasVideoAdDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasVideoAdDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setVideoAdPlayTime:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_videoAdPlayTime = a3;
}

- (void)setHasVideoAdPlayTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasVideoAdPlayTime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setVideoAdPlacementPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_videoAdPlacementPosition = a3;
}

- (void)setHasVideoAdPlacementPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVideoAdPlacementPosition
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setVideoAdViewComplete:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_videoAdViewComplete = a3;
}

- (void)setHasVideoAdViewComplete:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasVideoAdViewComplete
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasAdImpressionId
{
  return self->_adImpressionId != 0;
}

- (void)setAdImpressionTimeThreshold:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_adImpressionTimeThreshold = a3;
}

- (void)setHasAdImpressionTimeThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAdImpressionTimeThreshold
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasGroupType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return *(&off_24CD53A38 + a3);
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

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
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
  v8.super_class = (Class)NTPBAdEngagement;
  -[NTPBAdEngagement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAdEngagement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *iadCampaign;
  NSString *iadLine;
  NSString *iadAd;
  __int16 has;
  uint64_t adEngagementType;
  void *v10;
  int adType;
  __CFString *v12;
  uint64_t adCreativeType;
  void *v14;
  uint64_t adLocation;
  void *v16;
  uint64_t newsProductType;
  void *v18;
  uint64_t videoAdType;
  void *v20;
  uint64_t feedType;
  void *v22;
  NSString *feedId;
  NSString *articleId;
  __int16 v25;
  void *v26;
  NSString *adImpressionId;
  void *v28;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  NSData *feedViewExposureId;
  uint64_t groupType;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSData *groupViewExposureId;
  id v38;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  iadCampaign = self->_iadCampaign;
  if (iadCampaign)
    objc_msgSend(v3, "setObject:forKey:", iadCampaign, CFSTR("iad_campaign"));
  iadLine = self->_iadLine;
  if (iadLine)
    objc_msgSend(v4, "setObject:forKey:", iadLine, CFSTR("iad_line"));
  iadAd = self->_iadAd;
  if (iadAd)
    objc_msgSend(v4, "setObject:forKey:", iadAd, CFSTR("iad_ad"));
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    adEngagementType = self->_adEngagementType;
    if (adEngagementType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adEngagementType);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_24CD538D8 + adEngagementType);
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("ad_engagement_type"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_25;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  adType = self->_adType;
  if (adType)
  {
    if (adType == 1)
    {
      v12 = CFSTR("NON_NATIVE_AD_TYPE");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = CFSTR("UNKNOWN_AD_TYPE");
  }
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("ad_type"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_29;
  }
LABEL_25:
  adCreativeType = self->_adCreativeType;
  if (adCreativeType >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adCreativeType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = *(&off_24CD53908 + adCreativeType);
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("ad_creative_type"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_29:
  adLocation = self->_adLocation;
  if (adLocation >= 6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adLocation);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = *(&off_24CD53928 + adLocation);
  }
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("ad_location"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_33:
  newsProductType = self->_newsProductType;
  if (newsProductType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_newsProductType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = *(&off_24CD53958 + newsProductType);
  }
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("news_product_type"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_45;
    goto LABEL_41;
  }
LABEL_37:
  videoAdType = self->_videoAdType;
  if (videoAdType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_videoAdType);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = *(&off_24CD53970 + videoAdType);
  }
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("video_ad_type"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_41:
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_24CD53988 + feedType);
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("feed_type"));

  }
LABEL_45:
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v4, "setObject:forKey:", feedId, CFSTR("feed_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v4, "setObject:forKey:", articleId, CFSTR("article_id"));
  v25 = (__int16)self->_has;
  if ((v25 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_videoAdDuration);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("video_ad_duration"));

    v25 = (__int16)self->_has;
    if ((v25 & 2) == 0)
    {
LABEL_51:
      if ((v25 & 0x400) == 0)
        goto LABEL_52;
      goto LABEL_69;
    }
  }
  else if ((v25 & 2) == 0)
  {
    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_videoAdPlayTime);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("video_ad_play_time"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x400) == 0)
  {
LABEL_52:
    if ((v25 & 0x1000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_videoAdPlacementPosition);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("video_ad_placement_position"));

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_53:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_videoAdViewComplete);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("video_ad_view_complete"));

  }
LABEL_54:
  adImpressionId = self->_adImpressionId;
  if (adImpressionId)
    objc_msgSend(v4, "setObject:forKey:", adImpressionId, CFSTR("ad_impression_id"));
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_adImpressionTimeThreshold);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("ad_impression_time_threshold"));

  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v4, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v4, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = *(&off_24CD53A38 + groupType);
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("group_type"));

  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  v38 = v4;

  return v38;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdEngagementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_iadCampaign)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_iadLine)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_iadAd)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_41;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_15:
  if (self->_feedId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_21:
      if ((v6 & 0x400) == 0)
        goto LABEL_22;
      goto LABEL_48;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_48:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_23:
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
LABEL_24:
  if (self->_adImpressionId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
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
  __int16 has;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_iadCampaign, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v6;

  v8 = -[NSString copyWithZone:](self->_iadLine, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v8;

  v10 = -[NSString copyWithZone:](self->_iadAd, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v10;

  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_adEngagementType;
    *(_WORD *)(v5 + 164) |= 8u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_adType;
  *(_WORD *)(v5 + 164) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 24) = self->_adCreativeType;
  *(_WORD *)(v5 + 164) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 44) = self->_adLocation;
  *(_WORD *)(v5 + 164) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 136) = self->_newsProductType;
  *(_WORD *)(v5 + 164) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_24:
  *(_DWORD *)(v5 + 156) = self->_videoAdType;
  *(_WORD *)(v5 + 164) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 80) = self->_feedType;
    *(_WORD *)(v5 + 164) |= 0x80u;
  }
LABEL_9:
  v13 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_videoAdDuration;
    *(_WORD *)(v5 + 164) |= 1u;
    v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_11:
      if ((v17 & 0x400) == 0)
        goto LABEL_12;
      goto LABEL_28;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_11;
  }
  *(_QWORD *)(v5 + 16) = self->_videoAdPlayTime;
  *(_WORD *)(v5 + 164) |= 2u;
  v17 = (__int16)self->_has;
  if ((v17 & 0x400) == 0)
  {
LABEL_12:
    if ((v17 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_28:
  *(_DWORD *)(v5 + 152) = self->_videoAdPlacementPosition;
  *(_WORD *)(v5 + 164) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    *(_BYTE *)(v5 + 160) = self->_videoAdViewComplete;
    *(_WORD *)(v5 + 164) |= 0x1000u;
  }
LABEL_14:
  v18 = -[NSString copyWithZone:](self->_adImpressionId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v18;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_adImpressionTimeThreshold;
    *(_WORD *)(v5 + 164) |= 0x10u;
  }
  v20 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  v22 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v22;

  v24 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v24;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_groupType;
    *(_WORD *)(v5 + 164) |= 0x100u;
  }
  v26 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v26;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *iadCampaign;
  NSString *iadLine;
  NSString *iadAd;
  __int16 has;
  __int16 v9;
  NSString *feedId;
  NSString *articleId;
  __int16 v12;
  __int16 v13;
  NSString *adImpressionId;
  __int16 v15;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  NSData *feedViewExposureId;
  NSData *groupViewExposureId;
  char v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_91;
  iadCampaign = self->_iadCampaign;
  if ((unint64_t)iadCampaign | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](iadCampaign, "isEqual:"))
      goto LABEL_91;
  }
  iadLine = self->_iadLine;
  if ((unint64_t)iadLine | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](iadLine, "isEqual:"))
      goto LABEL_91;
  }
  iadAd = self->_iadAd;
  if ((unint64_t)iadAd | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](iadAd, "isEqual:"))
      goto LABEL_91;
  }
  has = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 82);
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_adEngagementType != *((_DWORD *)v4 + 7))
      goto LABEL_91;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_adType != *((_DWORD *)v4 + 12))
      goto LABEL_91;
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_adCreativeType != *((_DWORD *)v4 + 6))
      goto LABEL_91;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_adLocation != *((_DWORD *)v4 + 11))
      goto LABEL_91;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x200) == 0 || self->_newsProductType != *((_DWORD *)v4 + 34))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 82) & 0x200) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x800) == 0 || self->_videoAdType != *((_DWORD *)v4 + 39))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 82) & 0x800) != 0)
  {
    goto LABEL_91;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_feedType != *((_DWORD *)v4 + 20))
      goto LABEL_91;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_91;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](feedId, "isEqual:"))
    goto LABEL_91;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_91;
  }
  v12 = (__int16)self->_has;
  v13 = *((_WORD *)v4 + 82);
  if ((v12 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_videoAdDuration != *((_QWORD *)v4 + 1))
      goto LABEL_91;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_91;
  }
  if ((v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_videoAdPlayTime != *((_QWORD *)v4 + 2))
      goto LABEL_91;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x400) == 0 || self->_videoAdPlacementPosition != *((_DWORD *)v4 + 38))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 82) & 0x400) != 0)
  {
    goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x1000) == 0)
      goto LABEL_91;
    if (self->_videoAdViewComplete)
    {
      if (!*((_BYTE *)v4 + 160))
        goto LABEL_91;
    }
    else if (*((_BYTE *)v4 + 160))
    {
      goto LABEL_91;
    }
  }
  else if ((*((_WORD *)v4 + 82) & 0x1000) != 0)
  {
    goto LABEL_91;
  }
  adImpressionId = self->_adImpressionId;
  if (!((unint64_t)adImpressionId | *((_QWORD *)v4 + 4)))
    goto LABEL_73;
  if (!-[NSString isEqual:](adImpressionId, "isEqual:"))
  {
LABEL_91:
    v20 = 0;
    goto LABEL_92;
  }
  v12 = (__int16)self->_has;
LABEL_73:
  v15 = *((_WORD *)v4 + 82);
  if ((v12 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_adImpressionTimeThreshold != *((_DWORD *)v4 + 10))
      goto LABEL_91;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_91;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 8)
    && !-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
  {
    goto LABEL_91;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_91;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_91;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 82) & 0x100) == 0 || self->_groupType != *((_DWORD *)v4 + 24))
      goto LABEL_91;
  }
  else if ((*((_WORD *)v4 + 82) & 0x100) != 0)
  {
    goto LABEL_91;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 13))
    v20 = -[NSData isEqual:](groupViewExposureId, "isEqual:");
  else
    v20 = 1;
LABEL_92:

  return v20;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;

  v27 = -[NSString hash](self->_iadCampaign, "hash");
  v26 = -[NSString hash](self->_iadLine, "hash");
  v25 = -[NSString hash](self->_iadAd, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v24 = 2654435761 * self->_adEngagementType;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v23 = 2654435761 * self->_adType;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v24 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v22 = 2654435761 * self->_adCreativeType;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v22 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v21 = 2654435761 * self->_adLocation;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    v20 = 2654435761 * self->_newsProductType;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_7;
LABEL_14:
    v19 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v20 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_14;
LABEL_7:
  v19 = 2654435761 * self->_videoAdType;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v18 = 2654435761 * self->_feedType;
    goto LABEL_16;
  }
LABEL_15:
  v18 = 0;
LABEL_16:
  v17 = -[NSString hash](self->_feedId, "hash");
  v16 = -[NSString hash](self->_articleId, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 1) != 0)
  {
    v15 = 2654435761 * self->_videoAdDuration;
    if ((v4 & 2) != 0)
    {
LABEL_18:
      v5 = 2654435761 * self->_videoAdPlayTime;
      if ((*(_WORD *)&self->_has & 0x400) != 0)
        goto LABEL_19;
LABEL_23:
      v6 = 0;
      if ((*(_WORD *)&self->_has & 0x1000) != 0)
        goto LABEL_20;
      goto LABEL_24;
    }
  }
  else
  {
    v15 = 0;
    if ((v4 & 2) != 0)
      goto LABEL_18;
  }
  v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_23;
LABEL_19:
  v6 = 2654435761 * self->_videoAdPlacementPosition;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_20:
    v7 = 2654435761 * self->_videoAdViewComplete;
    goto LABEL_25;
  }
LABEL_24:
  v7 = 0;
LABEL_25:
  v8 = -[NSString hash](self->_adImpressionId, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    v9 = 2654435761 * self->_adImpressionTimeThreshold;
  else
    v9 = 0;
  v10 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v11 = -[NSString hash](self->_sourceChannelId, "hash");
  v12 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v13 = 2654435761 * self->_groupType;
  else
    v13 = 0;
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSData hash](self->_groupViewExposureId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 15))
  {
    -[NTPBAdEngagement setIadCampaign:](self, "setIadCampaign:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[NTPBAdEngagement setIadLine:](self, "setIadLine:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[NTPBAdEngagement setIadAd:](self, "setIadAd:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 82);
  if ((v5 & 8) != 0)
  {
    self->_adEngagementType = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 8u;
    v5 = *((_WORD *)v4 + 82);
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        goto LABEL_10;
      goto LABEL_41;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_adType = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 82);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  self->_adCreativeType = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  self->_adLocation = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_44;
  }
LABEL_43:
  self->_newsProductType = *((_DWORD *)v4 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 82);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_44:
  self->_videoAdType = *((_DWORD *)v4 + 39);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 82) & 0x80) != 0)
  {
LABEL_14:
    self->_feedType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBAdEngagement setFeedId:](self, "setFeedId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBAdEngagement setArticleId:](self, "setArticleId:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 82);
  if ((v6 & 1) != 0)
  {
    self->_videoAdDuration = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 82);
    if ((v6 & 2) == 0)
    {
LABEL_21:
      if ((v6 & 0x400) == 0)
        goto LABEL_22;
      goto LABEL_48;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_21;
  }
  self->_videoAdPlayTime = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 82);
  if ((v6 & 0x400) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_48:
  self->_videoAdPlacementPosition = *((_DWORD *)v4 + 38);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 82) & 0x1000) != 0)
  {
LABEL_23:
    self->_videoAdViewComplete = *((_BYTE *)v4 + 160);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_24:
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBAdEngagement setAdImpressionId:](self, "setAdImpressionId:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 82) & 0x10) != 0)
  {
    self->_adImpressionTimeThreshold = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[NTPBAdEngagement setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[NTPBAdEngagement setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[NTPBAdEngagement setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 82) & 0x100) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[NTPBAdEngagement setGroupViewExposureId:](self, "setGroupViewExposureId:");
    v4 = v7;
  }

}

- (NSString)iadCampaign
{
  return self->_iadCampaign;
}

- (void)setIadCampaign:(id)a3
{
  objc_storeStrong((id *)&self->_iadCampaign, a3);
}

- (NSString)iadLine
{
  return self->_iadLine;
}

- (void)setIadLine:(id)a3
{
  objc_storeStrong((id *)&self->_iadLine, a3);
}

- (NSString)iadAd
{
  return self->_iadAd;
}

- (void)setIadAd:(id)a3
{
  objc_storeStrong((id *)&self->_iadAd, a3);
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
  objc_storeStrong((id *)&self->_feedId, a3);
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (int64_t)videoAdDuration
{
  return self->_videoAdDuration;
}

- (int64_t)videoAdPlayTime
{
  return self->_videoAdPlayTime;
}

- (int)videoAdPlacementPosition
{
  return self->_videoAdPlacementPosition;
}

- (BOOL)videoAdViewComplete
{
  return self->_videoAdViewComplete;
}

- (NSString)adImpressionId
{
  return self->_adImpressionId;
}

- (void)setAdImpressionId:(id)a3
{
  objc_storeStrong((id *)&self->_adImpressionId, a3);
}

- (int)adImpressionTimeThreshold
{
  return self->_adImpressionTimeThreshold;
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

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_groupViewExposureId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_iadLine, 0);
  objc_storeStrong((id *)&self->_iadCampaign, 0);
  objc_storeStrong((id *)&self->_iadAd, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
  objc_storeStrong((id *)&self->_adImpressionId, 0);
}

@end
