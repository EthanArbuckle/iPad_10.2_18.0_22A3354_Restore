@implementation MTPBAlarmProperties

- (BOOL)hasAlarmID
{
  return self->_alarmID != 0;
}

- (void)setHour:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_hour = a3;
}

- (void)setHasHour:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasHour
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMinute:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_minute = a3;
}

- (void)setHasMinute:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMinute
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setAllowsSnooze:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_allowsSnooze = a3;
}

- (void)setHasAllowsSnooze:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasAllowsSnooze
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setDaySetting:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_daySetting = a3;
}

- (void)setHasDaySetting:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasDaySetting
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasSound
{
  return self->_sound != 0;
}

- (void)setIsSleepAlarm:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isSleepAlarm = a3;
}

- (void)setHasIsSleepAlarm:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsSleepAlarm
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setBedtimeHour:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_bedtimeHour = a3;
}

- (void)setHasBedtimeHour:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasBedtimeHour
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBedtimeMinute:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_bedtimeMinute = a3;
}

- (void)setHasBedtimeMinute:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasBedtimeMinute
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBedtimeReminderMinutes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_bedtimeReminderMinutes = a3;
}

- (void)setHasBedtimeReminderMinutes:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasBedtimeReminderMinutes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRevision:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_revision = a3;
}

- (void)setHasRevision:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRevision
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setLastModifiedDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_lastModifiedDate = a3;
}

- (void)setHasLastModifiedDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasLastModifiedDate
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setSnoozeFireDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_snoozeFireDate = a3;
}

- (void)setHasSnoozeFireDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSnoozeFireDate
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setBedtimeSnoozeFireDate:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_bedtimeSnoozeFireDate = a3;
}

- (void)setHasBedtimeSnoozeFireDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBedtimeSnoozeFireDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setFiredDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_firedDate = a3;
}

- (void)setHasFiredDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFiredDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDismissedDate:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_dismissedDate = a3;
}

- (void)setHasDismissedDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDismissedDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSleepMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_sleepMode = a3;
}

- (void)setHasSleepMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSleepMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSleepTracking:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_sleepTracking = a3;
}

- (void)setHasSleepTracking:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasSleepTracking
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setSleepSchedule:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_sleepSchedule = a3;
}

- (void)setHasSleepSchedule:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSleepSchedule
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setOnboardingVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_onboardingVersion = a3;
}

- (void)setHasOnboardingVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasOnboardingVersion
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSleepModeOptions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_sleepModeOptions = a3;
}

- (void)setHasSleepModeOptions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSleepModeOptions
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTimeInBedTracking:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_timeInBedTracking = a3;
}

- (void)setHasTimeInBedTracking:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTimeInBedTracking
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setDismissedAction:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_dismissedAction = a3;
}

- (void)setHasDismissedAction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasDismissedAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBedtimeFiredDate:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_bedtimeFiredDate = a3;
}

- (void)setHasBedtimeFiredDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBedtimeFiredDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBedtimeDismissedDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_bedtimeDismissedDate = a3;
}

- (void)setHasBedtimeDismissedDate:(BOOL)a3
{
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBedtimeDismissedDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBedtimeDismissedAction:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_bedtimeDismissedAction = a3;
}

- (void)setHasBedtimeDismissedAction:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasBedtimeDismissedAction
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setKeepOffUntilDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_keepOffUntilDate = a3;
}

- (void)setHasKeepOffUntilDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($BBB132571B1AAF0C189DBE8BAD1A045E)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasKeepOffUntilDate
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)MTPBAlarmProperties;
  -[MTPBAlarmProperties description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPBAlarmProperties dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *alarmID;
  $BBB132571B1AAF0C189DBE8BAD1A045E has;
  void *v7;
  void *v8;
  NSString *title;
  $BBB132571B1AAF0C189DBE8BAD1A045E v10;
  void *v11;
  void *v12;
  MTPBSound *sound;
  void *v14;
  $BBB132571B1AAF0C189DBE8BAD1A045E v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  alarmID = self->_alarmID;
  if (alarmID)
    objc_msgSend(v3, "setObject:forKey:", alarmID, CFSTR("alarmID"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hour);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("hour"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_minute);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("minute"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowsSnooze);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("allowsSnooze"));

    v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_daySetting);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("daySetting"));

  }
  sound = self->_sound;
  if (sound)
  {
    -[MTPBSound dictionaryRepresentation](sound, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("sound"));

  }
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSleepAlarm);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("isSleepAlarm"));

    v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x200) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v15 & 0x400) == 0)
        goto LABEL_18;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&v15 & 0x200) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bedtimeHour);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("bedtimeHour"));

  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v15 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bedtimeMinute);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("bedtimeMinute"));

  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v15 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bedtimeReminderMinutes);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("bedtimeReminderMinutes"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v15 & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_revision);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("revision"));

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x40) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v15 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastModifiedDate);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("lastModifiedDate"));

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v15 & 4) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_snoozeFireDate);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("snoozeFireDate"));

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 4) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v15 & 0x100000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bedtimeSnoozeFireDate);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("bedtimeSnoozeFireDate"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v15 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("isEnabled"));

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x10) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v15 & 8) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firedDate);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("firedDate"));

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 8) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v15 & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_50;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dismissedDate);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("dismissedDate"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v15 & 0x1000000) == 0)
      goto LABEL_28;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sleepMode);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("sleepMode"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v15 & 0x800000) == 0)
      goto LABEL_29;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sleepTracking);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("sleepTracking"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v15 & 0x10000) == 0)
      goto LABEL_30;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sleepSchedule);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("sleepSchedule"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v15 & 0x40000) == 0)
      goto LABEL_31;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_onboardingVersion);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("onboardingVersion"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v15 & 0x2000000) == 0)
      goto LABEL_32;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sleepModeOptions);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("sleepModeOptions"));

  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v15 & 0x2000) == 0)
      goto LABEL_33;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_timeInBedTracking);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("timeInBedTracking"));

  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x2000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v15 & 2) == 0)
      goto LABEL_34;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dismissedAction);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("dismissedAction"));

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 2) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v15 & 1) == 0)
      goto LABEL_35;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bedtimeFiredDate);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("bedtimeFiredDate"));

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 1) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v15 & 0x100) == 0)
      goto LABEL_36;
