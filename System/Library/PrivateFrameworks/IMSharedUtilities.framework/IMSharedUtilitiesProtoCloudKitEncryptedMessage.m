@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessage

- (void)dealloc
{
  objc_super v3;

  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageSubject:](self, "setMessageSubject:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageBody:](self, "setMessageBody:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageBodyData:](self, "setMessageBodyData:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setBaloonBundleId:](self, "setBaloonBundleId:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setPayloadData:](self, "setPayloadData:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageSummaryInfo:](self, "setMessageSummaryInfo:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setExpressiveSendId:](self, "setExpressiveSendId:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setPadding:](self, "setPadding:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setAssociatedMessageGuid:](self, "setAssociatedMessageGuid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessage;
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessage dealloc](&v3, sel_dealloc);
}

- (void)setVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasVersion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasMessageSubject
{
  return self->_messageSubject != 0;
}

- (BOOL)hasMessageBody
{
  return self->_messageBody != 0;
}

- (BOOL)hasMessageBodyData
{
  return self->_messageBodyData != 0;
}

- (BOOL)hasBaloonBundleId
{
  return self->_baloonBundleId != 0;
}

- (BOOL)hasPayloadData
{
  return self->_payloadData != 0;
}

- (BOOL)hasMessageSummaryInfo
{
  return self->_messageSummaryInfo != 0;
}

- (BOOL)hasExpressiveSendId
{
  return self->_expressiveSendId != 0;
}

- (void)setTimeRead:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timeRead = a3;
}

- (void)setHasTimeRead:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimeRead
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTimePlayed:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timePlayed = a3;
}

- (void)setHasTimePlayed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimePlayed
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTimeExpressiveSentPlayed:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timeExpressiveSentPlayed = a3;
}

- (void)setHasTimeExpressiveSentPlayed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimeExpressiveSentPlayed
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (void)setTimeDelivered:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timeDelivered = a3;
}

- (void)setHasTimeDelivered:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimeDelivered
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setExpireState:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_expireState = a3;
}

- (void)setHasExpireState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasExpireState
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAssociatedMessageType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_associatedMessageType = a3;
}

- (void)setHasAssociatedMessageType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAssociatedMessageType
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasAssociatedMessageGuid
{
  return self->_associatedMessageGuid != 0;
}

- (void)setAssociatedMessageRangeLocation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_associatedMessageRangeLocation = a3;
}

- (void)setHasAssociatedMessageRangeLocation:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAssociatedMessageRangeLocation
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAssociatedMessageRangeLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_associatedMessageRangeLength = a3;
}

- (void)setHasAssociatedMessageRangeLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAssociatedMessageRangeLength
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessage;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[IMSharedUtilitiesProtoCloudKitEncryptedMessage description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessage dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *messageSubject;
  NSString *messageBody;
  NSData *messageBodyData;
  NSString *baloonBundleId;
  NSData *payloadData;
  NSData *messageSummaryInfo;
  NSString *expressiveSendId;
  __int16 has;
  NSData *padding;
  __int16 v13;
  NSString *associatedMessageGuid;
  __int16 v15;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version), CFSTR("version"));
  messageSubject = self->_messageSubject;
  if (messageSubject)
    objc_msgSend(v3, "setObject:forKey:", messageSubject, CFSTR("message_subject"));
  messageBody = self->_messageBody;
  if (messageBody)
    objc_msgSend(v3, "setObject:forKey:", messageBody, CFSTR("message_body"));
  messageBodyData = self->_messageBodyData;
  if (messageBodyData)
    objc_msgSend(v3, "setObject:forKey:", messageBodyData, CFSTR("message_body_data"));
  baloonBundleId = self->_baloonBundleId;
  if (baloonBundleId)
    objc_msgSend(v3, "setObject:forKey:", baloonBundleId, CFSTR("baloon_bundle_id"));
  payloadData = self->_payloadData;
  if (payloadData)
    objc_msgSend(v3, "setObject:forKey:", payloadData, CFSTR("payload_data"));
  messageSummaryInfo = self->_messageSummaryInfo;
  if (messageSummaryInfo)
    objc_msgSend(v3, "setObject:forKey:", messageSummaryInfo, CFSTR("message_summary_info"));
  expressiveSendId = self->_expressiveSendId;
  if (expressiveSendId)
    objc_msgSend(v3, "setObject:forKey:", expressiveSendId, CFSTR("expressive_send_id"));
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timeRead), CFSTR("time_read"));
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_19:
      if ((has & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timePlayed), CFSTR("time_played"));
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_20:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timeExpressiveSentPlayed), CFSTR("time_expressive_sent_played"));
LABEL_21:
  padding = self->_padding;
  if (padding)
    objc_msgSend(v3, "setObject:forKey:", padding, CFSTR("padding"));
  v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timeDelivered), CFSTR("time_delivered"));
    v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_25:
      if ((v13 & 1) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_25;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_expireState), CFSTR("expire_state"));
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_26:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_associatedMessageType), CFSTR("associated_message_type"));
LABEL_27:
  associatedMessageGuid = self->_associatedMessageGuid;
  if (associatedMessageGuid)
    objc_msgSend(v3, "setObject:forKey:", associatedMessageGuid, CFSTR("associated_message_guid"));
  v15 = (__int16)self->_has;
  if ((v15 & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_associatedMessageRangeLocation), CFSTR("associated_message_range_location"));
    v15 = (__int16)self->_has;
  }
  if ((v15 & 0x40) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_associatedMessageRangeLength), CFSTR("associated_message_range_length"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_messageSubject)
    PBDataWriterWriteStringField();
  if (self->_messageBody)
    PBDataWriterWriteStringField();
  if (self->_messageBodyData)
    PBDataWriterWriteDataField();
  if (self->_baloonBundleId)
    PBDataWriterWriteStringField();
  if (self->_payloadData)
    PBDataWriterWriteDataField();
  if (self->_messageSummaryInfo)
    PBDataWriterWriteDataField();
  if (self->_expressiveSendId)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_19:
      if ((has & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 8) != 0)
