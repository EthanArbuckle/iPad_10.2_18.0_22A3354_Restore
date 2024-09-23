@implementation LogsContainerLocation

void __LogsContainerLocation_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 1, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)LogsContainerLocation_sLogsContainerLocation;
    LogsContainerLocation_sLogsContainerLocation = v2;

    free(v1);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = 1;
      _os_log_impl(&dword_1AA8D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error getting system group container: %llu", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/Logs/CrashReporter"), 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)LogsContainerLocation_sLogsContainerLocation;
    LogsContainerLocation_sLogsContainerLocation = v4;

  }
}

@end
