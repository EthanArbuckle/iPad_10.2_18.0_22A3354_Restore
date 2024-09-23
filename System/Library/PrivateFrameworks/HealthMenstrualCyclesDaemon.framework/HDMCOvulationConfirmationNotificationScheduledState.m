@implementation HDMCOvulationConfirmationNotificationScheduledState

- (id)scheduledNotificationFireDayIndex
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState fireDayIndex](self, "fireDayIndex"));
}

- (id)scheduledNotificationFertileWindowEndDayIndex
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState fertileWindowEndDayIndex](self, "fertileWindowEndDayIndex"));
}

- (id)scheduledNotificationDaysWithWristTemp45DaysBeforeOvulationConfirmed
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState daysWithWristTemp45DaysBeforeOvulationConfirmed](self, "daysWithWristTemp45DaysBeforeOvulationConfirmed"));
}

- (id)scheduledNotificationDaysShiftedForFertileWindow
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState daysShiftedForFertileWindow](self, "daysShiftedForFertileWindow"));
}

- (HDMCOvulationConfirmationNotificationScheduledState)initWithFertileWindowEndDayIndex:(int64_t)a3 fireDayIndex:(int64_t)a4 correlatingPeriodStartDayIndex:(int64_t)a5 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a6 daysShiftedForFertileWindow:(int64_t)a7
{
  HDMCOvulationConfirmationNotificationScheduledState *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HDMCOvulationConfirmationNotificationScheduledState;
  result = -[HDMCOvulationConfirmationNotificationScheduledState init](&v13, sel_init);
  if (result)
  {
    result->_fertileWindowEndDayIndex = a3;
    result->_fireDayIndex = a4;
    result->_correlatingPeriodStartDayIndex = a5;
    result->_daysWithWristTemp45DaysBeforeOvulationConfirmed = a6;
    result->_daysShiftedForFertileWindow = a7;
  }
  return result;
}

+ (id)notificationStateFromDictionaryRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FertileWindowEndDayIndex"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_10;
  v6 = (void *)v5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FireDayIndex"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_9;
  v8 = (void *)v7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CorrelatingPeriodStartDayIndex"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  v10 = (void *)v9;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DaysWithWristTemp45DaysBeforeOvulationConfirmedKey"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

    goto LABEL_8;
  }
  v12 = (void *)v11;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DaysShiftedForFertileWindow"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v26 = objc_alloc((Class)a1);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FertileWindowEndDayIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FireDayIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CorrelatingPeriodStartDayIndex"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DaysWithWristTemp45DaysBeforeOvulationConfirmedKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DaysShiftedForFertileWindow"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v26, "initWithFertileWindowEndDayIndex:fireDayIndex:correlatingPeriodStartDayIndex:daysWithWristTemp45DaysBeforeOvulationConfirmed:daysShiftedForFertileWindow:", v15, v17, v19, v21, objc_msgSend(v22, "integerValue"));

    goto LABEL_13;
  }
LABEL_10:
  _HKInitializeLogging();
  v24 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    +[HDMCOvulationConfirmationNotificationScheduledState notificationStateFromDictionaryRepresentation:].cold.1(v24);
  v23 = 0;
LABEL_13:

  return v23;
}

- (int64_t)stateType
{
  return 2;
}

- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3
{
  return -[HDMCOvulationConfirmationNotificationFiredState initWithFireDayIndex:]([HDMCOvulationConfirmationNotificationFiredState alloc], "initWithFireDayIndex:", a3);
}

- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  HDMCOvulationConfirmationNotificationScheduledState *v13;
  objc_super v15;

  if (-[HDMCOvulationConfirmationNotificationScheduledState fireDayIndex](self, "fireDayIndex") <= a3
    || -[HDMCOvulationConfirmationNotificationScheduledState fertileWindowEndDayIndex](self, "fertileWindowEndDayIndex") == a4)
  {
    v15.receiver = self;
    v15.super_class = (Class)HDMCOvulationConfirmationNotificationScheduledState;
    -[HDMCOvulationConfirmationNotificationStateMachineState computeNewStateFromCorrelatingPeriodStartDayIndex:fertileWindowEndDayIndex:fireDayIndex:daysShiftedForFertileWindow:daysWithWristTemp45DaysBeforeOvulationConfirmed:](&v15, sel_computeNewStateFromCorrelatingPeriodStartDayIndex_fertileWindowEndDayIndex_fireDayIndex_daysShiftedForFertileWindow_daysWithWristTemp45DaysBeforeOvulationConfirmed_, a3, a4, a5, a6, a7);
    v13 = (HDMCOvulationConfirmationNotificationScheduledState *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = -[HDMCOvulationConfirmationNotificationScheduledState initWithFertileWindowEndDayIndex:fireDayIndex:correlatingPeriodStartDayIndex:daysWithWristTemp45DaysBeforeOvulationConfirmed:daysShiftedForFertileWindow:](self, "initWithFertileWindowEndDayIndex:fireDayIndex:correlatingPeriodStartDayIndex:daysWithWristTemp45DaysBeforeOvulationConfirmed:daysShiftedForFertileWindow:", a4, a5, a3, a7, a6);
  }
  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HDMCOvulationConfirmationNotificationScheduledState;
  -[HDMCOvulationConfirmationNotificationStateMachineState dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState fertileWindowEndDayIndex](self, "fertileWindowEndDayIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("FertileWindowEndDayIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState fireDayIndex](self, "fireDayIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("FireDayIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState correlatingPeriodStartDayIndex](self, "correlatingPeriodStartDayIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("CorrelatingPeriodStartDayIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState daysWithWristTemp45DaysBeforeOvulationConfirmed](self, "daysWithWristTemp45DaysBeforeOvulationConfirmed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("DaysWithWristTemp45DaysBeforeOvulationConfirmedKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState daysShiftedForFertileWindow](self, "daysShiftedForFertileWindow"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("DaysShiftedForFertileWindow"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMCOvulationConfirmationNotificationScheduledState;
  if (-[HDMCOvulationConfirmationNotificationStateMachineState isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = self->_fertileWindowEndDayIndex == v5[1]
      && self->_fireDayIndex == v5[2]
      && self->_correlatingPeriodStartDayIndex == v5[3]
      && self->_daysWithWristTemp45DaysBeforeOvulationConfirmed == v5[4]
      && self->_daysShiftedForFertileWindow == v5[5];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_fertileWindowEndDayIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_fireDayIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_correlatingPeriodStartDayIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_daysWithWristTemp45DaysBeforeOvulationConfirmed);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_daysShiftedForFertileWindow);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p fertileWindowEndDayIndex: %@ fireDayIndex:%@ correlatingPeriodStartDayIndex: %@ daysWithWristTemp45DaysBeforeOvulationConfirmed:%@ daysShiftedForFertileWindow:%@>"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)fertileWindowEndDayIndex
{
  return self->_fertileWindowEndDayIndex;
}

- (int64_t)fireDayIndex
{
  return self->_fireDayIndex;
}

- (int64_t)correlatingPeriodStartDayIndex
{
  return self->_correlatingPeriodStartDayIndex;
}

- (int64_t)daysWithWristTemp45DaysBeforeOvulationConfirmed
{
  return self->_daysWithWristTemp45DaysBeforeOvulationConfirmed;
}

- (int64_t)daysShiftedForFertileWindow
{
  return self->_daysShiftedForFertileWindow;
}

+ (void)notificationStateFromDictionaryRepresentation:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (id)OUTLINED_FUNCTION_3();
  HKSensitiveLogItem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Cannot retrieve full state from dictionary: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
