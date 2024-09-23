@implementation CALNDefaultTriggeredEventNotificationTriggerHelper

- (CALNDefaultTriggeredEventNotificationTriggerHelper)initWithTravelAdvisoryAuthority:(id)a3 dateProvider:(id)a4
{
  id v7;
  id v8;
  CALNDefaultTriggeredEventNotificationTriggerHelper *v9;
  CALNDefaultTriggeredEventNotificationTriggerHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNDefaultTriggeredEventNotificationTriggerHelper;
  v9 = -[CALNDefaultTriggeredEventNotificationTriggerHelper init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_travelAdvisoryAuthority, a3);
    objc_storeStrong((id *)&v10->_dateProvider, a4);
  }

  return v10;
}

- (BOOL)shouldTriggerForSourceClientIdentifier:(id)a3 trigger:(unint64_t)a4 sourceNotificationInfo:(id)a5 oldNotificationData:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  BOOL v17;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v10;
    v21 = 2114;
    v22 = v14;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_215D9B000, v13, OS_LOG_TYPE_DEFAULT, "Determining whether or not to trigger for source client identifier = %{public}@, trigger = %{public}@, source notification info = %@, old notification data = %@", (uint8_t *)&v19, 0x2Au);

  }
  if (a4 == 2)
  {
    v17 = -[CALNDefaultTriggeredEventNotificationTriggerHelper _shouldTriggerForTimeToLeaveRefreshForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](self, "_shouldTriggerForTimeToLeaveRefreshForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:", v10, v11, v12);
LABEL_11:
    v16 = v17;
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    v17 = -[CALNDefaultTriggeredEventNotificationTriggerHelper _shouldTriggerForTravelAdviceReceivedForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:](self, "_shouldTriggerForTravelAdviceReceivedForSourceClientIdentifier:sourceNotificationInfo:oldNotificationData:", v10, v11, v12);
    goto LABEL_11;
  }
  if (a4)
  {
    v16 = 0;
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543362;
      v20 = v10;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "Should trigger for alarm. source client identifier = %{public}@", (uint8_t *)&v19, 0xCu);
    }

    v16 = 1;
  }
LABEL_13:

  return v16;
}

- (BOOL)_shouldTriggerForTravelAdviceReceivedForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  const char *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  int v50;
  _BOOL4 v51;
  int v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  NSObject *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (unint64_t)a5;
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v52 = 138543362;
    v53 = v8;
    _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, "Determining if notification source should trigger for source client identifier = %{public}@", (uint8_t *)&v52, 0xCu);
  }

  if (!objc_msgSend(v9, "forceDisplayOfNewTravelAdvisoryHypotheses"))
  {
    if ((objc_msgSend(v9, "allowsLocationAlerts") & 1) == 0)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v52 = 138543362;
        v53 = v8;
        v14 = "Should not trigger because location alerts are disabled. source client identifier = %{public}@";
        goto LABEL_13;
      }
LABEL_14:
      v13 = 0;
      goto LABEL_34;
    }
    if (objc_msgSend(v9, "travelAdvisoryDisabled"))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v52 = 138543362;
        v53 = v8;
        v14 = "Should not trigger because event had its Time To Leave alarm removed. source client identifier = %{public}@";
LABEL_13:
        _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v52, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    objc_msgSend(v9, "hypothesis");
    v15 = objc_claimAutoreleasedReturnValue();
    v12 = v15;
    if (!(v10 | v15))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:
        v13 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v52 = 138543362;
      v53 = v8;
      v17 = "Should not trigger because nil hypothesis received and no existing notification data, source client identifier = %{public}@";
LABEL_18:
      _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v52, 0xCu);
      goto LABEL_19;
    }
    v13 = v10 != 0;
    if (v10 && !v15)
    {
      objc_msgSend((id)v10, "hypothesis");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        v52 = 138543362;
        v53 = v8;
        v17 = "Should not trigger because nil hypothesis received and existing notification data has no travel advice, so"
              "urce client identifier = %{public}@";
        goto LABEL_18;
      }
      goto LABEL_29;
    }
    if (!v15)
    {
LABEL_29:
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_32:
        v13 = 1;
        goto LABEL_33;
      }
      v52 = 138543362;
      v53 = v8;
      v20 = "Should trigger because nil hypothesis received and notification data has existing travel advice for source c"
            "lient identifier = %{public}@";
