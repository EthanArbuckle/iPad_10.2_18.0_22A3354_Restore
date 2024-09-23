@implementation _INPBSetTemporalSettingIntent

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
    return *(&off_1E2294800 + (a3 - 1));
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

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
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

- (void)setTimeValue:(id)a3
{
  objc_storeStrong((id *)&self->_timeValue, a3);
}

- (BOOL)hasTimeValue
{
  return self->_timeValue != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTemporalSettingIntentReadFrom(self, (uint64_t)a3);
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
  if (-[_INPBSetTemporalSettingIntent hasAction](self, "hasAction"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetTemporalSettingIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetTemporalSettingIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetTemporalSettingIntent settingMetadata](self, "settingMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetTemporalSettingIntent settingMetadata](self, "settingMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetTemporalSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSetTemporalSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetTemporalSettingIntent timeValue](self, "timeValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[_INPBSetTemporalSettingIntent timeValue](self, "timeValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (_INPBSetTemporalSettingIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetTemporalSettingIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetTemporalSettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetTemporalSettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetTemporalSettingIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetTemporalSettingIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetTemporalSettingIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBSetTemporalSettingIntent init](+[_INPBSetTemporalSettingIntent allocWithZone:](_INPBSetTemporalSettingIntent, "allocWithZone:"), "init");
  if (-[_INPBSetTemporalSettingIntent hasAction](self, "hasAction"))
    -[_INPBSetTemporalSettingIntent setAction:](v5, "setAction:", -[_INPBSetTemporalSettingIntent action](self, "action"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetTemporalSettingIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBSettingMetadata copyWithZone:](self->_settingMetadata, "copyWithZone:", a3);
  -[_INPBSetTemporalSettingIntent setSettingMetadata:](v5, "setSettingMetadata:", v7);

  v8 = -[_INPBTemporalEventTrigger copyWithZone:](self->_temporalEventTrigger, "copyWithZone:", a3);
  -[_INPBSetTemporalSettingIntent setTemporalEventTrigger:](v5, "setTemporalEventTrigger:", v8);

  v9 = -[_INPBDateTimeRangeValue copyWithZone:](self->_timeValue, "copyWithZone:", a3);
  -[_INPBSetTemporalSettingIntent setTimeValue:](v5, "setTimeValue:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int action;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  v5 = -[_INPBSetTemporalSettingIntent hasAction](self, "hasAction");
  if (v5 != objc_msgSend(v4, "hasAction"))
    goto LABEL_26;
  if (-[_INPBSetTemporalSettingIntent hasAction](self, "hasAction"))
  {
    if (objc_msgSend(v4, "hasAction"))
    {
      action = self->_action;
      if (action != objc_msgSend(v4, "action"))
        goto LABEL_26;
    }
  }
  -[_INPBSetTemporalSettingIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBSetTemporalSettingIntent intentMetadata](self, "intentMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBSetTemporalSettingIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSetTemporalSettingIntent settingMetadata](self, "settingMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBSetTemporalSettingIntent settingMetadata](self, "settingMetadata");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSetTemporalSettingIntent settingMetadata](self, "settingMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSetTemporalSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporalEventTrigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_25;
  -[_INPBSetTemporalSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBSetTemporalSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporalEventTrigger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSetTemporalSettingIntent timeValue](self, "timeValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBSetTemporalSettingIntent timeValue](self, "timeValue");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBSetTemporalSettingIntent timeValue](self, "timeValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if (-[_INPBSetTemporalSettingIntent hasAction](self, "hasAction"))
    v3 = 2654435761 * self->_action;
  else
    v3 = 0;
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  v5 = -[_INPBSettingMetadata hash](self->_settingMetadata, "hash");
  v6 = v4 ^ v5 ^ -[_INPBTemporalEventTrigger hash](self->_temporalEventTrigger, "hash");
  return v6 ^ -[_INPBDateTimeRangeValue hash](self->_timeValue, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBSetTemporalSettingIntent hasAction](self, "hasAction"))
  {
    v4 = -[_INPBSetTemporalSettingIntent action](self, "action");
    if ((v4 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E2294800 + (v4 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("action"));

  }
  -[_INPBSetTemporalSettingIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBSetTemporalSettingIntent settingMetadata](self, "settingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("settingMetadata"));

  -[_INPBSetTemporalSettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("temporalEventTrigger"));

  -[_INPBSetTemporalSettingIntent timeValue](self, "timeValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("timeValue"));

  return v3;
}

- (int)action
{
  return self->_action;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBSettingMetadata)settingMetadata
{
  return self->_settingMetadata;
}

- (_INPBTemporalEventTrigger)temporalEventTrigger
{
  return self->_temporalEventTrigger;
}

- (_INPBDateTimeRangeValue)timeValue
{
  return self->_timeValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeValue, 0);
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
