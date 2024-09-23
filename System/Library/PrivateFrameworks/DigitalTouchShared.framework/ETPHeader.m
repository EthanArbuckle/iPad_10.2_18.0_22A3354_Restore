@implementation ETPHeader

- (int)messageType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_messageType;
  else
    return 1;
}

- (void)setMessageType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMessageType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if ((a3 - 1) < 8)
    return off_24F6E6AB8[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Tap")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QuickTap")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Heartbeat")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Doodle")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReadReceipt")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Video")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Kiss")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Anger")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSendDate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sendDate = a3;
}

- (void)setHasSendDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSendDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMessageData
{
  return self->_messageData != 0;
}

- (void)setBaseColor:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_baseColor = a3;
}

- (void)setHasBaseColor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBaseColor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setSupportsPlaybackTimeOffsets:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_supportsPlaybackTimeOffsets = a3;
}

- (void)setHasSupportsPlaybackTimeOffsets:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsPlaybackTimeOffsets
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setStartDelay:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startDelay = a3;
}

- (void)setHasStartDelay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDelay
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)ETPHeader;
  -[ETPHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  NSData *messageData;
  void *v9;
  NSString *identifier;
  char v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = self->_messageType - 1;
    if (v5 >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_messageType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_24F6E6AB8[v5];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("messageType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sendDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("sendDate"));

  }
  messageData = self->_messageData;
  if (messageData)
    objc_msgSend(v3, "setObject:forKey:", messageData, CFSTR("messageData"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_baseColor);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("baseColor"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsPlaybackTimeOffsets);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("supportsPlaybackTimeOffsets"));

    v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_startDelay);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("startDelay"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ETPHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  id v6;

  v6 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteSfixed64Field();
  if (self->_messageData)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteFixed32Field();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0)
    PBDataWriterWriteDoubleField();

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
  char v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_messageType;
    *(_BYTE *)(v5 + 56) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_sendDate;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_messageData, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_baseColor;
    *(_BYTE *)(v6 + 56) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 52) = self->_supportsPlaybackTimeOffsets;
    *(_BYTE *)(v6 + 56) |= 0x10u;
    v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_startDelay;
    *(_BYTE *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *messageData;
  NSString *identifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_messageType != *((_DWORD *)v4 + 12))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_sendDate != *((_QWORD *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_35;
  }
  messageData = self->_messageData;
  if ((unint64_t)messageData | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](messageData, "isEqual:"))
      goto LABEL_35;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_baseColor != *((_DWORD *)v4 + 6))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_35;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_35;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
    {
      if (self->_supportsPlaybackTimeOffsets)
      {
        if (!*((_BYTE *)v4 + 52))
          goto LABEL_35;
        goto LABEL_31;
      }
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_31;
    }
LABEL_35:
    v8 = 0;
    goto LABEL_36;
  }
  if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
    goto LABEL_35;
LABEL_31:
  v8 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_startDelay != *((double *)v4 + 2))
      goto LABEL_35;
    v8 = 1;
  }
LABEL_36:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  double startDelay;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761 * self->_messageType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_sendDate;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSData hash](self->_messageData, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_baseColor;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v8 = 2654435761 * self->_supportsPlaybackTimeOffsets;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
LABEL_16:
    v13 = 0;
    return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v13;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_16;
LABEL_11:
  startDelay = self->_startDelay;
  v10 = -startDelay;
  if (startDelay >= 0.0)
    v10 = self->_startDelay;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 8) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 1) != 0)
  {
    self->_sendDate = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[ETPHeader setMessageData:](self, "setMessageData:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    self->_baseColor = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ETPHeader setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 0x10) != 0)
  {
    self->_supportsPlaybackTimeOffsets = *((_BYTE *)v4 + 52);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)v4 + 56);
  }
  if ((v6 & 2) != 0)
  {
    self->_startDelay = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (int64_t)sendDate
{
  return self->_sendDate;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
  objc_storeStrong((id *)&self->_messageData, a3);
}

- (unsigned)baseColor
{
  return self->_baseColor;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)supportsPlaybackTimeOffsets
{
  return self->_supportsPlaybackTimeOffsets;
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