LABEL_31:
      _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v52, 0xCu);
      goto LABEL_32;
    }
    if (objc_msgSend((id)v15, "travelState") == 5)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10 != 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543618;
        v53 = v8;
        v54 = 2114;
        v55 = v19;
        _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, "We've detected that the user has arrived at the event's location. source client url = %{public}@, has existing notification data = %{public}@", (uint8_t *)&v52, 0x16u);

      }
      goto LABEL_33;
    }
    if (v10)
    {
      objc_msgSend((id)v10, "hypothesis");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_32;
        v52 = 138543362;
        v53 = v8;
        v20 = "Should trigger because notification has existing travel advice. source client identifier = %{public}@";
        goto LABEL_31;
      }
    }
    objc_msgSend(v9, "endDate");
    v16 = objc_claimAutoreleasedReturnValue();
    if (-[CALNDefaultTriggeredEventNotificationTriggerHelper _eventWillEndBeforeUserArrivesForHypothesis:eventEndDate:](self, "_eventWillEndBeforeUserArrivesForHypothesis:eventEndDate:", v12, v16))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_43:

        goto LABEL_19;
      }
      v24 = (void *)MEMORY[0x24BDD16E0];
      -[NSObject aggressiveTravelTime](v12, "aggressiveTravelTime");
      objc_msgSend(v24, "numberWithDouble:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543874;
      v53 = v8;
      v54 = 2114;
      v55 = v25;
      v56 = 2114;
      v57 = v16;
      _os_log_impl(&dword_215D9B000, v23, OS_LOG_TYPE_DEFAULT, "Should not trigger because the user has not seen travel advisory information for this event yet and we've detected the user will not arrive until the event is over. Will not show travel advisory information. source client identifier = %{public}@ \nAggressive travel time: [%{public}@] is after event end date: [%{public}@].", (uint8_t *)&v52, 0x20u);
LABEL_42:

      goto LABEL_43;
    }
    if (-[CALNDefaultTriggeredEventNotificationTriggerHelper _exceededMaximumTravelTimeThresholdForHypothesis:](self, "_exceededMaximumTravelTimeThresholdForHypothesis:", v12))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)MEMORY[0x24BDD16E0];
        -[NSObject conservativeTravelTime](v12, "conservativeTravelTime");
        objc_msgSend(v27, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x24BDD16E0];
        -[CALNDefaultTriggeredEventNotificationTriggerHelper travelAdvisoryAuthority](self, "travelAdvisoryAuthority");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "maximumAllowableTravelTime");
        objc_msgSend(v29, "numberWithDouble:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543618;
        v53 = v28;
        v54 = 2114;
        v55 = v31;
        _os_log_impl(&dword_215D9B000, v26, OS_LOG_TYPE_DEFAULT, "Conservative Travel time [%{public}@] does not satisfy the initial emission travel time requirement since it is more than the maximum allowable travel time: [%{public}@]. Will not emit hypothesis as a result.", (uint8_t *)&v52, 0x16u);

      }
      goto LABEL_19;
    }
    -[CALNDefaultTriggeredEventNotificationTriggerHelper travelAdvisoryAuthority](self, "travelAdvisoryAuthority");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "doesHypothesisSatisfyMinimumAllowableTravelTime:", v12);

    if (v10)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v52 = 138543362;
        v53 = v8;
        _os_log_impl(&dword_215D9B000, v34, OS_LOG_TYPE_DEFAULT, "Found existing notification data for event. source client identifier = %{public}@", (uint8_t *)&v52, 0xCu);
      }

      v13 = -[CALNDefaultTriggeredEventNotificationTriggerHelper _shouldTriggerForTravelAdviceReceivedGivenHasExistingNotificationDataForSourceClientIdentifier:hypothesis:sourceNotificationInfo:oldNotificationData:hasExistingTravelAdvice:satisfiesMinimumTravelTimeThreshold:](self, "_shouldTriggerForTravelAdviceReceivedGivenHasExistingNotificationDataForSourceClientIdentifier:hypothesis:sourceNotificationInfo:oldNotificationData:hasExistingTravelAdvice:satisfiesMinimumTravelTimeThreshold:", v8, v12, v9, v10, 0, v33);
      goto LABEL_33;
    }
    if ((v33 & 1) == 0)
    {
      -[NSObject estimatedTravelTime](v12, "estimatedTravelTime");
      v42 = v41;
      -[CALNDefaultTriggeredEventNotificationTriggerHelper travelAdvisoryAuthority](self, "travelAdvisoryAuthority");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "minimumAllowableTravelTime");
      v45 = v44;

      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v45);
      v46 = objc_claimAutoreleasedReturnValue();
      v52 = 138543874;
      v53 = v8;
      v54 = 2114;
      v55 = v25;
      v56 = 2114;
      v57 = v46;
      _os_log_impl(&dword_215D9B000, v23, OS_LOG_TYPE_DEFAULT, "Should not trigger because the predicated travel time is less than the minimum allowable travel time threshold so we can't provide a time to leave alert. source client identifier = %{public}@, predicated travel time = %{public}@, minimum allowable travel time threshold = %{public}@", (uint8_t *)&v52, 0x20u);

      goto LABEL_42;
    }
    objc_msgSend(v9, "startDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CALNDefaultTriggeredEventNotificationTriggerHelper dateProvider](self, "dateProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "now");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v35, "CalIsBeforeDate:", v37);

    if (v38)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v52 = 138543362;
        v53 = v8;
        v40 = "Should not trigger because the event's start date is before now and we don't have any existing notificatio"
              "n data. source client identifier = %{public}@";
