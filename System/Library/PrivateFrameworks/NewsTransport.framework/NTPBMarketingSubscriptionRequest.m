@implementation NTPBMarketingSubscriptionRequest

- (int)subscriptionType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_subscriptionType;
  else
    return 0;
}

- (void)setSubscriptionType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_subscriptionType = a3;
}

- (void)setHasSubscriptionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubscriptionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)subscriptionAction
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_subscriptionAction;
  else
    return 0;
}

- (void)setSubscriptionAction:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_subscriptionAction = a3;
}

- (void)setHasSubscriptionAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubscriptionAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDsid
{
  return self->_dsid != 0;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
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
  v8.super_class = (Class)NTPBMarketingSubscriptionRequest;
  -[NTPBMarketingSubscriptionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBMarketingSubscriptionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *dsid;
  NTPBDeviceInfo *deviceInfo;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_subscriptionType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("subscription_type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_subscriptionAction);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("subscription_action"));

  }
  dsid = self->_dsid;
  if (dsid)
    objc_msgSend(v3, "setObject:forKey:", dsid, CFSTR("dsid"));
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    -[NTPBDeviceInfo dictionaryRepresentation](deviceInfo, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("device_info"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMarketingSubscriptionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_dsid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_deviceInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_subscriptionType;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_subscriptionAction;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_dsid, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = -[NTPBDeviceInfo copyWithZone:](self->_deviceInfo, "copyWithZone:", a3);
  v11 = (void *)v6[1];
  v6[1] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *dsid;
  NTPBDeviceInfo *deviceInfo;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_subscriptionType != *((_DWORD *)v4 + 7))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_subscriptionAction != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_16;
  }
  dsid = self->_dsid;
  if ((unint64_t)dsid | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](dsid, "isEqual:"))
    goto LABEL_16;
  deviceInfo = self->_deviceInfo;
  if ((unint64_t)deviceInfo | *((_QWORD *)v4 + 1))
    v7 = -[NTPBDeviceInfo isEqual:](deviceInfo, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_subscriptionType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_subscriptionAction;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_dsid, "hash");
  return v5 ^ -[NTPBDeviceInfo hash](self->_deviceInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  NTPBDeviceInfo *deviceInfo;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 32);
  if ((v6 & 2) != 0)
  {
    self->_subscriptionType = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 32);
  }
  if ((v6 & 1) != 0)
  {
    self->_subscriptionAction = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v9 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBMarketingSubscriptionRequest setDsid:](self, "setDsid:");
    v5 = v9;
  }
  deviceInfo = self->_deviceInfo;
  v8 = v5[1];
  if (deviceInfo)
  {
    if (v8)
    {
      -[NTPBDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
LABEL_12:
      v5 = v9;
    }
  }
  else if (v8)
  {
    -[NTPBMarketingSubscriptionRequest setDeviceInfo:](self, "setDeviceInfo:");
    goto LABEL_12;
  }

}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (NTPBDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
