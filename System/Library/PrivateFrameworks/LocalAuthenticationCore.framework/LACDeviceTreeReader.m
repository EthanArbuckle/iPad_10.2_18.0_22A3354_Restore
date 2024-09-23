@implementation LACDeviceTreeReader

+ (id)getDataFromPath:(const char *)a3 propertyName:(__CFString *)a4
{
  io_registry_entry_t v5;
  io_object_t v6;
  CFTypeRef CFProperty;
  void *v8;
  CFTypeID v9;

  v5 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], a3);
  if (!v5)
    goto LABEL_6;
  v6 = v5;
  CFProperty = IORegistryEntryCreateCFProperty(v5, a4, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
LABEL_5:
    IOObjectRelease(v6);
LABEL_6:
    v8 = 0;
    return v8;
  }
  v8 = (void *)CFProperty;
  v9 = CFGetTypeID(CFProperty);
  if (v9 != CFDataGetTypeID())
  {
    CFRelease(v8);
    goto LABEL_5;
  }
  return v8;
}

@end
