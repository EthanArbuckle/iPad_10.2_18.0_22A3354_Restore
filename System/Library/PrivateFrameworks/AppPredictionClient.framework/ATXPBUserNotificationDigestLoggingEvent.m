@implementation ATXPBUserNotificationDigestLoggingEvent

- (BOOL)hasDigest
{
  return self->_digest != 0;
}

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_eventType;
  else
    return 0;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4D58CF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ScheduledView")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CollapsedView")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpcomingView")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 3;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotificationDigestLoggingEvent;
  -[ATXPBUserNotificationDigestLoggingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBUserNotificationDigestLoggingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATXPBUserNotificationDigest *digest;
  void *v5;
  char has;
  uint64_t eventType;
  __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  digest = self->_digest;
  if (digest)
  {
    -[ATXPBUserNotificationDigest dictionaryRepresentation](digest, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("digest"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4D58CF8[eventType];
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationDigestLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_digest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_digest)
  {
    v6 = v4;
    objc_msgSend(v4, "setDigest:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_eventType;
    *((_BYTE *)v4 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ATXPBUserNotificationDigest copyWithZone:](self->_digest, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventType;
    *(_BYTE *)(v5 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBUserNotificationDigest *digest;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  digest = self->_digest;
  if ((unint64_t)digest | *((_QWORD *)v4 + 2))
  {
    if (!-[ATXPBUserNotificationDigest isEqual:](digest, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
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

  v3 = -[ATXPBUserNotificationDigest hash](self->_digest, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_eventType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v9;
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
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  ATXPBUserNotificationDigest *digest;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  digest = self->_digest;
  v6 = *((_QWORD *)v4 + 2);
  if (digest)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[ATXPBUserNotificationDigest mergeFrom:](digest, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[ATXPBUserNotificationDigestLoggingEvent setDigest:](self, "setDigest:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 28);
  if ((v7 & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 28);
  }
  if ((v7 & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (ATXPBUserNotificationDigest)digest
{
  return self->_digest;
}

- (void)setDigest:(id)a3
{
  objc_storeStrong((id *)&self->_digest, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digest, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBUserNotificationDigestLoggingEvent *v5;
  id v6;
  ATXPBUserNotificationDigest *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = -[ATXPBUserNotificationDigestLoggingEvent init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = [ATXPBUserNotificationDigest alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("digest"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ATXPBUserNotificationDigest initFromJSON:](v7, "initFromJSON:", v8);
      -[ATXPBUserNotificationDigestLoggingEvent setDigest:](v5, "setDigest:", v9);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ScheduledView")) & 1) != 0)
      {
        v11 = 0;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CollapsedView")) & 1) != 0)
      {
        v11 = 1;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UpcomingView")) & 1) != 0)
      {
        v11 = 2;
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Total")))
      {
        v11 = 3;
      }
      else
      {
        v11 = 0;
      }

      -[ATXPBUserNotificationDigestLoggingEvent setEventType:](v5, "setEventType:", v11);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      -[ATXPBUserNotificationDigestLoggingEvent setTimestamp:](v5, "setTimestamp:");

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
  v12[0] = CFSTR("digest");
  -[ATXPBUserNotificationDigest jsonRepresentation](self->_digest, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("eventType");
  eventType = self->_eventType;
  if (eventType >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E4D5A7A8[eventType];
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

@end
