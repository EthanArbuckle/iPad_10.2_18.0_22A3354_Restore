@implementation UTTypeRecord(IconServices)

- (void)iconResourceBundleURLWithContext:()IconServices tableID:unitID:unitBytes:.cold.1(uint64_t a1, unsigned int *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Cannot generate libraryURL for app %@ because it has no libraryPath path stored (%llx)", (uint8_t *)&v4, 0x16u);
}

@end
