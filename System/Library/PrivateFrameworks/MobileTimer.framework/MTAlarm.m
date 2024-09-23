@implementation MTAlarm

- (NSString)description
{
  return (NSString *)-[MTAlarm descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[MTAlarm descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)serializeWithSerializer:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  objc_msgSend(a3, "mtCoder");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "mtType") == 2)
  {
    LODWORD(v4) = 3.0;
    objc_msgSend(v28, "encodeFloat:forKey:", CFSTR("MTAlarmDataVersion"), v4);
  }
  -[MTAlarm alarmIDString](self, "alarmIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v5, CFSTR("MTAlarmID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTAlarm hour](self, "hour"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v6, CFSTR("MTAlarmHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTAlarm minute](self, "minute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v7, CFSTR("MTAlarmMinute"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTAlarm bedtimeHour](self, "bedtimeHour"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v8, CFSTR("MTAlarmBedtimeHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTAlarm bedtimeMinute](self, "bedtimeMinute"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v9, CFSTR("MTAlarmBedtimeMinute"));

  -[MTAlarm bedtimeReminder](self, "bedtimeReminder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v10, CFSTR("MTAlarmBedtimeReminderMinutes"));

  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm sleepMode](self, "sleepMode"), CFSTR("MTAlarmBedtimeDoNotDisturb"));
  objc_msgSend(v28, "encodeInteger:forKey:", -[MTAlarm sleepModeOptions](self, "sleepModeOptions"), CFSTR("MTAlarmBedtimeDoNotDisturbOptions"));
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm sleepTracking](self, "sleepTracking"), CFSTR("MTAlarmSleepTrackingKey"));
  if (-[MTAlarm isValidDateComponent:](self, "isValidDateComponent:", -[MTAlarm day](self, "day")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTAlarm day](self, "day"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v11, CFSTR("MTAlarmDay"));

  }
  if (-[MTAlarm isValidDateComponent:](self, "isValidDateComponent:", -[MTAlarm month](self, "month")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTAlarm month](self, "month"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v12, CFSTR("MTAlarmMonth"));

  }
  if (-[MTAlarm isValidDateComponent:](self, "isValidDateComponent:", -[MTAlarm year](self, "year")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTAlarm year](self, "year"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v13, CFSTR("MTAlarmYear"));

  }
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm timeInBedTracking](self, "timeInBedTracking"), CFSTR("MTAlarmTimeInBedTrackingKey"));
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm sleepSchedule](self, "sleepSchedule"), CFSTR("MTAlarmSleepScheduleKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTAlarm repeatSchedule](self, "repeatSchedule"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v14, CFSTR("MTAlarmRepeatSchedule"));

  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm isEnabled](self, "isEnabled"), CFSTR("MTAlarmEnabled"));
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm isSleepAlarm](self, "isSleepAlarm"), CFSTR("MTAlarmIsSleep"));
  objc_msgSend(v28, "encodeBool:forKey:", -[MTAlarm allowsSnooze](self, "allowsSnooze"), CFSTR("MTAlarmAllowsSnooze"));
  -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v15, CFSTR("MTAlarmSnoozeFireDate"));

  -[MTAlarm bedtimeSnoozeFireDate](self, "bedtimeSnoozeFireDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v16, CFSTR("MTAlarmBedtimeSnoozeFireDate"));

  -[MTAlarm firedDate](self, "firedDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v17, CFSTR("MTAlarmFireDate"));

  -[MTAlarm dismissedDate](self, "dismissedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v18, CFSTR("MTAlarmDismissDate"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[MTAlarm dismissedAction](self, "dismissedAction"), CFSTR("MTAlarmDismissAction"));
  -[MTAlarm lastModifiedDate](self, "lastModifiedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v19, CFSTR("MTAlarmLastModifiedDate"));

  -[MTAlarm bedtimeFiredDate](self, "bedtimeFiredDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v20, CFSTR("MTAlarmBedtimeFireDate"));

  -[MTAlarm bedtimeDismissedDate](self, "bedtimeDismissedDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v21, CFSTR("MTAlarmBedtimeDismissDate"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[MTAlarm bedtimeDismissedAction](self, "bedtimeDismissedAction"), CFSTR("MTAlarmBedtimeDismissAction"));
  -[MTAlarm keepOffUntilDate](self, "keepOffUntilDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v22, CFSTR("MTAlarmKeepOffUntilDate"));

  -[MTAlarm title](self, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v23, CFSTR("MTAlarmTitle"));

  -[MTAlarm sound](self, "sound");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v24, CFSTR("MTAlarmSound"));

  objc_msgSend(v28, "encodeInteger:forKey:", -[MTAlarm onboardingVersion](self, "onboardingVersion"), CFSTR("MTAlarmOnboardingVersion"));
  if (objc_msgSend(v28, "mtType") != 2)
  {
    -[MTAlarm overriddenForDate](self, "overriddenForDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v25, CFSTR("MTAlarmOverriddenForDate"));

  }
  -[MTAlarm siriContext](self, "siriContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v26, CFSTR("MTAlarmSiriContext"));

  if (objc_msgSend(v28, "mtType") != 2)
  {
    -[MTAlarm bypassReloadDate](self, "bypassReloadDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "encodeObject:forKey:", v27, CFSTR("MTAlarmBypassReloadDate"));

  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm alarmID](self, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("id"));

  v7 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[MTAlarm isSleepAlarm](self, "isSleepAlarm"), CFSTR("sleep"), 1);
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[MTAlarm isEnabled](self, "isEnabled"), CFSTR("enabled"));
  v9 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm hour](self, "hour"), CFSTR("hour"));
  v10 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm minute](self, "minute"), CFSTR("minute"));
  if (-[MTAlarm day](self, "day") != 0x7FFFFFFFFFFFFFFFLL)
    v11 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm day](self, "day"), CFSTR("day"));
  if (-[MTAlarm month](self, "month") != 0x7FFFFFFFFFFFFFFFLL)
    v12 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm month](self, "month"), CFSTR("month"));
  if (-[MTAlarm year](self, "year") != 0x7FFFFFFFFFFFFFFFLL)
    v13 = (id)objc_msgSend(v4, "appendInteger:withName:", -[MTAlarm year](self, "year"), CFSTR("year"));
  MTAlarmRepeatString(-[MTAlarm repeatSchedule](self, "repeatSchedule"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v14, CFSTR("schedule"), 1);

  v15 = (id)objc_msgSend(v4, "appendBool:withName:", -[MTAlarm allowsSnooze](self, "allowsSnooze"), CFSTR("allowsSnooze"));
  v16 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[MTAlarm isSnoozed](self, "isSnoozed"), CFSTR("isSnoozed"), 1);
  v17 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[MTAlarm isFiring](self, "isFiring"), CFSTR("isFiring"), 1);
  -[MTAlarm title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v18, CFSTR("title"), 1);

  -[MTAlarm siriContext](self, "siriContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v19, CFSTR("siriContext"), 1);

  -[MTAlarm bypassReloadDate](self, "bypassReloadDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", v21 != 0, CFSTR("bypassReloadDate"), 1);

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[MTAlarm hour](self, "hour");
  if (v5 < objc_msgSend(v4, "hour"))
    goto LABEL_2;
  v7 = -[MTAlarm hour](self, "hour");
  if (v7 > objc_msgSend(v4, "hour"))
    goto LABEL_4;
  v9 = -[MTAlarm minute](self, "minute");
  if (v9 < objc_msgSend(v4, "minute"))
  {
LABEL_2:
    v6 = -1;
    goto LABEL_5;
  }
  v10 = -[MTAlarm minute](self, "minute");
  if (v10 > objc_msgSend(v4, "minute"))
  {
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  -[MTAlarm displayTitle](self, "displayTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v11, "compare:", v12);

  if (!v6)
  {
    -[MTAlarm alarmID](self, "alarmID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarmID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v14, "compare:", v16);

  }
LABEL_5:

  return v6;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (BOOL)isSleepAlarm
{
  return self->_sleepAlarm;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)alarmID
{
  return self->_alarmID;
}

- (unint64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (unint64_t)year
{
  return self->_year;
}

- (NSDictionary)siriContext
{
  return self->_siriContext;
}

- (unint64_t)month
{
  return self->_month;
}

- (unint64_t)day
{
  return self->_day;
}

- (NSDate)bypassReloadDate
{
  return self->_bypassReloadDate;
}

- (BOOL)allowsSnooze
{
  return self->_allowsSnooze;
}

- (BOOL)isSnoozed
{
  void *v2;
  BOOL v3;

  -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSDate)snoozeFireDate
{
  return self->_snoozeFireDate;
}

- (BOOL)isFiring
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  if (-[MTAlarm isSleepAlarm](self, "isSleepAlarm") && !-[MTAlarm isEnabled](self, "isEnabled"))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[MTAlarm firedDate](self, "firedDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[MTAlarm dismissedDate](self, "dismissedDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        -[MTAlarm firedDate](self, "firedDate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTAlarm dismissedDate](self, "dismissedDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "mtIsAfterDate:", v6))
          v7 = !-[MTAlarm isSnoozed](self, "isSnoozed");
        else
          LOBYTE(v7) = 0;

      }
      else
      {
        v7 = !-[MTAlarm isSnoozed](self, "isSnoozed");
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  return v7;
}

- (NSDate)firedDate
{
  return self->_firedDate;
}

- (BOOL)timeInBedTracking
{
  return self->_timeInBedTracking;
}

- (MTSound)sound
{
  return self->_sound;
}

- (BOOL)sleepTracking
{
  return self->_sleepTracking;
}

- (BOOL)sleepSchedule
{
  return self->_sleepSchedule;
}

- (BOOL)sleepMode
{
  return self->_sleepMode;
}

- (unint64_t)sleepModeOptions
{
  return self->_sleepModeOptions;
}

- (NSDate)overriddenForDate
{
  return self->_overriddenForDate;
}

- (unint64_t)onboardingVersion
{
  return self->_onboardingVersion;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)keepOffUntilDate
{
  return self->_keepOffUntilDate;
}

- (NSDate)dismissedDate
{
  return self->_dismissedDate;
}

- (unint64_t)dismissedAction
{
  return self->_dismissedAction;
}

- (NSDate)bedtimeSnoozeFireDate
{
  return self->_bedtimeSnoozeFireDate;
}

- (NSNumber)bedtimeReminder
{
  return self->_bedtimeReminder;
}

- (unint64_t)bedtimeMinute
{
  return self->_bedtimeMinute;
}

- (unint64_t)bedtimeHour
{
  return self->_bedtimeHour;
}

- (NSDate)bedtimeFiredDate
{
  return self->_bedtimeFiredDate;
}

- (NSDate)bedtimeDismissedDate
{
  return self->_bedtimeDismissedDate;
}

- (unint64_t)bedtimeDismissedAction
{
  return self->_bedtimeDismissedAction;
}

- (id)alarmIDString
{
  void *v2;
  void *v3;

  -[MTAlarm alarmID](self, "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_updatePropertiesFromDeserializer:(id)a3
{
  void *v4;
  float v5;
  float v6;
  int v7;
  BOOL v8;
  BOOL v9;
  char v10;
  BOOL v11;
  BOOL v12;
  char v13;
  char v14;
  NSUUID *v15;
  NSUUID *alarmID;
  uint64_t (*__ptr32 *v17)(int, int, id);
  int v18;
  int v19;
  char v20;
  int v21;
  void *v22;
  MTSound *v23;
  MTSound *sound;
  NSObject *v25;
  void *v26;
  MTSound *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  MTSound *v33;
  int v34;
  char v35;
  _BOOL4 sleepAlarm;
  char v37;
  char v38;
  BOOL v39;
  int v40;
  NSDate *v41;
  NSDate *dismissedDate;
  NSDate **p_dismissedDate;
  NSDate *v44;
  NSDate *v45;
  NSDate *v46;
  void *v47;
  unint64_t v48;
  char v49;
  NSDate *v50;
  NSDate *firedDate;
  NSDate *v52;
  NSDate *v53;
  BOOL v54;
  unint64_t v55;
  unint64_t v56;
  int v57;
  int v58;
  int v59;
  NSObject *v60;
  NSObject *v61;
  _BOOL4 enabled;
  _BOOL4 sleepSchedule;
  int v64;
  void *v65;
  void *v66;
  NSUUID *v67;
  NSUUID *v68;
  int v69;
  MTSound *v70;
  MTSound *v71;
  NSDate *v72;
  NSDate *v73;
  NSDate *v74;
  NSDate *bedtimeDismissedDate;
  NSDate *v76;
  NSDate *keepOffUntilDate;
  void *v78;
  id v79;
  void *v80;
  NSUUID *v81;
  NSUUID *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  unint64_t v88;
  void *v89;
  unint64_t v90;
  void *v91;
  unint64_t v92;
  NSNumber *v93;
  NSNumber *bedtimeReminder;
  NSDate *v95;
  NSDate *snoozeFireDate;
  NSDate *v97;
  NSDate *bedtimeSnoozeFireDate;
  NSDate *v99;
  NSDate *lastModifiedDate;
  NSString *v101;
  NSString *title;
  NSDate *v103;
  NSDate *overriddenForDate;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  NSDictionary *v109;
  NSDictionary *siriContext;
  NSDate *v111;
  NSDate *bypassReloadDate;
  NSDate *v113;
  NSDate *v114;
  NSDate *v115;
  NSDate *bedtimeFiredDate;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint8_t buf[4];
  int v123;
  __int16 v124;
  _BOOL4 v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v121 = a3;
  objc_msgSend(v121, "mtCoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "mtType") != 3)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v119 = 0;
    v120 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_103;
  }
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MTAlarmDataVersion"));
  v6 = v5;
  if (v5 >= 1.2)
  {
    v7 = 0;
  }
  else
  {
    self->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmActive"));
    v7 = 1;
  }
  if (v6 < 1.3)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmID"));
    v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    alarmID = self->_alarmID;
    self->_alarmID = v15;

  }
  if (v6 < 1.4 && v6 >= 1.2)
  {
    self->_enabled = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTAlarmActive")) != 0;
    v7 = 1;
  }
  v17 = &off_19ACFE000;
  if (v6 < 1.6)
  {
    v20 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmIsSleep"));
    self->_sleepAlarm = v20;
    if ((v20 & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmSound"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[MTSound initWithSound:usingVolume:]([MTSound alloc], "initWithSound:usingVolume:", v22, 0);
      sound = self->_sound;
      self->_sound = v23;

      v19 = 1;
    }
    if (v6 >= 1.8 || !self->_sleepAlarm)
      goto LABEL_25;
  }
  else
  {
    if (v6 >= 1.8)
    {
      if (v6 >= 1.9)
      {
        v19 = 0;
        if (v6 >= 2.2)
        {
          v118 = 0;
          v38 = 0;
          v40 = 0;
          v117 = 0;
          v39 = 0;
          v21 = 0;
          if (v6 < 2.3)
            goto LABEL_56;
          goto LABEL_74;
        }
        goto LABEL_43;
      }
      v21 = 0;
      goto LABEL_31;
    }
    v18 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmIsSleep"));
    self->_sleepAlarm = v18;
    if (!v18)
    {
      v21 = 1;
      if (v6 >= 1.9)
      {
        v19 = 0;
        goto LABEL_36;
      }
      goto LABEL_31;
    }
    v19 = 0;
    v20 = 1;
  }
  MTLogForCategory(3);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    +[MTPairedDevicePreferences sharedInstance](MTPairedDevicePreferences, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    v123 = objc_msgSend(v26, "pushAlertsEnabled");
    _os_log_impl(&dword_19AC4E000, v25, OS_LOG_TYPE_DEFAULT, "[Migration] (1.8) pushAlertsEnabled: %d", buf, 8u);

  }
LABEL_25:
  if (v6 >= 1.9)
  {
    v21 = 1;
    goto LABEL_36;
  }
  if ((v20 & 1) != 0)
  {
    v21 = 1;
LABEL_31:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmSound"));
    v27 = (MTSound *)(id)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  v27 = self->_sound;
  v21 = 1;
LABEL_32:
  if (-[MTSound soundType](v27, "soundType") == 1)
  {
    v28 = *MEMORY[0x1E0DBF788];
    -[MTSound vibrationIdentifier](v27, "vibrationIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTSound soundVolume](v27, "soundVolume");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    v17 = &off_19ACFE000;
    +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v31, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_sound, v32);

  }
  else
  {
    v33 = v27;
    v29 = self->_sound;
    self->_sound = v33;
  }

  v19 = 1;
LABEL_36:
  if (v6 < 2.2)
  {
    if (v21)
    {
      if (self->_sleepAlarm)
      {
LABEL_39:
        if (v7)
        {
          self->_sleepSchedule = self->_enabled;
LABEL_46:
          if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmSleepModeDetectionKey")))
            self->_sleepModeOptions = 32;
          v7 = 1;
          self->_timeInBedTracking = 1;
          v118 = 0x100000001;
          goto LABEL_49;
        }
        v35 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmEnabled"));
        sleepAlarm = self->_sleepAlarm;
        self->_enabled = v35;
        self->_sleepSchedule = v35;
        if (sleepAlarm)
          goto LABEL_46;
        v7 = 1;
        v118 = 1;
LABEL_49:
        v21 = 1;
        goto LABEL_50;
      }
LABEL_44:
      v118 = 0;
      goto LABEL_49;
    }
LABEL_43:
    v34 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmIsSleep"));
    self->_sleepAlarm = v34;
    if (v34)
      goto LABEL_39;
    goto LABEL_44;
  }
  v118 = 0;
LABEL_50:
  if (v6 < *((float *)v17 + 865))
  {
    if (v21)
    {
      v37 = self->_sleepAlarm;
      goto LABEL_57;
    }
LABEL_56:
    v37 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmIsSleep"));
LABEL_57:
    v40 = HIDWORD(v118);
    self->_sleepAlarm = v37;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmDismissDate"));
    v41 = (NSDate *)objc_claimAutoreleasedReturnValue();
    p_dismissedDate = &self->_dismissedDate;
    dismissedDate = self->_dismissedDate;
    self->_dismissedDate = v41;

    self->_dismissedAction = 0;
    v39 = self->_sleepAlarm;
    if (!v39)
    {
      v117 = 0;
      v38 = 1;
      v21 = 1;
      goto LABEL_74;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmWakeupForSleepTracking"));
    v44 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (!v44)
      v45 = *p_dismissedDate;
    objc_storeStrong((id *)&self->_dismissedDate, v45);
    self->_dismissedAction = 5;
    if (-[NSDate mtIsAfterDate:](v44, "mtIsAfterDate:", self->_dismissedDate))
      v46 = v44;
    else
      v46 = 0;
    objc_storeStrong((id *)&self->_keepOffUntilDate, v46);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmBedtimeForSleepTracking"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_bedtimeDismissedDate, v47);
    v48 = 1;
    if (v47)
      v48 = 2;
    self->_bedtimeDismissedAction = v48;
    v49 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmFiring"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmFireDate"));
    v50 = (NSDate *)objc_claimAutoreleasedReturnValue();
    firedDate = self->_firedDate;
    self->_firedDate = v50;

    if ((v49 & 1) == 0)
    {
      v52 = self->_firedDate;
      if (v52)
      {
        if (!*p_dismissedDate)
        {
LABEL_70:
          objc_storeStrong((id *)&self->_bedtimeFiredDate, v52);
          v53 = self->_firedDate;
          self->_firedDate = 0;

          v117 = 1;
LABEL_72:

          v38 = 1;
          v39 = 1;
          v21 = 1;
          v40 = HIDWORD(v118);
          goto LABEL_74;
        }
        if (-[NSDate mtIsAfterDate:](self->_firedDate, "mtIsAfterDate:"))
        {
          v52 = self->_firedDate;
          goto LABEL_70;
        }
      }
    }
    v117 = 0;
    goto LABEL_72;
  }
  v38 = 0;
  v117 = 0;
  v39 = 0;
  v40 = HIDWORD(v118);
LABEL_74:
  BYTE4(v120) = v39;
  v54 = v6 < 2.4;
  BYTE4(v119) = v38;
  if (v6 < 2.4)
  {
    v55 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTAlarmOnboardingVersion"));
    self->_onboardingVersion = v55;
    if (!v55)
    {
      self->_sleepModeOptions = objc_msgSend((id)objc_opt_class(), "defaultSleepModeOptions");
      v40 = 1;
    }
  }
  if (v6 < 2.5
    && (v56 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTAlarmOnboardingVersion")),
        self->_onboardingVersion = v56,
        v54 = 1,
        v56))
  {
    self->_sleepMode = 1;
    self->_sleepModeOptions = objc_msgSend((id)objc_opt_class(), "defaultSleepModeOptions");
    v40 = 1;
    LOBYTE(v119) = 1;
  }
  else
  {
    LOBYTE(v119) = 0;
  }
  if (v6 < 2.6)
  {
    if (v21)
    {
      if (self->_sleepAlarm)
      {
LABEL_84:
        v57 = v40;
        v58 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmEnabled"));
        v59 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmSleepScheduleKey"));
        MTLogForCategory(3);
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v123 = v58;
          v124 = 1024;
          v125 = v59;
          _os_log_impl(&dword_19AC4E000, v60, OS_LOG_TYPE_DEFAULT, "[Migration] (2.6) old enabled: %d, sleepSchedule: %d", buf, 0xEu);
        }

        self->_enabled = v58 | v59;
        self->_sleepSchedule = v58 | v59;
        MTLogForCategory(3);
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          enabled = self->_enabled;
          sleepSchedule = self->_sleepSchedule;
          *(_DWORD *)buf = 67109376;
          v123 = enabled;
          v124 = 1024;
          v125 = sleepSchedule;
          _os_log_impl(&dword_19AC4E000, v61, OS_LOG_TYPE_DEFAULT, "[Migration] (2.6) new enabled: %d, sleepSchedule: %d", buf, 0xEu);
        }

        LODWORD(v118) = 1;
        v21 = 1;
        v7 = 1;
        v40 = v57;
        goto LABEL_91;
      }
    }
    else
    {
      v64 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmIsSleep"));
      self->_sleepAlarm = v64;
      if (v64)
        goto LABEL_84;
    }
    v21 = 1;
  }
LABEL_91:
  LOBYTE(v120) = v54;
  if (v6 >= 3.0)
  {
    v13 = 0;
    goto LABEL_99;
  }
  if (!v21)
  {
    v69 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmIsSleep"));
    self->_sleepAlarm = v69;
    if (v69)
      goto LABEL_94;
LABEL_97:
    v13 = 0;
    goto LABEL_98;
  }
  if (!self->_sleepAlarm)
    goto LABEL_97;
LABEL_94:
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmRepeatSchedule"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  self->_repeatSchedule = objc_msgSend(v65, "unsignedIntegerValue");

  +[MTAlarm sleepScheduleString:](MTAlarm, "sleepScheduleString:", self->_repeatSchedule);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v66);
  v68 = self->_alarmID;
  self->_alarmID = v67;

  v13 = 1;
LABEL_98:
  v21 = 1;
LABEL_99:
  v12 = v40 != 0;
  v11 = (_DWORD)v118 != 0;
  v9 = v21 != 0;
  v8 = v19 != 0;
  if (!v7)
  {
    v10 = BYTE4(v118);
    v14 = v117;
LABEL_103:
    self->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmEnabled"));
    if (v9)
      goto LABEL_105;
    goto LABEL_104;
  }
  v10 = BYTE4(v118);
  v14 = v117;
  if (v21)
    goto LABEL_105;
LABEL_104:
  self->_sleepAlarm = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmIsSleep"));
LABEL_105:
  if (!v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmSound"));
    v70 = (MTSound *)objc_claimAutoreleasedReturnValue();
    v71 = self->_sound;
    self->_sound = v70;

  }
  self->_sleepTracking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmSleepTrackingKey"));
  if ((v10 & 1) == 0)
    self->_timeInBedTracking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmTimeInBedTrackingKey"));
  if ((v119 & 1) != 0)
  {
    if (v11)
      goto LABEL_111;
  }
  else
  {
    self->_sleepMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmBedtimeDoNotDisturb"));
    if (v11)
    {
LABEL_111:
      if (v12)
        goto LABEL_113;
      goto LABEL_112;
    }
  }
  self->_sleepSchedule = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmSleepScheduleKey"));
  if (!v12)
LABEL_112:
    self->_sleepModeOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTAlarmBedtimeDoNotDisturbOptions"));
LABEL_113:
  if ((v119 & 0x100000000) == 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmDismissDate"));
    v72 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v73 = self->_dismissedDate;
    self->_dismissedDate = v72;

    self->_dismissedAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTAlarmDismissAction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmBedtimeDismissDate"));
    v74 = (NSDate *)objc_claimAutoreleasedReturnValue();
    bedtimeDismissedDate = self->_bedtimeDismissedDate;
    self->_bedtimeDismissedDate = v74;

    self->_bedtimeDismissedAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTAlarmBedtimeDismissAction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmKeepOffUntilDate"));
    v76 = (NSDate *)objc_claimAutoreleasedReturnValue();
    keepOffUntilDate = self->_keepOffUntilDate;
    self->_keepOffUntilDate = v76;

  }
  if ((v120 & 1) == 0)
    self->_onboardingVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MTAlarmOnboardingVersion"));
  if ((v120 & 0x100000000) != 0)
  {
    if ((v14 & 1) != 0)
      goto LABEL_119;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmFireDate"));
    v113 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v114 = self->_firedDate;
    self->_firedDate = v113;

    if ((v14 & 1) != 0)
    {
LABEL_119:
      if ((v13 & 1) != 0)
        goto LABEL_121;
      goto LABEL_120;
    }
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmBedtimeFireDate"));
  v115 = (NSDate *)objc_claimAutoreleasedReturnValue();
  bedtimeFiredDate = self->_bedtimeFiredDate;
  self->_bedtimeFiredDate = v115;

  if ((v13 & 1) == 0)
  {
LABEL_120:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmRepeatSchedule"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    self->_repeatSchedule = objc_msgSend(v78, "unsignedIntegerValue");

  }
LABEL_121:
  if (!self->_alarmID)
  {
    v79 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmID"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (NSUUID *)objc_msgSend(v79, "initWithUUIDString:", v80);
    v82 = self->_alarmID;
    self->_alarmID = v81;

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmHour"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hour = objc_msgSend(v83, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmMinute"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  self->_minute = objc_msgSend(v84, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmBedtimeHour"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  self->_bedtimeHour = objc_msgSend(v85, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmBedtimeMinute"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  self->_bedtimeMinute = objc_msgSend(v86, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmDay"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "integerValue");

  if (-[MTAlarm isValidDateComponent:](self, "isValidDateComponent:", v88))
    self->_day = v88;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmMonth"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "integerValue");

  if (-[MTAlarm isValidDateComponent:](self, "isValidDateComponent:", v90))
    self->_month = v90;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmYear"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "integerValue");

  if (-[MTAlarm isValidDateComponent:](self, "isValidDateComponent:", v92))
    self->_year = v92;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmBedtimeReminderMinutes"));
  v93 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  bedtimeReminder = self->_bedtimeReminder;
  self->_bedtimeReminder = v93;

  self->_allowsSnooze = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MTAlarmAllowsSnooze"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmSnoozeFireDate"));
  v95 = (NSDate *)objc_claimAutoreleasedReturnValue();
  snoozeFireDate = self->_snoozeFireDate;
  self->_snoozeFireDate = v95;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmBedtimeSnoozeFireDate"));
  v97 = (NSDate *)objc_claimAutoreleasedReturnValue();
  bedtimeSnoozeFireDate = self->_bedtimeSnoozeFireDate;
  self->_bedtimeSnoozeFireDate = v97;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmLastModifiedDate"));
  v99 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastModifiedDate = self->_lastModifiedDate;
  self->_lastModifiedDate = v99;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmTitle"));
  v101 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v101;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmOverriddenForDate"));
  v103 = (NSDate *)objc_claimAutoreleasedReturnValue();
  overriddenForDate = self->_overriddenForDate;
  self->_overriddenForDate = v103;

  v105 = (void *)MEMORY[0x1E0C99E60];
  v106 = objc_opt_class();
  v107 = objc_opt_class();
  objc_msgSend(v105, "setWithObjects:", v106, v107, objc_opt_class(), 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v108, CFSTR("MTAlarmSiriContext"));
  v109 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  siriContext = self->_siriContext;
  self->_siriContext = v109;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTAlarmBypassReloadDate"));
  v111 = (NSDate *)objc_claimAutoreleasedReturnValue();
  bypassReloadDate = self->_bypassReloadDate;
  self->_bypassReloadDate = v111;

}

- (BOOL)isValidDateComponent:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x7FFFFFFFFFFFFFFELL;
}

- (NSString)displayTitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[MTAlarm title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ALARM_DEFAULT_TITLE"), &stru_1E39CF258, CFSTR("Localizable"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initFromDeserializer:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[MTAlarm _initCommon](self, "_initCommon");
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "_updatePropertiesFromDeserializer:", v4);

  return v6;
}

- (id)_initCommon
{
  char *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAlarm;
  v2 = -[MTAlarm init](&v6, sel_init);
  MTCurrentDateProvider();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)*((_QWORD *)v2 + 27);
  *((_QWORD *)v2 + 27) = v3;

  *(int64x2_t *)(v2 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *((_QWORD *)v2 + 7) = 0x7FFFFFFFFFFFFFFFLL;
  return v2;
}

- (BOOL)shouldBeScheduled
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!-[MTAlarm isSleepAlarm](self, "isSleepAlarm"))
    return -[MTAlarm isEnabled](self, "isEnabled");
  if (-[MTAlarm sleepSchedule](self, "sleepSchedule"))
    return 1;
  MTLogForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarm alarmID](self, "alarmID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_19AC4E000, v4, OS_LOG_TYPE_DEFAULT, "Not scheduling %{public}@ because sleep schedule is disabled", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

- (id)upcomingTriggersAfterDate:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[MTAlarm nextTriggersAfterDate:includeBedtime:](self, "nextTriggersAfterDate:includeBedtime:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MTAlarm_MTScheduling__upcomingTriggersAfterDate___block_invoke;
  v7[3] = &unk_1E39CCC60;
  v7[4] = self;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __51__MTAlarm_MTScheduling__upcomingTriggersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isSleepAlarm")
    && objc_msgSend(v3, "isForAlert")
    && (objc_msgSend(*(id *)(a1 + 32), "isSingleTimeAlarm") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) == 0)
  {
    MTLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "alarmID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling alarm %{public}@ because it's disabled", (uint8_t *)&v8, 0xCu);

    }
    goto LABEL_12;
  }
  if (objc_msgSend(v3, "isBedtimeRelated") && (MTShouldHandleForBedtime() & 1) == 0)
  {
    MTLogForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling bedtime triggers", (uint8_t *)&v8, 2u);
    }
