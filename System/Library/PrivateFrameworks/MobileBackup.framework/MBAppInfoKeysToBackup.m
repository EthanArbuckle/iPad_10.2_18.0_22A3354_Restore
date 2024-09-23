@implementation MBAppInfoKeysToBackup

void __MBAppInfoKeysToBackup_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C9AE78], CFSTR("ContainerContentClass"), *MEMORY[0x1E0C9AE90], CFSTR("Path"), CFSTR("SafeHarborDockingDate"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MBAppInfoKeysToBackup_sSet;
  MBAppInfoKeysToBackup_sSet = v0;

}

@end
