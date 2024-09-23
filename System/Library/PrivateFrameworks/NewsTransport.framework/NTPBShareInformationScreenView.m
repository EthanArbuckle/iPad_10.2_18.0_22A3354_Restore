@implementation NTPBShareInformationScreenView

- (int)userAction
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserAction
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)resultType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void)setResultType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResultType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)paidSubscriptionConversionPointType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_paidSubscriptionConversionPointType;
  else
    return 0;
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4FD60[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPaidSubscriptionConversionPointType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_IN_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIBER_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_FEED_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_ARTICLE_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_ARTICLE_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_EXPIRATION_RENEWAL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARD_PAYWALL_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_ARTICLE_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_OF_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERSTITIAL_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANDING_PAGE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAGAZINE_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUE_TOC_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUBSCRIPTION_OFFERS_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasSectionId
{
  return self->_sectionId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (int)parentFeedType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_parentFeedType;
  else
    return 0;
}

- (void)setParentFeedType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 < 0x16)
    return off_24CD4FE10[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsParentFeedType:(id)a3
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

- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setArrivedFromAd:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_arrivedFromAd = a3;
}

- (void)setHasArrivedFromAd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasArrivedFromAd
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasIadQtoken
{
  return self->_iadQtoken != 0;
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
  v8.super_class = (Class)NTPBShareInformationScreenView;
  -[NTPBShareInformationScreenView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBShareInformationScreenView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t paidSubscriptionConversionPointType;
  __CFString *v8;
  NSString *errorMessage;
  NSString *errorCode;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  char v15;
  void *v16;
  NSString *iadQtoken;
  uint64_t parentFeedType;
  __CFString *v20;
  void *v21;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_action"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("result_type"));

  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_7:
  paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
  if (paidSubscriptionConversionPointType >= 0x16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionConversionPointType);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_24CD4FD60[paidSubscriptionConversionPointType];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("paid_subscription_conversion_point_type"));

LABEL_11:
  errorMessage = self->_errorMessage;
  if (errorMessage)
    objc_msgSend(v3, "setObject:forKey:", errorMessage, CFSTR("error_message"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v3, "setObject:forKey:", errorCode, CFSTR("error_code"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  sectionId = self->_sectionId;
  if (sectionId)
    objc_msgSend(v3, "setObject:forKey:", sectionId, CFSTR("section_id"));
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId)
    objc_msgSend(v3, "setObject:forKey:", articleViewingSessionId, CFSTR("article_viewing_session_id"));
  v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_parentFeedType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_24CD4FE10[parentFeedType];
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("parent_feed_type"));

    v15 = (char)self->_has;
    if ((v15 & 0x20) == 0)
    {
LABEL_25:
      if ((v15 & 0x10) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_subscriptionOnlyArticlePreview);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("subscription_only_article_preview"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_arrivedFromAd);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("arrived_from_ad"));

  }
LABEL_27:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken)
    objc_msgSend(v3, "setObject:forKey:", iadQtoken, CFSTR("iad_qtoken"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBShareInformationScreenViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }
LABEL_5:
  if (self->_errorMessage)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_sectionId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_19:
      if ((v6 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
LABEL_21:
  if (self->_iadQtoken)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_userAction;
    *(_BYTE *)(v5 + 88) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 56) = self->_resultType;
  *(_BYTE *)(v5 + 88) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 48) = self->_paidSubscriptionConversionPointType;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_errorMessage, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_errorCode, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v12;

  v14 = -[NSString copyWithZone:](self->_sectionId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v14;

  v16 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v16;

  v18 = -[NSData copyWithZone:](self->_articleViewingSessionId, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v18;

  v20 = (char)self->_has;
  if ((v20 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_7;
LABEL_14:
    *(_BYTE *)(v6 + 85) = self->_subscriptionOnlyArticlePreview;
    *(_BYTE *)(v6 + 88) |= 0x20u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 52) = self->_parentFeedType;
  *(_BYTE *)(v6 + 88) |= 2u;
  v20 = (char)self->_has;
  if ((v20 & 0x20) != 0)
    goto LABEL_14;
LABEL_7:
  if ((v20 & 0x10) != 0)
  {
LABEL_8:
    *(_BYTE *)(v6 + 84) = self->_arrivedFromAd;
    *(_BYTE *)(v6 + 88) |= 0x10u;
  }
LABEL_9:
  v21 = -[NSString copyWithZone:](self->_iadQtoken, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *errorMessage;
  NSString *errorCode;
  NSString *sourceChannelId;
  NSString *sectionId;
  NSString *articleId;
  NSData *articleViewingSessionId;
  char v11;
  NSString *iadQtoken;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0 || self->_userAction != *((_DWORD *)v4 + 20))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_resultType != *((_DWORD *)v4 + 14))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 12))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_46;
  }
  errorMessage = self->_errorMessage;
  if ((unint64_t)errorMessage | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](errorMessage, "isEqual:"))
  {
    goto LABEL_46;
  }
  errorCode = self->_errorCode;
  if ((unint64_t)errorCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorCode, "isEqual:"))
      goto LABEL_46;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_46;
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:"))
      goto LABEL_46;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:"))
      goto LABEL_46;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
      goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 13))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x20) == 0)
      goto LABEL_46;
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((_BYTE *)v4 + 85))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 85))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) == 0)
      goto LABEL_52;
