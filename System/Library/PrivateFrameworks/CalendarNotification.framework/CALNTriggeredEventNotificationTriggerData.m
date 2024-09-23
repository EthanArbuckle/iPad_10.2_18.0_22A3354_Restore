@implementation CALNTriggeredEventNotificationTriggerData

- (CALNTriggeredEventNotificationTriggerData)initWithTrigger:(unint64_t)a3 alarmID:(id)a4 isOffsetFromTravelTimeStart:(BOOL)a5 hypothesis:(id)a6
{
  id v10;
  id v11;
  CALNTriggeredEventNotificationTriggerData *v12;
  CALNTriggeredEventNotificationTriggerData *v13;
  uint64_t v14;
  NSString *alarmID;
  objc_super v17;

  v10 = a4;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CALNTriggeredEventNotificationTriggerData;
  v12 = -[CALNTriggeredEventNotificationTriggerData init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_trigger = a3;
    v14 = objc_msgSend(v10, "copy");
    alarmID = v13->_alarmID;
    v13->_alarmID = (NSString *)v14;

    v13->_isOffsetFromTravelTimeStart = a5;
    objc_storeStrong((id *)&v13->_hypothesis, a6);
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CALNTriggeredEventNotificationTriggerData trigger](self, "trigger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationTriggerData alarmID](self, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationTriggerData isOffsetFromTravelTimeStart](self, "isOffsetFromTravelTimeStart"))
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  -[CALNTriggeredEventNotificationTriggerData hypothesis](self, "hypothesis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>(trigger = %@, alarmID = %@, isOffsetFromTravelTimeStart = %@, hypothesis = %@)"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (BOOL)isOffsetFromTravelTimeStart
{
  return self->_isOffsetFromTravelTimeStart;
}

- (EKTravelEngineHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hypothesis, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end
