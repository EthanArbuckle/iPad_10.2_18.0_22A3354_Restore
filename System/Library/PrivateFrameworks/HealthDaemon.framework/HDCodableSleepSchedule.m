@implementation HDCodableSleepSchedule

- (BOOL)applyToObject:(id)a3
{
  BOOL v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v3 = -[HDCodableSleepSchedule applyToObject:error:](self, "applyToObject:error:", a3, &v7);
  v4 = v7;
  if (!v3)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Failed to decode object of type HKSleepSchedule with error %@", buf, 0xCu);
    }
  }

  return v3;
}

- (BOOL)applyToObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_assignError:code:format:", a4, 3, CFSTR("Unexpected class %@"), v15);

LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  -[HDCodableSleepSchedule sample](self, "sample");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "applyToObject:", v6);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Failed to decode superclass message"));
    goto LABEL_14;
  }
  -[HDCodableSleepSchedule monday](self, "monday");
  -[HDCodableSleepSchedule tuesday](self, "tuesday");
  -[HDCodableSleepSchedule wednesday](self, "wednesday");
  -[HDCodableSleepSchedule thursday](self, "thursday");
  -[HDCodableSleepSchedule friday](self, "friday");
  -[HDCodableSleepSchedule saturday](self, "saturday");
  -[HDCodableSleepSchedule sunday](self, "sunday");
  objc_msgSend(v6, "_setWeekdays:", HKSleepScheduleWeekdaysMake());
  if (-[HDCodableSleepSchedule hasWakeHour](self, "hasWakeHour")
    && -[HDCodableSleepSchedule hasWakeMinute](self, "hasWakeMinute"))
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithHour:minute:", -[HDCodableSleepSchedule wakeHour](self, "wakeHour"), -[HDCodableSleepSchedule wakeMinute](self, "wakeMinute"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setWakeTimeComponents:", v9);

  }
  if (-[HDCodableSleepSchedule hasBedHour](self, "hasBedHour")
    && -[HDCodableSleepSchedule hasBedMinute](self, "hasBedMinute"))
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_componentsWithHour:minute:", -[HDCodableSleepSchedule bedHour](self, "bedHour"), -[HDCodableSleepSchedule bedMinute](self, "bedMinute"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setBedTimeComponents:", v10);

  }
  if (-[HDCodableSleepSchedule hasOverrideDayIndex](self, "hasOverrideDayIndex"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDCodableSleepSchedule overrideDayIndex](self, "overrideDayIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setOverrideDayIndex:", v11);

  }
  v12 = 1;
LABEL_15:

  return v12;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setMonday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_monday = a3;
}

- (void)setHasMonday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMonday
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTuesday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_tuesday = a3;
}

- (void)setHasTuesday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTuesday
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setWednesday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_wednesday = a3;
}

- (void)setHasWednesday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWednesday
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setThursday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_thursday = a3;
}

- (void)setHasThursday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasThursday
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setFriday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_friday = a3;
}

- (void)setHasFriday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFriday
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSaturday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_saturday = a3;
}

- (void)setHasSaturday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSaturday
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSunday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sunday = a3;
}

- (void)setHasSunday:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSunday
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWakeHour:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_wakeHour = a3;
}

- (void)setHasWakeHour:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasWakeHour
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setWakeMinute:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_wakeMinute = a3;
}

- (void)setHasWakeMinute:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasWakeMinute
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setBedHour:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bedHour = a3;
}

- (void)setHasBedHour:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBedHour
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBedMinute:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bedMinute = a3;
}

- (void)setHasBedMinute:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBedMinute
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setOverrideDayIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_overrideDayIndex = a3;
}

- (void)setHasOverrideDayIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasOverrideDayIndex
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSleepSchedule;
  -[HDCodableSleepSchedule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSleepSchedule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  __int16 has;
  void *v7;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_monday);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("monday"));

    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_tuesday);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("tuesday"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_wednesday);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("wednesday"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_thursday);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("thursday"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_friday);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("friday"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_saturday);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("saturday"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sunday);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sunday"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_wakeHour);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("wakeHour"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_wakeMinute);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("wakeMinute"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_bedMinute);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("bedMinute"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_15;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_bedHour);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("bedHour"));

  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_27;
