@implementation ASCloudDevice(CloudKitCodingSupport)

+ (void)cloudDeviceWithRecord:()CloudKitCodingSupport .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_21381F000, v1, v3, "Cloud device record missing build: %@", v4);

  OUTLINED_FUNCTION_11();
}

+ (void)cloudDeviceWithRecord:()CloudKitCodingSupport .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_21381F000, v1, v3, "Cloud device record missing OS version: %@", v4);

  OUTLINED_FUNCTION_11();
}

+ (void)cloudDeviceWithRecord:()CloudKitCodingSupport .cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "values");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_21381F000, v1, v3, "Cloud device record missing device type: %@", v4);

  OUTLINED_FUNCTION_11();
}

+ (void)cloudDeviceWithRecord:()CloudKitCodingSupport .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Cloud device record missing modification date", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
