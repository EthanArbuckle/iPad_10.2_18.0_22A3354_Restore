@implementation ATXPBNotificationSuggestionInteractionEvent

- (uint64_t)suggestionType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 32) & 4) != 0)
      return *(unsigned int *)(result + 20);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setSuggestionType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 4u;
    *(_DWORD *)(result + 20) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestionType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasSuggestionType
{
  if (result)
    return (*(unsigned __int8 *)(result + 32) >> 2) & 1;
  return result;
}

- (__CFString)suggestionTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 0xB)
      return off_1E4D57A20[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsSuggestionType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unused")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Quieting")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Promoting")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RealTimeTuning")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SmartPause")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("InterruptionManagement")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SendToDigest")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UrgencyTuningSuggestion")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SendMessagesToDigest")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TurnOffNotificationsForAppSuggestion")) & 1) != 0)
    {
      v6 = 9;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Total")))
    {
      v6 = 10;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 32) & 2) != 0)
      return *(unsigned int *)(result + 16);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result)
    return (*(unsigned __int8 *)(result + 32) >> 1) & 1;
  return result;
}

- (__CFString)eventTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 0xA)
      return off_1E4D57A78[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unused")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Rejected")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Accepted")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Appeared")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Cleared")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Removed")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Expired")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Created")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("CouldNotShow")) & 1) != 0)
    {
      v6 = 8;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Total")))
    {
      v6 = 9;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasSuggestionUUID
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (uint64_t)setSecondsSinceReferenceDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasSecondsSinceReferenceDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFE | a2;
  return result;
}

- (uint64_t)hasSecondsSinceReferenceDate
{
  if (result)
    return *(_BYTE *)(result + 32) & 1;
  return result;
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
  v8.super_class = (Class)ATXPBNotificationSuggestionInteractionEvent;
  -[ATXPBNotificationSuggestionInteractionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBNotificationSuggestionInteractionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t suggestionType;
  __CFString *v6;
  uint64_t eventType;
  __CFString *v8;
  NSString *suggestionUUID;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    suggestionType = self->_suggestionType;
    if (suggestionType >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suggestionType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E4D57A20[suggestionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("suggestionType"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4D57A78[eventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("eventType"));

  }
  suggestionUUID = self->_suggestionUUID;
  if (suggestionUUID)
    objc_msgSend(v3, "setObject:forKey:", suggestionUUID, CFSTR("suggestionUUID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsSinceReferenceDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("secondsSinceReferenceDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationSuggestionInteractionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_suggestionUUID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(uint64_t)a1
{
  _DWORD *v3;
  char v4;
  void *v5;
  _DWORD *v6;

  v3 = a2;
  if (a1)
  {
    v4 = *(_BYTE *)(a1 + 32);
    if ((v4 & 4) != 0)
    {
      v3[5] = *(_DWORD *)(a1 + 20);
      *((_BYTE *)v3 + 32) |= 4u;
      v4 = *(_BYTE *)(a1 + 32);
    }
    if ((v4 & 2) != 0)
    {
      v3[4] = *(_DWORD *)(a1 + 16);
      *((_BYTE *)v3 + 32) |= 2u;
    }
    v5 = *(void **)(a1 + 24);
    if (v5)
    {
      v6 = v3;
      -[ATXPBNotificationSuggestionInteractionEvent setSuggestionUUID:]((uint64_t)v3, v5);
      v3 = v6;
    }
    if ((*(_BYTE *)(a1 + 32) & 1) != 0)
    {
      *((_QWORD *)v3 + 1) = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v3 + 32) |= 1u;
    }
  }

}

- (void)setSuggestionUUID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
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
    *(_DWORD *)(v5 + 20) = self->_suggestionType;
    *(_BYTE *)(v5 + 32) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_suggestionUUID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_secondsSinceReferenceDate;
    *(_BYTE *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *suggestionUUID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_suggestionType != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  suggestionUUID = self->_suggestionUUID;
  if ((unint64_t)suggestionUUID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](suggestionUUID, "isEqual:"))
    {
LABEL_19:
      v7 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_secondsSinceReferenceDate != *((double *)v4 + 1))
      goto LABEL_19;
    v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  double secondsSinceReferenceDate;
  double v8;
  long double v9;
  double v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_suggestionType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_eventType;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_suggestionUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    secondsSinceReferenceDate = self->_secondsSinceReferenceDate;
    v8 = -secondsSinceReferenceDate;
    if (secondsSinceReferenceDate >= 0.0)
      v8 = self->_secondsSinceReferenceDate;
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
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  char v4;
  void *v5;
  _BYTE *v6;

  v3 = a2;
  if (a1)
  {
    v4 = v3[32];
    if ((v4 & 4) != 0)
    {
      *(_DWORD *)(a1 + 20) = *((_DWORD *)v3 + 5);
      *(_BYTE *)(a1 + 32) |= 4u;
      v4 = v3[32];
    }
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(_BYTE *)(a1 + 32) |= 2u;
    }
    v5 = (void *)*((_QWORD *)v3 + 3);
    if (v5)
    {
      v6 = v3;
      objc_storeStrong((id *)(a1 + 24), v5);
      v3 = v6;
    }
    if ((v3[32] & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = *((_QWORD *)v3 + 1);
      *(_BYTE *)(a1 + 32) |= 1u;
    }
  }

}

- (uint64_t)suggestionUUID
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (double)secondsSinceReferenceDate
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
}

@end
