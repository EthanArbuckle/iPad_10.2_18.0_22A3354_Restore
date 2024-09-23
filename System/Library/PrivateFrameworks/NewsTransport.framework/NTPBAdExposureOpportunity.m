@implementation NTPBAdExposureOpportunity

- (void)setIsExpanded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isExpanded = a3;
}

- (void)setHasIsExpanded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsExpanded
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsFilled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isFilled = a3;
}

- (void)setHasIsFilled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsFilled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasAdSlotId
{
  return self->_adSlotId != 0;
}

- (void)setDurationInFeed:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationInFeed = a3;
}

- (void)setHasDurationInFeed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationInFeed
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResponseTime:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_responseTime = a3;
}

- (void)setHasResponseTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasResponseTime
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setScreenfulsFromTop:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_screenfulsFromTop = a3;
}

- (void)setHasScreenfulsFromTop:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScreenfulsFromTop
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)errorCode
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_errorCode;
  else
    return 0;
}

- (void)setErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsViewable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isViewable = a3;
}

- (void)setHasIsViewable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsViewable
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)exposureLocationType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_exposureLocationType;
  else
    return 0;
}

- (void)setExposureLocationType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_exposureLocationType = a3;
}

- (void)setHasExposureLocationType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasExposureLocationType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_feedType;
  else
    return 0;
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD50F70[a3];
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

- (BOOL)hasExposureLocationTypeId
{
  return self->_exposureLocationTypeId != 0;
}

- (BOOL)hasAdCreativeId
{
  return self->_adCreativeId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasAdOpportunityId
{
  return self->_adOpportunityId != 0;
}

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (void)setAdErrorCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_adErrorCode = a3;
}

- (void)setHasAdErrorCode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAdErrorCode
{
  return *(_WORD *)&self->_has & 1;
}

- (int)adType
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_adType;
  else
    return 0;
}

- (void)setAdType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_adType = a3;
}

