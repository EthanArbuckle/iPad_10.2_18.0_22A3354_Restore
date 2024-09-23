@implementation AWDHomeKitEventTrigger

- (void)clearEvents
{
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)addEvents:(id)a3
{
  id v4;
  NSMutableArray *events;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  events = self->_events;
  v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_events;
    self->_events = v6;

    v4 = v8;
    events = self->_events;
  }
  -[NSMutableArray addObject:](events, "addObject:", v4);

}

- (unint64_t)eventsCount
{
  return -[NSMutableArray count](self->_events, "count");
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_events, "objectAtIndex:", a3);
}

- (void)setExecuteOnce:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_executeOnce = a3;
}

- (void)setHasExecuteOnce:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasExecuteOnce
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setContainsRecurrences:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_containsRecurrences = a3;
}

- (void)setHasContainsRecurrences:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasContainsRecurrences
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasPredicate
{
  return self->_predicate != 0;
}

- (int)activationState
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_activationState;
  else
    return 0;
}

- (void)setActivationState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activationState = a3;
}

- (void)setHasActivationState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivationState
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)activationStateAsString:(int)a3
{
  if (a3 < 5)
    return off_1E89B7350[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActivationState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationStateDisabled")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationStateDisabledNoHomeHub")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationStateDisabledNoCompatibleHomeHub")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationStateDisabledNoLocationServicesAuthorization")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationStateEnabled")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)activationType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_activationType;
  else
    return 0;
}

- (void)setActivationType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_activationType = a3;
}

- (void)setHasActivationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActivationType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)activationTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E89B7378[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsActivationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationTypeNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationTypeOnlyLocation")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationTypeAllButLocation")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivationTypeAll")))
  {
    v4 = 3;
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
  v8.super_class = (Class)AWDHomeKitEventTrigger;
  -[AWDHomeKitEventTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitEventTrigger dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char has;
  void *v12;
  void *v13;
  AWDHomeKitPredicate *predicate;
  void *v15;
  char v16;
  uint64_t activationState;
  __CFString *v18;
  uint64_t activationType;
  __CFString *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_events, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_events;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("events"));
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_executeOnce);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("executeOnce"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_containsRecurrences);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("containsRecurrences"));

  }
  predicate = self->_predicate;
  if (predicate)
  {
    -[AWDHomeKitPredicate dictionaryRepresentation](predicate, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("predicate"));

  }
  v16 = (char)self->_has;
  if ((v16 & 1) != 0)
  {
    activationState = self->_activationState;
    if (activationState >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activationState);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E89B7350[activationState];
    }
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("activationState"));

    v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0)
  {
    activationType = self->_activationType;
    if (activationType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_activationType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E89B7378[activationType];
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("activationType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitEventTriggerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_events;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_predicate)
    PBDataWriterWriteSubmessage();
  v11 = (char)self->_has;
  if ((v11 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  _BYTE *v9;
  char v10;
  _BYTE *v11;

  v11 = a3;
  if (-[AWDHomeKitEventTrigger eventsCount](self, "eventsCount"))
  {
    objc_msgSend(v11, "clearEvents");
    v4 = -[AWDHomeKitEventTrigger eventsCount](self, "eventsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[AWDHomeKitEventTrigger eventsAtIndex:](self, "eventsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addEvents:", v7);

      }
    }
  }
  has = (char)self->_has;
  v9 = v11;
  if ((has & 8) != 0)
  {
    v11[33] = self->_executeOnce;
    v11[36] |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11[32] = self->_containsRecurrences;
    v11[36] |= 4u;
  }
  if (self->_predicate)
  {
    objc_msgSend(v11, "setPredicate:");
    v9 = v11;
  }
  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    *((_DWORD *)v9 + 2) = self->_activationState;
    v9[36] |= 1u;
    v10 = (char)self->_has;
  }
  if ((v10 & 2) != 0)
  {
    *((_DWORD *)v9 + 3) = self->_activationType;
    v9[36] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  id v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_events;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addEvents:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 33) = self->_executeOnce;
    *(_BYTE *)(v5 + 36) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_containsRecurrences;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
  v13 = -[AWDHomeKitPredicate copyWithZone:](self->_predicate, "copyWithZone:", a3, (_QWORD)v17);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = (char)self->_has;
  if ((v15 & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_activationState;
    *(_BYTE *)(v5 + 36) |= 1u;
    v15 = (char)self->_has;
  }
  if ((v15 & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_activationType;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *events;
  char has;
  char v7;
  AWDHomeKitPredicate *predicate;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  events = self->_events;
  if ((unint64_t)events | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](events, "isEqual:"))
      goto LABEL_32;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 36);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
      goto LABEL_32;
    if (self->_executeOnce)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_32;
    if (self->_containsRecurrences)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_32;
  }
  predicate = self->_predicate;
  if (!((unint64_t)predicate | *((_QWORD *)v4 + 3)))
    goto LABEL_23;
  if (!-[AWDHomeKitPredicate isEqual:](predicate, "isEqual:"))
  {
LABEL_32:
    v9 = 0;
    goto LABEL_33;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 36);
LABEL_23:
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_activationState != *((_DWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_32;
  }
  v9 = (v7 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_activationType != *((_DWORD *)v4 + 3))
      goto LABEL_32;
    v9 = 1;
  }
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSMutableArray hash](self->_events, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = 2654435761 * self->_executeOnce;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_containsRecurrences;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[AWDHomeKitPredicate hash](self->_predicate, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = 2654435761 * self->_activationState;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_8:
  v8 = 2654435761 * self->_activationType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  AWDHomeKitPredicate *predicate;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[AWDHomeKitEventTrigger addEvents:](self, "addEvents:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 36);
  if ((v10 & 8) != 0)
  {
    self->_executeOnce = *((_BYTE *)v4 + 33);
    *(_BYTE *)&self->_has |= 8u;
    v10 = *((_BYTE *)v4 + 36);
  }
  if ((v10 & 4) != 0)
  {
    self->_containsRecurrences = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }
  predicate = self->_predicate;
  v12 = *((_QWORD *)v4 + 3);
  if (predicate)
  {
    if (v12)
      -[AWDHomeKitPredicate mergeFrom:](predicate, "mergeFrom:");
  }
  else if (v12)
  {
    -[AWDHomeKitEventTrigger setPredicate:](self, "setPredicate:");
  }
  v13 = *((_BYTE *)v4 + 36);
  if ((v13 & 1) != 0)
  {
    self->_activationState = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v13 = *((_BYTE *)v4 + 36);
  }
  if ((v13 & 2) != 0)
  {
    self->_activationType = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (BOOL)executeOnce
{
  return self->_executeOnce;
}

- (BOOL)containsRecurrences
{
  return self->_containsRecurrences;
}

- (AWDHomeKitPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

@end