LABEL_59:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bedtimeDismissedAction);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("bedtimeDismissedAction"));

    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      return v4;
    goto LABEL_37;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bedtimeDismissedDate);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("bedtimeDismissedDate"));

  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x100) != 0)
    goto LABEL_59;
LABEL_36:
  if ((*(_BYTE *)&v15 & 0x20) != 0)
  {
LABEL_37:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_keepOffUntilDate);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("keepOffUntilDate"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBAlarmPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $BBB132571B1AAF0C189DBE8BAD1A045E has;
  $BBB132571B1AAF0C189DBE8BAD1A045E v6;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_alarmID)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v8;
  }
  if (self->_sound)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x200) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v7 & 0x400) == 0)
        goto LABEL_18;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&v7 & 0x200) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v7 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteDoubleField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v7 & 8) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0)
      goto LABEL_28;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v7 & 0x800000) == 0)
      goto LABEL_29;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_30;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_31;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
      goto LABEL_32;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_33;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v7 & 2) == 0)
      goto LABEL_34;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v7 & 1) == 0)
      goto LABEL_35;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteDoubleField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 1) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_36;
LABEL_59:
    PBDataWriterWriteUint32Field();
    v4 = v8;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  v4 = v8;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) != 0)
    goto LABEL_59;
LABEL_36:
  if ((*(_BYTE *)&v7 & 0x20) != 0)
  {
LABEL_37:
    PBDataWriterWriteDoubleField();
    v4 = v8;
  }
LABEL_38:

}

- (void)copyTo:(id)a3
{
  id v4;
  $BBB132571B1AAF0C189DBE8BAD1A045E has;
  $BBB132571B1AAF0C189DBE8BAD1A045E v6;
  $BBB132571B1AAF0C189DBE8BAD1A045E v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_alarmID)
  {
    objc_msgSend(v4, "setAlarmID:");
    v4 = v8;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 26) = self->_hour;
    *((_DWORD *)v4 + 38) |= 0x4000u;
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *((_DWORD *)v4 + 27) = self->_minute;
    *((_DWORD *)v4 + 38) |= 0x8000u;
  }
  if (self->_title)
  {
    objc_msgSend(v8, "setTitle:");
    v4 = v8;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
    *((_BYTE *)v4 + 144) = self->_allowsSnooze;
    *((_DWORD *)v4 + 38) |= 0x80000u;
    v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_daySetting;
    *((_DWORD *)v4 + 38) |= 0x1000u;
  }
  if (self->_sound)
  {
    objc_msgSend(v8, "setSound:");
    v4 = v8;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
    *((_BYTE *)v4 + 146) = self->_isSleepAlarm;
    *((_DWORD *)v4 + 38) |= 0x200000u;
    v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x200) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v7 & 0x400) == 0)
        goto LABEL_18;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&v7 & 0x200) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 21) = self->_bedtimeHour;
  *((_DWORD *)v4 + 38) |= 0x200u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v7 & 0x800) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 22) = self->_bedtimeMinute;
  *((_DWORD *)v4 + 38) |= 0x400u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x800) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 23) = self->_bedtimeReminderMinutes;
  *((_DWORD *)v4 + 38) |= 0x800u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v7 & 0x40) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 29) = self->_revision;
  *((_DWORD *)v4 + 38) |= 0x20000u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x40) == 0)
  {
LABEL_21:
    if ((*(_BYTE *)&v7 & 0x80) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_lastModifiedDate;
  *((_DWORD *)v4 + 38) |= 0x40u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_snoozeFireDate;
  *((_DWORD *)v4 + 38) |= 0x80u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v7 & 0x100000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_bedtimeSnoozeFireDate;
  *((_DWORD *)v4 + 38) |= 4u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x100000) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v7 & 0x10) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  *((_BYTE *)v4 + 145) = self->_isEnabled;
  *((_DWORD *)v4 + 38) |= 0x100000u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
