@implementation CALNTriggeredEventNotificationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CALNTriggeredEventNotificationData)init
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return (CALNTriggeredEventNotificationData *)-[CALNTriggeredEventNotificationData _initWithAlarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:hypothesis:hasDisplayedLeaveByMessage:hasDisplayedLeaveNowMessage:hasDisplayedRunningLateMessage:lastTimeNotificationAdded:](self, "_initWithAlarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:hypothesis:hasDisplayedLeaveByMessage:hasDisplayedLeaveNowMessage:hasDisplayedRunningLateMessage:lastTimeNotificationAdded:", 0, 0, 0, 0, 0, 0, v3, 0);
}

- (id)_initWithAlarmID:(id)a3 isOffsetFromTravelTimeStart:(BOOL)a4 lastFireTimeOfAlertOffsetFromTravelTime:(id)a5 hypothesis:(id)a6 hasDisplayedLeaveByMessage:(BOOL)a7 hasDisplayedLeaveNowMessage:(BOOL)a8 hasDisplayedRunningLateMessage:(BOOL)a9 lastTimeNotificationAdded:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  CALNTriggeredEventNotificationData *v20;
  uint64_t v21;
  NSString *alarmID;
  uint64_t v23;
  NSDate *lastFireTimeOfAlertOffsetFromTravelTime;
  uint64_t v25;
  EKTravelEngineHypothesis *hypothesis;
  uint64_t v27;
  NSDate *lastTimeNotificationAdded;
  objc_super v30;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CALNTriggeredEventNotificationData;
  v20 = -[CALNTriggeredEventNotificationData init](&v30, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    alarmID = v20->_alarmID;
    v20->_alarmID = (NSString *)v21;

    v20->_isOffsetFromTravelTimeStart = a4;
    v23 = objc_msgSend(v17, "copy");
    lastFireTimeOfAlertOffsetFromTravelTime = v20->_lastFireTimeOfAlertOffsetFromTravelTime;
    v20->_lastFireTimeOfAlertOffsetFromTravelTime = (NSDate *)v23;

    v25 = objc_msgSend(v18, "copy");
    hypothesis = v20->_hypothesis;
    v20->_hypothesis = (EKTravelEngineHypothesis *)v25;

    v20->_hasDisplayedLeaveByMessage = a7;
    v20->_hasDisplayedLeaveNowMessage = a8;
    v20->_hasDisplayedRunningLateMessage = a9;
    v27 = objc_msgSend(v19, "copy");
    lastTimeNotificationAdded = v20->_lastTimeNotificationAdded;
    v20->_lastTimeNotificationAdded = (NSDate *)v27;

  }
  return v20;
}

