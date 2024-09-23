@implementation FSModuleHost(Project)

- (void)loadModulesFromEKit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_23B2A6000, v0, v1, "ExtensionKit unable to give module query.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)loadProbeOrderList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, v0, v1, "Error reading probe order: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveProbeOrderList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, v0, v1, "Error writing probe order to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loadEnabledList
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, v0, v1, "Error reading enabled list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveEnabledList
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_23B2A6000, v1, OS_LOG_TYPE_ERROR, "Error writing enabled modules to %@, error %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
