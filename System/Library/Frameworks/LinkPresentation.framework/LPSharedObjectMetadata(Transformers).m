@implementation LPSharedObjectMetadata(Transformers)

- (void)_applicationFromURL:()Transformers .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A0C41000, log, OS_LOG_TYPE_ERROR, "LPSharedObjectMetadata: Failed to determine app link for URL (%@) with error (%@)", (uint8_t *)&v3, 0x16u);
}

@end