- (CALNTriggeredEventNotificationData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  CALNTriggeredEventNotificationData *v13;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alarmID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOffsetFromTravelTimeStart"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastFireTimeOfAlertOffsetFromTravelTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hypothesis"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDisplayedLeaveByMessage"));
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDisplayedLeaveNowMessage"));
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDisplayedRunningLateMessage"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastTimeNotificationAdded"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = v11;
  v13 = -[CALNTriggeredEventNotificationData _initWithAlarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:hypothesis:hasDisplayedLeaveByMessage:hasDisplayedLeaveNowMessage:hasDisplayedRunningLateMessage:lastTimeNotificationAdded:](self, "_initWithAlarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:hypothesis:hasDisplayedLeaveByMessage:hasDisplayedLeaveNowMessage:hasDisplayedRunningLateMessage:lastTimeNotificationAdded:", v5, v6, v7, v8, v9, v10, v15, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CALNTriggeredEventNotificationData alarmID](self, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("alarmID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CALNTriggeredEventNotificationData isOffsetFromTravelTimeStart](self, "isOffsetFromTravelTimeStart"), CFSTR("isOffsetFromTravelTimeStart"));
  -[CALNTriggeredEventNotificationData lastFireTimeOfAlertOffsetFromTravelTime](self, "lastFireTimeOfAlertOffsetFromTravelTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lastFireTimeOfAlertOffsetFromTravelTime"));

  -[CALNTriggeredEventNotificationData hypothesis](self, "hypothesis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("hypothesis"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CALNTriggeredEventNotificationData hasDisplayedLeaveByMessage](self, "hasDisplayedLeaveByMessage"), CFSTR("hasDisplayedLeaveByMessage"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CALNTriggeredEventNotificationData hasDisplayedLeaveNowMessage](self, "hasDisplayedLeaveNowMessage"), CFSTR("hasDisplayedLeaveNowMessage"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CALNTriggeredEventNotificationData hasDisplayedRunningLateMessage](self, "hasDisplayedRunningLateMessage"), CFSTR("hasDisplayedRunningLateMessage"));
  -[CALNTriggeredEventNotificationData lastTimeNotificationAdded](self, "lastTimeNotificationAdded");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("lastTimeNotificationAdded"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CALNMutableTriggeredEventNotificationData *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _BOOL8 v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t v15;

  v4 = [CALNMutableTriggeredEventNotificationData alloc];
  -[CALNTriggeredEventNotificationData alarmID](self, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CALNTriggeredEventNotificationData isOffsetFromTravelTimeStart](self, "isOffsetFromTravelTimeStart");
  -[CALNTriggeredEventNotificationData lastFireTimeOfAlertOffsetFromTravelTime](self, "lastFireTimeOfAlertOffsetFromTravelTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationData hypothesis](self, "hypothesis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CALNTriggeredEventNotificationData hasDisplayedLeaveByMessage](self, "hasDisplayedLeaveByMessage");
  v10 = -[CALNTriggeredEventNotificationData hasDisplayedLeaveNowMessage](self, "hasDisplayedLeaveNowMessage");
  v11 = -[CALNTriggeredEventNotificationData hasDisplayedRunningLateMessage](self, "hasDisplayedRunningLateMessage");
  -[CALNTriggeredEventNotificationData lastTimeNotificationAdded](self, "lastTimeNotificationAdded");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v11;
  v13 = -[CALNTriggeredEventNotificationData _initWithAlarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:hypothesis:hasDisplayedLeaveByMessage:hasDisplayedLeaveNowMessage:hasDisplayedRunningLateMessage:lastTimeNotificationAdded:](v4, "_initWithAlarmID:isOffsetFromTravelTimeStart:lastFireTimeOfAlertOffsetFromTravelTime:hypothesis:hasDisplayedLeaveByMessage:hasDisplayedLeaveNowMessage:hasDisplayedRunningLateMessage:lastTimeNotificationAdded:", v5, v6, v7, v8, v9, v10, v15, v12);

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[CALNTriggeredEventNotificationData isEqualToNotificationData:](self, "isEqualToNotificationData:", v4);

  return v5;
}

- (BOOL)isEqualToNotificationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  void *v20;
  void *v21;

  v4 = a3;
  -[CALNTriggeredEventNotificationData alarmID](self, "alarmID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alarmID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CalEqualStrings();

  if (!v7)
    goto LABEL_8;
  v8 = -[CALNTriggeredEventNotificationData isOffsetFromTravelTimeStart](self, "isOffsetFromTravelTimeStart");
  if (v8 != objc_msgSend(v4, "isOffsetFromTravelTimeStart"))
    goto LABEL_8;
  -[CALNTriggeredEventNotificationData lastFireTimeOfAlertOffsetFromTravelTime](self, "lastFireTimeOfAlertOffsetFromTravelTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastFireTimeOfAlertOffsetFromTravelTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CalEqualObjects();

  if (!v11)
    goto LABEL_8;
  -[CALNTriggeredEventNotificationData hypothesis](self, "hypothesis");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hypothesis");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CalEqualObjects();

  if (!v14)
    goto LABEL_8;
  v15 = -[CALNTriggeredEventNotificationData hasDisplayedLeaveByMessage](self, "hasDisplayedLeaveByMessage");
  if (v15 == objc_msgSend(v4, "hasDisplayedLeaveByMessage")
    && (v16 = -[CALNTriggeredEventNotificationData hasDisplayedLeaveNowMessage](self, "hasDisplayedLeaveNowMessage"),
        v16 == objc_msgSend(v4, "hasDisplayedLeaveNowMessage"))
    && (v17 = -[CALNTriggeredEventNotificationData hasDisplayedRunningLateMessage](self, "hasDisplayedRunningLateMessage"), v17 == objc_msgSend(v4, "hasDisplayedRunningLateMessage")))
  {
    -[CALNTriggeredEventNotificationData lastTimeNotificationAdded](self, "lastTimeNotificationAdded");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastTimeNotificationAdded");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CalEqualObjects();

  }
  else
  {
LABEL_8:
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  -[CALNTriggeredEventNotificationData alarmID](self, "alarmID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("YES");
  if (-[CALNTriggeredEventNotificationData isOffsetFromTravelTimeStart](self, "isOffsetFromTravelTimeStart"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[CALNTriggeredEventNotificationData lastFireTimeOfAlertOffsetFromTravelTime](self, "lastFireTimeOfAlertOffsetFromTravelTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNTriggeredEventNotificationData hypothesis](self, "hypothesis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CALNTriggeredEventNotificationData hasDisplayedLeaveByMessage](self, "hasDisplayedLeaveByMessage"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[CALNTriggeredEventNotificationData hasDisplayedLeaveNowMessage](self, "hasDisplayedLeaveNowMessage"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (!-[CALNTriggeredEventNotificationData hasDisplayedRunningLateMessage](self, "hasDisplayedRunningLateMessage"))
    v5 = CFSTR("NO");
  -[CALNTriggeredEventNotificationData lastTimeNotificationAdded](self, "lastTimeNotificationAdded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>(alarmID = %@, isOffsetFromTravelTimeStart = %@, lastFireTimeOfAlertOffsetFromTravelTime = %@, hypothesis = %@, hasDisplayedLeaveByMessage = %@, hasDisplayedLeaveNowMessage = %@, hasDisplayedRunningLateMessage = %@, lastTimeNotificationAdded = %@)"), v3, self, v4, v6, v7, v8, v9, v10, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (BOOL)isOffsetFromTravelTimeStart
{
  return self->_isOffsetFromTravelTimeStart;
}

- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime
{
  return self->_lastFireTimeOfAlertOffsetFromTravelTime;
}

- (EKTravelEngineHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (BOOL)hasDisplayedLeaveByMessage
{
  return self->_hasDisplayedLeaveByMessage;
}

- (BOOL)hasDisplayedLeaveNowMessage
{
  return self->_hasDisplayedLeaveNowMessage;
}

- (BOOL)hasDisplayedRunningLateMessage
{
  return self->_hasDisplayedRunningLateMessage;
}

- (NSDate)lastTimeNotificationAdded
{
  return self->_lastTimeNotificationAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTimeNotificationAdded, 0);
  objc_storeStrong((id *)&self->_hypothesis, 0);
  objc_storeStrong((id *)&self->_lastFireTimeOfAlertOffsetFromTravelTime, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end
