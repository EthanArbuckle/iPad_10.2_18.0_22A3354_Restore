@implementation NSFileProviderExtension(CreateItem)

- (void)_fp_itemsMightBeTheSame:()CreateItem otherItem:url:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] item type mismatch, cannot be the same items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)_fp_itemsMightBeTheSame:()CreateItem otherItem:url:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] document size mismatch, cannot be the same items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)_fp_itemsMightBeTheSame:()CreateItem otherItem:url:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] package content mismatch, cannot be the same items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

- (void)_fp_itemsMightBeTheSame:()CreateItem otherItem:url:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] mtime mismatch, cannot be the same items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

@end
