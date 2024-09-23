@implementation NTPBAdImpression

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

- (int)adType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_adType;
  else
    return 0;
}

- (void)setAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_adType = a3;
}

- (void)setHasAdType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAdType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_adCreativeType;
  else
    return 0;
}

- (void)setAdCreativeType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_adCreativeType = a3;
}

- (void)setHasAdCreativeType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAdCreativeType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)adCreativeTypeAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_24CD53BB0 + a3);
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
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_adLocation;
  else
    return 0;
}

- (void)setAdLocation:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_adLocation = a3;
}

- (void)setHasAdLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAdLocation
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)adLocationAsString:(int)a3
{
  if (a3 < 6)
    return *(&off_24CD53BD0 + a3);
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
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_newsProductType;
  else
    return 0;
}

- (void)setNewsProductType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_newsProductType = a3;
}

- (void)setHasNewsProductType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNewsProductType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)newsProductTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD53C00 + a3);
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
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    return self->_videoAdType;
  else
    return 0;
}

- (void)setVideoAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_videoAdType = a3;
}

- (void)setHasVideoAdType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVideoAdType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)videoAdTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD53C18 + a3);
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
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return *(&off_24CD53C30 + a3);
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

- (void)setVideoAdPlacementPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_videoAdPlacementPosition = a3;
}

- (void)setHasVideoAdPlacementPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasVideoAdPlacementPosition
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasAdImpressionId
{
  return self->_adImpressionId != 0;
}

- (void)setAdImpressionTimeThreshold:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_adImpressionTimeThreshold = a3;
}

- (void)setHasAdImpressionTimeThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAdImpressionTimeThreshold
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_groupType;
  else
    return 0;
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 < 0x28)
    return *(&off_24CD53CE0 + a3);
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

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
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
  v8.super_class = (Class)NTPBAdImpression;
  -[NTPBAdImpression description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAdImpression dictionaryRepresentation](self, "dictionaryRepresentation");
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
  int adType;
  __CFString *v10;
  uint64_t adCreativeType;
  void *v12;
  uint64_t adLocation;
  void *v14;
  uint64_t newsProductType;
  void *v16;
  uint64_t videoAdType;
  void *v18;
  uint64_t feedType;
  void *v20;
  NSString *feedId;
  NSString *articleId;
  __int16 v23;
  void *v24;
  void *v25;
  NSString *adImpressionId;
  void *v27;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  NSData *feedViewExposureId;
  uint64_t groupType;
  void *v32;
  NSData *groupViewExposureId;
  NSString *previousArticleId;
  id v35;

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
  if ((has & 0x10) != 0)
  {
    adType = self->_adType;
    if (adType)
    {
      if (adType == 1)
      {
        v10 = CFSTR("NON_NATIVE_AD_TYPE");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adType);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("UNKNOWN_AD_TYPE");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("ad_type"));

    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_9;
  }
  adCreativeType = self->_adCreativeType;
  if (adCreativeType >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adCreativeType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = *(&off_24CD53BB0 + adCreativeType);
  }
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("ad_creative_type"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_24:
  adLocation = self->_adLocation;
  if (adLocation >= 6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adLocation);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = *(&off_24CD53BD0 + adLocation);
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("ad_location"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_28:
  newsProductType = self->_newsProductType;
  if (newsProductType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_newsProductType);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = *(&off_24CD53C00 + newsProductType);
  }
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("news_product_type"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_40;
    goto LABEL_36;
  }
LABEL_32:
  videoAdType = self->_videoAdType;
  if (videoAdType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_videoAdType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = *(&off_24CD53C18 + videoAdType);
  }
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("video_ad_type"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_36:
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = *(&off_24CD53C30 + feedType);
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("feed_type"));

  }
