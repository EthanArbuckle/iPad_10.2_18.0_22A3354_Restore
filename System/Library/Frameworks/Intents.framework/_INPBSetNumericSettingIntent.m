@implementation _INPBSetNumericSettingIntent

- (void)setAction:(int)a3
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
    self->_action = a3;
  }
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)actionAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E2294830 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SET")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCREASE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DECREASE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setBoundedValue:(int)a3
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
    self->_boundedValue = a3;
  }
}

- (BOOL)hasBoundedValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasBoundedValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)boundedValueAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E2294848 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBoundedValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIAN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAX")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setNumericValue:(id)a3
{
  objc_storeStrong((id *)&self->_numericValue, a3);
}

- (BOOL)hasNumericValue
{
  return self->_numericValue != 0;
}

- (void)setSettingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_settingMetadata, a3);
}

- (BOOL)hasSettingMetadata
{
  return self->_settingMetadata != 0;
}

- (void)setTemporalEventTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, a3);
}

- (BOOL)hasTemporalEventTrigger
{
  return self->_temporalEventTrigger != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetNumericSettingIntentReadFrom(self, (uint64_t)a3);
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
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[_INPBSetNumericSettingIntent hasAction](self, "hasAction"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBSetNumericSettingIntent hasBoundedValue](self, "hasBoundedValue"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetNumericSettingIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetNumericSettingIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetNumericSettingIntent numericValue](self, "numericValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetNumericSettingIntent numericValue](self, "numericValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetNumericSettingIntent settingMetadata](self, "settingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSetNumericSettingIntent settingMetadata](self, "settingMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetNumericSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[_INPBSetNumericSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (_INPBSetNumericSettingIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetNumericSettingIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetNumericSettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetNumericSettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetNumericSettingIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetNumericSettingIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetNumericSettingIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBSetNumericSettingIntent init](+[_INPBSetNumericSettingIntent allocWithZone:](_INPBSetNumericSettingIntent, "allocWithZone:"), "init");
  if (-[_INPBSetNumericSettingIntent hasAction](self, "hasAction"))
    -[_INPBSetNumericSettingIntent setAction:](v5, "setAction:", -[_INPBSetNumericSettingIntent action](self, "action"));
  if (-[_INPBSetNumericSettingIntent hasBoundedValue](self, "hasBoundedValue"))
    -[_INPBSetNumericSettingIntent setBoundedValue:](v5, "setBoundedValue:", -[_INPBSetNumericSettingIntent boundedValue](self, "boundedValue"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBNumericSettingValue copyWithZone:](self->_numericValue, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntent setNumericValue:](v5, "setNumericValue:", v7);

  v8 = -[_INPBSettingMetadata copyWithZone:](self->_settingMetadata, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntent setSettingMetadata:](v5, "setSettingMetadata:", v8);

  v9 = -[_INPBTemporalEventTrigger copyWithZone:](self->_temporalEventTrigger, "copyWithZone:", a3);
  -[_INPBSetNumericSettingIntent setTemporalEventTrigger:](v5, "setTemporalEventTrigger:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int action;
  int v7;
  int boundedValue;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  v5 = -[_INPBSetNumericSettingIntent hasAction](self, "hasAction");
  if (v5 != objc_msgSend(v4, "hasAction"))
    goto LABEL_30;
  if (-[_INPBSetNumericSettingIntent hasAction](self, "hasAction"))
  {
    if (objc_msgSend(v4, "hasAction"))
    {
      action = self->_action;
      if (action != objc_msgSend(v4, "action"))
        goto LABEL_30;
    }
  }
  v7 = -[_INPBSetNumericSettingIntent hasBoundedValue](self, "hasBoundedValue");
  if (v7 != objc_msgSend(v4, "hasBoundedValue"))
    goto LABEL_30;
  if (-[_INPBSetNumericSettingIntent hasBoundedValue](self, "hasBoundedValue"))
  {
    if (objc_msgSend(v4, "hasBoundedValue"))
    {
      boundedValue = self->_boundedValue;
      if (boundedValue != objc_msgSend(v4, "boundedValue"))
        goto LABEL_30;
    }
  }
  -[_INPBSetNumericSettingIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_29;
  -[_INPBSetNumericSettingIntent intentMetadata](self, "intentMetadata");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_INPBSetNumericSettingIntent intentMetadata](self, "intentMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (!v15)
      goto LABEL_30;
  }
  else
  {

  }
  -[_INPBSetNumericSettingIntent numericValue](self, "numericValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numericValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_29;
  -[_INPBSetNumericSettingIntent numericValue](self, "numericValue");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    -[_INPBSetNumericSettingIntent numericValue](self, "numericValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numericValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqual:", v19);

    if (!v20)
      goto LABEL_30;
  }
  else
  {

  }
  -[_INPBSetNumericSettingIntent settingMetadata](self, "settingMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_29;
  -[_INPBSetNumericSettingIntent settingMetadata](self, "settingMetadata");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBSetNumericSettingIntent settingMetadata](self, "settingMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_30;
  }
  else
  {

  }
  -[_INPBSetNumericSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporalEventTrigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) != (v10 != 0))
  {
    -[_INPBSetNumericSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!v26)
    {

LABEL_33:
      v31 = 1;
      goto LABEL_31;
    }
    v27 = (void *)v26;
    -[_INPBSetNumericSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporalEventTrigger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if ((v30 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v31 = 0;
LABEL_31:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if (-[_INPBSetNumericSettingIntent hasAction](self, "hasAction"))
    v3 = 2654435761 * self->_action;
  else
    v3 = 0;
  if (-[_INPBSetNumericSettingIntent hasBoundedValue](self, "hasBoundedValue"))
    v4 = 2654435761 * self->_boundedValue;
  else
    v4 = 0;
  v5 = v4 ^ v3 ^ -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v6 = -[_INPBNumericSettingValue hash](self->_numericValue, "hash");
  v7 = v5 ^ v6 ^ -[_INPBSettingMetadata hash](self->_settingMetadata, "hash");
  return v7 ^ -[_INPBTemporalEventTrigger hash](self->_temporalEventTrigger, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBSetNumericSettingIntent hasAction](self, "hasAction"))
  {
    v4 = -[_INPBSetNumericSettingIntent action](self, "action");
    if ((v4 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E2294830 + (v4 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("action"));

  }
  if (-[_INPBSetNumericSettingIntent hasBoundedValue](self, "hasBoundedValue"))
  {
    v6 = -[_INPBSetNumericSettingIntent boundedValue](self, "boundedValue");
    if ((v6 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = *(&off_1E2294848 + (v6 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("boundedValue"));

  }
  -[_INPBSetNumericSettingIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  -[_INPBSetNumericSettingIntent numericValue](self, "numericValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("numericValue"));

  -[_INPBSetNumericSettingIntent settingMetadata](self, "settingMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("settingMetadata"));

  -[_INPBSetNumericSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("temporalEventTrigger"));

  return v3;
}

- (int)action
{
  return self->_action;
}

- (int)boundedValue
{
  return self->_boundedValue;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBNumericSettingValue)numericValue
{
  return self->_numericValue;
}

- (_INPBSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_numericValue, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
