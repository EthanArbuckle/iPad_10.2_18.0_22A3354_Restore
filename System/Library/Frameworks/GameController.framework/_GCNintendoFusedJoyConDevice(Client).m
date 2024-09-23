@implementation _GCNintendoFusedJoyConDevice(Client)

- (void)_addClient:()Client .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_0_12(&dword_215181000, v0, v1, "Device %@ client added: %@");
}

- (void)_removeClient:()Client .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_0_12(&dword_215181000, v0, v1, "Device %@ client removed: %@");
}

@end
