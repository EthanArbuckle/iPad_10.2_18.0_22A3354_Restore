@implementation NTPBArticleEngagement

- (int)articleEngagementType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_articleEngagementType;
  else
    return 0;
}

- (void)setArticleEngagementType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_articleEngagementType = a3;
}

- (void)setHasArticleEngagementType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasArticleEngagementType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (void)setEventTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventTimestamp = a3;
}

- (void)setHasEventTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (void)setUtcOffset:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_utcOffset = a3;
}

- (void)setHasUtcOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUtcOffset
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setArticleOpenedAtTimestamp:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_articleOpenedAtTimestamp = a3;
}

- (void)setHasArticleOpenedAtTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArticleOpenedAtTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsPaidSubscriber:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isPaidSubscriber = a3;
}

- (void)setHasIsPaidSubscriber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsPaidSubscriber
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
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
  v8.super_class = (Class)NTPBArticleEngagement;
  -[NTPBArticleEngagement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBArticleEngagement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *sessionId;
  NSString *userId;
  void *v7;
  NSString *articleId;
  NSString *channelId;
  void *v10;
  NSString *countryCode;
  char has;
  void *v13;
  void *v14;
  NTPBIssueData *issueData;
  void *v16;
  NTPBIssueViewData *issueViewData;
  void *v18;
  NSString *deviceModel;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_articleEngagementType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("article_engagement_type"));

  }
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("session_id"));
  userId = self->_userId;
  if (userId)
    objc_msgSend(v3, "setObject:forKey:", userId, CFSTR("user_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_eventTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("event_timestamp"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  channelId = self->_channelId;
  if (channelId)
    objc_msgSend(v3, "setObject:forKey:", channelId, CFSTR("channel_id"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_utcOffset);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("utc_offset"));

  }
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v3, "setObject:forKey:", countryCode, CFSTR("country_code"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_articleOpenedAtTimestamp);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("article_opened_at_timestamp"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriber);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("is_paid_subscriber"));

  }
  issueData = self->_issueData;
  if (issueData)
  {
    -[NTPBIssueData dictionaryRepresentation](issueData, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("issue_data"));

  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    -[NTPBIssueViewData dictionaryRepresentation](issueViewData, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("issue_view_data"));

  }
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("device_model"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleEngagementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_sessionId)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_channelId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_issueViewData)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
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
  char has;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_articleEngagementType;
    *(_BYTE *)(v5 + 104) |= 4u;
  }
  v7 = -[NSData copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v7;

  v9 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_eventTimestamp;
    *(_BYTE *)(v6 + 104) |= 2u;
  }
  v11 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_channelId, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_utcOffset;
    *(_BYTE *)(v6 + 104) |= 8u;
  }
  v15 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_articleOpenedAtTimestamp;
    *(_BYTE *)(v6 + 104) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 100) = self->_isPaidSubscriber;
    *(_BYTE *)(v6 + 104) |= 0x10u;
  }
  v18 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v18;

  v20 = -[NTPBIssueViewData copyWithZone:](self->_issueViewData, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v20;

  v22 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v22;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *sessionId;
  NSString *userId;
  NSString *articleId;
  NSString *channelId;
  char has;
  NSString *countryCode;
  NTPBIssueData *issueData;
  NTPBIssueViewData *issueViewData;
  NSString *deviceModel;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 4) == 0 || self->_articleEngagementType != *((_DWORD *)v4 + 6))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 104) & 4) != 0)
  {
    goto LABEL_47;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 10) && !-[NSData isEqual:](sessionId, "isEqual:"))
    goto LABEL_47;
  userId = self->_userId;
  if ((unint64_t)userId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](userId, "isEqual:"))
      goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 2) == 0 || self->_eventTimestamp != *((_QWORD *)v4 + 2))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 104) & 2) != 0)
  {
    goto LABEL_47;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_47;
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](channelId, "isEqual:"))
      goto LABEL_47;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 8) == 0 || self->_utcOffset != *((_DWORD *)v4 + 24))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 104) & 8) != 0)
  {
    goto LABEL_47;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_47;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_articleOpenedAtTimestamp != *((_QWORD *)v4 + 1))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
    {
      if (self->_isPaidSubscriber)
      {
        if (!*((_BYTE *)v4 + 100))
          goto LABEL_47;
        goto LABEL_41;
      }
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_41;
    }
