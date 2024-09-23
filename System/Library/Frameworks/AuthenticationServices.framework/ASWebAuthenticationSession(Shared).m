@implementation ASWebAuthenticationSession(Shared)

- (void)_validateAdditionalHeaderFieldsDryRun:()Shared .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20E4D9000, a2, OS_LOG_TYPE_ERROR, "Cannot start ASWebAuthenticationSession: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
