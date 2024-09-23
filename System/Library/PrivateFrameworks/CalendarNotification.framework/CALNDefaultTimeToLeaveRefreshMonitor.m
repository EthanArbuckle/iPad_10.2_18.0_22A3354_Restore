@implementation CALNDefaultTimeToLeaveRefreshMonitor

- (CALNDefaultTimeToLeaveRefreshMonitor)initWithStorage:(id)a3
{
  id v5;
  CALNDefaultTimeToLeaveRefreshMonitor *v6;
  CALNDefaultTimeToLeaveRefreshMonitor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNDefaultTimeToLeaveRefreshMonitor;
  v6 = -[CALNDefaultTimeToLeaveRefreshMonitor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storage, a3);

  return v7;
}

- (void)activate
{
  -[CALNDefaultTimeToLeaveRefreshMonitor setActive:](self, "setActive:", 1);
}

- (void)deactivate
{
  -[CALNDefaultTimeToLeaveRefreshMonitor setActive:](self, "setActive:", 0);
}

- (void)didRegisterForAlarms
{
  -[CALNDefaultTimeToLeaveRefreshMonitor setRegisteredForAlarms:](self, "setRegisteredForAlarms:", 1);
}

- (void)receivedAlarmNamed:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *string;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;

  v4 = a3;
  if (!-[CALNDefaultTimeToLeaveRefreshMonitor isActive](self, "isActive"))
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CALNDefaultTimeToLeaveRefreshMonitor receivedAlarmNamed:].cold.4();
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("CalendarNotificationRefreshTimer-")))
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v5 = xpc_copy_event();
    v6 = v5;
    if (v5)
    {
      string = xpc_dictionary_get_string(v5, "com.apple.calaccessd.TTLRefreshMonitor.alarm.context.URLString");
      if (string)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[CALNDefaultTimeToLeaveRefreshMonitor _refreshTimerFiredForEventExternalURL:](self, "_refreshTimerFiredForEventExternalURL:", v8);
        }
        else
        {
          v23 = (void *)MEMORY[0x2199F22AC](v6);
          +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[CALNDefaultTimeToLeaveRefreshMonitor receivedAlarmNamed:].cold.3();

          free(v23);
        }
      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[CALNDefaultTimeToLeaveRefreshMonitor receivedAlarmNamed:].cold.2(v8, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CALNDefaultTimeToLeaveRefreshMonitor receivedAlarmNamed:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }

LABEL_17:
  }

}

- (void)setUpRefreshTimerWithTriggerDate:(id)a3 eventExternalURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  double v13;
  int64_t v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[CALNDefaultTimeToLeaveRefreshMonitor isRegisteredForAlarms](self, "isRegisteredForAlarms"))
  {
    -[CALNDefaultTimeToLeaveRefreshMonitor storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refreshDateWithIdentifier:", v7);
    v9 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToDate:", v9))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        v21 = v6;
        v22 = 2114;
        v23 = v7;
        _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "A refresh timer with the same trigger date of [%{public}@] has already been set up. Will not set up a new timer. Event external URL: [%{public}@].", (uint8_t *)&v20, 0x16u);
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_refreshTimerAlarmNameForEventExternalURL:", v7);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "UTF8String");

      objc_msgSend(v6, "timeIntervalSinceNow");
      if (v13 >= 0.0)
      {
        v14 = (unint64_t)((ceil(v13) + (double)time(0)) * 1000000000.0);
        v10 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_date(v10, (const char *)*MEMORY[0x24BE14018], v14);
        v15 = objc_retainAutorelease(v7);
        xpc_dictionary_set_string(v10, "com.apple.calaccessd.TTLRefreshMonitor.alarm.context.URLString", (const char *)objc_msgSend(v15, "UTF8String"));
        xpc_set_event();
        v16 = (void *)MEMORY[0x2199F22AC](v10);
        +[CALNLogSubsystem alarmEngine](CALNLogSubsystem, "alarmEngine");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 136315138;
          v21 = v16;
          _os_log_impl(&dword_215D9B000, v17, OS_LOG_TYPE_DEFAULT, "Scheduled XPC alarm event: %s.", (uint8_t *)&v20, 0xCu);
        }

        free(v16);
        -[CALNDefaultTimeToLeaveRefreshMonitor storage](self, "storage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addRefreshDate:withIdentifier:", v6, v15);

        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138543874;
          v21 = v15;
          v22 = 2114;
          v23 = v6;
          v24 = 2082;
          v25 = v12;
          _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_DEFAULT, "Set up refresh timer. event external url = %{public}@, trigger date = %{public}@, job name = %{public}s", (uint8_t *)&v20, 0x20u);
        }

      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CALNDefaultTimeToLeaveRefreshMonitor setUpRefreshTimerWithTriggerDate:eventExternalURL:].cold.1();
      }
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[CALNDefaultTimeToLeaveRefreshMonitor setUpRefreshTimerWithTriggerDate:eventExternalURL:].cold.2();
  }

}

- (void)removeRefreshTimerForEventExternalURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CALNDefaultTimeToLeaveRefreshMonitor isRegisteredForAlarms](self, "isRegisteredForAlarms"))
  {
    -[CALNDefaultTimeToLeaveRefreshMonitor storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refreshDateWithIdentifier:", v4);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "_refreshTimerAlarmNameForEventExternalURL:", v4);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[NSObject UTF8String](v7, "UTF8String");
      xpc_set_event();
      -[CALNDefaultTimeToLeaveRefreshMonitor storage](self, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeRefreshDateWithIdentifier:", v4);

      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = v4;
        _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Removed refresh timer for event with external url = %{public}@", (uint8_t *)&v10, 0xCu);
      }

    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CALNDefaultTimeToLeaveRefreshMonitor removeRefreshTimerForEventExternalURL:].cold.1();
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CALNDefaultTimeToLeaveRefreshMonitor removeRefreshTimerForEventExternalURL:].cold.2();
  }

}

- (void)_refreshTimerFiredForEventExternalURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Refresh timer fired for event external url = %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[CALNDefaultTimeToLeaveRefreshMonitor delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timeToLeaveRefreshMonitor:refreshTimerFiredForEventExternalURL:", self, v4);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNDefaultTimeToLeaveRefreshMonitor _refreshTimerFiredForEventExternalURL:].cold.1();

  }
}

+ (id)_refreshTimerAlarmNameForEventExternalURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a3, "hash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-[%@]"), CFSTR("CalendarNotificationRefreshTimer-"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CALNTimeToLeaveRefreshMonitorDelegate)delegate
{
  return (CALNTimeToLeaveRefreshMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CALNTimeToLeaveRefreshStorage)storage
{
  return self->_storage;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isRegisteredForAlarms
{
  return self->_registeredForAlarms;
}

- (void)setRegisteredForAlarms:(BOOL)a3
{
  self->_registeredForAlarms = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)receivedAlarmNamed:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_215D9B000, a1, a3, "Could not get event alarm object", a5, a6, a7, a8, 0);
}

- (void)receivedAlarmNamed:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_215D9B000, a1, a3, "Could not get alarm context url string from event alarm object", a5, a6, a7, a8, 0);
}

- (void)receivedAlarmNamed:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Could not get saved external url from alarm = %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)receivedAlarmNamed:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "Received alarm but time to leave refresh monitor is not active. alarm name = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setUpRefreshTimerWithTriggerDate:eventExternalURL:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_215D9B000, v0, OS_LOG_TYPE_ERROR, "Ignoring attempt to set refresh timer for [%{public}@] that would fire in the past [%{public}@].", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)setUpRefreshTimerWithTriggerDate:eventExternalURL:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_215D9B000, v0, OS_LOG_TYPE_FAULT, "Time to leave refresh monitor is not registered for alarms. Cannot set up refresh timer for event, event external url = %{public}@, refresh date = %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeRefreshTimerForEventExternalURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "There is no existing refresh timer to remove for event with external URL = %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeRefreshTimerForEventExternalURL:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_215D9B000, v0, OS_LOG_TYPE_FAULT, "Time to leave refresh monitor is not registered for alarms. Cannot remove refresh timer for event, event external url = %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_refreshTimerFiredForEventExternalURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, v0, v1, "No delegate available to message about fired refresh timer for event external url = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
