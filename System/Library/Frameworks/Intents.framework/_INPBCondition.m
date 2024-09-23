@implementation _INPBCondition

- (void)setConditionalOperator:(int)a3
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
    self->_conditionalOperator = a3;
  }
}

- (BOOL)hasConditionalOperator
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConditionalOperator:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)conditionalOperatorAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E228F990[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConditionalOperator:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_ALL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBConditionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBCondition hasConditionalOperator](self, "hasConditionalOperator"))
    PBDataWriterWriteInt32Field();

}

- (_INPBCondition)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCondition *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCondition *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCondition *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCondition initWithData:](self, "initWithData:", v6);

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
  -[_INPBCondition data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCondition *v4;

  v4 = -[_INPBCondition init](+[_INPBCondition allocWithZone:](_INPBCondition, "allocWithZone:", a3), "init");
  if (-[_INPBCondition hasConditionalOperator](self, "hasConditionalOperator"))
    -[_INPBCondition setConditionalOperator:](v4, "setConditionalOperator:", -[_INPBCondition conditionalOperator](self, "conditionalOperator"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int conditionalOperator;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBCondition hasConditionalOperator](self, "hasConditionalOperator");
    if (v5 == objc_msgSend(v4, "hasConditionalOperator"))
    {
      if (!-[_INPBCondition hasConditionalOperator](self, "hasConditionalOperator")
        || !objc_msgSend(v4, "hasConditionalOperator")
        || (conditionalOperator = self->_conditionalOperator,
            conditionalOperator == objc_msgSend(v4, "conditionalOperator")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (-[_INPBCondition hasConditionalOperator](self, "hasConditionalOperator"))
    return 2654435761 * self->_conditionalOperator;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBCondition hasConditionalOperator](self, "hasConditionalOperator"))
  {
    v4 = -[_INPBCondition conditionalOperator](self, "conditionalOperator");
    if ((v4 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228F990[(v4 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("conditionalOperator"));

  }
  return v3;
}

- (int)conditionalOperator
{
  return self->_conditionalOperator;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
