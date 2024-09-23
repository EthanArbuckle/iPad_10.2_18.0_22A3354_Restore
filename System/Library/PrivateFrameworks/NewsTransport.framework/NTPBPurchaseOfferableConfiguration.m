@implementation NTPBPurchaseOfferableConfiguration

- (NSString)purchaseId
{
  return self->_purchaseId;
}

- (BOOL)preferredOffer
{
  return self->_preferredOffer;
}

- (BOOL)allowsPublisherWebSite
{
  return self->_allowsPublisherWebSite;
}

- (BOOL)allowsPublisherPhoneApp
{
  return self->_allowsPublisherPhoneApp;
}

- (BOOL)allowsPublisherPadApp
{
  return self->_allowsPublisherPadApp;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_purchaseId, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 17) = self->_allowsPublisherPhoneApp;
    *(_BYTE *)(v5 + 20) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_9:
      *(_BYTE *)(v5 + 18) = self->_allowsPublisherWebSite;
      *(_BYTE *)(v5 + 20) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 16) = self->_allowsPublisherPadApp;
  *(_BYTE *)(v5 + 20) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 19) = self->_preferredOffer;
    *(_BYTE *)(v5 + 20) |= 8u;
  }
  return (id)v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBPurchaseOfferableConfiguration setPurchaseId:](self, "setPurchaseId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPurchaseOfferableConfiguration;
  -[NTPBPurchaseOfferableConfiguration dealloc](&v3, sel_dealloc);
}

- (void)setPurchaseId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setPreferredOffer:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_preferredOffer = a3;
}

- (void)setAllowsPublisherWebSite:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_allowsPublisherWebSite = a3;
}

- (void)setAllowsPublisherPhoneApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_allowsPublisherPhoneApp = a3;
}

- (void)setAllowsPublisherPadApp:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_allowsPublisherPadApp = a3;
}

- (BOOL)hasPurchaseId
{
  return self->_purchaseId != 0;
}

- (void)setHasAllowsPublisherPhoneApp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAllowsPublisherPhoneApp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAllowsPublisherPadApp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsPublisherPadApp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAllowsPublisherWebSite:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAllowsPublisherWebSite
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasPreferredOffer:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreferredOffer
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPurchaseOfferableConfiguration;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPurchaseOfferableConfiguration description](&v3, sel_description), -[NTPBPurchaseOfferableConfiguration dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *purchaseId;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  purchaseId = self->_purchaseId;
  if (purchaseId)
    objc_msgSend(v3, "setObject:forKey:", purchaseId, CFSTR("purchase_id"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsPublisherPhoneApp), CFSTR("allows_publisher_phone_app"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsPublisherWebSite), CFSTR("allows_publisher_web_site"));
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsPublisherPadApp), CFSTR("allows_publisher_pad_app"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
LABEL_7:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_preferredOffer), CFSTR("preferred_offer"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPurchaseOfferableConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_purchaseId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      return;
LABEL_11:
    PBDataWriterWriteBOOLField();
    return;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    goto LABEL_11;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *purchaseId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((_QWORD *)a3 + 1))
  {
    v5 = -[NSString isEqual:](purchaseId, "isEqual:");
    if (!v5)
      return v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 20) & 2) == 0)
      goto LABEL_30;
    if (self->_allowsPublisherPhoneApp)
    {
      if (!*((_BYTE *)a3 + 17))
        goto LABEL_30;
    }
    else if (*((_BYTE *)a3 + 17))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)a3 + 20) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 20) & 1) == 0)
      goto LABEL_30;
    if (self->_allowsPublisherPadApp)
    {
      if (!*((_BYTE *)a3 + 16))
        goto LABEL_30;
    }
    else if (*((_BYTE *)a3 + 16))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 20) & 4) != 0)
    {
      if (self->_allowsPublisherWebSite)
      {
        if (!*((_BYTE *)a3 + 18))
          goto LABEL_30;
        goto LABEL_28;
      }
      if (!*((_BYTE *)a3 + 18))
        goto LABEL_28;
    }
LABEL_30:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_BYTE *)a3 + 20) & 4) != 0)
    goto LABEL_30;
LABEL_28:
  LOBYTE(v5) = (*((_BYTE *)a3 + 20) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 20) & 8) == 0)
      goto LABEL_30;
    if (self->_preferredOffer)
    {
      if (!*((_BYTE *)a3 + 19))
        goto LABEL_30;
    }
    else if (*((_BYTE *)a3 + 19))
    {
      goto LABEL_30;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_purchaseId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_allowsPublisherPhoneApp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_allowsPublisherPadApp;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_allowsPublisherWebSite;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_preferredOffer;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 1))
    -[NTPBPurchaseOfferableConfiguration setPurchaseId:](self, "setPurchaseId:");
  v5 = *((_BYTE *)a3 + 20);
  if ((v5 & 2) != 0)
  {
    self->_allowsPublisherPhoneApp = *((_BYTE *)a3 + 17);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)a3 + 20) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_allowsPublisherPadApp = *((_BYTE *)a3 + 16);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      return;
    goto LABEL_7;
  }
LABEL_11:
  self->_allowsPublisherWebSite = *((_BYTE *)a3 + 18);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 20) & 8) == 0)
    return;
LABEL_7:
  self->_preferredOffer = *((_BYTE *)a3 + 19);
  *(_BYTE *)&self->_has |= 8u;
}

@end
