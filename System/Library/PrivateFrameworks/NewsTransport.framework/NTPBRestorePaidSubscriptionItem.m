@implementation NTPBRestorePaidSubscriptionItem

- (BOOL)hasRestoredPaidSubscriptionChannelId
{
  return self->_restoredPaidSubscriptionChannelId != 0;
}

- (void)setIsNewsAppPurchase:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isNewsAppPurchase = a3;
}

- (void)setHasIsNewsAppPurchase:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsNewsAppPurchase
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
  v8.super_class = (Class)NTPBRestorePaidSubscriptionItem;
  -[NTPBRestorePaidSubscriptionItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBRestorePaidSubscriptionItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *restoredPaidSubscriptionChannelId;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  restoredPaidSubscriptionChannelId = self->_restoredPaidSubscriptionChannelId;
  if (restoredPaidSubscriptionChannelId)
    objc_msgSend(v3, "setObject:forKey:", restoredPaidSubscriptionChannelId, CFSTR("restored_paid_subscription_channel_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNewsAppPurchase);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("is_news_app_purchase"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBRestorePaidSubscriptionItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_restoredPaidSubscriptionChannelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_restoredPaidSubscriptionChannelId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_isNewsAppPurchase;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *restoredPaidSubscriptionChannelId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  restoredPaidSubscriptionChannelId = self->_restoredPaidSubscriptionChannelId;
  if ((unint64_t)restoredPaidSubscriptionChannelId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](restoredPaidSubscriptionChannelId, "isEqual:"))
      goto LABEL_6;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      v6 = 0;
      goto LABEL_7;
    }
    if (self->_isNewsAppPurchase)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_6;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_6;
    }
    v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_restoredPaidSubscriptionChannelId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_isNewsAppPurchase;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[NTPBRestorePaidSubscriptionItem setRestoredPaidSubscriptionChannelId:](self, "setRestoredPaidSubscriptionChannelId:");
    v4 = v5;
  }
  if (v4[20])
  {
    self->_isNewsAppPurchase = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)restoredPaidSubscriptionChannelId
{
  return self->_restoredPaidSubscriptionChannelId;
}

- (void)setRestoredPaidSubscriptionChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_restoredPaidSubscriptionChannelId, a3);
}

- (BOOL)isNewsAppPurchase
{
  return self->_isNewsAppPurchase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoredPaidSubscriptionChannelId, 0);
}

@end
