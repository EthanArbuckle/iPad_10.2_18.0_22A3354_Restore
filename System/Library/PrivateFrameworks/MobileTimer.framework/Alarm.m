@implementation Alarm

- (Alarm)init
{
  return -[Alarm initWithSettings:](self, "initWithSettings:", 0);
}

- (Alarm)initWithSettings:(id)a3
{
  id v4;
  Alarm *v5;
  uint64_t v6;
  NSDate *lastModified;
  Alarm *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)Alarm;
  v5 = -[Alarm init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = objc_claimAutoreleasedReturnValue();
    lastModified = v5->_lastModified;
    v5->_lastModified = (NSDate *)v6;

    v5->_revision = 0;
    -[Alarm applySettings:](v5, "applySettings:", v4);
    v8 = v5;
  }

  return v5;
}

- (void)applySettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *settings;
  NSString *v9;
  NSString *alarmID;
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
  NSDate *v25;
  NSDate *lastModified;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  _QWORD v31[14];
  _QWORD v32[15];

  v32[14] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31[0] = CFSTR("alarmId");
  v31[1] = CFSTR("hour");
  v32[0] = &stru_1E39CF258;
  v32[1] = &unk_1E3A05C90;
  v31[2] = CFSTR("minute");
  v31[3] = CFSTR("allowsSnooze");
  v32[2] = &unk_1E3A05C90;
  v32[3] = MEMORY[0x1E0C9AAA0];
  v31[4] = CFSTR("isSleepAlarm");
  v31[5] = CFSTR("bedtimeHour");
  v32[4] = MEMORY[0x1E0C9AAA0];
  v32[5] = &unk_1E3A05C90;
  v31[6] = CFSTR("bedtimeMinute");
  v31[7] = CFSTR("daySetting");
  v32[6] = &unk_1E3A05C90;
  v32[7] = &unk_1E3A05C90;
  v31[8] = CFSTR("title");
  v31[9] = CFSTR("soundType");
  v32[8] = &stru_1E39CF258;
  v32[9] = &unk_1E3A05CA8;
  v31[10] = CFSTR("sound");
  v31[11] = CFSTR("vibe");
  v32[10] = &stru_1E39CF258;
  v32[11] = &stru_1E39CF258;
  v32[12] = self->_lastModified;
  v31[12] = CFSTR("lastModified");
  v31[13] = CFSTR("revision");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_revision);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[13] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
  settings = self->_settings;
  self->_settings = v7;

  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("alarmId"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    alarmID = self->_alarmID;
    self->_alarmID = v9;

    -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", self->_alarmID, CFSTR("alarmId"));
    objc_msgSend(v4, "objectForKey:", CFSTR("hour"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setHour:](self, "setHour:", objc_msgSend(v11, "unsignedIntValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("minute"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setMinute:](self, "setMinute:", objc_msgSend(v12, "unsignedIntValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("allowsSnooze"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setAllowsSnooze:](self, "setAllowsSnooze:", objc_msgSend(v13, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("soundType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("sound"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setSound:ofType:](self, "setSound:ofType:", v15, (int)objc_msgSend(v14, "intValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("soundVolume"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setSoundVolume:](self, "setSoundVolume:", v16);

    objc_msgSend(v4, "objectForKey:", CFSTR("vibe"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setVibrationID:](self, "setVibrationID:", v17);

    objc_msgSend(v4, "objectForKey:", CFSTR("title"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setTitle:](self, "setTitle:", v18);

    objc_msgSend(v4, "objectForKey:", CFSTR("daySetting"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setDaySetting:](self, "setDaySetting:", objc_msgSend(v19, "unsignedIntValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("isSleepAlarm"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setIsSleepAlarm:](self, "setIsSleepAlarm:", objc_msgSend(v20, "BOOLValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("bedtimeReminderMinutes"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setBedtimeReminderMinutes:](self, "setBedtimeReminderMinutes:", v21);

    objc_msgSend(v4, "objectForKey:", CFSTR("bedtimeHour"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setBedtimeHour:](self, "setBedtimeHour:", objc_msgSend(v22, "integerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("bedtimeMinute"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[Alarm setBedtimeMinute:](self, "setBedtimeMinute:", objc_msgSend(v23, "integerValue"));

    objc_msgSend(v4, "objectForKey:", CFSTR("lastModified"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("lastModified"));
      v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastModified = self->_lastModified;
      self->_lastModified = v25;

      -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", self->_lastModified, CFSTR("lastModified"));
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("revision"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("revision"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      self->_revision = objc_msgSend(v28, "unsignedIntValue");

      v29 = self->_settings;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_revision);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, CFSTR("revision"));

    }
  }

}

- (void)prepareEditingProxy
{
  Alarm *v3;
  Alarm *editingProxy;
  Alarm *v5;
  void *v6;
  Alarm *v7;
  NSMutableDictionary *settings;
  void *v9;
  id v10;

  -[Alarm dropEditingProxy](self, "dropEditingProxy");
  v3 = objc_alloc_init(Alarm);
  editingProxy = self->_editingProxy;
  self->_editingProxy = v3;

  v5 = self->_editingProxy;
  -[Alarm settings](self, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[Alarm applySettings:](v5, "applySettings:", v6);

  self->_editingProxy->_pretendActiveIfProxy = -[Alarm isActive](self, "isActive");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@::%@"), CFSTR("AlarmEditingProxyID"), self->_alarmID);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[Alarm setAlarmID:](self->_editingProxy, "setAlarmID:", v10);
  v7 = self->_editingProxy;
  settings = v7->_settings;
  -[Alarm alarmID](v7, "alarmID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v9, CFSTR("alarmId"));

  -[Alarm setAlarmIDURL:](self->_editingProxy, "setAlarmIDURL:", 0);
}

- (void)applyChangesFromEditingProxy
{
  void *v3;
  void *v4;
  id v5;

  -[Alarm setHour:](self, "setHour:", -[Alarm hour](self->_editingProxy, "hour"));
  -[Alarm setMinute:](self, "setMinute:", -[Alarm minute](self->_editingProxy, "minute"));
  -[Alarm setDaySetting:](self, "setDaySetting:", -[Alarm daySetting](self->_editingProxy, "daySetting"));
  -[Alarm setAllowsSnooze:](self, "setAllowsSnooze:", -[Alarm allowsSnooze](self->_editingProxy, "allowsSnooze"));
  -[Alarm sound](self->_editingProxy, "sound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[Alarm setSound:ofType:](self, "setSound:ofType:", v3, -[Alarm soundType](self->_editingProxy, "soundType"));

  -[Alarm vibrationID](self->_editingProxy, "vibrationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[Alarm setVibrationID:](self, "setVibrationID:", v4);

  -[Alarm title](self->_editingProxy, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[Alarm setTitle:](self, "setTitle:", v5);

}

- (void)dropEditingProxy
{
  Alarm *editingProxy;

  editingProxy = self->_editingProxy;
  self->_editingProxy = 0;

}

+ (BOOL)verifyIdSetting:(id)a3 withMessageList:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  const __CFString *v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = CFSTR("Settings :: ID is wrong type");
LABEL_6:
    objc_msgSend(v6, "addObject:", v8);
    v7 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "length"))
  {
    v8 = CFSTR("Settings :: ID is invalid");
    goto LABEL_6;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

+ (BOOL)verifyHourSetting:(id)a3 withMessageList:(id)a4
{
  id v5;
  id v6;
  const __CFString *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v5, "intValue") & 0x80000000) == 0 && (int)objc_msgSend(v5, "intValue") < 24)
    {
      v8 = 1;
      goto LABEL_7;
    }
    v7 = CFSTR("Settings :: hour is invalid");
  }
  else
  {
    v7 = CFSTR("Settings :: hour is wrong type");
  }
  objc_msgSend(v6, "addObject:", v7);
  v8 = 0;
LABEL_7:

  return v8;
}

+ (BOOL)verifyMinuteSetting:(id)a3 withMessageList:(id)a4
{
  id v5;
  id v6;
  const __CFString *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v5, "intValue") & 0x80000000) == 0 && (int)objc_msgSend(v5, "intValue") < 60)
    {
      v8 = 1;
      goto LABEL_7;
    }
    v7 = CFSTR("Settings :: minute is invalid");
  }
  else
  {
    v7 = CFSTR("Settings :: minute is wrong type");
  }
  objc_msgSend(v6, "addObject:", v7);
  v8 = 0;
LABEL_7:

  return v8;
}

+ (BOOL)verifyDaySetting:(id)a3 withMessageList:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  const __CFString *v8;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = CFSTR("Settings :: day setting is wrong type");
LABEL_6:
    objc_msgSend(v6, "addObject:", v8);
    v7 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "unsignedIntValue") >= 0x80)
  {
    v8 = CFSTR("Settings :: day setting is invalid");
    goto LABEL_6;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

+ (BOOL)verifySettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  BOOL v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  uint64_t i;
  int v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("alarmId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[Alarm verifyIdSetting:withMessageList:](Alarm, "verifyIdSetting:withMessageList:", v6, v5);

    objc_msgSend(v3, "objectForKey:", CFSTR("hour"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[Alarm verifyHourSetting:withMessageList:](Alarm, "verifyHourSetting:withMessageList:", v8, v5);

    objc_msgSend(v3, "objectForKey:", CFSTR("minute"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[Alarm verifyMinuteSetting:withMessageList:](Alarm, "verifyMinuteSetting:withMessageList:", v10, v5);

    objc_msgSend(v3, "objectForKey:", CFSTR("daySetting"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = +[Alarm verifyDaySetting:withMessageList:](Alarm, "verifyDaySetting:withMessageList:", v12, v5);

    if ((_DWORD)v10 && v11 && v9 && v7)
    {
      v13 = 1;
      goto LABEL_20;
    }
    v23 = v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Settings :: settings %@"), v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

  }
  else
  {
    v23 = 0;
    objc_msgSend(v4, "addObject:", CFSTR("Settings is nil"));
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v5;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    v19 = (unsigned int *)MEMORY[0x1E0CFA9F8];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        NSLog(CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        if (__shouldLog)
        {
          v21 = atomic_load(v19);
          if (v21 >= 6)
            _CPLog();
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  v13 = 0;
  v3 = v23;
LABEL_20:

  return v13;
}

- (id)nowDateForOffsetCalculation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)timeZoneForOffsetCalculation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
}

- (id)_newBaseDateComponentsForDay:(int64_t)a3
{
  id v4;
  int64_t v5;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v4, "setYear:", 2014);
  objc_msgSend(v4, "setMonth:", 1);
  objc_msgSend(v4, "setWeekdayOrdinal:", 1);
  if ((unint64_t)a3 < 7)
    v5 = a3 + 1;
  else
    v5 = 1;
  objc_msgSend(v4, "setWeekday:", v5);
  return v4;
}

- (void)refreshActiveState
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "alarmDidUpdate:", self);

}

- (void)markModified
{
  NSDate *v3;
  NSDate *lastModified;
  NSMutableDictionary *settings;
  id v6;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  lastModified = self->_lastModified;
  self->_lastModified = v3;

  ++self->_revision;
  -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", self->_lastModified, CFSTR("lastModified"));
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_revision);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v6, CFSTR("revision"));

}

+ (id)timeComparator
{
  return &__block_literal_global_0;
}

uint64_t __23__Alarm_timeComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "hour");
  if (v6 > objc_msgSend(v5, "hour"))
    goto LABEL_5;
  v7 = objc_msgSend(v4, "hour");
  if (v7 < objc_msgSend(v5, "hour"))
  {
    v8 = -1;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v4, "minute");
  if (v9 > objc_msgSend(v5, "minute"))
  {
LABEL_5:
    v8 = 1;
    goto LABEL_6;
  }
  v11 = objc_msgSend(v4, "minute");
  if (v11 >= objc_msgSend(v5, "minute"))
    v8 = 0;
  else
    v8 = -1;
LABEL_6:

  return v8;
}

- (int64_t)compareTime:(id)a3
{
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  int64_t v6;

  v4 = a3;
  +[Alarm timeComparator](Alarm, "timeComparator");
  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, Alarm *, id))v5)[2](v5, self, v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  unsigned int hour;
  unsigned int minute;
  NSString *title;
  NSString *v10;
  NSString *v11;
  BOOL v12;
  NSString *sound;
  void *v14;
  int v15;
  unsigned int daySetting;
  int allowsSnooze;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    hour = self->_hour;
    if (hour != objc_msgSend(v6, "hour")
      || (minute = self->_minute, minute != objc_msgSend(v6, "minute")))
    {
      v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    title = self->_title;
    objc_msgSend(v6, "title");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (title == v10
      || (v11 = self->_title,
          objc_msgSend(v6, "title"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSString isEqualToString:](v11, "isEqualToString:", v3)))
    {
      sound = self->_sound;
      objc_msgSend(v6, "sound");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](sound, "isEqualToString:", v14)
        && (v15 = -[Alarm isActive](self, "isActive"), v15 == objc_msgSend(v6, "isActive"))
        && (daySetting = self->_daySetting, daySetting == objc_msgSend(v6, "daySetting")))
      {
        allowsSnooze = self->_allowsSnooze;
        v12 = allowsSnooze == objc_msgSend(v6, "allowsSnooze");
      }
      else
      {
        v12 = 0;
      }

      if (title == v10)
        goto LABEL_16;
    }
    else
    {
      v12 = 0;
    }

LABEL_16:
    goto LABEL_17;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[Alarm alarmID](self, "alarmID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)alarmID
{
  NSString *alarmID;
  const __CFAllocator *v4;
  const __CFUUID *v5;
  NSString *v6;
  NSString *v7;

  alarmID = self->_alarmID;
  if (!alarmID)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    CFUUIDCreateString(v4, v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alarmID;
    self->_alarmID = v6;

    -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", self->_alarmID, CFSTR("alarmId"));
    CFRelease(v5);
    alarmID = self->_alarmID;
  }
  return alarmID;
}

- (NSURL)alarmIDURL
{
  NSURL *alarmIDURL;
  id v4;
  void *v5;
  void *v6;
  NSURL *v7;
  NSURL *v8;

  alarmIDURL = self->_alarmIDURL;
  if (!alarmIDURL)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E98]);
    -[Alarm alarmID](self, "alarmID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("x-apple-clock:alarm?id="), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSURL *)objc_msgSend(v4, "initWithString:", v6);
    v8 = self->_alarmIDURL;
    self->_alarmIDURL = v7;

    alarmIDURL = self->_alarmIDURL;
  }
  return alarmIDURL;
}

- (NSDictionary)settings
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_settings, "copy");
}

- (void)setHour:(unsigned int)a3
{
  NSMutableDictionary *settings;
  id v4;

  self->_hour = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v4, CFSTR("hour"));

}

- (void)setMinute:(unsigned int)a3
{
  NSMutableDictionary *settings;
  id v4;

  self->_minute = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v4, CFSTR("minute"));

}

