@implementation ATXPBDigestOnboardingLoggingEvent

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (int)entrySource
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_entrySource;
  else
    return 0;
}

- (void)setEntrySource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_entrySource = a3;
}

- (void)setHasEntrySource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEntrySource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)entrySourceAsString:(int)a3
{
  if (a3 < 3)
    return off_1E4D58D18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEntrySource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OnboardingSuggestion")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Settings")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Total")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)digestOnboardingOutcome
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_digestOnboardingOutcome;
  else
    return 0;
}

- (void)setDigestOnboardingOutcome:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_digestOnboardingOutcome = a3;
}

- (void)setHasDigestOnboardingOutcome:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDigestOnboardingOutcome
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)digestOnboardingOutcomeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4D58D30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDigestOnboardingOutcome:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Dismiss")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Defer")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Complete")) & 1) != 0)
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

- (int)finalUIShown
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_finalUIShown;
  else
    return 0;
}

- (void)setFinalUIShown:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_finalUIShown = a3;
}

- (void)setHasFinalUIShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFinalUIShown
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)finalUIShownAsString:(int)a3
{
  if (a3 < 4)
    return off_1E4D58D50[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFinalUIShown:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Introduction")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppPicker")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Scheduler")) & 1) != 0)
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

- (void)setTimeTaken:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeTaken = a3;
}

- (void)setHasTimeTaken:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeTaken
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDidSelectShowMore:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_didSelectShowMore = a3;
}

- (void)setHasDidSelectShowMore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDidSelectShowMore
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearDeliveryTimes
{
  -[NSMutableArray removeAllObjects](self->_deliveryTimes, "removeAllObjects");
}

- (void)addDeliveryTimes:(id)a3
{
  id v4;
  NSMutableArray *deliveryTimes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  deliveryTimes = self->_deliveryTimes;
  v8 = v4;
  if (!deliveryTimes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_deliveryTimes;
    self->_deliveryTimes = v6;

    v4 = v8;
    deliveryTimes = self->_deliveryTimes;
  }
  -[NSMutableArray addObject:](deliveryTimes, "addObject:", v4);

}

- (unint64_t)deliveryTimesCount
{
  return -[NSMutableArray count](self->_deliveryTimes, "count");
}

- (id)deliveryTimesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_deliveryTimes, "objectAtIndex:", a3);
}

+ (Class)deliveryTimesType
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
  v8.super_class = (Class)ATXPBDigestOnboardingLoggingEvent;
  -[ATXPBDigestOnboardingLoggingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBDigestOnboardingLoggingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionUUID;
  char has;
  uint64_t entrySource;
  __CFString *v8;
  uint64_t digestOnboardingOutcome;
  __CFString *v10;
  uint64_t finalUIShown;
  __CFString *v12;
  void *v13;
  void *v14;
  NSMutableArray *deliveryTimes;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    objc_msgSend(v3, "setObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    entrySource = self->_entrySource;
    if (entrySource >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_entrySource);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E4D58D18[entrySource];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("entrySource"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_19;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  digestOnboardingOutcome = self->_digestOnboardingOutcome;
  if (digestOnboardingOutcome >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_digestOnboardingOutcome);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E4D58D30[digestOnboardingOutcome];
  }
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("DigestOnboardingOutcome"));

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
LABEL_15:
    finalUIShown = self->_finalUIShown;
    if (finalUIShown >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_finalUIShown);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E4D58D50[finalUIShown];
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("finalUIShown"));

    has = (char)self->_has;
  }
