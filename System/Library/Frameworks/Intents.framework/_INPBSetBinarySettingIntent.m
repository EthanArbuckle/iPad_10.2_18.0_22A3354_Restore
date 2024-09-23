@implementation _INPBSetBinarySettingIntent

- (void)setBinaryValue:(int)a3
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
    self->_binaryValue = a3;
  }
}

- (BOOL)hasBinaryValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBinaryValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)binaryValueAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E2294898[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBinaryValue:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFF")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOGGLE")))
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

- (BOOL)readFrom:(id)a3
{
  return _INPBSetBinarySettingIntentReadFrom(self, (uint64_t)a3);
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
  if (-[_INPBSetBinarySettingIntent hasBinaryValue](self, "hasBinaryValue"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetBinarySettingIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetBinarySettingIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetBinarySettingIntent settingMetadata](self, "settingMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetBinarySettingIntent settingMetadata](self, "settingMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetBinarySettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v8)
  {
    -[_INPBSetBinarySettingIntent temporalEventTrigger](self, "temporalEventTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }

}

- (_INPBSetBinarySettingIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetBinarySettingIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetBinarySettingIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetBinarySettingIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetBinarySettingIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetBinarySettingIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetBinarySettingIntent *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBSetBinarySettingIntent init](+[_INPBSetBinarySettingIntent allocWithZone:](_INPBSetBinarySettingIntent, "allocWithZone:"), "init");
  if (-[_INPBSetBinarySettingIntent hasBinaryValue](self, "hasBinaryValue"))
    -[_INPBSetBinarySettingIntent setBinaryValue:](v5, "setBinaryValue:", -[_INPBSetBinarySettingIntent binaryValue](self, "binaryValue"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetBinarySettingIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBSettingMetadata copyWithZone:](self->_settingMetadata, "copyWithZone:", a3);
  -[_INPBSetBinarySettingIntent setSettingMetadata:](v5, "setSettingMetadata:", v7);

  v8 = -[_INPBTemporalEventTrigger copyWithZone:](self->_temporalEventTrigger, "copyWithZone:", a3);
  -[_INPBSetBinarySettingIntent setTemporalEventTrigger:](v5, "setTemporalEventTrigger:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int binaryValue;
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
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  v5 = -[_INPBSetBinarySettingIntent hasBinaryValue](self, "hasBinaryValue");
  if (v5 != objc_msgSend(v4, "hasBinaryValue"))
    goto LABEL_21;
  if (-[_INPBSetBinarySettingIntent hasBinaryValue](self, "hasBinaryValue"))
  {
    if (objc_msgSend(v4, "hasBinaryValue"))
    {
      binaryValue = self->_binaryValue;
      if (binaryValue != objc_msgSend(v4, "binaryValue"))
        goto LABEL_21;
    }
  }
  -[_INPBSetBinarySettingIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBSetBinarySettingIntent intentMetadata](self, "intentMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBSetBinarySettingIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBSetBinarySettingIntent settingMetadata](self, "settingMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBSetBinarySettingIntent settingMetadata](self, "settingMetadata");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSetBinarySettingIntent settingMetadata](self, "settingMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBSetBinarySettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporalEventTrigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBSetBinarySettingIntent temporalEventTrigger](self, "temporalEventTrigger");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBSetBinarySettingIntent temporalEventTrigger](self, "temporalEventTrigger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporalEventTrigger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (-[_INPBSetBinarySettingIntent hasBinaryValue](self, "hasBinaryValue"))
    v3 = 2654435761 * self->_binaryValue;
  else
    v3 = 0;
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  v5 = -[_INPBSettingMetadata hash](self->_settingMetadata, "hash");
  return v4 ^ v5 ^ -[_INPBTemporalEventTrigger hash](self->_temporalEventTrigger, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBSetBinarySettingIntent hasBinaryValue](self, "hasBinaryValue"))
  {
    v4 = -[_INPBSetBinarySettingIntent binaryValue](self, "binaryValue");
    if ((v4 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2294898[(v4 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("binaryValue"));

  }
  -[_INPBSetBinarySettingIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBSetBinarySettingIntent settingMetadata](self, "settingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("settingMetadata"));

  -[_INPBSetBinarySettingIntent temporalEventTrigger](self, "temporalEventTrigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("temporalEventTrigger"));

  return v3;
}

- (int)binaryValue
{
  return self->_binaryValue;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporalEventTrigger, 0);
  objc_storeStrong((id *)&self->_settingMetadata, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
