@implementation CALNDefaultTriggeredEventNotificationTransitionProvider

- (CALNDefaultTriggeredEventNotificationTransitionProvider)initWithTravelAdvisoryAuthority:(id)a3 dateProvider:(id)a4
{
  id v7;
  id v8;
  CALNDefaultTriggeredEventNotificationTransitionProvider *v9;
  CALNDefaultTriggeredEventNotificationTransitionProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNDefaultTriggeredEventNotificationTransitionProvider;
  v9 = -[CALNDefaultTriggeredEventNotificationTransitionProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_travelAdvisoryAuthority, a3);
    objc_storeStrong((id *)&v10->_dateProvider, a4);
  }

  return v10;
}

- (unint64_t)transitionForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5 trigger:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == 2)
  {
    v13 = -[CALNDefaultTriggeredEventNotificationTransitionProvider _transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](self, "_transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:", v10, v11, v12);
  }
  else if (a6 == 1)
  {
    v13 = -[CALNDefaultTriggeredEventNotificationTransitionProvider _transitionForTravelAdviceReceivedForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](self, "_transitionForTravelAdviceReceivedForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:", v10, v11, v12);
  }
  else
  {
    if (a6)
    {
      v14 = 0;
      goto LABEL_9;
    }
    v13 = -[CALNDefaultTriggeredEventNotificationTransitionProvider _transitionForAlarmFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](self, "_transitionForAlarmFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:", v10, v11, v12);
  }
  v14 = v13;
LABEL_9:

  return v14;
}

- (unint64_t)_transitionForAlarmFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "alarmID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (-[CALNDefaultTriggeredEventNotificationTransitionProvider _shouldModifyForAlarmFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](self, "_shouldModifyForAlarmFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:", v8, v9, v10))
    {
      v12 = 2;
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CALNDefaultTriggeredEventNotificationTransitionProvider _transitionForAlarmFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:].cold.1(v13);

    v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldModifyForAlarmFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  const char *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v8;
      v16 = "Should not modify for alarm fired because old notification data is nil. source client identifier = %{public}@";
LABEL_11:
      _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);
    }
LABEL_12:
    v14 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(v9, "isOffsetFromTravelTimeStart") & 1) == 0)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v8;
      v16 = "Should not modify for alarm fired that is not offset from travel time start. source client identifier = %{public}@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(v10, "lastTimeNotificationAdded");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CALNDefaultTriggeredEventNotificationTransitionProvider dateProvider](self, "dateProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "now");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = +[CALNTravelAdvisoryUtilities isLastFireTimeOfAlert:withinEightMinutesOfDate:](CALNTravelAdvisoryUtilities, "isLastFireTimeOfAlert:withinEightMinutesOfDate:", v11, v13);
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v8;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "Should modify for alarm fired that is offset from travel time start because last fire time of alert is within eight minutes. source client identifier = %{public}@", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v8;
      _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "Should not modify for alarm fired that is offset from travel time start because last time notification added is nil. source client identifier = %{public}@", (uint8_t *)&v18, 0xCu);
    }
    v14 = 0;
  }

LABEL_17:
  return v14;
}

- (unint64_t)_transitionForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  unint64_t v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CALNDefaultTriggeredEventNotificationTransitionProvider _shouldRemoveNotificationForTravelAdviceReceivedForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](self, "_shouldRemoveNotificationForTravelAdviceReceivedForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:", v10, v9, v8);
  LODWORD(self) = -[CALNDefaultTriggeredEventNotificationTransitionProvider _shouldAddNotificationForTravelAdviceReceivedForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](self, "_shouldAddNotificationForTravelAdviceReceivedForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:", v10, v9, v8);

  v12 = 1;
  if (!(_DWORD)self)
    v12 = 2;
  if (v11)
    return 3;
  else
    return v12;
}

- (BOOL)_shouldAddNotificationForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  BOOL v16;
  int v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "hypothesis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hypothesis");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = v8;
      v15 = "Should not add notification because no new travel advice received, source client identifier = %{public}@";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (v12 && objc_msgSend(v12, "travelState") == 5)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138543362;
      v27 = v8;
      v15 = "We've detected that the user has arrived at the event's location, source client identifier = %{public}@";
LABEL_12:
      _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v26, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v10)
  {
    if (-[CALNDefaultTriggeredEventNotificationTransitionProvider _timeToLeaveStateAlreadyDisplayedBasedOnSourceNotificationInfo:oldNotificationData:](self, "_timeToLeaveStateAlreadyDisplayedBasedOnSourceNotificationInfo:oldNotificationData:", v9, v10))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138543362;
        v27 = v8;
        v15 = "Should not add notification because time to leave status has already been displayed. source client identif"
              "ier = %{public}@";
        goto LABEL_12;
      }
LABEL_13:
      v16 = 0;
      goto LABEL_14;
    }
    v18 = objc_msgSend(v10, "isOffsetFromTravelTimeStart");
    objc_msgSend(v10, "lastFireTimeOfAlertOffsetFromTravelTime");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14
      && (-[CALNDefaultTriggeredEventNotificationTransitionProvider dateProvider](self, "dateProvider"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v19, "now"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = +[CALNTravelAdvisoryUtilities isLastFireTimeOfAlert:withinEightMinutesOfDate:](CALNTravelAdvisoryUtilities, "isLastFireTimeOfAlert:withinEightMinutesOfDate:", v14, v20), v20, v19, (v18 & v21) == 1))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138543362;
        v27 = v8;
        v23 = "Should not add notification because notification recently fired due to a travel time alert. source client "
              "identifier = %{public}@";
