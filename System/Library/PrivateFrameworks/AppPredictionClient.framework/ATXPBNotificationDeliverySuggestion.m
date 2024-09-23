@implementation ATXPBNotificationDeliverySuggestion

- (BOOL)hasSmartPause
{
  return self->_smartPause != 0;
}

- (void)setSmartPause:(id)a3
{
  ATXPBNotificationSmartPauseSuggestion *v4;
  ATXPBNotificationSmartPauseSuggestion *smartPause;

  v4 = (ATXPBNotificationSmartPauseSuggestion *)a3;
  -[ATXPBNotificationDeliverySuggestion clearOneofValuesForOneofNotificationDeliverySuggestion](self, "clearOneofValuesForOneofNotificationDeliverySuggestion");
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 1;
  smartPause = self->_smartPause;
  self->_smartPause = v4;

}

- (BOOL)hasQuieting
{
  return self->_quieting != 0;
}

- (void)setQuieting:(id)a3
{
  ATXPBNotificationQuietingSuggestion *v4;
  ATXPBNotificationQuietingSuggestion *quieting;

  v4 = (ATXPBNotificationQuietingSuggestion *)a3;
  -[ATXPBNotificationDeliverySuggestion clearOneofValuesForOneofNotificationDeliverySuggestion](self, "clearOneofValuesForOneofNotificationDeliverySuggestion");
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 2;
  quieting = self->_quieting;
  self->_quieting = v4;

}

- (BOOL)hasPromoting
{
  return self->_promoting != 0;
}

- (void)setPromoting:(id)a3
{
  ATXPBNotificationPromotingSuggestion *v4;
  ATXPBNotificationPromotingSuggestion *promoting;

  v4 = (ATXPBNotificationPromotingSuggestion *)a3;
  -[ATXPBNotificationDeliverySuggestion clearOneofValuesForOneofNotificationDeliverySuggestion](self, "clearOneofValuesForOneofNotificationDeliverySuggestion");
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 3;
  promoting = self->_promoting;
  self->_promoting = v4;

}

- (BOOL)hasInterruptionManagerTuning
{
  return self->_interruptionManagerTuning != 0;
}

- (void)setInterruptionManagerTuning:(id)a3
{
  ATXPBInterruptionManagerTuningSuggestion *v4;
  ATXPBInterruptionManagerTuningSuggestion *interruptionManagerTuning;

  v4 = (ATXPBInterruptionManagerTuningSuggestion *)a3;
  -[ATXPBNotificationDeliverySuggestion clearOneofValuesForOneofNotificationDeliverySuggestion](self, "clearOneofValuesForOneofNotificationDeliverySuggestion");
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 4;
  interruptionManagerTuning = self->_interruptionManagerTuning;
  self->_interruptionManagerTuning = v4;

}

- (BOOL)hasSendToDigest
{
  return self->_sendToDigest != 0;
}

- (void)setSendToDigest:(id)a3
{
  ATXPBSendToDigestSuggestion *v4;
  ATXPBSendToDigestSuggestion *sendToDigest;

  v4 = (ATXPBSendToDigestSuggestion *)a3;
  -[ATXPBNotificationDeliverySuggestion clearOneofValuesForOneofNotificationDeliverySuggestion](self, "clearOneofValuesForOneofNotificationDeliverySuggestion");
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 5;
  sendToDigest = self->_sendToDigest;
  self->_sendToDigest = v4;

}

- (BOOL)hasUrgencyTuning
{
  return self->_urgencyTuning != 0;
}

- (void)setUrgencyTuning:(id)a3
{
  ATXPBUrgencyTuningSuggestion *v4;
  ATXPBUrgencyTuningSuggestion *urgencyTuning;

  v4 = (ATXPBUrgencyTuningSuggestion *)a3;
  -[ATXPBNotificationDeliverySuggestion clearOneofValuesForOneofNotificationDeliverySuggestion](self, "clearOneofValuesForOneofNotificationDeliverySuggestion");
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 6;
  urgencyTuning = self->_urgencyTuning;
  self->_urgencyTuning = v4;

}

