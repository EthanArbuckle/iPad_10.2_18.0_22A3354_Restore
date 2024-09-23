@implementation _INPBDateTime

- (void)setCalendarSystem:(int)a3
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
    self->_calendarSystem = a3;
  }
}

- (BOOL)hasCalendarSystem
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCalendarSystem:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)calendarSystemAsString:(int)a3
{
  if ((a3 - 1) < 0xC)
    return off_1E228D630[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCalendarSystem:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUDDHIST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHINESE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEBREW")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIJRI")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINDU")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISLAMIC_UMALQURA")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISLAMIC")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GREGORIAN")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JAPANESE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JULIAN")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSIAN")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REPUBLIC_OF_CHINA")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (BOOL)hasDate
{
  return self->_date != 0;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (void)setTimeZoneID:(id)a3
{
  NSString *v4;
  NSString *timeZoneID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  timeZoneID = self->_timeZoneID;
  self->_timeZoneID = v4;

}

- (BOOL)hasTimeZoneID
{
  return self->_timeZoneID != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDateTimeReadFrom(self, (uint64_t)a3);
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
  if (-[_INPBDateTime hasCalendarSystem](self, "hasCalendarSystem"))
    PBDataWriterWriteInt32Field();
  -[_INPBDateTime date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBDateTime date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDateTime time](self, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBDateTime time](self, "time");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDateTime timeZoneID](self, "timeZoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    v9 = v10;
  }

}

- (_INPBDateTime)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDateTime *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDateTime *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDateTime *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDateTime initWithData:](self, "initWithData:", v6);

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
  -[_INPBDateTime data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDateTime *v5;
  id v6;
  id v7;
  void *v8;

  v5 = -[_INPBDateTime init](+[_INPBDateTime allocWithZone:](_INPBDateTime, "allocWithZone:"), "init");
  if (-[_INPBDateTime hasCalendarSystem](self, "hasCalendarSystem"))
    -[_INPBDateTime setCalendarSystem:](v5, "setCalendarSystem:", -[_INPBDateTime calendarSystem](self, "calendarSystem"));
  v6 = -[_INPBLocalDate copyWithZone:](self->_date, "copyWithZone:", a3);
  -[_INPBDateTime setDate:](v5, "setDate:", v6);

  v7 = -[_INPBLocalTime copyWithZone:](self->_time, "copyWithZone:", a3);
  -[_INPBDateTime setTime:](v5, "setTime:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_timeZoneID, "copyWithZone:", a3);
  -[_INPBDateTime setTimeZoneID:](v5, "setTimeZoneID:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int calendarSystem;
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
  v5 = -[_INPBDateTime hasCalendarSystem](self, "hasCalendarSystem");
  if (v5 != objc_msgSend(v4, "hasCalendarSystem"))
    goto LABEL_21;
  if (-[_INPBDateTime hasCalendarSystem](self, "hasCalendarSystem"))
  {
    if (objc_msgSend(v4, "hasCalendarSystem"))
    {
      calendarSystem = self->_calendarSystem;
      if (calendarSystem != objc_msgSend(v4, "calendarSystem"))
        goto LABEL_21;
    }
  }
  -[_INPBDateTime date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBDateTime date](self, "date");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBDateTime date](self, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBDateTime time](self, "time");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBDateTime time](self, "time");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBDateTime time](self, "time");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "time");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBDateTime timeZoneID](self, "timeZoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBDateTime timeZoneID](self, "timeZoneID");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBDateTime timeZoneID](self, "timeZoneID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZoneID");
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

  if (-[_INPBDateTime hasCalendarSystem](self, "hasCalendarSystem"))
    v3 = 2654435761 * self->_calendarSystem;
  else
    v3 = 0;
  v4 = -[_INPBLocalDate hash](self->_date, "hash") ^ v3;
  v5 = -[_INPBLocalTime hash](self->_time, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_timeZoneID, "hash");
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
  if (-[_INPBDateTime hasCalendarSystem](self, "hasCalendarSystem"))
  {
    v4 = -[_INPBDateTime calendarSystem](self, "calendarSystem");
    if ((v4 - 1) >= 0xC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E228D630[(v4 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("calendarSystem"));

  }
  -[_INPBDateTime date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("date"));

  -[_INPBDateTime time](self, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("time"));

  if (self->_timeZoneID)
  {
    -[_INPBDateTime timeZoneID](self, "timeZoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("timeZoneID"));

  }
  return v3;
}

- (int)calendarSystem
{
  return self->_calendarSystem;
}

- (_INPBLocalDate)date
{
  return self->_date;
}

- (_INPBLocalTime)time
{
  return self->_time;
}

- (NSString)timeZoneID
{
  return self->_timeZoneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneID, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
