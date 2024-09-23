@implementation VCMediaNegotiationBlobV2BandwidthSettings(Utils)

- (BOOL)isEqual:()Utils
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;

  if (!a3)
    return 0;
  v5 = objc_msgSend(a3, "cap2G");
  if (v5 != -[VCMediaNegotiationBlobV2BandwidthSettings cap2G](self, "cap2G"))
    return 0;
  v6 = objc_msgSend(a3, "cap3G");
  if (v6 != -[VCMediaNegotiationBlobV2BandwidthSettings cap3G](self, "cap3G"))
    return 0;
  v7 = objc_msgSend(a3, "capLTE");
  if (v7 != -[VCMediaNegotiationBlobV2BandwidthSettings capLTE](self, "capLTE"))
    return 0;
  v8 = objc_msgSend(a3, "cap5G");
  if (v8 != -[VCMediaNegotiationBlobV2BandwidthSettings cap5G](self, "cap5G"))
    return 0;
  v9 = objc_msgSend(a3, "capWifi");
  return v9 == -[VCMediaNegotiationBlobV2BandwidthSettings capWifi](self, "capWifi");
}

- (void)initWithBandwidthConfigurations:()Utils .cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Nil bandwidth configurations!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithBandwidthConfigurations:()Utils .cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Nil filtered bandwidth configurations!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithBandwidthConfigurations:()Utils .cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize bandwidth configurations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)bandwidthConfigurations
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the bandwidth configuration for Wifi", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
