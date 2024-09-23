@implementation C3DCFTypeGetAddressForKey

uint64_t __C3DCFTypeGetAddressForKey_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&C3DCFTypeGetAddressForKey_addressForKeyLocalStorage, (void (__cdecl *)(void *))__threadDied);
}

@end
