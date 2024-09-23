@implementation CALNTriggeredEventNotificationFeedbackHelper

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(id)a3 event:(id)a4 hypothesis:(id)a5 travelAdvisoryTimelinessPeriod:(unint64_t)a6 foundInAppsEventTracker:(id)a7 suggestionsServiceLogger:(id)a8 ttlEventTracker:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (a6)
  {
    +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerAlertTypeForTravelAdvisoryTimelinessPeriod:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerAlertTypeForTravelAdvisoryTimelinessPeriod:", a6);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = -[NSObject unsignedIntegerValue](v20, "unsignedIntegerValue");
      v23 = v22;
      if (v15)
      {
        v48 = v22;
        objc_msgSend(v15, "suggestionInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v17, "trackPseudoEventInitialTimeToLeaveFired");
          objc_msgSend(v15, "suggestionInfo");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "uniqueKey");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "logEventShowedTimeToLeaveNotificationWithUniqueKey:", v26);
          +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v51 = v14;
            v52 = 2112;
            v53 = v26;
            _os_log_impl(&dword_215D9B000, v27, OS_LOG_TYPE_DEFAULT, "Tracked pseudo event initial time to leave fired and logged event showed time to leave notification for source client identifier = %{public}@, unique key = %@", buf, 0x16u);
          }

        }
        if (v16)
        {
          v45 = v18;
          v46 = v17;
          v44 = v14;
          v28 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerTransportTypeForGEOTransportType:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerTransportTypeForGEOTransportType:", objc_msgSend(v16, "transportType"));
          v29 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerETATypeForHypothesis:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerETATypeForHypothesis:", v16);
          v30 = v19;
          v31 = +[CALNTimeToLeaveEventTrackerUtilities ttlEventTrackerTravelStateForHypothesisTravelState:](CALNTimeToLeaveEventTrackerUtilities, "ttlEventTrackerTravelStateForHypothesisTravelState:", objc_msgSend(v16, "travelState"));
          v32 = objc_msgSend(v15, "hasPredictedLocation");
          objc_msgSend(v15, "calendar");
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = -[NSObject sharingStatus](v33, "sharingStatus");
          v41 = v28;
          v43 = v30;
          v35 = v28;
          v14 = v44;
          v39 = v31;
          objc_msgSend(v30, "trackEventFiredTTLAlertWithAlertType:transportType:etaType:travelState:hasSuggestedLocation:isOnSharedCalendar:", v48, v35, v29, v31, v32, v34 != 0);
          +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v29);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v34 != 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v51 = v44;
            v52 = 2114;
            v53 = v49;
            v54 = 2114;
            v55 = v42;
            v56 = 2114;
            v57 = v36;
            v58 = 2114;
            v59 = v40;
            v60 = 2114;
            v61 = v37;
            v62 = 2114;
            v63 = v38;
            _os_log_impl(&dword_215D9B000, v47, OS_LOG_TYPE_DEFAULT, "Tracked event fired ttl alert with source client identifier = %{public}@, alert type = %{public}@, transport type = %{public}@, eta type = %{public}@, travel state = %{public}@, has suggested location = %{public}@, is on shared calendar = %{public}@", buf, 0x48u);

          }
          v18 = v45;
          v17 = v46;
          v19 = v43;
        }
        else
        {
          +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:].cold.4((uint64_t)v14, v48);
        }
      }
      else
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:].cold.3((uint64_t)v14, v23);
      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:].cold.2(a6);
    }

  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[CALNTriggeredEventNotificationFeedbackHelper recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:].cold.1();
  }

}

+ (void)sendFeedbackForPostingNotificationWithTravelAdvisoryTimelinessPeriod:(unint64_t)a3 sourceClientIdentifier:(id)a4 travelEngine:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Preparing to send feedback for posting notification with source client identifier = %{public}@, travel advisory timeliness status = %{public}@", (uint8_t *)&v14, 0x16u);

  }
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v7;
        v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Determined not to send feedback for added notification with source client identifier = %{public}@, travel advisory timeliness status = %{public}@", (uint8_t *)&v14, 0x16u);

      }
      goto LABEL_11;
    case 1uLL:
      objc_msgSend(v8, "sendFeedbackForPostingLeaveByNotificationForEventWithExternalURL:", v7);
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v14 = 138543362;
      v15 = v7;
      v13 = "Sent feedback for posting leave by notification for event with external URL = %{public}@";
      break;
    case 2uLL:
      objc_msgSend(v8, "sendFeedbackForPostingLeaveNowNotificationForEventWithExternalURL:", v7);
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v14 = 138543362;
      v15 = v7;
      v13 = "Sent feedback for posting leave now notification for event with external URL = %{public}@";
      break;
    default:
      goto LABEL_12;
  }
  _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
LABEL_11:

LABEL_12:
}

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v1, v2, "Cannot record display of initial time to leave alert with travel advisory status = %{public}@, source client identifier = %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(uint64_t)a1 event:hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:.cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v2, v3, "Could not get ttl event tracker alert type for travel advisory timeliness status = %{public}@, source client identifier = %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(uint64_t)a1 event:(uint64_t)a2 hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:.cold.3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v3, v4, "Cannot record display of initial time to leave alert because could not get event to compute required supporting metrics for source client identifier = %{public}@, alert type = %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

+ (void)recordDisplayOfInitialTimeToLeaveAlertForSourceClientIdentifier:(uint64_t)a1 event:(uint64_t)a2 hypothesis:travelAdvisoryTimelinessPeriod:foundInAppsEventTracker:suggestionsServiceLogger:ttlEventTracker:.cold.4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_215D9B000, v3, v4, "Cannot record display of initial time to leave alert because no hypothesis available to compute required supporting metrics for source client identifier = %{public}@, alert type = %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
