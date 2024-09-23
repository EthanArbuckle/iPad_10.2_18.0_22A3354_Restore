@implementation _INPBCreateAlarmIntentResponse

- (void)setCreatedAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_createdAlarm, a3);
}

- (BOOL)hasCreatedAlarm
{
  return self->_createdAlarm != 0;
}

- (void)setSuccessCode:(int)a3
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
    self->_successCode = a3;
  }
}

- (BOOL)hasSuccessCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSuccessCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)successCodeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E2294C88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuccessCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALARM_CREATED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DUPLICATE_ALARM_EXISTS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DUPLICATE_ALARM_ENABLED")))
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
  return _INPBCreateAlarmIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBCreateAlarmIntentResponse createdAlarm](self, "createdAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBCreateAlarmIntentResponse createdAlarm](self, "createdAlarm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBCreateAlarmIntentResponse hasSuccessCode](self, "hasSuccessCode"))
    PBDataWriterWriteInt32Field();

}

- (_INPBCreateAlarmIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCreateAlarmIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCreateAlarmIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCreateAlarmIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCreateAlarmIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBCreateAlarmIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCreateAlarmIntentResponse *v5;
  id v6;

  v5 = -[_INPBCreateAlarmIntentResponse init](+[_INPBCreateAlarmIntentResponse allocWithZone:](_INPBCreateAlarmIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBAlarm copyWithZone:](self->_createdAlarm, "copyWithZone:", a3);
  -[_INPBCreateAlarmIntentResponse setCreatedAlarm:](v5, "setCreatedAlarm:", v6);

  if (-[_INPBCreateAlarmIntentResponse hasSuccessCode](self, "hasSuccessCode"))
    -[_INPBCreateAlarmIntentResponse setSuccessCode:](v5, "setSuccessCode:", -[_INPBCreateAlarmIntentResponse successCode](self, "successCode"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int successCode;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBCreateAlarmIntentResponse createdAlarm](self, "createdAlarm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createdAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCreateAlarmIntentResponse createdAlarm](self, "createdAlarm");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBCreateAlarmIntentResponse createdAlarm](self, "createdAlarm");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "createdAlarm");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBCreateAlarmIntentResponse hasSuccessCode](self, "hasSuccessCode");
    if (v13 == objc_msgSend(v4, "hasSuccessCode"))
    {
      if (!-[_INPBCreateAlarmIntentResponse hasSuccessCode](self, "hasSuccessCode")
        || !objc_msgSend(v4, "hasSuccessCode")
        || (successCode = self->_successCode, successCode == objc_msgSend(v4, "successCode")))
      {
        v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_INPBAlarm hash](self->_createdAlarm, "hash");
  if (-[_INPBCreateAlarmIntentResponse hasSuccessCode](self, "hasSuccessCode"))
    v4 = 2654435761 * self->_successCode;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBCreateAlarmIntentResponse createdAlarm](self, "createdAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("createdAlarm"));

  if (-[_INPBCreateAlarmIntentResponse hasSuccessCode](self, "hasSuccessCode"))
  {
    v6 = -[_INPBCreateAlarmIntentResponse successCode](self, "successCode");
    if (v6 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2294C88[v6];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("successCode"));

  }
  return v3;
}

- (_INPBAlarm)createdAlarm
{
  return self->_createdAlarm;
}

- (int)successCode
{
  return self->_successCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAlarm, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
