@implementation _INPBAlarmSearch

- (void)setAlarmReferenceType:(int)a3
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
    self->_alarmReferenceType = a3;
  }
}

- (BOOL)hasAlarmReferenceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAlarmReferenceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)alarmReferenceTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2294AA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlarmReferenceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THIS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEXT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAlarmSearchStatus:(int)a3
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
    self->_alarmSearchStatus = a3;
  }
}

- (BOOL)hasAlarmSearchStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAlarmSearchStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)alarmSearchStatusAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E2294AC0[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAlarmSearchStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ENABLED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISABLED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIRING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SNOOZED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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

- (void)setIncludeSleepAlarm:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_includeSleepAlarm = a3;
}

- (BOOL)hasIncludeSleepAlarm
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIncludeSleepAlarm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setIsMeridianInferred:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isMeridianInferred = a3;
}

- (BOOL)hasIsMeridianInferred
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsMeridianInferred:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setPeriod:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xEF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x10;
    self->_period = a3;
  }
}

- (BOOL)hasPeriod
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasPeriod:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)periodAsString:(int)a3
{
  if (a3 < 9)
    return off_1E2294AE0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPeriod:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PERIOD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORNING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AFTERNOON")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVENING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NIGHT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOON")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIDNIGHT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TODAY")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOMORROW")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAlarmSearchReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[_INPBAlarmSearch hasAlarmReferenceType](self, "hasAlarmReferenceType"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBAlarmSearch hasAlarmSearchStatus](self, "hasAlarmSearchStatus"))
    PBDataWriterWriteInt32Field();
  -[_INPBAlarmSearch identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  if (-[_INPBAlarmSearch hasIncludeSleepAlarm](self, "hasIncludeSleepAlarm"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBAlarmSearch hasIsMeridianInferred](self, "hasIsMeridianInferred"))
    PBDataWriterWriteBOOLField();
  -[_INPBAlarmSearch label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBAlarmSearch label](self, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBAlarmSearch hasPeriod](self, "hasPeriod"))
    PBDataWriterWriteInt32Field();
  -[_INPBAlarmSearch time](self, "time");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v7)
  {
    -[_INPBAlarmSearch time](self, "time");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v8 = v10;
  }

}