LABEL_46:
    v11 = 0;
    goto LABEL_47;
  }
  if ((*((_BYTE *)v4 + 88) & 0x10) == 0)
    goto LABEL_46;
  if (!self->_arrivedFromAd)
  {
    if (!*((_BYTE *)v4 + 84))
      goto LABEL_52;
    goto LABEL_46;
  }
  if (!*((_BYTE *)v4 + 84))
    goto LABEL_46;
LABEL_52:
  iadQtoken = self->_iadQtoken;
  if ((unint64_t)iadQtoken | *((_QWORD *)v4 + 5))
    v11 = -[NSString isEqual:](iadQtoken, "isEqual:");
  else
    v11 = 1;
LABEL_47:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_userAction;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_resultType;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_paidSubscriptionConversionPointType;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSString hash](self->_errorMessage, "hash");
  v7 = -[NSString hash](self->_errorCode, "hash");
  v8 = -[NSString hash](self->_sourceChannelId, "hash");
  v9 = -[NSString hash](self->_sectionId, "hash");
  v10 = -[NSString hash](self->_articleId, "hash");
  v11 = -[NSData hash](self->_articleViewingSessionId, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_10;
LABEL_13:
    v13 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_14:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[NSString hash](self->_iadQtoken, "hash");
  }
  v12 = 2654435761 * self->_parentFeedType;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_13;
LABEL_10:
  v13 = 2654435761 * self->_subscriptionOnlyArticlePreview;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_11:
  v14 = 2654435761 * self->_arrivedFromAd;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[NSString hash](self->_iadQtoken, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 88);
  if ((v5 & 8) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 88);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_resultType = *((_DWORD *)v4 + 14);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_4:
    self->_paidSubscriptionConversionPointType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v7 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBShareInformationScreenView setErrorMessage:](self, "setErrorMessage:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBShareInformationScreenView setErrorCode:](self, "setErrorCode:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[NTPBShareInformationScreenView setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[NTPBShareInformationScreenView setSectionId:](self, "setSectionId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBShareInformationScreenView setArticleId:](self, "setArticleId:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBShareInformationScreenView setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 88);
  if ((v6 & 2) != 0)
  {
    self->_parentFeedType = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 88);
    if ((v6 & 0x20) == 0)
    {
LABEL_19:
      if ((v6 & 0x10) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x20) == 0)
  {
    goto LABEL_19;
  }
  self->_subscriptionOnlyArticlePreview = *((_BYTE *)v4 + 85);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
  {
LABEL_20:
    self->_arrivedFromAd = *((_BYTE *)v4 + 84);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_21:
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBShareInformationScreenView setIadQtoken:](self, "setIadQtoken:");
    v4 = v7;
  }

}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessage, a3);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (NSString)sectionId
{
  return self->_sectionId;
}

- (void)setSectionId:(id)a3
{
  objc_storeStrong((id *)&self->_sectionId, a3);
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewingSessionId, a3);
}

- (BOOL)subscriptionOnlyArticlePreview
{
  return self->_subscriptionOnlyArticlePreview;
}

- (BOOL)arrivedFromAd
{
  return self->_arrivedFromAd;
}

- (NSString)iadQtoken
{
  return self->_iadQtoken;
}

- (void)setIadQtoken:(id)a3
{
  objc_storeStrong((id *)&self->_iadQtoken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
