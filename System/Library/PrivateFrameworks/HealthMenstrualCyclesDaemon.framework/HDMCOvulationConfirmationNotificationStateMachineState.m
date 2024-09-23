@implementation HDMCOvulationConfirmationNotificationStateMachineState

- (id)scheduledNotificationFireDayIndex
{
  return 0;
}

- (id)firedDayIndex
{
  return 0;
}

- (id)scheduledNotificationFertileWindowEndDayIndex
{
  return 0;
}

- (id)scheduledNotificationDaysWithWristTemp45DaysBeforeOvulationConfirmed
{
  return 0;
}

- (id)scheduledNotificationDaysShiftedForFertileWindow
{
  return 0;
}

+ (id)stateFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  HDMCOvulationConfirmationNotificationFeatureOffState *v6;
  __objc2_class *v7;
  HDMCOvulationConfirmationNotificationFeatureOffState *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StateType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  switch(v5)
  {
    case 0:
      v6 = objc_alloc_init(HDMCOvulationConfirmationNotificationFeatureOffState);
      goto LABEL_7;
    case 1:
      v7 = HDMCOvulationConfirmationNotificationWaitingState;
      goto LABEL_6;
    case 2:
      v7 = HDMCOvulationConfirmationNotificationScheduledState;
      goto LABEL_6;
    case 3:
      v7 = HDMCOvulationConfirmationNotificationFiredState;
LABEL_6:
      -[__objc2_class notificationStateFromDictionaryRepresentation:](v7, "notificationStateFromDictionaryRepresentation:", v3);
      v6 = (HDMCOvulationConfirmationNotificationFeatureOffState *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = v6;
      if (!v6)
        goto LABEL_8;
      goto LABEL_9;
    default:
LABEL_8:
      v8 = objc_alloc_init(HDMCOvulationConfirmationNotificationFeatureOffState);
LABEL_9:

      return v8;
  }
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationStateMachineState stateType](self, "stateType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("StateType"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  HDMCOvulationConfirmationNotificationStateMachineState *v4;
  HDMCOvulationConfirmationNotificationStateMachineState *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (HDMCOvulationConfirmationNotificationStateMachineState *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HDMCOvulationConfirmationNotificationStateMachineState stateType](self, "stateType");
      v7 = -[HDMCOvulationConfirmationNotificationStateMachineState stateType](v5, "stateType");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)computeNewStateFromAnalysis:(id)a3 currentDate:(id)a4 fertileWindowNotificationTimeOfDay:(id)a5 fertilityNotificationsEnabled:(BOOL)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v34;

  v34 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "fertileWindowProjections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "predictionPrimarySource") == 3;

  objc_msgSend(v12, "fertileWindowProjections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "allDays");
  if (v19 <= 0)
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v20 = v19 + v18 - 1;

  objc_msgSend(v12, "cycles");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "menstruationSegment");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "days");

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hkmc_nextDateAfterDate:matchingHourComponents:", v11, v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "hk_dayIndexWithCalendar:", v25);
  objc_msgSend(v12, "fertileWindowProjections");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "daysOffsetFromCalendarMethod");

  -[HDMCOvulationConfirmationNotificationStateMachineState computeNewStateFromFertilityNotificationsEnabled:isOvulationConfirmed:correlatingPeriodStartDayIndex:fertileWindowEndDayIndex:fireDayIndex:daysShiftedForFertileWindow:daysWithWristTemp45DaysBeforeOvulationConfirmed:](self, "computeNewStateFromFertilityNotificationsEnabled:isOvulationConfirmed:correlatingPeriodStartDayIndex:fertileWindowEndDayIndex:fireDayIndex:daysShiftedForFertileWindow:daysWithWristTemp45DaysBeforeOvulationConfirmed:", v34, v15, v24, v20, v27, v30, a7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)computeNewStateFromFertilityNotificationsEnabled:(BOOL)a3 isOvulationConfirmed:(BOOL)a4 correlatingPeriodStartDayIndex:(int64_t)a5 fertileWindowEndDayIndex:(int64_t)a6 fireDayIndex:(int64_t)a7 daysShiftedForFertileWindow:(int64_t)a8 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a9
{
  HDMCOvulationConfirmationNotificationFeatureOffState *v10;
  HDMCOvulationConfirmationNotificationWaitingState *v11;
  HDMCOvulationConfirmationNotificationWaitingState *v12;
  void *v13;

  if (a3)
  {
    if (!a4)
    {
      v12 = [HDMCOvulationConfirmationNotificationWaitingState alloc];
      -[HDMCOvulationConfirmationNotificationStateMachineState firedDayIndex](self, "firedDayIndex");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HDMCOvulationConfirmationNotificationWaitingState initWithFiredDayIndex:](v12, "initWithFiredDayIndex:", v13);

      return v11;
    }
    -[HDMCOvulationConfirmationNotificationStateMachineState computeNewStateFromCorrelatingPeriodStartDayIndex:fertileWindowEndDayIndex:fireDayIndex:daysShiftedForFertileWindow:daysWithWristTemp45DaysBeforeOvulationConfirmed:](self, "computeNewStateFromCorrelatingPeriodStartDayIndex:fertileWindowEndDayIndex:fireDayIndex:daysShiftedForFertileWindow:daysWithWristTemp45DaysBeforeOvulationConfirmed:", a5, a6, a7, a8, a9);
    v10 = (HDMCOvulationConfirmationNotificationFeatureOffState *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(HDMCOvulationConfirmationNotificationFeatureOffState);
  }
  v11 = (HDMCOvulationConfirmationNotificationWaitingState *)v10;
  return v11;
}

- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  return -[HDMCOvulationConfirmationNotificationScheduledState initWithFertileWindowEndDayIndex:fireDayIndex:correlatingPeriodStartDayIndex:daysWithWristTemp45DaysBeforeOvulationConfirmed:daysShiftedForFertileWindow:]([HDMCOvulationConfirmationNotificationScheduledState alloc], "initWithFertileWindowEndDayIndex:fireDayIndex:correlatingPeriodStartDayIndex:daysWithWristTemp45DaysBeforeOvulationConfirmed:daysShiftedForFertileWindow:", a4, a5, a3, a7, a6);
}

- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3
{
  return 0;
}

- (id)hk_redactedDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (int64_t)stateType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
