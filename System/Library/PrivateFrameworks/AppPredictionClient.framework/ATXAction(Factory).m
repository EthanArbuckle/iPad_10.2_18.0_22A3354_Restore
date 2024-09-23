@implementation ATXAction(Factory)

+ (void)atx_startCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Return call action not created for unexpected media type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_startCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:mediaType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Return call action not created for unknown media type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_startVideoCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Failed to create video call intent for an unknown call service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_startVideoCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "Using call service as preferred call provider: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)atx_setAirplaneModeActionWithTitle:()Factory subtitle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "Airplane Mode: made intent: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)atx_startAudioCallActionWithTitle:()Factory subtitle:recipientName:recipientHandle:callService:contactIdentifier:eventIdentifier:heuristicName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Failed to create audio call intent for an unknown call service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_updateAlarmActionWithTitle:()Factory subtitle:alarmID:alarmTitle:heuristicName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Failed to create generic intent from MTUpdateAlarmIntent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_updateAlarmActionWithTitle:()Factory subtitle:alarmID:alarmTitle:heuristicName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Generic intent created from MTUpdateAlarmIntent is not an INIntent object.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_setAlarmActionWithTitle:()Factory subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "Failed to create generic intent from MTCreateAlarmIntent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_setAlarmActionWithTitle:()Factory subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "Generic intent created from MTCreateAlarmIntent is not an INIntent object.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "atx_showCheckInAction: Called with no teamId", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "atx_showCheckInAction: Called with no userActivityString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "atx_showCheckInAction: Called with no subtitle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_10(&dword_1A49EF000, v0, v1, "atx_showCheckInAction: Could not create NSUserActivity from string '%@'", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)atx_showCheckInActionWithTeamId:()Factory userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:.cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_10(&dword_1A49EF000, a2, v4, "atx_showCheckInAction: Could not find an installed app for activityType='%@' or a webpageURL to fall back to.", v5);

}

@end
