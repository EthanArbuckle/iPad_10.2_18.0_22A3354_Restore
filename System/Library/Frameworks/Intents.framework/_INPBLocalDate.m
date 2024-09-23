@implementation _INPBLocalDate

- (void)setDayOfMonth:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dayOfMonth = a3;
}

- (BOOL)hasDayOfMonth
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDayOfMonth:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setDayOfWeek:(int)a3
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
    self->_dayOfWeek = a3;
  }
}

- (BOOL)hasDayOfWeek
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)dayOfWeekAsString:(int)a3
{
  if (a3 < 8)
    return *(&off_1E228DB28 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDayOfWeek:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONDAY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TUESDAY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEDNESDAY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THURSDAY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRIDAY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATURDAY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUNDAY")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setMonth:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_month = a3;
}

- (BOOL)hasMonth
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasMonth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setYear:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_year = a3;
}

- (BOOL)hasYear
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasYear:(BOOL)a3
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
  return _INPBLocalDateReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBLocalDate hasDayOfMonth](self, "hasDayOfMonth"))
    PBDataWriterWriteInt64Field();
  if (-[_INPBLocalDate hasDayOfWeek](self, "hasDayOfWeek"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBLocalDate hasMonth](self, "hasMonth"))
    PBDataWriterWriteInt64Field();
  if (-[_INPBLocalDate hasYear](self, "hasYear"))
    PBDataWriterWriteInt64Field();

}

- (_INPBLocalDate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBLocalDate *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBLocalDate *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBLocalDate *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBLocalDate initWithData:](self, "initWithData:", v6);

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
  -[_INPBLocalDate data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBLocalDate *v4;

  v4 = -[_INPBLocalDate init](+[_INPBLocalDate allocWithZone:](_INPBLocalDate, "allocWithZone:", a3), "init");
  if (-[_INPBLocalDate hasDayOfMonth](self, "hasDayOfMonth"))
    -[_INPBLocalDate setDayOfMonth:](v4, "setDayOfMonth:", -[_INPBLocalDate dayOfMonth](self, "dayOfMonth"));
  if (-[_INPBLocalDate hasDayOfWeek](self, "hasDayOfWeek"))
    -[_INPBLocalDate setDayOfWeek:](v4, "setDayOfWeek:", -[_INPBLocalDate dayOfWeek](self, "dayOfWeek"));
  if (-[_INPBLocalDate hasMonth](self, "hasMonth"))
    -[_INPBLocalDate setMonth:](v4, "setMonth:", -[_INPBLocalDate month](self, "month"));
  if (-[_INPBLocalDate hasYear](self, "hasYear"))
    -[_INPBLocalDate setYear:](v4, "setYear:", -[_INPBLocalDate year](self, "year"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int64_t dayOfMonth;
  int v7;
  int dayOfWeek;
  int v9;
  int64_t month;
  int v11;
  BOOL v12;
  int64_t year;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  v5 = -[_INPBLocalDate hasDayOfMonth](self, "hasDayOfMonth");
  if (v5 != objc_msgSend(v4, "hasDayOfMonth"))
    goto LABEL_15;
  if (-[_INPBLocalDate hasDayOfMonth](self, "hasDayOfMonth"))
  {
    if (objc_msgSend(v4, "hasDayOfMonth"))
    {
      dayOfMonth = self->_dayOfMonth;
      if (dayOfMonth != objc_msgSend(v4, "dayOfMonth"))
        goto LABEL_15;
    }
  }
  if ((v7 = -[_INPBLocalDate hasDayOfWeek](self, "hasDayOfWeek"), v7 == objc_msgSend(v4, "hasDayOfWeek"))
    && (!-[_INPBLocalDate hasDayOfWeek](self, "hasDayOfWeek")
     || !objc_msgSend(v4, "hasDayOfWeek")
     || (dayOfWeek = self->_dayOfWeek, dayOfWeek == objc_msgSend(v4, "dayOfWeek")))
    && (v9 = -[_INPBLocalDate hasMonth](self, "hasMonth"), v9 == objc_msgSend(v4, "hasMonth"))
    && (!-[_INPBLocalDate hasMonth](self, "hasMonth")
     || !objc_msgSend(v4, "hasMonth")
     || (month = self->_month, month == objc_msgSend(v4, "month")))
    && (v11 = -[_INPBLocalDate hasYear](self, "hasYear"), v11 == objc_msgSend(v4, "hasYear"))
    && (!-[_INPBLocalDate hasYear](self, "hasYear")
     || !objc_msgSend(v4, "hasYear")
     || (year = self->_year, year == objc_msgSend(v4, "year"))))
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

  if (-[_INPBLocalDate hasDayOfMonth](self, "hasDayOfMonth"))
    v3 = 2654435761 * self->_dayOfMonth;
  else
    v3 = 0;
  if (-[_INPBLocalDate hasDayOfWeek](self, "hasDayOfWeek"))
    v4 = 2654435761 * self->_dayOfWeek;
  else
    v4 = 0;
  if (-[_INPBLocalDate hasMonth](self, "hasMonth"))
    v5 = 2654435761 * self->_month;
  else
    v5 = 0;
  if (-[_INPBLocalDate hasYear](self, "hasYear"))
    v6 = 2654435761 * self->_year;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBLocalDate hasDayOfMonth](self, "hasDayOfMonth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBLocalDate dayOfMonth](self, "dayOfMonth"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("dayOfMonth"));

  }
  if (-[_INPBLocalDate hasDayOfWeek](self, "hasDayOfWeek"))
  {
    v5 = -[_INPBLocalDate dayOfWeek](self, "dayOfWeek");
    if (v5 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = *(&off_1E228DB28 + v5);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dayOfWeek"));

  }
  if (-[_INPBLocalDate hasMonth](self, "hasMonth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBLocalDate month](self, "month"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("month"));

  }
  if (-[_INPBLocalDate hasYear](self, "hasYear"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBLocalDate year](self, "year"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("year"));

  }
  return v3;
}

- (int64_t)dayOfMonth
{
  return self->_dayOfMonth;
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int64_t)month
{
  return self->_month;
}

- (int64_t)year
{
  return self->_year;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
