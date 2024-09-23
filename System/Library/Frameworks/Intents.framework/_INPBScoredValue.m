@implementation _INPBScoredValue

- (void)setScore:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  value = self->_value;
  self->_value = v4;

}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBScoredValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_INPBScoredValue hasScore](self, "hasScore"))
    PBDataWriterWriteInt64Field();
  -[_INPBScoredValue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (_INPBScoredValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBScoredValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBScoredValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBScoredValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBScoredValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBScoredValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBScoredValue *v5;
  void *v6;

  v5 = -[_INPBScoredValue init](+[_INPBScoredValue allocWithZone:](_INPBScoredValue, "allocWithZone:"), "init");
  if (-[_INPBScoredValue hasScore](self, "hasScore"))
    -[_INPBScoredValue setScore:](v5, "setScore:", -[_INPBScoredValue score](self, "score"));
  v6 = (void *)-[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  -[_INPBScoredValue setValue:](v5, "setValue:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int64_t score;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBScoredValue hasScore](self, "hasScore");
    if (v5 == objc_msgSend(v4, "hasScore"))
    {
      if (!-[_INPBScoredValue hasScore](self, "hasScore")
        || !objc_msgSend(v4, "hasScore")
        || (score = self->_score, score == objc_msgSend(v4, "score")))
      {
        -[_INPBScoredValue value](self, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_INPBScoredValue value](self, "value");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_14:
            v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          -[_INPBScoredValue value](self, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;

  if (-[_INPBScoredValue hasScore](self, "hasScore"))
    v3 = 2654435761 * self->_score;
  else
    v3 = 0;
  return -[NSString hash](self->_value, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBScoredValue hasScore](self, "hasScore"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBScoredValue score](self, "score"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("score"));

  }
  if (self->_value)
  {
    -[_INPBScoredValue value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("value"));

  }
  return v3;
}

- (int64_t)score
{
  return self->_score;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
