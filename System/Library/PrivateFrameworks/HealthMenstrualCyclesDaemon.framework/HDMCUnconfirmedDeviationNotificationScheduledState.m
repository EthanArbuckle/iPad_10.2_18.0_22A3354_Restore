@implementation HDMCUnconfirmedDeviationNotificationScheduledState

- (HDMCUnconfirmedDeviationNotificationScheduledState)initWithFireDayIndex:(id)a3
{
  id v5;
  HDMCUnconfirmedDeviationNotificationScheduledState *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDMCUnconfirmedDeviationNotificationStateMachineState.m"), 152, CFSTR("You cannot enter a scheduled state without a fire day associated with it"));

  }
  v9.receiver = self;
  v9.super_class = (Class)HDMCUnconfirmedDeviationNotificationScheduledState;
  v6 = -[HDMCUnconfirmedDeviationNotificationStateMachineState initWithFireDayIndex:](&v9, sel_initWithFireDayIndex_, v5);

  return v6;
}

+ (id)notificationStateFromDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FireDayIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc((Class)a1);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FireDayIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithFireDayIndex:", v7);

  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      +[HDMCUnconfirmedDeviationNotificationScheduledState notificationStateFromDictionaryRepresentation:].cold.1(v9);
    v8 = 0;
  }

  return v8;
}

- (int64_t)stateType
{
  return 2;
}

- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3
{
  HDMCUnconfirmedDeviationNotificationWaitingState *v4;
  void *v5;
  HDMCUnconfirmedDeviationNotificationWaitingState *v6;

  v4 = [HDMCUnconfirmedDeviationNotificationWaitingState alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDMCUnconfirmedDeviationNotificationStateMachineState initWithFireDayIndex:](v4, "initWithFireDayIndex:", v5);

  return v6;
}

- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5
{
  id v8;
  void *v9;
  HDMCUnconfirmedDeviationNotificationWaitingState *v10;
  HDMCUnconfirmedDeviationNotificationWaitingState *v11;

  v8 = a4;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "integerValue") <= a5 && objc_msgSend(v9, "integerValue") >= a3)
    v10 = -[HDMCUnconfirmedDeviationNotificationStateMachineState initWithFireDayIndex:]([HDMCUnconfirmedDeviationNotificationWaitingState alloc], "initWithFireDayIndex:", 0);
  else
    v10 = self;
  v11 = v10;

  return v11;
}

+ (void)notificationStateFromDictionaryRepresentation:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)objc_opt_class();
  v3 = v2;
  HKSensitiveLogItem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v2;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_21961B000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot retrieve full state from dictionary: %@", (uint8_t *)&v5, 0x16u);

}

@end
