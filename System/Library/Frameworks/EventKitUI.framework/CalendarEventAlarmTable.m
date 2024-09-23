@implementation CalendarEventAlarmTable

- (int)intervalForPresetIdentifier:(int64_t)a3
{
  _BOOL4 v4;
  _DWORD *v5;

  v4 = -[CalendarEventAlarmTable useAllDayAlarms](self, "useAllDayAlarms");
  v5 = &__PresetAlarmIntervals;
  if (v4)
    v5 = &__PresetAllDayAlarmIntervals;
  return v5[a3];
}

- (unint64_t)countOfPresets
{
  if (-[CalendarEventAlarmTable useAllDayAlarms](self, "useAllDayAlarms"))
    return 4;
  else
    return 10;
}

- (BOOL)useAllDayAlarms
{
  return self->_useAllDayAlarms;
}

- (void)setUseAllDayAlarms:(BOOL)a3
{
  self->_useAllDayAlarms = a3;
}

@end