LABEL_25:
    if ((*(_BYTE *)&v7 & 8) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_firedDate;
  *((_DWORD *)v4 + 38) |= 0x10u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_27;
    goto LABEL_50;
  }
LABEL_49:
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_dismissedDate;
  *((_DWORD *)v4 + 38) |= 8u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v7 & 0x1000000) == 0)
      goto LABEL_28;
    goto LABEL_51;
  }
LABEL_50:
  *((_BYTE *)v4 + 147) = self->_sleepMode;
  *((_DWORD *)v4 + 38) |= 0x400000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v7 & 0x800000) == 0)
      goto LABEL_29;
    goto LABEL_52;
  }
LABEL_51:
  *((_BYTE *)v4 + 149) = self->_sleepTracking;
  *((_DWORD *)v4 + 38) |= 0x1000000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v7 & 0x10000) == 0)
      goto LABEL_30;
    goto LABEL_53;
  }
LABEL_52:
  *((_BYTE *)v4 + 148) = self->_sleepSchedule;
  *((_DWORD *)v4 + 38) |= 0x800000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
      goto LABEL_31;
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 28) = self->_onboardingVersion;
  *((_DWORD *)v4 + 38) |= 0x10000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
      goto LABEL_32;
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 30) = self->_sleepModeOptions;
  *((_DWORD *)v4 + 38) |= 0x40000u;
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v7 & 0x2000) == 0)
      goto LABEL_33;
    goto LABEL_56;
  }
LABEL_55:
  *((_BYTE *)v4 + 150) = self->_timeInBedTracking;
  *((_DWORD *)v4 + 38) |= 0x2000000u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v7 & 2) == 0)
      goto LABEL_34;
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 25) = self->_dismissedAction;
  *((_DWORD *)v4 + 38) |= 0x2000u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 2) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v7 & 1) == 0)
      goto LABEL_35;
    goto LABEL_58;
  }
LABEL_57:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_bedtimeFiredDate;
  *((_DWORD *)v4 + 38) |= 2u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 1) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v7 & 0x100) == 0)
      goto LABEL_36;
LABEL_59:
    *((_DWORD *)v4 + 20) = self->_bedtimeDismissedAction;
    *((_DWORD *)v4 + 38) |= 0x100u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_58:
  *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_bedtimeDismissedDate;
  *((_DWORD *)v4 + 38) |= 1u;
  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x100) != 0)
    goto LABEL_59;
LABEL_36:
  if ((*(_BYTE *)&v7 & 0x20) != 0)
  {
LABEL_37:
    *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_keepOffUntilDate;
    *((_DWORD *)v4 + 38) |= 0x20u;
  }
LABEL_38:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  $BBB132571B1AAF0C189DBE8BAD1A045E has;
  uint64_t v9;
  void *v10;
  $BBB132571B1AAF0C189DBE8BAD1A045E v11;
  id v12;
  void *v13;
  $BBB132571B1AAF0C189DBE8BAD1A045E v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_alarmID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v6;

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_hour;
    *(_DWORD *)(v5 + 152) |= 0x4000u;
    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_minute;
    *(_DWORD *)(v5 + 152) |= 0x8000u;
  }
  v9 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v9;

  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000) != 0)
  {
    *(_BYTE *)(v5 + 144) = self->_allowsSnooze;
    *(_DWORD *)(v5 + 152) |= 0x80000u;
    v11 = self->_has;
  }
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_daySetting;
    *(_DWORD *)(v5 + 152) |= 0x1000u;
  }
  v12 = -[MTPBSound copyWithZone:](self->_sound, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v12;

  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x200000) != 0)
  {
    *(_BYTE *)(v5 + 146) = self->_isSleepAlarm;
    *(_DWORD *)(v5 + 152) |= 0x200000u;
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x200) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v14 & 0x400) == 0)
        goto LABEL_12;
      goto LABEL_35;
    }
  }
  else if ((*(_WORD *)&v14 & 0x200) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v5 + 84) = self->_bedtimeHour;
  *(_DWORD *)(v5 + 152) |= 0x200u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v14 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 88) = self->_bedtimeMinute;
  *(_DWORD *)(v5 + 152) |= 0x400u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v14 & 0x20000) == 0)
      goto LABEL_14;
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 92) = self->_bedtimeReminderMinutes;
  *(_DWORD *)(v5 + 152) |= 0x800u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v14 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 116) = self->_revision;
  *(_DWORD *)(v5 + 152) |= 0x20000u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v14 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_39;
  }
LABEL_38:
  *(double *)(v5 + 56) = self->_lastModifiedDate;
  *(_DWORD *)(v5 + 152) |= 0x40u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x80) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v14 & 4) == 0)
      goto LABEL_17;
    goto LABEL_40;
  }
LABEL_39:
  *(double *)(v5 + 64) = self->_snoozeFireDate;
  *(_DWORD *)(v5 + 152) |= 0x80u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v14 & 0x100000) == 0)
      goto LABEL_18;
    goto LABEL_41;
  }
