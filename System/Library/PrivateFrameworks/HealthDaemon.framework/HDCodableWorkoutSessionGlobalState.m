@implementation HDCodableWorkoutSessionGlobalState

- (void)setSessionState:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sessionState = a3;
}

- (void)setHasSessionState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSessionStateChangeDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sessionStateChangeDate = a3;
}

- (void)setHasSessionStateChangeDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionStateChangeDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSessionStateEvent:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_sessionStateEvent = a3;
}

- (void)setHasSessionStateEvent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSessionStateEvent
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSessionStateEventDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sessionStateEventDate = a3;
}

- (void)setHasSessionStateEventDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSessionStateEventDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCurrentActivity
{
  return self->_currentActivity != 0;
}

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

+ (Class)eventsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HDCodableWorkoutSessionGlobalState;
  -[HDCodableWorkoutSessionGlobalState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionGlobalState dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HDCodableWorkoutActivity *currentActivity;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sessionState);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("sessionState"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sessionStateChangeDate);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("sessionStateChangeDate"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sessionStateEvent);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("sessionStateEvent"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sessionStateEventDate);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("sessionStateEventDate"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("startDate"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("endDate"));

  }
LABEL_8:
  currentActivity = self->_currentActivity;
  if (currentActivity)
  {
    -[HDCodableWorkoutActivity dictionaryRepresentation](currentActivity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("currentActivity"));

  }
  if (-[NSMutableArray count](self->_events, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_events;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("events"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutSessionGlobalStateReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_currentActivity)
    PBDataWriterWriteSubmessage();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_events;
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
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_sessionState;
    *((_BYTE *)v4 + 72) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = *(_QWORD *)&self->_sessionStateChangeDate;
  *((_BYTE *)v4 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  v4[4] = self->_sessionStateEvent;
  *((_BYTE *)v4 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  v4[5] = *(_QWORD *)&self->_sessionStateEventDate;
  *((_BYTE *)v4 + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  v4[6] = *(_QWORD *)&self->_startDate;
  *((_BYTE *)v4 + 72) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    v4[1] = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 72) |= 1u;
  }
LABEL_8:
  v10 = v4;
  if (self->_currentActivity)
    objc_msgSend(v4, "setCurrentActivity:");
  if (-[HDCodableWorkoutSessionGlobalState eventsCount](self, "eventsCount"))
  {
    objc_msgSend(v10, "clearEvents");
    v6 = -[HDCodableWorkoutSessionGlobalState eventsCount](self, "eventsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableWorkoutSessionGlobalState eventsAtIndex:](self, "eventsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addEvents:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
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
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_sessionState;
    *(_BYTE *)(v5 + 72) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_sessionStateChangeDate;
  *(_BYTE *)(v5 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  *(_QWORD *)(v5 + 32) = self->_sessionStateEvent;
  *(_BYTE *)(v5 + 72) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 40) = self->_sessionStateEventDate;
  *(_BYTE *)(v5 + 72) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  *(double *)(v5 + 48) = self->_startDate;
  *(_BYTE *)(v5 + 72) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    *(double *)(v5 + 8) = self->_endDate;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
LABEL_8:
  v8 = -[HDCodableWorkoutActivity copyWithZone:](self->_currentActivity, "copyWithZone:", a3);
  v9 = (void *)v6[7];
  v6[7] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_events;
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
        objc_msgSend(v6, "addEvents:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableWorkoutActivity *currentActivity;
  NSMutableArray *events;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_sessionState != *((_QWORD *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
LABEL_36:
    v7 = 0;
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_sessionStateChangeDate != *((double *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_sessionStateEvent != *((_QWORD *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x10) == 0 || self->_sessionStateEventDate != *((double *)v4 + 5))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 0x20) == 0 || self->_startDate != *((double *)v4 + 6))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 72) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_endDate != *((double *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_36;
  }
  currentActivity = self->_currentActivity;
  if ((unint64_t)currentActivity | *((_QWORD *)v4 + 7)
    && !-[HDCodableWorkoutActivity isEqual:](currentActivity, "isEqual:"))
  {
    goto LABEL_36;
  }
  events = self->_events;
  if ((unint64_t)events | *((_QWORD *)v4 + 8))
    v7 = -[NSMutableArray isEqual:](events, "isEqual:");
  else
    v7 = 1;
LABEL_37:

  return v7;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double sessionStateChangeDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  double sessionStateEventDate;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double startDate;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  double endDate;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4 = 2654435761 * self->_sessionState;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_3:
  sessionStateChangeDate = self->_sessionStateChangeDate;
  v6 = -sessionStateChangeDate;
  if (sessionStateChangeDate >= 0.0)
    v6 = self->_sessionStateChangeDate;
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
  if ((has & 8) != 0)
  {
    v10 = 2654435761 * self->_sessionStateEvent;
    if ((has & 0x10) != 0)
      goto LABEL_13;
LABEL_18:
    v15 = 0;
    goto LABEL_21;
  }
  v10 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_18;
LABEL_13:
  sessionStateEventDate = self->_sessionStateEventDate;
  v12 = -sessionStateEventDate;
  if (sessionStateEventDate >= 0.0)
    v12 = self->_sessionStateEventDate;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_21:
  if ((has & 0x20) != 0)
  {
    startDate = self->_startDate;
    v18 = -startDate;
    if (startDate >= 0.0)
      v18 = self->_startDate;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  if ((has & 1) != 0)
  {
    endDate = self->_endDate;
    v23 = -endDate;
    if (endDate >= 0.0)
      v23 = self->_endDate;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  v26 = v9 ^ v4 ^ v10 ^ v15 ^ v16 ^ v21 ^ -[HDCodableWorkoutActivity hash](self->_currentActivity, "hash");
  return v26 ^ -[NSMutableArray hash](self->_events, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  HDCodableWorkoutActivity *currentActivity;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 2) != 0)
  {
    self->_sessionState = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 72);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionStateChangeDate = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_sessionStateEvent = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 0x10) == 0)
  {
LABEL_5:
    if ((v6 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_sessionStateEventDate = *((double *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v6 = *((_BYTE *)v4 + 72);
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  self->_startDate = *((double *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_7:
    self->_endDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_8:
  currentActivity = self->_currentActivity;
  v8 = *((_QWORD *)v5 + 7);
  if (currentActivity)
  {
    if (v8)
      -[HDCodableWorkoutActivity mergeFrom:](currentActivity, "mergeFrom:");
  }
  else if (v8)
  {
    -[HDCodableWorkoutSessionGlobalState setCurrentActivity:](self, "setCurrentActivity:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v5 + 8);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[HDCodableWorkoutSessionGlobalState addEvents:](self, "addEvents:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (double)sessionStateChangeDate
{
  return self->_sessionStateChangeDate;
}

- (int64_t)sessionStateEvent
{
  return self->_sessionStateEvent;
}

- (double)sessionStateEventDate
{
  return self->_sessionStateEventDate;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HDCodableWorkoutActivity)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivity, a3);
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
}

@end
