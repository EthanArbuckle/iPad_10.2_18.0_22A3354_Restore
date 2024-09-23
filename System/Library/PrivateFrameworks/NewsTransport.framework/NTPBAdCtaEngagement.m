@implementation NTPBAdCtaEngagement

- (int)adCtaEngagemetType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_adCtaEngagemetType;
  else
    return 0;
}

- (void)setAdCtaEngagemetType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_adCtaEngagemetType = a3;
}

- (void)setHasAdCtaEngagemetType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAdCtaEngagemetType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

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
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_adEngagementType;
  else
    return 0;
}

- (void)setAdEngagementType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_adEngagementType = a3;
}

- (void)setHasAdEngagementType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAdEngagementType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)adEngagementTypeAsString:(int)a3
{
  if (a3 < 6)
    return *(&off_24CD53778 + a3);
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
    return *(&off_24CD537A8 + a3);
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
    return *(&off_24CD537C8 + a3);
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
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_newsProductType;
  else
    return 0;
}

- (void)setNewsProductType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_newsProductType = a3;
}

- (void)setHasNewsProductType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNewsProductType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)newsProductTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD537F8 + a3);
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
  if ((*(_WORD *)&self->_has & 0x400) != 0)
    return self->_videoAdType;
  else
    return 0;
}

- (void)setVideoAdType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_videoAdType = a3;
}

- (void)setHasVideoAdType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVideoAdType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)videoAdTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_24CD53810 + a3);
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
    return *(&off_24CD53828 + a3);
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
  *(_WORD *)&self->_has |= 0x200u;
  self->_videoAdPlacementPosition = a3;
}

- (void)setHasVideoAdPlacementPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasVideoAdPlacementPosition
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setVideoAdViewComplete:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_videoAdViewComplete = a3;
}

- (void)setHasVideoAdViewComplete:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVideoAdViewComplete
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasAdImpressionId
{
  return self->_adImpressionId != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBAdCtaEngagement;
  -[NTPBAdCtaEngagement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAdCtaEngagement dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  NSData *feedViewExposureId;
  id v31;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_adCtaEngagemetType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ad_cta_engagemet_type"));

  }
  iadCampaign = self->_iadCampaign;
  if (iadCampaign)
    objc_msgSend(v3, "setObject:forKey:", iadCampaign, CFSTR("iad_campaign"));
  iadLine = self->_iadLine;
  if (iadLine)
    objc_msgSend(v3, "setObject:forKey:", iadLine, CFSTR("iad_line"));
  iadAd = self->_iadAd;
  if (iadAd)
    objc_msgSend(v3, "setObject:forKey:", iadAd, CFSTR("iad_ad"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    adEngagementType = self->_adEngagementType;
    if (adEngagementType >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adEngagementType);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_24CD53778 + adEngagementType);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ad_engagement_type"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_27;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_11;
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
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("ad_type"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_31;
  }
LABEL_27:
  adCreativeType = self->_adCreativeType;
  if (adCreativeType >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adCreativeType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = *(&off_24CD537A8 + adCreativeType);
  }
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ad_creative_type"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_31:
  adLocation = self->_adLocation;
  if (adLocation >= 6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adLocation);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = *(&off_24CD537C8 + adLocation);
  }
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("ad_location"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_39;
  }
LABEL_35:
  newsProductType = self->_newsProductType;
  if (newsProductType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_newsProductType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = *(&off_24CD537F8 + newsProductType);
  }
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("news_product_type"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_47;
    goto LABEL_43;
  }
LABEL_39:
  videoAdType = self->_videoAdType;
  if (videoAdType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_videoAdType);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = *(&off_24CD53810 + videoAdType);
  }
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("video_ad_type"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_43:
    feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = *(&off_24CD53828 + feedType);
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("feed_type"));

  }