LABEL_20:
    PBDataWriterWriteUint64Field();
LABEL_21:
  if (self->_padding)
    PBDataWriterWriteDataField();
  v5 = (__int16)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = (__int16)self->_has;
    if ((v5 & 2) == 0)
    {
LABEL_25:
      if ((v5 & 1) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 1) != 0)
LABEL_26:
    PBDataWriterWriteInt64Field();
LABEL_27:
  if (self->_associatedMessageGuid)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has;
  __int16 v6;
  __int16 v7;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_version;
    *((_WORD *)a3 + 70) |= 0x100u;
  }
  if (self->_messageSubject)
    objc_msgSend(a3, "setMessageSubject:");
  if (self->_messageBody)
    objc_msgSend(a3, "setMessageBody:");
  if (self->_messageBodyData)
    objc_msgSend(a3, "setMessageBodyData:");
  if (self->_baloonBundleId)
    objc_msgSend(a3, "setBaloonBundleId:");
  if (self->_payloadData)
    objc_msgSend(a3, "setPayloadData:");
  if (self->_messageSummaryInfo)
    objc_msgSend(a3, "setMessageSummaryInfo:");
  if (self->_expressiveSendId)
    objc_msgSend(a3, "setExpressiveSendId:");
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_QWORD *)a3 + 6) = self->_timeRead;
    *((_WORD *)a3 + 70) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_19:
      if ((has & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_19;
  }
  *((_QWORD *)a3 + 5) = self->_timePlayed;
  *((_WORD *)a3 + 70) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_20:
    *((_QWORD *)a3 + 4) = self->_timeExpressiveSentPlayed;
    *((_WORD *)a3 + 70) |= 8u;
  }
LABEL_21:
  if (self->_padding)
    objc_msgSend(a3, "setPadding:");
  v6 = (__int16)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timeDelivered;
    *((_WORD *)a3 + 70) |= 4u;
    v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_25:
      if ((v6 & 1) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_25;
  }
  *((_QWORD *)a3 + 2) = self->_expireState;
  *((_WORD *)a3 + 70) |= 2u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_26:
    *((_QWORD *)a3 + 1) = self->_associatedMessageType;
    *((_WORD *)a3 + 70) |= 1u;
  }
