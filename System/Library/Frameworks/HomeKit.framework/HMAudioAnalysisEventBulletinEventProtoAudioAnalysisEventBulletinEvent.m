@implementation HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent

- (BOOL)hasThreadIdentifier
{
  return self->_threadIdentifier != 0;
}

- (void)setState:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setReason:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReason
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasNotificationUUID
{
  return self->_notificationUUID != 0;
}

- (void)setDateOfOccurrence:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dateOfOccurrence = a3;
}

- (void)setHasDateOfOccurrence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateOfOccurrence
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAccessoryIdentifier
{
  return self->_accessoryIdentifier != 0;
}

- (BOOL)hasHomeIdentifier
{
  return self->_homeIdentifier != 0;
}

- (void)setEventStartDate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventStartDate = a3;
}

- (void)setHasEventStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventStartDate
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent;
  -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *threadIdentifier;
  char has;
  void *v7;
  void *v8;
  NSString *notificationUUID;
  void *v10;
  NSString *accessoryIdentifier;
  NSString *homeIdentifier;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  threadIdentifier = self->_threadIdentifier;
  if (threadIdentifier)
    objc_msgSend(v3, "setObject:forKey:", threadIdentifier, CFSTR("threadIdentifier"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_state);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("state"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_reason);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("reason"));

  }
  notificationUUID = self->_notificationUUID;
  if (notificationUUID)
    objc_msgSend(v4, "setObject:forKey:", notificationUUID, CFSTR("notificationUUID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dateOfOccurrence);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("dateOfOccurrence"));

  }
  accessoryIdentifier = self->_accessoryIdentifier;
  if (accessoryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", accessoryIdentifier, CFSTR("accessoryIdentifier"));
  homeIdentifier = self->_homeIdentifier;
  if (homeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", homeIdentifier, CFSTR("homeIdentifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_eventStartDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("eventStartDate"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_threadIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_notificationUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_accessoryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_homeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_threadIdentifier)
  {
    objc_msgSend(v4, "setThreadIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_state;
    *((_BYTE *)v4 + 72) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_reason;
    *((_BYTE *)v4 + 72) |= 4u;
  }
  if (self->_notificationUUID)
  {
    objc_msgSend(v6, "setNotificationUUID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_dateOfOccurrence;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_accessoryIdentifier)
  {
    objc_msgSend(v6, "setAccessoryIdentifier:");
    v4 = v6;
  }
  if (self->_homeIdentifier)
  {
    objc_msgSend(v6, "setHomeIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_eventStartDate;
    *((_BYTE *)v4 + 72) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_threadIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_state;
    *(_BYTE *)(v5 + 72) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_reason;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v9 = -[NSString copyWithZone:](self->_notificationUUID, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_dateOfOccurrence;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_accessoryIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[NSString copyWithZone:](self->_homeIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_eventStartDate;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *threadIdentifier;
  char has;
  char v7;
  NSString *notificationUUID;
  NSString *accessoryIdentifier;
  NSString *homeIdentifier;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  threadIdentifier = self->_threadIdentifier;
  if ((unint64_t)threadIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](threadIdentifier, "isEqual:"))
      goto LABEL_30;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 72);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_state != *((_QWORD *)v4 + 4))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_reason != *((_QWORD *)v4 + 3))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_30;
  }
  notificationUUID = self->_notificationUUID;
  if ((unint64_t)notificationUUID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](notificationUUID, "isEqual:"))
    {
LABEL_30:
      v11 = 0;
      goto LABEL_31;
    }
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 72);
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_dateOfOccurrence != *((_QWORD *)v4 + 1))
      goto LABEL_30;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_30;
  }
  accessoryIdentifier = self->_accessoryIdentifier;
  if ((unint64_t)accessoryIdentifier | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](accessoryIdentifier, "isEqual:"))
  {
    goto LABEL_30;
  }
  homeIdentifier = self->_homeIdentifier;
  if ((unint64_t)homeIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](homeIdentifier, "isEqual:"))
      goto LABEL_30;
  }
  v11 = (*((_BYTE *)v4 + 72) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_eventStartDate != *((_QWORD *)v4 + 2))
      goto LABEL_30;
    v11 = 1;
  }
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_threadIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = 2654435761 * self->_state;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_reason;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_notificationUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_dateOfOccurrence;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_accessoryIdentifier, "hash");
  v9 = -[NSString hash](self->_homeIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v10 = 2654435761 * self->_eventStartDate;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  char v5;
  int64_t *v6;

  v4 = (int64_t *)a3;
  v6 = v4;
  if (v4[8])
  {
    -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setThreadIdentifier:](self, "setThreadIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_state = v4[4];
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 4) != 0)
  {
    self->_reason = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (v4[7])
  {
    -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setNotificationUUID:](self, "setNotificationUUID:");
    v4 = v6;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_dateOfOccurrence = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[5])
  {
    -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setAccessoryIdentifier:](self, "setAccessoryIdentifier:");
    v4 = v6;
  }
  if (v4[6])
  {
    -[HMAudioAnalysisEventBulletinEventProtoAudioAnalysisEventBulletinEvent setHomeIdentifier:](self, "setHomeIdentifier:");
    v4 = v6;
  }
  if ((v4[9] & 2) != 0)
  {
    self->_eventStartDate = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_threadIdentifier, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)notificationUUID
{
  return self->_notificationUUID;
}

- (void)setNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUUID, a3);
}

- (int64_t)dateOfOccurrence
{
  return self->_dateOfOccurrence;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifier, a3);
}

- (int64_t)eventStartDate
{
  return self->_eventStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
