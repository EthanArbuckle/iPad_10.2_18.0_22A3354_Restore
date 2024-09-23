@implementation AACertificatePinner(NSURLUtilities)

- (void)connection:()NSURLUtilities willSendRequestForAuthenticationChallenge:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "No certificate to validate, bailing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)connection:()NSURLUtilities willSendRequestForAuthenticationChallenge:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Failed to validate certificate, bailing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