- (void)setHasAdType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAdType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
    return off_24CD51020[a3];
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBAdExposureOpportunity;
  -[NTPBAdExposureOpportunity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBAdExposureOpportunity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v6;
  NSString *adSlotId;
  __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t feedType;
  __CFString *v16;
  NSString *exposureLocationTypeId;
  NSString *adCreativeId;
  NSData *feedViewExposureId;
  NSData *articleViewingSessionId;
  NSString *adOpportunityId;
  NSString *eventId;
  __int16 v23;
  void *v24;
  int adType;
  __CFString *v26;
  uint64_t adCreativeType;
  __CFString *v28;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isExpanded);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("is_expanded"));

    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFilled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("is_filled"));

  }
  adSlotId = self->_adSlotId;
  if (adSlotId)
    objc_msgSend(v3, "setObject:forKey:", adSlotId, CFSTR("ad_slot_id"));
  v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_durationInFeed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("duration_in_feed"));

    v8 = (__int16)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_9:
      if ((v8 & 0x100) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_responseTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("response_time"));

  v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_10:
    if ((v8 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_screenfulsFromTop);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("screenfuls_from_top"));

  v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_11:
    if ((v8 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_errorCode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("error_code"));

  v8 = (__int16)self->_has;
  if ((v8 & 0x800) == 0)
  {
LABEL_12:
    if ((v8 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isViewable);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("is_viewable"));

  v8 = (__int16)self->_has;
  if ((v8 & 0x20) == 0)
  {
LABEL_13:
    if ((v8 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_exposureLocationType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("exposure_location_type"));

  if ((*(_WORD *)&self->_has & 0x40) == 0)
    goto LABEL_25;
LABEL_21:
  feedType = self->_feedType;
  if (feedType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedType);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_24CD50F70[feedType];
  }
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("feed_type"));

LABEL_25:
  exposureLocationTypeId = self->_exposureLocationTypeId;
  if (exposureLocationTypeId)
    objc_msgSend(v3, "setObject:forKey:", exposureLocationTypeId, CFSTR("exposure_location_type_id"));
  adCreativeId = self->_adCreativeId;
  if (adCreativeId)
    objc_msgSend(v3, "setObject:forKey:", adCreativeId, CFSTR("ad_creative_id"));
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId)
    objc_msgSend(v3, "setObject:forKey:", feedViewExposureId, CFSTR("feed_view_exposure_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  adOpportunityId = self->_adOpportunityId;
  if (adOpportunityId)
    objc_msgSend(v3, "setObject:forKey:", adOpportunityId, CFSTR("ad_opportunity_id"));
  eventId = self->_eventId;
  if (eventId)
    objc_msgSend(v3, "setObject:forKey:", eventId, CFSTR("event_id"));
  v23 = (__int16)self->_has;
  if ((v23 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_adErrorCode);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("ad_error_code"));

    v23 = (__int16)self->_has;
    if ((v23 & 4) == 0)
    {
LABEL_39:
      if ((v23 & 2) == 0)
        return v3;
      goto LABEL_48;
    }
  }
  else if ((v23 & 4) == 0)
  {
    goto LABEL_39;
  }
  adType = self->_adType;
  if (adType)
  {
    if (adType == 1)
    {
      v26 = CFSTR("NON_NATIVE_AD_TYPE");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adType);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v26 = CFSTR("UNKNOWN_AD_TYPE");
  }
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("ad_type"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_48:
    adCreativeType = self->_adCreativeType;
    if (adCreativeType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adCreativeType);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_24CD51020[adCreativeType];
    }
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("ad_creative_type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdExposureOpportunityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;
  id v7;

  v7 = a3;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_adSlotId)
    PBDataWriterWriteStringField();
  v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (__int16)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_9:
      if ((v5 & 0x100) == 0)
        goto LABEL_10;
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  v5 = (__int16)self->_has;
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0)
LABEL_14:
    PBDataWriterWriteInt32Field();
LABEL_15:
  if (self->_exposureLocationTypeId)
    PBDataWriterWriteStringField();
  if (self->_adCreativeId)
    PBDataWriterWriteStringField();
  if (self->_feedViewExposureId)
    PBDataWriterWriteDataField();
  if (self->_articleViewingSessionId)
    PBDataWriterWriteDataField();
  if (self->_adOpportunityId)
    PBDataWriterWriteStringField();
  if (self->_eventId)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
    if ((v6 & 4) == 0)
      goto LABEL_29;
LABEL_40:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  PBDataWriterWriteInt64Field();
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
    goto LABEL_40;
LABEL_29:
  if ((v6 & 2) != 0)
LABEL_30:
    PBDataWriterWriteInt32Field();
LABEL_31:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  __int16 v10;
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
  __int16 v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 120) = self->_isExpanded;
    *(_WORD *)(v5 + 124) |= 0x200u;
    has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 121) = self->_isFilled;
    *(_WORD *)(v5 + 124) |= 0x400u;
  }
  v8 = -[NSString copyWithZone:](self->_adSlotId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_durationInFeed;
    *(_WORD *)(v6 + 124) |= 8u;
    v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_7:
      if ((v10 & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_20;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 112) = self->_responseTime;
  *(_WORD *)(v6 + 124) |= 0x80u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_8:
    if ((v10 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 116) = self->_screenfulsFromTop;
  *(_WORD *)(v6 + 124) |= 0x100u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_9:
    if ((v10 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 68) = self->_errorCode;
  *(_WORD *)(v6 + 124) |= 0x10u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
LABEL_10:
    if ((v10 & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *(_BYTE *)(v6 + 122) = self->_isViewable;
  *(_WORD *)(v6 + 124) |= 0x800u;
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_11:
    if ((v10 & 0x40) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_23:
  *(_DWORD *)(v6 + 80) = self->_exposureLocationType;
  *(_WORD *)(v6 + 124) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 96) = self->_feedType;
    *(_WORD *)(v6 + 124) |= 0x40u;
  }
LABEL_13:
  v11 = -[NSString copyWithZone:](self->_exposureLocationTypeId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v11;

  v13 = -[NSString copyWithZone:](self->_adCreativeId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v13;

  v15 = -[NSData copyWithZone:](self->_feedViewExposureId, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v15;

  v17 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v17;

  v19 = -[NSString copyWithZone:](self->_adOpportunityId, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v19;

  v21 = -[NSString copyWithZone:](self->_eventId, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v21;

  v23 = (__int16)self->_has;
  if ((v23 & 1) == 0)
  {
    if ((v23 & 4) == 0)
      goto LABEL_15;
LABEL_26:
    *(_DWORD *)(v6 + 48) = self->_adType;
    *(_WORD *)(v6 + 124) |= 4u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      return (id)v6;
    goto LABEL_16;
  }
  *(_QWORD *)(v6 + 8) = self->_adErrorCode;
  *(_WORD *)(v6 + 124) |= 1u;
  v23 = (__int16)self->_has;
  if ((v23 & 4) != 0)
    goto LABEL_26;
LABEL_15:
  if ((v23 & 2) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 24) = self->_adCreativeType;
    *(_WORD *)(v6 + 124) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  NSString *adSlotId;
  __int16 v7;
  NSString *exposureLocationTypeId;
  NSString *adCreativeId;
  NSData *feedViewExposureId;
  NSData *articleViewingSessionId;
  NSString *adOpportunityId;
  NSString *eventId;
  __int16 v14;
  __int16 v15;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_86;
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) == 0)
      goto LABEL_86;
    if (self->_isExpanded)
    {
      if (!*((_BYTE *)v4 + 120))
        goto LABEL_86;
    }
    else if (*((_BYTE *)v4 + 120))
    {
      goto LABEL_86;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x200) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x400) == 0)
      goto LABEL_86;
    if (self->_isFilled)
    {
      if (!*((_BYTE *)v4 + 121))
        goto LABEL_86;
    }
    else if (*((_BYTE *)v4 + 121))
    {
      goto LABEL_86;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x400) != 0)
  {
    goto LABEL_86;
  }
  adSlotId = self->_adSlotId;
  if ((unint64_t)adSlotId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](adSlotId, "isEqual:"))
      goto LABEL_86;
    has = (__int16)self->_has;
  }
  v7 = *((_WORD *)v4 + 62);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_durationInFeed != *((_DWORD *)v4 + 16))
      goto LABEL_86;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_responseTime != *((_DWORD *)v4 + 28))
      goto LABEL_86;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0 || self->_screenfulsFromTop != *((_DWORD *)v4 + 29))
      goto LABEL_86;
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_errorCode != *((_DWORD *)v4 + 17))
      goto LABEL_86;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x800) != 0)
    {
      if (self->_isViewable)
      {
        if (!*((_BYTE *)v4 + 122))
          goto LABEL_86;
        goto LABEL_49;
      }
      if (!*((_BYTE *)v4 + 122))
        goto LABEL_49;
    }
