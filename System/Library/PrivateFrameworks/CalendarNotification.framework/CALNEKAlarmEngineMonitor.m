@implementation CALNEKAlarmEngineMonitor

- (void)receivedNotificationNamed:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (-[CALNEKAlarmEngineMonitor isActive](self, "isActive"))
  {
    -[CALNEKAlarmEngineMonitor alarmEngine](self, "alarmEngine");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleDarwinNotification:](v5, "handleDarwinNotification:", v4);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CALNEKAlarmEngineMonitor receivedNotificationNamed:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (BOOL)isActive
{
  return self->_active;
}

- (_EKAlarmEngine)alarmEngine
{
  return self->_alarmEngine;
}

- (CALNEKAlarmEngineMonitor)initWithAlarmEngine:(id)a3 notificationCenter:(id)a4
{
  id v7;
  id v8;
  CALNEKAlarmEngineMonitor *v9;
  CALNEKAlarmEngineMonitor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNEKAlarmEngineMonitor;
  v9 = -[CALNEKAlarmEngineMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alarmEngine, a3);
    objc_storeStrong((id *)&v10->_notificationCenter, a4);
  }

  return v10;
}

- (void)activate
{
  void *v3;

  -[CALNEKAlarmEngineMonitor alarmEngine](self, "alarmEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[CALNEKAlarmEngineMonitor setActive:](self, "setActive:", 1);
}

- (void)deactivate
{
  -[CALNEKAlarmEngineMonitor setActive:](self, "setActive:", 0);
}

- (void)didRegisterForAlarms
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_215D9B000, log, OS_LOG_TYPE_FAULT, "Alarm engine monitor received did register for alarms message but the alarm engine monitor is not active. Cannot send did register for alarms message to alarm engine.", v1, 2u);
}

- (void)receivedAlarmNamed:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (-[CALNEKAlarmEngineMonitor isActive](self, "isActive"))
  {
    -[CALNEKAlarmEngineMonitor alarmEngine](self, "alarmEngine");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject receivedAlarmNamed:](v5, "receivedAlarmNamed:", v4);
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CALNEKAlarmEngineMonitor receivedAlarmNamed:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (void)addAlarmsFiredObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[CALNEKAlarmEngineMonitor notificationCenter](self, "notificationCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CALNEKAlarmEngineMonitor alarmEngine](self, "alarmEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", v6, a4, CFSTR("EKAlarmEngineAlarmsDidFireNotification"), v7);

}

- (void)removeAlarmsFiredObserver:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CALNEKAlarmEngineMonitor notificationCenter](self, "notificationCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CALNEKAlarmEngineMonitor alarmEngine](self, "alarmEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", v4, CFSTR("EKAlarmEngineAlarmsDidFireNotification"), v5);

}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmEngine, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (void)receivedNotificationNamed:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Received notification but alarm engine monitor is not active. notification name = %{public}@", a5, a6, a7, a8, 2u);
}

- (void)receivedAlarmNamed:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Received alarm but alarm engine monitor is not active. alarm name = %{public}@", a5, a6, a7, a8, 2u);
}

@end
