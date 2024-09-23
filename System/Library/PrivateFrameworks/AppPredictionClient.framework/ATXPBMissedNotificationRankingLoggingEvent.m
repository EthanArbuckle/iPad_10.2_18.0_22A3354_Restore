@implementation ATXPBMissedNotificationRankingLoggingEvent

- (BOOL)hasMissedNotificationRanking
{
  return self->_missedNotificationRanking != 0;
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
  if (a3 < 8)
    return off_1E4D58E58[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExpandedView")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CollapsedView")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpcomingExpandedView")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeliveredExpandedView")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UpcomingCollapsedView")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeliveredCollapsedView")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Removed")) & 1) != 0)
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
  v8.super_class = (Class)ATXPBMissedNotificationRankingLoggingEvent;
  -[ATXPBMissedNotificationRankingLoggingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBMissedNotificationRankingLoggingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ATXPBMissedNotificationRanking *missedNotificationRanking;
  void *v5;
  char has;
  uint64_t eventType;
  __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  missedNotificationRanking = self->_missedNotificationRanking;
  if (missedNotificationRanking)
  {
    -[ATXPBMissedNotificationRanking dictionaryRepresentation](missedNotificationRanking, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("missedNotificationRanking"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4D58E58[eventType];
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
  return ATXPBMissedNotificationRankingLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_missedNotificationRanking)
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
  if (self->_missedNotificationRanking)
  {
    v6 = v4;
    objc_msgSend(v4, "setMissedNotificationRanking:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_eventType;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestamp;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ATXPBMissedNotificationRanking copyWithZone:](self->_missedNotificationRanking, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBMissedNotificationRanking *missedNotificationRanking;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  missedNotificationRanking = self->_missedNotificationRanking;
  if ((unint64_t)missedNotificationRanking | *((_QWORD *)v4 + 3))
  {
    if (!-[ATXPBMissedNotificationRanking isEqual:](missedNotificationRanking, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((double *)v4 + 1))
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

  v3 = -[ATXPBMissedNotificationRanking hash](self->_missedNotificationRanking, "hash");
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
  ATXPBMissedNotificationRanking *missedNotificationRanking;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  missedNotificationRanking = self->_missedNotificationRanking;
  v6 = *((_QWORD *)v4 + 3);
  if (missedNotificationRanking)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[ATXPBMissedNotificationRanking mergeFrom:](missedNotificationRanking, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[ATXPBMissedNotificationRankingLoggingEvent setMissedNotificationRanking:](self, "setMissedNotificationRanking:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 32);
  }
  if ((v7 & 1) != 0)
  {
    self->_timestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (ATXPBMissedNotificationRanking)missedNotificationRanking
{
  return self->_missedNotificationRanking;
}

- (void)setMissedNotificationRanking:(id)a3
{
  objc_storeStrong((id *)&self->_missedNotificationRanking, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missedNotificationRanking, 0);
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXPBMissedNotificationRankingLoggingEvent *v5;
  id v6;
  ATXPBMissedNotificationRanking *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = -[ATXPBMissedNotificationRankingLoggingEvent init](self, "init");
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = [ATXPBMissedNotificationRanking alloc];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("missedNotificationRanking"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ATXPBMissedNotificationRanking initFromJSON:](v7, "initFromJSON:", v8);
      -[ATXPBMissedNotificationRankingLoggingEvent setMissedNotificationRanking:](v5, "setMissedNotificationRanking:", v9);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ExpandedView")) & 1) != 0)
      {
        v11 = 0;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CollapsedView")) & 1) != 0)
      {
        v11 = 1;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UpcomingExpandedView")) & 1) != 0)
      {
        v11 = 2;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DeliveredExpandedView")) & 1) != 0)
      {
        v11 = 3;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UpcomingCollapsedView")) & 1) != 0)
      {
        v11 = 4;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DeliveredCollapsedView")) & 1) != 0)
      {
        v11 = 5;
      }
      else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Removed")) & 1) != 0)
      {
        v11 = 6;
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("Total")))
      {
        v11 = 7;
      }
      else
      {
        v11 = 0;
      }

      -[ATXPBMissedNotificationRankingLoggingEvent setEventType:](v5, "setEventType:", v11);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      -[ATXPBMissedNotificationRankingLoggingEvent setTimestamp:](v5, "setTimestamp:");

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
  v12[0] = CFSTR("missedNotificationRanking");
  -[ATXPBMissedNotificationRanking jsonRepresentation](self->_missedNotificationRanking, "jsonRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("eventType");
  eventType = self->_eventType;
  if (eventType >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E4D593B8[eventType];
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