LABEL_47:
  feedId = self->_feedId;
  if (feedId)
    objc_msgSend(v3, "setObject:forKey:", feedId, CFSTR("feed_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  v25 = (__int16)self->_has;
  if ((v25 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_videoAdDuration);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("video_ad_duration"));

    v25 = (__int16)self->_has;
    if ((v25 & 2) == 0)
    {
LABEL_53:
      if ((v25 & 0x200) == 0)
        goto LABEL_54;
      goto LABEL_67;
    }
  }
  else if ((v25 & 2) == 0)
  {
    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_videoAdPlayTime);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("video_ad_play_time"));

  v25 = (__int16)self->_has;
  if ((v25 & 0x200) == 0)
  {
LABEL_54:
    if ((v25 & 0x800) == 0)
      goto LABEL_56;
    goto LABEL_55;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_videoAdPlacementPosition);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("video_ad_placement_position"));

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_55:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_videoAdViewComplete);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("video_ad_view_complete"));

  }
LABEL_56:
  adImpressionId = self->_adImpressionId;
  if (adImpressionId)
    objc_msgSend(v3, "setObject:forKey:", adImpressionId, CFSTR("ad_impression_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  v31 = v3;

  return v31;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdCtaEngagementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
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
    if ((has & 0x40) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_37;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_16:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_17:
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
LABEL_23:
      if ((v6 & 0x200) == 0)
        goto LABEL_24;
      goto LABEL_44;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteInt64Field();
  v4 = v7;
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) == 0)
  {
LABEL_24:
    if ((v6 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_44:
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_25:
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
LABEL_26:
  if (self->_adImpressionId)
  {
    PBDataWriterWriteStringField();
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
  __int16 has;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_adCtaEngagemetType;
    *(_WORD *)(v5 + 148) |= 8u;
  }
  v7 = -[NSString copyWithZone:](self->_iadCampaign, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v7;

  v9 = -[NSString copyWithZone:](self->_iadLine, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v9;

  v11 = -[NSString copyWithZone:](self->_iadAd, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v11;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_adEngagementType;
    *(_WORD *)(v6 + 148) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 52) = self->_adType;
  *(_WORD *)(v6 + 148) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v6 + 24) = self->_adCreativeType;
  *(_WORD *)(v6 + 148) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 48) = self->_adLocation;
  *(_WORD *)(v6 + 148) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 120) = self->_newsProductType;
  *(_WORD *)(v6 + 148) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_22:
  *(_DWORD *)(v6 + 140) = self->_videoAdType;
  *(_WORD *)(v6 + 148) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 80) = self->_feedType;
    *(_WORD *)(v6 + 148) |= 0x80u;
  }
LABEL_11:
  v14 = -[NSString copyWithZone:](self->_feedId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v14;

  v16 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v16;

  v18 = (__int16)self->_has;
  if ((v18 & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_videoAdDuration;
    *(_WORD *)(v6 + 148) |= 1u;
    v18 = (__int16)self->_has;
    if ((v18 & 2) == 0)
    {
LABEL_13:
      if ((v18 & 0x200) == 0)
        goto LABEL_14;
LABEL_26:
      *(_DWORD *)(v6 + 136) = self->_videoAdPlacementPosition;
      *(_WORD *)(v6 + 148) |= 0x200u;
      if ((*(_WORD *)&self->_has & 0x800) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v18 & 2) == 0)
  {
    goto LABEL_13;
  }
  *(_QWORD *)(v6 + 16) = self->_videoAdPlayTime;
  *(_WORD *)(v6 + 148) |= 2u;
  v18 = (__int16)self->_has;
  if ((v18 & 0x200) != 0)
    goto LABEL_26;
LABEL_14:
  if ((v18 & 0x800) != 0)
  {
LABEL_15:
    *(_BYTE *)(v6 + 144) = self->_videoAdViewComplete;
    *(_WORD *)(v6 + 148) |= 0x800u;
  }
LABEL_16:
  v19 = -[NSString copyWithZone:](self->_adImpressionId, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v19;

  v21 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v21;

  v23 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v23;

  v25 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *iadCampaign;
  NSString *iadLine;
  NSString *iadAd;
  __int16 has;
  __int16 v10;
  NSString *feedId;
  NSString *articleId;
  __int16 v13;
  __int16 v14;
  NSString *adImpressionId;
  NSData *articleViewingSessionId;
  NSString *sourceChannelId;
  NSData *feedViewExposureId;
  char v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_83;
  v5 = *((_WORD *)v4 + 74);
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_adCtaEngagemetType != *((_DWORD *)v4 + 7))
      goto LABEL_83;
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_83;
  }
  iadCampaign = self->_iadCampaign;
  if ((unint64_t)iadCampaign | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](iadCampaign, "isEqual:"))
  {
    goto LABEL_83;
  }
  iadLine = self->_iadLine;
  if ((unint64_t)iadLine | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](iadLine, "isEqual:"))
      goto LABEL_83;
  }
  iadAd = self->_iadAd;
  if ((unint64_t)iadAd | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](iadAd, "isEqual:"))
      goto LABEL_83;
  }
  has = (__int16)self->_has;
  v10 = *((_WORD *)v4 + 74);
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_adEngagementType != *((_DWORD *)v4 + 8))
      goto LABEL_83;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_adType != *((_DWORD *)v4 + 13))
      goto LABEL_83;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_adCreativeType != *((_DWORD *)v4 + 6))
      goto LABEL_83;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_adLocation != *((_DWORD *)v4 + 12))
      goto LABEL_83;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x100) == 0 || self->_newsProductType != *((_DWORD *)v4 + 30))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 74) & 0x100) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x400) == 0 || self->_videoAdType != *((_DWORD *)v4 + 35))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 74) & 0x400) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_feedType != *((_DWORD *)v4 + 20))
      goto LABEL_83;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](feedId, "isEqual:"))
    goto LABEL_83;
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_83;
  }
  v13 = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 74);
  if ((v13 & 1) != 0)
  {
    if ((v14 & 1) == 0 || self->_videoAdDuration != *((_QWORD *)v4 + 1))
      goto LABEL_83;
  }
  else if ((v14 & 1) != 0)
  {
    goto LABEL_83;
  }
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_videoAdPlayTime != *((_QWORD *)v4 + 2))
      goto LABEL_83;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x200) == 0 || self->_videoAdPlacementPosition != *((_DWORD *)v4 + 34))
      goto LABEL_83;
  }
  else if ((*((_WORD *)v4 + 74) & 0x200) != 0)
  {
    goto LABEL_83;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 74) & 0x800) != 0)
    {
      if (self->_videoAdViewComplete)
      {
        if (!*((_BYTE *)v4 + 144))
          goto LABEL_83;
        goto LABEL_75;
      }
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_75;
    }