LABEL_56:
        _os_log_impl(&dword_215D9B000, v39, OS_LOG_TYPE_DEFAULT, v40, (uint8_t *)&v52, 0xCu);
      }
    }
    else
    {
      v47 = -[NSObject travelState](v12, "travelState");
      if (v47 == 2)
      {
        +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 138543618;
          v53 = v8;
          v54 = 2114;
          v55 = v48;
          _os_log_impl(&dword_215D9B000, v39, OS_LOG_TYPE_DEFAULT, "Should not trigger because the user is definitely traveling to the destination and we don't have any existing notification data for this event. source client identifier = %{public}@, travel state = %{public}@", (uint8_t *)&v52, 0x16u);

        }
        goto LABEL_66;
      }
      v49 = v47;
      v50 = objc_msgSend(v9, "eventHasAlarms");
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v39 = objc_claimAutoreleasedReturnValue();
      v51 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      if (v49 != 3 || !v50)
      {
        if (v51)
        {
          v52 = 138543362;
          v53 = v8;
          _os_log_impl(&dword_215D9B000, v39, OS_LOG_TYPE_DEFAULT, "Should trigger because new travel advice received and no existing notification data for this event exists already. source client identifier = %{public}@", (uint8_t *)&v52, 0xCu);
        }
        v13 = 1;
        goto LABEL_67;
      }
      if (v51)
      {
        v52 = 138543362;
        v53 = v8;
        v40 = "Should not trigger because the user is traveling towards the destination, we don't have any existing notif"
              "ication data for this event and the event already has normal alarms on it, so the user will be alerted of "
              "this event at some point. source client identifier = %{public}@";
        goto LABEL_56;
      }
    }
LABEL_66:
    v13 = 0;
LABEL_67:

    goto LABEL_33;
  }
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v52 = 138543362;
    v53 = v8;
    _os_log_impl(&dword_215D9B000, v12, OS_LOG_TYPE_DEFAULT, "Should trigger because forcing display of new travel advisory hypotheses for source client identifier = %{public}@", (uint8_t *)&v52, 0xCu);
  }
  v13 = 1;
LABEL_34:

  return v13;
}

- (BOOL)_shouldTriggerForTravelAdviceReceivedGivenHasExistingNotificationDataForSourceClientIdentifier:(id)a3 hypothesis:(id)a4 sourceNotificationInfo:(id)a5 oldNotificationData:(id)a6 hasExistingTravelAdvice:(BOOL)a7 satisfiesMinimumTravelTimeThreshold:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = objc_msgSend(a5, "isOffsetFromTravelTimeStart");
  objc_msgSend(v15, "lastFireTimeOfAlertOffsetFromTravelTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[CALNDefaultTriggeredEventNotificationTriggerHelper dateProvider](self, "dateProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[CALNTravelAdvisoryUtilities isLastFireTimeOfAlert:withinEightMinutesOfDate:](CALNTravelAdvisoryUtilities, "isLastFireTimeOfAlert:withinEightMinutesOfDate:", v17, v19);

    if ((v16 & v20) == 1)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138543362;
        v28 = v13;
        v22 = "Should trigger because notification recently fired due to a travel time alert. source client identifier = %{public}@";
LABEL_8:
        _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v27, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  v23 = objc_msgSend(v14, "travelState");
  -[CALNDefaultTriggeredEventNotificationTriggerHelper travelAdvisoryAuthority](self, "travelAdvisoryAuthority");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v24, "travelStateIndicatesTravelingTowardDestination:", v23);

  if ((_DWORD)v23)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138543362;
      v28 = v13;
      v22 = "Should trigger because an alert was already fired for the event and the user is traveling to the destination"
            ". source client identifier = %{public}@";
      goto LABEL_8;
    }
LABEL_9:
    v25 = 1;
