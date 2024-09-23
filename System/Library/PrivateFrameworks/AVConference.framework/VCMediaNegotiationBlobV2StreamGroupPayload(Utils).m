@implementation VCMediaNegotiationBlobV2StreamGroupPayload(Utils)

- (void)initWithPayloadConfig:()Utils rtpSampleRate:.cold.1()
{
  NSObject *v0;
  void *v1;
  __int16 v2;
  int v3;
  uint64_t v4;
  uint8_t v5[24];
  int v6;
  __int16 v7;
  int v8;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_13_8(v1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  v6 = 620;
  v7 = v2;
  v8 = v3;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v4, " [%s] %s:%d Failed to encode the codec=%d", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithPayloadConfig:()Utils rtpSampleRate:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[40];

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_13(v1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v2, " [%s] %s:%d Failed to encode the cipherSuite=%d", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithPayloadConfig:()Utils rtpSampleRate:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[40];

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_14_12(v1, *MEMORY[0x1E0C80C00]), "H264PacketizationMode");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v2, " [%s] %s:%d Unsupported H264PacketizationMode=%d", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[40];

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_14_12(v1, *MEMORY[0x1E0C80C00]), "H264LevelAsymmetryAllowed");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v2, " [%s] %s:%d Unsupported H264LevelAsymmetryAllowed=%d", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.4()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[40];

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_13(v1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v2, " [%s] %s:%d Unsupported cipher suite (%u)", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithPayloadConfig:()Utils index:rtpSampleRate:streamGroupID:.cold.5()
{
  NSObject *v0;
  void *v1;
  __int16 v2;
  int v3;
  uint64_t v4;
  uint8_t v5[24];
  int v6;
  __int16 v7;
  int v8;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_13_8(v1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  v6 = 695;
  v7 = v2;
  v8 = v3;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v4, " [%s] %s:%d Failed to encode the codec=%d", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d codecType=%u is too large for packed format", v1);
  OUTLINED_FUNCTION_3();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[40];

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_14_12(v1, *MEMORY[0x1E0C80C00]), "rtpPayload");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v2, " [%s] %s:%d rtpPayload=%u is too large for packed format", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.3()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d rtcpFlags=%u is too large for packed format", v1);
  OUTLINED_FUNCTION_3();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.4()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d rtpSampleRate=%u is too large for packed format", v1);
  OUTLINED_FUNCTION_3();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.5()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Unknown rtpSampleRate=%u", v1);
  OUTLINED_FUNCTION_3();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.6()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d negotiationCipherSuite=%u is too large for packed format", v1);
  OUTLINED_FUNCTION_3();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.7()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d mediaFlags=%u is too large for packed format", v1);
  OUTLINED_FUNCTION_3();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate VCMediaNegotiationBlobV2StreamGroupPayload (extension)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newCompactPayloadWithPayloadConfig:()Utils rtpSampleRate:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14_2();
  objc_msgSend((id)OUTLINED_FUNCTION_14_12(v1, *MEMORY[0x1E0C80C00]), "pTime");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  v4 = 777;
  v5 = 2048;
  v6 = v2;
  _os_log_error_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d pTime=%lu is too large for packed format or is not", v3, 0x26u);
  OUTLINED_FUNCTION_3_0();
}

@end
