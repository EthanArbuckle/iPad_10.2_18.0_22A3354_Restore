@implementation NTPBExternalAnalyticsEventSend

- (int)externalAnalyticsEventType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_externalAnalyticsEventType;
  else
    return 0;
}

- (void)setExternalAnalyticsEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_externalAnalyticsEventType = a3;
}

- (void)setHasExternalAnalyticsEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExternalAnalyticsEventType
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

- (BOOL)hasExternalAnalyticsId
{
  return self->_externalAnalyticsId != 0;
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
  v8.super_class = (Class)NTPBExternalAnalyticsEventSend;
  -[NTPBExternalAnalyticsEventSend description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBExternalAnalyticsEventSend dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *externalAnalyticsId;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_externalAnalyticsEventType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("external_analytics_event_type"));

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
  externalAnalyticsId = self->_externalAnalyticsId;
  if (externalAnalyticsId)
    objc_msgSend(v3, "setObject:forKey:", externalAnalyticsId, CFSTR("external_analytics_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBExternalAnalyticsEventSendReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_externalAnalyticsId)
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
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_externalAnalyticsEventType;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_resultType;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_eventUdid, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  v10 = -[NSString copyWithZone:](self->_failureReasonCode, "copyWithZone:", a3);
  v11 = (void *)v6[5];
  v6[5] = v10;

  v12 = -[NSString copyWithZone:](self->_contentViewedId, "copyWithZone:", a3);
  v13 = (void *)v6[1];
  v6[1] = v12;

  v14 = -[NSString copyWithZone:](self->_sourceChannelId, "copyWithZone:", a3);
  v15 = (void *)v6[7];
  v6[7] = v14;

  v16 = -[NSString copyWithZone:](self->_externalAnalyticsId, "copyWithZone:", a3);
  v17 = (void *)v6[4];
  v6[4] = v16;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *eventUdid;
  NSString *failureReasonCode;
  NSString *contentViewedId;
  NSString *sourceChannelId;
  NSString *externalAnalyticsId;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_externalAnalyticsEventType != *((_DWORD *)v4 + 6))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_resultType != *((_DWORD *)v4 + 12))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_22;
  }
  eventUdid = self->_eventUdid;
  if ((unint64_t)eventUdid | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](eventUdid, "isEqual:"))
    goto LABEL_22;
  failureReasonCode = self->_failureReasonCode;
  if ((unint64_t)failureReasonCode | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](failureReasonCode, "isEqual:"))
      goto LABEL_22;
  }
  contentViewedId = self->_contentViewedId;
  if ((unint64_t)contentViewedId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](contentViewedId, "isEqual:"))
      goto LABEL_22;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:"))
      goto LABEL_22;
  }
  externalAnalyticsId = self->_externalAnalyticsId;
  if ((unint64_t)externalAnalyticsId | *((_QWORD *)v4 + 4))
    v10 = -[NSString isEqual:](externalAnalyticsId, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_externalAnalyticsEventType;
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
  v8 = -[NSString hash](self->_sourceChannelId, "hash");
  return v7 ^ v8 ^ -[NSString hash](self->_externalAnalyticsId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 1) != 0)
  {
    self->_externalAnalyticsEventType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 64);
  }
  if ((v5 & 2) != 0)
  {
    self->_resultType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NTPBExternalAnalyticsEventSend setEventUdid:](self, "setEventUdid:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NTPBExternalAnalyticsEventSend setFailureReasonCode:](self, "setFailureReasonCode:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NTPBExternalAnalyticsEventSend setContentViewedId:](self, "setContentViewedId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NTPBExternalAnalyticsEventSend setSourceChannelId:](self, "setSourceChannelId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NTPBExternalAnalyticsEventSend setExternalAnalyticsId:](self, "setExternalAnalyticsId:");
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

- (NSString)externalAnalyticsId
{
  return self->_externalAnalyticsId;
}

- (void)setExternalAnalyticsId:(id)a3
{
  objc_storeStrong((id *)&self->_externalAnalyticsId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_failureReasonCode, 0);
  objc_storeStrong((id *)&self->_externalAnalyticsId, 0);
  objc_storeStrong((id *)&self->_eventUdid, 0);
  objc_storeStrong((id *)&self->_contentViewedId, 0);
}

@end
