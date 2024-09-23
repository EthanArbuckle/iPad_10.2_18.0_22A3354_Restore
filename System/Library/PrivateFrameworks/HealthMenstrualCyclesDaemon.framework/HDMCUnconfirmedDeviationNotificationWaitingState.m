@implementation HDMCUnconfirmedDeviationNotificationWaitingState

- (int64_t)stateType
{
  return 1;
}

- (id)scheduledNotificationFireDayIndex
{
  return 0;
}

+ (id)notificationStateFromDictionaryRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FireDayIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithFireDayIndex:", v6);
  return v7;
}

- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  HDMCUnconfirmedDeviationNotificationScheduledState *v15;
  HDMCUnconfirmedDeviationNotificationWaitingState *v16;
  HDMCUnconfirmedDeviationNotificationScheduledState *v17;
  void *v18;
  HDMCUnconfirmedDeviationNotificationScheduledState *v19;

  v8 = a4;
  -[HDMCUnconfirmedDeviationNotificationStateMachineState fireDayIndex](self, "fireDayIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {

    if (!v10)
    {
      v10 = v8;
      goto LABEL_10;
    }
    v11 = objc_msgSend(v8, "intValue");
    -[HDMCUnconfirmedDeviationNotificationStateMachineState fireDayIndex](self, "fireDayIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (v11 <= v13)
      v14 = v13;
    else
      v14 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v14 + 180);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v10)
  {
    v15 = [HDMCUnconfirmedDeviationNotificationScheduledState alloc];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v16 = -[HDMCUnconfirmedDeviationNotificationScheduledState initWithFireDayIndex:](v15, "initWithFireDayIndex:", v10);
LABEL_13:
    v19 = (HDMCUnconfirmedDeviationNotificationScheduledState *)v16;
    goto LABEL_14;
  }
LABEL_10:
  if (objc_msgSend(v10, "integerValue") >= a3)
  {
    v16 = self;
    goto LABEL_13;
  }
  v17 = [HDMCUnconfirmedDeviationNotificationScheduledState alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDMCUnconfirmedDeviationNotificationScheduledState initWithFireDayIndex:](v17, "initWithFireDayIndex:", v18);

LABEL_14:
  return v19;
}

@end
