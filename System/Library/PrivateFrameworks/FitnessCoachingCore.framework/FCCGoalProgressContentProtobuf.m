@implementation FCCGoalProgressContentProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)FCCGoalProgressContentProtobuf;
  -[FCCGoalProgressContentProtobuf dealloc](&v3, sel_dealloc);
}

- (BOOL)hasEventIdentifier
{
  return self->_eventIdentifier != 0;
}

- (unint64_t)goalTypesToDisplaysCount
{
  return self->_goalTypesToDisplays.count;
}

- (int)goalTypesToDisplays
{
  return self->_goalTypesToDisplays.list;
}

- (void)clearGoalTypesToDisplays
{
  PBRepeatedInt32Clear();
}

- (void)addGoalTypesToDisplay:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)goalTypesToDisplayAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_goalTypesToDisplays;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_goalTypesToDisplays = &self->_goalTypesToDisplays;
  count = self->_goalTypesToDisplays.count;
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
  return p_goalTypesToDisplays->list[a3];
}

- (void)setGoalTypesToDisplays:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setGoalTypeToHighlight:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_goalTypeToHighlight = a3;
}

- (void)setHasGoalTypeToHighlight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGoalTypeToHighlight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setExpectedGoalValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_expectedGoalValue = a3;
}

- (void)setHasExpectedGoalValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpectedGoalValue
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
  v8.super_class = (Class)FCCGoalProgressContentProtobuf;
  -[FCCGoalProgressContentProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCGoalProgressContentProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *eventIdentifier;
  void *v6;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  eventIdentifier = self->_eventIdentifier;
  if (eventIdentifier)
    objc_msgSend(v3, "setObject:forKey:", eventIdentifier, CFSTR("eventIdentifier"));
  PBRepeatedInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("goalTypesToDisplay"));

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_goalTypeToHighlight);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("goalTypeToHighlight"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expectedGoalValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("expectedGoalValue"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FCCGoalProgressContentProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char has;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_eventIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_goalTypesToDisplays.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_goalTypesToDisplays.count);
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char has;
  id v8;

  v8 = a3;
  if (self->_eventIdentifier)
    objc_msgSend(v8, "setEventIdentifier:");
  if (-[FCCGoalProgressContentProtobuf goalTypesToDisplaysCount](self, "goalTypesToDisplaysCount"))
  {
    objc_msgSend(v8, "clearGoalTypesToDisplays");
    v4 = -[FCCGoalProgressContentProtobuf goalTypesToDisplaysCount](self, "goalTypesToDisplaysCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addGoalTypesToDisplay:", -[FCCGoalProgressContentProtobuf goalTypesToDisplayAtIndex:](self, "goalTypesToDisplayAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v8 + 12) = self->_goalTypeToHighlight;
    *((_BYTE *)v8 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v8 + 4) = *(_QWORD *)&self->_expectedGoalValue;
    *((_BYTE *)v8 + 52) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_eventIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  PBRepeatedInt32Copy();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_goalTypeToHighlight;
    *(_BYTE *)(v5 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 32) = self->_expectedGoalValue;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *eventIdentifier;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  eventIdentifier = self->_eventIdentifier;
  if ((unint64_t)eventIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](eventIdentifier, "isEqual:"))
      goto LABEL_14;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_goalTypeToHighlight != *((_DWORD *)v4 + 12))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v6 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_expectedGoalValue != *((double *)v4 + 4))
      goto LABEL_14;
    v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  double expectedGoalValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_eventIdentifier, "hash");
  v4 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_goalTypeToHighlight;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  expectedGoalValue = self->_expectedGoalValue;
  v7 = -expectedGoalValue;
  if (expectedGoalValue >= 0.0)
    v7 = self->_expectedGoalValue;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4[5])
  {
    -[FCCGoalProgressContentProtobuf setEventIdentifier:](self, "setEventIdentifier:");
    v4 = v9;
  }
  v5 = objc_msgSend(v4, "goalTypesToDisplaysCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[FCCGoalProgressContentProtobuf addGoalTypesToDisplay:](self, "addGoalTypesToDisplay:", objc_msgSend(v9, "goalTypesToDisplayAtIndex:", i));
  }
  v8 = *((_BYTE *)v9 + 52);
  if ((v8 & 2) != 0)
  {
    self->_goalTypeToHighlight = *((_DWORD *)v9 + 12);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v9 + 52);
  }
  if ((v8 & 1) != 0)
  {
    self->_expectedGoalValue = *((double *)v9 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventIdentifier, a3);
}

- (int)goalTypeToHighlight
{
  return self->_goalTypeToHighlight;
}

- (double)expectedGoalValue
{
  return self->_expectedGoalValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
