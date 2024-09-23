@implementation HKCodableDateComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)setYear:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_year = a3;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void)setMonth:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_month = a3;
}

- (void)setEra:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_era = a3;
}

- (void)setDay:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_day = a3;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  has = (__int16)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_16:
  if (self->_calendar)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_timeZone)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)setHasEra:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEra
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasYear:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasYear
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasMonth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMonth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasDay:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDay
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHour:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hour = a3;
}

- (void)setHasHour:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHour
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMinute:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_minute = a3;
}

- (void)setHasMinute:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMinute
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSecond:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_second = a3;
}

- (void)setHasSecond:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSecond
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWeekday:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_weekday = a3;
}

- (void)setHasWeekday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWeekday
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setWeekdayOrdinal:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_weekdayOrdinal = a3;
}

- (void)setHasWeekdayOrdinal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWeekdayOrdinal
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setQuarter:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_quarter = a3;
}

- (void)setHasQuarter:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQuarter
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setWeekOfMonth:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_weekOfMonth = a3;
}

- (void)setHasWeekOfMonth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWeekOfMonth
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWeekOfYear:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_weekOfYear = a3;
}

- (void)setHasWeekOfYear:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWeekOfYear
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setYearForWeekOfYear:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_yearForWeekOfYear = a3;
}

- (void)setHasYearForWeekOfYear:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasYearForWeekOfYear
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setNanosecond:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_nanosecond = a3;
}

- (void)setHasNanosecond:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNanosecond
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasCalendar
{
  return self->_calendar != 0;
}

- (BOOL)hasTimeZone
{
  return self->_timeZone != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKCodableDateComponents;
  -[HKCodableDateComponents description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableDateComponents dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSString *calendar;
  NSString *timeZone;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_era);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("era"));

    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_year);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("year"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_month);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("month"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_day);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("day"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_hour);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("hour"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minute);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("minute"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_second);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("second"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_weekday);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("weekday"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_weekdayOrdinal);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("weekdayOrdinal"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_quarter);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("quarter"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_weekOfMonth);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("weekOfMonth"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_weekOfYear);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("weekOfYear"));

  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_yearForWeekOfYear);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("yearForWeekOfYear"));

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_nanosecond);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("nanosecond"));

  }
LABEL_16:
  calendar = self->_calendar;
  if (calendar)
    objc_msgSend(v3, "setObject:forKey:", calendar, CFSTR("calendar"));
  timeZone = self->_timeZone;
  if (timeZone)
    objc_msgSend(v3, "setObject:forKey:", timeZone, CFSTR("timeZone"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableDateComponentsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
  _QWORD *v6;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_era;
    *((_WORD *)v4 + 68) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_year;
  *((_WORD *)v4 + 68) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  v4[5] = self->_month;
  *((_WORD *)v4 + 68) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  v4[1] = self->_day;
  *((_WORD *)v4 + 68) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  v4[3] = self->_hour;
  *((_WORD *)v4 + 68) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  v4[4] = self->_minute;
  *((_WORD *)v4 + 68) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v4[8] = self->_second;
  *((_WORD *)v4 + 68) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  v4[11] = self->_weekday;
  *((_WORD *)v4 + 68) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  v4[12] = self->_weekdayOrdinal;
  *((_WORD *)v4 + 68) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  v4[7] = self->_quarter;
  *((_WORD *)v4 + 68) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  v4[9] = self->_weekOfMonth;
  *((_WORD *)v4 + 68) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  v4[10] = self->_weekOfYear;
  *((_WORD *)v4 + 68) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_33:
  v4[14] = self->_yearForWeekOfYear;
  *((_WORD *)v4 + 68) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    v4[6] = self->_nanosecond;
    *((_WORD *)v4 + 68) |= 0x20u;
  }
LABEL_16:
  v6 = v4;
  if (self->_calendar)
  {
    objc_msgSend(v4, "setCalendar:");
    v4 = v6;
  }
  if (self->_timeZone)
  {
    objc_msgSend(v6, "setTimeZone:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  __int16 has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_era;
    *(_WORD *)(v5 + 136) |= 2u;
    has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 104) = self->_year;
  *(_WORD *)(v5 + 136) |= 0x1000u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *(_QWORD *)(v5 + 40) = self->_month;
  *(_WORD *)(v5 + 136) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *(_QWORD *)(v5 + 8) = self->_day;
  *(_WORD *)(v5 + 136) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *(_QWORD *)(v5 + 24) = self->_hour;
  *(_WORD *)(v5 + 136) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *(_QWORD *)(v5 + 32) = self->_minute;
  *(_WORD *)(v5 + 136) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_QWORD *)(v5 + 64) = self->_second;
  *(_WORD *)(v5 + 136) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *(_QWORD *)(v5 + 88) = self->_weekday;
  *(_WORD *)(v5 + 136) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *(_QWORD *)(v5 + 96) = self->_weekdayOrdinal;
  *(_WORD *)(v5 + 136) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *(_QWORD *)(v5 + 56) = self->_quarter;
  *(_WORD *)(v5 + 136) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *(_QWORD *)(v5 + 72) = self->_weekOfMonth;
  *(_WORD *)(v5 + 136) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0)
      goto LABEL_14;