LABEL_83:
    v19 = 0;
    goto LABEL_84;
  }
  if ((*((_WORD *)v4 + 74) & 0x800) != 0)
    goto LABEL_83;
LABEL_75:
  adImpressionId = self->_adImpressionId;
  if ((unint64_t)adImpressionId | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](adImpressionId, "isEqual:"))
  {
    goto LABEL_83;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_83;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_83;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 11))
    v19 = -[NSData isEqual:](feedViewExposureId, "isEqual:");
  else
    v19 = 1;
LABEL_84:

  return v19;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;

  if ((*(_WORD *)&self->_has & 8) != 0)
    v26 = 2654435761 * self->_adCtaEngagemetType;
  else
    v26 = 0;
  v25 = -[NSString hash](self->_iadCampaign, "hash");
  v24 = -[NSString hash](self->_iadLine, "hash");
  v23 = -[NSString hash](self->_iadAd, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v22 = 2654435761 * self->_adEngagementType;
    if ((has & 0x40) != 0)
    {
LABEL_6:
      v4 = 2654435761 * self->_adType;
      if ((has & 4) != 0)
        goto LABEL_7;
      goto LABEL_14;
    }
  }
  else
  {
    v22 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_6;
  }
  v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v5 = 2654435761 * self->_adCreativeType;
    if ((has & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    v6 = 2654435761 * self->_adLocation;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    v7 = 2654435761 * self->_newsProductType;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_10;
LABEL_17:
    v8 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_16:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_17;
LABEL_10:
  v8 = 2654435761 * self->_videoAdType;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    v9 = 2654435761 * self->_feedType;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
LABEL_19:
  v10 = -[NSString hash](self->_feedId, "hash");
  v11 = -[NSString hash](self->_articleId, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 1) != 0)
  {
    v13 = 2654435761 * self->_videoAdDuration;
    if ((v12 & 2) != 0)
    {
LABEL_21:
      v14 = 2654435761 * self->_videoAdPlayTime;
      if ((*(_WORD *)&self->_has & 0x200) != 0)
        goto LABEL_22;
LABEL_26:
      v15 = 0;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_23;
LABEL_27:
      v16 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v13 = 0;
    if ((v12 & 2) != 0)
      goto LABEL_21;
  }
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_26;
LABEL_22:
  v15 = 2654435761 * self->_videoAdPlacementPosition;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_27;
LABEL_23:
  v16 = 2654435761 * self->_videoAdViewComplete;
LABEL_28:
  v17 = v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v18 = v13 ^ v14 ^ v15 ^ v16 ^ -[NSString hash](self->_adImpressionId, "hash");
  v19 = v18 ^ -[NSData hash](self->_articleViewingSessionId, "hash");
  v20 = v17 ^ v19 ^ -[NSString hash](self->_sourceChannelId, "hash");
  return v20 ^ -[NSData hash](self->_feedViewExposureId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  id v7;

  v4 = a3;
  if ((*((_WORD *)v4 + 74) & 8) != 0)
  {
    self->_adCtaEngagemetType = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 8u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 13))
  {
    -[NTPBAdCtaEngagement setIadCampaign:](self, "setIadCampaign:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[NTPBAdCtaEngagement setIadLine:](self, "setIadLine:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[NTPBAdCtaEngagement setIadAd:](self, "setIadAd:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x10) != 0)
  {
    self->_adEngagementType = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)v4 + 74);
    if ((v5 & 0x40) == 0)
    {
LABEL_11:
      if ((v5 & 4) == 0)
        goto LABEL_12;
      goto LABEL_37;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_11;
  }
  self->_adType = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 74);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  self->_adCreativeType = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  self->_adLocation = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x100) == 0)
  {
LABEL_14:
    if ((v5 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  self->_newsProductType = *((_DWORD *)v4 + 30);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 74);
  if ((v5 & 0x400) == 0)
  {
LABEL_15:
    if ((v5 & 0x80) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_40:
  self->_videoAdType = *((_DWORD *)v4 + 35);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 74) & 0x80) != 0)
  {
LABEL_16:
    self->_feedType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_17:
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBAdCtaEngagement setFeedId:](self, "setFeedId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBAdCtaEngagement setArticleId:](self, "setArticleId:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 74);
  if ((v6 & 1) != 0)
  {
    self->_videoAdDuration = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v6 = *((_WORD *)v4 + 74);
    if ((v6 & 2) == 0)
    {
LABEL_23:
      if ((v6 & 0x200) == 0)
        goto LABEL_24;
      goto LABEL_44;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_23;
  }
  self->_videoAdPlayTime = *((_QWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v6 = *((_WORD *)v4 + 74);
  if ((v6 & 0x200) == 0)
  {
LABEL_24:
    if ((v6 & 0x800) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
LABEL_44:
  self->_videoAdPlacementPosition = *((_DWORD *)v4 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 74) & 0x800) != 0)
  {
LABEL_25:
    self->_videoAdViewComplete = *((_BYTE *)v4 + 144);
    *(_WORD *)&self->_has |= 0x800u;
  }
LABEL_26:
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBAdCtaEngagement setAdImpressionId:](self, "setAdImpressionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[NTPBAdCtaEngagement setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[NTPBAdCtaEngagement setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[NTPBAdCtaEngagement setFeedViewExposureId:](self, "setFeedViewExposureId:");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_iadLine, 0);
  objc_storeStrong((id *)&self->_iadCampaign, 0);
  objc_storeStrong((id *)&self->_iadAd, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
  objc_storeStrong((id *)&self->_adImpressionId, 0);
}

@end
