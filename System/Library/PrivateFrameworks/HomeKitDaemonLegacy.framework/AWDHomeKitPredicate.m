@implementation AWDHomeKitPredicate

- (void)clearPresenceEvents
{
  -[NSMutableArray removeAllObjects](self->_presenceEvents, "removeAllObjects");
}

- (void)addPresenceEvents:(id)a3
{
  id v4;
  NSMutableArray *presenceEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  presenceEvents = self->_presenceEvents;
  v8 = v4;
  if (!presenceEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_presenceEvents;
    self->_presenceEvents = v6;

    v4 = v8;
    presenceEvents = self->_presenceEvents;
  }
  -[NSMutableArray addObject:](presenceEvents, "addObject:", v4);

}

- (unint64_t)presenceEventsCount
{
  return -[NSMutableArray count](self->_presenceEvents, "count");
}

- (id)presenceEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_presenceEvents, "objectAtIndex:", a3);
}

- (void)setContainsCharacteristicValue:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_containsCharacteristicValue = a3;
}

- (void)setHasContainsCharacteristicValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContainsCharacteristicValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setContainsSignificantTime:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_containsSignificantTime = a3;
}

- (void)setHasContainsSignificantTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasContainsSignificantTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setContainsSignificantTimeOffset:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_containsSignificantTimeOffset = a3;
}

- (void)setHasContainsSignificantTimeOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasContainsSignificantTimeOffset
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setContainsCalendarTime:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_containsCalendarTime = a3;
}

- (void)setHasContainsCalendarTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainsCalendarTime
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
  v8.super_class = (Class)AWDHomeKitPredicate;
  -[AWDHomeKitPredicate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitPredicate dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_presenceEvents, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_presenceEvents, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_presenceEvents;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("presenceEvents"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_containsCharacteristicValue);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("containsCharacteristicValue"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_13;
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_containsSignificantTimeOffset, (_QWORD)v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("containsSignificantTimeOffset"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_containsSignificantTime, (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("containsSignificantTime"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_18;
LABEL_13:
  if ((has & 1) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_containsCalendarTime, (_QWORD)v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("containsCalendarTime"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitPredicateReadFrom(self, (uint64_t)a3);
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_presenceEvents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
LABEL_16:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((has & 1) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField();
LABEL_13:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char has;
  _BYTE *v9;

  v9 = a3;
  if (-[AWDHomeKitPredicate presenceEventsCount](self, "presenceEventsCount"))
  {
    objc_msgSend(v9, "clearPresenceEvents");
    v4 = -[AWDHomeKitPredicate presenceEventsCount](self, "presenceEventsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[AWDHomeKitPredicate presenceEventsAtIndex:](self, "presenceEventsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addPresenceEvents:", v7);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9[17] = self->_containsCharacteristicValue;
    v9[20] |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_8;
LABEL_13:
      v9[19] = self->_containsSignificantTimeOffset;
      v9[20] |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v9[18] = self->_containsSignificantTime;
  v9[20] |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 1) != 0)
  {
LABEL_9:
    v9[16] = self->_containsCalendarTime;
    v9[20] |= 1u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_presenceEvents;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v5, "addPresenceEvents:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[17] = self->_containsCharacteristicValue;
    v5[20] |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
LABEL_16:
      v5[19] = self->_containsSignificantTimeOffset;
      v5[20] |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v5;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  v5[18] = self->_containsSignificantTime;
  v5[20] |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((has & 1) != 0)
  {
LABEL_12:
    v5[16] = self->_containsCalendarTime;
    v5[20] |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *presenceEvents;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  presenceEvents = self->_presenceEvents;
  if ((unint64_t)presenceEvents | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](presenceEvents, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_30;
    if (self->_containsCharacteristicValue)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_30;
    if (self->_containsSignificantTime)
    {
      if (!*((_BYTE *)v4 + 18))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 18))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 8) == 0)
      goto LABEL_30;
    if (self->_containsSignificantTimeOffset)
    {
      if (!*((_BYTE *)v4 + 19))
        goto LABEL_30;
    }
    else if (*((_BYTE *)v4 + 19))
    {
      goto LABEL_30;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) != 0)
  {
    goto LABEL_30;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_containsCalendarTime)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_30;
      }
      else if (*((_BYTE *)v4 + 16))
      {
        goto LABEL_30;
      }
      v6 = 1;
      goto LABEL_31;
    }
LABEL_30:
    v6 = 0;
  }
LABEL_31:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSMutableArray hash](self->_presenceEvents, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_containsCharacteristicValue;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_containsSignificantTime;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_containsSignificantTimeOffset;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_containsCalendarTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[AWDHomeKitPredicate addPresenceEvents:](self, "addPresenceEvents:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 20);
  if ((v10 & 2) != 0)
  {
    self->_containsCharacteristicValue = *((_BYTE *)v4 + 17);
    *(_BYTE *)&self->_has |= 2u;
    v10 = *((_BYTE *)v4 + 20);
    if ((v10 & 4) == 0)
    {
LABEL_10:
      if ((v10 & 8) == 0)
        goto LABEL_11;
LABEL_16:
      self->_containsSignificantTimeOffset = *((_BYTE *)v4 + 19);
      *(_BYTE *)&self->_has |= 8u;
      if ((*((_BYTE *)v4 + 20) & 1) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 4) == 0)
  {
    goto LABEL_10;
  }
  self->_containsSignificantTime = *((_BYTE *)v4 + 18);
  *(_BYTE *)&self->_has |= 4u;
  v10 = *((_BYTE *)v4 + 20);
  if ((v10 & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((v10 & 1) != 0)
  {
LABEL_12:
    self->_containsCalendarTime = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_13:

}

- (NSMutableArray)presenceEvents
{
  return self->_presenceEvents;
}

- (void)setPresenceEvents:(id)a3
{
  objc_storeStrong((id *)&self->_presenceEvents, a3);
}

- (BOOL)containsCharacteristicValue
{
  return self->_containsCharacteristicValue;
}

- (BOOL)containsSignificantTime
{
  return self->_containsSignificantTime;
}

- (BOOL)containsSignificantTimeOffset
{
  return self->_containsSignificantTimeOffset;
}

- (BOOL)containsCalendarTime
{
  return self->_containsCalendarTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenceEvents, 0);
}

+ (Class)presenceEventsType
{
  return (Class)objc_opt_class();
}

@end