LABEL_26:
        _os_log_impl(&dword_215D9B000, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v26, 0xCu);
      }
    }
    else
    {
      if (!v13
        || (v24 = objc_msgSend(v13, "travelState"),
            -[CALNDefaultTriggeredEventNotificationTransitionProvider travelAdvisoryAuthority](self, "travelAdvisoryAuthority"), v25 = (void *)objc_claimAutoreleasedReturnValue(), LODWORD(v24) = objc_msgSend(v25, "travelStateIndicatesTravelingTowardDestination:", v24), v25, !(_DWORD)v24))
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138543362;
          v27 = v8;
          _os_log_impl(&dword_215D9B000, v22, OS_LOG_TYPE_DEFAULT, "Should add notification because new travel advice received for existing alert. source client identifier = %{public}@", (uint8_t *)&v26, 0xCu);
        }
        v16 = 1;
        goto LABEL_31;
      }
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138543362;
        v27 = v8;
        v23 = "Should not add notification because an alert already fired for the event and the user is traveling to the "
              "destination. source client identifier = %{public}@";
        goto LABEL_26;
      }
    }
    v16 = 0;
LABEL_31:

    goto LABEL_14;
  }
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138543362;
    v27 = v8;
    _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "Should add notification because new travel advice received and no associated notification data exists already, source client identifier = %{public}@", (uint8_t *)&v26, 0xCu);
  }
  v16 = 1;
LABEL_14:

  return v16;
}

- (BOOL)_shouldRemoveNotificationForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "hypothesis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "travelState");
  v11 = 0;
  if (v8 && v10 == 5)
  {
    objc_msgSend(v8, "alarmID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v11 = 0;
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v7;
        _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "Should remove notification because the user has arrived and we've only shown pure 'Time to Leave' alerts and no manual alerts for this event. Source client identifier to remove = %{public}@", (uint8_t *)&v15, 0xCu);
      }

      v11 = 1;
    }
  }

  return v11;
}

- (unint64_t)_transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  unint64_t v16;
  NSObject *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v9, "hypothesis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
      goto LABEL_12;
    v13 = objc_msgSend(v11, "travelState");
    -[CALNDefaultTriggeredEventNotificationTransitionProvider travelAdvisoryAuthority](self, "travelAdvisoryAuthority");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "travelStateIndicatesTravelingTowardDestination:", v13);

    v16 = 2;
    if ((v15 & 1) != 0 || v13 == 5)
      goto LABEL_13;
    if (objc_msgSend(v9, "travelAdvisoryTimelinessPeriod") == 2)
    {
      if (objc_msgSend(v10, "hasDisplayedLeaveNowMessage"))
        v16 = 2;
      else
        v16 = 1;
    }
    else
    {
LABEL_12:
      v16 = 2;
    }
LABEL_13:

    goto LABEL_14;
  }
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[CALNDefaultTriggeredEventNotificationTransitionProvider _transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:].cold.1((uint64_t)v8, v17);

  v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)_timeToLeaveStateAlreadyDisplayedBasedOnSourceNotificationInfo:(id)a3 oldNotificationData:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (!v5)
  {
    LOBYTE(v9) = 0;
    goto LABEL_26;
  }
  v6 = objc_msgSend(a3, "travelAdvisoryTimelinessPeriod");
  v7 = v6;
  switch(v6)
  {
    case 3:
      v8 = objc_msgSend(v5, "hasDisplayedRunningLateMessage");
      break;
    case 2:
      v8 = objc_msgSend(v5, "hasDisplayedLeaveNowMessage");
      break;
    case 1:
      v8 = objc_msgSend(v5, "hasDisplayedLeaveByMessage");
      break;
    default:
      v9 = 0;
      goto LABEL_11;
  }
  v9 = v8;
LABEL_11:
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v9)
      v11 = CFSTR("Yes");
    else
      v11 = CFSTR("No");
    if (objc_msgSend(v5, "hasDisplayedLeaveByMessage"))
      v12 = CFSTR("Yes");
    else
      v12 = CFSTR("No");
    if (objc_msgSend(v5, "hasDisplayedLeaveNowMessage"))
      v13 = CFSTR("Yes");
    else
      v13 = CFSTR("No");
    v16 = 138544386;
    if (objc_msgSend(v5, "hasDisplayedRunningLateMessage"))
      v14 = CFSTR("Yes");
    else
      v14 = CFSTR("No");
    v17 = v11;
    v18 = 2048;
    v19 = v7;
    v20 = 2114;
    v21 = v12;
    v22 = 2114;
    v23 = v13;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "Time to leave status already displayed based on travel advisory timeliness period: (%{public}@), period = %lu, hasDisplayedLeaveByMessage = (%{public}@), hasDisplayedLeaveNowMessage = (%{public}@), hasDisplayedRunningLateMessage = (%{public}@)", (uint8_t *)&v16, 0x34u);
  }

LABEL_26:
  return v9;
}

- (CALNTravelAdvisoryAuthority)travelAdvisoryAuthority
{
  return self->_travelAdvisoryAuthority;
}

- (CalDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_travelAdvisoryAuthority, 0);
}

- (void)_transitionForAlarmFiredForSourceClientIdentifier:(os_log_t)log sourceNotificationInfo:oldNotificationData:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215D9B000, log, OS_LOG_TYPE_ERROR, "Could not get alarm ID for triggered alarm", v1, 2u);
}

- (void)_transitionForTimeToLeaveRefreshTimerFiredForSourceClientIdentifier:(uint64_t)a1 sourceNotificationInfo:(NSObject *)a2 oldNotificationData:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Could not compute transition for time to leave refresh timer fired because could not find existing notification data. source client identifier = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
