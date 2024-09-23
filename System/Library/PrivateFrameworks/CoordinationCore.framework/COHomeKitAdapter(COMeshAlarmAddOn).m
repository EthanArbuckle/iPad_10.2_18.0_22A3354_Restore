@implementation COHomeKitAdapter(COMeshAlarmAddOn)

- (void)addAlarm:()COMeshAlarmAddOn toAccessory:inHome:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8(&dword_215E92000, v2, v3, "Alarm add failed to find the accessory settings on %@!", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)updateAlarm:()COMeshAlarmAddOn onAccessory:inHome:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8(&dword_215E92000, v2, v3, "Alarm remove failed to find the accessory settings on %@!", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