- (BOOL)isActive
{
  if (self->_forceActiveForMigration)
    return 1;
  if (self->_pretendActiveIfProxy)
    return -[NSString hasPrefix:](self->_alarmID, "hasPrefix:", CFSTR("AlarmEditingProxyID"));
  return 0;
}

- (void)setIsSleepAlarm:(BOOL)a3
{
  NSMutableDictionary *settings;
  id v4;

  self->_isSleepAlarm = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v4, CFSTR("isSleepAlarm"));

}

- (NSNumber)bedtimeReminderMinutes
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_settings, "objectForKey:", CFSTR("bedtimeReminderMinutes"));
}

- (void)setBedtimeReminderMinutes:(id)a3
{
  NSMutableDictionary *settings;

  settings = self->_settings;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", a3, CFSTR("bedtimeReminderMinutes"));
  else
    -[NSMutableDictionary removeObjectForKey:](settings, "removeObjectForKey:", CFSTR("bedtimeReminderMinutes"));
}

- (int64_t)bedtimeHour
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKey:](self->_settings, "objectForKey:", CFSTR("bedtimeHour"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setBedtimeHour:(int64_t)a3
{
  NSMutableDictionary *settings;
  id v4;

  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v4, CFSTR("bedtimeHour"));

}

- (int64_t)bedtimeMinute
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKey:](self->_settings, "objectForKey:", CFSTR("bedtimeMinute"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setBedtimeMinute:(int64_t)a3
{
  NSMutableDictionary *settings;
  id v4;

  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v4, CFSTR("bedtimeMinute"));

}

- (BOOL)repeats
{
  return self->_daySetting != 0;
}

- (NSArray)repeatDays
{
  NSArray *repeatDays;
  void *v4;
  uint64_t i;
  void *v6;
  NSArray *v7;
  NSArray *v8;

  repeatDays = self->_repeatDays;
  if (!repeatDays)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
    for (i = 0; i != 7; ++i)
    {
      if ((self->_daySetting & RepeatDayMap[i]) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

      }
    }
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v4);
    v8 = self->_repeatDays;
    self->_repeatDays = v7;

    repeatDays = self->_repeatDays;
  }
  return repeatDays;
}