LABEL_27:
  if (self->_associatedMessageGuid)
    objc_msgSend(a3, "setAssociatedMessageGuid:");
  v7 = (__int16)self->_has;
  if ((v7 & 0x80) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_associatedMessageRangeLocation;
    *((_WORD *)a3 + 70) |= 0x80u;
    v7 = (__int16)self->_has;
  }
  if ((v7 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_associatedMessageRangeLength;
    *((_WORD *)a3 + 70) |= 0x40u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  __int16 v8;
  __int16 v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_version;
    *(_WORD *)(v5 + 140) |= 0x100u;
  }

  *(_QWORD *)(v6 + 104) = -[NSString copyWithZone:](self->_messageSubject, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 88) = -[NSString copyWithZone:](self->_messageBody, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 96) = -[NSData copyWithZone:](self->_messageBodyData, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 72) = -[NSString copyWithZone:](self->_baloonBundleId, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 128) = -[NSData copyWithZone:](self->_payloadData, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 112) = -[NSData copyWithZone:](self->_messageSummaryInfo, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 80) = -[NSString copyWithZone:](self->_expressiveSendId, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_QWORD *)(v6 + 48) = self->_timeRead;
    *(_WORD *)(v6 + 140) |= 0x20u;
    has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 40) = self->_timePlayed;
  *(_WORD *)(v6 + 140) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(_QWORD *)(v6 + 32) = self->_timeExpressiveSentPlayed;
    *(_WORD *)(v6 + 140) |= 8u;
  }
