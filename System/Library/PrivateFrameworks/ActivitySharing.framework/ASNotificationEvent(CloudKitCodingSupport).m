@implementation ASNotificationEvent(CloudKitCodingSupport)

+ (void)notificationEventWithRecord:()CloudKitCodingSupport friendUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21381F000, v0, v1, "Notification Event does not have any encrypted data, not decoding.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

+ (void)notificationEventWithRecord:()CloudKitCodingSupport friendUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21381F000, v0, v1, "Notification Event record schema version (%ld) is not current schema version (%ld), ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
