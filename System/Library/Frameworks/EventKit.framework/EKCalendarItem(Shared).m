@implementation EKCalendarItem(Shared)

- (void)_structuredDataDictionaryFromData:()Shared local:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Failed to deserialize structured data. Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_dataFromStructuredDataDictionary:()Shared local:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Failed to serialize structured data dictionary: %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

@end