LABEL_29:
    *(_QWORD *)(v5 + 112) = self->_yearForWeekOfYear;
    *(_WORD *)(v5 + 136) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  *(_QWORD *)(v5 + 80) = self->_weekOfYear;
  *(_WORD *)(v5 + 136) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
    goto LABEL_29;
LABEL_14:
  if ((has & 0x20) != 0)
  {
LABEL_15:
    *(_QWORD *)(v5 + 48) = self->_nanosecond;
    *(_WORD *)(v5 + 136) |= 0x20u;
  }
LABEL_16:
  v8 = -[NSString copyWithZone:](self->_calendar, "copyWithZone:", a3);
  v9 = (void *)v6[15];
  v6[15] = v8;

  v10 = -[NSString copyWithZone:](self->_timeZone, "copyWithZone:", a3);
  v11 = (void *)v6[16];
  v6[16] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSString *calendar;
  NSString *timeZone;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_76;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 68);
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_era != *((_QWORD *)v4 + 2))
      goto LABEL_76;
  }
  else if ((v6 & 2) != 0)
  {
LABEL_76:
    v9 = 0;
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x1000) == 0 || self->_year != *((_QWORD *)v4 + 13))
      goto LABEL_76;
  }
  else if ((*((_WORD *)v4 + 68) & 0x1000) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_month != *((_QWORD *)v4 + 5))
      goto LABEL_76;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_day != *((_QWORD *)v4 + 1))
      goto LABEL_76;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_hour != *((_QWORD *)v4 + 3))
      goto LABEL_76;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_minute != *((_QWORD *)v4 + 4))
      goto LABEL_76;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_second != *((_QWORD *)v4 + 8))
      goto LABEL_76;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x400) == 0 || self->_weekday != *((_QWORD *)v4 + 11))
      goto LABEL_76;
  }
  else if ((*((_WORD *)v4 + 68) & 0x400) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x800) == 0 || self->_weekdayOrdinal != *((_QWORD *)v4 + 12))
      goto LABEL_76;
  }
  else if ((*((_WORD *)v4 + 68) & 0x800) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_quarter != *((_QWORD *)v4 + 7))
      goto LABEL_76;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x100) == 0 || self->_weekOfMonth != *((_QWORD *)v4 + 9))
      goto LABEL_76;
  }
  else if ((*((_WORD *)v4 + 68) & 0x100) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x200) == 0 || self->_weekOfYear != *((_QWORD *)v4 + 10))
      goto LABEL_76;
  }
  else if ((*((_WORD *)v4 + 68) & 0x200) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x2000) == 0 || self->_yearForWeekOfYear != *((_QWORD *)v4 + 14))
      goto LABEL_76;
  }
  else if ((*((_WORD *)v4 + 68) & 0x2000) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_nanosecond != *((_QWORD *)v4 + 6))
      goto LABEL_76;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_76;
  }
  calendar = self->_calendar;
  if ((unint64_t)calendar | *((_QWORD *)v4 + 15) && !-[NSString isEqual:](calendar, "isEqual:"))
    goto LABEL_76;
  timeZone = self->_timeZone;
  if ((unint64_t)timeZone | *((_QWORD *)v4 + 16))
    v9 = -[NSString isEqual:](timeZone, "isEqual:");
  else
    v9 = 1;
