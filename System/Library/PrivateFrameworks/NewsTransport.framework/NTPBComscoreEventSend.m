@implementation NTPBComscoreEventSend

- (int)comscoreEventType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_comscoreEventType;
  else
    return 0;
}

- (void)setComscoreEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_comscoreEventType = a3;
}

- (void)setHasComscoreEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComscoreEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)resultType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void)setResultType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResultType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasEventUdid
{
  return self->_eventUdid != 0;
}

- (BOOL)hasFailureReasonCode
{
  return self->_failureReasonCode != 0;
}

- (BOOL)hasContentViewedId
{
  return self->_contentViewedId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
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
  v8.super_class = (Class)NTPBComscoreEventSend;
  -[NTPBComscoreEventSend description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBComscoreEventSend dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *eventUdid;
  NSString *failureReasonCode;
  NSString *contentViewedId;
  NSString *sourceChannelId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_comscoreEventType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("comscore_event_type"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("result_type"));

  }
  eventUdid = self->_eventUdid;
  if (eventUdid)
    objc_msgSend(v3, "setObject:forKey:", eventUdid, CFSTR("event_udid"));
  failureReasonCode = self->_failureReasonCode;
  if (failureReasonCode)
    objc_msgSend(v3, "setObject:forKey:", failureReasonCode, CFSTR("failure_reason_code"));
  contentViewedId = self->_contentViewedId;
  if (contentViewedId)
    objc_msgSend(v3, "setObject:forKey:", contentViewedId, CFSTR("content_viewed_id"));
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId)
    objc_msgSend(v3, "setObject:forKey:", sourceChannelId, CFSTR("source_channel_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBComscoreEventSendReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_eventUdid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_failureReasonCode)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_contentViewedId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_comscoreEventType;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_resultType;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_eventUdid, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = -[NSString copyWithZone:](self->_failureReasonCode, "copyWithZone:", a3);
  v11 = (void *)v6[4];
  v6[4] = v10;

  v12 = -[NSString copyWithZone:](self->_contentViewedId, "copyWithZone:", a3);
  v13 = (void *)v6[2];
  v6[2] = v12;

  v14 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v15 = (void *)v6[6];
  v6[6] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *eventUdid;
  NSString *failureReasonCode;
  NSString *contentViewedId;
  NSString *sourceChannelId;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_comscoreEventType != *((_DWORD *)v4 + 2))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_resultType != *((_DWORD *)v4 + 10))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_20;
  }
  eventUdid = self->_eventUdid;
  if ((unint64_t)eventUdid | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](eventUdid, "isEqual:"))
    goto LABEL_20;
  failureReasonCode = self->_failureReasonCode;
  if ((unint64_t)failureReasonCode | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](failureReasonCode, "isEqual:"))
      goto LABEL_20;
  }
  contentViewedId = self->_contentViewedId;
  if ((unint64_t)contentViewedId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](contentViewedId, "isEqual:"))
      goto LABEL_20;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 6))
    v9 = -[NSString isEqual:](sourceChannelId, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_comscoreEventType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_resultType;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_eventUdid, "hash");
  v6 = -[NSString hash](self->_failureReasonCode, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_contentViewedId, "hash");
  return v7 ^ -[NSString hash](self->_sourceChannelId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_comscoreEventType = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_resultType = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NTPBComscoreEventSend setEventUdid:](self, "setEventUdid:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBComscoreEventSend setFailureReasonCode:](self, "setFailureReasonCode:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBComscoreEventSend setContentViewedId:](self, "setContentViewedId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NTPBComscoreEventSend setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v6;
  }

}

- (NSString)eventUdid
{
  return self->_eventUdid;
}

- (void)setEventUdid:(id)a3
{
  objc_storeStrong((id *)&self->_eventUdid, a3);
}

- (NSString)failureReasonCode
{
  return self->_failureReasonCode;
}

- (void)setFailureReasonCode:(id)a3
{
  objc_storeStrong((id *)&self->_failureReasonCode, a3);
}

- (NSString)contentViewedId
{
  return self->_contentViewedId;
}

- (void)setContentViewedId:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewedId, a3);
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceChannelId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_failureReasonCode, 0);
  objc_storeStrong((id *)&self->_eventUdid, 0);
  objc_storeStrong((id *)&self->_contentViewedId, 0);
}

@end
