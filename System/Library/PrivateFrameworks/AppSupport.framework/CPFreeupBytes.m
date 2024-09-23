@implementation CPFreeupBytes

uint64_t ___CPFreeupBytes_block_invoke()
{
  void *v0;

  v0 = dlopen("/System/Library/PrivateFrameworks/CacheDelete.framework/CacheDelete", 1);
  _CPFreeupBytes__CacheDeletePurgeSpaceWithInfo = (uint64_t (*)(_QWORD, _QWORD))dlsym(v0, "CacheDeletePurgeSpaceWithInfo");
  return dlclose(v0);
}

intptr_t ___CPFreeupBytes_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
