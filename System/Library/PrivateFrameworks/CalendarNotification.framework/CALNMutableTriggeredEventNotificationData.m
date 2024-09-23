@implementation CALNMutableTriggeredEventNotificationData

- (id)copyWithZone:(_NSZone *)a3
{
  CALNTriggeredEventNotificationData *v4;
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

  v4 = [CALNTriggeredEventNotificationData alloc];
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

- (void)setAlarmID:(id)a3
{
  NSString *v4;
  NSString *alarmID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  alarmID = self->super._alarmID;
  self->super._alarmID = v4;

}

- (void)setIsOffsetFromTravelTimeStart:(BOOL)a3
{
  self->super._isOffsetFromTravelTimeStart = a3;
}

- (void)setLastFireTimeOfAlertOffsetFromTravelTime:(id)a3
{
  NSDate *v4;
  NSDate *lastFireTimeOfAlertOffsetFromTravelTime;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  lastFireTimeOfAlertOffsetFromTravelTime = self->super._lastFireTimeOfAlertOffsetFromTravelTime;
  self->super._lastFireTimeOfAlertOffsetFromTravelTime = v4;

}

- (void)setHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->super._hypothesis, a3);
}

- (void)setHasDisplayedLeaveByMessage:(BOOL)a3
{
  self->super._hasDisplayedLeaveByMessage = a3;
}

- (void)setHasDisplayedLeaveNowMessage:(BOOL)a3
{
  self->super._hasDisplayedLeaveNowMessage = a3;
}

- (void)setHasDisplayedRunningLateMessage:(BOOL)a3
{
  self->super._hasDisplayedRunningLateMessage = a3;
}

- (void)setLastTimeNotificationAdded:(id)a3
{
  NSDate *v4;
  NSDate *lastTimeNotificationAdded;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  lastTimeNotificationAdded = self->super._lastTimeNotificationAdded;
  self->super._lastTimeNotificationAdded = v4;

}

@end
