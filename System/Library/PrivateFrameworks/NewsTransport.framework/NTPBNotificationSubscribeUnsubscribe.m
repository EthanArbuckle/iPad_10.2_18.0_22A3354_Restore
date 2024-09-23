@implementation NTPBNotificationSubscribeUnsubscribe

- (int)userAction
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_userAction;
  else
    return 0;
}

- (void)setUserAction:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserAction
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)notificationSubscribeUnsubscribeLocation
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_notificationSubscribeUnsubscribeLocation;
  else
    return 0;
}

- (void)setNotificationSubscribeUnsubscribeLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_notificationSubscribeUnsubscribeLocation = a3;
}

- (void)setHasNotificationSubscribeUnsubscribeLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNotificationSubscribeUnsubscribeLocation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (void)setIsPaidUserOfChannel:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isPaidUserOfChannel = a3;
}

- (void)setHasIsPaidUserOfChannel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPaidUserOfChannel
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (BOOL)hasCampaignType
{
  return self->_campaignType != 0;
}

- (BOOL)hasCreativeId
{
  return self->_creativeId != 0;
}

- (int)notificationSettingType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_notificationSettingType;
  else
    return 0;
}

- (void)setNotificationSettingType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_notificationSettingType = a3;
}

- (void)setHasNotificationSettingType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationSettingType
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NTPBNotificationSubscribeUnsubscribe;
  -[NTPBNotificationSubscribeUnsubscribe description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBNotificationSubscribeUnsubscribe dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *channelId;
  void *v8;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_userAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("user_action"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notificationSubscribeUnsubscribeLocation);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("notification_subscribe_unsubscribe_location"));

  }
  channelId = self->_channelId;
  if (channelId)
    objc_msgSend(v3, "setObject:forKey:", channelId, CFSTR("channel_id"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidUserOfChannel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("is_paid_user_of_channel"));

  }
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v3, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  campaignType = self->_campaignType;
  if (campaignType)
    objc_msgSend(v3, "setObject:forKey:", campaignType, CFSTR("campaign_type"));
  creativeId = self->_creativeId;
  if (creativeId)
    objc_msgSend(v3, "setObject:forKey:", creativeId, CFSTR("creative_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notificationSettingType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("notification_setting_type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationSubscribeUnsubscribeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_channelId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  if (self->_campaignType)
    PBDataWriterWriteStringField();
  if (self->_creativeId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_userAction;
    *(_BYTE *)(v5 + 56) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_notificationSubscribeUnsubscribeLocation;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_channelId, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v6 + 52) = self->_isPaidUserOfChannel;
    *(_BYTE *)(v6 + 56) |= 8u;
  }
  v10 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_notificationSettingType;
    *(_BYTE *)(v6 + 56) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *channelId;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_userAction != *((_DWORD *)v4 + 12))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_notificationSubscribeUnsubscribeLocation != *((_DWORD *)v4 + 11))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_33;
  }
  channelId = self->_channelId;
  if ((unint64_t)channelId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](channelId, "isEqual:"))
      goto LABEL_33;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) != 0)
    {
      if (self->_isPaidUserOfChannel)
      {
        if (!*((_BYTE *)v4 + 52))
          goto LABEL_33;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_23;
    }
LABEL_33:
    v10 = 0;
    goto LABEL_34;
  }
  if ((*((_BYTE *)v4 + 56) & 8) != 0)
    goto LABEL_33;
LABEL_23:
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](campaignId, "isEqual:"))
    goto LABEL_33;
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_33;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:"))
      goto LABEL_33;
  }
  v10 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_notificationSettingType != *((_DWORD *)v4 + 10))
      goto LABEL_33;
    v10 = 1;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_userAction;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_notificationSubscribeUnsubscribeLocation;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_channelId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v6 = 2654435761 * self->_isPaidUserOfChannel;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_campaignId, "hash");
  v8 = -[NSString hash](self->_campaignType, "hash");
  v9 = -[NSString hash](self->_creativeId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_notificationSettingType;
  else
    v10 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 4) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_notificationSubscribeUnsubscribeLocation = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBNotificationSubscribeUnsubscribe setChannelId:](self, "setChannelId:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    self->_isPaidUserOfChannel = *((_BYTE *)v4 + 52);
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBNotificationSubscribeUnsubscribe setCampaignId:](self, "setCampaignId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBNotificationSubscribeUnsubscribe setCampaignType:](self, "setCampaignType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBNotificationSubscribeUnsubscribe setCreativeId:](self, "setCreativeId:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_notificationSettingType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_channelId, a3);
}

- (BOOL)isPaidUserOfChannel
{
  return self->_isPaidUserOfChannel;
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_campaignId, a3);
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
  objc_storeStrong((id *)&self->_campaignType, a3);
}

- (NSString)creativeId
{
  return self->_creativeId;
}

- (void)setCreativeId:(id)a3
{
  objc_storeStrong((id *)&self->_creativeId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_channelId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end
