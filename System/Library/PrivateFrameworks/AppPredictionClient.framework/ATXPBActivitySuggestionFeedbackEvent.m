@implementation ATXPBActivitySuggestionFeedbackEvent

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 44) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 44) = *(_BYTE *)(result + 44) & 0xFE | a2;
  return result;
}

- (uint64_t)hasDate
{
  if (result)
    return *(_BYTE *)(result + 44) & 1;
  return result;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 44) & 2) != 0)
      return *(unsigned int *)(result + 24);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 44) |= 2u;
    *(_DWORD *)(result + 24) = a2;
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
    *(_BYTE *)(result + 44) = *(_BYTE *)(result + 44) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result)
    return (*(unsigned __int8 *)(result + 44) >> 1) & 1;
  return result;
}

- (__CFString)eventTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 5)
      return off_1E4D570F0[(int)a2];
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Suggested")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Seen")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Accepted")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Rejected")) & 1) != 0)
    {
      v6 = 3;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SetUpFinished")))
    {
      v6 = 4;
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

- (uint64_t)suggestionType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 44) & 8) != 0)
      return *(unsigned int *)(result + 40);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setSuggestionType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 44) |= 8u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestionType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 44) = *(_BYTE *)(result + 44) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasSuggestionType
{
  if (result)
    return (*(unsigned __int8 *)(result + 44) >> 3) & 1;
  return result;
}

- (__CFString)suggestionTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 3)
      return off_1E4D57118[(int)a2];
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SetUp")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("EnterAnAlreadyConfiguredActivity")) & 1) != 0)
    {
      v6 = 1;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Trigger")))
    {
      v6 = 2;
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

- (BOOL)hasActivity
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (uint64_t)clearSerializedAcceptedTriggers
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "removeAllObjects");
  return result;
}

- (void)addSerializedAcceptedTriggers:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (uint64_t)serializedAcceptedTriggersCount
{
  if (result)
    return objc_msgSend(*(id *)(result + 32), "count");
  return result;
}

- (id)serializedAcceptedTriggersAtIndex:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[4], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (uint64_t)serializedAcceptedTriggersType
{
  objc_opt_self();
  return objc_opt_class();
}

- (uint64_t)location
{
  if (result)
  {
    if ((*(_BYTE *)(result + 44) & 4) != 0)
      return *(unsigned int *)(result + 28);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setLocation:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 44) |= 4u;
    *(_DWORD *)(result + 28) = a2;
  }
  return result;
}

- (uint64_t)setHasLocation:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 44) = *(_BYTE *)(result + 44) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasLocation
{
  if (result)
    return (*(unsigned __int8 *)(result + 44) >> 2) & 1;
  return result;
}

