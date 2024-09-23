@implementation BMDaemon(LaunchDonations)

+ (void)_donateDeviceMetadataWithBootDate:()LaunchDonations .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_18D810000, a2, a3, "Unhandled platform %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:()LaunchDonations queue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "The previously found completed boot session is the same as the current boot session in biome daemon launch donation. This should not be possible.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:()LaunchDonations queue:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_18D810000, a2, a3, "The last stored boot session occurred after the current boot session's start date in biome daemon launch donation. This should not be possible. Current boot session date: %@, previously stored device boot session date %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:()LaunchDonations queue:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "Failure to create OSLogEventSource on biome daemon launch donation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:()LaunchDonations queue:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "Failed to read from Device.BootSession stream biome daemon during launch donation. Error: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
