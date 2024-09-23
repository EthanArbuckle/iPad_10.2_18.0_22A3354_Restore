@implementation SecSharedDataVolumeBootArgSet

void __SecSharedDataVolumeBootArgSet_block_invoke()
{
  NSObject *v0;
  size_t __len;
  uint8_t buf[4];
  int v3;
  char __big[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  __len = 1023;
  bzero(__big, 0x400uLL);
  if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len))
    SecSharedDataVolumeBootArgSet_boot_arg_set = 1;
  v0 = secLogObjForScope("eapfs");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v3 = SecSharedDataVolumeBootArgSet_boot_arg_set;
    _os_log_impl(&dword_20D7B6000, v0, OS_LOG_TYPE_DEFAULT, "eapfs boot-arg set to %{BOOL}d", buf, 8u);
  }
}

@end