- (__CFString)locationAsString:(__CFString *)a1
{
  if (a1)
  {
    if (!(_DWORD)a2)
      return CFSTR("ControlCenter");
    if ((_DWORD)a2 == 1)
    {
      a1 = CFSTR("LockScreen");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (uint64_t)StringAsLocation:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ControlCenter")) & 1) != 0)
      a1 = 0;
    else
      a1 = objc_msgSend(v4, "isEqualToString:", CFSTR("LockScreen"));
  }

  return a1;
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
  v8.super_class = (Class)ATXPBActivitySuggestionFeedbackEvent;
  -[ATXPBActivitySuggestionFeedbackEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBActivitySuggestionFeedbackEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t suggestionType;
  __CFString *v9;
  ATXPBActivity *activity;
  void *v11;
  NSMutableArray *serializedAcceptedTriggers;
  int location;
  __CFString *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("date"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_14;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  eventType = self->_eventType;
  if (eventType >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E4D570F0[eventType];
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("eventType"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_10:
    suggestionType = self->_suggestionType;
    if (suggestionType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suggestionType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E4D57118[suggestionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("suggestionType"));

  }
LABEL_14:
  activity = self->_activity;
  if (activity)
  {
    -[ATXPBActivity dictionaryRepresentation](activity, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("activity"));

  }
  serializedAcceptedTriggers = self->_serializedAcceptedTriggers;
  if (serializedAcceptedTriggers)
    objc_msgSend(v3, "setObject:forKey:", serializedAcceptedTriggers, CFSTR("serializedAcceptedTriggers"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    location = self->_location;
    if (location)
    {
      if (location == 1)
      {
        v14 = CFSTR("LockScreen");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_location);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = CFSTR("ControlCenter");
    }
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("location"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBActivitySuggestionFeedbackEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_activity)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_serializedAcceptedTriggers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(uint64_t)a1
{
  id *v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id *v10;

  v3 = a2;
  if (!a1)
    goto LABEL_16;
  v4 = *(_BYTE *)(a1 + 44);
  if ((v4 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
      goto LABEL_4;
LABEL_18:
    *((_DWORD *)v3 + 6) = *(_DWORD *)(a1 + 24);
    *((_BYTE *)v3 + 44) |= 2u;
    if ((*(_BYTE *)(a1 + 44) & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3[1] = *(id *)(a1 + 8);
  *((_BYTE *)v3 + 44) |= 1u;
  v4 = *(_BYTE *)(a1 + 44);
  if ((v4 & 2) != 0)
    goto LABEL_18;
LABEL_4:
  if ((v4 & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v3 + 10) = *(_DWORD *)(a1 + 40);
    *((_BYTE *)v3 + 44) |= 8u;
  }
LABEL_6:
  v10 = v3;
  v5 = *(void **)(a1 + 16);
  if (v5)
    -[ATXPBActivitySuggestionFeedbackEvent setActivity:]((uint64_t)v3, v5);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (v10)
      objc_msgSend(v10[4], "removeAllObjects");
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXPBActivitySuggestionFeedbackEvent addSerializedAcceptedTriggers:]((uint64_t)v10, v9);

      }
    }
  }
  v3 = v10;
  if ((*(_BYTE *)(a1 + 44) & 4) != 0)
  {
    *((_DWORD *)v10 + 7) = *(_DWORD *)(a1 + 28);
    *((_BYTE *)v10 + 44) |= 4u;
  }
LABEL_16:

}

- (void)setActivity:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_eventType;
  *(_BYTE *)(v5 + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_suggestionType;
    *(_BYTE *)(v5 + 44) |= 8u;
  }
LABEL_5:
  v8 = -[ATXPBActivity copyWithZone:](self->_activity, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_serializedAcceptedTriggers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        -[ATXPBActivitySuggestionFeedbackEvent addSerializedAcceptedTriggers:](v6, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_location;
    *(_BYTE *)(v6 + 44) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ATXPBActivity *activity;
  NSMutableArray *serializedAcceptedTriggers;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_25:
    v7 = 0;
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 6))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_suggestionType != *((_DWORD *)v4 + 10))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_25;
  }
  activity = self->_activity;
  if ((unint64_t)activity | *((_QWORD *)v4 + 2) && !-[ATXPBActivity isEqual:](activity, "isEqual:"))
    goto LABEL_25;
  serializedAcceptedTriggers = self->_serializedAcceptedTriggers;
  if ((unint64_t)serializedAcceptedTriggers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](serializedAcceptedTriggers, "isEqual:"))
      goto LABEL_25;
  }
  v7 = (*((_BYTE *)v4 + 44) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_location != *((_DWORD *)v4 + 7))
      goto LABEL_25;
    v7 = 1;
  }
LABEL_26:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double date;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    date = self->_date;
    v6 = -date;
    if (date >= 0.0)
      v6 = self->_date;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    v9 = 2654435761 * self->_eventType;
    if ((has & 8) != 0)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
    if ((has & 8) != 0)
    {
LABEL_11:
      v10 = 2654435761 * self->_suggestionType;
      goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:
  v11 = -[ATXPBActivity hash](self->_activity, "hash");
  v12 = -[NSMutableArray hash](self->_serializedAcceptedTriggers, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v13 = 2654435761 * self->_location;
  else
    v13 = 0;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(uint64_t)a1
{
  _BYTE *v3;
  id *v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)v3;
  if (!a1)
    goto LABEL_23;
  v5 = v3[44];
  if ((v5 & 1) == 0)
  {
    if ((v3[44] & 2) == 0)
      goto LABEL_4;
LABEL_10:
    *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
    *(_BYTE *)(a1 + 44) |= 2u;
    if ((v3[44] & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  *(_QWORD *)(a1 + 8) = *((_QWORD *)v3 + 1);
  *(_BYTE *)(a1 + 44) |= 1u;
  v5 = v3[44];
  if ((v5 & 2) != 0)
    goto LABEL_10;
LABEL_4:
  if ((v5 & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
    *(_BYTE *)(a1 + 44) |= 8u;
  }
LABEL_6:
  v6 = (void *)*((_QWORD *)v3 + 2);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v6)
      -[ATXPBActivity mergeFrom:](*(_QWORD *)(a1 + 16), v6);
  }
  else if (v6)
  {
    objc_storeStrong((id *)(a1 + 16), v6);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4[4];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[ATXPBActivitySuggestionFeedbackEvent addSerializedAcceptedTriggers:](a1, *(void **)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    *(_DWORD *)(a1 + 28) = *((_DWORD *)v4 + 7);
    *(_BYTE *)(a1 + 44) |= 4u;
  }
LABEL_23:

}

- (double)date
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)activity
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)serializedAcceptedTriggers
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)setSerializedAcceptedTriggers:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedAcceptedTriggers, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