LABEL_14:
  if ((has & 4) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_overrideDayIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("overrideDayIndex"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSleepScheduleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
LABEL_27:
    PBDataWriterWriteInt64Field();
    v4 = v6;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_27;
LABEL_14:
  if ((has & 4) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_16:

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  id v6;

  v4 = a3;
  if (self->_sample)
  {
    v6 = v4;
    objc_msgSend(v4, "setSample:");
    v4 = v6;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_BYTE *)v4 + 57) = self->_monday;
    *((_WORD *)v4 + 32) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 61) = self->_tuesday;
  *((_WORD *)v4 + 32) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)v4 + 62) = self->_wednesday;
  *((_WORD *)v4 + 32) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_BYTE *)v4 + 60) = self->_thursday;
  *((_WORD *)v4 + 32) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_BYTE *)v4 + 56) = self->_friday;
  *((_WORD *)v4 + 32) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)v4 + 58) = self->_saturday;
  *((_WORD *)v4 + 32) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_BYTE *)v4 + 59) = self->_sunday;
  *((_WORD *)v4 + 32) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_QWORD *)v4 + 4) = self->_wakeHour;
  *((_WORD *)v4 + 32) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)v4 + 5) = self->_wakeMinute;
  *((_WORD *)v4 + 32) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0)
      goto LABEL_14;
LABEL_27:
    *((_QWORD *)v4 + 2) = self->_bedMinute;
    *((_WORD *)v4 + 32) |= 2u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_26:
  *((_QWORD *)v4 + 1) = self->_bedHour;
  *((_WORD *)v4 + 32) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_27;
LABEL_14:
  if ((has & 4) != 0)
  {
LABEL_15:
    *((_QWORD *)v4 + 3) = self->_overrideDayIndex;
    *((_WORD *)v4 + 32) |= 4u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  __int16 has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 57) = self->_monday;
    *(_WORD *)(v5 + 64) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 61) = self->_tuesday;
  *(_WORD *)(v5 + 64) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *(_BYTE *)(v5 + 62) = self->_wednesday;
  *(_WORD *)(v5 + 64) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *(_BYTE *)(v5 + 60) = self->_thursday;
  *(_WORD *)(v5 + 64) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *(_BYTE *)(v5 + 56) = self->_friday;
  *(_WORD *)(v5 + 64) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *(_BYTE *)(v5 + 58) = self->_saturday;
  *(_WORD *)(v5 + 64) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *(_BYTE *)(v5 + 59) = self->_sunday;
  *(_WORD *)(v5 + 64) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *(_QWORD *)(v5 + 32) = self->_wakeHour;
  *(_WORD *)(v5 + 64) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 1) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *(_QWORD *)(v5 + 40) = self->_wakeMinute;
  *(_WORD *)(v5 + 64) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      goto LABEL_12;
LABEL_25:
    *(_QWORD *)(v5 + 16) = self->_bedMinute;
    *(_WORD *)(v5 + 64) |= 2u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_13;
  }
LABEL_24:
  *(_QWORD *)(v5 + 8) = self->_bedHour;
  *(_WORD *)(v5 + 64) |= 1u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 4) != 0)
  {
LABEL_13:
    *(_QWORD *)(v5 + 24) = self->_overrideDayIndex;
    *(_WORD *)(v5 + 64) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  __int16 has;
  __int16 v7;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_85;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 6))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_85;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 32);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_85;
    if (self->_monday)
    {
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 57))
    {
      goto LABEL_85;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0)
      goto LABEL_85;
    if (self->_tuesday)
    {
      if (!*((_BYTE *)v4 + 61))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 61))
    {
      goto LABEL_85;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x800) == 0)
      goto LABEL_85;
    if (self->_wednesday)
    {
      if (!*((_BYTE *)v4 + 62))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 62))
    {
      goto LABEL_85;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x800) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0)
      goto LABEL_85;
    if (self->_thursday)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_85;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_85;
    if (self->_friday)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_85;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_85;
    if (self->_saturday)
    {
      if (!*((_BYTE *)v4 + 58))
        goto LABEL_85;
    }
    else if (*((_BYTE *)v4 + 58))
    {
      goto LABEL_85;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) != 0)
    {
      if (self->_sunday)
      {
        if (!*((_BYTE *)v4 + 59))
          goto LABEL_85;
        goto LABEL_60;
      }
      if (!*((_BYTE *)v4 + 59))
        goto LABEL_60;
    }
LABEL_85:
    v8 = 0;
    goto LABEL_86;
  }
  if ((*((_WORD *)v4 + 32) & 0x100) != 0)
    goto LABEL_85;
LABEL_60:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_wakeHour != *((_QWORD *)v4 + 4))
      goto LABEL_85;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_wakeMinute != *((_QWORD *)v4 + 5))
      goto LABEL_85;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_bedHour != *((_QWORD *)v4 + 1))
      goto LABEL_85;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bedMinute != *((_QWORD *)v4 + 2))
      goto LABEL_85;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_overrideDayIndex != *((_QWORD *)v4 + 3))
      goto LABEL_85;
    v8 = 1;
  }
  else
  {
    v8 = (v7 & 4) == 0;
  }
