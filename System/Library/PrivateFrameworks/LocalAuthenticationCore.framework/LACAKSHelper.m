@implementation LACAKSHelper

+ (BOOL)isOnenessAssertionActive
{
  int extended_device_state;
  int v3;
  NSObject *v4;

  extended_device_state = aks_get_extended_device_state();
  if (!extended_device_state)
    return 0;
  v3 = extended_device_state;
  LACLogABM();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[LACAKSHelper isOnenessAssertionActive].cold.1(v3, v4);

  return 0;
}

+ (void)isOnenessAssertionActive
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "AKS get device state returned non-zero result: %d", (uint8_t *)v2, 8u);
}

@end