- (_INPBAlarmSearch)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAlarmSearch *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAlarmSearch *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAlarmSearch *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAlarmSearch initWithData:](self, "initWithData:", v6);

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
  -[_INPBAlarmSearch data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAlarmSearch *v5;
  void *v6;
  id v7;
  id v8;

  v5 = -[_INPBAlarmSearch init](+[_INPBAlarmSearch allocWithZone:](_INPBAlarmSearch, "allocWithZone:"), "init");
  if (-[_INPBAlarmSearch hasAlarmReferenceType](self, "hasAlarmReferenceType"))
    -[_INPBAlarmSearch setAlarmReferenceType:](v5, "setAlarmReferenceType:", -[_INPBAlarmSearch alarmReferenceType](self, "alarmReferenceType"));
  if (-[_INPBAlarmSearch hasAlarmSearchStatus](self, "hasAlarmSearchStatus"))
    -[_INPBAlarmSearch setAlarmSearchStatus:](v5, "setAlarmSearchStatus:", -[_INPBAlarmSearch alarmSearchStatus](self, "alarmSearchStatus"));
  v6 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBAlarmSearch setIdentifier:](v5, "setIdentifier:", v6);

  if (-[_INPBAlarmSearch hasIncludeSleepAlarm](self, "hasIncludeSleepAlarm"))
    -[_INPBAlarmSearch setIncludeSleepAlarm:](v5, "setIncludeSleepAlarm:", -[_INPBAlarmSearch includeSleepAlarm](self, "includeSleepAlarm"));
  if (-[_INPBAlarmSearch hasIsMeridianInferred](self, "hasIsMeridianInferred"))
    -[_INPBAlarmSearch setIsMeridianInferred:](v5, "setIsMeridianInferred:", -[_INPBAlarmSearch isMeridianInferred](self, "isMeridianInferred"));
  v7 = -[_INPBDataString copyWithZone:](self->_label, "copyWithZone:", a3);
  -[_INPBAlarmSearch setLabel:](v5, "setLabel:", v7);

  if (-[_INPBAlarmSearch hasPeriod](self, "hasPeriod"))
    -[_INPBAlarmSearch setPeriod:](v5, "setPeriod:", -[_INPBAlarmSearch period](self, "period"));
  v8 = -[_INPBDateTimeRangeValue copyWithZone:](self->_time, "copyWithZone:", a3);
  -[_INPBAlarmSearch setTime:](v5, "setTime:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int alarmReferenceType;
  int v7;
  int alarmSearchStatus;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int includeSleepAlarm;
  int v18;
  int isMeridianInferred;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int period;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  v5 = -[_INPBAlarmSearch hasAlarmReferenceType](self, "hasAlarmReferenceType");
  if (v5 != objc_msgSend(v4, "hasAlarmReferenceType"))
    goto LABEL_37;
  if (-[_INPBAlarmSearch hasAlarmReferenceType](self, "hasAlarmReferenceType"))
  {
    if (objc_msgSend(v4, "hasAlarmReferenceType"))
    {
      alarmReferenceType = self->_alarmReferenceType;
      if (alarmReferenceType != objc_msgSend(v4, "alarmReferenceType"))
        goto LABEL_37;
    }
  }
  v7 = -[_INPBAlarmSearch hasAlarmSearchStatus](self, "hasAlarmSearchStatus");
  if (v7 != objc_msgSend(v4, "hasAlarmSearchStatus"))
    goto LABEL_37;
  if (-[_INPBAlarmSearch hasAlarmSearchStatus](self, "hasAlarmSearchStatus"))
  {
    if (objc_msgSend(v4, "hasAlarmSearchStatus"))
    {
      alarmSearchStatus = self->_alarmSearchStatus;
      if (alarmSearchStatus != objc_msgSend(v4, "alarmSearchStatus"))
        goto LABEL_37;
    }
  }
  -[_INPBAlarmSearch identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_36;
  -[_INPBAlarmSearch identifier](self, "identifier");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[_INPBAlarmSearch identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (!v15)
      goto LABEL_37;
  }
  else
  {

  }
  v16 = -[_INPBAlarmSearch hasIncludeSleepAlarm](self, "hasIncludeSleepAlarm");
  if (v16 != objc_msgSend(v4, "hasIncludeSleepAlarm"))
    goto LABEL_37;
  if (-[_INPBAlarmSearch hasIncludeSleepAlarm](self, "hasIncludeSleepAlarm"))
  {
    if (objc_msgSend(v4, "hasIncludeSleepAlarm"))
    {
      includeSleepAlarm = self->_includeSleepAlarm;
      if (includeSleepAlarm != objc_msgSend(v4, "includeSleepAlarm"))
        goto LABEL_37;
    }
  }
  v18 = -[_INPBAlarmSearch hasIsMeridianInferred](self, "hasIsMeridianInferred");
  if (v18 != objc_msgSend(v4, "hasIsMeridianInferred"))
    goto LABEL_37;
  if (-[_INPBAlarmSearch hasIsMeridianInferred](self, "hasIsMeridianInferred"))
  {
    if (objc_msgSend(v4, "hasIsMeridianInferred"))
    {
      isMeridianInferred = self->_isMeridianInferred;
      if (isMeridianInferred != objc_msgSend(v4, "isMeridianInferred"))
        goto LABEL_37;
    }
  }
  -[_INPBAlarmSearch label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) == (v10 != 0))
    goto LABEL_36;
  -[_INPBAlarmSearch label](self, "label");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[_INPBAlarmSearch label](self, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_37;
  }
  else
  {

  }
  v25 = -[_INPBAlarmSearch hasPeriod](self, "hasPeriod");
  if (v25 != objc_msgSend(v4, "hasPeriod"))
    goto LABEL_37;
  if (-[_INPBAlarmSearch hasPeriod](self, "hasPeriod"))
  {
    if (objc_msgSend(v4, "hasPeriod"))
    {
      period = self->_period;
      if (period != objc_msgSend(v4, "period"))
        goto LABEL_37;
    }
  }
  -[_INPBAlarmSearch time](self, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v9 == 0) != (v10 != 0))
  {
    -[_INPBAlarmSearch time](self, "time");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_40:
      v32 = 1;
      goto LABEL_38;
    }
    v28 = (void *)v27;
    -[_INPBAlarmSearch time](self, "time");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "time");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_40;
  }
  else
  {
LABEL_36:

  }