LABEL_77:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;

  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4 = 2654435761 * self->_era;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_year;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_month;
    if ((has & 1) != 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v6 = 0;
  if ((has & 1) != 0)
  {
LABEL_5:
    v7 = 2654435761 * self->_day;
    if ((has & 4) != 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    v8 = 2654435761 * self->_hour;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_minute;
    if ((has & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_second;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    v11 = 2654435761 * self->_weekday;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  v11 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_10:
    v12 = 2654435761 * self->_weekdayOrdinal;
    if ((has & 0x40) != 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_11:
    v13 = 2654435761 * self->_quarter;
    if ((has & 0x100) != 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  v13 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_12:
    v14 = 2654435761 * self->_weekOfMonth;
    if ((has & 0x200) != 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  v14 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_13:
    v15 = 2654435761 * self->_weekOfYear;
    if ((has & 0x2000) != 0)
      goto LABEL_14;
LABEL_28:
    v16 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_15;
LABEL_29:
    v17 = 0;
    goto LABEL_30;
  }
LABEL_27:
  v15 = 0;
  if ((has & 0x2000) == 0)
    goto LABEL_28;
LABEL_14:
  v16 = 2654435761 * self->_yearForWeekOfYear;
  if ((has & 0x20) == 0)
    goto LABEL_29;
LABEL_15:
  v17 = 2654435761 * self->_nanosecond;
LABEL_30:
  v18 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ -[NSString hash](self->_calendar, "hash");
  return v18 ^ -[NSString hash](self->_timeZone, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;

  v4 = a3;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 2) != 0)
  {
    self->_era = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    v5 = *((_WORD *)v4 + 68);
    if ((v5 & 0x1000) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)v4 + 68) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_year = *((_QWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_month = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_day = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_hour = *((_QWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_minute = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_second = *((_QWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 0x800) == 0)
      goto LABEL_10;
    goto LABEL_29;
  }
LABEL_28:
  self->_weekday = *((_QWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x800) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_30;
  }
LABEL_29:
  self->_weekdayOrdinal = *((_QWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_30:
  self->_quarter = *((_QWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  self->_weekOfMonth = *((_QWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  self->_weekOfYear = *((_QWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_33:
  self->_yearForWeekOfYear = *((_QWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 68) & 0x20) != 0)
  {
LABEL_15:
    self->_nanosecond = *((_QWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_16:
  v6 = v4;
  if (*((_QWORD *)v4 + 15))
  {
    -[HKCodableDateComponents setCalendar:](self, "setCalendar:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 16))
  {
    -[HKCodableDateComponents setTimeZone:](self, "setTimeZone:");
    v4 = v6;
  }

}

- (int64_t)era
{
  return self->_era;
}

- (int64_t)year
{
  return self->_year;
}

- (int64_t)month
{
  return self->_month;
}

- (int64_t)day
{
  return self->_day;
}

- (int64_t)hour
{
  return self->_hour;
}

- (int64_t)minute
{
  return self->_minute;
}

- (int64_t)second
{
  return self->_second;
}

- (int64_t)weekday
{
  return self->_weekday;
}

- (int64_t)weekdayOrdinal
{
  return self->_weekdayOrdinal;
}

- (int64_t)quarter
{
  return self->_quarter;
}

- (int64_t)weekOfMonth
{
  return self->_weekOfMonth;
}

- (int64_t)weekOfYear
{
  return self->_weekOfYear;
}

- (int64_t)yearForWeekOfYear
{
  return self->_yearForWeekOfYear;
}

- (int64_t)nanosecond
{
  return self->_nanosecond;
}

- (NSString)calendar
{
  return self->_calendar;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

@end