LABEL_40:
  *(double *)(v5 + 24) = self->_bedtimeSnoozeFireDate;
  *(_DWORD *)(v5 + 152) |= 4u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_18:
    if ((*(_BYTE *)&v14 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_42;
  }
LABEL_41:
  *(_BYTE *)(v5 + 145) = self->_isEnabled;
  *(_DWORD *)(v5 + 152) |= 0x100000u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x10) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v14 & 8) == 0)
      goto LABEL_20;
    goto LABEL_43;
  }
LABEL_42:
  *(double *)(v5 + 40) = self->_firedDate;
  *(_DWORD *)(v5 + 152) |= 0x10u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
      goto LABEL_21;
    goto LABEL_44;
  }
LABEL_43:
  *(double *)(v5 + 32) = self->_dismissedDate;
  *(_DWORD *)(v5 + 152) |= 8u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      goto LABEL_22;
    goto LABEL_45;
  }
LABEL_44:
  *(_BYTE *)(v5 + 147) = self->_sleepMode;
  *(_DWORD *)(v5 + 152) |= 0x400000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 149) = self->_sleepTracking;
  *(_DWORD *)(v5 + 152) |= 0x1000000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  *(_BYTE *)(v5 + 148) = self->_sleepSchedule;
  *(_DWORD *)(v5 + 152) |= 0x800000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v14 & 0x40000) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  *(_DWORD *)(v5 + 112) = self->_onboardingVersion;
  *(_DWORD *)(v5 + 152) |= 0x10000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 120) = self->_sleepModeOptions;
  *(_DWORD *)(v5 + 152) |= 0x40000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_27;
    goto LABEL_50;
  }
LABEL_49:
  *(_BYTE *)(v5 + 150) = self->_timeInBedTracking;
  *(_DWORD *)(v5 + 152) |= 0x2000000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v14 & 2) == 0)
      goto LABEL_28;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 100) = self->_dismissedAction;
  *(_DWORD *)(v5 + 152) |= 0x2000u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 2) == 0)
  {
LABEL_28:
    if ((*(_BYTE *)&v14 & 1) == 0)
      goto LABEL_29;
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 16) = self->_bedtimeFiredDate;
  *(_DWORD *)(v5 + 152) |= 2u;
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 1) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v14 & 0x100) == 0)
      goto LABEL_30;
LABEL_53:
    *(_DWORD *)(v5 + 80) = self->_bedtimeDismissedAction;
    *(_DWORD *)(v5 + 152) |= 0x100u;
    if ((*(_DWORD *)&self->_has & 0x20) == 0)
      return (id)v5;
    goto LABEL_31;
  }
LABEL_52:
  *(double *)(v5 + 8) = self->_bedtimeDismissedDate;
  *(_DWORD *)(v5 + 152) |= 1u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) != 0)
    goto LABEL_53;
LABEL_30:
  if ((*(_BYTE *)&v14 & 0x20) != 0)
  {
LABEL_31:
    *(double *)(v5 + 48) = self->_keepOffUntilDate;
    *(_DWORD *)(v5 + 152) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *alarmID;
  $BBB132571B1AAF0C189DBE8BAD1A045E has;
  int v7;
  NSString *title;
  int v9;
  MTPBSound *sound;
  int v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_161;
  alarmID = self->_alarmID;
  if ((unint64_t)alarmID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](alarmID, "isEqual:"))
      goto LABEL_161;
  }
  has = self->_has;
  v7 = *((_DWORD *)v4 + 38);
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_hour != *((_DWORD *)v4 + 26))
      goto LABEL_161;
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_minute != *((_DWORD *)v4 + 27))
      goto LABEL_161;
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_161;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_161;
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 38);
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0)
      goto LABEL_161;
    if (self->_allowsSnooze)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_161;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_161;
    }
  }
  else if ((v9 & 0x80000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_daySetting != *((_DWORD *)v4 + 24))
      goto LABEL_161;
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_161;
  }
  sound = self->_sound;
  if ((unint64_t)sound | *((_QWORD *)v4 + 16))
  {
    if (!-[MTPBSound isEqual:](sound, "isEqual:"))
      goto LABEL_161;
    has = self->_has;
  }
  v11 = *((_DWORD *)v4 + 38);
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v11 & 0x200000) == 0)
      goto LABEL_161;
    if (self->_isSleepAlarm)
    {
      if (!*((_BYTE *)v4 + 146))
        goto LABEL_161;
    }
    else if (*((_BYTE *)v4 + 146))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x200000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v11 & 0x200) == 0 || self->_bedtimeHour != *((_DWORD *)v4 + 21))
      goto LABEL_161;
  }
  else if ((v11 & 0x200) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0 || self->_bedtimeMinute != *((_DWORD *)v4 + 22))
      goto LABEL_161;
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_bedtimeReminderMinutes != *((_DWORD *)v4 + 23))
      goto LABEL_161;
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0 || self->_revision != *((_DWORD *)v4 + 29))
      goto LABEL_161;
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_lastModifiedDate != *((double *)v4 + 7))
      goto LABEL_161;
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_snoozeFireDate != *((double *)v4 + 8))
      goto LABEL_161;
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_bedtimeSnoozeFireDate != *((double *)v4 + 3))
      goto LABEL_161;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v11 & 0x100000) == 0)
      goto LABEL_161;
    if (self->_isEnabled)
    {
      if (!*((_BYTE *)v4 + 145))
        goto LABEL_161;
    }
    else if (*((_BYTE *)v4 + 145))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x100000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_firedDate != *((double *)v4 + 5))
      goto LABEL_161;
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_dismissedDate != *((double *)v4 + 4))
      goto LABEL_161;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v11 & 0x400000) == 0)
      goto LABEL_161;
    if (self->_sleepMode)
    {
      if (!*((_BYTE *)v4 + 147))
        goto LABEL_161;
    }
    else if (*((_BYTE *)v4 + 147))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x400000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v11 & 0x1000000) == 0)
      goto LABEL_161;
    if (self->_sleepTracking)
    {
      if (!*((_BYTE *)v4 + 149))
        goto LABEL_161;
    }
    else if (*((_BYTE *)v4 + 149))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x1000000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0)
      goto LABEL_161;
    if (self->_sleepSchedule)
    {
      if (!*((_BYTE *)v4 + 148))
        goto LABEL_161;
    }
    else if (*((_BYTE *)v4 + 148))
    {
      goto LABEL_161;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0 || self->_onboardingVersion != *((_DWORD *)v4 + 28))
      goto LABEL_161;
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v11 & 0x40000) == 0 || self->_sleepModeOptions != *((_DWORD *)v4 + 30))
      goto LABEL_161;
  }
  else if ((v11 & 0x40000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v11 & 0x2000000) != 0)
    {
      if (self->_timeInBedTracking)
      {
        if (!*((_BYTE *)v4 + 150))
          goto LABEL_161;
        goto LABEL_136;
      }
      if (!*((_BYTE *)v4 + 150))
        goto LABEL_136;
    }
