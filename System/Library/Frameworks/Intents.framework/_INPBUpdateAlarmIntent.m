@implementation _INPBUpdateAlarmIntent

- (void)setAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_alarm, a3);
}

- (BOOL)hasAlarm
{
  return self->_alarm != 0;
}

- (void)setAlarmSearch:(id)a3
{
  objc_storeStrong((id *)&self->_alarmSearch, a3);
}

- (BOOL)hasAlarmSearch
{
  return self->_alarmSearch != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setOperation:(int)a3
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
    self->_operation = a3;
  }
}

- (BOOL)hasOperation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOperation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)operationAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("UPDATE_LABEL");
  if (a3 == 2)
  {
    v3 = CFSTR("UPDATE_TIME");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOperation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UPDATE_LABEL")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("UPDATE_TIME")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setProposedLabel:(id)a3
{
  objc_storeStrong((id *)&self->_proposedLabel, a3);
}

- (BOOL)hasProposedLabel
{
  return self->_proposedLabel != 0;
}

- (void)setProposedTime:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTime, a3);
}

- (BOOL)hasProposedTime
{
  return self->_proposedTime != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBUpdateAlarmIntentReadFrom(self, (uint64_t)a3);
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
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[_INPBUpdateAlarmIntent alarm](self, "alarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBUpdateAlarmIntent alarm](self, "alarm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBUpdateAlarmIntent alarmSearch](self, "alarmSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBUpdateAlarmIntent alarmSearch](self, "alarmSearch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBUpdateAlarmIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBUpdateAlarmIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBUpdateAlarmIntent hasOperation](self, "hasOperation"))
    PBDataWriterWriteInt32Field();
  -[_INPBUpdateAlarmIntent proposedLabel](self, "proposedLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBUpdateAlarmIntent proposedLabel](self, "proposedLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBUpdateAlarmIntent proposedTime](self, "proposedTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v12)
  {
    -[_INPBUpdateAlarmIntent proposedTime](self, "proposedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v13 = v15;
  }

}

- (_INPBUpdateAlarmIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBUpdateAlarmIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBUpdateAlarmIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBUpdateAlarmIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBUpdateAlarmIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBUpdateAlarmIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBUpdateAlarmIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBUpdateAlarmIntent init](+[_INPBUpdateAlarmIntent allocWithZone:](_INPBUpdateAlarmIntent, "allocWithZone:"), "init");
  v6 = -[_INPBAlarm copyWithZone:](self->_alarm, "copyWithZone:", a3);
  -[_INPBUpdateAlarmIntent setAlarm:](v5, "setAlarm:", v6);

  v7 = -[_INPBAlarmSearch copyWithZone:](self->_alarmSearch, "copyWithZone:", a3);
  -[_INPBUpdateAlarmIntent setAlarmSearch:](v5, "setAlarmSearch:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBUpdateAlarmIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  if (-[_INPBUpdateAlarmIntent hasOperation](self, "hasOperation"))
    -[_INPBUpdateAlarmIntent setOperation:](v5, "setOperation:", -[_INPBUpdateAlarmIntent operation](self, "operation"));
  v9 = -[_INPBDataString copyWithZone:](self->_proposedLabel, "copyWithZone:", a3);
  -[_INPBUpdateAlarmIntent setProposedLabel:](v5, "setProposedLabel:", v9);

  v10 = -[_INPBDateTimeRange copyWithZone:](self->_proposedTime, "copyWithZone:", a3);
  -[_INPBUpdateAlarmIntent setProposedTime:](v5, "setProposedTime:", v10);

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int operation;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  BOOL v34;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  -[_INPBUpdateAlarmIntent alarm](self, "alarm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBUpdateAlarmIntent alarm](self, "alarm");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBUpdateAlarmIntent alarm](self, "alarm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBUpdateAlarmIntent alarmSearch](self, "alarmSearch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBUpdateAlarmIntent alarmSearch](self, "alarmSearch");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBUpdateAlarmIntent alarmSearch](self, "alarmSearch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarmSearch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBUpdateAlarmIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBUpdateAlarmIntent intentMetadata](self, "intentMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBUpdateAlarmIntent intentMetadata](self, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_31;
  }
  else
  {

  }
  v22 = -[_INPBUpdateAlarmIntent hasOperation](self, "hasOperation");
  if (v22 != objc_msgSend(v4, "hasOperation"))
    goto LABEL_31;
  if (-[_INPBUpdateAlarmIntent hasOperation](self, "hasOperation"))
  {
    if (objc_msgSend(v4, "hasOperation"))
    {
      operation = self->_operation;
      if (operation != objc_msgSend(v4, "operation"))
        goto LABEL_31;
    }
  }
  -[_INPBUpdateAlarmIntent proposedLabel](self, "proposedLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proposedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_30;
  -[_INPBUpdateAlarmIntent proposedLabel](self, "proposedLabel");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBUpdateAlarmIntent proposedLabel](self, "proposedLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proposedLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_31;
  }
  else
  {

  }
  -[_INPBUpdateAlarmIntent proposedTime](self, "proposedTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proposedTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBUpdateAlarmIntent proposedTime](self, "proposedTime");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
    {

LABEL_34:
      v34 = 1;
      goto LABEL_32;
    }
    v30 = (void *)v29;
    -[_INPBUpdateAlarmIntent proposedTime](self, "proposedTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proposedTime");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if ((v33 & 1) != 0)
      goto LABEL_34;
  }
  else
  {
LABEL_30:

  }
LABEL_31:
  v34 = 0;
LABEL_32:

  return v34;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = -[_INPBAlarm hash](self->_alarm, "hash");
  v4 = -[_INPBAlarmSearch hash](self->_alarmSearch, "hash");
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBUpdateAlarmIntent hasOperation](self, "hasOperation"))
    v6 = 2654435761 * self->_operation;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[_INPBDataString hash](self->_proposedLabel, "hash");
  return v7 ^ v8 ^ -[_INPBDateTimeRange hash](self->_proposedTime, "hash");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBUpdateAlarmIntent alarm](self, "alarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alarm"));

  -[_INPBUpdateAlarmIntent alarmSearch](self, "alarmSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("alarmSearch"));

  -[_INPBUpdateAlarmIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  if (-[_INPBUpdateAlarmIntent hasOperation](self, "hasOperation"))
  {
    v10 = -[_INPBUpdateAlarmIntent operation](self, "operation");
    if ((_DWORD)v10 == 1)
    {
      v11 = CFSTR("UPDATE_LABEL");
    }
    else if ((_DWORD)v10 == 2)
    {
      v11 = CFSTR("UPDATE_TIME");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("operation"));

  }
  -[_INPBUpdateAlarmIntent proposedLabel](self, "proposedLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("proposedLabel"));

  -[_INPBUpdateAlarmIntent proposedTime](self, "proposedTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("proposedTime"));

  return v3;
}

- (_INPBAlarm)alarm
{
  return self->_alarm;
}

- (_INPBAlarmSearch)alarmSearch
{
  return self->_alarmSearch;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)operation
{
  return self->_operation;
}

- (_INPBDataString)proposedLabel
{
  return self->_proposedLabel;
}

- (_INPBDateTimeRange)proposedTime
{
  return self->_proposedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedTime, 0);
  objc_storeStrong((id *)&self->_proposedLabel, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_alarmSearch, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