LABEL_12:

    v4 = 0;
    goto LABEL_13;
  }
  v4 = 1;
LABEL_13:

  return v4;
}

- (BOOL)overridesScheduledObject:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "scheduleable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = -[MTAlarm overridesAlarm:trigger:calendar:](self, "overridesAlarm:trigger:calendar:", v8, v9, v6);
  return (char)v7;
}

- (id)alarmIntentDisplayString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[MTAlarm title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!-[MTAlarm isSleepAlarm](self, "isSleepAlarm")
      || (v4 = (void *)MEMORY[0x1E0CB3940],
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "deferredLocalizedIntentsStringWithFormat:fromTable:bundle:", CFSTR("BED_TIME"), 0, v5),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v3))
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[MTAlarm hour](self, "hour");
      v8 = -[MTAlarm minute](self, "minute");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateBySettingHour:minute:second:ofDate:options:", v7, v8, 0, v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v10, 0, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        -[MTAlarm displayTitle](self, "displayTitle");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v3;
}

- (id)alarmIDIntentObject
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[MTAlarm alarmIDString](self, "alarmIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CBDA08]);
    -[MTAlarm alarmIDString](self, "alarmIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm alarmIntentDisplayString](self, "alarmIntentDisplayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithIdentifier:displayString:", v5, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)intentLabel
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[MTAlarm title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[MTAlarm title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)timeObject
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MTAlarm hour](self, "hour");
  v5 = -[MTAlarm minute](self, "minute");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateBySettingHour:minute:second:ofDate:options:", v4, v5, 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CBDA08]);
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%f"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithIdentifier:displayString:", v12, v8);

  return v13;
}

