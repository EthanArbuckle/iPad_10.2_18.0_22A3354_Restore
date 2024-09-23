@implementation HKMCSettingsManager(Support)

- (void)setProjectionAttributesOnWatchFromUseHeartRateInput:()Support useWristTemperatureInput:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_fault_impl(&dword_218A9C000, v1, OS_LOG_TYPE_FAULT, "[%{public}@] setProjectionAttributesOnWatchFromUseHeartRateInput should only be called on the watch", (uint8_t *)&v3, 0xCu);

}

@end