LABEL_161:
    v12 = 0;
    goto LABEL_162;
  }
  if ((v11 & 0x2000000) != 0)
    goto LABEL_161;
LABEL_136:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0 || self->_dismissedAction != *((_DWORD *)v4 + 25))
      goto LABEL_161;
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_bedtimeFiredDate != *((double *)v4 + 2))
      goto LABEL_161;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_bedtimeDismissedDate != *((double *)v4 + 1))
      goto LABEL_161;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0 || self->_bedtimeDismissedAction != *((_DWORD *)v4 + 20))
      goto LABEL_161;
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_161;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_keepOffUntilDate != *((double *)v4 + 6))
      goto LABEL_161;
    v12 = 1;
  }
  else
  {
    v12 = (*((_DWORD *)v4 + 38) & 0x20) == 0;
  }
LABEL_162:

  return v12;
}

- (unint64_t)hash
{
  $BBB132571B1AAF0C189DBE8BAD1A045E has;
  $BBB132571B1AAF0C189DBE8BAD1A045E v4;
  $BBB132571B1AAF0C189DBE8BAD1A045E v5;
  double lastModifiedDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double snoozeFireDate;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  double bedtimeSnoozeFireDate;
  double v18;
  long double v19;
  double v20;
  double firedDate;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  double dismissedDate;
  double v28;
  long double v29;
  double v30;
  double bedtimeFiredDate;
  double v32;
  long double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  double bedtimeDismissedDate;
  double v38;
  long double v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  double keepOffUntilDate;
  double v44;
  long double v45;
  double v46;
  unint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSUInteger v66;
  uint64_t v67;
  uint64_t v68;
  NSUInteger v69;

  v69 = -[NSString hash](self->_alarmID, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    v68 = 2654435761 * self->_hour;
    if ((*(_WORD *)&has & 0x8000) != 0)
      goto LABEL_3;
  }
  else
  {
    v68 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
LABEL_3:
      v67 = 2654435761 * self->_minute;
      goto LABEL_6;
    }
  }
  v67 = 0;
LABEL_6:
  v66 = -[NSString hash](self->_title, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
    v65 = 2654435761 * self->_allowsSnooze;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_8;
  }
  else
  {
    v65 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
    {
LABEL_8:
      v64 = 2654435761 * self->_daySetting;
      goto LABEL_11;
    }
  }
  v64 = 0;
LABEL_11:
  v63 = -[MTPBSound hash](self->_sound, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) != 0)
  {
    v62 = 2654435761 * self->_isSleepAlarm;
    if ((*(_WORD *)&v5 & 0x200) != 0)
    {
LABEL_13:
      v61 = 2654435761 * self->_bedtimeHour;
      if ((*(_WORD *)&v5 & 0x400) != 0)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else
  {
    v62 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0)
      goto LABEL_13;
  }
  v61 = 0;
  if ((*(_WORD *)&v5 & 0x400) != 0)
  {
LABEL_14:
    v60 = 2654435761 * self->_bedtimeMinute;
    if ((*(_WORD *)&v5 & 0x800) != 0)
      goto LABEL_15;
    goto LABEL_24;
  }
LABEL_23:
  v60 = 0;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
LABEL_15:
    v59 = 2654435761 * self->_bedtimeReminderMinutes;
    if ((*(_DWORD *)&v5 & 0x20000) != 0)
      goto LABEL_16;
LABEL_25:
    v58 = 0;
    if ((*(_BYTE *)&v5 & 0x40) != 0)
      goto LABEL_17;
LABEL_26:
    v10 = 0;
    goto LABEL_29;
  }