LABEL_47:
    v14 = 0;
    goto LABEL_48;
  }
  if ((*((_BYTE *)v4 + 104) & 0x10) != 0)
    goto LABEL_47;
LABEL_41:
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((_QWORD *)v4 + 8) && !-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    goto LABEL_47;
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((_QWORD *)v4 + 9))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:"))
      goto LABEL_47;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 7))
    v14 = -[NSString isEqual:](deviceModel, "isEqual:");
  else
    v14 = 1;
LABEL_48:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_articleEngagementType;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_sessionId, "hash");
  v5 = -[NSString hash](self->_userId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_eventTimestamp;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_articleId, "hash");
  v8 = -[NSString hash](self->_channelId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v9 = 2654435761 * self->_utcOffset;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_countryCode, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v11 = 2654435761 * self->_articleOpenedAtTimestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_12;
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_12:
  v12 = 2654435761 * self->_isPaidSubscriber;
LABEL_15:
  v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NTPBIssueData hash](self->_issueData, "hash");
  v14 = -[NTPBIssueViewData hash](self->_issueViewData, "hash");
  return v13 ^ v14 ^ -[NSString hash](self->_deviceModel, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  NTPBIssueData *issueData;
  uint64_t v8;
  NTPBIssueViewData *issueViewData;
  uint64_t v10;
  _DWORD *v11;

  v4 = a3;
  v5 = v4;
  if ((v4[26] & 4) != 0)
  {
    self->_articleEngagementType = v4[6];
    *(_BYTE *)&self->_has |= 4u;
  }
  v11 = v4;
  if (*((_QWORD *)v4 + 10))
  {
    -[NTPBArticleEngagement setSessionId:](self, "setSessionId:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 11))
  {
    -[NTPBArticleEngagement setUserId:](self, "setUserId:");
    v5 = v11;
  }
  if ((*((_BYTE *)v5 + 104) & 2) != 0)
  {
    self->_eventTimestamp = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[NTPBArticleEngagement setArticleId:](self, "setArticleId:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[NTPBArticleEngagement setChannelId:](self, "setChannelId:");
    v5 = v11;
  }
  if ((*((_BYTE *)v5 + 104) & 8) != 0)
  {
    self->_utcOffset = *((_DWORD *)v5 + 24);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v5 + 6))
  {
    -[NTPBArticleEngagement setCountryCode:](self, "setCountryCode:");
    v5 = v11;
  }
  v6 = *((_BYTE *)v5 + 104);
  if ((v6 & 1) != 0)
  {
    self->_articleOpenedAtTimestamp = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v5 + 104);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_isPaidSubscriber = *((_BYTE *)v5 + 100);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  issueData = self->_issueData;
  v8 = *((_QWORD *)v5 + 8);
  if (issueData)
  {
    if (!v8)
      goto LABEL_27;
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_27;
    -[NTPBArticleEngagement setIssueData:](self, "setIssueData:");
  }
  v5 = v11;
LABEL_27:
  issueViewData = self->_issueViewData;
  v10 = *((_QWORD *)v5 + 9);
  if (issueViewData)
  {
    if (!v10)
      goto LABEL_33;
    -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_33;
    -[NTPBArticleEngagement setIssueViewData:](self, "setIssueViewData:");
  }
  v5 = v11;
LABEL_33:
  if (*((_QWORD *)v5 + 7))
  {
    -[NTPBArticleEngagement setDeviceModel:](self, "setDeviceModel:");
    v5 = v11;
  }

}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (int64_t)eventTimestamp
{
  return self->_eventTimestamp;
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_channelId, a3);
}

- (int)utcOffset
{
  return self->_utcOffset;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (int64_t)articleOpenedAtTimestamp
{
  return self->_articleOpenedAtTimestamp;
}

- (BOOL)isPaidSubscriber
{
  return self->_isPaidSubscriber;
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
  objc_storeStrong((id *)&self->_issueData, a3);
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
  objc_storeStrong((id *)&self->_issueViewData, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_channelId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
