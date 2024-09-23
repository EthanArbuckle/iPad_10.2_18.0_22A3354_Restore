@implementation NTPBPublisherWebAccessOptInRequest

- (BOOL)hasChannelId
{
  return self->_channelId != 0;
}

- (BOOL)hasEmail
{
  return self->_email != 0;
}

- (BOOL)hasPurchaseReceipt
{
  return self->_purchaseReceipt != 0;
}

- (BOOL)hasIapId
{
  return self->_iapId != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
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
  v8.super_class = (Class)NTPBPublisherWebAccessOptInRequest;
  -[NTPBPublisherWebAccessOptInRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBPublisherWebAccessOptInRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *channelId;
  NSString *email;
  NSString *purchaseReceipt;
  NSString *iapId;
  NSString *language;
  NSString *country;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  channelId = self->_channelId;
  if (channelId)
    objc_msgSend(v3, "setObject:forKey:", channelId, CFSTR("channel_id"));
  email = self->_email;
  if (email)
    objc_msgSend(v4, "setObject:forKey:", email, CFSTR("email"));
  purchaseReceipt = self->_purchaseReceipt;
  if (purchaseReceipt)
    objc_msgSend(v4, "setObject:forKey:", purchaseReceipt, CFSTR("purchase_receipt"));
  iapId = self->_iapId;
  if (iapId)
    objc_msgSend(v4, "setObject:forKey:", iapId, CFSTR("iap_id"));
  language = self->_language;
  if (language)
    objc_msgSend(v4, "setObject:forKey:", language, CFSTR("language"));
  country = self->_country;
  if (country)
    objc_msgSend(v4, "setObject:forKey:", country, CFSTR("country"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPublisherWebAccessOptInRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_channelId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_email)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_purchaseReceipt)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_iapId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_channelId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_email, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_purchaseReceipt, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  v12 = -[NSString copyWithZone:](self->_iapId, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSString copyWithZone:](self->_country, "copyWithZone:", a3);
  v17 = (void *)v5[2];
  v5[2] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *channelId;
  NSString *email;
  NSString *purchaseReceipt;
  NSString *iapId;
  NSString *language;
  NSString *country;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((channelId = self->_channelId, !((unint64_t)channelId | v4[1]))
     || -[NSString isEqual:](channelId, "isEqual:"))
    && ((email = self->_email, !((unint64_t)email | v4[3]))
     || -[NSString isEqual:](email, "isEqual:"))
    && ((purchaseReceipt = self->_purchaseReceipt, !((unint64_t)purchaseReceipt | v4[6]))
     || -[NSString isEqual:](purchaseReceipt, "isEqual:"))
    && ((iapId = self->_iapId, !((unint64_t)iapId | v4[4]))
     || -[NSString isEqual:](iapId, "isEqual:"))
    && ((language = self->_language, !((unint64_t)language | v4[5]))
     || -[NSString isEqual:](language, "isEqual:")))
  {
    country = self->_country;
    if ((unint64_t)country | v4[2])
      v11 = -[NSString isEqual:](country, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_channelId, "hash");
  v4 = -[NSString hash](self->_email, "hash") ^ v3;
  v5 = -[NSString hash](self->_purchaseReceipt, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_iapId, "hash");
  v7 = -[NSString hash](self->_language, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_country, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[NTPBPublisherWebAccessOptInRequest setChannelId:](self, "setChannelId:");
  if (v4[3])
    -[NTPBPublisherWebAccessOptInRequest setEmail:](self, "setEmail:");
  if (v4[6])
    -[NTPBPublisherWebAccessOptInRequest setPurchaseReceipt:](self, "setPurchaseReceipt:");
  if (v4[4])
    -[NTPBPublisherWebAccessOptInRequest setIapId:](self, "setIapId:");
  if (v4[5])
    -[NTPBPublisherWebAccessOptInRequest setLanguage:](self, "setLanguage:");
  if (v4[2])
    -[NTPBPublisherWebAccessOptInRequest setCountry:](self, "setCountry:");

}

- (NSString)channelId
{
  return self->_channelId;
}

- (void)setChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_channelId, a3);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_storeStrong((id *)&self->_email, a3);
}

- (NSString)purchaseReceipt
{
  return self->_purchaseReceipt;
}

- (void)setPurchaseReceipt:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseReceipt, a3);
}

- (NSString)iapId
{
  return self->_iapId;
}

- (void)setIapId:(id)a3
{
  objc_storeStrong((id *)&self->_iapId, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_storeStrong((id *)&self->_country, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseReceipt, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_iapId, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_channelId, 0);
}

@end
