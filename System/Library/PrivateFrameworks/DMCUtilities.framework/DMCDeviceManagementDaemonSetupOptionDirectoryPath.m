@implementation DMCDeviceManagementDaemonSetupOptionDirectoryPath

void __DMCDeviceManagementDaemonSetupOptionDirectoryPath_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(CFSTR("/private/var/mobile/Library/Application Support/com.apple.dmd-setup-option"), "copy");
  v1 = (void *)DMCDeviceManagementDaemonSetupOptionDirectoryPath_str;
  DMCDeviceManagementDaemonSetupOptionDirectoryPath_str = v0;

}

@end