LABEL_86:
    v16 = 0;
    goto LABEL_87;
  }
  if ((*((_WORD *)v4 + 62) & 0x800) != 0)
    goto LABEL_86;
LABEL_49:
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_exposureLocationType != *((_DWORD *)v4 + 20))
      goto LABEL_86;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_feedType != *((_DWORD *)v4 + 24))
      goto LABEL_86;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_86;
  }
  exposureLocationTypeId = self->_exposureLocationTypeId;
  if ((unint64_t)exposureLocationTypeId | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](exposureLocationTypeId, "isEqual:"))
  {
    goto LABEL_86;
  }
  adCreativeId = self->_adCreativeId;
  if ((unint64_t)adCreativeId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](adCreativeId, "isEqual:"))
      goto LABEL_86;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:"))
      goto LABEL_86;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_86;
  }
  adOpportunityId = self->_adOpportunityId;
  if ((unint64_t)adOpportunityId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](adOpportunityId, "isEqual:"))
      goto LABEL_86;
  }
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](eventId, "isEqual:"))
      goto LABEL_86;
  }
  v14 = (__int16)self->_has;
  v15 = *((_WORD *)v4 + 62);
  if ((v14 & 1) != 0)
  {
    if ((v15 & 1) == 0 || self->_adErrorCode != *((_QWORD *)v4 + 1))
      goto LABEL_86;
  }
  else if ((v15 & 1) != 0)
  {
    goto LABEL_86;
  }
  if ((v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_adType != *((_DWORD *)v4 + 12))
      goto LABEL_86;
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_86;
  }
  if ((v14 & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_adCreativeType != *((_DWORD *)v4 + 6))
      goto LABEL_86;
    v16 = 1;
  }
  else
  {
    v16 = (v15 & 2) == 0;
  }
