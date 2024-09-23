@implementation HDMCUnconfirmedDeviationNotificationStateMachineState

- (HDMCUnconfirmedDeviationNotificationStateMachineState)initWithFireDayIndex:(id)a3
{
  id v5;
  HDMCUnconfirmedDeviationNotificationStateMachineState *v6;
  HDMCUnconfirmedDeviationNotificationStateMachineState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMCUnconfirmedDeviationNotificationStateMachineState;
  v6 = -[HDMCUnconfirmedDeviationNotificationStateMachineState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fireDayIndex, a3);

  return v7;
}

- (id)scheduledNotificationFireDayIndex
{
  return 0;
}

+ (id)stateFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __objc2_class **v6;
  HDMCUnconfirmedDeviationNotificationWaitingState *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StateType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 == 1)
  {
    v6 = off_24DB21108;
  }
  else
  {
    if (v5 != 2)
    {
LABEL_6:
      v7 = -[HDMCUnconfirmedDeviationNotificationStateMachineState initWithFireDayIndex:]([HDMCUnconfirmedDeviationNotificationWaitingState alloc], "initWithFireDayIndex:", 0);
      goto LABEL_7;
    }
    v6 = off_24DB210F8;
  }
  -[__objc2_class notificationStateFromDictionaryRepresentation:](*v6, "notificationStateFromDictionaryRepresentation:", v3);
  v7 = (HDMCUnconfirmedDeviationNotificationWaitingState *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
LABEL_7:

  return v7;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCUnconfirmedDeviationNotificationStateMachineState stateType](self, "stateType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("StateType"));

  -[HDMCUnconfirmedDeviationNotificationStateMachineState fireDayIndex](self, "fireDayIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("FireDayIndex"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (id)computeStateFromNoUnconfirmedDeviations
{
  return -[HDMCUnconfirmedDeviationNotificationStateMachineState initWithFireDayIndex:]([HDMCUnconfirmedDeviationNotificationWaitingState alloc], "initWithFireDayIndex:", 0);
}

- (id)computeNewStateFromUnconfirmedDeviations:(id)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v25 = a5;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "days");
          v19 = v18 + v17 - 1;
          if (v18 <= 0)
            v19 = 0x7FFFFFFFFFFFFFFFLL;
          if (v19 > v13)
          {
            v20 = objc_msgSend(v16, "days");
            if (v21 <= 0)
              v13 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v13 = v21 + v20 - 1;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    -[HDMCUnconfirmedDeviationNotificationStateMachineState computeNewStateFromMaxEnd:dismissalDayIndex:scheduledFireDayIndex:](self, "computeNewStateFromMaxEnd:dismissalDayIndex:scheduledFireDayIndex:", v13, v9, v25);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HDMCUnconfirmedDeviationNotificationStateMachineState computeStateFromNoUnconfirmedDeviations](self, "computeStateFromNoUnconfirmedDeviations");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v22;

  return v23;
}

- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5
{
  HDMCUnconfirmedDeviationNotificationScheduledState *v6;
  void *v7;
  HDMCUnconfirmedDeviationNotificationScheduledState *v8;

  v6 = [HDMCUnconfirmedDeviationNotificationScheduledState alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDMCUnconfirmedDeviationNotificationScheduledState initWithFireDayIndex:](v6, "initWithFireDayIndex:", v7);

  return v8;
}

- (id)computeNewStateFromAnalysis:(id)a3 dismissalDayIndex:(id)a4 currentDate:(id)a5 unconfirmedDeviationNotificationTimeOfDay:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v10 = (void *)MEMORY[0x24BDBCE48];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "hk_gregorianCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hkmc_nextDateAfterDate:matchingHourComponents:", v12, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "hk_dayIndexWithCalendar:", v15);
  objc_msgSend(v14, "deviations");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMCUnconfirmedDeviationNotificationStateMachineState computeNewStateFromUnconfirmedDeviations:dismissalDayIndex:scheduledFireDayIndex:](self, "computeNewStateFromUnconfirmedDeviations:dismissalDayIndex:scheduledFireDayIndex:", v18, v13, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[HDMCUnconfirmedDeviationNotificationStateMachineState stateType](self, "stateType"),
        v5 == objc_msgSend(v4, "stateType")))
  {
    -[HDMCUnconfirmedDeviationNotificationStateMachineState fireDayIndex](self, "fireDayIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");
    objc_msgSend(v4, "fireDayIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)hk_redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (NSNumber)fireDayIndex
{
  return self->_fireDayIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDayIndex, 0);
}

- (int64_t)stateType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 1;
}

@end