- (MTIntentAlarm)intentAlarm
{
  MTIntentAlarm *v3;
  MTIntentAlarm *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MTAlarm alarmIDString](self, "alarmIDString");
  v3 = (MTIntentAlarm *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [MTIntentAlarm alloc];
    -[MTAlarm alarmIDString](self, "alarmIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm alarmIntentDisplayString](self, "alarmIntentDisplayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[MTIntentAlarm initWithIdentifier:displayString:](v4, "initWithIdentifier:displayString:", v5, v6);

    -[MTAlarm dateComponents](self, "dateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIntentAlarm setDateComponents:](v3, "setDateComponents:", v7);

    -[MTAlarm displayTitle](self, "displayTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIntentAlarm setLabel:](v3, "setLabel:", v8);

    MTRepeatDaysForAlarmRepeatSchedule(-[MTAlarm repeatSchedule](self, "repeatSchedule"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTIntentAlarm setRepeatSchedule:](v3, "setRepeatSchedule:", v9);

  }
  return v3;
}

- (id)nextExpectedWakeUpDateAfterDate:(id)a3
{
  return 0;
}

- (id)nextExpectedBedtimeDateAfterDate:(id)a3
{
  return 0;
}

- (BOOL)confirmedLastBedtimeReminder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[MTAlarm bedtimeDismissedDate](self, "bedtimeDismissedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[MTAlarm bedtimeDismissedAction](self, "bedtimeDismissedAction") == 2)
  {
    -[MTAlarm firedDate](self, "firedDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[MTAlarm bedtimeDismissedDate](self, "bedtimeDismissedDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTAlarm firedDate](self, "firedDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "mtIsAfterOrSameAsDate:", v6);

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)alarm
{
  return objc_alloc_init((Class)a1);
}

+ (MTAlarm)alarmWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  return (MTAlarm *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithHour:minute:", a3, a4);
}

+ (id)sleepAlarm
{
  return (id)objc_msgSend(a1, "sleepAlarmWithSchedule:", 127);
}

+ (id)sleepAlarmWithSchedule:(unint64_t)a3
{
  void *v5;
  void *v6;

  +[MTAlarm sleepScheduleString:](MTAlarm, "sleepScheduleString:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sleepAlarmWithId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRepeatSchedule:", a3);

  return v6;
}

+ (id)sleepAlarmWithId:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "alarm");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    v7 = (void *)v5[2];
    v5[2] = v6;

  }
  objc_msgSend(v5, "setSleepAlarm:", 1);
  +[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSound:", v8);

  objc_msgSend(v5, "setRepeatSchedule:", 127);
  objc_msgSend(v5, "setBedtimeReminderMinutes:", 15);
  objc_msgSend(v5, "setSleepSchedule:", 1);
  objc_msgSend(v5, "setSleepModeOptions:", objc_msgSend((id)objc_opt_class(), "defaultSleepModeOptions"));

  return v5;
}

+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4
{
  void *v6;

  objc_msgSend(a1, "sleepAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHour:", a3);
  objc_msgSend(v6, "setMinute:", a4);
  return v6;
}

+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4 bedtimeHour:(int64_t)a5 bedtimeMinute:(int64_t)a6
{
  void *v8;

  objc_msgSend(a1, "sleepAlarmWithHour:minute:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBedtimeHour:", a5);
  objc_msgSend(v8, "setBedtimeMinute:", a6);
  return v8;
}

+ (id)sleepAlarmWithHour:(int64_t)a3 minute:(int64_t)a4 year:(int64_t)a5 month:(int64_t)a6 day:(int64_t)a7 bedtimeHour:(int64_t)a8 bedtimeMinute:(int64_t)a9
{
  void *v17;

  if (a5 == 0x7FFFFFFFFFFFFFFFLL || a6 == 0x7FFFFFFFFFFFFFFFLL || a7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "sleepAlarmWithHour:minute:bedtimeHour:bedtimeMinute:", a3, a4, a8, a9, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "sleepAlarmWithSchedule:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHour:", a3);
    objc_msgSend(v17, "setMinute:", a4);
    objc_msgSend(v17, "setYear:", a5);
    objc_msgSend(v17, "setMonth:", a6);
    objc_msgSend(v17, "setDay:", a7);
    objc_msgSend(v17, "setBedtimeHour:", a8);
    objc_msgSend(v17, "setBedtimeMinute:", a9);
  }
  return v17;
}

- (MTAlarm)initWithIdentifier:(id)a3
{
  id v4;
  MTAlarm *v5;
  uint64_t v6;
  NSUUID *alarmID;

  v4 = a3;
  v5 = -[MTAlarm _initCommon](self, "_initCommon");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    alarmID = v5->_alarmID;
    v5->_alarmID = (NSUUID *)v6;

  }
  return v5;
}

- (MTAlarm)init
{
  void *v3;
  MTAlarm *v4;

  MTCurrentDateProvider();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MTAlarm initWithCurrentTimeFromCurrentDateProvider:](self, "initWithCurrentTimeFromCurrentDateProvider:", v3);

  return v4;
}

