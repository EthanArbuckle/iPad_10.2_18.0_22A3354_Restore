@implementation _UNMutableNotificationCommunicationContext(UserNotifications_INIntent)

+ (void)mutableContextFromINIntent:()UserNotifications_INIntent .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "%{public}@ Error getting proxied image synchronously for content url '%{public}@'. proxied image is nil");
}

+ (void)mutableContextFromINIntent:()UserNotifications_INIntent .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "%{public}@ Timed out getting data at content url: '%{public}@'");
}

@end
