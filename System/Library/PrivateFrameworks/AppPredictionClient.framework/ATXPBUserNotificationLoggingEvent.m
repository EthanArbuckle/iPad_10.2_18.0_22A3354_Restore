@implementation ATXPBUserNotificationLoggingEvent

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUserNotificationLoggingEvent *v5;
  id v6;
  ATXPBUserNotification *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = -[ATXPBUserNotificationLoggingEvent init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = [ATXPBUserNotification alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notification"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ATXPBUserNotification initFromJSON:](v7, "initFromJSON:", v8);
      -[ATXPBUserNotificationLoggingEvent setNotification:](v5, "setNotification:", v9);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Received")) & 1) != 0)
      {
        v11 = 0;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DefaultAction")) & 1) != 0)
      {
        v11 = 1;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("SupplementaryAction")) & 1) != 0)
      {
        v11 = 2;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Clear")) & 1) != 0)
      {
        v11 = 3;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NotificationCenterClearAll")) & 1) != 0)
      {
        v11 = 4;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Removed")) & 1) != 0)
      {
        v11 = 5;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Hide")) & 1) != 0)
      {
        v11 = 6;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("LongLook")) & 1) != 0)
      {
        v11 = 7;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Silence")) & 1) != 0)
      {
        v11 = 8;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("AppLaunch")) & 1) != 0)
      {
        v11 = 9;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Expired")) & 1) != 0)
      {
        v11 = 10;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("BannerPulldown")) & 1) != 0)
      {
        v11 = 11;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TapCoalesce")) & 1) != 0)
      {
        v11 = 12;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TapExpand")) & 1) != 0)
      {
        v11 = 19;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Deduped")) & 1) != 0)
      {
        v11 = 13;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DevActivated")) & 1) != 0)
      {
        v11 = 14;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DevUnlocked")) & 1) != 0)
      {
        v11 = 15;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ReceivedAndDeliveredProminently")) & 1) != 0)
      {
        v11 = 16;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ReceivedAndDeliveredNonprominently")) & 1) != 0)
      {
        v11 = 17;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Modified")) & 1) != 0)
      {
        v11 = 18;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ShortLookDefaultAction")) & 1) != 0)
      {
        v11 = 20;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ShortLookDismiss")) & 1) != 0)
      {
        v11 = 21;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ShortLookClear")) & 1) != 0)
      {
        v11 = 22;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("LongLookDefaultAction")) & 1) != 0)
      {
        v11 = 23;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("LongLookCustomAction")) & 1) != 0)
      {
        v11 = 24;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("LongLookDismiss")) & 1) != 0)
      {
        v11 = 25;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("LongLookRepark")) & 1) != 0)
      {
        v11 = 26;
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Total")))
      {
        v11 = 27;
      }
      else
      {
        v11 = 0;
      }

      -[ATXPBUserNotificationLoggingEvent setEventType:](v5, "setEventType:", v11);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      -[ATXPBUserNotificationLoggingEvent setTimestamp:](v5, "setTimestamp:");

    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  void *v3;
  void *v4;
  uint64_t eventType;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("notification");
  -[ATXPBUserNotification jsonRepresentation](self->_notification, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("eventType");
  eventType = self->_eventType;
  if (eventType >= 0x1C)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E4D58A30[eventType];
  }
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)hasNotification
{
  return self->_notification != 0;
}

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 < 0x1C)
    return off_1E4D5BFC8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Received")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DefaultAction")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SupplementaryAction")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Clear")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotificationCenterClearAll")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Removed")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Hide")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LongLook")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Silence")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppLaunch")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Expired")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BannerPulldown")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TapCoalesce")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TapExpand")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Deduped")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DevActivated")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DevUnlocked")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReceivedAndDeliveredProminently")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReceivedAndDeliveredNonprominently")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Modified")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortLookDefaultAction")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortLookDismiss")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortLookClear")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LongLookDefaultAction")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LongLookCustomAction")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LongLookDismiss")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LongLookRepark")) & 1) != 0)
  {
    v4 = 26;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 27;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasModeIdentifier
{
  return self->_modeIdentifier != 0;
}

- (int)deliveryReason
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_deliveryReason;
  else
    return 0;
}

- (void)setDeliveryReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_deliveryReason = a3;
}

- (void)setHasDeliveryReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeliveryReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)deliveryReasonAsString:(int)a3
{
  if (a3 < 8)
    return off_1E4D5C0A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeliveryReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Application")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Contact")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MatchedContact")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Urgency")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MessageBreakthrough")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)deliveryUI
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_deliveryUI;
  else
    return 0;
}