- (MTAlarm)initWithCurrentTimeFromCurrentDateProvider:(id)a3
{
  void *v4;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  MTAlarm *v9;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = (void (**)(_QWORD))a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 96, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MTAlarm initWithHour:minute:currentDateProvider:](self, "initWithHour:minute:currentDateProvider:", objc_msgSend(v8, "hour"), objc_msgSend(v8, "minute"), v5);
  return v9;
}

- (MTAlarm)initWithHour:(unint64_t)a3 minute:(unint64_t)a4
{
  void *v7;
  MTAlarm *v8;

  MTCurrentDateProvider();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MTAlarm initWithHour:minute:currentDateProvider:](self, "initWithHour:minute:currentDateProvider:", a3, a4, v7);

  return v8;
}

- (MTAlarm)initWithHour:(unint64_t)a3 minute:(unint64_t)a4 currentDateProvider:(id)a5
{
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MTAlarm;
  v9 = -[MTAlarm init](&v17, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v9 + 2);
    *((_QWORD *)v9 + 2) = v10;

    *((_QWORD *)v9 + 3) = a3;
    *((_QWORD *)v9 + 4) = a4;
    *(int64x2_t *)(v9 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *((_QWORD *)v9 + 7) = 0x7FFFFFFFFFFFFFFFLL;
    v9[12] = 1;
    v9[14] = 1;
    +[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v9 + 15);
    *((_QWORD *)v9 + 15) = v12;

    v14 = objc_msgSend(v8, "copy");
    v15 = (void *)*((_QWORD *)v9 + 27);
    *((_QWORD *)v9 + 27) = v14;

  }
  return (MTAlarm *)v9;
}

+ (unint64_t)defaultSleepModeOptions
{
  return 49;
}

- (unint64_t)bedtimeReminderMinutes
{
  return -[NSNumber unsignedIntegerValue](self->_bedtimeReminder, "unsignedIntegerValue");
}

- (void)setBedtimeReminderMinutes:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *bedtimeReminder;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  bedtimeReminder = self->_bedtimeReminder;
  self->_bedtimeReminder = v4;

}

+ (BOOL)_isInternalBuild
{
  if (_isInternalBuild_onceToken != -1)
    dispatch_once(&_isInternalBuild_onceToken, &__block_literal_global_34);
  return _isInternalBuild_isInternal;
}

uint64_t __27__MTAlarm__isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _isInternalBuild_isInternal = result;
  return result;
}

+ (id)sleepScheduleString:(unint64_t)byte7
{
  const __CFAllocator *v3;
  const __CFUUID *v4;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFUUIDCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7, byte7);
  return (id)(id)CFUUIDCreateString(v3, v4);
}

- (id)dateComponents
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setHour:", -[MTAlarm hour](self, "hour"));
  objc_msgSend(v3, "setMinute:", -[MTAlarm minute](self, "minute"));
  objc_msgSend(v3, "setDay:", -[MTAlarm day](self, "day"));
  objc_msgSend(v3, "setMonth:", -[MTAlarm month](self, "month"));
  objc_msgSend(v3, "setYear:", -[MTAlarm year](self, "year"));
  objc_msgSend(v3, "setSecond:", 0);
  return v3;
}

- (id)bedtimeComponents
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setHour:", -[MTAlarm bedtimeHour](self, "bedtimeHour"));
  objc_msgSend(v3, "setMinute:", -[MTAlarm bedtimeMinute](self, "bedtimeMinute"));
  objc_msgSend(v3, "setSecond:", 0);
  return v3;
}