LABEL_24:
  v59 = 0;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
    goto LABEL_25;
LABEL_16:
  v58 = 2654435761 * self->_revision;
  if ((*(_BYTE *)&v5 & 0x40) == 0)
    goto LABEL_26;
LABEL_17:
  lastModifiedDate = self->_lastModifiedDate;
  v7 = -lastModifiedDate;
  if (lastModifiedDate >= 0.0)
    v7 = self->_lastModifiedDate;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_29:
  if ((*(_BYTE *)&v5 & 0x80) != 0)
  {
    snoozeFireDate = self->_snoozeFireDate;
    v13 = -snoozeFireDate;
    if (snoozeFireDate >= 0.0)
      v13 = self->_snoozeFireDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((*(_BYTE *)&v5 & 4) != 0)
  {
    bedtimeSnoozeFireDate = self->_bedtimeSnoozeFireDate;
    v18 = -bedtimeSnoozeFireDate;
    if (bedtimeSnoozeFireDate >= 0.0)
      v18 = self->_bedtimeSnoozeFireDate;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    v57 = 2654435761 * self->_isEnabled;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
      goto LABEL_47;
LABEL_52:
    v25 = 0;
    goto LABEL_55;
  }
  v57 = 0;
  if ((*(_BYTE *)&v5 & 0x10) == 0)
    goto LABEL_52;
LABEL_47:
  firedDate = self->_firedDate;
  v22 = -firedDate;
  if (firedDate >= 0.0)
    v22 = self->_firedDate;
  v23 = floor(v22 + 0.5);
  v24 = (v22 - v23) * 1.84467441e19;
  v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0)
      v25 += (unint64_t)v24;
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
LABEL_55:
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
    dismissedDate = self->_dismissedDate;
    v28 = -dismissedDate;
    if (dismissedDate >= 0.0)
      v28 = self->_dismissedDate;
    v29 = floor(v28 + 0.5);
    v30 = (v28 - v29) * 1.84467441e19;
    v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0)
        v26 += (unint64_t)v30;
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    v26 = 0;
  }
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
  {
    v55 = 2654435761 * self->_sleepMode;
    if ((*(_DWORD *)&v5 & 0x1000000) != 0)
    {
LABEL_65:
      v54 = 2654435761 * self->_sleepTracking;
      if ((*(_DWORD *)&v5 & 0x800000) != 0)
        goto LABEL_66;
      goto LABEL_72;
    }
  }
  else
  {
    v55 = 0;
    if ((*(_DWORD *)&v5 & 0x1000000) != 0)
      goto LABEL_65;
  }
  v54 = 0;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
LABEL_66:
    v53 = 2654435761 * self->_sleepSchedule;
    if ((*(_DWORD *)&v5 & 0x10000) != 0)
      goto LABEL_67;
    goto LABEL_73;
  }
LABEL_72:
  v53 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_67:
    v52 = 2654435761 * self->_onboardingVersion;
    if ((*(_DWORD *)&v5 & 0x40000) != 0)
      goto LABEL_68;
LABEL_74:
    v51 = 0;
    if ((*(_DWORD *)&v5 & 0x2000000) != 0)
      goto LABEL_69;
    goto LABEL_75;
  }
LABEL_73:
  v52 = 0;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
    goto LABEL_74;
LABEL_68:
  v51 = 2654435761 * self->_sleepModeOptions;
  if ((*(_DWORD *)&v5 & 0x2000000) != 0)
  {
LABEL_69:
    v50 = 2654435761 * self->_timeInBedTracking;
    goto LABEL_76;
  }
LABEL_75:
  v50 = 0;
LABEL_76:
  v56 = v11;
  if ((*(_WORD *)&v5 & 0x2000) != 0)
  {
    v49 = 2654435761 * self->_dismissedAction;
    if ((*(_BYTE *)&v5 & 2) != 0)
      goto LABEL_78;
LABEL_83:
    v35 = 0;
    goto LABEL_86;
  }
  v49 = 0;
  if ((*(_BYTE *)&v5 & 2) == 0)
    goto LABEL_83;
LABEL_78:
  bedtimeFiredDate = self->_bedtimeFiredDate;
  v32 = -bedtimeFiredDate;
  if (bedtimeFiredDate >= 0.0)
    v32 = self->_bedtimeFiredDate;
  v33 = floor(v32 + 0.5);
  v34 = (v32 - v33) * 1.84467441e19;
  v35 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
  if (v34 >= 0.0)
  {
    if (v34 > 0.0)
      v35 += (unint64_t)v34;
  }
  else
  {
    v35 -= (unint64_t)fabs(v34);
  }