LABEL_7:

  *(_QWORD *)(v6 + 120) = -[NSData copyWithZone:](self->_padding, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    *(_QWORD *)(v6 + 24) = self->_timeDelivered;
    *(_WORD *)(v6 + 140) |= 4u;
    v8 = (__int16)self->_has;
    if ((v8 & 2) == 0)
    {
LABEL_9:
      if ((v8 & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_9;
  }
  *(_QWORD *)(v6 + 16) = self->_expireState;
  *(_WORD *)(v6 + 140) |= 2u;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
LABEL_10:
    *(_QWORD *)(v6 + 8) = self->_associatedMessageType;
    *(_WORD *)(v6 + 140) |= 1u;
  }
LABEL_11:

  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_associatedMessageGuid, "copyWithZone:", a3);
  v9 = (__int16)self->_has;
  if ((v9 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_associatedMessageRangeLocation;
    *(_WORD *)(v6 + 140) |= 0x80u;
    v9 = (__int16)self->_has;
  }
  if ((v9 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_associatedMessageRangeLength;
    *(_WORD *)(v6 + 140) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *messageSubject;
  NSString *messageBody;
  NSData *messageBodyData;
  NSString *baloonBundleId;
  NSData *payloadData;
  NSData *messageSummaryInfo;
  NSString *expressiveSendId;
  __int16 has;
  __int16 v14;
  NSData *padding;
  __int16 v16;
  NSString *associatedMessageGuid;
  __int16 v18;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 70) & 0x100) == 0 || self->_version != *((_DWORD *)a3 + 34))
        goto LABEL_66;
    }
    else if ((*((_WORD *)a3 + 70) & 0x100) != 0)
    {
LABEL_66:
      LOBYTE(v5) = 0;
      return v5;
    }
    messageSubject = self->_messageSubject;
    if (!((unint64_t)messageSubject | *((_QWORD *)a3 + 13))
      || (v5 = -[NSString isEqual:](messageSubject, "isEqual:")) != 0)
    {
      messageBody = self->_messageBody;
      if (!((unint64_t)messageBody | *((_QWORD *)a3 + 11))
        || (v5 = -[NSString isEqual:](messageBody, "isEqual:")) != 0)
      {
        messageBodyData = self->_messageBodyData;
        if (!((unint64_t)messageBodyData | *((_QWORD *)a3 + 12))
          || (v5 = -[NSData isEqual:](messageBodyData, "isEqual:")) != 0)
        {
          baloonBundleId = self->_baloonBundleId;
          if (!((unint64_t)baloonBundleId | *((_QWORD *)a3 + 9))
            || (v5 = -[NSString isEqual:](baloonBundleId, "isEqual:")) != 0)
          {
            payloadData = self->_payloadData;
            if (!((unint64_t)payloadData | *((_QWORD *)a3 + 16))
              || (v5 = -[NSData isEqual:](payloadData, "isEqual:")) != 0)
            {
              messageSummaryInfo = self->_messageSummaryInfo;
              if (!((unint64_t)messageSummaryInfo | *((_QWORD *)a3 + 14))
                || (v5 = -[NSData isEqual:](messageSummaryInfo, "isEqual:")) != 0)
              {
                expressiveSendId = self->_expressiveSendId;
                if (!((unint64_t)expressiveSendId | *((_QWORD *)a3 + 10))
                  || (v5 = -[NSString isEqual:](expressiveSendId, "isEqual:")) != 0)
                {
                  has = (__int16)self->_has;
                  v14 = *((_WORD *)a3 + 70);
                  if ((has & 0x20) != 0)
                  {
                    if ((v14 & 0x20) == 0 || self->_timeRead != *((_QWORD *)a3 + 6))
                      goto LABEL_66;
                  }
                  else if ((v14 & 0x20) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ((has & 0x10) != 0)
                  {
                    if ((v14 & 0x10) == 0 || self->_timePlayed != *((_QWORD *)a3 + 5))
                      goto LABEL_66;
                  }
                  else if ((v14 & 0x10) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ((has & 8) != 0)
                  {
                    if ((v14 & 8) == 0 || self->_timeExpressiveSentPlayed != *((_QWORD *)a3 + 4))
                      goto LABEL_66;
                  }
                  else if ((v14 & 8) != 0)
                  {
                    goto LABEL_66;
                  }
                  padding = self->_padding;
                  if ((unint64_t)padding | *((_QWORD *)a3 + 15))
                  {
                    v5 = -[NSData isEqual:](padding, "isEqual:");
                    if (!v5)
                      return v5;
                    has = (__int16)self->_has;
                  }
                  v16 = *((_WORD *)a3 + 70);
                  if ((has & 4) != 0)
                  {
                    if ((v16 & 4) == 0 || self->_timeDelivered != *((_QWORD *)a3 + 3))
                      goto LABEL_66;
                  }
                  else if ((v16 & 4) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ((has & 2) != 0)
                  {
                    if ((v16 & 2) == 0 || self->_expireState != *((_QWORD *)a3 + 2))
                      goto LABEL_66;
                  }
                  else if ((v16 & 2) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ((has & 1) != 0)
                  {
                    if ((v16 & 1) == 0 || self->_associatedMessageType != *((_QWORD *)a3 + 1))
                      goto LABEL_66;
                  }
                  else if ((v16 & 1) != 0)
                  {
                    goto LABEL_66;
                  }
                  associatedMessageGuid = self->_associatedMessageGuid;
                  if ((unint64_t)associatedMessageGuid | *((_QWORD *)a3 + 7))
                  {
                    v5 = -[NSString isEqual:](associatedMessageGuid, "isEqual:");
                    if (!v5)
                      return v5;
                    has = (__int16)self->_has;
                  }
                  v18 = *((_WORD *)a3 + 70);
                  if ((has & 0x80) != 0)
                  {
                    if ((v18 & 0x80) == 0 || self->_associatedMessageRangeLocation != *((_DWORD *)a3 + 17))
                      goto LABEL_66;
                  }
                  else if ((v18 & 0x80) != 0)
                  {
                    goto LABEL_66;
                  }
                  LOBYTE(v5) = (v18 & 0x40) == 0;
                  if ((has & 0x40) != 0)
                  {
                    if ((v18 & 0x40) == 0 || self->_associatedMessageRangeLength != *((_DWORD *)a3 + 16))
                      goto LABEL_66;
                    LOBYTE(v5) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int16 v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUInteger v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t v25;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v25 = 2654435761 * self->_version;
  else
    v25 = 0;
  v24 = -[NSString hash](self->_messageSubject, "hash");
  v23 = -[NSString hash](self->_messageBody, "hash");
  v22 = -[NSData hash](self->_messageBodyData, "hash");
  v21 = -[NSString hash](self->_baloonBundleId, "hash");
  v20 = -[NSData hash](self->_payloadData, "hash");
  v19 = -[NSData hash](self->_messageSummaryInfo, "hash");
  v17 = -[NSString hash](self->_expressiveSendId, "hash");
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
    v4 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_6;
LABEL_9:
    v5 = 0;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v4 = 2654435761u * self->_timeRead;
  if ((has & 0x10) == 0)
    goto LABEL_9;
LABEL_6:
  v5 = 2654435761u * self->_timePlayed;
  if ((has & 8) != 0)
  {
LABEL_7:
    v6 = 2654435761u * self->_timeExpressiveSentPlayed;
    goto LABEL_11;
  }
LABEL_10:
  v6 = 0;
LABEL_11:
  v7 = -[NSData hash](self->_padding, "hash", v17);
  v8 = (__int16)self->_has;
  if ((v8 & 4) == 0)
  {
    v9 = 0;
    if ((v8 & 2) != 0)
      goto LABEL_13;
LABEL_16:
    v10 = 0;
    if ((v8 & 1) != 0)
      goto LABEL_14;
    goto LABEL_17;
  }
  v9 = 2654435761u * self->_timeDelivered;
  if ((v8 & 2) == 0)
    goto LABEL_16;
LABEL_13:
  v10 = 2654435761u * self->_expireState;
  if ((v8 & 1) != 0)
  {
LABEL_14:
    v11 = 2654435761 * self->_associatedMessageType;
    goto LABEL_18;
  }
LABEL_17:
  v11 = 0;
LABEL_18:
  v12 = -[NSString hash](self->_associatedMessageGuid, "hash");
  v13 = (__int16)self->_has;
  if ((v13 & 0x80) != 0)
  {
    v14 = 2654435761 * self->_associatedMessageRangeLocation;
    if ((v13 & 0x40) != 0)
      goto LABEL_20;
LABEL_22:
    v15 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
  }
  v14 = 0;
  if ((v13 & 0x40) == 0)
    goto LABEL_22;
LABEL_20:
  v15 = 2654435761 * self->_associatedMessageRangeLength;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5;
  __int16 v6;
  __int16 v7;

  if ((*((_WORD *)a3 + 70) & 0x100) != 0)
  {
    self->_version = *((_DWORD *)a3 + 34);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)a3 + 13))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageSubject:](self, "setMessageSubject:");
  if (*((_QWORD *)a3 + 11))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageBody:](self, "setMessageBody:");
  if (*((_QWORD *)a3 + 12))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageBodyData:](self, "setMessageBodyData:");
  if (*((_QWORD *)a3 + 9))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setBaloonBundleId:](self, "setBaloonBundleId:");
  if (*((_QWORD *)a3 + 16))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setPayloadData:](self, "setPayloadData:");
  if (*((_QWORD *)a3 + 14))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setMessageSummaryInfo:](self, "setMessageSummaryInfo:");
  if (*((_QWORD *)a3 + 10))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setExpressiveSendId:](self, "setExpressiveSendId:");
  v5 = *((_WORD *)a3 + 70);
  if ((v5 & 0x20) != 0)
  {
    self->_timeRead = *((_QWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    v5 = *((_WORD *)a3 + 70);
    if ((v5 & 0x10) == 0)
    {
LABEL_19:
      if ((v5 & 8) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_19;
  }
  self->_timePlayed = *((_QWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 70) & 8) != 0)
  {
LABEL_20:
    self->_timeExpressiveSentPlayed = *((_QWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_21:
  if (*((_QWORD *)a3 + 15))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setPadding:](self, "setPadding:");
  v6 = *((_WORD *)a3 + 70);
  if ((v6 & 4) != 0)
  {
    self->_timeDelivered = *((_QWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    v6 = *((_WORD *)a3 + 70);
    if ((v6 & 2) == 0)
    {
LABEL_25:
      if ((v6 & 1) == 0)
        goto LABEL_27;
      goto LABEL_26;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_25;
  }
  self->_expireState = *((_QWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 70) & 1) != 0)
  {
LABEL_26:
    self->_associatedMessageType = *((_QWORD *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_27:
  if (*((_QWORD *)a3 + 7))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessage setAssociatedMessageGuid:](self, "setAssociatedMessageGuid:");
  v7 = *((_WORD *)a3 + 70);
  if ((v7 & 0x80) != 0)
  {
    self->_associatedMessageRangeLocation = *((_DWORD *)a3 + 17);
    *(_WORD *)&self->_has |= 0x80u;
    v7 = *((_WORD *)a3 + 70);
  }
  if ((v7 & 0x40) != 0)
  {
    self->_associatedMessageRangeLength = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x40u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)messageSubject
{
  return self->_messageSubject;
}

- (void)setMessageSubject:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSData)messageBodyData
{
  return self->_messageBodyData;
}

- (void)setMessageBodyData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)baloonBundleId
{
  return self->_baloonBundleId;
}

- (void)setBaloonBundleId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (void)setPayloadData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSData)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void)setMessageSummaryInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)expressiveSendId
{
  return self->_expressiveSendId;
}

- (void)setExpressiveSendId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (unint64_t)timeRead
{
  return self->_timeRead;
}

- (unint64_t)timePlayed
{
  return self->_timePlayed;
}

- (unint64_t)timeExpressiveSentPlayed
{
  return self->_timeExpressiveSentPlayed;
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (unint64_t)timeDelivered
{
  return self->_timeDelivered;
}

- (unint64_t)expireState
{
  return self->_expireState;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (NSString)associatedMessageGuid
{
  return self->_associatedMessageGuid;
}

- (void)setAssociatedMessageGuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (unsigned)associatedMessageRangeLocation
{
  return self->_associatedMessageRangeLocation;
}

- (unsigned)associatedMessageRangeLength
{
  return self->_associatedMessageRangeLength;
}

@end