- (NSURL)alarmURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MTAlarm alarmID](self, "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("x-apple-clock:alarm?id="), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (BOOL)repeats
{
  return -[MTAlarm repeatSchedule](self, "repeatSchedule") != 0;
}

- (BOOL)isBedtimeSnoozed
{
  void *v2;
  BOOL v3;

  -[MTAlarm bedtimeSnoozeFireDate](self, "bedtimeSnoozeFireDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)resetSnoozeFireDate
{
  void *v3;

  -[MTAlarm setSnoozeFireDate:](self, "setSnoozeFireDate:", 0);
  -[MTAlarm lastModifiedDate](self, "lastModifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm setDismissedDate:](self, "setDismissedDate:", v3);

  -[MTAlarm setDismissedAction:](self, "setDismissedAction:", 6);
}

- (void)setTitle:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *title;
  id v7;
  id v8;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v4 = v7;
  }
  else
  {

    v4 = 0;
  }
  v8 = v4;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  title = self->_title;
  self->_title = v5;

}

- (unint64_t)sleepDuration
{
  double v2;

  -[MTAlarm sleepDurationSeconds](self, "sleepDurationSeconds");
  return (unint64_t)(v2 / 60.0);
}

- (double)sleepDurationSeconds
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (!-[MTAlarm isSleepAlarm](self, "isSleepAlarm"))
    return 0.0;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setHour:", -[MTAlarm bedtimeHour](self, "bedtimeHour"));
  objc_msgSend(v3, "setMinute:", -[MTAlarm bedtimeMinute](self, "bedtimeMinute"));
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setHour:", -[MTAlarm hour](self, "hour"));
  objc_msgSend(v4, "setMinute:", -[MTAlarm minute](self, "minute"));
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mtTimeIntervalSinceComponents:now:", v3, v5);
  v7 = v6;

  return v7;
}

- (NSDate)nextFireDate
{
  void *v2;
  void *v3;

  -[MTAlarm nextTrigger](self, "nextTrigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)nextFireDateAfterDate:(id)a3
{
  return -[MTAlarm nextFireDateAfterDate:includeBedtimeNotification:](self, "nextFireDateAfterDate:includeBedtimeNotification:", a3, 0);
}

- (id)nextFireDateAfterDate:(id)a3 includeBedtimeNotification:(BOOL)a4
{
  void *v4;
  void *v5;

  -[MTAlarm nextTriggerAfterDate:includeBedtimeNotification:](self, "nextTriggerAfterDate:includeBedtimeNotification:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextTrigger
{
  void *v3;
  void *v4;

  (*((void (**)(void))self->_currentDateProvider + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm nextTriggerAfterDate:](self, "nextTriggerAfterDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextTriggerAfterDate:(id)a3
{
  return -[MTAlarm nextTriggerAfterDate:includeBedtimeNotification:](self, "nextTriggerAfterDate:includeBedtimeNotification:", a3, 0);
}

- (id)nextTriggerAfterDate:(id)a3 includeBedtimeNotification:(BOOL)a4
{
  return -[MTAlarm nextTriggerAfterDate:includeSnooze:includeBedtimeNotification:](self, "nextTriggerAfterDate:includeSnooze:includeBedtimeNotification:", a3, 1, a4);
}

- (id)nextTriggerAfterDate:(id)a3 includeSnooze:(BOOL)a4 includeBedtimeNotification:(BOOL)a5
{
  void *v5;
  void *v6;

  -[MTAlarm nextTriggersAfterDate:includeSnooze:includeBedtimeNotification:](self, "nextTriggersAfterDate:includeSnooze:includeBedtimeNotification:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nextTriggerAfterDate:(id)a3 ofType:(unint64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[MTAlarm nextTriggersAfterDate:inclusionOptions:](self, "nextTriggersAfterDate:inclusionOptions:", a3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__MTAlarm_nextTriggerAfterDate_ofType___block_invoke;
  v8[3] = &__block_descriptor_40_e19_B16__0__MTTrigger_8l;
  v8[4] = a4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __39__MTAlarm_nextTriggerAfterDate_ofType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "triggerType") == *(_QWORD *)(a1 + 32);
}

- (id)nextTriggersAfterDate:(id)a3
{
  return -[MTAlarm nextTriggersAfterDate:includeBedtime:](self, "nextTriggersAfterDate:includeBedtime:", a3, 0);
}

- (id)nextTriggersAfterDate:(id)a3 includeBedtime:(BOOL)a4
{
  return -[MTAlarm nextTriggersAfterDate:inclusionOptions:](self, "nextTriggersAfterDate:inclusionOptions:", a3, 1);
}

- (id)nextTriggersAfterDate:(id)a3 includeSnooze:(BOOL)a4 includeBedtimeNotification:(BOOL)a5
{
  return -[MTAlarm nextTriggersAfterDate:inclusionOptions:](self, "nextTriggersAfterDate:inclusionOptions:", a3, a4, a5);
}

- (id)nextTriggersAfterDate:(id)a3 inclusionOptions:(unint64_t)a4
{
  char v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v48;
  void *v49;
  __int16 v50;
  _BYTE v51[10];
  void *v52;
  uint64_t v53;

  v4 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MTLogForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarm alarmID](self, "alarmID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138543618;
    v49 = v8;
    v50 = 2114;
    *(_QWORD *)v51 = v6;
    _os_log_impl(&dword_19AC4E000, v7, OS_LOG_TYPE_DEFAULT, "Date before computing earlierst trigger date for %{public}@: %{public}@", (uint8_t *)&v48, 0x16u);

  }
  -[MTAlarm _earliestTriggerDateForDate:](self, "_earliestTriggerDateForDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MTLogForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarm alarmID](self, "alarmID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138543618;
    v49 = v11;
    v50 = 2114;
    *(_QWORD *)v51 = v9;
    _os_log_impl(&dword_19AC4E000, v10, OS_LOG_TYPE_DEFAULT, "Computing next fire date for %{public}@ after %{public}@", (uint8_t *)&v48, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarm alarmID](self, "alarmID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MTAlarm isSnoozed](self, "isSnoozed");
    v17 = -[MTAlarm repeats](self, "repeats");
    v48 = 138543874;
    v49 = v15;
    v50 = 1024;
    *(_DWORD *)v51 = v16;
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = v17;
    _os_log_impl(&dword_19AC4E000, v14, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ is snoozed:%d, repeats: %d", (uint8_t *)&v48, 0x18u);

  }
  if (-[MTAlarm isSnoozed](self, "isSnoozed") && !-[MTAlarm repeats](self, "repeats"))
  {
    v18 = 0;
  }
  else
  {
    if (-[MTAlarm isSingleTimeAlarm](self, "isSingleTimeAlarm"))
    {
      -[MTAlarm singleTimeOverrideDateInCalendar:](self, "singleTimeOverrideDateInCalendar:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      MTLogForCategory(3);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[MTAlarm alarmID](self, "alarmID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543618;
        v49 = v20;
        v50 = 2114;
        *(_QWORD *)v51 = v18;
        _os_log_impl(&dword_19AC4E000, v19, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ override alarm date: %{public}@", (uint8_t *)&v48, 0x16u);

      }
      +[MTTrigger triggerWithDate:triggerType:isPastOverrideEvent:](MTTrigger, "triggerWithDate:triggerType:isPastOverrideEvent:", v18, 4, objc_msgSend(v9, "mtIsAfterOrSameAsDate:", v18));
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MTAlarm _nextDateHelperWithDate:calendar:](self, "_nextDateHelperWithDate:calendar:", v9, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      MTLogForCategory(3);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[MTAlarm alarmID](self, "alarmID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543618;
        v49 = v23;
        v50 = 2114;
        *(_QWORD *)v51 = v18;
        _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ next alarm date: %{public}@", (uint8_t *)&v48, 0x16u);

      }
      if (-[MTAlarm isSleepAlarm](self, "isSleepAlarm"))
        v24 = 4;
      else
        v24 = 0;
      +[MTTrigger triggerWithDate:triggerType:](MTTrigger, "triggerWithDate:triggerType:", v18, v24);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v21;
    MTLogForCategory(3);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[MTAlarm alarmID](self, "alarmID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543618;
      v49 = v27;
      v50 = 2114;
      *(_QWORD *)v51 = v25;
      _os_log_impl(&dword_19AC4E000, v26, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ alarm trigger: %{public}@", (uint8_t *)&v48, 0x16u);

    }
    objc_msgSend(v12, "addObject:", v25);
    MTLogForCategory(3);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[MTAlarm alarmID](self, "alarmID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543874;
      v49 = v29;
      v50 = 2114;
      *(_QWORD *)v51 = v18;
      *(_WORD *)&v51[8] = 2114;
      v52 = v9;
      _os_log_impl(&dword_19AC4E000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ has next fire date %{public}@ after %{public}@", (uint8_t *)&v48, 0x20u);

    }
  }
  v30 = v4 & 1;
  MTLogForCategory(3);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarm alarmID](self, "alarmID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138543618;
    v49 = v32;
    v50 = 1024;
    *(_DWORD *)v51 = v30;
    _os_log_impl(&dword_19AC4E000, v31, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ include snooze: %d", (uint8_t *)&v48, 0x12u);

  }
  if (v30 && -[MTAlarm isSnoozed](self, "isSnoozed"))
  {
    -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "mtIsBeforeOrSameAsDate:", v9);

    MTLogForCategory(3);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if ((v34 & 1) != 0)
    {
      if (!v36)
      {
LABEL_39:

        goto LABEL_40;
      }
      -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTAlarm alarmID](self, "alarmID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543618;
      v49 = v37;
      v50 = 2114;
      *(_QWORD *)v51 = v38;
      _os_log_impl(&dword_19AC4E000, v35, OS_LOG_TYPE_DEFAULT, "Snooze has already fired (%{public}@) for alert %{public}@", (uint8_t *)&v48, 0x16u);

    }
    else
    {
      if (v36)
      {
        -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTAlarm alarmID](self, "alarmID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543618;
        v49 = v39;
        v50 = 2114;
        *(_QWORD *)v51 = v40;
        _os_log_impl(&dword_19AC4E000, v35, OS_LOG_TYPE_DEFAULT, "Snooze hasn't fired yet (%{public}@) for alert %{public}@", (uint8_t *)&v48, 0x16u);

      }
      -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
      v35 = objc_claimAutoreleasedReturnValue();
      if (-[MTAlarm isSleepAlarm](self, "isSleepAlarm"))
        v41 = 5;
      else
        v41 = 1;
      +[MTTrigger triggerWithDate:triggerType:](MTTrigger, "triggerWithDate:triggerType:", v35, v41);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v37);
    }

    goto LABEL_39;
  }
LABEL_40:
  objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_52);
  MTLogForCategory(3);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarm alarmID](self, "alarmID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138543618;
    v49 = v43;
    v50 = 2114;
    *(_QWORD *)v51 = v12;
    _os_log_impl(&dword_19AC4E000, v42, OS_LOG_TYPE_DEFAULT, "Alarm %{public}@ candidate triggers after sorting: %{public}@", (uint8_t *)&v48, 0x16u);

  }
  objc_msgSend(v12, "firstObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  MTLogForCategory(3);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarm alarmID](self, "alarmID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 138543618;
    v49 = v46;
    v50 = 2114;
    *(_QWORD *)v51 = v44;
    _os_log_impl(&dword_19AC4E000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ has next trigger %{public}@", (uint8_t *)&v48, 0x16u);

  }
  return v12;
}

uint64_t __50__MTAlarm_nextTriggersAfterDate_inclusionOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "triggerDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_earliestTriggerDateForDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  MTAlarm *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __39__MTAlarm__earliestTriggerDateForDate___block_invoke;
  v23[3] = &unk_1E39CD388;
  v6 = v4;
  v24 = v6;
  v25 = self;
  v7 = v5;
  v26 = v7;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AED0080](v23);
  -[MTAlarm dismissedDate](self, "dismissedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("dismissed"), v9);

  -[MTAlarm bedtimeDismissedDate](self, "bedtimeDismissedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("bedtime dismissed"), v10);

  -[MTAlarm firedDate](self, "firedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("fired"), v11);

  -[MTAlarm bedtimeFiredDate](self, "bedtimeFiredDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("bedtime fired"), v12);

  -[MTAlarm keepOffUntilDate](self, "keepOffUntilDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("keep off until"), v13);

  -[MTAlarm lastModifiedDate](self, "lastModifiedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("modified"), v14);

  -[MTAlarm overriddenForDate](self, "overriddenForDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("overriden for date"), v15);

  objc_msgSend(MEMORY[0x1E0C99D68], "mtLatest:", v7);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v6;
  v19 = v18;

  MTLogForCategory(3);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    -[MTAlarm alarmID](self, "alarmID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v21;
    v29 = 2114;
    v30 = v19;
    _os_log_impl(&dword_19AC4E000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ earliest trigger date: %{public}@", buf, 0x16u);

  }
  return v19;
}

void __39__MTAlarm__earliestTriggerDateForDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    MTLogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "alarmID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2114;
      v18 = v5;
      v19 = 2114;
      v20 = 0;
      v14 = "%{public}@ %{public}@ %{public}@ is nil";
LABEL_10:
      _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0x20u);

    }
LABEL_11:

    goto LABEL_12;
  }
  v8 = objc_msgSend(v6, "mtIsAfterDate:", *(_QWORD *)(a1 + 32));
  MTLogForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "alarmID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2114;
      v18 = v5;
      v19 = 2114;
      v20 = v7;
      v14 = "%{public}@ %{public}@ %{public}@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "alarmID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    v15 = 138544130;
    v16 = v11;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_19AC4E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ after %{public}@ (%{public}@)", (uint8_t *)&v15, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
LABEL_12:

}

- (id)_nextDateHelperWithDate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, unint64_t);
  void *v16;
  MTAlarm *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  -[MTAlarm dateComponents](self, "dateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MTAlarm repeats](self, "repeats") && -[MTAlarm repeatSchedule](self, "repeatSchedule") != 127)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__7;
    v25 = __Block_byref_object_dispose__7;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v9 = -[MTAlarm repeatSchedule](self, "repeatSchedule");
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __44__MTAlarm__nextDateHelperWithDate_calendar___block_invoke;
    v16 = &unk_1E39CD3B0;
    v17 = self;
    v18 = v6;
    v10 = v7;
    v19 = v10;
    v20 = &v21;
    MTAlarmRepeatScheduleEnumerateDays(v9, &v13);
    objc_msgSend(v8, "setWeekday:", objc_msgSend(v10, "component:fromDate:", 512, v22[5], v13, v14, v15, v16, v17));

    _Block_object_dispose(&v21, 8);
  }
  objc_msgSend(v7, "mtNextDateAfterDate:matchingComponents:", v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __44__MTAlarm__nextDateHelperWithDate_calendar___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  if (objc_msgSend((id)objc_opt_class(), "_date:isOnDay:calendar:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 48), "components:fromDate:", 30, *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHour:", objc_msgSend(*(id *)(a1 + 32), "hour"));
    objc_msgSend(v4, "setMinute:", objc_msgSend(*(id *)(a1 + 32), "minute"));
    objc_msgSend(*(id *)(a1 + 48), "dateFromComponents:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "mtIsBeforeOrSameAsDate:", *(_QWORD *)(a1 + 40)))
    {

    }
    else
    {

      v5 = v10;
      if (v10)
        goto LABEL_9;
    }
  }
  if (a2 < 7)
    v6 = a2 + 1;
  else
    v6 = 0;
  objc_msgSend(*(id *)(a1 + 48), "mtNextDateAfterDate:matchingUnit:value:", *(_QWORD *)(a1 + 40), 512, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v11 = v5;
  objc_msgSend(v5, "earlierDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (BOOL)isSingleTimeAlarm
{
  return !-[MTAlarm repeatSchedule](self, "repeatSchedule") && -[MTAlarm year](self, "year") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)singleTimeOverrideDateInCalendar:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!-[MTAlarm isSingleTimeAlarm](self, "isSingleTimeAlarm"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAlarm.m"), 670, CFSTR("Must be a single time override"));

  }
  -[MTAlarm dateComponents](self, "dateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)overridesNextAlarm:(id)a3 date:(id)a4 calendar:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v15;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  if (!-[MTAlarm isSingleTimeAlarm](self, "isSingleTimeAlarm"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAlarm.m"), 676, CFSTR("Must be a single time override"));

  }
  -[MTAlarm nextTriggerAfterDate:ofType:](self, "nextTriggerAfterDate:ofType:", v9, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MTAlarm overridesAlarm:trigger:calendar:](self, "overridesAlarm:trigger:calendar:", v11, v12, v10);

  return v13;
}

- (BOOL)overridesAlarm:(id)a3 trigger:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v14;

  v8 = a5;
  v9 = a4;
  if (!-[MTAlarm isSingleTimeAlarm](self, "isSingleTimeAlarm"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAlarm.m"), 682, CFSTR("Must be a single time override"));

  }
  -[MTAlarm singleTimeOverrideDateInCalendar:](self, "singleTimeOverrideDateInCalendar:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triggerDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v8, "isDate:inSameDayAsDate:", v10, v11);
  return v12;
}

+ (BOOL)_date:(id)a3 isOnDay:(int64_t)a4 calendar:(id)a5
{
  int64_t v5;

  if ((unint64_t)a4 < 7)
    v5 = a4 + 1;
  else
    v5 = 0;
  return v5 == objc_msgSend(a5, "component:fromDate:", 512, a3);
}

+ (id)mostRecentlyUpdatedAlarmForAlarms:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (!v6)
          goto LABEL_14;
        objc_msgSend(v6, "lastModifiedDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(v9, "lastModifiedDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v14;
          if (v14)
          {

LABEL_14:
            v15 = v9;

            v6 = v15;
            continue;
          }
        }
        objc_msgSend(v9, "lastModifiedDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastModifiedDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "mtIsAfterDate:", v12);

        if (!v10)
        {

          if ((v13 & 1) == 0)
            continue;
          goto LABEL_14;
        }

        if (v13)
          goto LABEL_14;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v5)
        goto LABEL_19;
    }
  }
  v6 = 0;
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTAlarm alarmID](self, "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    v8 = -[MTAlarm isEqualToAlarm:](self, "isEqualToAlarm:", v7);
  else
    v8 = 0;

  return v8;
}

- (BOOL)isEqualIgnoringLastModifiedDate:(id)a3
{
  return -[MTAlarm _isEqualToAlarm:checkLastModified:](self, "_isEqualToAlarm:checkLastModified:", a3, 0);
}

- (BOOL)isEqualToAlarm:(id)a3
{
  return -[MTAlarm _isEqualToAlarm:checkLastModified:](self, "_isEqualToAlarm:checkLastModified:", a3, 1);
}

- (BOOL)_isEqualToAlarm:(id)a3 checkLastModified:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  _BOOL4 v29;
  int v30;
  int v31;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  __int128 v135;
  _BYTE v136[20];
  _QWORD v137[7];

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "alarmID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm alarmID](self, "alarmID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    objc_msgSend(v6, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm alarmID](self, "alarmID");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = v9;
    if (!objc_msgSend(v9, "isEqual:"))
      goto LABEL_10;
  }
  v10 = objc_msgSend(v6, "hour");
  if (v10 != -[MTAlarm hour](self, "hour")
    || (v11 = objc_msgSend(v6, "minute"), v11 != -[MTAlarm minute](self, "minute"))
    || (v12 = objc_msgSend(v6, "bedtimeHour"), v12 != -[MTAlarm bedtimeHour](self, "bedtimeHour"))
    || (v13 = objc_msgSend(v6, "bedtimeMinute"), v13 != -[MTAlarm bedtimeMinute](self, "bedtimeMinute")))
  {
LABEL_10:
    memset((char *)v137 + 4, 0, 48);
    v135 = 0uLL;
    v4 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    memset(v136, 0, sizeof(v136));
    v21 = 0;
    v22 = 0;
    LOBYTE(v137[0]) = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "bedtimeReminder");
  v14 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm bedtimeReminder](self, "bedtimeReminder");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = (void *)v14;
  v15 = v14 != (_QWORD)v131;
  if ((void *)v14 != v131)
  {
    objc_msgSend(v6, "bedtimeReminder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm bedtimeReminder](self, "bedtimeReminder");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v16;
    if (!objc_msgSend(v16, "isEqual:"))
    {
      v135 = 0uLL;
      v4 = 0;
      v137[0] = 0;
      memset(&v137[2], 0, 32);
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      memset(v136, 0, sizeof(v136));
      v21 = 0;
      v22 = 0;
      v137[1] = 1;
      LODWORD(v137[6]) = 1;
      goto LABEL_11;
    }
  }
  v33 = objc_msgSend(v6, "sleepMode");
  LODWORD(v137[6]) = v15;
  if (v33 != -[MTAlarm sleepMode](self, "sleepMode")
    || (v34 = objc_msgSend(v6, "sleepModeOptions"), v34 != -[MTAlarm sleepModeOptions](self, "sleepModeOptions"))
    || (v35 = objc_msgSend(v6, "sleepTracking"), v35 != -[MTAlarm sleepTracking](self, "sleepTracking"))
    || (v36 = objc_msgSend(v6, "day"), v36 != -[MTAlarm day](self, "day"))
    || (v37 = objc_msgSend(v6, "month"), v37 != -[MTAlarm month](self, "month"))
    || (v38 = objc_msgSend(v6, "year"), v38 != -[MTAlarm year](self, "year")))
  {
    v135 = 0uLL;
    v4 = 0;
    v137[0] = 0;
    memset(&v137[2], 0, 32);
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    memset(v136, 0, sizeof(v136));
    v21 = 0;
    v22 = 0;
    v137[1] = 1;
    goto LABEL_11;
  }
  objc_msgSend(v6, "overriddenForDate");
  v39 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm overriddenForDate](self, "overriddenForDate");
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v39 != v40;
  v127 = (void *)v40;
  v128 = (void *)v39;
  if (v39 == v40)
  {
    HIDWORD(v137[5]) = 0;
  }
  else
  {
    objc_msgSend(v6, "overriddenForDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm overriddenForDate](self, "overriddenForDate");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v42;
    if (!objc_msgSend(v42, "isEqual:"))
    {
      v4 = 0;
      v137[0] = 0;
      memset((char *)&v137[1] + 4, 0, 32);
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      memset(v136, 0, sizeof(v136));
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      v135 = 1uLL;
      HIDWORD(v137[5]) = 1;
      goto LABEL_11;
    }
    HIDWORD(v137[5]) = v41;
  }
  v43 = objc_msgSend(v6, "timeInBedTracking");
  if (v43 != -[MTAlarm timeInBedTracking](self, "timeInBedTracking")
    || (v44 = objc_msgSend(v6, "sleepSchedule"), v44 != -[MTAlarm sleepSchedule](self, "sleepSchedule"))
    || (v45 = objc_msgSend(v6, "repeatSchedule"), v45 != -[MTAlarm repeatSchedule](self, "repeatSchedule")))
  {
    v4 = 0;
    v137[0] = 0;
    memset((char *)&v137[1] + 4, 0, 32);
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    memset(v136, 0, sizeof(v136));
    v21 = 0;
    v22 = 0;
    LODWORD(v137[1]) = 1;
    v135 = 1uLL;
    goto LABEL_11;
  }
  v77 = v6;
  v46 = objc_msgSend(v6, "isEnabled");
  if (v46 != -[MTAlarm isEnabled](self, "isEnabled")
    || (v47 = objc_msgSend(v6, "isSleepAlarm"), v47 != -[MTAlarm isSleepAlarm](self, "isSleepAlarm"))
    || (v48 = objc_msgSend(v6, "allowsSnooze"), v48 != -[MTAlarm allowsSnooze](self, "allowsSnooze"))
    || (v49 = objc_msgSend(v6, "onboardingVersion"), v49 != -[MTAlarm onboardingVersion](self, "onboardingVersion"))
    || (v50 = objc_msgSend(v6, "dismissedAction"), v50 != -[MTAlarm dismissedAction](self, "dismissedAction"))
    || (v51 = objc_msgSend(v6, "bedtimeDismissedAction"),
        v51 != -[MTAlarm bedtimeDismissedAction](self, "bedtimeDismissedAction")))
  {
    v4 = 0;
    v137[0] = 0;
    memset((char *)&v137[1] + 4, 0, 32);
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    memset(v136, 0, sizeof(v136));
    v21 = 0;
    v22 = 0;
    LODWORD(v137[1]) = 1;
    v135 = 1uLL;
    goto LABEL_96;
  }
  objc_msgSend(v6, "snoozeFireDate");
  v52 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = (void *)v52;
  LODWORD(v137[5]) = v52 != (_QWORD)v123;
  if ((void *)v52 != v123)
  {
    objc_msgSend(v6, "snoozeFireDate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v53;
    if (!objc_msgSend(v53, "isEqual:"))
    {
      *(_QWORD *)v136 = 0;
      *(_QWORD *)&v136[8] = 0;
      v4 = 0;
      v137[0] = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      memset((char *)&v137[1] + 4, 0, 28);
      v135 = 1uLL;
      *(_DWORD *)&v136[16] = 1;
      LODWORD(v137[5]) = 1;
LABEL_96:
      v6 = v77;
      goto LABEL_11;
    }
  }
  objc_msgSend(v6, "bedtimeSnoozeFireDate");
  v54 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm bedtimeSnoozeFireDate](self, "bedtimeSnoozeFireDate");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (void *)v54;
  HIDWORD(v137[4]) = v54 != (_QWORD)v121;
  if ((void *)v54 != v121)
  {
    objc_msgSend(v6, "bedtimeSnoozeFireDate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm bedtimeSnoozeFireDate](self, "bedtimeSnoozeFireDate");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v55;
    if (!objc_msgSend(v55, "isEqual:"))
    {
      *(_QWORD *)&v136[4] = 0;
      v4 = 0;
      v137[0] = 0;
      v17 = 0;
      memset((char *)&v137[1] + 4, 0, 24);
      v18 = 0;
      v19 = 0;
      v20 = 0;
      *(_DWORD *)v136 = 0;
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      v135 = 1uLL;
      *(_QWORD *)&v136[12] = 0x100000001;
      HIDWORD(v137[4]) = 1;
      goto LABEL_96;
    }
  }
  objc_msgSend(v6, "firedDate");
  v56 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm firedDate](self, "firedDate");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = (void *)v56;
  LODWORD(v137[4]) = v56 != (_QWORD)v117;
  if ((void *)v56 != v117)
  {
    objc_msgSend(v6, "firedDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm firedDate](self, "firedDate");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v57;
    if (!objc_msgSend(v57, "isEqual:"))
    {
      v4 = 0;
      v137[0] = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      memset((char *)&v137[1] + 4, 0, 20);
      v135 = 1uLL;
      *(_DWORD *)&v136[8] = 0;
      *(_QWORD *)&v136[12] = 0x100000001;
      *(_QWORD *)v136 = 0x100000000;
      LODWORD(v137[4]) = 1;
      goto LABEL_96;
    }
  }
  objc_msgSend(v6, "dismissedDate");
  v58 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm dismissedDate](self, "dismissedDate");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)v58;
  HIDWORD(v137[3]) = v58 != (_QWORD)v111;
  if ((void *)v58 != v111)
  {
    objc_msgSend(v6, "dismissedDate");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm dismissedDate](self, "dismissedDate");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v59;
    if (!objc_msgSend(v59, "isEqual:"))
    {
      v4 = 0;
      v137[0] = 0;
      *(_QWORD *)((char *)&v135 + 4) = 0;
      *(_QWORD *)((char *)&v137[1] + 4) = 0;
      *(_QWORD *)((char *)&v137[2] + 4) = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      LODWORD(v135) = 1;
      *(_DWORD *)&v136[16] = 1;
      *(_DWORD *)&v136[8] = 0;
      *(_DWORD *)&v136[12] = 1;
      *(_DWORD *)v136 = 0;
      *(_DWORD *)&v136[4] = 1;
      HIDWORD(v135) = 1;
      HIDWORD(v137[3]) = 1;
      goto LABEL_96;
    }
  }
  if (v4)
  {
    objc_msgSend(v6, "lastModifiedDate");
    v60 = objc_claimAutoreleasedReturnValue();
    -[MTAlarm lastModifiedDate](self, "lastModifiedDate");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (void *)v60;
    if ((void *)v60 == v107)
    {
      HIDWORD(v137[0]) = 0;
      v107 = (void *)v60;
    }
    else
    {
      objc_msgSend(v77, "lastModifiedDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTAlarm lastModifiedDate](self, "lastModifiedDate");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v61;
      LODWORD(v137[1]) = 1;
      if (!objc_msgSend(v61, "isEqual:"))
      {
        *(_QWORD *)((char *)&v135 + 4) = 0;
        *(_QWORD *)((char *)&v137[1] + 4) = 0;
        *(_QWORD *)((char *)&v137[2] + 4) = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        LODWORD(v135) = 1;
        *(_DWORD *)&v136[16] = 1;
        LOBYTE(v137[0]) = 0;
        *(_DWORD *)&v136[8] = 0;
        *(_DWORD *)&v136[12] = 1;
        *(_DWORD *)v136 = 0;
        *(_DWORD *)&v136[4] = 1;
        HIDWORD(v135) = 1;
        v4 = 1;
        HIDWORD(v137[0]) = 1;
        goto LABEL_96;
      }
      HIDWORD(v137[0]) = 1;
    }
  }
  else
  {
    HIDWORD(v137[0]) = 0;
  }
  objc_msgSend(v77, "bedtimeFiredDate");
  v62 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm bedtimeFiredDate](self, "bedtimeFiredDate");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)v62;
  LODWORD(v137[3]) = v62 != (_QWORD)v105;
  if ((void *)v62 != v105)
  {
    objc_msgSend(v77, "bedtimeFiredDate");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm bedtimeFiredDate](self, "bedtimeFiredDate");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v63;
    if (!objc_msgSend(v63, "isEqual:"))
    {
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      *(_OWORD *)&v137[1] = 1uLL;
      *(_QWORD *)&v135 = 1;
      LOBYTE(v137[0]) = 0;
      *(_DWORD *)&v136[8] = 0;
      *(_QWORD *)&v136[12] = 0x100000001;
      *(_QWORD *)v136 = 0x100000000;
      *((_QWORD *)&v135 + 1) = 0x100000001;
      LODWORD(v137[3]) = 1;
      goto LABEL_96;
    }
  }
  objc_msgSend(v77, "bedtimeDismissedDate");
  v64 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm bedtimeDismissedDate](self, "bedtimeDismissedDate");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)v64;
  HIDWORD(v137[2]) = v64 != (_QWORD)v99;
  if ((void *)v64 != v99)
  {
    objc_msgSend(v77, "bedtimeDismissedDate");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm bedtimeDismissedDate](self, "bedtimeDismissedDate");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v65;
    if (!objc_msgSend(v65, "isEqual:"))
    {
      v17 = 0;
      *(_QWORD *)((char *)&v137[1] + 4) = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      *(_QWORD *)&v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(_DWORD *)&v136[8] = 0;
      *(_QWORD *)&v136[12] = 0x100000001;
      *(_QWORD *)v136 = 0x100000000;
      *((_QWORD *)&v135 + 1) = 0x100000001;
      HIDWORD(v137[2]) = 1;
      goto LABEL_96;
    }
  }
  objc_msgSend(v77, "keepOffUntilDate");
  v66 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm keepOffUntilDate](self, "keepOffUntilDate");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)v66;
  LODWORD(v137[2]) = v66 != (_QWORD)v95;
  if ((void *)v66 != v95)
  {
    objc_msgSend(v77, "keepOffUntilDate");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm keepOffUntilDate](self, "keepOffUntilDate");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v67;
    if (!objc_msgSend(v67, "isEqual:"))
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      *(_QWORD *)((char *)&v137[1] + 4) = 0x100000000;
      *(_QWORD *)&v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(_DWORD *)&v136[8] = 0;
      *(_QWORD *)&v136[12] = 0x100000001;
      *(_QWORD *)v136 = 0x100000000;
      *((_QWORD *)&v135 + 1) = 0x100000001;
      v17 = 1;
      goto LABEL_96;
    }
  }
  objc_msgSend(v77, "title");
  v68 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm title](self, "title");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)v68;
  HIDWORD(v137[1]) = v68 != (_QWORD)v91;
  if ((void *)v68 != v91)
  {
    objc_msgSend(v77, "title");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm title](self, "title");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v69;
    if (!objc_msgSend(v69, "isEqual:"))
    {
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v137[1] = 0x100000001;
      *(_QWORD *)&v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(_DWORD *)&v136[8] = 0;
      *(_QWORD *)&v136[12] = 0x100000001;
      *(_QWORD *)v136 = 0x100000000;
      *((_QWORD *)&v135 + 1) = 0x100000001;
      v17 = 1;
      v18 = 1;
      goto LABEL_96;
    }
  }
  objc_msgSend(v77, "sound");
  v70 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm sound](self, "sound");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)v70;
  *(_DWORD *)&v136[8] = v70 != (_QWORD)v87;
  if ((void *)v70 != v87)
  {
    objc_msgSend(v77, "sound");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm sound](self, "sound");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v71;
    if (!objc_msgSend(v71, "isEqual:"))
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      *(_QWORD *)&v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(_QWORD *)&v136[12] = 0x100000001;
      *(_QWORD *)v136 = 0x100000000;
      *((_QWORD *)&v135 + 1) = 0x100000001;
      v17 = 1;
      v18 = 1;
      v19 = 1;
      *(_DWORD *)&v136[8] = 1;
      goto LABEL_96;
    }
  }
  objc_msgSend(v77, "siriContext");
  v72 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm siriContext](self, "siriContext");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)v72;
  *(_DWORD *)v136 = v72 != (_QWORD)v83;
  if ((void *)v72 != v83)
  {
    objc_msgSend(v77, "siriContext");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAlarm siriContext](self, "siriContext");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v73;
    if (!objc_msgSend(v73, "isEqual:"))
    {
      v21 = 0;
      v22 = 0;
      LODWORD(v137[1]) = 1;
      *(_QWORD *)&v135 = 0x100000001;
      LOBYTE(v137[0]) = 0;
      *(_QWORD *)&v136[12] = 0x100000001;
      *((_QWORD *)&v135 + 1) = 0x100000001;
      v17 = 1;
      v18 = 1;
      v19 = 1;
      v20 = 1;
      *(_QWORD *)v136 = 0x100000001;
      goto LABEL_96;
    }
  }
  objc_msgSend(v77, "bypassReloadDate");
  v74 = objc_claimAutoreleasedReturnValue();
  -[MTAlarm bypassReloadDate](self, "bypassReloadDate");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)v74;
  if ((void *)v74 == v79)
  {
    v22 = 0;
    LODWORD(v137[1]) = 1;
    *(_QWORD *)&v135 = 0x100000001;
    *(_QWORD *)&v136[12] = 0x100000001;
    *(_DWORD *)&v136[4] = 1;
    *((_QWORD *)&v135 + 1) = 0x100000001;
    v17 = 1;
    v18 = 1;
    v19 = 1;
    v20 = 1;
    v79 = (void *)v74;
    v21 = 1;
    LOBYTE(v137[0]) = 1;
    goto LABEL_96;
  }
  v6 = v77;
  objc_msgSend(v77, "bypassReloadDate");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm bypassReloadDate](self, "bypassReloadDate");
  self = (MTAlarm *)objc_claimAutoreleasedReturnValue();
  v78 = v75;
  v76 = objc_msgSend(v75, "isEqual:", self);
  v22 = 1;
  LODWORD(v137[1]) = 1;
  *(_QWORD *)&v135 = 0x100000001;
  LOBYTE(v137[0]) = v76;
  *(_QWORD *)&v136[12] = 0x100000001;
  *(_DWORD *)&v136[4] = 1;
  *((_QWORD *)&v135 + 1) = 0x100000001;
  v17 = 1;
  v18 = 1;
  v19 = 1;
  v20 = 1;
  v21 = 1;
