@implementation FCCAtypicalDayConfigurationProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)FCCAtypicalDayConfigurationProtobuf;
  -[FCCAtypicalDayConfigurationProtobuf dealloc](&v3, sel_dealloc);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setMinimumAheadPercentage:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_minimumAheadPercentage = a3;
}

- (void)setHasMinimumAheadPercentage:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumAheadPercentage
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMinimumBehindPercentage:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minimumBehindPercentage = a3;
}

- (void)setHasMinimumBehindPercentage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumBehindPercentage
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)FCCAtypicalDayConfigurationProtobuf;
  -[FCCAtypicalDayConfigurationProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCAtypicalDayConfigurationProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  FCCPercentageOfDayRuleProtobuf *percentageOfDayRule;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumAheadPercentage);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("minimumAheadPercentage"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumBehindPercentage);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("minimumBehindPercentage"));

  }
  percentageOfDayRule = self->_percentageOfDayRule;
  if (percentageOfDayRule)
  {
    -[FCCPercentageOfDayRuleProtobuf dictionaryRepresentation](percentageOfDayRule, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("percentageOfDayRule"));

  }
  PBRepeatedInt32NSArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("allowedGoalTypes"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCAtypicalDayConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_allowedGoalTypes;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
  if (self->_percentageOfDayRule)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  p_allowedGoalTypes = &self->_allowedGoalTypes;
  if (p_allowedGoalTypes->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v8;
      ++v7;
    }
    while (v7 < p_allowedGoalTypes->count);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v9;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_minimumAheadPercentage;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_minimumBehindPercentage;
    *((_BYTE *)v4 + 64) |= 2u;
  }
  if (self->_percentageOfDayRule)
    objc_msgSend(v9, "setPercentageOfDayRule:");
  if (-[FCCAtypicalDayConfigurationProtobuf allowedGoalTypesCount](self, "allowedGoalTypesCount"))
  {
    objc_msgSend(v9, "clearAllowedGoalTypes");
    v6 = -[FCCAtypicalDayConfigurationProtobuf allowedGoalTypesCount](self, "allowedGoalTypesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addAllowedGoalTypes:", -[FCCAtypicalDayConfigurationProtobuf allowedGoalTypesAtIndex:](self, "allowedGoalTypesAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_minimumAheadPercentage;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_minimumBehindPercentage;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v9 = -[FCCPercentageOfDayRuleProtobuf copyWithZone:](self->_percentageOfDayRule, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  FCCPercentageOfDayRuleProtobuf *percentageOfDayRule;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_minimumAheadPercentage != *((double *)v4 + 4))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_17:
    IsEqual = 0;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_minimumBehindPercentage != *((double *)v4 + 5))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_17;
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  if ((unint64_t)percentageOfDayRule | *((_QWORD *)v4 + 7)
    && !-[FCCPercentageOfDayRuleProtobuf isEqual:](percentageOfDayRule, "isEqual:"))
  {
    goto LABEL_17;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_18:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  unint64_t v5;
  double minimumAheadPercentage;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double minimumBehindPercentage;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;

  v3 = -[NSString hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    minimumAheadPercentage = self->_minimumAheadPercentage;
    v7 = -minimumAheadPercentage;
    if (minimumAheadPercentage >= 0.0)
      v7 = self->_minimumAheadPercentage;
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
  if ((has & 2) != 0)
  {
    minimumBehindPercentage = self->_minimumBehindPercentage;
    v12 = -minimumBehindPercentage;
    if (minimumBehindPercentage >= 0.0)
      v12 = self->_minimumBehindPercentage;
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
  v15 = v5 ^ v3 ^ v10 ^ -[FCCPercentageOfDayRuleProtobuf hash](self->_percentageOfDayRule, "hash");
  return v15 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  char v5;
  FCCPercentageOfDayRuleProtobuf *percentageOfDayRule;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  double *v11;

  v4 = (double *)a3;
  v11 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[FCCAtypicalDayConfigurationProtobuf setIdentifier:](self, "setIdentifier:");
    v4 = v11;
  }
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 1) != 0)
  {
    self->_minimumAheadPercentage = v4[4];
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 64);
  }
  if ((v5 & 2) != 0)
  {
    self->_minimumBehindPercentage = v4[5];
    *(_BYTE *)&self->_has |= 2u;
  }
  percentageOfDayRule = self->_percentageOfDayRule;
  v7 = *((_QWORD *)v4 + 7);
  if (percentageOfDayRule)
  {
    if (!v7)
      goto LABEL_13;
    -[FCCPercentageOfDayRuleProtobuf mergeFrom:](percentageOfDayRule, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[FCCAtypicalDayConfigurationProtobuf setPercentageOfDayRule:](self, "setPercentageOfDayRule:");
  }
  v4 = v11;
LABEL_13:
  v8 = objc_msgSend(v4, "allowedGoalTypesCount");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      -[FCCAtypicalDayConfigurationProtobuf addAllowedGoalTypes:](self, "addAllowedGoalTypes:", objc_msgSend(v11, "allowedGoalTypesAtIndex:", i));
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

- (double)minimumAheadPercentage
{
  return self->_minimumAheadPercentage;
}

- (double)minimumBehindPercentage
{
  return self->_minimumBehindPercentage;
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
}

@end
