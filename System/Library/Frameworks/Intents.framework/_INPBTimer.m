@implementation _INPBTimer

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setRemainingTime:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_remainingTime = a3;
}

- (BOOL)hasRemainingTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasRemainingTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setState:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_state = a3;
  }
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)stateAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E228DB68 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIMER_RUNNING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TIMER_PAUSED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E228DB80 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SLEEP_TIMER")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTimerReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBTimer hasDuration](self, "hasDuration"))
    PBDataWriterWriteDoubleField();
  -[_INPBTimer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBTimer label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBTimer label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBTimer hasRemainingTime](self, "hasRemainingTime"))
    PBDataWriterWriteDoubleField();
  if (-[_INPBTimer hasState](self, "hasState"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBTimer hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBTimer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTimer *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTimer *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTimer *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTimer initWithData:](self, "initWithData:", v6);

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
  -[_INPBTimer data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTimer *v5;
  void *v6;
  id v7;

  v5 = -[_INPBTimer init](+[_INPBTimer allocWithZone:](_INPBTimer, "allocWithZone:"), "init");
  if (-[_INPBTimer hasDuration](self, "hasDuration"))
  {
    -[_INPBTimer duration](self, "duration");
    -[_INPBTimer setDuration:](v5, "setDuration:");
  }
  v6 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBTimer setIdentifier:](v5, "setIdentifier:", v6);

  v7 = -[_INPBDataString copyWithZone:](self->_label, "copyWithZone:", a3);
  -[_INPBTimer setLabel:](v5, "setLabel:", v7);

  if (-[_INPBTimer hasRemainingTime](self, "hasRemainingTime"))
  {
    -[_INPBTimer remainingTime](self, "remainingTime");
    -[_INPBTimer setRemainingTime:](v5, "setRemainingTime:");
  }
  if (-[_INPBTimer hasState](self, "hasState"))
    -[_INPBTimer setState:](v5, "setState:", -[_INPBTimer state](self, "state"));
  if (-[_INPBTimer hasType](self, "hasType"))
    -[_INPBTimer setType:](v5, "setType:", -[_INPBTimer type](self, "type"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  double duration;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  int v22;
  double remainingTime;
  double v24;
  int v25;
  int state;
  int v27;
  int type;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBTimer hasDuration](self, "hasDuration");
  if (v5 != objc_msgSend(v4, "hasDuration"))
    goto LABEL_16;
  if (-[_INPBTimer hasDuration](self, "hasDuration"))
  {
    if (objc_msgSend(v4, "hasDuration"))
    {
      duration = self->_duration;
      objc_msgSend(v4, "duration");
      if (duration != v7)
        goto LABEL_16;
    }
  }
  -[_INPBTimer identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_15;
  -[_INPBTimer identifier](self, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[_INPBTimer identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBTimer label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  -[_INPBTimer label](self, "label");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[_INPBTimer label](self, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if (!v19)
      goto LABEL_16;
  }
  else
  {

  }
  v22 = -[_INPBTimer hasRemainingTime](self, "hasRemainingTime");
  if (v22 == objc_msgSend(v4, "hasRemainingTime"))
  {
    if (!-[_INPBTimer hasRemainingTime](self, "hasRemainingTime")
      || !objc_msgSend(v4, "hasRemainingTime")
      || (remainingTime = self->_remainingTime, objc_msgSend(v4, "remainingTime"), remainingTime == v24))
    {
      v25 = -[_INPBTimer hasState](self, "hasState");
      if (v25 == objc_msgSend(v4, "hasState"))
      {
        if (!-[_INPBTimer hasState](self, "hasState")
          || !objc_msgSend(v4, "hasState")
          || (state = self->_state, state == objc_msgSend(v4, "state")))
        {
          v27 = -[_INPBTimer hasType](self, "hasType");
          if (v27 == objc_msgSend(v4, "hasType"))
          {
            if (!-[_INPBTimer hasType](self, "hasType")
              || !objc_msgSend(v4, "hasType")
              || (type = self->_type, type == objc_msgSend(v4, "type")))
            {
              v20 = 1;
              goto LABEL_17;
            }
          }
        }
      }
    }
  }
LABEL_16:
  v20 = 0;
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  double duration;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  double remainingTime;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (-[_INPBTimer hasDuration](self, "hasDuration"))
  {
    duration = self->_duration;
    v4 = -duration;
    if (duration >= 0.0)
      v4 = self->_duration;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0)
        v7 += (unint64_t)v6;
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = -[NSString hash](self->_identifier, "hash");
  v9 = -[_INPBDataString hash](self->_label, "hash");
  if (-[_INPBTimer hasRemainingTime](self, "hasRemainingTime"))
  {
    remainingTime = self->_remainingTime;
    v11 = -remainingTime;
    if (remainingTime >= 0.0)
      v11 = self->_remainingTime;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v14 += (unint64_t)v13;
    }
    else
    {
      v14 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v14 = 0;
  }
  if (-[_INPBTimer hasState](self, "hasState"))
    v15 = 2654435761 * self->_state;
  else
    v15 = 0;
  if (-[_INPBTimer hasType](self, "hasType"))
    v16 = 2654435761 * self->_type;
  else
    v16 = 0;
  return v8 ^ v7 ^ v9 ^ v14 ^ v15 ^ v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBTimer hasDuration](self, "hasDuration"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBTimer duration](self, "duration");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  }
  if (self->_identifier)
  {
    -[_INPBTimer identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("identifier"));

  }
  -[_INPBTimer label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("label"));

  if (-[_INPBTimer hasRemainingTime](self, "hasRemainingTime"))
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBTimer remainingTime](self, "remainingTime");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("remainingTime"));

  }
  if (-[_INPBTimer hasState](self, "hasState"))
  {
    v12 = -[_INPBTimer state](self, "state");
    if (v12 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *(&off_1E228DB68 + v12);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("state"));

  }
  if (-[_INPBTimer hasType](self, "hasType"))
  {
    v14 = -[_INPBTimer type](self, "type");
    if (v14 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E228DB80 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("type"));

  }
  return v3;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (int)state
{
  return self->_state;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