LABEL_11:
  if (v22)
  {
    v23 = v6;
    v24 = v19;
    v25 = v8;
    v26 = v7;
    v27 = v18;
    v28 = v20;
    v29 = v4;
    v30 = v17;
    v31 = v21;

    v21 = v31;
    v17 = v30;
    v4 = v29;
    v20 = v28;
    v18 = v27;
    v7 = v26;
    v8 = v25;
    v19 = v24;
    v6 = v23;
  }
  if (v21)
  {

  }
  if (*(_DWORD *)v136)
  {

  }
  if (v20)
  {

  }
  if (*(_DWORD *)&v136[8])
  {

  }
  if (v19)
  {

  }
  if (HIDWORD(v137[1]))
  {

  }
  if (v18)
  {

  }
  if (LODWORD(v137[2]))
  {

  }
  if (v17)
  {

  }
  if (HIDWORD(v137[2]))
  {

  }
  if (DWORD1(v135))
  {

  }
  if (LODWORD(v137[3]))
  {

  }
  if (DWORD2(v135))
  {

  }
  if (HIDWORD(v137[0]))
  {

  }
  if (v4)
  {

  }
  if (HIDWORD(v137[3]))
  {

  }
  if (HIDWORD(v135))
  {

  }
  if (LODWORD(v137[4]))
  {

  }
  if (*(_DWORD *)&v136[4])
  {

  }
  if (HIDWORD(v137[4]))
  {

  }
  if (*(_DWORD *)&v136[12])
  {

  }
  if (LODWORD(v137[5]))
  {

  }
  if (*(_DWORD *)&v136[16])
  {

  }
  if (HIDWORD(v137[5]))
  {

  }
  if ((_DWORD)v135)
  {

  }
  if (LODWORD(v137[6]))
  {

  }
  if (LODWORD(v137[1]))
  {

  }
  if (v7 != v8)
  {

  }
  return v137[0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  MTMutableAlarm *v4;
  void *v5;
  MTMutableAlarm *v6;

  v4 = +[MTMutableAlarm allocWithZone:](MTMutableAlarm, "allocWithZone:", a3);
  -[MTAlarm alarmID](self, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MTAlarm initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[MTAlarm _copyStateOntoAlarm:](self, "_copyStateOntoAlarm:", v6);
  return v6;
}

- (void)_copyStateOntoAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v19;

  v4 = a3;
  objc_msgSend(v4, "setHour:", -[MTAlarm hour](self, "hour"));
  objc_msgSend(v4, "setMinute:", -[MTAlarm minute](self, "minute"));
  objc_msgSend(v4, "setBedtimeHour:", -[MTAlarm bedtimeHour](self, "bedtimeHour"));
  objc_msgSend(v4, "setBedtimeMinute:", -[MTAlarm bedtimeMinute](self, "bedtimeMinute"));
  -[MTAlarm bedtimeReminder](self, "bedtimeReminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBedtimeReminder:", v5);

  objc_msgSend(v4, "setSleepMode:", -[MTAlarm sleepMode](self, "sleepMode"));
  objc_msgSend(v4, "setSleepModeOptions:", -[MTAlarm sleepModeOptions](self, "sleepModeOptions"));
  objc_msgSend(v4, "setSleepTracking:", -[MTAlarm sleepTracking](self, "sleepTracking"));
  objc_msgSend(v4, "setDay:", -[MTAlarm day](self, "day"));
  objc_msgSend(v4, "setMonth:", -[MTAlarm month](self, "month"));
  objc_msgSend(v4, "setYear:", -[MTAlarm year](self, "year"));
  objc_msgSend(v4, "setTimeInBedTracking:", -[MTAlarm timeInBedTracking](self, "timeInBedTracking"));
  objc_msgSend(v4, "setSleepSchedule:", -[MTAlarm sleepSchedule](self, "sleepSchedule"));
  objc_msgSend(v4, "setRepeatSchedule:", -[MTAlarm repeatSchedule](self, "repeatSchedule"));
  objc_msgSend(v4, "setEnabled:", -[MTAlarm isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setSleepAlarm:", -[MTAlarm isSleepAlarm](self, "isSleepAlarm"));
  objc_msgSend(v4, "setAllowsSnooze:", -[MTAlarm allowsSnooze](self, "allowsSnooze"));
  -[MTAlarm snoozeFireDate](self, "snoozeFireDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSnoozeFireDate:", v6);

  -[MTAlarm bedtimeSnoozeFireDate](self, "bedtimeSnoozeFireDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBedtimeSnoozeFireDate:", v7);

  -[MTAlarm firedDate](self, "firedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFiredDate:", v8);

  -[MTAlarm dismissedDate](self, "dismissedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDismissedDate:", v9);

  objc_msgSend(v4, "setDismissedAction:", -[MTAlarm dismissedAction](self, "dismissedAction"));
  -[MTAlarm lastModifiedDate](self, "lastModifiedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastModifiedDate:", v10);

  -[MTAlarm bedtimeFiredDate](self, "bedtimeFiredDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBedtimeFiredDate:", v11);

  -[MTAlarm bedtimeDismissedDate](self, "bedtimeDismissedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBedtimeDismissedDate:", v12);

  objc_msgSend(v4, "setBedtimeDismissedAction:", -[MTAlarm bedtimeDismissedAction](self, "bedtimeDismissedAction"));
  -[MTAlarm keepOffUntilDate](self, "keepOffUntilDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeepOffUntilDate:", v13);

  -[MTAlarm overriddenForDate](self, "overriddenForDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverriddenForDate:", v14);

  -[MTAlarm title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v15);

  -[MTAlarm sound](self, "sound");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSound:", v16);

  objc_msgSend(v4, "setOnboardingVersion:", -[MTAlarm onboardingVersion](self, "onboardingVersion"));
  -[MTAlarm currentDateProvider](self, "currentDateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentDateProvider:", v17);

  -[MTAlarm siriContext](self, "siriContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriContext:", v18);

  -[MTAlarm bypassReloadDate](self, "bypassReloadDate");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBypassReloadDate:", v19);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[MTAlarm succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTAlarm alarmID](self, "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("id"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[MTAlarm isSleepAlarm](self, "isSleepAlarm"), CFSTR("sleep"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[MTAlarm isEnabled](self, "isEnabled"), CFSTR("enabled"));
  return v3;
}

- (BOOL)shouldBypassWidgetReload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MTAlarm bypassReloadDate](self, "bypassReloadDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[MTAlarm bypassReloadDate](self, "bypassReloadDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(void))self->_currentDateProvider + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "mtIsBeforeDate:", v5);

  return (char)v4;
}

