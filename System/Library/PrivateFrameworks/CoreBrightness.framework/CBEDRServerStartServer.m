@implementation CBEDRServerStartServer

void __CBEDRServerStartServer_block_invoke()
{
  NSObject *oslog;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (edrServiceStartFunction)
  {
    v1 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v3, (uint64_t)"CBEDRServerStartServer_block_invoke");
      _os_log_impl(&dword_1B5291000, v1, OS_LOG_TYPE_INFO, "%s: EDR service kick off", v3, 0xCu);
    }
    edrServiceStartFunction();
  }
  else
  {
    oslog = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v2, (uint64_t)"CBEDRServerStartServer_block_invoke");
      _os_log_error_impl(&dword_1B5291000, oslog, OS_LOG_TYPE_ERROR, "%s: missing edrServiceStartFunction", v2, 0xCu);
    }
  }
}

@end
