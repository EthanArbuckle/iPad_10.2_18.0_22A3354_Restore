@implementation CFURLCacheCopyResponseForRequest

intptr_t ____CFURLCacheCopyResponseForRequest_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v3;

  if (cf)
    v3 = CFRetain(cf);
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
