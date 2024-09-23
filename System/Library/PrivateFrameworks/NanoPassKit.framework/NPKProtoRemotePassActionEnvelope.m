@implementation NPKProtoRemotePassActionEnvelope

- (id)messageTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CFEC708[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EnterValue")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SelectItem")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCaption
{
  return self->_caption != 0;
}

- (BOOL)hasPassLocalizedDescription
{
  return self->_passLocalizedDescription != 0;
}

- (BOOL)hasSummaryText
{
  return self->_summaryText != 0;
}

- (BOOL)hasPassOrganizationName
{
  return self->_passOrganizationName != 0;
}

- (int)cardType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cardType;
  else
    return 0;
}

- (void)setCardType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cardType = a3;
}

- (void)setHasCardType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCardType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)cardTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CFEC720[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCardType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Transit")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EMoney")))
  {
    v4 = 2;
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
  v8.super_class = (Class)NPKProtoRemotePassActionEnvelope;
  -[NPKProtoRemotePassActionEnvelope description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemotePassActionEnvelope dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t messageType;
  __CFString *v6;
  NSData *messageProtoData;
  void *v8;
  NSString *caption;
  NSString *passLocalizedDescription;
  NSString *summaryText;
  NSString *passOrganizationName;
  uint64_t cardType;
  __CFString *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  messageType = self->_messageType;
  if (messageType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_messageType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_24CFEC708[messageType];
  }
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("messageType"));

  messageProtoData = self->_messageProtoData;
  if (messageProtoData)
    objc_msgSend(v3, "setObject:forKey:", messageProtoData, CFSTR("messageProtoData"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isResponse);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isResponse"));

  caption = self->_caption;
  if (caption)
    objc_msgSend(v3, "setObject:forKey:", caption, CFSTR("caption"));
  passLocalizedDescription = self->_passLocalizedDescription;
  if (passLocalizedDescription)
    objc_msgSend(v3, "setObject:forKey:", passLocalizedDescription, CFSTR("passLocalizedDescription"));
  summaryText = self->_summaryText;
  if (summaryText)
    objc_msgSend(v3, "setObject:forKey:", summaryText, CFSTR("summaryText"));
  passOrganizationName = self->_passOrganizationName;
  if (passOrganizationName)
    objc_msgSend(v3, "setObject:forKey:", passOrganizationName, CFSTR("passOrganizationName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    cardType = self->_cardType;
    if (cardType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cardType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_24CFEC720[cardType];
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cardType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionEnvelopeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteInt32Field();
  if (!self->_messageProtoData)
    -[NPKProtoRemotePassActionEnvelope writeTo:].cold.1();
  PBDataWriterWriteDataField();
  PBDataWriterWriteBOOLField();
  if (self->_caption)
    PBDataWriterWriteStringField();
  if (self->_passLocalizedDescription)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_summaryText)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_passOrganizationName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v5 = a3;
  v5[16] = self->_version;
  v5[8] = self->_messageType;
  objc_msgSend(v5, "setMessageProtoData:", self->_messageProtoData);
  v4 = v5;
  *((_BYTE *)v5 + 68) = self->_isResponse;
  if (self->_caption)
  {
    objc_msgSend(v5, "setCaption:");
    v4 = v5;
  }
  if (self->_passLocalizedDescription)
  {
    objc_msgSend(v5, "setPassLocalizedDescription:");
    v4 = v5;
  }
  if (self->_summaryText)
  {
    objc_msgSend(v5, "setSummaryText:");
    v4 = v5;
  }
  if (self->_passOrganizationName)
  {
    objc_msgSend(v5, "setPassOrganizationName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_cardType;
    *((_BYTE *)v4 + 72) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 64) = self->_version;
  *(_DWORD *)(v5 + 32) = self->_messageType;
  v6 = -[NSData copyWithZone:](self->_messageProtoData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(_BYTE *)(v5 + 68) = self->_isResponse;
  v8 = -[NSString copyWithZone:](self->_caption, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_passLocalizedDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_summaryText, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  v14 = -[NSString copyWithZone:](self->_passOrganizationName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_cardType;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *messageProtoData;
  NSString *caption;
  NSString *passLocalizedDescription;
  NSString *summaryText;
  NSString *passOrganizationName;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if (self->_version != *((_DWORD *)v4 + 16))
    goto LABEL_22;
  if (self->_messageType != *((_DWORD *)v4 + 8))
    goto LABEL_22;
  messageProtoData = self->_messageProtoData;
  if ((unint64_t)messageProtoData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](messageProtoData, "isEqual:"))
      goto LABEL_22;
  }
  if (self->_isResponse)
  {
    if (!*((_BYTE *)v4 + 68))
      goto LABEL_22;
  }
  else if (*((_BYTE *)v4 + 68))
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  caption = self->_caption;
  if ((unint64_t)caption | *((_QWORD *)v4 + 1) && !-[NSString isEqual:](caption, "isEqual:"))
    goto LABEL_22;
  passLocalizedDescription = self->_passLocalizedDescription;
  if ((unint64_t)passLocalizedDescription | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](passLocalizedDescription, "isEqual:"))
      goto LABEL_22;
  }
  summaryText = self->_summaryText;
  if ((unint64_t)summaryText | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](summaryText, "isEqual:"))
      goto LABEL_22;
  }
  passOrganizationName = self->_passOrganizationName;
  if ((unint64_t)passOrganizationName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](passOrganizationName, "isEqual:"))
      goto LABEL_22;
  }
  v10 = (*((_BYTE *)v4 + 72) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_cardType != *((_DWORD *)v4 + 4))
      goto LABEL_22;
    v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  unsigned int version;
  uint64_t messageType;
  uint64_t v5;
  _BOOL4 isResponse;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;

  version = self->_version;
  messageType = self->_messageType;
  v5 = -[NSData hash](self->_messageProtoData, "hash");
  isResponse = self->_isResponse;
  v7 = -[NSString hash](self->_caption, "hash");
  v8 = -[NSString hash](self->_passLocalizedDescription, "hash");
  v9 = -[NSString hash](self->_summaryText, "hash");
  v10 = -[NSString hash](self->_passOrganizationName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_cardType;
  else
    v11 = 0;
  return (2654435761 * messageType) ^ (2654435761 * version) ^ v5 ^ (2654435761 * isResponse) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 16);
  self->_messageType = *((_DWORD *)v4 + 8);
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoRemotePassActionEnvelope setMessageProtoData:](self, "setMessageProtoData:");
    v4 = v5;
  }
  self->_isResponse = *((_BYTE *)v4 + 68);
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoRemotePassActionEnvelope setCaption:](self, "setCaption:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NPKProtoRemotePassActionEnvelope setPassLocalizedDescription:](self, "setPassLocalizedDescription:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NPKProtoRemotePassActionEnvelope setSummaryText:](self, "setSummaryText:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NPKProtoRemotePassActionEnvelope setPassOrganizationName:](self, "setPassOrganizationName:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_cardType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (NSData)messageProtoData
{
  return self->_messageProtoData;
}

- (void)setMessageProtoData:(id)a3
{
  objc_storeStrong((id *)&self->_messageProtoData, a3);
}

- (BOOL)isResponse
{
  return self->_isResponse;
}

- (void)setIsResponse:(BOOL)a3
{
  self->_isResponse = a3;
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_storeStrong((id *)&self->_caption, a3);
}

- (NSString)passLocalizedDescription
{
  return self->_passLocalizedDescription;
}

- (void)setPassLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_passLocalizedDescription, a3);
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (void)setSummaryText:(id)a3
{
  objc_storeStrong((id *)&self->_summaryText, a3);
}

- (NSString)passOrganizationName
{
  return self->_passOrganizationName;
}

- (void)setPassOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_passOrganizationName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_passOrganizationName, 0);
  objc_storeStrong((id *)&self->_passLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_messageProtoData, 0);
  objc_storeStrong((id *)&self->_caption, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionEnvelope writeTo:]", "NPKProtoRemotePassActionEnvelope.m", 205, "nil != self->_messageProtoData");
}

@end