- (void)setHour:(unint64_t)a3
{
  self->_hour = a3;
}

- (void)setMinute:(unint64_t)a3
{
  self->_minute = a3;
}

- (void)setDay:(unint64_t)a3
{
  self->_day = a3;
}

- (void)setMonth:(unint64_t)a3
{
  self->_month = a3;
}

- (void)setYear:(unint64_t)a3
{
  self->_year = a3;
}

- (void)setBedtimeHour:(unint64_t)a3
{
  self->_bedtimeHour = a3;
}

- (void)setBedtimeMinute:(unint64_t)a3
{
  self->_bedtimeMinute = a3;
}

- (void)setBedtimeReminder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setSleepSchedule:(BOOL)a3
{
  self->_sleepSchedule = a3;
}

- (void)setSleepMode:(BOOL)a3
{
  self->_sleepMode = a3;
}

- (void)setSleepModeOptions:(unint64_t)a3
{
  self->_sleepModeOptions = a3;
}

- (void)setSleepTracking:(BOOL)a3
{
  self->_sleepTracking = a3;
}

- (void)setTimeInBedTracking:(BOOL)a3
{
  self->_timeInBedTracking = a3;
}

- (void)setRepeatSchedule:(unint64_t)a3
{
  self->_repeatSchedule = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setSleepAlarm:(BOOL)a3
{
  self->_sleepAlarm = a3;
}

- (void)setAllowsSnooze:(BOOL)a3
{
  self->_allowsSnooze = a3;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setSound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setOverriddenForDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setSnoozeFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setBedtimeSnoozeFireDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setFiredDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setDismissedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setDismissedAction:(unint64_t)a3
{
  self->_dismissedAction = a3;
}

- (void)setBedtimeFiredDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setBedtimeDismissedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setBedtimeDismissedAction:(unint64_t)a3
{
  self->_bedtimeDismissedAction = a3;
}

- (void)setKeepOffUntilDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setOnboardingVersion:(unint64_t)a3
{
  self->_onboardingVersion = a3;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setSiriContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setBypassReloadDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bypassReloadDate, 0);
  objc_storeStrong((id *)&self->_siriContext, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_keepOffUntilDate, 0);
  objc_storeStrong((id *)&self->_bedtimeDismissedDate, 0);
  objc_storeStrong((id *)&self->_bedtimeFiredDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_bedtimeSnoozeFireDate, 0);
  objc_storeStrong((id *)&self->_snoozeFireDate, 0);
  objc_storeStrong((id *)&self->_overriddenForDate, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_bedtimeReminder, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

+ (id)propertiesAffectingWaketime
{
  if (propertiesAffectingWaketime_onceToken != -1)
    dispatch_once(&propertiesAffectingWaketime_onceToken, &__block_literal_global_50);
  return (id)propertiesAffectingWaketime_propertiesAffectingWaketime;
}

void __50__MTAlarm_Properties__propertiesAffectingWaketime__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("MTAlarmHour");
  v4[1] = CFSTR("MTAlarmMinute");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesAffectingWaketime_propertiesAffectingWaketime;
  propertiesAffectingWaketime_propertiesAffectingWaketime = v2;

}

+ (id)propertiesAffectingBedtime
{
  if (propertiesAffectingBedtime_onceToken != -1)
    dispatch_once(&propertiesAffectingBedtime_onceToken, &__block_literal_global_83);
  return (id)propertiesAffectingBedtime_propertiesAffectingBedtime;
}

void __49__MTAlarm_Properties__propertiesAffectingBedtime__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("MTAlarmBedtimeHour");
  v4[1] = CFSTR("MTAlarmBedtimeMinute");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesAffectingBedtime_propertiesAffectingBedtime;
  propertiesAffectingBedtime_propertiesAffectingBedtime = v2;

}

+ (id)propertiesAffectingSnooze
{
  if (propertiesAffectingSnooze_onceToken != -1)
    dispatch_once(&propertiesAffectingSnooze_onceToken, &__block_literal_global_84);
  return (id)propertiesAffectingSnooze_propertiesAffectingSnooze;
}

void __48__MTAlarm_Properties__propertiesAffectingSnooze__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("MTAlarmHour");
  v4[1] = CFSTR("MTAlarmMinute");
  v4[2] = CFSTR("MTAlarmAllowsSnooze");
  v4[3] = CFSTR("MTAlarmDismissDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesAffectingSnooze_propertiesAffectingSnooze;
  propertiesAffectingSnooze_propertiesAffectingSnooze = v2;

}

+ (id)propertiesAffectingNotification
{
  if (propertiesAffectingNotification_onceToken != -1)
    dispatch_once(&propertiesAffectingNotification_onceToken, &__block_literal_global_85);
  return (id)propertiesAffectingNotification_propertiesAffectingNotification;
}

void __54__MTAlarm_Properties__propertiesAffectingNotification__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[22];

  v4[21] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("MTAlarmHour");
  v4[1] = CFSTR("MTAlarmMinute");
  v4[2] = CFSTR("MTAlarmBedtimeHour");
  v4[3] = CFSTR("MTAlarmBedtimeMinute");
  v4[4] = CFSTR("MTAlarmRepeatSchedule");
  v4[5] = CFSTR("MTAlarmEnabled");
  v4[6] = CFSTR("MTAlarmBedtimeReminderMinutes");
  v4[7] = CFSTR("MTAlarmBedtimeDoNotDisturb");
  v4[8] = CFSTR("MTAlarmBedtimeDoNotDisturbOptions");
  v4[9] = CFSTR("MTAlarmSleepScheduleKey");
  v4[10] = CFSTR("MTAlarmTimeInBedTrackingKey");
  v4[11] = CFSTR("MTAlarmSleepTrackingKey");
  v4[12] = CFSTR("MTAlarmBedtimeForSleepTracking");
  v4[13] = CFSTR("MTAlarmWakeupForSleepTracking");
  v4[14] = CFSTR("MTAlarmIsSleep");
  v4[15] = CFSTR("MTAlarmAllowsSnooze");
  v4[16] = CFSTR("MTAlarmSnoozeFireDate");
  v4[17] = CFSTR("MTAlarmBedtimeSnoozeFireDate");
  v4[18] = CFSTR("MTAlarmTitle");
  v4[19] = CFSTR("MTAlarmSound");
  v4[20] = CFSTR("MTAlarmOnboardingVersion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 21);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesAffectingNotification_propertiesAffectingNotification;
  propertiesAffectingNotification_propertiesAffectingNotification = v2;

}

+ (id)propertiesAffectingSync
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MTAlarm_Properties__propertiesAffectingSync__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (propertiesAffectingSync_onceToken != -1)
    dispatch_once(&propertiesAffectingSync_onceToken, block);
  return (id)propertiesAffectingSync_propertiesAffectingSync;
}

