@implementation VCMediaNegotiationBlobV2VideoPayload(Utils)

- (void)initWithPayload:()Utils encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unknown video payload (%d)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initWithPayload:()Utils encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to encode the decode rules for payload (%d)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)initWithPayload:()Utils encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to encode the encode rules for payload (%d)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]";
  v6 = 1024;
  v7 = 79;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate video rules", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "videoPayload");
  v6 = 136315906;
  v7 = a1;
  v8 = 2080;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_11();
  v9 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unknown video payload (%d)", (uint8_t *)&v6, 0x22u);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_13();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_13();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_13();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_13();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_13();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_13();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.21()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.22()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.23()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.25()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.26()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.27()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.29()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)videoRulesWithBitmap:()Utils preferredBitmap:.cold.31()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video rule for %dx%d %dfps", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

- (void)setupEncode:()Utils videoRules:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a2, "iWidth");
  v7 = objc_msgSend(a2, "iHeight");
  objc_msgSend(a2, "fRate");
  v10 = 136316418;
  v11 = a1;
  v12 = 2080;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_11();
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v16 = 2048;
  v17 = v9;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to add video format to negotiation blob: %dx%d %f", (uint8_t *)&v10, 0x32u);
}

@end