- (BOOL)hasSendMessagesToDigest
{
  return self->_sendMessagesToDigest != 0;
}

- (void)setSendMessagesToDigest:(id)a3
{
  ATXPBSendMessagesToDigestSuggestion *v4;
  ATXPBSendMessagesToDigestSuggestion *sendMessagesToDigest;

  v4 = (ATXPBSendMessagesToDigestSuggestion *)a3;
  -[ATXPBNotificationDeliverySuggestion clearOneofValuesForOneofNotificationDeliverySuggestion](self, "clearOneofValuesForOneofNotificationDeliverySuggestion");
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 7;
  sendMessagesToDigest = self->_sendMessagesToDigest;
  self->_sendMessagesToDigest = v4;

}

- (BOOL)hasTurnOffNotificationsForApp
{
  return self->_turnOffNotificationsForApp != 0;
}

- (void)setTurnOffNotificationsForApp:(id)a3
{
  ATXPBTurnOffNotificationsForAppSuggestion *v4;
  ATXPBTurnOffNotificationsForAppSuggestion *turnOffNotificationsForApp;

  v4 = (ATXPBTurnOffNotificationsForAppSuggestion *)a3;
  -[ATXPBNotificationDeliverySuggestion clearOneofValuesForOneofNotificationDeliverySuggestion](self, "clearOneofValuesForOneofNotificationDeliverySuggestion");
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 8;
  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  self->_turnOffNotificationsForApp = v4;

}

- (int)oneofNotificationDeliverySuggestion
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_oneofNotificationDeliverySuggestion;
  else
    return 0;
}

- (void)setOneofNotificationDeliverySuggestion:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = a3;
}

- (void)setHasOneofNotificationDeliverySuggestion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOneofNotificationDeliverySuggestion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)oneofNotificationDeliverySuggestionAsString:(int)a3
{
  if (a3 < 9)
    return off_1E4D5D4C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOneofNotificationDeliverySuggestion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("smartPause")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("quieting")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("promoting")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("interruptionManagerTuning")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sendToDigest")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("urgencyTuning")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sendMessagesToDigest")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("turnOffNotificationsForApp")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForOneofNotificationDeliverySuggestion
{
  ATXPBNotificationSmartPauseSuggestion *smartPause;
  ATXPBNotificationQuietingSuggestion *quieting;
  ATXPBNotificationPromotingSuggestion *promoting;
  ATXPBInterruptionManagerTuningSuggestion *interruptionManagerTuning;
  ATXPBSendToDigestSuggestion *sendToDigest;
  ATXPBUrgencyTuningSuggestion *urgencyTuning;
  ATXPBSendMessagesToDigestSuggestion *sendMessagesToDigest;
  ATXPBTurnOffNotificationsForAppSuggestion *turnOffNotificationsForApp;

  *(_BYTE *)&self->_has &= ~2u;
  self->_oneofNotificationDeliverySuggestion = 0;
  smartPause = self->_smartPause;
  self->_smartPause = 0;

  quieting = self->_quieting;
  self->_quieting = 0;

  promoting = self->_promoting;
  self->_promoting = 0;

  interruptionManagerTuning = self->_interruptionManagerTuning;
  self->_interruptionManagerTuning = 0;

  sendToDigest = self->_sendToDigest;
  self->_sendToDigest = 0;

  urgencyTuning = self->_urgencyTuning;
  self->_urgencyTuning = 0;

  sendMessagesToDigest = self->_sendMessagesToDigest;
  self->_sendMessagesToDigest = 0;

  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  self->_turnOffNotificationsForApp = 0;

}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
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

- (void)setScope:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_scope = a3;
}