LABEL_37:
  v32 = 0;
LABEL_38:

  return v32;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (-[_INPBAlarmSearch hasAlarmReferenceType](self, "hasAlarmReferenceType"))
    v3 = 2654435761 * self->_alarmReferenceType;
  else
    v3 = 0;
  if (-[_INPBAlarmSearch hasAlarmSearchStatus](self, "hasAlarmSearchStatus"))
    v4 = 2654435761 * self->_alarmSearchStatus;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_identifier, "hash");
  if (-[_INPBAlarmSearch hasIncludeSleepAlarm](self, "hasIncludeSleepAlarm"))
    v6 = 2654435761 * self->_includeSleepAlarm;
  else
    v6 = 0;
  if (-[_INPBAlarmSearch hasIsMeridianInferred](self, "hasIsMeridianInferred"))
    v7 = 2654435761 * self->_isMeridianInferred;
  else
    v7 = 0;
  v8 = -[_INPBDataString hash](self->_label, "hash");
  if (-[_INPBAlarmSearch hasPeriod](self, "hasPeriod"))
    v9 = 2654435761 * self->_period;
  else
    v9 = 0;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5 ^ v8 ^ v9 ^ -[_INPBDateTimeRangeValue hash](self->_time, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBAlarmSearch hasAlarmReferenceType](self, "hasAlarmReferenceType"))
  {
    v4 = -[_INPBAlarmSearch alarmReferenceType](self, "alarmReferenceType");
    if (v4 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E2294AA0[v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("alarmReferenceType"));

  }
  if (-[_INPBAlarmSearch hasAlarmSearchStatus](self, "hasAlarmSearchStatus"))
  {
    v6 = -[_INPBAlarmSearch alarmSearchStatus](self, "alarmSearchStatus");
    if ((v6 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E2294AC0[(v6 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("alarmSearchStatus"));

  }
  if (self->_identifier)
  {
    -[_INPBAlarmSearch identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("identifier"));

  }
  if (-[_INPBAlarmSearch hasIncludeSleepAlarm](self, "hasIncludeSleepAlarm"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBAlarmSearch includeSleepAlarm](self, "includeSleepAlarm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("includeSleepAlarm"));

  }
  if (-[_INPBAlarmSearch hasIsMeridianInferred](self, "hasIsMeridianInferred"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBAlarmSearch isMeridianInferred](self, "isMeridianInferred"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("isMeridianInferred"));

  }
  -[_INPBAlarmSearch label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("label"));

  if (-[_INPBAlarmSearch hasPeriod](self, "hasPeriod"))
  {
    v14 = -[_INPBAlarmSearch period](self, "period");
    if (v14 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E2294AE0[v14];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("period"));

  }
  -[_INPBAlarmSearch time](self, "time");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("time"));

  return v3;
}

- (int)alarmReferenceType
{
  return self->_alarmReferenceType;
}

- (int)alarmSearchStatus
{
  return self->_alarmSearchStatus;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)includeSleepAlarm
{
  return self->_includeSleepAlarm;
}

- (BOOL)isMeridianInferred
{
  return self->_isMeridianInferred;
}

- (_INPBDataString)label
{
  return self->_label;
}

- (int)period
{
  return self->_period;
}

- (_INPBDateTimeRangeValue)time
{
  return self->_time;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
