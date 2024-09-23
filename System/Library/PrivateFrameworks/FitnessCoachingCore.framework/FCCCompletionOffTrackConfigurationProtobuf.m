@implementation FCCCompletionOffTrackConfigurationProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)FCCCompletionOffTrackConfigurationProtobuf;
  -[FCCCompletionOffTrackConfigurationProtobuf dealloc](&v3, sel_dealloc);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
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

- (BOOL)hasPercentageOfDayRule
{
  return self->_percentageOfDayRule != 0;
}

- (unint64_t)allowedGoalTypesCount
{
  return self->_allowedGoalTypes.count;
}

- (int)allowedGoalTypes
{
  return self->_allowedGoalTypes.list;
}

- (void)clearAllowedGoalTypes
{
  PBRepeatedInt32Clear();
}

- (void)addAllowedGoalTypes:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)allowedGoalTypesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_allowedGoalTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_allowedGoalTypes = &self->_allowedGoalTypes;
  count = self->_allowedGoalTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_allowedGoalTypes->list[a3];
}

- (void)setAllowedGoalTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
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
  v8.super_class = (Class)FCCCompletionOffTrackConfigurationProtobuf;
  -[FCCCompletionOffTrackConfigurationProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCCompletionOffTrackConfigurationProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  FCCPercentageOfDayRuleProtobuf *percentageOfDayRule;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_goalBufferPercentage);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("goalBufferPercentage"));

  }
  if (-[NSMutableArray count](self->_coalescingRules, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_coalescingRules, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = self->_coalescingRules;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("coalescingRules"));
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  if (percentageOfDayRule)
  {
    -[FCCPercentageOfDayRuleProtobuf dictionaryRepresentation](percentageOfDayRule, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("percentageOfDayRule"));

  }
  PBRepeatedInt32NSArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("allowedGoalTypes"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCCompletionOffTrackConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_allowedGoalTypes;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_coalescingRules;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (self->_percentageOfDayRule)
    PBDataWriterWriteSubmessage();
  p_allowedGoalTypes = &self->_allowedGoalTypes;
  if (p_allowedGoalTypes->count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < p_allowedGoalTypes->count);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  id v12;

  v4 = a3;
  v12 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v12;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_goalBufferPercentage;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (-[FCCCompletionOffTrackConfigurationProtobuf coalescingRulesCount](self, "coalescingRulesCount"))
  {
    objc_msgSend(v12, "clearCoalescingRules");
    v5 = -[FCCCompletionOffTrackConfigurationProtobuf coalescingRulesCount](self, "coalescingRulesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[FCCCompletionOffTrackConfigurationProtobuf coalescingRulesAtIndex:](self, "coalescingRulesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addCoalescingRules:", v8);

      }
    }
  }
  if (self->_percentageOfDayRule)
    objc_msgSend(v12, "setPercentageOfDayRule:");
  if (-[FCCCompletionOffTrackConfigurationProtobuf allowedGoalTypesCount](self, "allowedGoalTypesCount"))
  {
    objc_msgSend(v12, "clearAllowedGoalTypes");
    v9 = -[FCCCompletionOffTrackConfigurationProtobuf allowedGoalTypesCount](self, "allowedGoalTypesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addAllowedGoalTypes:", -[FCCCompletionOffTrackConfigurationProtobuf allowedGoalTypesAtIndex:](self, "allowedGoalTypesAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_goalBufferPercentage;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_coalescingRules;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addCoalescingRules:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v14 = -[FCCPercentageOfDayRuleProtobuf copyWithZone:](self->_percentageOfDayRule, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSMutableArray *coalescingRules;
  FCCPercentageOfDayRuleProtobuf *percentageOfDayRule;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_goalBufferPercentage != *((double *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_14:
    IsEqual = 0;
    goto LABEL_15;
  }
  coalescingRules = self->_coalescingRules;
  if ((unint64_t)coalescingRules | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](coalescingRules, "isEqual:"))
  {
    goto LABEL_14;
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  if ((unint64_t)percentageOfDayRule | *((_QWORD *)v4 + 7))
  {
    if (!-[FCCPercentageOfDayRuleProtobuf isEqual:](percentageOfDayRule, "isEqual:"))
      goto LABEL_14;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_15:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double goalBufferPercentage;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    goalBufferPercentage = self->_goalBufferPercentage;
    v6 = -goalBufferPercentage;
    if (goalBufferPercentage >= 0.0)
      v6 = self->_goalBufferPercentage;
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
  v9 = v4 ^ v3;
  v10 = -[NSMutableArray hash](self->_coalescingRules, "hash");
  v11 = v9 ^ v10 ^ -[FCCPercentageOfDayRuleProtobuf hash](self->_percentageOfDayRule, "hash");
  return v11 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  FCCPercentageOfDayRuleProtobuf *percentageOfDayRule;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 6))
    -[FCCCompletionOffTrackConfigurationProtobuf setIdentifier:](self, "setIdentifier:");
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_goalBufferPercentage = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[FCCCompletionOffTrackConfigurationProtobuf addCoalescingRules:](self, "addCoalescingRules:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  percentageOfDayRule = self->_percentageOfDayRule;
  v11 = *((_QWORD *)v4 + 7);
  if (percentageOfDayRule)
  {
    if (v11)
      -[FCCPercentageOfDayRuleProtobuf mergeFrom:](percentageOfDayRule, "mergeFrom:");
  }
  else if (v11)
  {
    -[FCCCompletionOffTrackConfigurationProtobuf setPercentageOfDayRule:](self, "setPercentageOfDayRule:");
  }
  v12 = objc_msgSend(v4, "allowedGoalTypesCount", (_QWORD)v15);
  if (v12)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
      -[FCCCompletionOffTrackConfigurationProtobuf addAllowedGoalTypes:](self, "addAllowedGoalTypes:", objc_msgSend(v4, "allowedGoalTypesAtIndex:", j));
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

- (FCCPercentageOfDayRuleProtobuf)percentageOfDayRule
{
  return self->_percentageOfDayRule;
}

- (void)setPercentageOfDayRule:(id)a3
{
  objc_storeStrong((id *)&self->_percentageOfDayRule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageOfDayRule, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_coalescingRules, 0);
}

@end
