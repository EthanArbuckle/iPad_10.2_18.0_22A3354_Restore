@implementation _GCDefaultPhysicalDevice(BatteryClient)

- (void)updateBattery:()BatteryClient isCharging:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_14();
  OUTLINED_FUNCTION_0_16(&dword_215181000, v0, v1, "Failed to set game controller power source details: %{mach.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_15();
}

@end
