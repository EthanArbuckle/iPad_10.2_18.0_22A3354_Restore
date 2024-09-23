@implementation MSDKManagedDevice(SetLastShallowRefreshTime)

- (void)setLastShallowRefreshTime:()SetLastShallowRefreshTime .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[MSDKManagedDevice(SetLastShallowRefreshTime) setLastShallowRefreshTime:]";
  _os_log_error_impl(&dword_213A7E000, log, OS_LOG_TYPE_ERROR, "%s - Failed to setup XPC connection.", (uint8_t *)&v1, 0xCu);
}

@end