LABEL_87:

  return v16;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v25 = 2654435761 * self->_isExpanded;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_3;
  }
  else
  {
    v25 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      v24 = 2654435761 * self->_isFilled;
      goto LABEL_6;
    }
  }
  v24 = 0;
LABEL_6:
  v23 = -[NSString hash](self->_adSlotId, "hash");
  has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v22 = 2654435761 * self->_durationInFeed;
    if ((has & 0x80) != 0)
    {
LABEL_8:
      v21 = 2654435761 * self->_responseTime;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_9;
      goto LABEL_16;
    }
  }
  else
  {
    v22 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_8;
  }
  v21 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    v20 = 2654435761 * self->_screenfulsFromTop;
    if ((has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  v20 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    v19 = 2654435761 * self->_errorCode;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_17:
  v19 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_11:
    v17 = 2654435761 * self->_isViewable;
    if ((has & 0x20) != 0)
      goto LABEL_12;
LABEL_19:
    v4 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_13;
    goto LABEL_20;
  }
LABEL_18:
  v17 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_19;
LABEL_12:
  v4 = 2654435761 * self->_exposureLocationType;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    v5 = 2654435761 * self->_feedType;
    goto LABEL_21;
  }
LABEL_20:
  v5 = 0;
LABEL_21:
  v6 = -[NSString hash](self->_exposureLocationTypeId, "hash", v17);
  v7 = -[NSString hash](self->_adCreativeId, "hash");
  v8 = -[NSData hash](self->_feedViewExposureId, "hash");
  v9 = -[NSData hash](self->_articleViewingSessionId, "hash");
  v10 = -[NSString hash](self->_adOpportunityId, "hash");
  v11 = -[NSString hash](self->_eventId, "hash");
  v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
    v13 = 0;
    if ((v12 & 4) != 0)
      goto LABEL_23;
LABEL_26:
    v14 = 0;
    if ((v12 & 2) != 0)
      goto LABEL_24;
LABEL_27:
    v15 = 0;
    return v24 ^ v25 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v23 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
  }
  v13 = 2654435761 * self->_adErrorCode;
  if ((v12 & 4) == 0)
    goto LABEL_26;
LABEL_23:
  v14 = 2654435761 * self->_adType;
  if ((v12 & 2) == 0)
    goto LABEL_27;
