@implementation _GCGenericDeviceDB(XPC)

- (void)preparedModelForDevice:()XPC reply:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1DC79E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

@end
