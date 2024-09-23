@implementation ZL15lockdownLibraryv

void *___ZL15lockdownLibraryv_block_invoke()
{
  void *result;

  result = dlopen("/usr/lib//liblockdown.dylib", 2);
  lockdownLibrary(void)::sLib = (uint64_t)result;
  return result;
}

@end
