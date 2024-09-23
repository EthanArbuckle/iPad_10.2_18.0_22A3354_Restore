@implementation FCCGoalCompletionProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)FCCGoalCompletionProtobuf;
  -[FCCGoalCompletionProtobuf dealloc](&v3, sel_dealloc);
}

- (void)setActivitySummaryIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activitySummaryIndex = a3;
}

- (void)setHasActivitySummaryIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivitySummaryIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (unint64_t)completedGoalTypesCount
{
  return self->_completedGoalTypes.count;
}

- (int)completedGoalTypes
{
  return self->_completedGoalTypes.list;
}

- (void)clearCompletedGoalTypes
{
  PBRepeatedInt32Clear();
}

- (void)addCompletedGoalTypes:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)completedGoalTypesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_completedGoalTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_completedGoalTypes = &self->_completedGoalTypes;
  count = self->_completedGoalTypes.count;
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
  return p_completedGoalTypes->list[a3];
}

- (void)setCompletedGoalTypes:(int *)a3 count:(unint64_t)a4
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
  v8.super_class = (Class)FCCGoalCompletionProtobuf;
  -[FCCGoalCompletionProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCGoalCompletionProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_activitySummaryIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("activitySummaryIndex"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  PBRepeatedInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("completedGoalTypes"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCGoalCompletionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_completedGoalTypes;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  p_completedGoalTypes = &self->_completedGoalTypes;
  if (p_completedGoalTypes->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < p_completedGoalTypes->count);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_activitySummaryIndex;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v8 = v4;
  if (self->_identifier)
    objc_msgSend(v4, "setIdentifier:");
  if (-[FCCGoalCompletionProtobuf completedGoalTypesCount](self, "completedGoalTypesCount"))
  {
    objc_msgSend(v8, "clearCompletedGoalTypes");
    v5 = -[FCCGoalCompletionProtobuf completedGoalTypesCount](self, "completedGoalTypesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addCompletedGoalTypes:", -[FCCGoalCompletionProtobuf completedGoalTypesAtIndex:](self, "completedGoalTypesAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_activitySummaryIndex;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  PBRepeatedInt32Copy();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_activitySummaryIndex != *((_QWORD *)v4 + 4))
      goto LABEL_10;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_10:
    IsEqual = 0;
    goto LABEL_11;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](identifier, "isEqual:"))
    goto LABEL_10;
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_11:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  NSUInteger v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_activitySummaryIndex;
  else
    v2 = 0;
  v3 = -[NSString hash](self->_identifier, "hash");
  return v3 ^ v2 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_activitySummaryIndex = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = v4;
  if (v4[5])
  {
    -[FCCGoalCompletionProtobuf setIdentifier:](self, "setIdentifier:");
    v4 = v8;
  }
  v5 = objc_msgSend(v4, "completedGoalTypesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[FCCGoalCompletionProtobuf addCompletedGoalTypes:](self, "addCompletedGoalTypes:", objc_msgSend(v8, "completedGoalTypesAtIndex:", i));
  }

}

- (int64_t)activitySummaryIndex
{
  return self->_activitySummaryIndex;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
