@implementation CFHTTPServerConnectionSetDispatchQueue

void ___CFHTTPServerConnectionSetDispatchQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  CoreSchedulingSet *v3;
  uint64_t v4;
  const void *v5;

  v3 = *(CoreSchedulingSet **)(a1 + 32);
  v4 = a2 + 8;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 88));
  HTTPServerBase::schedule(v4, v3);
  v5 = *(const void **)(a1 + 32);
  if (v5)
    CFRelease(v5);
}

@end