void __46__MTAlarm_Properties__propertiesAffectingSync__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "propertiesAffectingNotification");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithSet:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesAffectingSync_propertiesAffectingSync;
  propertiesAffectingSync_propertiesAffectingSync = v2;

}

+ (id)propertiesAffectingSessions
{
  if (propertiesAffectingSessions_onceToken_0 != -1)
    dispatch_once(&propertiesAffectingSessions_onceToken_0, &__block_literal_global_86);
  return (id)propertiesAffectingSessions_propertiesAffectingSnooze;
}

void __50__MTAlarm_Properties__propertiesAffectingSessions__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[13];

  v4[12] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("MTAlarmHour");
  v4[1] = CFSTR("MTAlarmMinute");
  v4[2] = CFSTR("MTAlarmRepeatSchedule");
  v4[3] = CFSTR("MTAlarmEnabled");
  v4[4] = CFSTR("MTAlarmAllowsSnooze");
  v4[5] = CFSTR("MTAlarmSnoozeFireDate");
  v4[6] = CFSTR("MTAlarmBedtimeSnoozeFireDate");
  v4[7] = CFSTR("MTAlarmTitle");
  v4[8] = CFSTR("MTAlarmSound");
  v4[9] = CFSTR("MTAlarmOnboardingVersion");
  v4[10] = CFSTR("MTAlarmFiring");
  v4[11] = CFSTR("MTAlarmDismissDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)propertiesAffectingSessions_propertiesAffectingSnooze;
  propertiesAffectingSessions_propertiesAffectingSnooze = v2;

}

@end