LABEL_40:
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v4, "setObject:forKey:", feedId, CFSTR("feed_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v4, "setObject:forKey:", articleId, CFSTR("article_id"));
  v23 = (__int16)self->_has;
  if ((v23 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_videoAdDuration);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("video_ad_duration"));

    v23 = (__int16)self->_has;
  }
  if ((v23 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_videoAdPlacementPosition);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("video_ad_placement_position"));

  }
  adImpressionId = self->_adImpressionId;
  if (adImpressionId)
    objc_msgSend(v4, "setObject:forKey:", adImpressionId, CFSTR("ad_impression_id"));
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_adImpressionTimeThreshold);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("ad_impression_time_threshold"));

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
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupType);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = *(&off_24CD53CE0 + groupType);
    }
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("group_type"));

  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId)
    objc_msgSend(v4, "setObject:forKey:", groupViewExposureId, CFSTR("group_view_exposure_id"));
  previousArticleId = self->_previousArticleId;
  if (previousArticleId)
    objc_msgSend(v4, "setObject:forKey:", previousArticleId, CFSTR("previous_article_id"));
  v35 = v4;

  return v35;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdImpressionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_10;
      goto LABEL_41;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
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
    if ((has & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_14:
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
  }
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_adImpressionId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
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
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  if (self->_previousArticleId)
  {
    PBDataWriterWriteStringField();
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
  uint64_t v28;
  void *v29;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_iadCampaign, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v6;

  v8 = -[NSString copyWithZone:](self->_iadLine, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v8;

  v10 = -[NSString copyWithZone:](self->_iadAd, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v10;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_adType;
    *(_WORD *)(v5 + 160) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_adCreativeType;
  *(_WORD *)(v5 + 160) |= 2u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 36) = self->_adLocation;
  *(_WORD *)(v5 + 160) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 128) = self->_newsProductType;
  *(_WORD *)(v5 + 160) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  *(_DWORD *)(v5 + 156) = self->_videoAdType;
  *(_WORD *)(v5 + 160) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 72) = self->_feedType;
    *(_WORD *)(v5 + 160) |= 0x20u;
  }
LABEL_8:
  v13 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v13;

  v15 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = (__int16)self->_has;
  if ((v17 & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_videoAdDuration;
    *(_WORD *)(v5 + 160) |= 1u;
    v17 = (__int16)self->_has;
  }
  if ((v17 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_videoAdPlacementPosition;
    *(_WORD *)(v5 + 160) |= 0x100u;
  }
  v18 = -[NSString copyWithZone:](self->_adImpressionId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v18;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_adImpressionTimeThreshold;
    *(_WORD *)(v5 + 160) |= 4u;
  }
  v20 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v20;

  v22 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v22;

  v24 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v24;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_groupType;
    *(_WORD *)(v5 + 160) |= 0x40u;
  }
  v26 = -[NSData copyWithZone:](self->_groupViewExposureId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v26;

  v28 = -[NSString copyWithZone:](self->_previousArticleId, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v28;

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
  __int16 v19;
  NSData *groupViewExposureId;
  NSString *previousArticleId;
  char v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_75;
  iadCampaign = self->_iadCampaign;
  if ((unint64_t)iadCampaign | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](iadCampaign, "isEqual:"))
      goto LABEL_75;
  }
  iadLine = self->_iadLine;
  if ((unint64_t)iadLine | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](iadLine, "isEqual:"))
      goto LABEL_75;
  }
  iadAd = self->_iadAd;
  if ((unint64_t)iadAd | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](iadAd, "isEqual:"))
      goto LABEL_75;
  }
  has = (__int16)self->_has;
  v9 = *((_WORD *)v4 + 80);
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_adType != *((_DWORD *)v4 + 10))
      goto LABEL_75;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_adCreativeType != *((_DWORD *)v4 + 4))
      goto LABEL_75;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_adLocation != *((_DWORD *)v4 + 9))
      goto LABEL_75;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_newsProductType != *((_DWORD *)v4 + 32))
      goto LABEL_75;
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 80) & 0x200) == 0 || self->_videoAdType != *((_DWORD *)v4 + 39))
      goto LABEL_75;
  }
  else if ((*((_WORD *)v4 + 80) & 0x200) != 0)
  {
    goto LABEL_75;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_feedType != *((_DWORD *)v4 + 18))
      goto LABEL_75;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_75;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 8) && !-[NSString isEqual:](feedId, "isEqual:"))
    goto LABEL_75;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_75;
  }
  v12 = (__int16)self->_has;
  v13 = *((_WORD *)v4 + 80);
  if ((v12 & 1) != 0)
  {
    if ((v13 & 1) == 0 || self->_videoAdDuration != *((_QWORD *)v4 + 1))
      goto LABEL_75;
  }
  else if ((v13 & 1) != 0)
  {
    goto LABEL_75;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 80) & 0x100) == 0 || self->_videoAdPlacementPosition != *((_DWORD *)v4 + 38))
      goto LABEL_75;
  }
  else if ((*((_WORD *)v4 + 80) & 0x100) != 0)
  {
    goto LABEL_75;
  }
  adImpressionId = self->_adImpressionId;
  if ((unint64_t)adImpressionId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](adImpressionId, "isEqual:"))
    {
LABEL_75:
      v22 = 0;
      goto LABEL_76;
    }
    v12 = (__int16)self->_has;
  }
  v15 = *((_WORD *)v4 + 80);
  if ((v12 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_adImpressionTimeThreshold != *((_DWORD *)v4 + 8))
      goto LABEL_75;
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_75;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 7)
    && !-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
  {
    goto LABEL_75;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_75;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_75;
  }
  v19 = *((_WORD *)v4 + 80);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v19 & 0x40) == 0 || self->_groupType != *((_DWORD *)v4 + 22))
      goto LABEL_75;
  }
  else if ((v19 & 0x40) != 0)
  {
    goto LABEL_75;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((_QWORD *)v4 + 12)
    && !-[NSData isEqual:](groupViewExposureId, "isEqual:"))
  {
    goto LABEL_75;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((_QWORD *)v4 + 17))
    v22 = -[NSString isEqual:](previousArticleId, "isEqual:");
  else
    v22 = 1;
