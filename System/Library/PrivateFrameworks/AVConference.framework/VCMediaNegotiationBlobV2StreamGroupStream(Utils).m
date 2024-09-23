@implementation VCMediaNegotiationBlobV2StreamGroupStream(Utils)

- (unsigned)payloadsVersion
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_payloadsVersion;
  else
    return 1;
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the coordinateSystem field!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the default payload field!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the payload field!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the default payload field!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:defaultConfig:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the payload specs field!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream config is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Default stream config doesn't exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the coordinateSystem field!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the payloads field!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamConfig:()Utils payloadConfigs:streamGroupID:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate the payload specs field!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.1(uint64_t a1, int a2, NSObject *a3)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  FourccToCStr(a2);
  OUTLINED_FUNCTION_12_0();
  v8 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:]";
  v9 = 1024;
  v10 = 482;
  v11 = v4;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d Missing quality index and stream type. streamGroupID=%s", v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSam"
                      "pleRates:streamGroupID:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unsupported metadata flag (0x%x)", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload specs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload config Sample Rates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload specs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)streamConfigWithPayloadConfigs:()Utils payloadConfigSampleRates:streamGroupID:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid input parameter (payloadConfigs and payloadConfigSampleRates have different sizes)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)payloadsWithStreamConfig:()Utils payloadBitmap:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload bitmap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)payloadsWithStreamConfig:()Utils payloadBitmap:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithStreamConfig:payloadBitmap:]";
  OUTLINED_FUNCTION_4();
  v4 = 921;
  v5 = 2112;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d Unable to encode payload=%@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)payloadsWithPayloadBit:()Utils .cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithPayloadBit:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid payload: 0x%x", v2, *(const char **)v3, (unint64_t)"+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithPayloadBit:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)updatePayloadSpecsForConfig:()Utils defaultConfig:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  int v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  int v9;
  __int16 v10;
  int v11;

  OUTLINED_FUNCTION_11_5(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v8 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:]";
  OUTLINED_FUNCTION_4();
  v9 = 1053;
  v10 = v4;
  v11 = v5;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a3, v6, " [%s] %s:%d Unrecognized payload (0x%x)!", v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)updatePayloadSpecsForConfig:()Utils defaultConfig:payloadConfigs:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v4;
  int v5;
  uint64_t v6;
  uint8_t v7[14];
  const char *v8;
  int v9;
  __int16 v10;
  int v11;

  OUTLINED_FUNCTION_11_5(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v8 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]";
  OUTLINED_FUNCTION_4();
  v9 = 1080;
  v10 = v4;
  v11 = v5;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a3, v6, " [%s] %s:%d Unrecognized payload specs (0x%x)!", v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)updatePayloadSpecsForConfig:()Utils defaultConfig:payloadConfigs:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid codec index (%d)!", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)updatePayloadSpecsForConfig:()Utils defaultConfig:payloadConfigs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid codec index (%d)!", v2, *(const char **)v3, (unint64_t)"-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
