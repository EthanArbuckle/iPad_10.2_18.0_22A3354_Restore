@implementation MPSectionIdentifierListExclusivityDisabledPThreadKey

uint64_t ___MPSectionIdentifierListExclusivityDisabledPThreadKey_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&_MPSectionIdentifierListExclusivityDisabledPThreadKey_sThreadKey, 0);
}

@end