LABEL_86:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  __int16 has;
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

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v5 = 2654435761 * self->_monday;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_tuesday;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_wednesday;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_thursday;
    if ((has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_friday;
    if ((has & 0x80) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_saturday;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_sunday;
    if ((has & 8) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v11 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_wakeHour;
    if ((has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    v13 = 2654435761 * self->_wakeMinute;
    if ((has & 1) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v13 = 0;
  if ((has & 1) != 0)
  {
LABEL_11:
    v14 = 2654435761 * self->_bedHour;
    if ((has & 2) != 0)
      goto LABEL_12;
LABEL_24:
    v15 = 0;
    if ((has & 4) != 0)
      goto LABEL_13;
LABEL_25:
    v16 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_23:
  v14 = 0;
  if ((has & 2) == 0)
    goto LABEL_24;
LABEL_12:
  v15 = 2654435761 * self->_bedMinute;
  if ((has & 4) == 0)
    goto LABEL_25;
LABEL_13:
  v16 = 2654435761 * self->_overrideDayIndex;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  __int16 v7;
  id v8;

  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 6);
  if (sample)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HDCodableSleepSchedule setSample:](self, "setSample:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x40) != 0)
  {
    self->_monday = *((_BYTE *)v4 + 57);
    *(_WORD *)&self->_has |= 0x40u;
    v7 = *((_WORD *)v4 + 32);
    if ((v7 & 0x400) == 0)
    {
LABEL_9:
      if ((v7 & 0x800) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) == 0)
  {
    goto LABEL_9;
  }
  self->_tuesday = *((_BYTE *)v4 + 61);
  *(_WORD *)&self->_has |= 0x400u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x800) == 0)
  {
LABEL_10:
    if ((v7 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_wednesday = *((_BYTE *)v4 + 62);
  *(_WORD *)&self->_has |= 0x800u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x200) == 0)
  {
LABEL_11:
    if ((v7 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  self->_thursday = *((_BYTE *)v4 + 60);
  *(_WORD *)&self->_has |= 0x200u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x20) == 0)
  {
LABEL_12:
    if ((v7 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_26;
  }
LABEL_25:
  self->_friday = *((_BYTE *)v4 + 56);
  *(_WORD *)&self->_has |= 0x20u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x80) == 0)
  {
LABEL_13:
    if ((v7 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_27;
  }
LABEL_26:
  self->_saturday = *((_BYTE *)v4 + 58);
  *(_WORD *)&self->_has |= 0x80u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x100) == 0)
  {
LABEL_14:
    if ((v7 & 8) == 0)
      goto LABEL_15;
    goto LABEL_28;
  }
LABEL_27:
  self->_sunday = *((_BYTE *)v4 + 59);
  *(_WORD *)&self->_has |= 0x100u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 8) == 0)
  {
LABEL_15:
    if ((v7 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_29;
  }
LABEL_28:
  self->_wakeHour = *((_QWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x10) == 0)
  {
LABEL_16:
    if ((v7 & 1) == 0)
      goto LABEL_17;
    goto LABEL_30;
  }
LABEL_29:
  self->_wakeMinute = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 1) == 0)
  {
LABEL_17:
    if ((v7 & 2) == 0)
      goto LABEL_18;
LABEL_31:
    self->_bedMinute = *((_QWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    if ((*((_WORD *)v4 + 32) & 4) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_30:
  self->_bedHour = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v7 = *((_WORD *)v4 + 32);
  if ((v7 & 2) != 0)
    goto LABEL_31;
LABEL_18:
  if ((v7 & 4) != 0)
  {
LABEL_19:
    self->_overrideDayIndex = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_20:

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (BOOL)monday
{
  return self->_monday;
}

- (BOOL)tuesday
{
  return self->_tuesday;
}

- (BOOL)wednesday
{
  return self->_wednesday;
}

- (BOOL)thursday
{
  return self->_thursday;
}

- (BOOL)friday
{
  return self->_friday;
}

- (BOOL)saturday
{
  return self->_saturday;
}

- (BOOL)sunday
{
  return self->_sunday;
}

- (int64_t)wakeHour
{
  return self->_wakeHour;
}

- (int64_t)wakeMinute
{
  return self->_wakeMinute;
}

- (int64_t)bedHour
{
  return self->_bedHour;
}

- (int64_t)bedMinute
{
  return self->_bedMinute;
}

- (int64_t)overrideDayIndex
{
  return self->_overrideDayIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
