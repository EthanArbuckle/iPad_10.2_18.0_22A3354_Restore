@implementation MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey

uint64_t ___MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sThreadKey, 0);
}

@end
