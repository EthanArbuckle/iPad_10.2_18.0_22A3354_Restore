@implementation NTPBUserPaidSubscriptionStatus

- (int)paidSubscriptionStatus
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_paidSubscriptionStatus;
  else
    return 0;
}

- (void)setPaidSubscriptionStatus:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_paidSubscriptionStatus = a3;
}

- (void)setHasPaidSubscriptionStatus:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPaidSubscriptionStatus
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)paidSubscriptionStatusAsString:(int)a3
{
  if (a3 < 4)
    return *(&off_24CD53758 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPaidSubscriptionStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PAID_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE_TRIAL_PAID_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACTIVE_PAYING_PAID_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXPIRED_PAID_SUBSCRIPTION_STATUS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPaidSubscriptionChannelId
{
  return self->_paidSubscriptionChannelId != 0;
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
  v8.super_class = (Class)NTPBUserPaidSubscriptionStatus;
  -[NTPBUserPaidSubscriptionStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBUserPaidSubscriptionStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t paidSubscriptionStatus;
  void *v5;
  NSString *paidSubscriptionChannelId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    paidSubscriptionStatus = self->_paidSubscriptionStatus;
    if (paidSubscriptionStatus >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paidSubscriptionStatus);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_24CD53758 + paidSubscriptionStatus);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("paid_subscription_status"));

  }
  paidSubscriptionChannelId = self->_paidSubscriptionChannelId;
  if (paidSubscriptionChannelId)
    objc_msgSend(v3, "setObject:forKey:", paidSubscriptionChannelId, CFSTR("paid_subscription_channel_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserPaidSubscriptionStatusReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_paidSubscriptionChannelId)
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_paidSubscriptionStatus;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_paidSubscriptionChannelId, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *paidSubscriptionChannelId;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_paidSubscriptionStatus != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  paidSubscriptionChannelId = self->_paidSubscriptionChannelId;
  if ((unint64_t)paidSubscriptionChannelId | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](paidSubscriptionChannelId, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_paidSubscriptionStatus;
  else
    v2 = 0;
  return -[NSString hash](self->_paidSubscriptionChannelId, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_paidSubscriptionStatus = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[NTPBUserPaidSubscriptionStatus setPaidSubscriptionChannelId:](self, "setPaidSubscriptionChannelId:");
    v4 = v5;
  }

}

- (NSString)paidSubscriptionChannelId
{
  return self->_paidSubscriptionChannelId;
}

- (void)setPaidSubscriptionChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_paidSubscriptionChannelId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paidSubscriptionChannelId, 0);
}

@end
