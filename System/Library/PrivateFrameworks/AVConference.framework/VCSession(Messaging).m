@implementation VCSession(Messaging)

- (void)processSymptomFromMessage:()Messaging participantID:isLocalInitiated:isLocalSideOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d groupID is nil, return", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleDeviceStateMessage:()Messaging forParticipantId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d deviceStateMessage is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleDeviceStateMessage:()Messaging forParticipantId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleNetworkCapabilityMessage:()Messaging forParticipantId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d rateControlConfigMessage is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleNetworkCapabilityMessage:()Messaging forParticipantId:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)remoteCellTechStateUpdate:()Messaging maxRemoteBitrate:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCSession(Messaging) remoteCellTechStateUpdate:maxRemoteBitrate:]";
  v6 = 1024;
  v7 = 553;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected remoteCellTech=%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)processMediaStateMessage:()Messaging remoteParticipantID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d mediaStateMessage is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processMediaStateMessage:()Messaging remoteParticipantID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
