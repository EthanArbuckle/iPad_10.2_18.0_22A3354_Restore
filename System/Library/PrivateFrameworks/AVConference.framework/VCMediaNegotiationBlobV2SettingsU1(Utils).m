@implementation VCMediaNegotiationBlobV2SettingsU1(Utils)

- (void)initWithU1Config:()Utils .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d U1 config is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithU1Config:()Utils .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to load encodeDecodeFeatures to U1 Settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)negotiationCipherSuiteFromMediaStreamCipherSuite:()Utils .cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "+[VCMediaNegotiationBlobV2SettingsU1(Utils) negotiationCipherSuiteFromMediaStreamCipherSuite:]";
  v6 = 1024;
  v7 = 139;
  v8 = 2048;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Passing unsupported mediaStreamCipherSuite=%ld for negotiation transform.", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
