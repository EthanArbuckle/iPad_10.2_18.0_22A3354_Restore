@implementation VCAudioStream(Telephony)

- (void)setJitterBufferMode:()Telephony .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Audio receiver is not initialized", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)handleCodecModeChangeEvent:()Telephony .cold.1(uint64_t a1, int *a2, NSObject *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136316162;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCAudioStream(Telephony) handleCodecModeChangeEvent:]";
  v8 = 1024;
  v9 = 139;
  v10 = 1024;
  v11 = v3;
  v12 = 2048;
  v13 = 0;
  OUTLINED_FUNCTION_15_5(&dword_1D8A54000, a3, (uint64_t)a3, " [%s] %s:%d codecType is invalid for payload=%d, codecType=%ld", (uint8_t *)&v4);
}

- (void)getCodecModeChangeEvent:()Telephony forCodecBitrate:payload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d codecModeChangeEvent is invalid", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)handleBasebandRateTrendSuggestion:()Telephony .cold.1()
{
  NSObject *v0;
  id *v1;
  uint64_t v2;
  uint8_t v3[56];

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_2_7(v1, *MEMORY[0x1E0C80C00]), "payload");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_15();
  OUTLINED_FUNCTION_15_5(&dword_1D8A54000, v0, v2, " [%s] %s:%d codecType is invalid for payload=%d, codecType=%ld", v3);
  OUTLINED_FUNCTION_11_11();
}

- (void)handleANBR:()Telephony forDirection:.cold.1()
{
  NSObject *v0;
  id *v1;
  uint64_t v2;
  uint8_t v3[56];

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_2_7(v1, *MEMORY[0x1E0C80C00]), "payload");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_15();
  OUTLINED_FUNCTION_15_5(&dword_1D8A54000, v0, v2, " [%s] %s:%d codecType is invalid for payload=%d, codecType=%ld", v3);
  OUTLINED_FUNCTION_11_11();
}

- (void)handleANBR:()Telephony forDirection:.cold.2()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_2_7(v0, *MEMORY[0x1E0C80C00]), "payload");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14_10();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v1, v2, " [%s] %s:%d codecRateMode is invalid for payload=%d, codecRateMode=%u", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)handleANBR:()Telephony forDirection:.cold.3()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_2_7(v0, *MEMORY[0x1E0C80C00]), "payload");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14_10();
  OUTLINED_FUNCTION_4_2(&dword_1D8A54000, v1, v2, " [%s] %s:%d codecBitrate is invalid for payload=%d, codecBitrate=%u", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)rateAdaptation:()Telephony targetBitrateDidChange:rateChangeCounter:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Target bitrate change not supported targetBitrate=%d", v2, v3, v4, 356);
  OUTLINED_FUNCTION_3();
}

- (void)rateAdaptation:()Telephony targetBitrateDidChange:rateChangeCounter:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Bitrate adaptation not supported payload=%d", v2, v3, v4, 355);
  OUTLINED_FUNCTION_3();
}

@end
