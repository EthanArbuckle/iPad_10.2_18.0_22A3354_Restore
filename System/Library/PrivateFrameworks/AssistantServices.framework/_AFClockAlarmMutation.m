@implementation _AFClockAlarmMutation

- (_AFClockAlarmMutation)initWithBase:(id)a3
{
  id v5;
  _AFClockAlarmMutation *v6;
  _AFClockAlarmMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClockAlarmMutation;
  v6 = -[_AFClockAlarmMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getAlarmID
{
  NSUUID *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_alarmID;
  }
  else
  {
    -[AFClockAlarm alarmID](self->_base, "alarmID");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAlarmID:(id)a3
{
  objc_storeStrong((id *)&self->_alarmID, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAlarmURL
{
  NSURL *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_alarmURL;
  }
  else
  {
    -[AFClockAlarm alarmURL](self->_base, "alarmURL");
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAlarmURL:(id)a3
{
  objc_storeStrong((id *)&self->_alarmURL, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (BOOL)getIsFiring
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
    return self->_isFiring;
  else
    return -[AFClockAlarm isFiring](self->_base, "isFiring");
}

- (void)setIsFiring:(BOOL)a3
{
  self->_isFiring = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getTitle
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_title;
  }
  else
  {
    -[AFClockAlarm title](self->_base, "title");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (unint64_t)getType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
    return self->_type;
  else
    return -[AFClockAlarm type](self->_base, "type");
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (unint64_t)getHour
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
    return self->_hour;
  else
    return -[AFClockAlarm hour](self->_base, "hour");
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (unint64_t)getMinute
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_minute;
  else
    return -[AFClockAlarm minute](self->_base, "minute");
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (unint64_t)getRepeatOptions
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_repeatOptions;
  else
    return -[AFClockAlarm repeatOptions](self->_base, "repeatOptions");
}

- (void)setRepeatOptions:(unint64_t)a3
{
  self->_repeatOptions = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (BOOL)getIsEnabled
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
    return self->_isEnabled;
  else
    return -[AFClockAlarm isEnabled](self->_base, "isEnabled");
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (BOOL)getIsSnoozed
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
    return self->_isSnoozed;
  else
    return -[AFClockAlarm isSnoozed](self->_base, "isSnoozed");
}

- (void)setIsSnoozed:(BOOL)a3
{
  self->_isSnoozed = a3;
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getFiredDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_firedDate;
  }
  else
  {
    -[AFClockAlarm firedDate](self->_base, "firedDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setFiredDate:(id)a3
{
  objc_storeStrong((id *)&self->_firedDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getDismissedDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v2 = self->_dismissedDate;
  }
  else
  {
    -[AFClockAlarm dismissedDate](self->_base, "dismissedDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDismissedDate:(id)a3
{
  objc_storeStrong((id *)&self->_dismissedDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (id)getLastModifiedDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x2000) != 0)
  {
    v2 = self->_lastModifiedDate;
  }
  else
  {
    -[AFClockAlarm lastModifiedDate](self->_base, "lastModifiedDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x2001u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alarmURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
