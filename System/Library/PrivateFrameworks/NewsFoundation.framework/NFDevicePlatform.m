@implementation NFDevicePlatform

void __NFDevicePlatform_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  size_t size;

  size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v0 = malloc_type_malloc(size, 0x789F8471uLL);
  sysctlbyname("hw.machine", v0, &size, 0, 0);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v0);
  v2 = (void *)NFDevicePlatform_s_platformString;
  NFDevicePlatform_s_platformString = v1;

  free(v0);
}

@end