LABEL_76:

  return v22;
}

- (unint64_t)hash
{
  __int16 has;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;

  v24 = -[NSString hash](self->_iadCampaign, "hash");
  v23 = -[NSString hash](self->_iadLine, "hash");
  v22 = -[NSString hash](self->_iadAd, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v21 = 2654435761 * self->_adType;
    if ((has & 2) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_adCreativeType;
      if ((has & 8) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v21 = 0;
    if ((has & 2) != 0)
      goto LABEL_3;
  }
  v20 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    v19 = 2654435761 * self->_adLocation;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v19 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v18 = 2654435761 * self->_newsProductType;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_6;
LABEL_12:
    v17 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_11:
  v18 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_12;
LABEL_6:
  v17 = 2654435761 * self->_videoAdType;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v16 = 2654435761 * self->_feedType;
    goto LABEL_14;
  }
LABEL_13:
  v16 = 0;
LABEL_14:
  v15 = -[NSString hash](self->_feedId, "hash");
  v4 = -[NSString hash](self->_articleId, "hash");
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_videoAdDuration;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_16;
  }
  else
  {
    v5 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_16:
      v6 = 2654435761 * self->_videoAdPlacementPosition;
      goto LABEL_19;
    }
  }
  v6 = 0;
LABEL_19:
  v7 = -[NSString hash](self->_adImpressionId, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_adImpressionTimeThreshold;
  else
    v8 = 0;
  v9 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v10 = -[NSString hash](self->_sourceChannelId, "hash");
  v11 = -[NSData hash](self->_feedViewExposureId, "hash");
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    v12 = 2654435761 * self->_groupType;
  else
    v12 = 0;
  v13 = v10 ^ v11 ^ v12 ^ -[NSData hash](self->_groupViewExposureId, "hash");
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v13 ^ -[NSString hash](self->_previousArticleId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 14))
  {
    -[NTPBAdImpression setIadCampaign:](self, "setIadCampaign:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[NTPBAdImpression setIadLine:](self, "setIadLine:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[NTPBAdImpression setIadAd:](self, "setIadAd:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 80);
  if ((v5 & 0x10) != 0)
  {
    self->_adType = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 8) == 0)
        goto LABEL_10;
      goto LABEL_41;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_adCreativeType = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 80);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_42;
  }
LABEL_41:
  self->_adLocation = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 80);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_42:
  self->_newsProductType = *((_DWORD *)v4 + 32);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 80);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_43:
  self->_videoAdType = *((_DWORD *)v4 + 39);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 80) & 0x20) != 0)
  {
LABEL_13:
    self->_feedType = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 8))
  {
    -[NTPBAdImpression setFeedId:](self, "setFeedId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBAdImpression setArticleId:](self, "setArticleId:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 80);
  if ((v6 & 1) != 0)
  {
    self->_videoAdDuration = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 80);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_videoAdPlacementPosition = *((_DWORD *)v4 + 38);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBAdImpression setAdImpressionId:](self, "setAdImpressionId:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 80) & 4) != 0)
  {
    self->_adImpressionTimeThreshold = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBAdImpression setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 18))
  {
    -[NTPBAdImpression setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[NTPBAdImpression setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v4 = v7;
  }
  if ((*((_WORD *)v4 + 80) & 0x40) != 0)
  {
    self->_groupType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[NTPBAdImpression setGroupViewExposureId:](self, "setGroupViewExposureId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[NTPBAdImpression setPreviousArticleId:](self, "setPreviousArticleId:");
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

- (int)videoAdPlacementPosition
{
  return self->_videoAdPlacementPosition;
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

- (NSString)previousArticleId
{
  return self->_previousArticleId;
}

- (void)setPreviousArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_previousArticleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
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