LABEL_15:

    goto LABEL_16;
  }
  if (!a8)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138543362;
      v28 = v13;
      _os_log_impl(&dword_215D9B000, v21, OS_LOG_TYPE_DEFAULT, "Should not trigger because new travel hypothesis received for event that does not satisfy minimum travel time threshold. source client identifier = %{public}@", (uint8_t *)&v27, 0xCu);
    }
    v25 = 0;
    goto LABEL_15;
  }
  v25 = 1;
LABEL_16:

  return v25;
}

- (BOOL)_shouldTriggerForTimeToLeaveRefreshForSourceClientIdentifier:(id)a3 sourceNotificationInfo:(id)a4 oldNotificationData:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const char *v12;
  BOOL v13;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  char v18;
  NSObject *v19;
  const char *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if ((objc_msgSend(v9, "allowsLocationAlerts") & 1) == 0)
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543362;
        v22 = v8;
        v12 = "Should not trigger for time to leave refresh timer fired because location alerts are disabled. source clie"
              "nt identifier = %{public}@";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    if (objc_msgSend(v9, "travelAdvisoryDisabled"))
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543362;
        v22 = v8;
        v12 = "Should not trigger because event had its Time To Leave alarm removed. source client identifier = %{public}@";
LABEL_10:
        _os_log_impl(&dword_215D9B000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v21, 0xCu);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    objc_msgSend(v9, "hypothesis");
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v15)
    {
      v16 = -[NSObject travelState](v15, "travelState");
      -[CALNDefaultTriggeredEventNotificationTriggerHelper travelAdvisoryAuthority](self, "travelAdvisoryAuthority");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "travelStateIndicatesTravelingTowardDestination:", v16);

      if ((v18 & 1) == 0 && v16 != 5)
      {
        if (objc_msgSend(v9, "travelAdvisoryTimelinessPeriod") == 2)
        {
          v13 = -[CALNDefaultTriggeredEventNotificationTriggerHelper _shouldTriggerForTimeToLeaveRefreshGivenImmediateDepartureTimelinessStatusForSourceClientIdentifier:oldNotificationData:](self, "_shouldTriggerForTimeToLeaveRefreshGivenImmediateDepartureTimelinessStatusForSourceClientIdentifier:oldNotificationData:", v8, v10);
          goto LABEL_12;
        }
LABEL_24:
        v13 = 1;
        goto LABEL_12;
      }
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543362;
        v22 = v8;
        v20 = "Should trigger because the user is traveling to the destination or has arrived. source client identifier = %{public}@";
        goto LABEL_22;
      }
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138543362;
        v22 = v8;
        v20 = "Should trigger for time to leave refresh timer fired because we have no travel advice. source client ident"
              "ifier = %{public}@";
LABEL_22:
        _os_log_impl(&dword_215D9B000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v21, 0xCu);
      }
    }

    goto LABEL_24;
  }
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543362;
    v22 = v8;
    v12 = "Should not trigger for time to leave refresh timer fired because no existing notification data. source client "
          "identifier = %{public}@";
    goto LABEL_10;
  }
LABEL_11:
  v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)_shouldTriggerForTimeToLeaveRefreshGivenImmediateDepartureTimelinessStatusForSourceClientIdentifier:(id)a3 oldNotificationData:(id)a4
{
  id v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(a4, "hasDisplayedLeaveNowMessage");
  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v11 = 138543362;
      v12 = v5;
      v9 = "Should not trigger for time to leave because an alert was already fired for this event and showed a 'Leave No"
           "w' message. source client identifier = %{public}@";
LABEL_6:
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v8)
  {
    v11 = 138543362;
    v12 = v5;
    v9 = "Should trigger for time to leave because the user needs to see the 'Leave Now' alert. source client identifier = %{public}@";
    goto LABEL_6;
  }

  return v6 ^ 1;
}

- (BOOL)_eventWillEndBeforeUserArrivesForHypothesis:(id)a3 eventEndDate:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(a3, "aggressiveTravelTime");
  v8 = v7;
  -[CALNDefaultTriggeredEventNotificationTriggerHelper dateProvider](self, "dateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v11, "CalIsAfterDate:", v6);
  return (char)v9;
}

- (BOOL)_exceededMaximumTravelTimeThresholdForHypothesis:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a3, "conservativeTravelTime");
  v5 = v4;
  -[CALNDefaultTriggeredEventNotificationTriggerHelper travelAdvisoryAuthority](self, "travelAdvisoryAuthority");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximumAllowableTravelTime");
  v8 = v7;

  return v5 > v8;
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

@end