- (void)setDaySetting:(unsigned int)a3
{
  NSMutableDictionary *settings;
  void *v5;
  NSArray *repeatDays;

  self->_daySetting = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v5, CFSTR("daySetting"));

  repeatDays = self->_repeatDays;
  self->_repeatDays = 0;

}

- (void)setAllowsSnooze:(BOOL)a3
{
  NSMutableDictionary *settings;
  id v4;

  self->_allowsSnooze = a3;
  settings = self->_settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v4, CFSTR("allowsSnooze"));

}

- (void)setSound:(id)a3 ofType:(int64_t)a4
{
  NSString *v6;
  const __CFString *sound;
  NSMutableDictionary *settings;
  void *v9;
  NSString *obj;
  NSString *obja;

  obj = (NSString *)a3;
  if (-[NSString length](obj, "length"))
  {
    v6 = obj;
  }
  else
  {

    v6 = 0;
  }
  if (!v6)
    a4 = 0;
  obja = v6;
  if (v6 != self->_sound)
  {
    objc_storeStrong((id *)&self->_sound, v6);
    if (self->_sound)
      sound = (const __CFString *)self->_sound;
    else
      sound = &stru_1E39CF258;
    -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", sound, CFSTR("sound"));
    v6 = obja;
  }
  if (a4 != self->_soundType)
  {
    self->_soundType = a4;
    settings = self->_settings;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](settings, "setObject:forKey:", v9, CFSTR("soundType"));

    v6 = obja;
  }

}

