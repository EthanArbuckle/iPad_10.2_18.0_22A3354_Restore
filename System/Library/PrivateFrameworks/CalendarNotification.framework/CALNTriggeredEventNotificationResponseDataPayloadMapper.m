@implementation CALNTriggeredEventNotificationResponseDataPayloadMapper

+ (id)payloadForNotificationResponseData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setHypothesisDataFromNotificationData:inPayload:", v5, v6);
  objc_msgSend(a1, "_setLastFireTimeOfAlertOffsetFromTravelTimeFromNotificationData:inPayload:", v5, v6);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

+ (id)notificationResponseDataForPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CALNTriggeredEventNotificationResponseData *v7;

  v4 = a3;
  objc_msgSend(a1, "_hypothesisFromPayload:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_lastFireTimeOfAlertOffsetFromTravelTimeFromPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CALNTriggeredEventNotificationResponseData initWithHypothesis:lastFireTimeOfAlertOffsetFromTravelTime:]([CALNTriggeredEventNotificationResponseData alloc], "initWithHypothesis:lastFireTimeOfAlertOffsetFromTravelTime:", v5, v6);
  return v7;
}

+ (id)_hypothesisFromPayload:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("com.apple.calendar.notifications.CALNTriggeredEventNotificationResponseDataHypothesisDataPayloadKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CALNTriggeredEventNotificationResponseDataPayloadMapper _hypothesisFromPayload:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)_setHypothesisDataFromNotificationData:(id)a3 inPayload:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a1, "_hypothesisDataForNotificationData:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("com.apple.calendar.notifications.CALNTriggeredEventNotificationResponseDataHypothesisDataPayloadKey"));

}

+ (id)_hypothesisDataForNotificationData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  objc_msgSend(a3, "hypothesis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CALNTriggeredEventNotificationResponseDataPayloadMapper _hypothesisDataForNotificationData:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_lastFireTimeOfAlertOffsetFromTravelTimeFromPayload:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("com.apple.calendar.notifications.CALNTriggeredEventNotificationResponseDataLastFireTimeOfAlertOffsetFromTravelTimePayloadKey"));
}

+ (void)_setLastFireTimeOfAlertOffsetFromTravelTimeFromNotificationData:(id)a3 inPayload:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(a3, "lastFireTimeOfAlertOffsetFromTravelTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("com.apple.calendar.notifications.CALNTriggeredEventNotificationResponseDataLastFireTimeOfAlertOffsetFromTravelTimePayloadKey"));

}

+ (void)_hypothesisFromPayload:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Could not unarchive hypothesis. error = %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)_hypothesisDataForNotificationData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_215D9B000, a2, a3, "Could not archive hypothesis. error = %{public}@", a5, a6, a7, a8, 2u);
}

@end
