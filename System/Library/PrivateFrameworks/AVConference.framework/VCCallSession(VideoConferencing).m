@implementation VCCallSession(VideoConferencing)

- (void)processBlackFrame:()VideoConferencing .cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to get image buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (float)onCaptureFrame:()VideoConferencing audioTS:audioHT:videoHT:cameraBits:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  float v3;
  int v4;
  float result;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  double v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(double *)(a2 + 24);
  v4 = *(_DWORD *)(a2 + 48);
  v6 = 136316162;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCCallSession(VideoConferencing) onCaptureFrame:audioTS:audioHT:videoHT:cameraBits:]";
  v10 = 1024;
  v11 = 110;
  v12 = 2048;
  v13 = v3;
  v14 = 1024;
  v15 = v4;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d AFRC Statistics packetLossPercentage=%3.3f burstPacketLoss=%d", (uint8_t *)&v6, 0x2Cu);
  return result;
}

- (void)initializeDisplayLinkWithError:()VideoConferencing .cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create VCDisplayLink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeDisplayLinkWithError:()VideoConferencing .cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to activate VCDisplayLink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateSourcePlayoutTime:()VideoConferencing .cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Provided playout time is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
