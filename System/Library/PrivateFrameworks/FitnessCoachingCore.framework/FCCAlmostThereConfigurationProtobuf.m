@implementation FCCAlmostThereConfigurationProtobuf

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setMinimumPercentageComplete:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minimumPercentageComplete = a3;
}

- (void)setHasMinimumPercentageComplete:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumPercentageComplete
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setGoalBufferPercentage:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_goalBufferPercentage = a3;
}

- (void)setHasGoalBufferPercentage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGoalBufferPercentage
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearCoalescingRules
{
  -[NSMutableArray removeAllObjects](self->_coalescingRules, "removeAllObjects");
}

- (void)addCoalescingRules:(id)a3
{
  id v4;
  NSMutableArray *coalescingRules;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  coalescingRules = self->_coalescingRules;
  v8 = v4;
  if (!coalescingRules)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_coalescingRules;
    self->_coalescingRules = v6;

    v4 = v8;
    coalescingRules = self->_coalescingRules;
  }
  -[NSMutableArray addObject:](coalescingRules, "addObject:", v4);

}

- (unint64_t)coalescingRulesCount
{
  return -[NSMutableArray count](self->_coalescingRules, "count");
}

- (id)coalescingRulesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_coalescingRules, "objectAtIndex:", a3);
}

+ (Class)coalescingRulesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTimeOfDayRule
{
  return self->_timeOfDayRule != 0;
}

- (void)setGoalType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_goalType = a3;
}

- (void)setHasGoalType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGoalType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)FCCAlmostThereConfigurationProtobuf;
  -[FCCAlmostThereConfigurationProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCAlmostThereConfigurationProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  char has;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  FCCTimeOfDayRuleProtobuf *timeOfDayRule;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumPercentageComplete);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("minimumPercentageComplete"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_goalBufferPercentage);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("goalBufferPercentage"));

  }
  if (-[NSMutableArray count](self->_coalescingRules, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_coalescingRules, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = self->_coalescingRules;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("coalescingRules"));
  }
  timeOfDayRule = self->_timeOfDayRule;
  if (timeOfDayRule)
  {
    -[FCCTimeOfDayRuleProtobuf dictionaryRepresentation](timeOfDayRule, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("timeOfDayRule"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_goalType);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("goalType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCAlmostThereConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_identifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_coalescingRules;
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

  if (self->_timeOfDayRule)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();

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
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_minimumPercentageComplete;
    *((_BYTE *)v4 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_goalBufferPercentage;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (-[FCCAlmostThereConfigurationProtobuf coalescingRulesCount](self, "coalescingRulesCount"))
  {
    objc_msgSend(v10, "clearCoalescingRules");
    v6 = -[FCCAlmostThereConfigurationProtobuf coalescingRulesCount](self, "coalescingRulesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[FCCAlmostThereConfigurationProtobuf coalescingRulesAtIndex:](self, "coalescingRulesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addCoalescingRules:", v9);

      }
    }
  }
  if (self->_timeOfDayRule)
    objc_msgSend(v10, "setTimeOfDayRule:");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_goalType;
    *((_BYTE *)v10 + 56) |= 4u;
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
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_minimumPercentageComplete;
    *(_BYTE *)(v5 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_goalBufferPercentage;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_coalescingRules;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addCoalescingRules:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15 = -[FCCTimeOfDayRuleProtobuf copyWithZone:](self->_timeOfDayRule, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_goalType;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSMutableArray *coalescingRules;
  FCCTimeOfDayRuleProtobuf *timeOfDayRule;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_minimumPercentageComplete != *((double *)v4 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_22:
    v8 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_goalBufferPercentage != *((double *)v4 + 1))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_22;
  }
  coalescingRules = self->_coalescingRules;
  if ((unint64_t)coalescingRules | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](coalescingRules, "isEqual:"))
  {
    goto LABEL_22;
  }
  timeOfDayRule = self->_timeOfDayRule;
  if ((unint64_t)timeOfDayRule | *((_QWORD *)v4 + 6))
  {
    if (!-[FCCTimeOfDayRuleProtobuf isEqual:](timeOfDayRule, "isEqual:"))
      goto LABEL_22;
  }
  v8 = (*((_BYTE *)v4 + 56) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_goalType != *((_DWORD *)v4 + 8))
      goto LABEL_22;
    v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double minimumPercentageComplete;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double goalBufferPercentage;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v3 = -[NSString hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    minimumPercentageComplete = self->_minimumPercentageComplete;
    v7 = -minimumPercentageComplete;
    if (minimumPercentageComplete >= 0.0)
      v7 = self->_minimumPercentageComplete;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 1) != 0)
  {
    goalBufferPercentage = self->_goalBufferPercentage;
    v12 = -goalBufferPercentage;
    if (goalBufferPercentage >= 0.0)
      v12 = self->_goalBufferPercentage;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = -[NSMutableArray hash](self->_coalescingRules, "hash");
  v16 = -[FCCTimeOfDayRuleProtobuf hash](self->_timeOfDayRule, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v17 = 2654435761 * self->_goalType;
  else
    v17 = 0;
  return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ v17;
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
  FCCTimeOfDayRuleProtobuf *timeOfDayRule;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[FCCAlmostThereConfigurationProtobuf setIdentifier:](self, "setIdentifier:");
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_minimumPercentageComplete = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 1) != 0)
  {
    self->_goalBufferPercentage = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *((id *)v4 + 3);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[FCCAlmostThereConfigurationProtobuf addCoalescingRules:](self, "addCoalescingRules:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  timeOfDayRule = self->_timeOfDayRule;
  v12 = *((_QWORD *)v4 + 6);
  if (timeOfDayRule)
  {
    if (v12)
      -[FCCTimeOfDayRuleProtobuf mergeFrom:](timeOfDayRule, "mergeFrom:");
  }
  else if (v12)
  {
    -[FCCAlmostThereConfigurationProtobuf setTimeOfDayRule:](self, "setTimeOfDayRule:");
  }
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    self->_goalType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)minimumPercentageComplete
{
  return self->_minimumPercentageComplete;
}

- (double)goalBufferPercentage
{
  return self->_goalBufferPercentage;
}

- (NSMutableArray)coalescingRules
{
  return self->_coalescingRules;
}

- (void)setCoalescingRules:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingRules, a3);
}

- (FCCTimeOfDayRuleProtobuf)timeOfDayRule
{
  return self->_timeOfDayRule;
}

- (void)setTimeOfDayRule:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfDayRule, a3);
}

- (int)goalType
{
  return self->_goalType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfDayRule, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_coalescingRules, 0);
}

@end