LABEL_86:
  if ((*(_BYTE *)&v5 & 1) != 0)
  {
    bedtimeDismissedDate = self->_bedtimeDismissedDate;
    v38 = -bedtimeDismissedDate;
    if (bedtimeDismissedDate >= 0.0)
      v38 = self->_bedtimeDismissedDate;
    v39 = floor(v38 + 0.5);
    v40 = (v38 - v39) * 1.84467441e19;
    v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    if (v40 >= 0.0)
    {
      if (v40 > 0.0)
        v36 += (unint64_t)v40;
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    v36 = 0;
  }
  v41 = v26;
  if ((*(_WORD *)&v5 & 0x100) != 0)
  {
    v42 = 2654435761 * self->_bedtimeDismissedAction;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
      goto LABEL_96;
LABEL_101:
    v47 = 0;
    return v68 ^ v69 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v10 ^ v56 ^ v16 ^ v57 ^ v25 ^ v41 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v35 ^ v36 ^ v42 ^ v47;
  }
  v42 = 0;
  if ((*(_BYTE *)&v5 & 0x20) == 0)
    goto LABEL_101;
LABEL_96:
  keepOffUntilDate = self->_keepOffUntilDate;
  v44 = -keepOffUntilDate;
  if (keepOffUntilDate >= 0.0)
    v44 = self->_keepOffUntilDate;
  v45 = floor(v44 + 0.5);
  v46 = (v44 - v45) * 1.84467441e19;
  v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0)
      v47 += (unint64_t)v46;
  }
  else
  {
    v47 -= (unint64_t)fabs(v46);
  }
  return v68 ^ v69 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v10 ^ v56 ^ v16 ^ v57 ^ v25 ^ v41 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v35 ^ v36 ^ v42 ^ v47;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  MTPBSound *sound;
  uint64_t v8;
  int v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[MTPBAlarmProperties setAlarmID:](self, "setAlarmID:");
    v4 = v10;
  }
  v5 = *((_DWORD *)v4 + 38);
  if ((v5 & 0x4000) != 0)
  {
    self->_hour = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x4000u;
    v5 = *((_DWORD *)v4 + 38);
  }
  if ((v5 & 0x8000) != 0)
  {
    self->_minute = *((_DWORD *)v4 + 27);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[MTPBAlarmProperties setTitle:](self, "setTitle:");
    v4 = v10;
  }
  v6 = *((_DWORD *)v4 + 38);
  if ((v6 & 0x80000) != 0)
  {
    self->_allowsSnooze = *((_BYTE *)v4 + 144);
    *(_DWORD *)&self->_has |= 0x80000u;
    v6 = *((_DWORD *)v4 + 38);
  }
  if ((v6 & 0x1000) != 0)
  {
    self->_daySetting = *((_DWORD *)v4 + 24);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  sound = self->_sound;
  v8 = *((_QWORD *)v4 + 16);
  if (sound)
  {
    if (!v8)
      goto LABEL_19;
    -[MTPBSound mergeFrom:](sound, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_19;
    -[MTPBAlarmProperties setSound:](self, "setSound:");
  }
  v4 = v10;
LABEL_19:
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x200000) != 0)
  {
    self->_isSleepAlarm = *((_BYTE *)v4 + 146);
    *(_DWORD *)&self->_has |= 0x200000u;
    v9 = *((_DWORD *)v4 + 38);
    if ((v9 & 0x200) == 0)
    {
LABEL_21:
      if ((v9 & 0x400) == 0)
        goto LABEL_22;
      goto LABEL_45;
    }
  }
  else if ((v9 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  self->_bedtimeHour = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x200u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x400) == 0)
  {
LABEL_22:
    if ((v9 & 0x800) == 0)
      goto LABEL_23;
    goto LABEL_46;
  }
LABEL_45:
  self->_bedtimeMinute = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x400u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x800) == 0)
  {
LABEL_23:
    if ((v9 & 0x20000) == 0)
      goto LABEL_24;
    goto LABEL_47;
  }
LABEL_46:
  self->_bedtimeReminderMinutes = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x800u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x20000) == 0)
  {
LABEL_24:
    if ((v9 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_48;
  }
LABEL_47:
  self->_revision = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x20000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x40) == 0)
  {
LABEL_25:
    if ((v9 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_48:
  self->_lastModifiedDate = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x80) == 0)
  {
LABEL_26:
    if ((v9 & 4) == 0)
      goto LABEL_27;
    goto LABEL_50;
  }
LABEL_49:
  self->_snoozeFireDate = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 4) == 0)
  {
LABEL_27:
    if ((v9 & 0x100000) == 0)
      goto LABEL_28;
    goto LABEL_51;
  }
LABEL_50:
  self->_bedtimeSnoozeFireDate = *((double *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x100000) == 0)
  {
LABEL_28:
    if ((v9 & 0x10) == 0)
      goto LABEL_29;
    goto LABEL_52;
  }
