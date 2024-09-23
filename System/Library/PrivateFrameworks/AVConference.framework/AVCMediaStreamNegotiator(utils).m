@implementation AVCMediaStreamNegotiator(utils)

+ (void)clientAccessNetworkType:()utils .cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "+[AVCMediaStreamNegotiator(utils) clientAccessNetworkType:]";
  v4 = 1024;
  v5 = 89;
  v6 = 1024;
  v7 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid connection type=%d", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

@end