LABEL_24:
  v15 = 2654435761 * self->_adCreativeType;
  return v24 ^ v25 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v23 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  id v8;

  v4 = a3;
  v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x200) != 0)
  {
    self->_isExpanded = *((_BYTE *)v4 + 120);
    *(_WORD *)&self->_has |= 0x200u;
    v5 = *((_WORD *)v4 + 62);
  }
  if ((v5 & 0x400) != 0)
  {
    self->_isFilled = *((_BYTE *)v4 + 121);
    *(_WORD *)&self->_has |= 0x400u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBAdExposureOpportunity setAdSlotId:](self, "setAdSlotId:");
    v4 = v8;
  }
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 8) != 0)
  {
    self->_durationInFeed = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 8u;
    v6 = *((_WORD *)v4 + 62);
    if ((v6 & 0x80) == 0)
    {
LABEL_9:
      if ((v6 & 0x100) == 0)
        goto LABEL_10;
      goto LABEL_34;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  self->_responseTime = *((_DWORD *)v4 + 28);
  *(_WORD *)&self->_has |= 0x80u;
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x100) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_35;
  }
LABEL_34:
  self->_screenfulsFromTop = *((_DWORD *)v4 + 29);
  *(_WORD *)&self->_has |= 0x100u;
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x10) == 0)
  {
LABEL_11:
    if ((v6 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_36;
  }
LABEL_35:
  self->_errorCode = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x800) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_37;
  }
LABEL_36:
  self->_isViewable = *((_BYTE *)v4 + 122);
  *(_WORD *)&self->_has |= 0x800u;
  v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_37:
  self->_exposureLocationType = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 62) & 0x40) != 0)
  {
LABEL_14:
    self->_feedType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 11))
  {
    -[NTPBAdExposureOpportunity setExposureLocationTypeId:](self, "setExposureLocationTypeId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBAdExposureOpportunity setAdCreativeId:](self, "setAdCreativeId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 13))
  {
    -[NTPBAdExposureOpportunity setFeedViewExposureId:](self, "setFeedViewExposureId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBAdExposureOpportunity setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBAdExposureOpportunity setAdOpportunityId:](self, "setAdOpportunityId:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBAdExposureOpportunity setEventId:](self, "setEventId:");
    v4 = v8;
  }
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 1) == 0)
  {
    if ((v7 & 4) == 0)
      goto LABEL_29;
LABEL_40:
    self->_adType = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
    if ((*((_WORD *)v4 + 62) & 2) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  self->_adErrorCode = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v7 = *((_WORD *)v4 + 62);
  if ((v7 & 4) != 0)
    goto LABEL_40;
LABEL_29:
  if ((v7 & 2) != 0)
  {
LABEL_30:
    self->_adCreativeType = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_31:

}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (BOOL)isFilled
{
  return self->_isFilled;
}

- (NSString)adSlotId
{
  return self->_adSlotId;
}

- (void)setAdSlotId:(id)a3
{
  objc_storeStrong((id *)&self->_adSlotId, a3);
}

- (int)durationInFeed
{
  return self->_durationInFeed;
}

- (int)responseTime
{
  return self->_responseTime;
}

- (int)screenfulsFromTop
{
  return self->_screenfulsFromTop;
}

- (BOOL)isViewable
{
  return self->_isViewable;
}

- (NSString)exposureLocationTypeId
{
  return self->_exposureLocationTypeId;
}

- (void)setExposureLocationTypeId:(id)a3
{
  objc_storeStrong((id *)&self->_exposureLocationTypeId, a3);
}

- (NSString)adCreativeId
{
  return self->_adCreativeId;
}

- (void)setAdCreativeId:(id)a3
{
  objc_storeStrong((id *)&self->_adCreativeId, a3);
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
  objc_storeStrong((id *)&self->_feedViewExposureId, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (NSString)adOpportunityId
{
  return self->_adOpportunityId;
}

- (void)setAdOpportunityId:(id)a3
{
  objc_storeStrong((id *)&self->_adOpportunityId, a3);
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
  objc_storeStrong((id *)&self->_eventId, a3);
}

- (int64_t)adErrorCode
{
  return self->_adErrorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_exposureLocationTypeId, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_adSlotId, 0);
  objc_storeStrong((id *)&self->_adOpportunityId, 0);
  objc_storeStrong((id *)&self->_adCreativeId, 0);
}

@end
