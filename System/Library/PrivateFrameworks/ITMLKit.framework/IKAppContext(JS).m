@implementation IKAppContext(JS)

- (void)launchAppWithOptions:()JS .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_DEBUG, "Starting context with options: %@", (uint8_t *)&v2, 0xCu);
}

@end
