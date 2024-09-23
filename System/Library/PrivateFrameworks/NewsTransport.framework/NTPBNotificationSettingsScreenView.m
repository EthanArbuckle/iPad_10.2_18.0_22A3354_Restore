@implementation NTPBNotificationSettingsScreenView

- (int)notificationSettingsScreenViewPresentationReason
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_notificationSettingsScreenViewPresentationReason;
  else
    return 0;
}

- (void)setNotificationSettingsScreenViewPresentationReason:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_notificationSettingsScreenViewPresentationReason = a3;
}

- (void)setHasNotificationSettingsScreenViewPresentationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationSettingsScreenViewPresentationReason
{
  return *(_BYTE *)&self->_has & 1;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBNotificationSettingsScreenView;
  -[NTPBNotificationSettingsScreenView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBNotificationSettingsScreenView dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_notificationSettingsScreenViewPresentationReason);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("notification_settings_screen_view_presentation_reason"));

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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNotificationSettingsScreenViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_campaignId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_campaignType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_creativeId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_notificationSettingsScreenViewPresentationReason;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_campaignType, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[NSString copyWithZone:](self->_creativeId, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *campaignId;
  NSString *campaignType;
  NSString *creativeId;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0
      || self->_notificationSettingsScreenViewPresentationReason != *((_DWORD *)v4 + 8))
    {
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](campaignId, "isEqual:"))
    goto LABEL_13;
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:"))
      goto LABEL_13;
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((_QWORD *)v4 + 3))
    v8 = -[NSString isEqual:](creativeId, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_notificationSettingsScreenViewPresentationReason;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_campaignId, "hash") ^ v3;
  v5 = -[NSString hash](self->_campaignType, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_creativeId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[9] & 1) != 0)
  {
    self->_notificationSettingsScreenViewPresentationReason = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBNotificationSettingsScreenView setCampaignId:](self, "setCampaignId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBNotificationSettingsScreenView setCampaignType:](self, "setCampaignType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBNotificationSettingsScreenView setCreativeId:](self, "setCreativeId:");
    v4 = v5;
  }

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
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end