- (void)setHasScope:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScope
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (BOOL)hasTriggerNotificationUUID
{
  return self->_triggerNotificationUUID != 0;
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
  v8.super_class = (Class)ATXPBNotificationDeliverySuggestion;
  -[ATXPBNotificationDeliverySuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBNotificationDeliverySuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATXPBNotificationSmartPauseSuggestion *smartPause;
  void *v5;
  ATXPBNotificationQuietingSuggestion *quieting;
  void *v7;
  ATXPBNotificationPromotingSuggestion *promoting;
  void *v9;
  ATXPBInterruptionManagerTuningSuggestion *interruptionManagerTuning;
  void *v11;
  ATXPBSendToDigestSuggestion *sendToDigest;
  void *v13;
  ATXPBUrgencyTuningSuggestion *urgencyTuning;
  void *v15;
  ATXPBSendMessagesToDigestSuggestion *sendMessagesToDigest;
  void *v17;
  ATXPBTurnOffNotificationsForAppSuggestion *turnOffNotificationsForApp;
  void *v19;
  uint64_t oneofNotificationDeliverySuggestion;
  __CFString *v21;
  NSString *uuid;
  char has;
  void *v24;
  void *v25;
  NSString *entityIdentifier;
  NSString *triggerNotificationUUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  smartPause = self->_smartPause;
  if (smartPause)
  {
    -[ATXPBNotificationSmartPauseSuggestion dictionaryRepresentation](smartPause, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("smartPause"));

  }
  quieting = self->_quieting;
  if (quieting)
  {
    -[ATXPBNotificationQuietingSuggestion dictionaryRepresentation](quieting, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("quieting"));

  }
  promoting = self->_promoting;
  if (promoting)
  {
    -[ATXPBNotificationPromotingSuggestion dictionaryRepresentation](promoting, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("promoting"));

  }
  interruptionManagerTuning = self->_interruptionManagerTuning;
  if (interruptionManagerTuning)
  {
    -[ATXPBInterruptionManagerTuningSuggestion dictionaryRepresentation](interruptionManagerTuning, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("interruptionManagerTuning"));

  }
  sendToDigest = self->_sendToDigest;
  if (sendToDigest)
  {
    -[ATXPBSendToDigestSuggestion dictionaryRepresentation](sendToDigest, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("sendToDigest"));

  }
  urgencyTuning = self->_urgencyTuning;
  if (urgencyTuning)
  {
    -[ATXPBUrgencyTuningSuggestion dictionaryRepresentation](urgencyTuning, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("urgencyTuning"));

  }
  sendMessagesToDigest = self->_sendMessagesToDigest;
  if (sendMessagesToDigest)
  {
    -[ATXPBSendMessagesToDigestSuggestion dictionaryRepresentation](sendMessagesToDigest, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("sendMessagesToDigest"));

  }
  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  if (turnOffNotificationsForApp)
  {
    -[ATXPBTurnOffNotificationsForAppSuggestion dictionaryRepresentation](turnOffNotificationsForApp, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("turnOffNotificationsForApp"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    oneofNotificationDeliverySuggestion = self->_oneofNotificationDeliverySuggestion;
    if (oneofNotificationDeliverySuggestion >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_oneofNotificationDeliverySuggestion);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E4D5D4C8[oneofNotificationDeliverySuggestion];
    }
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("OneofNotificationDeliverySuggestion"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("timestamp"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_scope);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("scope"));

  }
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier)
    objc_msgSend(v3, "setObject:forKey:", entityIdentifier, CFSTR("entityIdentifier"));
  triggerNotificationUUID = self->_triggerNotificationUUID;
  if (triggerNotificationUUID)
    objc_msgSend(v3, "setObject:forKey:", triggerNotificationUUID, CFSTR("triggerNotificationUUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationDeliverySuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_entityIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_triggerNotificationUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_smartPause)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_quieting)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_promoting)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_interruptionManagerTuning)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendToDigest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_urgencyTuning)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sendMessagesToDigest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_turnOffNotificationsForApp)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[8] = self->_oneofNotificationDeliverySuggestion;
    *((_BYTE *)v4 + 120) |= 2u;
  }
  v6 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 120) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[14] = self->_scope;
    *((_BYTE *)v4 + 120) |= 4u;
  }
  if (self->_entityIdentifier)
  {
    objc_msgSend(v6, "setEntityIdentifier:");
    v4 = v6;
  }
  if (self->_triggerNotificationUUID)
  {
    objc_msgSend(v6, "setTriggerNotificationUUID:");
    v4 = v6;
  }
  if (self->_smartPause)
  {
    objc_msgSend(v6, "setSmartPause:");
    v4 = v6;
  }
  if (self->_quieting)
  {
    objc_msgSend(v6, "setQuieting:");
    v4 = v6;
  }
  if (self->_promoting)
  {
    objc_msgSend(v6, "setPromoting:");
    v4 = v6;
  }
  if (self->_interruptionManagerTuning)
  {
    objc_msgSend(v6, "setInterruptionManagerTuning:");
    v4 = v6;
  }
  if (self->_sendToDigest)
  {
    objc_msgSend(v6, "setSendToDigest:");
    v4 = v6;
  }
  if (self->_urgencyTuning)
  {
    objc_msgSend(v6, "setUrgencyTuning:");
    v4 = v6;
  }
  if (self->_sendMessagesToDigest)
  {
    objc_msgSend(v6, "setSendMessagesToDigest:");
    v4 = v6;
  }
  if (self->_turnOffNotificationsForApp)
  {
    objc_msgSend(v6, "setTurnOffNotificationsForApp:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_oneofNotificationDeliverySuggestion;
    *(_BYTE *)(v5 + 120) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v7;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_timestamp;
    *(_BYTE *)(v6 + 120) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_scope;
    *(_BYTE *)(v6 + 120) |= 4u;
  }
  v10 = -[NSString copyWithZone:](self->_entityIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_triggerNotificationUUID, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v12;

  v14 = -[ATXPBNotificationSmartPauseSuggestion copyWithZone:](self->_smartPause, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v14;

  v16 = -[ATXPBNotificationQuietingSuggestion copyWithZone:](self->_quieting, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v16;

  v18 = -[ATXPBNotificationPromotingSuggestion copyWithZone:](self->_promoting, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v18;

  v20 = -[ATXPBInterruptionManagerTuningSuggestion copyWithZone:](self->_interruptionManagerTuning, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v20;

  v22 = -[ATXPBSendToDigestSuggestion copyWithZone:](self->_sendToDigest, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v22;

  v24 = -[ATXPBUrgencyTuningSuggestion copyWithZone:](self->_urgencyTuning, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v24;

  v26 = -[ATXPBSendMessagesToDigestSuggestion copyWithZone:](self->_sendMessagesToDigest, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v26;

  v28 = -[ATXPBTurnOffNotificationsForAppSuggestion copyWithZone:](self->_turnOffNotificationsForApp, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v28;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *uuid;
  NSString *entityIdentifier;
  NSString *triggerNotificationUUID;
  ATXPBNotificationSmartPauseSuggestion *smartPause;
  ATXPBNotificationQuietingSuggestion *quieting;
  ATXPBNotificationPromotingSuggestion *promoting;
  ATXPBInterruptionManagerTuningSuggestion *interruptionManagerTuning;
  ATXPBSendToDigestSuggestion *sendToDigest;
  ATXPBUrgencyTuningSuggestion *urgencyTuning;
  ATXPBSendMessagesToDigestSuggestion *sendMessagesToDigest;
  ATXPBTurnOffNotificationsForAppSuggestion *turnOffNotificationsForApp;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 2) == 0 || self->_oneofNotificationDeliverySuggestion != *((_DWORD *)v4 + 8))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
    goto LABEL_40;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
    {
LABEL_40:
      v17 = 0;
      goto LABEL_41;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 4) == 0 || self->_scope != *((_DWORD *)v4 + 14))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 120) & 4) != 0)
  {
    goto LABEL_40;
  }
  entityIdentifier = self->_entityIdentifier;
  if ((unint64_t)entityIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](entityIdentifier, "isEqual:"))
  {
    goto LABEL_40;
  }
  triggerNotificationUUID = self->_triggerNotificationUUID;
  if ((unint64_t)triggerNotificationUUID | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](triggerNotificationUUID, "isEqual:"))
      goto LABEL_40;
  }
  smartPause = self->_smartPause;
  if ((unint64_t)smartPause | *((_QWORD *)v4 + 10))
  {
    if (!-[ATXPBNotificationSmartPauseSuggestion isEqual:](smartPause, "isEqual:"))
      goto LABEL_40;
  }
  quieting = self->_quieting;
  if ((unint64_t)quieting | *((_QWORD *)v4 + 6))
  {
    if (!-[ATXPBNotificationQuietingSuggestion isEqual:](quieting, "isEqual:"))
      goto LABEL_40;
  }
  promoting = self->_promoting;
  if ((unint64_t)promoting | *((_QWORD *)v4 + 5))
  {
    if (!-[ATXPBNotificationPromotingSuggestion isEqual:](promoting, "isEqual:"))
      goto LABEL_40;
  }
  interruptionManagerTuning = self->_interruptionManagerTuning;
  if ((unint64_t)interruptionManagerTuning | *((_QWORD *)v4 + 3))
  {
    if (!-[ATXPBInterruptionManagerTuningSuggestion isEqual:](interruptionManagerTuning, "isEqual:"))
      goto LABEL_40;
  }
  sendToDigest = self->_sendToDigest;
  if ((unint64_t)sendToDigest | *((_QWORD *)v4 + 9))
  {
    if (!-[ATXPBSendToDigestSuggestion isEqual:](sendToDigest, "isEqual:"))
      goto LABEL_40;
  }
  urgencyTuning = self->_urgencyTuning;
  if ((unint64_t)urgencyTuning | *((_QWORD *)v4 + 13))
  {
    if (!-[ATXPBUrgencyTuningSuggestion isEqual:](urgencyTuning, "isEqual:"))
      goto LABEL_40;
  }
  sendMessagesToDigest = self->_sendMessagesToDigest;
  if ((unint64_t)sendMessagesToDigest | *((_QWORD *)v4 + 8))
  {
    if (!-[ATXPBSendMessagesToDigestSuggestion isEqual:](sendMessagesToDigest, "isEqual:"))
      goto LABEL_40;
  }
  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  if ((unint64_t)turnOffNotificationsForApp | *((_QWORD *)v4 + 12))
    v17 = -[ATXPBTurnOffNotificationsForAppSuggestion isEqual:](turnOffNotificationsForApp, "isEqual:");
  else
    v17 = 1;
LABEL_41:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double timestamp;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_oneofNotificationDeliverySuggestion;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_uuid, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    timestamp = self->_timestamp;
    v8 = -timestamp;
    if (timestamp >= 0.0)
      v8 = self->_timestamp;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 4) != 0)
    v11 = 2654435761 * self->_scope;
  else
    v11 = 0;
  v12 = v4 ^ v3 ^ v6 ^ v11 ^ -[NSString hash](self->_entityIdentifier, "hash");
  v13 = -[NSString hash](self->_triggerNotificationUUID, "hash");
  v14 = v13 ^ -[ATXPBNotificationSmartPauseSuggestion hash](self->_smartPause, "hash");
  v15 = v12 ^ v14 ^ -[ATXPBNotificationQuietingSuggestion hash](self->_quieting, "hash");
  v16 = -[ATXPBNotificationPromotingSuggestion hash](self->_promoting, "hash");
  v17 = v16 ^ -[ATXPBInterruptionManagerTuningSuggestion hash](self->_interruptionManagerTuning, "hash");
  v18 = v17 ^ -[ATXPBSendToDigestSuggestion hash](self->_sendToDigest, "hash");
  v19 = v15 ^ v18 ^ -[ATXPBUrgencyTuningSuggestion hash](self->_urgencyTuning, "hash");
  v20 = -[ATXPBSendMessagesToDigestSuggestion hash](self->_sendMessagesToDigest, "hash");
  return v19 ^ v20 ^ -[ATXPBTurnOffNotificationsForAppSuggestion hash](self->_turnOffNotificationsForApp, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  ATXPBNotificationSmartPauseSuggestion *smartPause;
  uint64_t v8;
  ATXPBNotificationQuietingSuggestion *quieting;
  uint64_t v10;
  ATXPBNotificationPromotingSuggestion *promoting;
  uint64_t v12;
  ATXPBInterruptionManagerTuningSuggestion *interruptionManagerTuning;
  uint64_t v14;
  ATXPBSendToDigestSuggestion *sendToDigest;
  uint64_t v16;
  ATXPBUrgencyTuningSuggestion *urgencyTuning;
  uint64_t v18;
  ATXPBSendMessagesToDigestSuggestion *sendMessagesToDigest;
  uint64_t v20;
  ATXPBTurnOffNotificationsForAppSuggestion *turnOffNotificationsForApp;
  uint64_t v22;
  _DWORD *v23;

  v4 = a3;
  v5 = v4;
  if ((v4[30] & 2) != 0)
  {
    self->_oneofNotificationDeliverySuggestion = v4[8];
    *(_BYTE *)&self->_has |= 2u;
  }
  v23 = v4;
  if (*((_QWORD *)v4 + 14))
  {
    -[ATXPBNotificationDeliverySuggestion setUuid:](self, "setUuid:");
    v5 = v23;
  }
  v6 = *((_BYTE *)v5 + 120);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((double *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v5 + 120);
  }
  if ((v6 & 4) != 0)
  {
    self->_scope = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 2))
  {
    -[ATXPBNotificationDeliverySuggestion setEntityIdentifier:](self, "setEntityIdentifier:");
    v5 = v23;
  }
  if (*((_QWORD *)v5 + 11))
  {
    -[ATXPBNotificationDeliverySuggestion setTriggerNotificationUUID:](self, "setTriggerNotificationUUID:");
    v5 = v23;
  }
  smartPause = self->_smartPause;
  v8 = *((_QWORD *)v5 + 10);
  if (smartPause)
  {
    if (!v8)
      goto LABEL_19;
    -[ATXPBNotificationSmartPauseSuggestion mergeFrom:](smartPause, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_19;
    -[ATXPBNotificationDeliverySuggestion setSmartPause:](self, "setSmartPause:");
  }
  v5 = v23;
LABEL_19:
  quieting = self->_quieting;
  v10 = *((_QWORD *)v5 + 6);
  if (quieting)
  {
    if (!v10)
      goto LABEL_25;
    -[ATXPBNotificationQuietingSuggestion mergeFrom:](quieting, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_25;
    -[ATXPBNotificationDeliverySuggestion setQuieting:](self, "setQuieting:");
  }
  v5 = v23;
LABEL_25:
  promoting = self->_promoting;
  v12 = *((_QWORD *)v5 + 5);
  if (promoting)
  {
    if (!v12)
      goto LABEL_31;
    -[ATXPBNotificationPromotingSuggestion mergeFrom:](promoting, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_31;
    -[ATXPBNotificationDeliverySuggestion setPromoting:](self, "setPromoting:");
  }
  v5 = v23;
LABEL_31:
  interruptionManagerTuning = self->_interruptionManagerTuning;
  v14 = *((_QWORD *)v5 + 3);
  if (interruptionManagerTuning)
  {
    if (!v14)
      goto LABEL_37;
    -[ATXPBInterruptionManagerTuningSuggestion mergeFrom:](interruptionManagerTuning, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_37;
    -[ATXPBNotificationDeliverySuggestion setInterruptionManagerTuning:](self, "setInterruptionManagerTuning:");
  }
  v5 = v23;
LABEL_37:
  sendToDigest = self->_sendToDigest;
  v16 = *((_QWORD *)v5 + 9);
  if (sendToDigest)
  {
    if (!v16)
      goto LABEL_43;
    -[ATXPBSendToDigestSuggestion mergeFrom:](sendToDigest, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_43;
    -[ATXPBNotificationDeliverySuggestion setSendToDigest:](self, "setSendToDigest:");
  }
  v5 = v23;
LABEL_43:
  urgencyTuning = self->_urgencyTuning;
  v18 = *((_QWORD *)v5 + 13);
  if (urgencyTuning)
  {
    if (!v18)
      goto LABEL_49;
    -[ATXPBUrgencyTuningSuggestion mergeFrom:](urgencyTuning, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_49;
    -[ATXPBNotificationDeliverySuggestion setUrgencyTuning:](self, "setUrgencyTuning:");
  }
  v5 = v23;
LABEL_49:
  sendMessagesToDigest = self->_sendMessagesToDigest;
  v20 = *((_QWORD *)v5 + 8);
  if (sendMessagesToDigest)
  {
    if (!v20)
      goto LABEL_55;
    -[ATXPBSendMessagesToDigestSuggestion mergeFrom:](sendMessagesToDigest, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_55;
    -[ATXPBNotificationDeliverySuggestion setSendMessagesToDigest:](self, "setSendMessagesToDigest:");
  }
  v5 = v23;
LABEL_55:
  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  v22 = *((_QWORD *)v5 + 12);
  if (turnOffNotificationsForApp)
  {
    if (v22)
    {
      -[ATXPBTurnOffNotificationsForAppSuggestion mergeFrom:](turnOffNotificationsForApp, "mergeFrom:");
LABEL_60:
      v5 = v23;
    }
  }
  else if (v22)
  {
    -[ATXPBNotificationDeliverySuggestion setTurnOffNotificationsForApp:](self, "setTurnOffNotificationsForApp:");
    goto LABEL_60;
  }

}

- (ATXPBNotificationSmartPauseSuggestion)smartPause
{
  return self->_smartPause;
}

- (ATXPBNotificationQuietingSuggestion)quieting
{
  return self->_quieting;
}

- (ATXPBNotificationPromotingSuggestion)promoting
{
  return self->_promoting;
}

- (ATXPBInterruptionManagerTuningSuggestion)interruptionManagerTuning
{
  return self->_interruptionManagerTuning;
}

- (ATXPBSendToDigestSuggestion)sendToDigest
{
  return self->_sendToDigest;
}

- (ATXPBUrgencyTuningSuggestion)urgencyTuning
{
  return self->_urgencyTuning;
}

- (ATXPBSendMessagesToDigestSuggestion)sendMessagesToDigest
{
  return self->_sendMessagesToDigest;
}

- (ATXPBTurnOffNotificationsForAppSuggestion)turnOffNotificationsForApp
{
  return self->_turnOffNotificationsForApp;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)scope
{
  return self->_scope;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_entityIdentifier, a3);
}

- (NSString)triggerNotificationUUID
{
  return self->_triggerNotificationUUID;
}

- (void)setTriggerNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_triggerNotificationUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_urgencyTuning, 0);
  objc_storeStrong((id *)&self->_turnOffNotificationsForApp, 0);
  objc_storeStrong((id *)&self->_triggerNotificationUUID, 0);
  objc_storeStrong((id *)&self->_smartPause, 0);
  objc_storeStrong((id *)&self->_sendToDigest, 0);
  objc_storeStrong((id *)&self->_sendMessagesToDigest, 0);
  objc_storeStrong((id *)&self->_quieting, 0);
  objc_storeStrong((id *)&self->_promoting, 0);
  objc_storeStrong((id *)&self->_interruptionManagerTuning, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
