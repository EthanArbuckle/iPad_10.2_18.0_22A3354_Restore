@implementation HUMobileTimerObject

- (HUMobileTimerObject)initWithAlarm:(id)a3
{
  id v5;
  HUMobileTimerObject *v6;
  HUMobileTimerObject *v7;
  uint64_t v8;
  NSUUID *uniqueIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMobileTimerObject;
  v6 = -[HUMobileTimerObject init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alarm, a3);
    objc_msgSend(v5, "alarmID");
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v8;

  }
  return v7;
}

- (HUMobileTimerObject)initWithTimer:(id)a3
{
  id v5;
  HUMobileTimerObject *v6;
  HUMobileTimerObject *v7;
  uint64_t v8;
  NSUUID *uniqueIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMobileTimerObject;
  v6 = -[HUMobileTimerObject init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timer, a3);
    objc_msgSend(v5, "timerID");
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v8;

  }
  return v7;
}

- (unint64_t)hash
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[HUMobileTimerObject alarm](self, "alarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_2;
  -[HUMobileTimerObject timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObject.m"), 41, CFSTR("HUMobileTimerObject must wrap an alarm or a timer"));
LABEL_2:

  }
  -[HUMobileTimerObject alarm](self, "alarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[HUMobileTimerObject alarm](self, "alarm");
  else
    -[HUMobileTimerObject timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)_timerIDsMatch:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HUMobileTimerObject timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
  {
    -[HUMobileTimerObject timer](self, "timer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v9);

  }
  return v6;
}

- (BOOL)_alarmIDsMatch:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HUMobileTimerObject alarm](self, "alarm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 && v5)
  {
    -[HUMobileTimerObject alarm](self, "alarm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alarmID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alarmID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqual:", v9);

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;

  v5 = a3;
  -[HUMobileTimerObject alarm](self, "alarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_2;
  -[HUMobileTimerObject timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObject.m"), 70, CFSTR("HUMobileTimerObject must wrap an alarm or a timer"));
LABEL_2:

  }
  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    goto LABEL_17;
  -[HUMobileTimerObject alarm](self, "alarm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[HUMobileTimerObject timer](self, "timer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v10, "timer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = objc_opt_class();
        NSLog(CFSTR("Comparing non-timer (%@) to timer"), v18);
      }
      objc_msgSend(v10, "timer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HUMobileTimerObject _timerIDsMatch:](self, "_timerIDsMatch:", v14);
      goto LABEL_16;
    }
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v10, "alarm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_opt_class();
    NSLog(CFSTR("Comparing non-alarm (%@) to alarm"), v13);
  }
  objc_msgSend(v10, "alarm");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HUMobileTimerObject _alarmIDsMatch:](self, "_alarmIDsMatch:", v14);
LABEL_16:
  v19 = v15;

LABEL_18:
  return v19;
}

- (BOOL)isIgnorableTimerObject
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;

  -[HUMobileTimerObject timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUMobileTimerObject timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCurrentTimer");

    if ((v5 & 1) != 0)
      return 1;
    -[HUMobileTimerObject timer](self, "timer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "state") == 1)
    {
      -[HUMobileTimerObject timer](self, "timer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isFiring");

      if (!v8)
        return 1;
    }
    else
    {

    }
  }
  return 0;
}

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  uint8_t v17[16];

  v4 = a3;
  -[HUMobileTimerObject alarm](self, "alarm");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "alarm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HUMobileTimerObject alarm](self, "alarm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alarm");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = (void *)v9;
      v14 = objc_msgSend(v8, "compare:", v9);

      goto LABEL_11;
    }
  }
  -[HUMobileTimerObject timer](self, "timer");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v4, "timer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HUMobileTimerObject timer](self, "timer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timer");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_ERROR, "Error: comparing an MTAlarm to an MTTimer is not allowed.", v17, 2u);
  }

  v14 = 0;
LABEL_11:

  return v14;
}

- (id)description
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;

  -[HUMobileTimerObject alarm](self, "alarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_2;
  -[HUMobileTimerObject timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMobileTimerObject.m"), 123, CFSTR("HUMobileTimerObject must wrap an alarm or a timer"));
LABEL_2:

  }
  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMobileTimerObject alarm](self, "alarm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  if (v7)
  {
    -[HUMobileTimerObject alarm](self, "alarm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%p"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:withName:", v10, CFSTR("MTAlarm"));

    -[HUMobileTimerObject alarm](self, "alarm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alarmID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v6, "appendObject:withName:", v12, CFSTR("AlarmID"));

    -[HUMobileTimerObject alarm](self, "alarm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v6, "appendBool:withName:", objc_msgSend(v14, "isEnabled"), CFSTR("Enabled"));

    -[HUMobileTimerObject alarm](self, "alarm");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v6, "appendObject:withName:", v17, CFSTR("Title"));

    v19 = (void *)MEMORY[0x1E0CB3940];
    -[HUMobileTimerObject alarm](self, "alarm");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hour");
    -[HUMobileTimerObject alarm](self, "alarm");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%lu:%lu"), v21, objc_msgSend(v22, "minute"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v6, "appendObject:withName:", v23, CFSTR("HH:MM"));

  }
  else
  {
    -[HUMobileTimerObject timer](self, "timer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%p"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:withName:", v26, CFSTR("MTTimer"));

    -[HUMobileTimerObject timer](self, "timer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timerID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(v6, "appendObject:withName:", v28, CFSTR("TimerID"));

    -[HUMobileTimerObject timer](self, "timer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)objc_msgSend(v6, "appendUnsignedInteger:withName:", objc_msgSend(v30, "state"), CFSTR("State"));

    -[HUMobileTimerObject timer](self, "timer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "title");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(v6, "appendObject:withName:", v33, CFSTR("Title"));

    -[HUMobileTimerObject timer](self, "timer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "remainingTime");
    v36 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", CFSTR("Remaining"), 1);

    -[HUMobileTimerObject timer](self, "timer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "duration");
    v37 = (id)objc_msgSend(v6, "appendTimeInterval:withName:decomposeUnits:", CFSTR("of"), 1);
  }

  objc_msgSend(v6, "build");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (MTTimer)timer
{
  return self->_timer;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
}

@end