LABEL_19:
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeTaken);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("timeTaken"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSelectShowMore);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("didSelectShowMore"));

  }
  deliveryTimes = self->_deliveryTimes;
  if (deliveryTimes)
    objc_msgSend(v4, "setObject:forKey:", deliveryTimes, CFSTR("deliveryTimes"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBDigestOnboardingLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sessionUUID)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_deliveryTimes;
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
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_sessionUUID)
  {
    objc_msgSend(v4, "setSessionUUID:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_entrySource;
    *((_BYTE *)v4 + 52) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = self->_digestOnboardingOutcome;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_7;
LABEL_17:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timeTaken;
    *((_BYTE *)v4 + 52) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_16:
  *((_DWORD *)v4 + 8) = self->_finalUIShown;
  *((_BYTE *)v4 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_7:
  if ((has & 0x10) != 0)
  {
LABEL_8:
    *((_BYTE *)v4 + 48) = self->_didSelectShowMore;
    *((_BYTE *)v4 + 52) |= 0x10u;
  }
LABEL_9:
  if (-[ATXPBDigestOnboardingLoggingEvent deliveryTimesCount](self, "deliveryTimesCount"))
  {
    objc_msgSend(v10, "clearDeliveryTimes");
    v6 = -[ATXPBDigestOnboardingLoggingEvent deliveryTimesCount](self, "deliveryTimesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[ATXPBDigestOnboardingLoggingEvent deliveryTimesAtIndex:](self, "deliveryTimesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addDeliveryTimes:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_entrySource;
    *(_BYTE *)(v5 + 52) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_digestOnboardingOutcome;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 32) = self->_finalUIShown;
  *(_BYTE *)(v5 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  *(double *)(v5 + 8) = self->_timeTaken;
  *(_BYTE *)(v5 + 52) |= 1u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 48) = self->_didSelectShowMore;
    *(_BYTE *)(v5 + 52) |= 0x10u;
  }
LABEL_7:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_deliveryTimes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v5, "addDeliveryTimes:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sessionUUID;
  char v6;
  NSMutableArray *deliveryTimes;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_entrySource != *((_DWORD *)v4 + 7))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_digestOnboardingOutcome != *((_DWORD *)v4 + 6))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_finalUIShown != *((_DWORD *)v4 + 8))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_timeTaken != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
      goto LABEL_34;
LABEL_28:
    v6 = 0;
    goto LABEL_29;
  }
  if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
    goto LABEL_28;
  if (!self->_didSelectShowMore)
  {
    if (!*((_BYTE *)v4 + 48))
      goto LABEL_34;
    goto LABEL_28;
  }
  if (!*((_BYTE *)v4 + 48))
    goto LABEL_28;
LABEL_34:
  deliveryTimes = self->_deliveryTimes;
  if ((unint64_t)deliveryTimes | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](deliveryTimes, "isEqual:");
  else
    v6 = 1;
LABEL_29:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double timeTaken;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;

  v3 = -[NSString hash](self->_sessionUUID, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = 2654435761 * self->_entrySource;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_digestOnboardingOutcome;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_12:
      v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_4:
  v7 = 2654435761 * self->_finalUIShown;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_5:
  timeTaken = self->_timeTaken;
  v9 = -timeTaken;
  if (timeTaken >= 0.0)
    v9 = self->_timeTaken;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_15:
  if ((has & 0x10) != 0)
    v13 = 2654435761 * self->_didSelectShowMore;
  else
    v13 = 0;
  return v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ -[NSMutableArray hash](self->_deliveryTimes, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
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
  if (*((_QWORD *)v4 + 5))
    -[ATXPBDigestOnboardingLoggingEvent setSessionUUID:](self, "setSessionUUID:");
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_entrySource = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_digestOnboardingOutcome = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_finalUIShown = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_20:
  self->_timeTaken = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
LABEL_8:
    self->_didSelectShowMore = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_9:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[ATXPBDigestOnboardingLoggingEvent addDeliveryTimes:](self, "addDeliveryTimes:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (BOOL)didSelectShowMore
{
  return self->_didSelectShowMore;
}

- (NSMutableArray)deliveryTimes
{
  return self->_deliveryTimes;
}

- (void)setDeliveryTimes:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryTimes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_deliveryTimes, 0);
}

@end
