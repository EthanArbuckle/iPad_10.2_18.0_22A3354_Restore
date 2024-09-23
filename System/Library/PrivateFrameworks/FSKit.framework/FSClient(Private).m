@implementation FSClient(Private)

- (void)validateVolumeName:()Private usingBundle:volumeID:replyHandler:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_23B2A6000, v0, OS_LOG_TYPE_ERROR, "%s:%@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)validateVolumeName:()Private usingBundle:volumeID:replyHandler:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_23B2A6000, v0, OS_LOG_TYPE_DEBUG, "%s: Unknown bundle (%@)", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
