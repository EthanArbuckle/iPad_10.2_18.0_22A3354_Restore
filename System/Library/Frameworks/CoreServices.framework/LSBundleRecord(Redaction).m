@implementation LSBundleRecord(Redaction)

- (void)redact
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_182882000, v0, v1, "bundle record %@ is not eligible for redaction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)unredactWithError:()Redaction .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_182882000, a1, a3, "Current process may not map the database, so it may not unredact records.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

@end
