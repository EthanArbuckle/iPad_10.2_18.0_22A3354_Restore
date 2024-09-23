@implementation _INPBRecurrenceValue

- (void)setFrequency:(int)a3
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
    self->_frequency = a3;
  }
}

- (BOOL)hasFrequency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)frequencyAsString:(int)a3
{
  __CFString *v3;

  if (a3 <= 49)
  {
    switch(a3)
    {
      case 0:
        return CFSTR("UNKNOWN");
      case 30:
        return CFSTR("MINUTE");
      case 40:
        return CFSTR("HOURLY");
    }
    goto LABEL_18;
  }
  if (a3 > 79)
  {
    if (a3 == 80)
      return CFSTR("MONTHLY");
    if (a3 == 110)
      return CFSTR("YEARLY");
    goto LABEL_18;
  }
  if (a3 == 50)
    return CFSTR("DAILY");
  if (a3 != 60)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("WEEKLY");
  return v3;
}

- (int)StringAsFrequency:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MINUTE")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOURLY")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAILY")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEEKLY")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONTHLY")) & 1) != 0)
  {
    v4 = 80;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("YEARLY")))
  {
    v4 = 110;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setInterval:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_interval = a3;
}

- (BOOL)hasInterval
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setOrdinal:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_ordinal = a3;
}

- (BOOL)hasOrdinal
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasOrdinal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setWeeklyRecurrenceDays:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)weeklyRecurrenceDays
{
  return self->_weeklyRecurrenceDays.list;
}

- (void)clearWeeklyRecurrenceDays
{
  PBRepeatedInt32Clear();
}

- (void)addWeeklyRecurrenceDays:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)weeklyRecurrenceDaysCount
{
  return self->_weeklyRecurrenceDays.count;
}

- (int)weeklyRecurrenceDaysAtIndex:(unint64_t)a3
{
  return self->_weeklyRecurrenceDays.list[a3];
}

- (id)weeklyRecurrenceDaysAsString:(int)a3
{
  if (a3 < 8)
    return off_1E228E0F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWeeklyRecurrenceDays:(id)a3
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

- (BOOL)readFrom:(id)a3
{
  return _INPBRecurrenceValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_weeklyRecurrenceDays;
  void *v5;
  unint64_t v6;
  id v7;

  v7 = a3;
  if (-[_INPBRecurrenceValue hasFrequency](self, "hasFrequency"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBRecurrenceValue hasInterval](self, "hasInterval"))
    PBDataWriterWriteUint64Field();
  if (-[_INPBRecurrenceValue hasOrdinal](self, "hasOrdinal"))
    PBDataWriterWriteInt64Field();
  p_weeklyRecurrenceDays = &self->_weeklyRecurrenceDays;
  v5 = v7;
  if (p_weeklyRecurrenceDays->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v7;
      ++v6;
    }
    while (v6 < p_weeklyRecurrenceDays->count);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBRecurrenceValue clearWeeklyRecurrenceDays](self, "clearWeeklyRecurrenceDays");
  v3.receiver = self;
  v3.super_class = (Class)_INPBRecurrenceValue;
  -[_INPBRecurrenceValue dealloc](&v3, sel_dealloc);
}