- (void)setSoundVolume:(id)a3
{
  id v5;
  float v6;
  void *v7;
  float v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    if (v6 < 0.0 || (objc_msgSend(v9, "floatValue"), v8 > 1.0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("Alarm.m"), 494, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("volumeIsValid"));

    }
    -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", v9, CFSTR("soundVolume"));
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_settings, "removeObjectForKey:", CFSTR("soundVolume"));
  }

}

- (NSNumber)soundVolume
{
  return (NSNumber *)-[NSMutableDictionary objectForKeyedSubscript:](self->_settings, "objectForKeyedSubscript:", CFSTR("soundVolume"));
}

- (NSString)vibrationID
{
  NSString *vibrationID;
  NSString *v3;
  void *v4;

  vibrationID = self->_vibrationID;
  if (vibrationID)
  {
    v3 = vibrationID;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF748], "sharedVibrationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultVibrationIdentifierForAlertType:", 13);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setVibrationID:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *obj;
  NSString *obja;

  obj = (NSString *)a3;
  objc_msgSend(MEMORY[0x1E0DBF748], "sharedVibrationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "vibrationWithIdentifierIsValid:", obj) & 1) != 0)
  {
    v5 = obj;
    if (obj)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(v4, "defaultVibrationIdentifierForAlertType:", 13);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  obja = v5;
  if (v5 != self->_vibrationID)
  {
    objc_storeStrong((id *)&self->_vibrationID, v5);
    -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", self->_vibrationID, CFSTR("vibe"));
  }

}

- (NSString)uiTitle
{
  NSString *title;
  NSString *v3;
  void *v4;

  title = self->_title;
  if (title)
  {
    v3 = title;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ALARM_DEFAULT_TITLE"), &stru_1E39CF258, 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  const __CFString *title;
  NSString *v6;
  NSString *v7;

  v6 = (NSString *)a3;
  if (-[NSString length](v6, "length"))
  {
    v4 = v6;
  }
  else
  {

    v4 = 0;
  }
  if (v4 != self->_title)
  {
    v7 = v4;
    objc_storeStrong((id *)&self->_title, v4);
    if (self->_title)
      title = (const __CFString *)self->_title;
    else
      title = &stru_1E39CF258;
    -[NSMutableDictionary setObject:forKey:](self->_settings, "setObject:forKey:", title, CFSTR("title"));
    v4 = v7;
  }

}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)Alarm;
  -[Alarm description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %d:%02d 0x%04X \"%@\" %@ <%@ #%i> %@"), v4, self->_hour, self->_minute, self->_daySetting, self->_title, self->_sound, self->_lastModified, self->_revision, self->_alarmID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  return (id)-[NSMutableDictionary description](self->_settings, "description");
}

- (Alarm)editingProxy
{
  return self->_editingProxy;
}

- (void)setAlarmID:(id)a3
{
  objc_storeStrong((id *)&self->_alarmID, a3);
}

- (void)setAlarmIDURL:(id)a3
{
  objc_storeStrong((id *)&self->_alarmIDURL, a3);
}

- (BOOL)isSnoozed
{
  return self->_snoozed;
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (unsigned)hour
{
  return self->_hour;
}

- (unsigned)minute
{
  return self->_minute;
}

- (unsigned)daySetting
{
  return self->_daySetting;
}

- (BOOL)allowsSnooze
{
  return self->_allowsSnooze;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (NSString)sound
{
  return self->_sound;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (unsigned)revision
{
  return self->_revision;
}

- (AlarmDelegate)delegate
{
  return (AlarmDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)forceActiveForMigration
{
  return self->_forceActiveForMigration;
}

- (void)setForceActiveForMigration:(BOOL)a3
{
  self->_forceActiveForMigration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_alarmIDURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_vibrationID, 0);
  objc_storeStrong((id *)&self->_repeatDays, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_editingProxy, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
}

@end
