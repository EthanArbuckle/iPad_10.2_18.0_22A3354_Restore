@implementation BRCApplyScheduler(LegacyAdditions)

- (void)startWriteCoordinationInAppLibrary:()LegacyAdditions .cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_7_3(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v4, "[DEBUG] Apply Changes: reached maximum allowed number of coordinations (%ld)%@", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)endWriteCoordinationInAppLibrary:()LegacyAdditions rowID:.cold.1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_7_3(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v4, "[DEBUG] Apply Changes: below half maximum allowed number of coordinations (%ld)%@", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)endWriteCoordinationInAppLibrary:()LegacyAdditions rowID:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1CBD43000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no writer for zone %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)endWriteCoordinationInAppLibrary:()LegacyAdditions rowID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes[%lld]: Skipping rescheduling because throttle was not suspended for coordination%@");
  OUTLINED_FUNCTION_2();
}

- (void)endWriteCoordinationInAppLibrary:()LegacyAdditions rowID:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Apply Changes[%lld]: Rescheduling because coordination completed%@");
  OUTLINED_FUNCTION_2();
}

- (void)monitorFaultingForZone:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Monitoring faulting for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)stopMonitoringFaultingForZone:()LegacyAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] Stop monitoring faulting for %@%@");
  OUTLINED_FUNCTION_2();
}

@end