- (void)setDeliveryUI:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deliveryUI = a3;
}

- (void)setHasDeliveryUI:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeliveryUI
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)deliveryUIAsString:(int)a3
{
  if (a3 < 8)
    return off_1E4D5C0E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeliveryUI:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Digest")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MissedNotificationBundle")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotificationCenter")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Banner")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreen")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PriorityNotification")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 7;
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
  v8.super_class = (Class)ATXPBUserNotificationLoggingEvent;
  -[ATXPBUserNotificationLoggingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUserNotificationLoggingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATXPBUserNotification *notification;
  void *v5;
  char has;
  uint64_t eventType;
  __CFString *v8;
  void *v9;
  NSString *modeIdentifier;
  char v11;
  uint64_t deliveryReason;
  __CFString *v13;
  uint64_t deliveryUI;
  __CFString *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  notification = self->_notification;
  if (notification)
  {
    -[ATXPBUserNotification dictionaryRepresentation](notification, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("notification"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 0x1C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4D5BFC8[eventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("eventType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timestamp"));

  }
  modeIdentifier = self->_modeIdentifier;
  if (modeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", modeIdentifier, CFSTR("modeIdentifier"));
  v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    deliveryReason = self->_deliveryReason;
    if (deliveryReason >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deliveryReason);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E4D5C0A8[deliveryReason];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("deliveryReason"));

    v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    deliveryUI = self->_deliveryUI;
    if (deliveryUI >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deliveryUI);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E4D5C0E8[deliveryUI];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("deliveryUI"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_notification)
  {
    PBDataWriterWriteSubmessage();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }
  if (self->_modeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_notification)
  {
    objc_msgSend(v4, "setNotification:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_eventType;
    *((_BYTE *)v4 + 48) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_modeIdentifier)
  {
    objc_msgSend(v7, "setModeIdentifier:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_deliveryReason;
    *((_BYTE *)v4 + 48) |= 2u;
    v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_deliveryUI;
    *((_BYTE *)v4 + 48) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  char v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ATXPBUserNotification copyWithZone:](self->_notification, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventType;
    *(_BYTE *)(v5 + 48) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_modeIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_deliveryReason;
    *(_BYTE *)(v5 + 48) |= 2u;
    v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_deliveryUI;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBUserNotification *notification;
  char has;
  NSString *modeIdentifier;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  notification = self->_notification;
  if ((unint64_t)notification | *((_QWORD *)v4 + 5))
  {
    if (!-[ATXPBUserNotification isEqual:](notification, "isEqual:"))
      goto LABEL_26;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_eventType != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_26;
  }
  modeIdentifier = self->_modeIdentifier;
  if ((unint64_t)modeIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](modeIdentifier, "isEqual:"))
    {
LABEL_26:
      v8 = 0;
      goto LABEL_27;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_deliveryReason != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  v8 = (*((_BYTE *)v4 + 48) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_deliveryUI != *((_DWORD *)v4 + 5))
      goto LABEL_26;
    v8 = 1;
  }
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  double timestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[ATXPBUserNotification hash](self->_notification, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = 2654435761 * self->_eventType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  timestamp = self->_timestamp;
  v6 = -timestamp;
  if (timestamp >= 0.0)
    v6 = self->_timestamp;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  v10 = -[NSString hash](self->_modeIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = 2654435761 * self->_deliveryReason;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_13;
LABEL_15:
    v12 = 0;
    return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_13:
  v12 = 2654435761 * self->_deliveryUI;
  return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXPBUserNotification *notification;
  uint64_t v6;
  char v7;
  char v8;
  id v9;

  v4 = a3;
  notification = self->_notification;
  v6 = *((_QWORD *)v4 + 5);
  v9 = v4;
  if (notification)
  {
    if (!v6)
      goto LABEL_7;
    -[ATXPBUserNotification mergeFrom:](notification, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ATXPBUserNotificationLoggingEvent setNotification:](self, "setNotification:");
  }
  v4 = v9;
LABEL_7:
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 8) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((v7 & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ATXPBUserNotificationLoggingEvent setModeIdentifier:](self, "setModeIdentifier:");
    v4 = v9;
  }
  v8 = *((_BYTE *)v4 + 48);
  if ((v8 & 2) != 0)
  {
    self->_deliveryReason = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v4 + 48);
  }
  if ((v8 & 4) != 0)
  {
    self->_deliveryUI = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (ATXPBUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end
