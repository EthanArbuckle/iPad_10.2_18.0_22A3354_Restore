@implementation HDMCOvulationConfirmationNotificationWaitingState

- (int64_t)stateType
{
  return 1;
}

- (HDMCOvulationConfirmationNotificationWaitingState)initWithFiredDayIndex:(id)a3
{
  id v5;
  HDMCOvulationConfirmationNotificationWaitingState *v6;
  HDMCOvulationConfirmationNotificationWaitingState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMCOvulationConfirmationNotificationWaitingState;
  v6 = -[HDMCOvulationConfirmationNotificationWaitingState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationPreviouslyFiredDayIndex, a3);

  return v7;
}

- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  uint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  HDMCOvulationConfirmationNotificationFiredState *v17;
  void *v18;
  HDMCOvulationConfirmationNotificationFiredState *v19;
  objc_super v21;

  -[HDMCOvulationConfirmationNotificationWaitingState notificationPreviouslyFiredDayIndex](self, "notificationPreviouslyFiredDayIndex");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13
    && (v14 = (void *)v13,
        -[HDMCOvulationConfirmationNotificationWaitingState notificationPreviouslyFiredDayIndex](self, "notificationPreviouslyFiredDayIndex"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v16 = objc_msgSend(v15, "integerValue"), v15, v14, v16 > a3))
  {
    v17 = [HDMCOvulationConfirmationNotificationFiredState alloc];
    -[HDMCOvulationConfirmationNotificationWaitingState notificationPreviouslyFiredDayIndex](self, "notificationPreviouslyFiredDayIndex");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDMCOvulationConfirmationNotificationFiredState initWithFireDayIndex:](v17, "initWithFireDayIndex:", objc_msgSend(v18, "integerValue"));

    return v19;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)HDMCOvulationConfirmationNotificationWaitingState;
    -[HDMCOvulationConfirmationNotificationStateMachineState computeNewStateFromCorrelatingPeriodStartDayIndex:fertileWindowEndDayIndex:fireDayIndex:daysShiftedForFertileWindow:daysWithWristTemp45DaysBeforeOvulationConfirmed:](&v21, sel_computeNewStateFromCorrelatingPeriodStartDayIndex_fertileWindowEndDayIndex_fireDayIndex_daysShiftedForFertileWindow_daysWithWristTemp45DaysBeforeOvulationConfirmed_, a3, a4, a5, a6, a7);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)notificationStateFromDictionaryRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NotificationPreviouslyFiredDayIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithFiredDayIndex:", v6);
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDMCOvulationConfirmationNotificationWaitingState;
  -[HDMCOvulationConfirmationNotificationStateMachineState dictionaryRepresentation](&v7, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HDMCOvulationConfirmationNotificationWaitingState notificationPreviouslyFiredDayIndex](self, "notificationPreviouslyFiredDayIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("NotificationPreviouslyFiredDayIndex"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSNumber *notificationPreviouslyFiredDayIndex;
  NSNumber *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMCOvulationConfirmationNotificationWaitingState;
  if (!-[HDMCOvulationConfirmationNotificationStateMachineState isEqual:](&v9, sel_isEqual_, v4))
    goto LABEL_5;
  notificationPreviouslyFiredDayIndex = self->_notificationPreviouslyFiredDayIndex;
  v6 = (NSNumber *)v4[1];
  if (notificationPreviouslyFiredDayIndex == v6)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (v6)
    v7 = -[NSNumber isEqual:](notificationPreviouslyFiredDayIndex, "isEqual:");
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p notificationPreviouslyFiredDayIndex: %@>"), objc_opt_class(), self, self->_notificationPreviouslyFiredDayIndex);
}

- (NSNumber)notificationPreviouslyFiredDayIndex
{
  return self->_notificationPreviouslyFiredDayIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationPreviouslyFiredDayIndex, 0);
}

@end
