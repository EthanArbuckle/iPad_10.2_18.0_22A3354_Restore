@implementation _INPBSetTimerAttributeIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setTargetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_targetTimer, a3);
}

- (BOOL)hasTargetTimer
{
  return self->_targetTimer != 0;
}

- (void)setToDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_toDuration = a3;
}

- (BOOL)hasToDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasToDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setToLabel:(id)a3
{
  objc_storeStrong((id *)&self->_toLabel, a3);
}

- (BOOL)hasToLabel
{
  return self->_toLabel != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTimerAttributeIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_INPBSetTimerAttributeIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetTimerAttributeIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetTimerAttributeIntent targetTimer](self, "targetTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetTimerAttributeIntent targetTimer](self, "targetTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetTimerAttributeIntent hasToDuration](self, "hasToDuration"))
    PBDataWriterWriteDoubleField();
  -[_INPBSetTimerAttributeIntent toLabel](self, "toLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[_INPBSetTimerAttributeIntent toLabel](self, "toLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (_INPBSetTimerAttributeIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetTimerAttributeIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetTimerAttributeIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetTimerAttributeIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetTimerAttributeIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetTimerAttributeIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetTimerAttributeIntent *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBSetTimerAttributeIntent init](+[_INPBSetTimerAttributeIntent allocWithZone:](_INPBSetTimerAttributeIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetTimerAttributeIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBTimer copyWithZone:](self->_targetTimer, "copyWithZone:", a3);
  -[_INPBSetTimerAttributeIntent setTargetTimer:](v5, "setTargetTimer:", v7);

  if (-[_INPBSetTimerAttributeIntent hasToDuration](self, "hasToDuration"))
  {
    -[_INPBSetTimerAttributeIntent toDuration](self, "toDuration");
    -[_INPBSetTimerAttributeIntent setToDuration:](v5, "setToDuration:");
  }
  v8 = -[_INPBDataString copyWithZone:](self->_toLabel, "copyWithZone:", a3);
  -[_INPBSetTimerAttributeIntent setToLabel:](v5, "setToLabel:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  double toDuration;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[_INPBSetTimerAttributeIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBSetTimerAttributeIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetTimerAttributeIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBSetTimerAttributeIntent targetTimer](self, "targetTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBSetTimerAttributeIntent targetTimer](self, "targetTimer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSetTimerAttributeIntent targetTimer](self, "targetTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_21;
  }
  else
  {

  }
  v17 = -[_INPBSetTimerAttributeIntent hasToDuration](self, "hasToDuration");
  if (v17 != objc_msgSend(v4, "hasToDuration"))
    goto LABEL_21;
  if (-[_INPBSetTimerAttributeIntent hasToDuration](self, "hasToDuration"))
  {
    if (objc_msgSend(v4, "hasToDuration"))
    {
      toDuration = self->_toDuration;
      objc_msgSend(v4, "toDuration");
      if (toDuration != v19)
        goto LABEL_21;
    }
  }
  -[_INPBSetTimerAttributeIntent toLabel](self, "toLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetTimerAttributeIntent toLabel](self, "toLabel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

LABEL_24:
      v25 = 1;
      goto LABEL_22;
    }
    v21 = (void *)v20;
    -[_INPBSetTimerAttributeIntent toLabel](self, "toLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v25 = 0;
LABEL_22:

  return v25;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  double toDuration;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v4 = -[_INPBTimer hash](self->_targetTimer, "hash");
  if (-[_INPBSetTimerAttributeIntent hasToDuration](self, "hasToDuration"))
  {
    toDuration = self->_toDuration;
    v6 = -toDuration;
    if (toDuration >= 0.0)
      v6 = self->_toDuration;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v9 += (unint64_t)v8;
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v9 = 0;
  }
  return v4 ^ v3 ^ v9 ^ -[_INPBDataString hash](self->_toLabel, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSetTimerAttributeIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  -[_INPBSetTimerAttributeIntent targetTimer](self, "targetTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("targetTimer"));

  if (-[_INPBSetTimerAttributeIntent hasToDuration](self, "hasToDuration"))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBSetTimerAttributeIntent toDuration](self, "toDuration");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("toDuration"));

  }
  -[_INPBSetTimerAttributeIntent toLabel](self, "toLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("toLabel"));

  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBTimer)targetTimer
{
  return self->_targetTimer;
}

- (double)toDuration
{
  return self->_toDuration;
}

- (_INPBDataString)toLabel
{
  return self->_toLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toLabel, 0);
  objc_storeStrong((id *)&self->_targetTimer, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
