@implementation _INPBLocalTime

- (void)setHourOfDay:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hourOfDay = a3;
}

- (BOOL)hasHourOfDay
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasHourOfDay:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setMillisOfSecond:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_millisOfSecond = a3;
}

- (BOOL)hasMillisOfSecond
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasMillisOfSecond:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setMinuteOfHour:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minuteOfHour = a3;
}

- (BOOL)hasMinuteOfHour
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMinuteOfHour:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setSecondOfMinute:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_secondOfMinute = a3;
}

- (BOOL)hasSecondOfMinute
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasSecondOfMinute:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLocalTimeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBLocalTime hasHourOfDay](self, "hasHourOfDay"))
    PBDataWriterWriteInt64Field();
  if (-[_INPBLocalTime hasMillisOfSecond](self, "hasMillisOfSecond"))
    PBDataWriterWriteInt64Field();
  if (-[_INPBLocalTime hasMinuteOfHour](self, "hasMinuteOfHour"))
    PBDataWriterWriteInt64Field();
  if (-[_INPBLocalTime hasSecondOfMinute](self, "hasSecondOfMinute"))
    PBDataWriterWriteInt64Field();

}

- (_INPBLocalTime)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBLocalTime *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBLocalTime *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBLocalTime *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBLocalTime initWithData:](self, "initWithData:", v6);

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
  -[_INPBLocalTime data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBLocalTime *v4;

  v4 = -[_INPBLocalTime init](+[_INPBLocalTime allocWithZone:](_INPBLocalTime, "allocWithZone:", a3), "init");
  if (-[_INPBLocalTime hasHourOfDay](self, "hasHourOfDay"))
    -[_INPBLocalTime setHourOfDay:](v4, "setHourOfDay:", -[_INPBLocalTime hourOfDay](self, "hourOfDay"));
  if (-[_INPBLocalTime hasMillisOfSecond](self, "hasMillisOfSecond"))
    -[_INPBLocalTime setMillisOfSecond:](v4, "setMillisOfSecond:", -[_INPBLocalTime millisOfSecond](self, "millisOfSecond"));
  if (-[_INPBLocalTime hasMinuteOfHour](self, "hasMinuteOfHour"))
    -[_INPBLocalTime setMinuteOfHour:](v4, "setMinuteOfHour:", -[_INPBLocalTime minuteOfHour](self, "minuteOfHour"));
  if (-[_INPBLocalTime hasSecondOfMinute](self, "hasSecondOfMinute"))
    -[_INPBLocalTime setSecondOfMinute:](v4, "setSecondOfMinute:", -[_INPBLocalTime secondOfMinute](self, "secondOfMinute"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int64_t hourOfDay;
  int v7;
  int64_t millisOfSecond;
  int v9;
  int64_t minuteOfHour;
  int v11;
  BOOL v12;
  int64_t secondOfMinute;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  v5 = -[_INPBLocalTime hasHourOfDay](self, "hasHourOfDay");
  if (v5 != objc_msgSend(v4, "hasHourOfDay"))
    goto LABEL_15;
  if (-[_INPBLocalTime hasHourOfDay](self, "hasHourOfDay"))
  {
    if (objc_msgSend(v4, "hasHourOfDay"))
    {
      hourOfDay = self->_hourOfDay;
      if (hourOfDay != objc_msgSend(v4, "hourOfDay"))
        goto LABEL_15;
    }
  }
  if ((v7 = -[_INPBLocalTime hasMillisOfSecond](self, "hasMillisOfSecond"),
        v7 == objc_msgSend(v4, "hasMillisOfSecond"))
    && (!-[_INPBLocalTime hasMillisOfSecond](self, "hasMillisOfSecond")
     || !objc_msgSend(v4, "hasMillisOfSecond")
     || (millisOfSecond = self->_millisOfSecond, millisOfSecond == objc_msgSend(v4, "millisOfSecond")))
    && (v9 = -[_INPBLocalTime hasMinuteOfHour](self, "hasMinuteOfHour"),
        v9 == objc_msgSend(v4, "hasMinuteOfHour"))
    && (!-[_INPBLocalTime hasMinuteOfHour](self, "hasMinuteOfHour")
     || !objc_msgSend(v4, "hasMinuteOfHour")
     || (minuteOfHour = self->_minuteOfHour, minuteOfHour == objc_msgSend(v4, "minuteOfHour")))
    && (v11 = -[_INPBLocalTime hasSecondOfMinute](self, "hasSecondOfMinute"),
        v11 == objc_msgSend(v4, "hasSecondOfMinute"))
    && (!-[_INPBLocalTime hasSecondOfMinute](self, "hasSecondOfMinute")
     || !objc_msgSend(v4, "hasSecondOfMinute")
     || (secondOfMinute = self->_secondOfMinute, secondOfMinute == objc_msgSend(v4, "secondOfMinute"))))
  {
    v12 = 1;
  }
  else
  {
LABEL_15:
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (-[_INPBLocalTime hasHourOfDay](self, "hasHourOfDay"))
    v3 = 2654435761 * self->_hourOfDay;
  else
    v3 = 0;
  if (-[_INPBLocalTime hasMillisOfSecond](self, "hasMillisOfSecond"))
    v4 = 2654435761 * self->_millisOfSecond;
  else
    v4 = 0;
  if (-[_INPBLocalTime hasMinuteOfHour](self, "hasMinuteOfHour"))
    v5 = 2654435761 * self->_minuteOfHour;
  else
    v5 = 0;
  if (-[_INPBLocalTime hasSecondOfMinute](self, "hasSecondOfMinute"))
    v6 = 2654435761 * self->_secondOfMinute;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBLocalTime hasHourOfDay](self, "hasHourOfDay"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBLocalTime hourOfDay](self, "hourOfDay"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hourOfDay"));

  }
  if (-[_INPBLocalTime hasMillisOfSecond](self, "hasMillisOfSecond"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBLocalTime millisOfSecond](self, "millisOfSecond"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("millisOfSecond"));

  }
  if (-[_INPBLocalTime hasMinuteOfHour](self, "hasMinuteOfHour"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBLocalTime minuteOfHour](self, "minuteOfHour"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("minuteOfHour"));

  }
  if (-[_INPBLocalTime hasSecondOfMinute](self, "hasSecondOfMinute"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBLocalTime secondOfMinute](self, "secondOfMinute"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("secondOfMinute"));

  }
  return v3;
}

- (int64_t)hourOfDay
{
  return self->_hourOfDay;
}

- (int64_t)millisOfSecond
{
  return self->_millisOfSecond;
}

- (int64_t)minuteOfHour
{
  return self->_minuteOfHour;
}

- (int64_t)secondOfMinute
{
  return self->_secondOfMinute;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
