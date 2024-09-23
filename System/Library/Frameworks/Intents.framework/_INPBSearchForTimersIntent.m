@implementation _INPBSearchForTimersIntent

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

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setState:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_state = a3;
  }
}

- (BOOL)hasState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)stateAsString:(int)a3
{
  if (a3 < 3)
    return off_1E22925E0[a3];
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
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E22925F8[a3];
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
  return _INPBSearchForTimersIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_INPBSearchForTimersIntent hasDuration](self, "hasDuration"))
    PBDataWriterWriteDoubleField();
  -[_INPBSearchForTimersIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSearchForTimersIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchForTimersIntent label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSearchForTimersIntent label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchForTimersIntent hasState](self, "hasState"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBSearchForTimersIntent hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSearchForTimersIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForTimersIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForTimersIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForTimersIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForTimersIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchForTimersIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForTimersIntent *v5;
  id v6;
  id v7;

  v5 = -[_INPBSearchForTimersIntent init](+[_INPBSearchForTimersIntent allocWithZone:](_INPBSearchForTimersIntent, "allocWithZone:"), "init");
  if (-[_INPBSearchForTimersIntent hasDuration](self, "hasDuration"))
  {
    -[_INPBSearchForTimersIntent duration](self, "duration");
    -[_INPBSearchForTimersIntent setDuration:](v5, "setDuration:");
  }
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchForTimersIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBDataString copyWithZone:](self->_label, "copyWithZone:", a3);
  -[_INPBSearchForTimersIntent setLabel:](v5, "setLabel:", v7);

  if (-[_INPBSearchForTimersIntent hasState](self, "hasState"))
    -[_INPBSearchForTimersIntent setState:](v5, "setState:", -[_INPBSearchForTimersIntent state](self, "state"));
  if (-[_INPBSearchForTimersIntent hasType](self, "hasType"))
    -[_INPBSearchForTimersIntent setType:](v5, "setType:", -[_INPBSearchForTimersIntent type](self, "type"));
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
  int state;
  int v24;
  int type;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBSearchForTimersIntent hasDuration](self, "hasDuration");
  if (v5 != objc_msgSend(v4, "hasDuration"))
    goto LABEL_16;
  if (-[_INPBSearchForTimersIntent hasDuration](self, "hasDuration"))
  {
    if (objc_msgSend(v4, "hasDuration"))
    {
      duration = self->_duration;
      objc_msgSend(v4, "duration");
      if (duration != v7)
        goto LABEL_16;
    }
  }
  -[_INPBSearchForTimersIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
    goto LABEL_15;
  -[_INPBSearchForTimersIntent intentMetadata](self, "intentMetadata");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[_INPBSearchForTimersIntent intentMetadata](self, "intentMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

    if (!v14)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBSearchForTimersIntent label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 == 0) == (v9 != 0))
  {
LABEL_15:

    goto LABEL_16;
  }
  -[_INPBSearchForTimersIntent label](self, "label");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[_INPBSearchForTimersIntent label](self, "label");
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
  v22 = -[_INPBSearchForTimersIntent hasState](self, "hasState");
  if (v22 == objc_msgSend(v4, "hasState"))
  {
    if (!-[_INPBSearchForTimersIntent hasState](self, "hasState")
      || !objc_msgSend(v4, "hasState")
      || (state = self->_state, state == objc_msgSend(v4, "state")))
    {
      v24 = -[_INPBSearchForTimersIntent hasType](self, "hasType");
      if (v24 == objc_msgSend(v4, "hasType"))
      {
        if (!-[_INPBSearchForTimersIntent hasType](self, "hasType")
          || !objc_msgSend(v4, "hasType")
          || (type = self->_type, type == objc_msgSend(v4, "type")))
        {
          v20 = 1;
          goto LABEL_17;
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
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (-[_INPBSearchForTimersIntent hasDuration](self, "hasDuration"))
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
  v8 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v9 = -[_INPBDataString hash](self->_label, "hash");
  if (-[_INPBSearchForTimersIntent hasState](self, "hasState"))
    v10 = 2654435761 * self->_state;
  else
    v10 = 0;
  if (-[_INPBSearchForTimersIntent hasType](self, "hasType"))
    v11 = 2654435761 * self->_type;
  else
    v11 = 0;
  return v8 ^ v7 ^ v9 ^ v10 ^ v11;
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
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBSearchForTimersIntent hasDuration](self, "hasDuration"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBSearchForTimersIntent duration](self, "duration");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  }
  -[_INPBSearchForTimersIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBSearchForTimersIntent label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("label"));

  if (-[_INPBSearchForTimersIntent hasState](self, "hasState"))
  {
    v10 = -[_INPBSearchForTimersIntent state](self, "state");
    if (v10 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E22925E0[v10];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("state"));

  }
  if (-[_INPBSearchForTimersIntent hasType](self, "hasType"))
  {
    v12 = -[_INPBSearchForTimersIntent type](self, "type");
    if (v12 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E22925F8[v12];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("type"));

  }
  return v3;
}

- (double)duration
{
  return self->_duration;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDataString)label
{
  return self->_label;
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
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
