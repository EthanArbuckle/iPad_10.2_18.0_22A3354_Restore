@implementation DMFEmergencyModeLog

void __DMFEmergencyModeLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dmd", "EmergencyMode");
  v1 = (void *)DMFEmergencyModeLog_log;
  DMFEmergencyModeLog_log = (uint64_t)v0;

}

@end
