@implementation IOPSCopyExternalPowerAdapterDetails

void __IOPSCopyExternalPowerAdapterDetails_block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __IOPSCopyExternalPowerAdapterDetails_block_invoke_cold_1(a2);
}

void __IOPSCopyExternalPowerAdapterDetails_block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_18AAAF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Event handler is called %@\n", (uint8_t *)&v1, 0xCu);
}

@end
