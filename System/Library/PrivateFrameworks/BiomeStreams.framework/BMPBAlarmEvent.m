@implementation BMPBAlarmEvent

- (void)setIsSleepAlarm:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isSleepAlarm = a3;
}

- (void)setHasIsSleepAlarm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsSleepAlarm
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E2649890[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Firing")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stopped")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Snoozed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Created")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Updated")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Deleted")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAlarmID
{
  return self->_alarmID != 0;
}

- (int)lastEventType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_lastEventType;
  else
    return 0;
}

- (void)setLastEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastEventType = a3;
}

- (void)setHasLastEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)lastEventTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E26498C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLastEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Idle")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fired")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FiredAfterSnooze")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FiredGoToBedReminder")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FiredGoToBedReminderAfterSnooze")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dismissed")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DismissedGoToBedReminder")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Snoozed")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SnoozedBedtime")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfigurationChanged")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TimedOut")))
  {
    v4 = 10;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBAlarmEvent;
  -[BMPBAlarmEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBAlarmEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t eventType;
  __CFString *v7;
  NSString *alarmID;
  uint64_t lastEventType;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSleepAlarm);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isSleepAlarm"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2649890[eventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("eventType"));

  }
  alarmID = self->_alarmID;
  if (alarmID)
    objc_msgSend(v3, "setObject:forKey:", alarmID, CFSTR("alarmID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    lastEventType = self->_lastEventType;
    if (lastEventType >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_lastEventType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E26498C0[lastEventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("lastEventType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAlarmEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_alarmID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[24] = self->_isSleepAlarm;
    v4[28] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_eventType;
    v4[28] |= 1u;
  }
  if (self->_alarmID)
  {
    v6 = v4;
    objc_msgSend(v4, "setAlarmID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_lastEventType;
    v4[28] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_isSleepAlarm;
    *(_BYTE *)(v5 + 28) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_alarmID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_lastEventType;
    *(_BYTE *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *alarmID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_22;
    if (self->_isSleepAlarm)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_22;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_eventType != *((_DWORD *)v4 + 4))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_22;
  }
  alarmID = self->_alarmID;
  if ((unint64_t)alarmID | *((_QWORD *)v4 + 1))
  {
    if (-[NSString isEqual:](alarmID, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_18;
    }
LABEL_22:
    v7 = 0;
    goto LABEL_23;
  }
LABEL_18:
  v7 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_lastEventType != *((_DWORD *)v4 + 5))
      goto LABEL_22;
    v7 = 1;
  }
LABEL_23:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_isSleepAlarm;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_eventType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_alarmID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_lastEventType;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_isSleepAlarm = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 28);
  }
  if ((v5 & 1) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[BMPBAlarmEvent setAlarmID:](self, "setAlarmID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    self->_lastEventType = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (void)setAlarmID:(id)a3
{
  objc_storeStrong((id *)&self->_alarmID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end
