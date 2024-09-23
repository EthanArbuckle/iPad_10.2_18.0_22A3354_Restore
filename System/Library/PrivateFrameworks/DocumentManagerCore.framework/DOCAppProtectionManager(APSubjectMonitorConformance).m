@implementation DOCAppProtectionManager(APSubjectMonitorConformance)

- (void)appProtectionSubjectsChanged:()APSubjectMonitorConformance forSubscription:.cold.1()
{
  NSObject *v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2090A2000, v0, (uint64_t)v0, "[PROTECTED APPS] %s subjects: %@ app monitor subscription: %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_10();
}

@end