- (_INPBRecurrenceValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRecurrenceValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRecurrenceValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRecurrenceValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRecurrenceValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBRecurrenceValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRecurrenceValue *v4;

  v4 = -[_INPBRecurrenceValue init](+[_INPBRecurrenceValue allocWithZone:](_INPBRecurrenceValue, "allocWithZone:", a3), "init");
  if (-[_INPBRecurrenceValue hasFrequency](self, "hasFrequency"))
    -[_INPBRecurrenceValue setFrequency:](v4, "setFrequency:", -[_INPBRecurrenceValue frequency](self, "frequency"));
  if (-[_INPBRecurrenceValue hasInterval](self, "hasInterval"))
    -[_INPBRecurrenceValue setInterval:](v4, "setInterval:", -[_INPBRecurrenceValue interval](self, "interval"));
  if (-[_INPBRecurrenceValue hasOrdinal](self, "hasOrdinal"))
    -[_INPBRecurrenceValue setOrdinal:](v4, "setOrdinal:", -[_INPBRecurrenceValue ordinal](self, "ordinal"));
  PBRepeatedInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int frequency;
  int v7;
  unint64_t interval;
  int v9;
  char IsEqual;
  int64_t ordinal;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v5 = -[_INPBRecurrenceValue hasFrequency](self, "hasFrequency"),
        v5 == objc_msgSend(v4, "hasFrequency"))
    && (!-[_INPBRecurrenceValue hasFrequency](self, "hasFrequency")
     || !objc_msgSend(v4, "hasFrequency")
     || (frequency = self->_frequency, frequency == objc_msgSend(v4, "frequency")))
    && (v7 = -[_INPBRecurrenceValue hasInterval](self, "hasInterval"),
        v7 == objc_msgSend(v4, "hasInterval"))
    && (!-[_INPBRecurrenceValue hasInterval](self, "hasInterval")
     || !objc_msgSend(v4, "hasInterval")
     || (interval = self->_interval, interval == objc_msgSend(v4, "interval")))
    && (v9 = -[_INPBRecurrenceValue hasOrdinal](self, "hasOrdinal"), v9 == objc_msgSend(v4, "hasOrdinal"))
    && (!-[_INPBRecurrenceValue hasOrdinal](self, "hasOrdinal")
     || !objc_msgSend(v4, "hasOrdinal")
     || (ordinal = self->_ordinal, ordinal == objc_msgSend(v4, "ordinal"))))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (-[_INPBRecurrenceValue hasFrequency](self, "hasFrequency"))
    v3 = 2654435761 * self->_frequency;
  else
    v3 = 0;
  if (-[_INPBRecurrenceValue hasInterval](self, "hasInterval"))
    v4 = 2654435761u * self->_interval;
  else
    v4 = 0;
  if (-[_INPBRecurrenceValue hasOrdinal](self, "hasOrdinal"))
    v5 = 2654435761 * self->_ordinal;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBRecurrenceValue hasFrequency](self, "hasFrequency"))
  {
    v4 = -[_INPBRecurrenceValue frequency](self, "frequency");
    if ((int)v4 <= 49)
    {
      switch((_DWORD)v4)
      {
        case 0:
          v5 = CFSTR("UNKNOWN");
          goto LABEL_19;
        case 0x1E:
          v5 = CFSTR("MINUTE");
          goto LABEL_19;
        case 0x28:
          v5 = CFSTR("HOURLY");
          goto LABEL_19;
      }
    }
    else if ((int)v4 > 79)
    {
      if ((_DWORD)v4 == 80)
      {
        v5 = CFSTR("MONTHLY");
        goto LABEL_19;
      }
      if ((_DWORD)v4 == 110)
      {
        v5 = CFSTR("YEARLY");
        goto LABEL_19;
      }
    }
    else
    {
      if ((_DWORD)v4 == 50)
      {
        v5 = CFSTR("DAILY");
        goto LABEL_19;
      }
      if ((_DWORD)v4 == 60)
      {
        v5 = CFSTR("WEEKLY");
LABEL_19:
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("frequency"));

        goto LABEL_20;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_20:
  if (-[_INPBRecurrenceValue hasInterval](self, "hasInterval"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_INPBRecurrenceValue interval](self, "interval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("interval"));

  }
  if (-[_INPBRecurrenceValue hasOrdinal](self, "hasOrdinal"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[_INPBRecurrenceValue ordinal](self, "ordinal"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ordinal"));

  }
  if (self->_weeklyRecurrenceDays.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBRecurrenceValue weeklyRecurrenceDaysCount](self, "weeklyRecurrenceDaysCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBRecurrenceValue weeklyRecurrenceDaysCount](self, "weeklyRecurrenceDaysCount"))
    {
      v9 = 0;
      do
      {
        v10 = self->_weeklyRecurrenceDays.list[v9];
        if (v10 >= 8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_weeklyRecurrenceDays.list[v9]);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E228E0F8[v10];
        }
        objc_msgSend(v8, "addObject:", v11);

        ++v9;
      }
      while (v9 < -[_INPBRecurrenceValue weeklyRecurrenceDaysCount](self, "weeklyRecurrenceDaysCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("weeklyRecurrenceDays"));

  }
  return v3;
}

- (int)frequency
{
  return self->_frequency;
}

- (unint64_t)interval
{
  return self->_interval;
}

- (int64_t)ordinal
{
  return self->_ordinal;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