LABEL_51:
  self->_isEnabled = *((_BYTE *)v4 + 145);
  *(_DWORD *)&self->_has |= 0x100000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x10) == 0)
  {
LABEL_29:
    if ((v9 & 8) == 0)
      goto LABEL_30;
    goto LABEL_53;
  }
LABEL_52:
  self->_firedDate = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 8) == 0)
  {
LABEL_30:
    if ((v9 & 0x400000) == 0)
      goto LABEL_31;
    goto LABEL_54;
  }
LABEL_53:
  self->_dismissedDate = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x400000) == 0)
  {
LABEL_31:
    if ((v9 & 0x1000000) == 0)
      goto LABEL_32;
    goto LABEL_55;
  }
LABEL_54:
  self->_sleepMode = *((_BYTE *)v4 + 147);
  *(_DWORD *)&self->_has |= 0x400000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_32:
    if ((v9 & 0x800000) == 0)
      goto LABEL_33;
    goto LABEL_56;
  }
LABEL_55:
  self->_sleepTracking = *((_BYTE *)v4 + 149);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x800000) == 0)
  {
LABEL_33:
    if ((v9 & 0x10000) == 0)
      goto LABEL_34;
    goto LABEL_57;
  }
LABEL_56:
  self->_sleepSchedule = *((_BYTE *)v4 + 148);
  *(_DWORD *)&self->_has |= 0x800000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x10000) == 0)
  {
LABEL_34:
    if ((v9 & 0x40000) == 0)
      goto LABEL_35;
    goto LABEL_58;
  }
LABEL_57:
  self->_onboardingVersion = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x10000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x40000) == 0)
  {
LABEL_35:
    if ((v9 & 0x2000000) == 0)
      goto LABEL_36;
    goto LABEL_59;
  }
LABEL_58:
  self->_sleepModeOptions = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x40000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v9 & 0x2000) == 0)
      goto LABEL_37;
    goto LABEL_60;
  }
LABEL_59:
  self->_timeInBedTracking = *((_BYTE *)v4 + 150);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x2000) == 0)
  {
LABEL_37:
    if ((v9 & 2) == 0)
      goto LABEL_38;
    goto LABEL_61;
  }
LABEL_60:
  self->_dismissedAction = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x2000u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 2) == 0)
  {
LABEL_38:
    if ((v9 & 1) == 0)
      goto LABEL_39;
    goto LABEL_62;
  }
LABEL_61:
  self->_bedtimeFiredDate = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 1) == 0)
  {
LABEL_39:
    if ((v9 & 0x100) == 0)
      goto LABEL_40;
LABEL_63:
    self->_bedtimeDismissedAction = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x100u;
    if ((*((_DWORD *)v4 + 38) & 0x20) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_62:
  self->_bedtimeDismissedDate = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v9 = *((_DWORD *)v4 + 38);
  if ((v9 & 0x100) != 0)
    goto LABEL_63;
LABEL_40:
  if ((v9 & 0x20) != 0)
  {
LABEL_41:
    self->_keepOffUntilDate = *((double *)v4 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_42:

}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (void)setAlarmID:(id)a3
{
  objc_storeStrong((id *)&self->_alarmID, a3);
}

- (unsigned)hour
{
  return self->_hour;
}

- (unsigned)minute
{
  return self->_minute;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)allowsSnooze
{
  return self->_allowsSnooze;
}

- (unsigned)daySetting
{
  return self->_daySetting;
}

- (MTPBSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (unsigned)bedtimeHour
{
  return self->_bedtimeHour;
}

- (unsigned)bedtimeMinute
{
  return self->_bedtimeMinute;
}

- (unsigned)bedtimeReminderMinutes
{
  return self->_bedtimeReminderMinutes;
}

- (unsigned)revision
{
  return self->_revision;
}

- (double)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (double)snoozeFireDate
{
  return self->_snoozeFireDate;
}

- (double)bedtimeSnoozeFireDate
{
  return self->_bedtimeSnoozeFireDate;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (double)firedDate
{
  return self->_firedDate;
}

- (double)dismissedDate
{
  return self->_dismissedDate;
}

- (BOOL)sleepMode
{
  return self->_sleepMode;
}

- (BOOL)sleepTracking
{
  return self->_sleepTracking;
}

- (BOOL)sleepSchedule
{
  return self->_sleepSchedule;
}

- (unsigned)onboardingVersion
{
  return self->_onboardingVersion;
}

- (unsigned)sleepModeOptions
{
  return self->_sleepModeOptions;
}

- (BOOL)timeInBedTracking
{
  return self->_timeInBedTracking;
}

- (unsigned)dismissedAction
{
  return self->_dismissedAction;
}

- (double)bedtimeFiredDate
{
  return self->_bedtimeFiredDate;
}

- (double)bedtimeDismissedDate
{
  return self->_bedtimeDismissedDate;
}

- (unsigned)bedtimeDismissedAction
{
  return self->_bedtimeDismissedAction;
}

- (double)keepOffUntilDate
{
  return self->_keepOffUntilDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end
