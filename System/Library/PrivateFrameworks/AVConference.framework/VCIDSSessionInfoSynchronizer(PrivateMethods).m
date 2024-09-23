@implementation VCIDSSessionInfoSynchronizer(PrivateMethods)

- (void)checkVCIDSSessionInfoNeedUpdate:()PrivateMethods .cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 264;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d primary connection is nil", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)updateVCIDSSessionInfoResponse:()PrivateMethods .cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No IDSSessionInfoResponse in the eventInfo!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)optInStreamIDsForConnection:()PrivateMethods .cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Primary connection is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)optOutStreamIDsForNonPrimaryConnection:()PrivateMethods sentOnConnection:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Connection is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
