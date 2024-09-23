@implementation HDMCOvulationConfirmationNotificationFiredState

- (HDMCOvulationConfirmationNotificationFiredState)initWithFireDayIndex:(int64_t)a3
{
  HDMCOvulationConfirmationNotificationFiredState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDMCOvulationConfirmationNotificationFiredState;
  result = -[HDMCOvulationConfirmationNotificationFiredState init](&v5, sel_init);
  if (result)
    result->_fireDayIndex = a3;
  return result;
}

- (id)firedDayIndex
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_fireDayIndex);
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
    v8 = (void *)objc_msgSend(v6, "initWithFireDayIndex:", objc_msgSend(v7, "integerValue"));

  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      +[HDMCOvulationConfirmationNotificationScheduledState notificationStateFromDictionaryRepresentation:].cold.1(v9);
    v8 = 0;
  }

  return v8;
}

- (int64_t)stateType
{
  return 3;
}

- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  objc_super v14;

  if (-[HDMCOvulationConfirmationNotificationFiredState fireDayIndex](self, "fireDayIndex") > a3)
    return self;
  v14.receiver = self;
  v14.super_class = (Class)HDMCOvulationConfirmationNotificationFiredState;
  -[HDMCOvulationConfirmationNotificationStateMachineState computeNewStateFromCorrelatingPeriodStartDayIndex:fertileWindowEndDayIndex:fireDayIndex:daysShiftedForFertileWindow:daysWithWristTemp45DaysBeforeOvulationConfirmed:](&v14, sel_computeNewStateFromCorrelatingPeriodStartDayIndex_fertileWindowEndDayIndex_fireDayIndex_daysShiftedForFertileWindow_daysWithWristTemp45DaysBeforeOvulationConfirmed_, a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDMCOvulationConfirmationNotificationFiredState;
  -[HDMCOvulationConfirmationNotificationStateMachineState dictionaryRepresentation](&v8, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HDMCOvulationConfirmationNotificationFiredState fireDayIndex](self, "fireDayIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("FireDayIndex"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDMCOvulationConfirmationNotificationFiredState;
  if (-[HDMCOvulationConfirmationNotificationStateMachineState isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_fireDayIndex == v4[1];
  else
    v5 = 0;

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_fireDayIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p fireDayIndex:%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)fireDayIndex
{
  return self->_fireDayIndex;
}

@end
