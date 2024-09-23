@implementation _INPBCreateEventIntentResponse

- (void)setConfirmationReason:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_confirmationReason = a3;
  }
}

- (BOOL)hasConfirmationReason
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfirmationReason:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)confirmationReasonAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E2293910[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConfirmationReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCHEDULE_CONFLICT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEND_INVITATION_TO_PARTICIPANTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DATE_TIME_CLARIFICATION")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setConflictingEventIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *conflictingEventIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  conflictingEventIdentifiers = self->_conflictingEventIdentifiers;
  self->_conflictingEventIdentifiers = v4;

}

- (void)clearConflictingEventIdentifiers
{
  -[NSArray removeAllObjects](self->_conflictingEventIdentifiers, "removeAllObjects");
}

- (void)addConflictingEventIdentifiers:(id)a3
{
  id v4;
  NSArray *conflictingEventIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  conflictingEventIdentifiers = self->_conflictingEventIdentifiers;
  v8 = v4;
  if (!conflictingEventIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_conflictingEventIdentifiers;
    self->_conflictingEventIdentifiers = v6;

    v4 = v8;
    conflictingEventIdentifiers = self->_conflictingEventIdentifiers;
  }
  -[NSArray addObject:](conflictingEventIdentifiers, "addObject:", v4);

}

- (unint64_t)conflictingEventIdentifiersCount
{
  return -[NSArray count](self->_conflictingEventIdentifiers, "count");
}

- (id)conflictingEventIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_conflictingEventIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)setCreatedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_createdEvent, a3);
}

- (BOOL)hasCreatedEvent
{
  return self->_createdEvent != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateEventIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBCreateEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    PBDataWriterWriteInt32Field();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_conflictingEventIdentifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[_INPBCreateEventIntentResponse createdEvent](self, "createdEvent", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBCreateEventIntentResponse createdEvent](self, "createdEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBCreateEventIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCreateEventIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCreateEventIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCreateEventIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCreateEventIntentResponse initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBCreateEventIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCreateEventIntentResponse *v5;
  void *v6;
  id v7;

  v5 = -[_INPBCreateEventIntentResponse init](+[_INPBCreateEventIntentResponse allocWithZone:](_INPBCreateEventIntentResponse, "allocWithZone:"), "init");
  if (-[_INPBCreateEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    -[_INPBCreateEventIntentResponse setConfirmationReason:](v5, "setConfirmationReason:", -[_INPBCreateEventIntentResponse confirmationReason](self, "confirmationReason"));
  v6 = (void *)-[NSArray copyWithZone:](self->_conflictingEventIdentifiers, "copyWithZone:", a3);
  -[_INPBCreateEventIntentResponse setConflictingEventIdentifiers:](v5, "setConflictingEventIdentifiers:", v6);

  v7 = -[_INPBCalendarEvent copyWithZone:](self->_createdEvent, "copyWithZone:", a3);
  -[_INPBCreateEventIntentResponse setCreatedEvent:](v5, "setCreatedEvent:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int confirmationReason;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBCreateEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason");
  if (v5 != objc_msgSend(v4, "hasConfirmationReason"))
    goto LABEL_16;
  if (-[_INPBCreateEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
  {
    if (objc_msgSend(v4, "hasConfirmationReason"))
    {
      confirmationReason = self->_confirmationReason;
      if (confirmationReason != objc_msgSend(v4, "confirmationReason"))
        goto LABEL_16;
    }
  }
  -[_INPBCreateEventIntentResponse conflictingEventIdentifiers](self, "conflictingEventIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conflictingEventIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_15;
  -[_INPBCreateEventIntentResponse conflictingEventIdentifiers](self, "conflictingEventIdentifiers");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBCreateEventIntentResponse conflictingEventIdentifiers](self, "conflictingEventIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conflictingEventIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBCreateEventIntentResponse createdEvent](self, "createdEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createdEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBCreateEventIntentResponse createdEvent](self, "createdEvent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBCreateEventIntentResponse createdEvent](self, "createdEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createdEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if (-[_INPBCreateEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
    v3 = 2654435761 * self->_confirmationReason;
  else
    v3 = 0;
  v4 = -[NSArray hash](self->_conflictingEventIdentifiers, "hash") ^ v3;
  return v4 ^ -[_INPBCalendarEvent hash](self->_createdEvent, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBCreateEventIntentResponse hasConfirmationReason](self, "hasConfirmationReason"))
  {
    v4 = -[_INPBCreateEventIntentResponse confirmationReason](self, "confirmationReason");
    if ((v4 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2293910[(v4 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("confirmationReason"));

  }
  if (self->_conflictingEventIdentifiers)
  {
    -[_INPBCreateEventIntentResponse conflictingEventIdentifiers](self, "conflictingEventIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("conflictingEventIdentifiers"));

  }
  -[_INPBCreateEventIntentResponse createdEvent](self, "createdEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("createdEvent"));

  return v3;
}

- (int)confirmationReason
{
  return self->_confirmationReason;
}

- (NSArray)conflictingEventIdentifiers
{
  return self->_conflictingEventIdentifiers;
}

- (_INPBCalendarEvent)createdEvent
{
  return self->_createdEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdEvent, 0);
  objc_storeStrong((id *)&self->_conflictingEventIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
