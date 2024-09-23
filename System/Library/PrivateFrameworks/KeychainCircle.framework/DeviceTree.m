@implementation DeviceTree

void __DeviceTree_SupportsEnhancedApfs_block_invoke()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/filesystems");
  if (v0)
  {
    v1 = v0;
    CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("e-apfs"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      DeviceTree_SupportsEnhancedApfs_supported = 1;
    }
    IOObjectRelease(v1);
  }
  v3 = secLogObjForScope("eapfs");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = DeviceTree_SupportsEnhancedApfs_supported;
    _os_log_impl(&dword_20D7B6000, v3, OS_LOG_TYPE_DEFAULT, "eapfs IODT set to %{BOOL}d", (uint8_t *)v4, 8u);
  }
}

@end
